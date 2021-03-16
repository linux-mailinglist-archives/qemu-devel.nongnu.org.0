Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50D233D9CE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:50:09 +0100 (CET)
Received: from localhost ([::1]:51442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCtU-0000oK-Nr
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@diablo.13thmonkey.org>)
 id 1lMCkn-0006cq-WF
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:41:10 -0400
Received: from 13thmonkey.org ([80.100.255.32]:58575
 helo=diablo.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@diablo.13thmonkey.org>) id 1lMCkm-0002m3-6K
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:41:09 -0400
Received: by diablo.13thmonkey.org (Postfix, from userid 103)
 id 49A3EC13ADD; Tue, 16 Mar 2021 17:41:04 +0100 (CET)
Date: Tue, 16 Mar 2021 17:41:04 +0100
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <YFDfoG8slLGuJKdM@diablo.13thmonkey.org>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
 <20210315185302.29b0d90d@redhat.com>
 <YE/fUQRiFBfrWi5W@dropje.13thmonkey.org>
 <20210316015503.GA1008366@private.email.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316015503.GA1008366@private.email.ne.jp>
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@diablo.13thmonkey.org; helo=diablo.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 06:55:03PM -0700, Isaku Yamahata wrote:
> I think tcg case can be explained by x86_machine_is_smm_enabled()
> 
>   bool x86_machine_is_smm_enabled(const X86MachineState *x86ms)
>   ...
>       if (tcg_enabled() || qtest_enabled()) {
>           smm_available = true;
>       } else if (kvm_enabled()) {
>           smm_available = kvm_has_smm();
>       }
>   ...
> 
> Although I don't know about nvmm case, this function also needs to be updated
> if smi isn't supported.

I can create a local patch to enable SMM here when NVMM is enabled if KVM, HAX
and HWPX work fine.

Shouldn't this check be rewritten? What about HWPX and the others? They will
always report smm_available=false here.

Reinoud


