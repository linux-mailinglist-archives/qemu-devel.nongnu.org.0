Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89B53D3566
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 09:36:38 +0200 (CEST)
Received: from localhost ([::1]:38272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6pja-0007Nd-1A
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 03:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6phy-0005zZ-6a
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 03:34:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6phw-0005My-Dg
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 03:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627025695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9EMVnXaD5lSSIfmg8Qw/mIf8g53tlPMMydzCl9XGFzE=;
 b=S8HD8cVMMUqffPSwesJ6K+8XW81bF3wP5x5elNu8aTmFhLbOQaTg5nSi1GAKlZXhizzj5B
 d9sAluHLHGzxGTw0lT20KRea4fgYlsTWpA1OBuKyzZCTm2OtKU9FZAo9fveRV3SQ4UDked
 fb+kicRXQSDi8/yoiIK9m50GeR92nyU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-9xHoUHtiPvGocDKC8uchuA-1; Fri, 23 Jul 2021 03:34:52 -0400
X-MC-Unique: 9xHoUHtiPvGocDKC8uchuA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r2-20020a05600c35c2b029023a3f081487so492205wmq.4
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 00:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9EMVnXaD5lSSIfmg8Qw/mIf8g53tlPMMydzCl9XGFzE=;
 b=CQaA3J7hCiZpGSZXuZFW+lrDDJaTdcBgdSaHvo1NvSP8V5+/ETt9E+S5QgYgbubojf
 k8XXJm+4/55nCiWO5aCWMRTpbyQZLfSq/XHodGN01C/iZHX2wdCMkwiqpJo4feEAANtS
 6DcjuwgHZYMujHOoZ+kf4dW//OP8qKx4XWchwSA1fOkelCpvnr555mVoKFiEH5Ix19Fi
 dXogqXmQftjlvXG6pgT4avzvtvmniGVHil9ZXcaLoVG8gZud24jb9I+vvEKWXHgoAp7R
 aVJNAsr6QRh27BOrq20YoblcmG3Xs5LMq5aOm942iIyfg2d2MkW5b6wC6GBRwWDjVV1F
 Q0+Q==
X-Gm-Message-State: AOAM533dPZ8OXTN58StaMOUrAqoroYpD9HuA51edmu03uKiXobGDC8SQ
 vmTNCO0OzUuLIo+zzZAynQslFQ8VQ0XUdPj+9Jj7XkqejQXVD7K8XQFH/6IbdFwxUTgbLjxZPtc
 YjAfXr8jh1h/PgiY=
X-Received: by 2002:adf:c102:: with SMTP id r2mr3748478wre.22.1627025691036;
 Fri, 23 Jul 2021 00:34:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyA543J36T/8/z0Y2ahS6m0ajTtoVUDbMjYFTqnS/pQn6psoqSqVLBorAWzVt+Zx1h8a0zRXg==
X-Received: by 2002:adf:c102:: with SMTP id r2mr3748462wre.22.1627025690822;
 Fri, 23 Jul 2021 00:34:50 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id j23sm4222231wmo.26.2021.07.23.00.34.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 00:34:50 -0700 (PDT)
Subject: Re: [PATCH 1/2] qxl: remove assert in qxl_pre_save.
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210721093347.338536-1-kraxel@redhat.com>
 <20210721093347.338536-2-kraxel@redhat.com> <YPmEZnBuCMwXq98p@work-vm>
 <20210723063233.ktjex5knfgz77pbq@sirius.home.kraxel.org>
 <13c8a40f-a879-a981-12f0-36a5289b39b1@redhat.com>
 <20210723065527.glqc44gyga2lnqyc@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0196b381-47ca-fb37-d809-e2a25f3c677e@redhat.com>
Date: Fri, 23 Jul 2021 09:34:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723065527.glqc44gyga2lnqyc@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: armbru@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/21 8:55 AM, Gerd Hoffmann wrote:
> On Fri, Jul 23, 2021 at 08:47:09AM +0200, Philippe Mathieu-Daudé wrote:
>> On 7/23/21 8:32 AM, Gerd Hoffmann wrote:
>>> On Thu, Jul 22, 2021 at 03:44:54PM +0100, Dr. David Alan Gilbert wrote:
>>>> * Gerd Hoffmann (kraxel@redhat.com) wrote:
>>>>> Since commit 551dbd0846d2 ("migration: check pre_save return in
>>>>> vmstate_save_state") the pre_save hook can fail.  So lets finally
>>>>> use that to drop the guest-triggerable assert in qxl_pre_save().
>>>>>
>>>>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>>>>> ---
>>>>>  hw/display/qxl.c | 4 +++-
>>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
>>>>> index 84f99088e0a0..3867b94fe236 100644
>>>>> --- a/hw/display/qxl.c
>>>>> +++ b/hw/display/qxl.c
>>>>> @@ -2283,7 +2283,9 @@ static int qxl_pre_save(void *opaque)
>>>>>      } else {
>>>>>          d->last_release_offset = (uint8_t *)d->last_release - ram_start;
>>>>>      }
>>>>> -    assert(d->last_release_offset < d->vga.vram_size);
>>>>> +    if (d->last_release_offset < d->vga.vram_size) {
>>>>> +        return 1;
>>>>
>>>> It would be great if there was an error_report or something there
>>>> so that we get some idea of what happened.
>>>
>>> Hmm.  Strictly speaking qemu_log_mask(LOG_GUEST_ERROR, "..."); would be
>>> the correct approach here, but I guess that wouldn't help much for
>>> trouble-shooting as the message would only show up with "-d
>>> guest_errors".  So better make that error_report("...") ?
>>
>> It depends who is interested in such errors.
> 
> Migration fails and you want know why.
> 
> Reason migration fails is the guest violates qxl specs (which doesn't
> cause actual problems unless you want migrate the guest).

Then I agree error_report() is better ("Report an error to the current
monitor if we have one, else stderr").


