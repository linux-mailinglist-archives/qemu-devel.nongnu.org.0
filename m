Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051C8314BE2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 10:42:25 +0100 (CET)
Received: from localhost ([::1]:39280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9PXM-0003l2-3s
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 04:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9PU3-0001XE-Rm; Tue, 09 Feb 2021 04:38:59 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:38533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9PU0-0007TZ-EJ; Tue, 09 Feb 2021 04:38:57 -0500
Received: by mail-ed1-x52b.google.com with SMTP id s11so22624205edd.5;
 Tue, 09 Feb 2021 01:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SjgmasoYf5vJuco7ehFk2pkPeZenEo9Tt2tkcoFctrg=;
 b=d4sfoyPb3Ywayho0pc5OQTMYXcrWL1bPPGxMgbQzjmiNoNmV6qeazNa3TtPTKbELea
 xkeJutCYAi+MAiTuRPMzwXawM5u1cN0WQHR3M1sXA1aN6bhYkrIqM+eltkSHnwxPGNSX
 TETFvzzLOjJ3geII1rFWUc62JXDsEvgooFi5llpvJSfVJcApKuFZ0GGEIy6BydKTUILf
 4tCQNr8T3wluE+XdZR5xSBMAiB3qnwjyvTEGZea8Ehxm/QUrKBqmFqbufyj/BqIumJ6g
 YSjp3j3LjkftlHPkMyVAwHaN+qBLHrzPfo//V3qP75n7Z/pqeL3aUtF9vWoWql0w5Otg
 fF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SjgmasoYf5vJuco7ehFk2pkPeZenEo9Tt2tkcoFctrg=;
 b=jZKO+Y47IRFPdyCyUaDG8112IYsv4KFCPPBRX2B4Mmv1XYnFBmN/7ATYzKJf6fl7wK
 IDID1jEDgeA+Bh0Kllrjn6l7TC4+UW8KCv1e+JdOiW0zA8EwExhj1msk0zk9jiPZQnOH
 3RYknpaGe30TykGZXQewoUNkUkvXMn6mlh2kjAqPqIvAOCj4oypB+HqiwCgeNa9LlJ+M
 LXFw6bgsj603Qqbort7aa+lBUqUSyVHuW5sVLIuWuhBi7JV1BAQK7paYmA/J2mkIJeQs
 CcVY9PSbvagIMJqnETZ7yCmD1Od2jUWtewT1NZFfE4AKXuL3vPPn//46Jp1BGMecP1jg
 NmMw==
X-Gm-Message-State: AOAM532FVU9iIkDHqJ0xElepESZM4agN6YNLLQaGgwUC49t4/zdFIo9Q
 TrMKlAe94SmrS429/D2LPzQ=
X-Google-Smtp-Source: ABdhPJzA0a3WG/0RBaL9Aj/CwoZEO4C3mXy0e/L48I05mBB3vlxYE47tnl9AkisyOYbw8acpclQH+A==
X-Received: by 2002:aa7:d5c9:: with SMTP id d9mr3182573eds.245.1612863534183; 
 Tue, 09 Feb 2021 01:38:54 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g22sm10344840ejw.31.2021.02.09.01.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 01:38:53 -0800 (PST)
Subject: Re: [PATCH] hw/sd/sdhci: Do not modify BlockSizeRegister if
 transaction in progress
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210208193450.2689517-1-f4bug@amsat.org>
 <CAEUhbmUECh5oZueWZPNWc-ZAkF6XExhrT28R0wfCWDx1Vpeo+g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d806c94d-8d52-5401-93eb-c8698728ee52@amsat.org>
Date: Tue, 9 Feb 2021 10:38:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUECh5oZueWZPNWc-ZAkF6XExhrT28R0wfCWDx1Vpeo+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.265,
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 Li Qiang <liq3ea@163.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 9:28 AM, Bin Meng wrote:
> Hi Philippe,
> 
> On Tue, Feb 9, 2021 at 3:34 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
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
> 
> Is this command needed?

My guess is this makes the northbridge somehow map the device PCI space.

Probably not needed in machines where SDHCI is MMIO mapped.

> 
>>   outl 0xcf8 0x80001804
>>   outw 0xcfc 0x7
>>   outl 0xcf8 0x8000fa20
> 
> and this one?

Ditto.

> 
>>   write 0xe106802c 0x1 0x0f
>>   write 0xe1068004 0xc 0x2801d10101fffffbff28a384
> 
> Are these fuzzy data?

Yes, I didn't try to understand what this does, as often
non-sense operations. But this is what would craft a malicious
attacker.

> 
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
>> ---
>> Cc: Mauro Matteo Cascella <mcascell@redhat.com>
>> Cc: Alexander Bulekov <alxndr@bu.edu>
>> Cc: Alistair Francis <alistair.francis@wdc.com>
>> Cc: Prasad J Pandit <ppandit@redhat.com>
>> Cc: Bandan Das <bsd@redhat.com>
>>
>> RFC because missing Reported-by tags, launchpad/bugzilla links and
>> qtest reproducer. Sending for review meanwhile.
>> ---
>>  hw/sd/sdhci.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
>> index 8ffa53999d8..7ac7d9af9e4 100644
>> --- a/hw/sd/sdhci.c
>> +++ b/hw/sd/sdhci.c
>> @@ -1133,6 +1133,12 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
>>          }
>>          break;
>>      case SDHC_BLKSIZE:
>> +        if (s->data_count) {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                          "%s: Can not update blksize when"
>> +                          " transaction is executing\n", __func__);
>> +            break;
>> +        }
>>          if (!TRANSFERRING_DATA(s->prnsts)) {
> 
> I am not sure I get the whole picture here.

The problem is out of bound access on fifo_buffer.

> Isn't write to s->blksize and s->blkcnt already protected in this if
> () statement?

I tried this code but it didn't work:

-- >8 --
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 8ffa53999d8..182641ae98a 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -584,6 +584,11 @@ static void
sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
     uint32_t boundary_chk = 1 << (((s->blksize & ~BLOCK_SIZE_MASK) >>
12) + 12);
     uint32_t boundary_count = boundary_chk - (s->sdmasysad % boundary_chk);

+    if (TRANSFERRING_DATA(s->prnsts)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Transfer already in progress", __func__);
+        return;
+    }
     if (!(s->trnmod & SDHC_TRNS_BLK_CNT_EN) || !s->blkcnt) {
         qemu_log_mask(LOG_UNIMP, "infinite transfer is not supported\n");
         return;
---

Do you think we need both?

Maybe we miss to set a bit in s->prnsts somewhere...

