Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB6E33D9B3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:43:07 +0100 (CET)
Received: from localhost ([::1]:44198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCmf-0005F8-6j
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@diablo.13thmonkey.org>)
 id 1lMCQR-00025m-T2
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:20:08 -0400
Received: from 13thmonkey.org ([80.100.255.32]:58592
 helo=diablo.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@diablo.13thmonkey.org>) id 1lMCQP-0002Q4-J0
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:20:07 -0400
Received: by diablo.13thmonkey.org (Postfix, from userid 103)
 id 98279C13ADD; Tue, 16 Mar 2021 17:20:01 +0100 (CET)
Date: Tue, 16 Mar 2021 17:20:01 +0100
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <YFDasSxhk0C8u6Rs@diablo.13thmonkey.org>
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
Cc: Igor Mammedov <imammedo@redhat.com>, Reinoud Zandijk <reinoud@NetBSD.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 06:55:03PM -0700, Isaku Yamahata wrote:
> > If I add in '-M pc-i440fx-5.2' it works again with the accelerator. If I add
> > in '-M q35' it does work fine with or without the accelerator.
> 
> Anyhow, can you please try "-global PIIX4_PM.smm-compat=on"
> (or "-global ICH9-LPC.smm-compat=on" if q35 is used) so that the old behavior
> is presented.

It works indeed with the default model when I specify the -global. With Q35
its not needed; it boots fine after reconfiguring itself.

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

The NVMM backend can only be used on x86_64 (for now) and then only for CPUs
with VMX or SVM support. It can run 32 and 64 bit OSes. On all other systems
the kernel module either does not exist or refuses to load.

NVMM has support code for it for the SVM and VMX backends and it allows them.
NVMM also handles the SMI just as WHPX does in the Qemu backend.

So maybe it an be set to default on in this test?

With regards,
Reinoud


