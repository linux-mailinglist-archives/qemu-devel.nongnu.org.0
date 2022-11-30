Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A0E63D2DF
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:11:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0K3Y-00043m-4d; Wed, 30 Nov 2022 05:11:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <regressions@leemhuis.info>)
 id 1p0K3Q-000410-UD
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:11:01 -0500
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <regressions@leemhuis.info>)
 id 1p0K3N-0007OE-Qc
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:11:00 -0500
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1p0K3G-0001Ct-Kj; Wed, 30 Nov 2022 11:10:50 +0100
Message-ID: <b4b81dfd-d30c-e8f4-3ea3-1af9140a82bb@leemhuis.info>
Date: Wed, 30 Nov 2022 11:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: regression: insmod module failed in VM with nvdimm on #forregzbot
Content-Language: en-US, de-DE
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org,
 chenxiang via <qemu-devel@nongnu.org>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>
References: <e6a804de-a5f7-c551-ffba-e09d04e438fc@hisilicon.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <e6a804de-a5f7-c551-ffba-e09d04e438fc@hisilicon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1669803057;
 417ed371; 
X-HE-SMSGID: 1p0K3G-0001Ct-Kj
Received-SPF: pass client-ip=80.237.130.52;
 envelope-from=regressions@leemhuis.info; helo=wp530.webpack.hosteurope.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.258,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

Hi, this is your Linux kernel regression tracker.

On 30.11.22 03:52, chenxiang (M) wrote:
>
> We boot the VM using following commands (with nvdimm on)  (qemu version
> 6.1.50, kernel 6.0-r4):
> 
> qemu-system-aarch64 -machine
> virt,kernel_irqchip=on,gic-version=3,nvdimm=on  -kernel
> /home/kernel/Image -initrd /home/mini-rootfs/rootfs.cpio.gz -bios
> /root/QEMU_EFI.FD -cpu host -enable-kvm -net none -nographic -m
> 2G,maxmem=64G,slots=3 -smp 4 -append 'rdinit=init console=ttyAMA0
> ealycon=pl0ll,0x90000000 pcie_ports=native pciehp.pciehp_debug=1'
> -object memory-backend-ram,id=ram1,size=10G -device
> nvdimm,id=dimm1,memdev=ram1  -device ioh3420,id=root_port1,chassis=1
> -device vfio-pci,host=7d:01.0,id=net0,bus=root_port1
> [...]
> We git bisect the code, and find the patch c5a89f75d2a ("arm64: kaslr:
> defer initialization to initcall where permitted").

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced fc5a89f75d2a
#regzbot title arm64: kaslr: vmalloc error when boothing a VM with nvdimm
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replies to), as explained for
in the Linux kernel's documentation; above webpage explains why this is
important for tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

