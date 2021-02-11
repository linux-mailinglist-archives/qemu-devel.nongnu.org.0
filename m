Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAC531935C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:49:29 +0100 (CET)
Received: from localhost ([::1]:55416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHxw-0007TV-Bl
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAHuK-0005Z2-Pt; Thu, 11 Feb 2021 14:45:46 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAHuI-0007vH-7W; Thu, 11 Feb 2021 14:45:44 -0500
Received: by mail-wm1-x335.google.com with SMTP id u14so6863534wmq.4;
 Thu, 11 Feb 2021 11:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SaS9W7gK+wrVWvMFUYZ7AT/ZwWe7w1FZShtq8iX3B1M=;
 b=bxic73vTT05rYz6fjxe8HaQNkkXZP2E/BMHvjNz9EkOQO1AYNmAXEwUiqQC/VTgcm4
 z28iCMPUfZD/rXZPwWtVe7WS+RCVHOEy4rqL7KuxdUwUFrVOJCzfX6sHqwH+CCA5GFHX
 gJiwmAZcdXsD1mfG8eaAXdjDYlVHl2QYwZ+rdhJnYYeKo34DYYKaqsg3KU+Yrs39NH2h
 ZCPJxYDp31FxZROYi225NyknO+JlFuJn1knAB2O7gLR575X/3sgsx7FwSFBuEO9Jtz++
 +z5I3DmJYJGnT4pgqoXEwdXMN0QrjlK3BTD64xaxKQRR6MKPXd23EhA+PIOidOrk+SY6
 qUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SaS9W7gK+wrVWvMFUYZ7AT/ZwWe7w1FZShtq8iX3B1M=;
 b=SySRCPdoZn3C2xUv+4/jeGkMh9j0vCTp7SVmMJlDxTOPOKqU5DQkmDo3HBMrgKcxrA
 kLCaDdgvuleHekxU/iDV/SzdtvPlDcuO9tm4GlvWIMuv9xL3LbKCqSqE+GHvH9NNZpHc
 V9gVRqe0tSXY9VH3AunmrSTXpfSgJTMACbjmEVWK73Mp1WT3BuZE3+33/cWsyFK88urO
 +BAiQrIgsUQHrD4VPLmBq+4NOEw9GJ4MmZ4L4CtsnmC+vCU3+SngNNCDgkjQK6N/6LGv
 lfTRYTX8Of1YbCTbZK8W2xBKsBiY9TsWFO/wTyzTmFXxpFKM+jAYGGQEHl6/O8Ec5U6G
 hHOw==
X-Gm-Message-State: AOAM531eAxZ9jweVEFVvZTtEg8+2oHNk62EES6Z7BiUI37+rBwVyGeE3
 1nBRFsP0QsBcie+L9sMaekI=
X-Google-Smtp-Source: ABdhPJzkhuqOGWqfL2ZKi+Gc0gL3Xgo70AuHx6TmG6SGI3fM7Qh/3lKKmXucEbBYZ8TpUuJ9Xmn35w==
X-Received: by 2002:a05:600c:3551:: with SMTP id
 i17mr5565208wmq.92.1613072740448; 
 Thu, 11 Feb 2021 11:45:40 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z1sm6324131wrp.62.2021.02.11.11.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 11:45:39 -0800 (PST)
Subject: Re: [PATCH] hw/sd/sdhci: Do not modify BlockSizeRegister if
 transaction in progress
To: Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bmeng.cn@gmail.com>
References: <20210208193450.2689517-1-f4bug@amsat.org>
 <20210211170439.fex2yoc74yaa3rof@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7bb7f415-e6b6-a694-59a8-2d362c970205@amsat.org>
Date: Thu, 11 Feb 2021 20:45:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210211170439.fex2yoc74yaa3rof@mozz.bu.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Li Qiang <liq3ea@163.com>,
 qemu-devel@nongnu.org, Prasad J Pandit <ppandit@redhat.com>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alexander,

On 2/11/21 6:04 PM, Alexander Bulekov wrote:
> On 210208 2034, Philippe Mathieu-Daudé wrote:
>> Per the "SD Host Controller Simplified Specification Version 2.00"
>> spec. 'Table 2-4 : Block Size Register':
>>
>>   Transfer Block Size [...] can be accessed only if no
>>   transaction is executing (i.e., after a transaction has stopped).
>>   Read operations during transfers may return an invalid value,
>>   and write operations shall be ignored.
>>
>> Transactions will update 'data_count', so do not modify 'blksize'
>> and 'blkcnt' when 'data_count' is used. This fixes:
>>
>> $ cat << EOF | qemu-system-x86_64 -qtest stdio -monitor none \
>>                -nographic -serial none -M pc-q35-5.0 \
>>                -device sdhci-pci,sd-spec-version=3 \
>>                -device sd-card,drive=mydrive \
>>                -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive
>>   outl 0xcf8 0x80001810
>>   outl 0xcfc 0xe1068000
>>   outl 0xcf8 0x80001814
>>   outl 0xcf8 0x80001804
>>   outw 0xcfc 0x7
>>   outl 0xcf8 0x8000fa20
>>   write 0xe106802c 0x1 0x0f
>>   write 0xe1068004 0xc 0x2801d10101fffffbff28a384
>>   write 0xe106800c 0x1f 0x9dacbbcad9e8f7061524334251606f7e8d9cabbac9d8e7f60514233241505f
>>   write 0xe1068003 0x28 0x80d000251480d000252280d000253080d000253e80d000254c80d000255a80d000256880d0002576
>>   write 0xe1068003 0x1 0xfe
>>   EOF
>>   =================================================================
>>   ==2686219==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x61500003bb00 at pc 0x55ab469f456c bp 0x7ffee71be330 sp 0x7ffee71bdae0
>>   WRITE of size 4 at 0x61500003bb00 thread T0
>>       #0 0x55ab469f456b in __asan_memcpy (qemu-system-i386+0x1cea56b)
>>       #1 0x55ab483dc396 in stl_he_p include/qemu/bswap.h:353:5
>>       #2 0x55ab483af5e4 in stn_he_p include/qemu/bswap.h:546:1
>>       #3 0x55ab483aeb4b in flatview_read_continue softmmu/physmem.c:2839:13
>>       #4 0x55ab483b0705 in flatview_read softmmu/physmem.c:2877:12
>>       #5 0x55ab483b028e in address_space_read_full softmmu/physmem.c:2890:18
>>       #6 0x55ab483b1294 in address_space_rw softmmu/physmem.c:2918:16
>>       #7 0x55ab479374a2 in dma_memory_rw_relaxed include/sysemu/dma.h:88:12
>>       #8 0x55ab47936f50 in dma_memory_rw include/sysemu/dma.h:127:12
>>       #9 0x55ab4793665f in dma_memory_read include/sysemu/dma.h:145:12
>>       #10 0x55ab4792f176 in sdhci_sdma_transfer_multi_blocks hw/sd/sdhci.c:639:13
>>       #11 0x55ab4793dc9d in sdhci_write hw/sd/sdhci.c:1129:17
>>       #12 0x55ab483f8db8 in memory_region_write_accessor softmmu/memory.c:491:5
>>       #13 0x55ab483f868a in access_with_adjusted_size softmmu/memory.c:552:18
>>       #14 0x55ab483f6da5 in memory_region_dispatch_write softmmu/memory.c:1501:16
>>       #15 0x55ab483c3b11 in flatview_write_continue softmmu/physmem.c:2774:23
>>       #16 0x55ab483b0eb6 in flatview_write softmmu/physmem.c:2814:14
>>       #17 0x55ab483b0a3e in address_space_write softmmu/physmem.c:2906:18
>>       #18 0x55ab48465c56 in qtest_process_command softmmu/qtest.c:654:9
>>
>>   0x61500003bb00 is located 0 bytes to the right of 512-byte region [0x61500003b900,0x61500003bb00)
>>   allocated by thread T0 here:
>>       #0 0x55ab469f58a7 in calloc (qemu-system-i386+0x1ceb8a7)
>>       #1 0x7f21d678f9b0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x589b0)
>>       #2 0x55ab479530ed in sdhci_pci_realize hw/sd/sdhci-pci.c:36:5
>>       #3 0x55ab476f102a in pci_qdev_realize hw/pci/pci.c:2108:9
>>       #4 0x55ab48baaad2 in device_set_realized hw/core/qdev.c:761:13
>>
>>   SUMMARY: AddressSanitizer: heap-buffer-overflow (qemu-system-i386+0x1cea56b) in __asan_memcpy
>>   Shadow bytes around the buggy address:
>>     0x0c2a7ffff710: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>>     0x0c2a7ffff720: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>     0x0c2a7ffff730: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>     0x0c2a7ffff740: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>     0x0c2a7ffff750: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>   =>0x0c2a7ffff760:[fa]fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>>     0x0c2a7ffff770: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>>     0x0c2a7ffff780: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>>     0x0c2a7ffff790: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>>     0x0c2a7ffff7a0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>>     0x0c2a7ffff7b0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>>   Shadow byte legend (one shadow byte represents 8 application bytes):
>>     Addressable:           00
>>     Heap left redzone:       fa
>>     Freed heap region:       fd
>>   ==2686219==ABORTING
>>
>> Fixes: CVE-2020-17380
>> Fixes: CVE-2020-25085
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> I applied this along with <1612868085-72809-1-git-send-email-bmeng.cn@gmail.com>
> "hw/sd: sdhci: Do not transfer any data when command fails"
> 
> I ran through the entire OSS-Fuzz corpus, and could not reproduce the
> crash.

Thanks for your testing, it is helpful!

However I am a bit confused, because Bin's patch is supposed to
replace mine. Are you saying Bin's patch doesn't fix the problem?

Could you test this patch without Bin's one?

> 
> Tested-by: Alexander Bulekov <alxndr@bu.edu>
> Thanks

