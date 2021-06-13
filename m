Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4163A57BA
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 12:41:28 +0200 (CEST)
Received: from localhost ([::1]:60888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsNYU-0001j8-0s
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 06:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsNXW-00014B-9H
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 06:40:26 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40982
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsNXT-0000vG-UN
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 06:40:26 -0400
Received: from host86-132-109-72.range86-132.btcentralplus.com
 ([86.132.109.72] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsNXE-0004MR-RJ; Sun, 13 Jun 2021 11:40:13 +0100
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210611115756.662367-1-pbonzini@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <f78018a5-8845-1fd8-f580-57bafc534e6c@ilande.co.uk>
Date: Sun, 13 Jun 2021 11:40:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210611115756.662367-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.109.72
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] esp: store lun coming from the MESSAGE OUT phase
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/06/2021 12:57, Paolo Bonzini wrote:

> The LUN is selected with an IDENTIFY message, and persists
> until the next message out phase.  Instead of passing it to
> do_busid_cmd, store it in ESPState.  Because do_cmd can simply
> skip the message out phase if cmdfifo_cdb_offset is zero, it
> can now be used for the S without ATN cases as well.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/scsi/esp.c         | 39 +++++++++++++++++++++++----------------
>   hw/scsi/trace-events  |  3 ++-
>   include/hw/scsi/esp.h |  1 +
>   3 files changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 3e6f4094fc..1f1c02de79 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -221,7 +221,7 @@ static int esp_select(ESPState *s)
>   
>       /*
>        * Note that we deliberately don't raise the IRQ here: this will be done
> -     * either in do_busid_cmd() for DATA OUT transfers or by the deferred
> +     * either in do_command_phase() for DATA OUT transfers or by the deferred
>        * IRQ mechanism in esp_transfer_data() for DATA IN transfers
>        */
>       s->rregs[ESP_RINTR] |= INTR_FC;
> @@ -272,24 +272,22 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
>       return dmalen;
>   }
>   
> -static void do_busid_cmd(ESPState *s, uint8_t busid)
> +static void do_command_phase(ESPState *s)
>   {
>       uint32_t cmdlen;
>       int32_t datalen;
> -    int lun;
>       SCSIDevice *current_lun;
>       uint8_t buf[ESP_CMDFIFO_SZ];
>   
> -    trace_esp_do_busid_cmd(busid);
> -    lun = busid & 7;
> +    trace_esp_do_command_phase(s->lun);
>       cmdlen = fifo8_num_used(&s->cmdfifo);
>       if (!cmdlen || !s->current_dev) {
>           return;
>       }
>       esp_fifo_pop_buf(&s->cmdfifo, buf, cmdlen);
>   
> -    current_lun = scsi_device_find(&s->bus, 0, s->current_dev->id, lun);
> -    s->current_req = scsi_req_new(current_lun, 0, lun, buf, s);
> +    current_lun = scsi_device_find(&s->bus, 0, s->current_dev->id, s->lun);
> +    s->current_req = scsi_req_new(current_lun, 0, s->lun, buf, s);
>       datalen = scsi_req_enqueue(s->current_req);
>       s->ti_size = datalen;
>       fifo8_reset(&s->cmdfifo);
> @@ -316,21 +314,29 @@ static void do_busid_cmd(ESPState *s, uint8_t busid)
>       }
>   }
>   
> -static void do_cmd(ESPState *s)
> +static void do_message_phase(ESPState *s)
>   {
> -    uint8_t busid = esp_fifo_pop(&s->cmdfifo);
> -    int len;
> +    if (s->cmdfifo_cdb_offset) {
> +        uint8_t message = esp_fifo_pop(&s->cmdfifo);
>   
> -    s->cmdfifo_cdb_offset--;
> +        trace_esp_do_identify(message);
> +        s->lun = message & 7;
> +        s->cmdfifo_cdb_offset--;
> +    }
>   
>       /* Ignore extended messages for now */
>       if (s->cmdfifo_cdb_offset) {
> -        len = MIN(s->cmdfifo_cdb_offset, fifo8_num_used(&s->cmdfifo));
> +        int len = MIN(s->cmdfifo_cdb_offset, fifo8_num_used(&s->cmdfifo));
>           esp_fifo_pop_buf(&s->cmdfifo, NULL, len);
>           s->cmdfifo_cdb_offset = 0;
>       }
> +}
>   
> -    do_busid_cmd(s, busid);
> +static void do_cmd(ESPState *s)
> +{
> +    do_message_phase(s);
> +    assert(s->cmdfifo_cdb_offset == 0);
> +    do_command_phase(s);
>   }
>   
>   static void satn_pdma_cb(ESPState *s)
> @@ -369,7 +375,7 @@ static void s_without_satn_pdma_cb(ESPState *s)
>       if (!esp_get_tc(s) && !fifo8_is_empty(&s->cmdfifo)) {
>           s->cmdfifo_cdb_offset = 0;
>           s->do_cmd = 0;
> -        do_busid_cmd(s, 0);
> +        do_cmd(s);
>       }
>   }
>   
> @@ -386,7 +392,7 @@ static void handle_s_without_atn(ESPState *s)
>       if (cmdlen > 0) {
>           s->cmdfifo_cdb_offset = 0;
>           s->do_cmd = 0;
> -        do_busid_cmd(s, 0);
> +        do_cmd(s);
>       } else if (cmdlen == 0) {
>           s->do_cmd = 1;
>           /* Target present, but no cmd yet - switch to command phase */
> @@ -1168,7 +1174,7 @@ static int esp_post_load(void *opaque, int version_id)
>   
>   const VMStateDescription vmstate_esp = {
>       .name = "esp",
> -    .version_id = 5,
> +    .version_id = 6,
>       .minimum_version_id = 3,
>       .post_load = esp_post_load,
>       .fields = (VMStateField[]) {
> @@ -1197,6 +1203,7 @@ const VMStateDescription vmstate_esp = {
>           VMSTATE_FIFO8_TEST(fifo, ESPState, esp_is_version_5),
>           VMSTATE_FIFO8_TEST(cmdfifo, ESPState, esp_is_version_5),
>           VMSTATE_UINT8_TEST(ti_cmd, ESPState, esp_is_version_5),
> +        VMSTATE_UINT8_V(lun, ESPState, 6),
>           VMSTATE_END_OF_LIST()
>       },
>   };
> diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
> index 1a27e141ae..92d5b40f89 100644
> --- a/hw/scsi/trace-events
> +++ b/hw/scsi/trace-events
> @@ -166,7 +166,8 @@ esp_dma_disable(void) "Lower enable"
>   esp_pdma_read(int size) "pDMA read %u bytes"
>   esp_pdma_write(int size) "pDMA write %u bytes"
>   esp_get_cmd(uint32_t dmalen, int target) "len %d target %d"
> -esp_do_busid_cmd(uint8_t busid) "busid 0x%x"
> +esp_do_command_phase(uint8_t busid) "busid 0x%x"
> +esp_do_identify(uint8_t byte) "0x%x"
>   esp_handle_satn_stop(uint32_t cmdlen) "cmdlen %d"
>   esp_write_response(uint32_t status) "Transfer status (status=%d)"
>   esp_do_dma(uint32_t cmdlen, uint32_t len) "command len %d + %d"
> diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
> index aada3680b7..b1ec27612f 100644
> --- a/include/hw/scsi/esp.h
> +++ b/include/hw/scsi/esp.h
> @@ -37,6 +37,7 @@ struct ESPState {
>       SCSIRequest *current_req;
>       Fifo8 cmdfifo;
>       uint8_t cmdfifo_cdb_offset;
> +    uint8_t lun;
>       uint32_t do_cmd;
>   
>       bool data_in_ready;

Functionally the patch passes all my boot tests, but fails when attempting to load a 
migration from an earlier version. The first reason is that I made a mistake in the 
version check in esp_is_version_5() which prevents tested fields from appearing in 
the migration stream if the VMStateDescription has a version_id > 5. This is fixed by 
the patch I just posted.

Unfortunately the VMSTATE_*_V() macros don't work in ESPState because ESPState is 
currently embedded in both sysbusespscsi and pciespscsi using VMSTATE_STRUCT() where 
the version of the vmstate_esp VMStateDescription does not match those in the 
vmstate_sysbus_esp_scsi or vmstate_esp_pci_scsi VMStateDescriptions. This is 
currently handled by adding an explicit mig_version_id field containing the 
vmstate_esp.version_id field and testing accordingly.

The fix is to use the same logic as esp_is_version_5() when adding the new field to 
vmstate_esp. I've tested the changes below squashed into your patch, along with the 
just posted fix for esp_is_version_5(), and confirmed that I can reload old 
qemu-system-sparc images from 5.2 and 6.0 as well as git master.

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 39756ddd99..4737c34f63 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -1123,6 +1123,14 @@ static bool esp_is_version_5(void *opaque, int version_id)
      return version_id >= 5;
  }

+static bool esp_is_version_6(void *opaque, int version_id)
+{
+    ESPState *s = ESP(opaque);
+
+    version_id = MIN(version_id, s->mig_version_id);
+    return version_id >= 6;
+}
+
  int esp_pre_save(void *opaque)
  {
      ESPState *s = ESP(object_resolve_path_component(
@@ -1189,6 +1197,7 @@ const VMStateDescription vmstate_esp = {
          VMSTATE_FIFO8_TEST(fifo, ESPState, esp_is_version_5),
          VMSTATE_FIFO8_TEST(cmdfifo, ESPState, esp_is_version_5),
          VMSTATE_UINT8_TEST(ti_cmd, ESPState, esp_is_version_5),
+        VMSTATE_UINT8_TEST(lun, ESPState, esp_is_version_6),
          VMSTATE_END_OF_LIST()
      },
  };

Anyhow for your patch with my esp_is_version_5() fix and the changes above:

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

