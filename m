Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD3532BA45
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 20:53:38 +0100 (CET)
Received: from localhost ([::1]:60542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHXYw-0001Bt-0m
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 14:53:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHXY3-0000l9-Fs
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:52:43 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:53211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHXY1-0002Fc-IB
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:52:43 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MXY2Z-1lHj6D3RTb-00Z1rY; Wed, 03 Mar 2021 20:52:35 +0100
Subject: Re: [PATCH v2 33/42] esp: defer command completion interrupt on
 incoming data transfers
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-34-mark.cave-ayland@ilande.co.uk>
 <6cc4e1c8-5a3b-2d2f-5a64-5d2bf3cb3a69@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ba080d8e-1e21-e5e9-8fff-568db5f73b3f@vivier.eu>
Date: Wed, 3 Mar 2021 20:52:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <6cc4e1c8-5a3b-2d2f-5a64-5d2bf3cb3a69@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tvyflcIMDmkSQQ9R/SfoEcdpFGccFyBKmRKtblYxfefUw05wZTU
 8PTcrItFfLuNAm8R98h/1osuNw7FY6trX4mhHxeJq3n+fPeH17HUqGIsdkg82BnRFBz36CA
 j3pEnH3rS6xBi+6GzphdpQBn73YTHdGXNqjjHZntKDnQwWmUvEHNdSM77ITV10++nSxIm+I
 SaJ7zZwfAwp6byT2PPl+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6cQTVD4Azhw=:SOpDuLpk/MeoDKQuK7CJqK
 XPthzo/b0HNEclVFrgHKGsqOrNG90MaxEfn15kRphO4ApkqzFvsHsz87B63u1QXj3patoJOSl
 pz3PPpdxOE3u+CMv8ypMtkMaqBzMbxh/Rx7gFgmI9f/sErsPWb6/Ae8uRppb4BhL82YpQfi8Q
 YweErHuICFoPktqI3IDYBErld7VOs2XqQWrYGxig0Us5J6BHSjAnJUmQOCXUdcBl2FFqNwHL6
 bNIBq4DaBUfY7OMiRk2QPpY02HRsVRDd+NVtpRhXPS5zhf7BG6FofvaE6VZS8goEFKlKG5EhJ
 yjEPKB1Evae5oIcR5cMWZP6UqMVEuHhlfLgpxmGlyiPcgmY0nkRNueEf7Hv5iYOu08Zi95bmi
 v7PCqJIe+8+zM+Yylx3RcskGOBhKUhuxyouj/r7sy2uBjX+Bkmm9sKEPREd4oKKKY3sk7xh1Z
 t77e2UtdPQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 18/02/2021 à 18:25, Mark Cave-Ayland a écrit :
> On 09/02/2021 19:30, Mark Cave-Ayland wrote:
> 
>> The MacOS toolbox ROM issues a command to the ESP controller as part of its
>> "FAST" SCSI routines and then proceeds to read the incoming data soon after
>> receiving the command completion interrupt.
>>
>> Unfortunately due to SCSI block transfers being asynchronous the incoming data
>> may not yet be present causing an underflow error. Resolve this by waiting for
>> the SCSI subsystem transfer_data callback before raising the command completion
>> interrupt.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/scsi/esp.c         | 54 +++++++++++++++++++++++++++++++++++++++----
>>   include/hw/scsi/esp.h |  1 +
>>   2 files changed, 51 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>> index 728d4ddf99..ce6a7a1ed0 100644
>> --- a/hw/scsi/esp.c
>> +++ b/hw/scsi/esp.c
>> @@ -183,6 +183,14 @@ static int esp_select(ESPState *s)
>>           esp_raise_irq(s);
>>           return -1;
>>       }
>> +
>> +    /*
>> +     * Note that we deliberately don't raise the IRQ here: this will be done
>> +     * either in do_busid_cmd() for DATA OUT transfers or by the deferred
>> +     * IRQ mechanism in esp_transfer_data() for DATA IN transfers
>> +     */
>> +    s->rregs[ESP_RINTR] |= INTR_FC;
>> +    s->rregs[ESP_RSEQ] = SEQ_CD;
>>       return 0;
>>   }
>>   @@ -237,18 +245,24 @@ static void do_busid_cmd(ESPState *s, uint8_t *buf, uint8_t busid)
>>       s->ti_size = datalen;
>>       if (datalen != 0) {
>>           s->rregs[ESP_RSTAT] = STAT_TC;
>> +        s->rregs[ESP_RSEQ] = SEQ_CD;
>>           esp_set_tc(s, 0);
>>           if (datalen > 0) {
>> +            /*
>> +             * Switch to DATA IN phase but wait until initial data xfer is
>> +             * complete before raising the command completion interrupt
>> +             */
>> +            s->data_in_ready = false;
>>               s->rregs[ESP_RSTAT] |= STAT_DI;
>>           } else {
>>               s->rregs[ESP_RSTAT] |= STAT_DO;
>> +            s->rregs[ESP_RINTR] |= INTR_BS | INTR_FC;
>> +            esp_raise_irq(s);
>> +            esp_lower_drq(s);
>>           }
>>           scsi_req_continue(s->current_req);
>> +        return;
>>       }
>> -    s->rregs[ESP_RINTR] |= INTR_BS | INTR_FC;
>> -    s->rregs[ESP_RSEQ] = SEQ_CD;
>> -    esp_raise_irq(s);
>> -    esp_lower_drq(s);
>>   }
>>     static void do_cmd(ESPState *s)
>> @@ -603,12 +617,35 @@ void esp_command_complete(SCSIRequest *req, uint32_t status,
>>   void esp_transfer_data(SCSIRequest *req, uint32_t len)
>>   {
>>       ESPState *s = req->hba_private;
>> +    int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
>>       uint32_t dmalen = esp_get_tc(s);
>>         assert(!s->do_cmd);
>>       trace_esp_transfer_data(dmalen, s->ti_size);
>>       s->async_len = len;
>>       s->async_buf = scsi_req_get_buf(req);
>> +
>> +    if (!to_device && !s->data_in_ready) {
>> +        /*
>> +         * Initial incoming data xfer is complete so raise command
>> +         * completion interrupt
>> +         */
>> +        s->data_in_ready = true;
>> +        s->rregs[ESP_RSTAT] |= STAT_TC;
>> +        s->rregs[ESP_RINTR] |= INTR_BS;
>> +        esp_raise_irq(s);
>> +
>> +        /*
>> +         * If data is ready to transfer and the TI command has already
>> +         * been executed, start DMA immediately. Otherwise DMA will start
>> +         * when host sends the TI command
>> +         */
>> +        if (s->ti_size && (s->rregs[ESP_CMD] == (CMD_TI | CMD_DMA))) {
>> +            esp_do_dma(s);
>> +        }
>> +        return;
>> +    }
>> +
>>       if (dmalen) {
>>           esp_do_dma(s);
>>       } else if (s->ti_size <= 0) {
>> @@ -870,6 +907,14 @@ static bool esp_is_before_version_5(void *opaque, int version_id)
>>       return version_id < 5;
>>   }
>>   +static bool esp_is_version_5(void *opaque, int version_id)
>> +{
>> +    ESPState *s = ESP(opaque);
>> +
>> +    version_id = MIN(version_id, s->mig_version_id);
>> +    return version_id == 5;
>> +}
>> +
>>   static int esp_pre_save(void *opaque)
>>   {
>>       ESPState *s = ESP(opaque);
>> @@ -914,6 +959,7 @@ const VMStateDescription vmstate_esp = {
>>           VMSTATE_UINT32(cmdlen, ESPState),
>>           VMSTATE_UINT32(do_cmd, ESPState),
>>           VMSTATE_UINT32_TEST(mig_dma_left, ESPState, esp_is_before_version_5),
>> +        VMSTATE_BOOL_TEST(data_in_ready, ESPState, esp_is_version_5),
>>           VMSTATE_END_OF_LIST()
>>       },
>>   };
>> diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
>> index 6618f4e091..3b69aedebe 100644
>> --- a/include/hw/scsi/esp.h
>> +++ b/include/hw/scsi/esp.h
>> @@ -41,6 +41,7 @@ struct ESPState {
>>       uint32_t cmdlen;
>>       uint32_t do_cmd;
>>   +    bool data_in_ready;
>>       int dma_enabled;
>>         uint32_t async_len;
> 
> Whilst doing some testing earlier, I discovered that the same change is required in
> do_dma_pdma_cb(): it seems during boot the ROM attempts several 128k DMA requests in a row, and with
> heavy debugging enabled it's enough to trigger the same underflow problem.
> 
> Fortunately the fix is easy, and I'll squash this into the v3 series:
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index a175191718..248c1ce27a 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -453,17 +453,13 @@ static void do_dma_pdma_cb(ESPState *s)
>      } else {
>          if (s->async_len == 0) {
>              if (s->current_req) {
> +               /*
> +                * Defer until the scsi layer has completed.
> +                */
>                  scsi_req_continue(s->current_req);
> +                s->data_in_ready = false;
>              }
> -
> -            /*
> -             * If there is still data to be read from the device then
> -             * complete the DMA operation immediately.  Otherwise defer
> -             * until the scsi layer has completed.
> -             */
> -            if (esp_get_tc(s) != 0 || s->ti_size == 0) {
> -                return;
> -            }
> +            return;
>          }
> 
>          if (esp_get_tc(s) != 0) {
> 
> 
> ATB,
> 
> Mark.


Reviewed-by: Laurent Vivier <laurent@vivier.eu>

