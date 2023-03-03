Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACCE6A9456
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:43:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1wE-0006ym-Qx; Fri, 03 Mar 2023 04:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <regressions@leemhuis.info>)
 id 1pY1wC-0006yc-QR
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:42:53 -0500
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <regressions@leemhuis.info>)
 id 1pY1wB-0006NT-0j
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:42:52 -0500
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1pY1w3-0007DD-9B; Fri, 03 Mar 2023 10:42:43 +0100
Message-ID: <632d4ca3-01ed-4d51-41b0-40c1aa82ffe9@leemhuis.info>
Date: Fri, 3 Mar 2023 10:42:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: regression: insmod module failed in VM with nvdimm on #forregzbot
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org,
 chenxiang via <qemu-devel@nongnu.org>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>
References: <e6a804de-a5f7-c551-ffba-e09d04e438fc@hisilicon.com>
 <b4b81dfd-d30c-e8f4-3ea3-1af9140a82bb@leemhuis.info>
In-Reply-To: <b4b81dfd-d30c-e8f4-3ea3-1af9140a82bb@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1677836571;
 99bd8e47; 
X-HE-SMSGID: 1pY1w3-0007DD-9B
Received-SPF: pass client-ip=80.237.130.52;
 envelope-from=regressions@leemhuis.info; helo=wp530.webpack.hosteurope.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.092,
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

[TLDR: This mail in primarily relevant for Linux regression tracking. A
change or fix related to the regression discussed in this thread was
posted or applied, but it did not use a Link: tag to point to the
report, as Linus and the documentation call for. Things happen, no
worries -- but now the regression tracking bot needs to be told manually
about the fix. See link in footer if these mails annoy you.]

On 30.11.22 11:10, Thorsten Leemhuis wrote:
>
> On 30.11.22 03:52, chenxiang (M) wrote:
>>
>> We boot the VM using following commands (with nvdimm on)  (qemu version
>> 6.1.50, kernel 6.0-r4):
>>
>> qemu-system-aarch64 -machine
>> virt,kernel_irqchip=on,gic-version=3,nvdimm=on  -kernel
>> /home/kernel/Image -initrd /home/mini-rootfs/rootfs.cpio.gz -bios
>> /root/QEMU_EFI.FD -cpu host -enable-kvm -net none -nographic -m
>> 2G,maxmem=64G,slots=3 -smp 4 -append 'rdinit=init console=ttyAMA0
>> ealycon=pl0ll,0x90000000 pcie_ports=native pciehp.pciehp_debug=1'
>> -object memory-backend-ram,id=ram1,size=10G -device
>> nvdimm,id=dimm1,memdev=ram1  -device ioh3420,id=root_port1,chassis=1
>> -device vfio-pci,host=7d:01.0,id=net0,bus=root_port1
>> [...]
>> We git bisect the code, and find the patch c5a89f75d2a ("arm64: kaslr:
>> defer initialization to initcall where permitted").
> 
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced fc5a89f75d2a
> #regzbot title arm64: kaslr: vmalloc error when boothing a VM with nvdimm
> #regzbot ignore-activity

#regzbot fix: arm64: kaslr: don't pretend KASLR is enabled if offset <
MIN_KIMG_ALIGN
#regzbot ignore-activity

Backstory:

https://lore.kernel.org/lkml/CAMj1kXGWEaQXoKj=DzG9XpVGi4t5zfE-RSG0BodVL-b47nsj-A@mail.gmail.com/
https://lore.kernel.org/all/20230223204101.1500373-1-ardb@kernel.org/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

