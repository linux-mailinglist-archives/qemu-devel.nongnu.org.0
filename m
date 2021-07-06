Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1752D3BDC56
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:31:41 +0200 (CEST)
Received: from localhost ([::1]:57954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0ov5-0007QO-Np
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0otP-0006Pb-5J
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 13:29:55 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:36855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0otN-0002sV-Nk
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 13:29:54 -0400
Received: by mail-ed1-x52c.google.com with SMTP id h2so29108281edt.3
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 10:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vwnTthueL+L0nV+g+wCnCBJagN+5ACOxRTvRBC7pBsw=;
 b=GpmzTU6OYB5X1dQYxyNnjaQtH8lhLkltFJaDlzNguDMUO24RPMBzAWJR74/l3FbTnD
 gugQiwd5Zse3fD7L9qqVhONdAGeqXZk/jqCh3bQOQGP4onziFVTbyslYLmBHfWQlMKIj
 Ub1KUI1wfZQlEkLtoJ0jSl2jZyE4yEQG3k6cqBUhp9+1y9y4Xz1vxFLpC979g9OC5fc3
 pHLT84squNSkii9vEHstxX37KkGg8GhSgp9NCD6FQdIUMLtQ3QZhvvpJRQr40LjLFF99
 w76xMM8Enq3gkv+qRXB+yc0E8VnhfG6nQbmsZfLIe9F9tGi5kO2AvDPf33as6hhcwTO1
 SwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vwnTthueL+L0nV+g+wCnCBJagN+5ACOxRTvRBC7pBsw=;
 b=X8fYSlPNOdvuMoxaOKLtOvWI59PtDWuQy8PL/lzv6kIKbAM5xG8RVsPCALiFd1Gu1A
 0RcAt7c7cXAdLPeJZlXtHSDm/h6bO6dNnwkbk7DHMfumrogw4TB7vTDLgH1CrtNz+7/B
 dNgerbOjEv+BIl9SLdaLidbdH/bGi70cKWCsq1dBh4YwOWZLLU1qiHcKiAD+DL0ehxid
 m7aLuzJqSzr5IEE+bntWG6ajvSC4YgC2AeMuPu0A5SHgJj8dRbGQCpkepo+04+m0f+Ns
 R2ZuE68PjXLy4xiahnJDg6BBPw9dsBo0J9ax4L/HdBTCWRVDcxaO19a4MoWduTN2VyjU
 23uA==
X-Gm-Message-State: AOAM533NeRFjMnASNfU5+0RXsOqleAmepRc+TMgEBnasjg/BRzOfG0XV
 M3ksDosqqwpiUYsrXBp59hA=
X-Google-Smtp-Source: ABdhPJzzXAdGq+XEt3OmFu0FjcLVoMGZSSlbHP+irHFCikBTpWl7zKUQo/wuipOlSwMKl8BKmzTC3Q==
X-Received: by 2002:a50:cdcb:: with SMTP id h11mr24878528edj.366.1625592592491; 
 Tue, 06 Jul 2021 10:29:52 -0700 (PDT)
Received: from [192.168.135.41] ([195.76.183.18])
 by smtp.gmail.com with ESMTPSA id v6sm1029081ejw.94.2021.07.06.10.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 10:29:51 -0700 (PDT)
Subject: Re: [RFC PATCH 4/6] dp8393x: Store CAM registers as 16-bit
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210703141947.352295-1-f4bug@amsat.org>
 <20210703141947.352295-5-f4bug@amsat.org>
 <8d330b3b-cdae-1325-2bf0-b370705949e8@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <203e8c6c-94ac-e93b-8fa3-1ea64e9195e5@amsat.org>
Date: Tue, 6 Jul 2021 19:29:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8d330b3b-cdae-1325-2bf0-b370705949e8@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/21 4:48 PM, Mark Cave-Ayland wrote:
> On 03/07/2021 15:19, Philippe Mathieu-Daudé wrote:
> 
>> Per the DP83932C datasheet from July 1995:
>>
>>    4.0 SONIC Registers
>>    4.1 THE CAM UNIT
>>
>>      The Content Addressable Memory (CAM) consists of sixteen
>>      48-bit entries for complete address filtering of network
>>      packets. Each entry corresponds to a 48-bit destination
>>      address that is user programmable and can contain any
>>      combination of Multicast or Physical addresses. Each entry
>>      is partitioned into three 16-bit CAM cells accessible
>>      through CAM Address Ports (CAP 2, CAP 1 and CAP 0) with
>>      CAP0 corresponding to the least significant 16 bits of
>>      the Destination Address and CAP2 corresponding to the
>>      most significant bits.
>>
>> Store the CAM registers as 16-bit as it simplifies the code.
>> There is no change in the migration stream.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/net/dp8393x.c | 23 ++++++++++-------------
>>   1 file changed, 10 insertions(+), 13 deletions(-)

>> @@ -987,7 +984,7 @@ static const VMStateDescription vmstate_dp8393x = {
>>       .version_id = 0,
>>       .minimum_version_id = 0,
>>       .fields = (VMStateField []) {
>> -        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 6),
>> +        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 3 * 2),
>>           VMSTATE_UINT16_ARRAY(regs, dp8393xState, 0x40),
>>           VMSTATE_END_OF_LIST()
>>       }
> 
> I'd still be inclined to change VMSTATE_BUFFER_UNSAFE for
> VMSTATE_UINT16_ARRAY whilst you can do it without having to worry about
> the migration stream being already broken, but anyhow:
> 
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Do you want me to squash:

-- >8 --
diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 1d1837dbd38..4c2fa0aabbd 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -951,10 +951,10 @@ static void dp8393x_realize(DeviceState *dev,
Error **errp)

 static const VMStateDescription vmstate_dp8393x = {
     .name = "dp8393x",
-    .version_id = 0,
-    .minimum_version_id = 0,
+    .version_id = 1,
+    .minimum_version_id = 1,
     .fields = (VMStateField []) {
-        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 3 * 2),
+        VMSTATE_UINT16_ARRAY(cam, dp8393xState, 0, 16 * 3),
         VMSTATE_UINT16_ARRAY(regs, dp8393xState, 0x40),
         VMSTATE_END_OF_LIST()
     }
---

Or send it as a new patch?

