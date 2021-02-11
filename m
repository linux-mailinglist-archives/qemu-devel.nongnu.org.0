Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24876318788
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 10:56:22 +0100 (CET)
Received: from localhost ([::1]:40162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA8hx-0008Ew-4M
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 04:56:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1lA8fp-0007L3-GJ; Thu, 11 Feb 2021 04:54:09 -0500
Received: from mail.csgraf.de ([85.25.223.15]:40902 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1lA8fn-00065F-KE; Thu, 11 Feb 2021 04:54:09 -0500
Received: from Alexanders-Mac-mini.local (unknown [188.138.100.120])
 by csgraf.de (Postfix) with UTF8SMTPSA id 30D4D60800CE;
 Thu, 11 Feb 2021 10:54:04 +0100 (CET)
Message-ID: <20c3b649-b6c1-91ef-41cd-5c820a7f81cf@csgraf.de>
Date: Thu, 11 Feb 2021 10:53:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:86.0)
 Gecko/20100101 Thunderbird/86.0
Subject: Re: [PULL 32/56] hw/block/nvme: split setup and register for namespace
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210209073101.548811-1-its@irrelevant.dk>
 <20210209073101.548811-33-its@irrelevant.dk>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20210209073101.548811-33-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.998,
 NICE_REPLY_A=-0.211, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Klaus,

On 09.02.21 08:30, Klaus Jensen wrote:
> From: Minwoo Im <minwoo.im.dev@gmail.com>
>
> In NVMe, namespace is being attached to process I/O.  We register NVMe
> namespace to a controller via nvme_register_namespace() during
> nvme_ns_setup().  This is main reason of receiving NvmeCtrl object
> instance to this function to map the namespace to a controller.
>
> To make namespace instance more independent, it should be split into two
> parts: setup and register.  This patch split them into two differnt
> parts, and finally nvme_ns_setup() does not have nothing to do with
> NvmeCtrl instance at all.
>
> This patch is a former patch to introduce NVMe subsystem scheme to the
> existing design especially for multi-path.  In that case, it should be
> split into two to make namespace independent from a controller.
>
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>


In latest master, I can no longer access NVMe devices from edk2. Git 
bisect pointed me to this commit.

To reproduce:

  $ ./build/qemu-system-x86_64 -enable-kvm -pflash 
build/pc-bios/edk2-x86_64-code.fd -drive 
file=image.raw,if=none,id=d,snapshot=on -device nvme,serial=1234,drive=d 
-nographic -net none

You will see that before this commit, edk2 is able to enumerate the 
block device, while after this commit it does not find it.


good:

Mapping table
      FS0: Alias(s):HD1b:;BLK2:
        � 
PciRoot(0x0)/Pci(0x3,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(1,GPT,7A866FF6-0A12-4911-A4ED-D0565BEB41A2,0x80,0x64000)
     BLK0: Alias(s):
          PciRoot(0x0)/Pci(0x1,0x1)/Ata(0x0)
     BLK1: Alias(s):
        � 
PciRoot(0x0)/Pci(0x3,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)
     BLK3: Alias(s):
        � 
PciRoot(0x0)/Pci(0x3,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(2,GPT,F070566B-C58D-4F13-9B92-64F1794385E7,0x64080,0x40000)
     BLK4: Alias(s):
        � 
PciRoot(0x0)/Pci(0x3,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(3,GPT,EDE86BE3-C64F-4ACB-B4AA-5E6C0135D335,0xA4080,0x315BF1B)


bad:

Mapping table
     BLK0: Alias(s):
          PciRoot(0x0)/Pci(0x1,0x1)/Ata(0x0)



Thanks,

Alex



