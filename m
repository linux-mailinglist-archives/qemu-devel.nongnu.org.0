Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E8758998C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 10:55:10 +0200 (CEST)
Received: from localhost ([::1]:40154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJWdJ-0005Mk-NT
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 04:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJWXE-00085o-RX
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:48:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJWXB-0007fh-Jt
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659602928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NmUfc8c4O46kPMo9yjnneJM51N5ETzaG9cNsADwx6Ac=;
 b=WeihgtJiXRDyzZWVZyGFWtd2dX0h+tBeZYih5hgdP/ODohyDZN4tWIVLQiPYWFoefsIb3I
 hLwchoepOADuSzbyzCBSoXECb00oRTY2mMEDSX+bXa0ay+gO8mQq25vKnbEvB/m9zWtpZr
 Mu35B3AB8m7YIdy1Y7WYiNLgc2J0Kls=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-txIHnsDPOkqkpQFJOyKYdw-1; Thu, 04 Aug 2022 04:48:47 -0400
X-MC-Unique: txIHnsDPOkqkpQFJOyKYdw-1
Received: by mail-wm1-f69.google.com with SMTP id
 az39-20020a05600c602700b003a321d33238so8415686wmb.1
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 01:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NmUfc8c4O46kPMo9yjnneJM51N5ETzaG9cNsADwx6Ac=;
 b=DIFG+GX3whYuB1R9r6VmE2hYrjpUSiZDtWMVMndF0Oc6HgHV5lHjluXvLpAU2akxP4
 42z9a7uZcPFqczYmcVjSZvFFpCPKHMgjj6BvbdkDGD8moHJFZSMo09Fjm8Du2XW3eA71
 G36iA0ooe4byeT22HjtNwKPrxRITq4br7Zl7Blsjb2NCWwajyNObiHp7xEA65RDjuaGh
 CnWLMKUCDl5/R+LBLbLhbQCtleoDitDU3USBXGYLlyqzlX29NJ3uIoebnqoyUriY6OBB
 slY9LNkzBFncU46bjMV/poLTIMytCIEtgyrTai3H+caG3XOLLn57fHR8MtQAGvqDrDO5
 Ukig==
X-Gm-Message-State: ACgBeo3qg3FNzTFqVS+t4v/nX2KSNq1gMVsyPvSchrhxtphhkLkyA9Di
 u4vdb3iIvTAUcq6PAym1z0eGRZrUjSANWS92r0jszqYJ82kmOmtmeH66X3NuC3dsQGjJA7PAygw
 dH9Oi3Muw4bzBA+I=
X-Received: by 2002:adf:f6cb:0:b0:220:7859:7bf with SMTP id
 y11-20020adff6cb000000b00220785907bfmr627507wrp.683.1659602926521; 
 Thu, 04 Aug 2022 01:48:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7lT2akL/ICHZ8zJbtgcUzeAFLzfgw/SgtEOfVe8AfJcG0k7vNuo2QEoSV25AZZLhXn24t44A==
X-Received: by 2002:adf:f6cb:0:b0:220:7859:7bf with SMTP id
 y11-20020adff6cb000000b00220785907bfmr627487wrp.683.1659602926195; 
 Thu, 04 Aug 2022 01:48:46 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-112-229.web.vodafone.de.
 [109.42.112.229]) by smtp.gmail.com with ESMTPSA id
 e12-20020a5d65cc000000b002207a8773b7sm583879wrw.27.2022.08.04.01.48.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 01:48:45 -0700 (PDT)
Message-ID: <9509a07b-7fcc-b0fe-65d7-1d567c5a973a@redhat.com>
Date: Thu, 4 Aug 2022 10:48:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] hw/usb/hcd-xhci: Fix endless loop in case the DMA access
 fails (CVE-2020-14394)
Content-Language: en-US
To: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, f4bug@amsat.org
References: <20220802134834.454749-1-thuth@redhat.com>
 <CAA8xKjUgU=KNbOYhXLkHdhMFLvxwv4rvnTZcLzMQw8TrB-bR6A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAA8xKjUgU=KNbOYhXLkHdhMFLvxwv4rvnTZcLzMQw8TrB-bR6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/08/2022 10.45, Mauro Matteo Cascella wrote:
> On Tue, Aug 2, 2022 at 3:48 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> The XHCI code could enter an endless loop in case the guest points
>> QEMU to fetch TRBs from invalid memory areas. Fix it by properly
>> checking the return value of dma_memory_read().
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/646
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/usb/hcd-xhci.c | 17 +++++++++++++----
>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
>> index 296cc6c8e6..63d428a444 100644
>> --- a/hw/usb/hcd-xhci.c
>> +++ b/hw/usb/hcd-xhci.c
>> @@ -21,6 +21,7 @@
>>
>>   #include "qemu/osdep.h"
>>   #include "qemu/timer.h"
>> +#include "qemu/log.h"
>>   #include "qemu/module.h"
>>   #include "qemu/queue.h"
>>   #include "migration/vmstate.h"
>> @@ -679,8 +680,12 @@ static TRBType xhci_ring_fetch(XHCIState *xhci, XHCIRing *ring, XHCITRB *trb,
>>
>>       while (1) {
>>           TRBType type;
>> -        dma_memory_read(xhci->as, ring->dequeue, trb, TRB_SIZE,
>> -                        MEMTXATTRS_UNSPECIFIED);
>> +        if (dma_memory_read(xhci->as, ring->dequeue, trb, TRB_SIZE,
>> +                            MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
>> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
>> +                          __func__);
>> +            return 0;
>> +        }
>>           trb->addr = ring->dequeue;
>>           trb->ccs = ring->ccs;
>>           le64_to_cpus(&trb->parameter);
>> @@ -727,8 +732,12 @@ static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
>>
>>       while (1) {
>>           TRBType type;
>> -        dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE,
>> -                        MEMTXATTRS_UNSPECIFIED);
>> +        if (dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE,
>> +                        MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
>> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
>> +                          __func__);
>> +            return -length;
> 
> Not strictly related to this issue, but what's the point of returning
> -length instead of e.g. -1? Apart from that, LGTM. Thank you.

Yeah, that's a little bit weird, but it's also what the other spots in this 
function are doing, so I didn't want to diverge from that.

  Thomas


