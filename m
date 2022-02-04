Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDD24A9C56
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:55:02 +0100 (CET)
Received: from localhost ([::1]:50848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0vN-0006fJ-6h
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:55:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ldv@altlinux.org>)
 id 1nG0rY-0002dV-9n; Fri, 04 Feb 2022 10:51:04 -0500
Received: from vmicros1.altlinux.org ([194.107.17.57]:58292)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ldv@altlinux.org>)
 id 1nG0rV-0000GQ-Jh; Fri, 04 Feb 2022 10:51:03 -0500
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id BA92C72C905;
 Fri,  4 Feb 2022 18:50:59 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id A658E7CD200; Fri,  4 Feb 2022 18:50:59 +0300 (MSK)
Date: Fri, 4 Feb 2022 18:50:59 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Vitaly Chikunov <vt@altlinux.org>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v3] 9pfs: Fix segfault in do_readdir_many caused by
 struct dirent overread
Message-ID: <20220204155059.GA18407@altlinux.org>
References: <20220204050609.15510-1-vt@altlinux.org>
 <449c9c55-06e8-66ef-8755-3ab2e785851c@amsat.org>
 <28345882.VnrBaU8NEn@silver> <20220204161606.162d2c05@bahia>
 <20220204153207.k2t3dwq3pdzx7bk3@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220204153207.k2t3dwq3pdzx7bk3@altlinux.org>
Received-SPF: pass client-ip=194.107.17.57; envelope-from=ldv@altlinux.org;
 helo=vmicros1.altlinux.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-stable@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 04, 2022 at 06:32:07PM +0300, Vitaly Chikunov wrote:
[...]
> > struct dirent *
> > qemu_dirent_dup(struct dirent *dent)
> > {
> >     size_t sz = offsetof(struct dirent, d_name) + _D_EXACT_NAMLEN(dent) + 1;
> 
> But d_namlen is not populated by synth_direntry, so this will lead to
> a bug too. Idea is that qemu_dirent_dup handles real dirents and
> simulated (underpopulated) dirents.
> 
> Also Linux does not have d_namlen AFAIK, thus this code will not provide
> any speed up in most cases (and always fallback to strlen), unlike if we
> use d_reclen.
> 
> Also, I m not sure if _D_EXACT_NAMLEN is defined on all systems, so this
> needs ifdefs too.

Yes, _D_EXACT_NAMLEN() is a GNU extension, it was introduced in glibc
back in 1996 but some popular libcs available for Linux do not provide
this macro.


-- 
ldv

