Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EA4356CEB
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 15:07:27 +0200 (CEST)
Received: from localhost ([::1]:39996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU7u2-0000WT-C4
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 09:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lU7ru-0007Sx-Cj
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:05:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35962
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lU7rp-000582-MQ
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:05:14 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lU7rs-0003V3-Bj; Wed, 07 Apr 2021 14:05:17 +0100
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <bb30a76c-c758-6829-d3fe-3e2d01cf55b6@ilande.co.uk>
 <20210402162052.264952-1-alxndr@bu.edu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <0c024eae-533b-f3fa-8878-9f90d283eef9@ilande.co.uk>
Date: Wed, 7 Apr 2021 14:04:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210402162052.264952-1-alxndr@bu.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] tests/qtest: add one more test for the am53c974
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/04/2021 17:20, Alexander Bulekov wrote:

> Original crash:
> qemu-fuzz-i386: ../hw/scsi/esp.c:791: void esp_transfer_data(SCSIRequest *, uint32_t): Assertion `!s->do_cmd' failed.
> ==257532== ERROR: libFuzzer: deadly signal
> __assert_fail assert/assert.c:101:3
> esp_transfer_data hw/scsi/esp.c:791:5
> scsi_req_data hw/scsi/scsi-bus.c:1412:9
> scsi_disk_emulate_read_data hw/scsi/scsi-disk.c:1407:9
> scsi_req_continue hw/scsi/scsi-bus.c:1394:9
> do_busid_cmd hw/scsi/esp.c:317:9
> handle_s_without_atn hw/scsi/esp.c:393:9
> esp_reg_write hw/scsi/esp.c:1029:13
> esp_pci_io_write hw/scsi/esp-pci.c:215:9
> memory_region_write_accessor softmmu/memory.c:491:5
> access_with_adjusted_size softmmu/memory.c:552:18
> memory_region_dispatch_write softmmu/memory.c:1502:16
> flatview_write_continue softmmu/physmem.c:2746:23
> flatview_write softmmu/physmem.c:2786:14
> address_space_write softmmu/physmem.c:2878:18
> cpu_outl softmmu/ioport.c:80:5
> 
> Based-on: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   tests/qtest/am53c974-test.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> The patch took care of the handle_satn_stop assert. Here's a test case
> for the other assert.

Even though I can't reproduce the assert() here, looking at the code I think I can 
see how do_cmd is not being reset when a DMA command is issued. Does the following 
solve the outstanding fuzzer asserts?

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 0037197bdb..b668acef82 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -357,6 +357,7 @@ static void handle_satn(ESPState *s)
      cmdlen = get_cmd(s, ESP_CMDFIFO_SZ);
      if (cmdlen > 0) {
          s->cmdfifo_cdb_offset = 1;
+        s->do_cmd = 0;
          do_cmd(s);
      } else if (cmdlen == 0) {
          s->do_cmd = 1;
@@ -390,6 +391,7 @@ static void handle_s_without_atn(ESPState *s)
      cmdlen = get_cmd(s, ESP_CMDFIFO_SZ);
      if (cmdlen > 0) {
          s->cmdfifo_cdb_offset = 0;
+        s->do_cmd = 0;
          do_busid_cmd(s, 0);
      } else if (cmdlen == 0) {
          s->do_cmd = 1;


ATB,

Mark.

