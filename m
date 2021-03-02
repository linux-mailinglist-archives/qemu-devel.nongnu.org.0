Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6A332A981
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:33:40 +0100 (CET)
Received: from localhost ([::1]:32814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9pz-0003NP-LH
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lH9JZ-0006FQ-TZ
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:00:09 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:57471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lH9JW-0007q5-Tz
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:00:09 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MT9zD-1lMG8b1a7r-00Ucf2; Tue, 02 Mar 2021 18:59:54 +0100
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-19-mark.cave-ayland@ilande.co.uk>
 <99d86cc8-ec8d-049d-1252-92d50f0f8eaa@vivier.eu>
 <564185f7-0346-0d28-c9cf-f083af9cde50@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 18/42] esp: accumulate SCSI commands for PDMA transfers
 in cmdbuf instead of pdma_buf
Message-ID: <68838f99-f2fa-5eb3-683c-85b39b155ab4@vivier.eu>
Date: Tue, 2 Mar 2021 18:59:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <564185f7-0346-0d28-c9cf-f083af9cde50@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:q5QrTH/ewZUW/3u9wllKISj5UsDIrHUIBrWPyhKxnIrKOUjY/38
 q7Av40jGu297wPOlKdW+5QMvpw+9JhdbMvBaIG9AmNUqyBfAfl3cEGav2U8OiURUTN/0YY6
 Tls1Mc2HlmbVVW3vfLnoQC03rtJZrSuQB4e+PmrfV5QjyFZuvW+HO5dIIkGiBq8DgOuH6Le
 aFYjlBQvx5VqMFqm+zI3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6hyaxYA3pLY=:HBscyvFXNCf3iF+r2uob6v
 cu3cAIHHLjXsQLpx0SJ0U89vS4PFAtUBF8v8U7lCo72FBLoRLcrLqId6+sl6mMM9IPnH/L0KN
 mmh4fM5sV2/F5oGtkxD2N0dyodeJn1S5b/dweAtIpdMCWdChfyScKrqchxy+fSPPCDoIYD52Y
 CixkWVUvhv6jilddWy2/p+Ym3nYVe5qx2wh/TsrnckLMCmUoBl0kN8I9pqfdocTe4cyAhR3Hm
 SboLOChmZSZgNshWtXl2+hkKxT+cEnCff4ER5PA024kCjJZCLhfVsQosmuLzb7wX16/d8kdUl
 wJj44Y+2eZUS6Oji5gtgb7x2uNeZwfNjnAf4oGcqnzzljb44ugr+0om+oVHcZnHIEXD4konoA
 bS4ZdBITkEZi4laYQv9sedwqcYhzjNoALaz5Ly7wA/IAjVKeseb9mHbgGPcBZp2yfa/xPHItV
 /E0mVg1pPg==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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

Le 02/03/2021 à 18:34, Mark Cave-Ayland a écrit :
> On 02/03/2021 17:02, Laurent Vivier wrote:
> 
>> Le 09/02/2021 à 20:29, Mark Cave-Ayland a écrit :
>>> ESP SCSI commands are already accumulated in cmdbuf and so there is no need to
>>> keep a separate pdma_buf buffer. Accumulate SCSI commands for PDMA transfers in
>>> cmdbuf instead of pdma_buf so update cmdlen accordingly and change pdma_origin
>>> for PDMA transfers to CMD which allows the PDMA origin to be removed.
>>>
>>> This commit also removes a stray memcpy() from get_cmd() which is a no-op because
>>> cmdlen is always zero at the start of a command.
>>>
>>> Notionally the removal of pdma_buf from vmstate_esp_pdma also breaks migration
>>> compatibility for the PDMA subsection until its complete removal by the end of
>>> the series.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>>   hw/scsi/esp.c         | 56 +++++++++++++++++++------------------------
>>>   include/hw/scsi/esp.h |  2 --
>>>   2 files changed, 25 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>>> index 7134c0aff4..b846f022fb 100644
>>> --- a/hw/scsi/esp.c
>>> +++ b/hw/scsi/esp.c
>>> @@ -139,8 +139,6 @@ static void set_pdma(ESPState *s, enum pdma_origin_id origin,
>>>   static uint8_t *get_pdma_buf(ESPState *s)
>>>   {
>>>       switch (s->pdma_origin) {
>>> -    case PDMA:
>>> -        return s->pdma_buf;
>>>       case TI:
>>>           return s->ti_buf;
>>>       case CMD:
>>> @@ -161,14 +159,12 @@ static uint8_t esp_pdma_read(ESPState *s)
>>>       }
>>>         switch (s->pdma_origin) {
>>> -    case PDMA:
>>> -        val = s->pdma_buf[s->pdma_cur++];
>>> -        break;
>>>       case TI:
>>>           val = s->ti_buf[s->pdma_cur++];
>>>           break;
>>>       case CMD:
>>> -        val = s->cmdbuf[s->pdma_cur++];
>>> +        val = s->cmdbuf[s->cmdlen++];
>>> +        s->pdma_cur++;
>>>           break;
>>>       case ASYNC:
>>>           val = s->async_buf[s->pdma_cur++];
>>> @@ -193,14 +189,12 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
>>>       }
>>>         switch (s->pdma_origin) {
>>> -    case PDMA:
>>> -        s->pdma_buf[s->pdma_cur++] = val;
>>> -        break;
>>>       case TI:
>>>           s->ti_buf[s->pdma_cur++] = val;
>>>           break;
>>>       case CMD:
>>> -        s->cmdbuf[s->pdma_cur++] = val;
>>> +        s->cmdbuf[s->cmdlen++] = val;
>>> +        s->pdma_cur++;
>>>           break;
>>>       case ASYNC:
>>>           s->async_buf[s->pdma_cur++] = val;
>>> @@ -256,8 +250,7 @@ static uint32_t get_cmd(ESPState *s, uint8_t *buf, uint8_t buflen)
>>>           if (s->dma_memory_read) {
>>>               s->dma_memory_read(s->dma_opaque, buf, dmalen);
>>>           } else {
>>> -            memcpy(s->pdma_buf, buf, dmalen);
>>> -            set_pdma(s, PDMA, 0, dmalen);
>>> +            set_pdma(s, CMD, 0, dmalen);
>>>               esp_raise_drq(s);
>>>               return 0;
>>>           }
>>> @@ -316,24 +309,24 @@ static void satn_pdma_cb(ESPState *s)
>>>       if (get_cmd_cb(s) < 0) {
>>>           return;
>>>       }
>>> -    if (s->pdma_cur != s->pdma_start) {
>>> -        do_cmd(s, get_pdma_buf(s) + s->pdma_start);
>>> +    s->do_cmd = 0;
>>> +    if (s->cmdlen) {
>>> +        do_cmd(s, s->cmdbuf);
>>
>> I don't understant how you can remove the pdma_start: normally it is here to keep track of the
>> position in the pDMA if the migration is occuraing while a pDMA transfer.
> 
> Hi Laurent,
> 
> I was going to follow up on your reviews later this evening, however this one caught my eye: as per
> the cover letter, this patchset is a migration break for the q800 machine. As there are likely more
> incompatible changes for the q800 machine coming up soon, it didn't seem worth the effort (and
> indeed I don't think it's possible to recreate the new internal state with 100% accuracy from the
> old state).
> 
> Migration for ESP devices that don't use PDMA is still supported, and I've tested this during
> development with qemu-system-sparc.
> 

I don't mean we can't migrate from a previous version to the new one, I mean the migration between
two machines of the current version is not possible anymore as we don't keep track of the position
of the pDMA index inside the buffer.

With a DMA, the migration cannot happen in the middle of the DMA, while with pDMA it can (as it's a
processor loop).

The whole purpose of get_pdma() and set_pdma() was for the migration.

https://patchew.org/QEMU/20190910113323.17324-1-laurent@vivier.eu/diff/20190910193347.16000-1-laurent@vivier.eu/

Previously the Q800 was not migratable also because the CPU was not migratable, but I added recently
the VMSTATE for the CPU.

Thanks,
Laurent

