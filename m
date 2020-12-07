Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C04F32D0DD3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 11:13:18 +0100 (CET)
Received: from localhost ([::1]:57672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmDW9-0004IP-Rb
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 05:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephane.duverger@free.fr>)
 id 1kmDTg-0003Pv-Sm
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:10:44 -0500
Received: from smtp5-g21.free.fr ([2a01:e0c:1:1599::14]:16024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephane.duverger@free.fr>)
 id 1kmDTe-000748-Pv
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:10:44 -0500
Received: from wise (unknown [77.159.208.71])
 (Authenticated sender: stephane.duverger@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AE73B5FFD8;
 Mon,  7 Dec 2020 11:10:32 +0100 (CET)
Date: Mon, 7 Dec 2020 11:10:29 +0100
From: Stephane Duverger <stephane.duverger@free.fr>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: x86 TCG helpers clobbered registers
Message-ID: <20201207101029.GA96540@wise>
References: <20201204153446.GA66154@wise>
 <1d246e29-b364-099f-440c-5b644087b55f@linaro.org>
 <20201205013402.GA69224@wise>
 <5718f49e-8e17-17ae-45ec-94347f0a009d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5718f49e-8e17-17ae-45ec-94347f0a009d@linaro.org>
Received-SPF: none client-ip=2a01:e0c:1:1599::14;
 envelope-from=stephane.duverger@free.fr; helo=smtp5-g21.free.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Dec 05, 2020 at 06:38:25AM -0600, Richard Henderson wrote:
> The difference is that the slow path is aware that there are input registers
> that are live, containing data (addrlo, addrhi, datalo, datahi), which must be
> stored into the arguments for the slow path call.  Those input registers (and
> all other call-clobbered registers) are dead *after* the slow path call.
> 
> You are injecting your filter call while those input registers are still live.
> They will be next used by the fast-path store.
> 
> That is a very significant difference.

Ok. That's why I saved REG_L1 (prepared by tlb_load) for both
st/ld_direct use, plus datalo for st_direct only. I saw datahi is only
used for MO_64 on 32bits tcg-target. And I better understand it thanks
to you.

This leads me to that simple reflection:

If we want to filter on every memory accesses, *out of the fast-path*,
the most natural place to do so would be in store_helper() and
load_helper() from accel/tcg/cputlb.c. By doing so, every target would
benefit from filtering, and even specific helpers using cpu_ldst
functions would be intercepted. No ?

For the remaining fast-path case, it could be interesting to generate
it this time at IR level (tlb_load, jne to slow_path, direct
load/store) ? Again every target would benefit from filtering without
the need for a specific fast-path implementation in
tcg/<arch>/tcg-target.c.inc

Wouldn't it be simplier than actual mem plugin implementation, which
generate fitler callback *after* load/store and has specific extra
work for tracking memory accesses performed from helpers (afaiu) ?

