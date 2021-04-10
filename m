Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8703535ADE0
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 15:59:24 +0200 (CEST)
Received: from localhost ([::1]:33238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVE8x-00055s-KB
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 09:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lVE85-0004Ye-5E; Sat, 10 Apr 2021 09:58:29 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lVE7y-0004fI-TO; Sat, 10 Apr 2021 09:58:25 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so6423255wmq.1; 
 Sat, 10 Apr 2021 06:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U7sYieoZDePJPROblq1TH5YHbyZIX5uFuIVOJIr4+wY=;
 b=ed5bWRENJFuWaFDafjIeIhECVefLbDRx0FQTtUE0bmomQfTDiQBycCsJAICp3252Y6
 X+xeWKslnDLSgEJbAc8TXSQ/sScLcaTUkmsL9WgzdaKG+GKxTOUCM+EDVXjvzQoJ4mT1
 a2NCcy8cD5Aw7TL9XqR0UsokjV078NEsJgRBiXrWZ7b2khYNFCk63VDir1OWYyM8GVwd
 2xKR4nZayDZsEPq8EP4/SECENywyxZ1e8bDYvKrfUfmPXWLR/DfD4y6aw121PDpI+fgV
 pVtD9AaX2i1ZbnTrvEC8UD74Y1tUlayLkYWxnHF273vfHeNJDRz1hQJ1syUUbb6O2Sdv
 SD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U7sYieoZDePJPROblq1TH5YHbyZIX5uFuIVOJIr4+wY=;
 b=ucdz0qfn8kw/ksuzo91gxpDrVfCBxv8bJu1OdbuIQgjNpKzrGQVmuE185UoF+OC3BL
 1lEzUxRmf+uvsApN/v5AvvaEsiLqquTLAYq5WpU9XLwr1KKl1tCgUA1IKfer1w3SqmLC
 xkNGePMST+TrBXU1ait3oqdNhLN1/EfRHr03HZ43Ha6ZMs+Z77igYNGF5BTzI2E9LcR6
 uGwCxxRN0QXKcDF9W4zgKTtZ90iNGC7qyqzSIb0uA1Fohx1aXAQrMkJjmV0hCoCLPMep
 2q4OU+kJx0WgVJiMn7iF1oM94/O1h3HxFBcXMrt4fZ/HsHv32xlALUf3U0QE8VuP0nv1
 fKGw==
X-Gm-Message-State: AOAM530SlQZy3EkXEZGAOnAKV6inas+C/OA5bp2lh1iRttw+iVypmBQW
 CKVXbtIsWFnMPiZF6XaQumdnPLTqdX0QUQ==
X-Google-Smtp-Source: ABdhPJxTU0hi90ygd1TS7uNSrF4B5FtF8bpy7qXkVdM22KYQ4uFnoBuHvqQQx3alBvnYoaUAIfvj8Q==
X-Received: by 2002:a05:600c:4103:: with SMTP id
 j3mr18347062wmi.175.1618063099974; 
 Sat, 10 Apr 2021 06:58:19 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o12sm9567455wrj.34.2021.04.10.06.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Apr 2021 06:58:19 -0700 (PDT)
Subject: Re: [PATCH for-6.0] esp: fix setting of ESPState mig_version_id when
 launching QEMU with -S option
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>, David Alan Gilbert
 <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210407124842.32695-1-mark.cave-ayland@ilande.co.uk>
 <0cadef46-d80c-6f09-bc36-9b8872fc9009@redhat.com>
 <94bdaba6-2a2e-13c3-297b-5312cbdcb455@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f20f0dcb-f7e8-93a8-0698-41c0b30ca0be@amsat.org>
Date: Sat, 10 Apr 2021 15:58:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <94bdaba6-2a2e-13c3-297b-5312cbdcb455@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/10/21 10:31 AM, Mark Cave-Ayland wrote:
> On 10/04/2021 06:56, Thomas Huth wrote:
> 
>> On 07/04/2021 14.48, Mark Cave-Ayland wrote:
>>> If QEMU is launched with the -S option then the ESPState
>>> mig_version_id property
>>> is left unset due to the ordering of the VMState fields in the
>>> VMStateDescription
>>> for sysbusespscsi and pciespscsi. If the VM is migrated and restored
>>> in this
>>> stopped state, the version tests in the vmstate_esp
>>> VMStateDescription and
>>> esp_post_load() become confused causing the migration to fail.
>>>
>>> Fix the ordering problem by moving the setting of mig_version_id to a
>>> common
>>> esp_pre_save() function which is invoked first by both sysbusespscsi and
>>> pciespscsi rather than at the point where ESPState is itself
>>> serialised into the
>>> migration stream.
>>>
>>> Buglink: https://bugs.launchpad.net/qemu/+bug/1922611
>>> Fixes: 0bd005be78 ("esp: add vmstate_esp version to embedded ESPState")
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>>   hw/scsi/esp-pci.c     | 1 +
>>>   hw/scsi/esp.c         | 7 ++++---
>>>   include/hw/scsi/esp.h | 1 +
>>>   3 files changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
>>> index c3d3dab05e..9db10b1a48 100644
>>> --- a/hw/scsi/esp-pci.c
>>> +++ b/hw/scsi/esp-pci.c
>>> @@ -332,6 +332,7 @@ static const VMStateDescription
>>> vmstate_esp_pci_scsi = {
>>>       .name = "pciespscsi",
>>>       .version_id = 2,
>>>       .minimum_version_id = 1,
>>> +    .pre_save = esp_pre_save,
>>>       .fields = (VMStateField[]) {
>>>           VMSTATE_PCI_DEVICE(parent_obj, PCIESPState),
>>>           VMSTATE_BUFFER_UNSAFE(dma_regs, PCIESPState, 0, 8 *
>>> sizeof(uint32_t)),
>>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>>> index 3b9037e4f4..0037197bdb 100644
>>> --- a/hw/scsi/esp.c
>>> +++ b/hw/scsi/esp.c
>>> @@ -1089,9 +1089,10 @@ static bool esp_is_version_5(void *opaque, int
>>> version_id)
>>>       return version_id == 5;
>>>   }
>>> -static int esp_pre_save(void *opaque)
>>> +int esp_pre_save(void *opaque)
>>>   {
>>> -    ESPState *s = ESP(opaque);
>>> +    ESPState *s = ESP(object_resolve_path_component(
>>> +                      OBJECT(opaque), "esp"));
>>>       s->mig_version_id = vmstate_esp.version_id;
>>>       return 0;
>>> @@ -1127,7 +1128,6 @@ const VMStateDescription vmstate_esp = {
>>>       .name = "esp",
>>>       .version_id = 5,
>>>       .minimum_version_id = 3,
>>> -    .pre_save = esp_pre_save,
>>>       .post_load = esp_post_load,
>>>       .fields = (VMStateField[]) {
>>>           VMSTATE_BUFFER(rregs, ESPState),
>>> @@ -1317,6 +1317,7 @@ static const VMStateDescription
>>> vmstate_sysbus_esp_scsi = {
>>>       .name = "sysbusespscsi",
>>>       .version_id = 2,
>>>       .minimum_version_id = 1,
>>> +    .pre_save = esp_pre_save,
>>>       .fields = (VMStateField[]) {
>>>           VMSTATE_UINT8_V(esp.mig_version_id, SysBusESPState, 2),
>>>           VMSTATE_STRUCT(esp, SysBusESPState, 0, vmstate_esp, ESPState),
>>> diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
>>> index 95088490aa..aada3680b7 100644
>>> --- a/include/hw/scsi/esp.h
>>> +++ b/include/hw/scsi/esp.h
>>> @@ -157,5 +157,6 @@ void esp_hard_reset(ESPState *s);
>>>   uint64_t esp_reg_read(ESPState *s, uint32_t saddr);
>>>   void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val);
>>>   extern const VMStateDescription vmstate_esp;
>>> +int esp_pre_save(void *opaque);
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>
>> Which tree should this patch go through? Your Sparc tree? Migration?
>> Scsi? Trivial?
> 
> Previously I've considered the ESP patches to be SCSI, although the
> large ESP patchset was given approval to go via another tree which is
> why that was eventually merged via qemu-sparc.
> 
> I don't mind doing the same again although I'm still waiting for the
> final nod for this and the ESP security fixes for 6.0 (see
> https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg01479.html).
> 
> Thoughts/other ideas?

It makes sense to have this go via the SCSI tree, but the maintainers
are pretty busy (you forgot to Cc Fam in both series). Maybe with an Ack
from them you could take the ESP patches via the SPARC tree?

Regards,

Phil.

