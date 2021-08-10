Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BD53E5281
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:59:07 +0200 (CEST)
Received: from localhost ([::1]:33822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJqu-0001VG-Sw
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDJqA-0000qJ-75
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 00:58:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDJq7-0002y3-E8
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 00:58:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628571490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fR+nW1zElCkUKeVXc1nwa1fkOoOHfW/VJcRn9mkvTeo=;
 b=BF7jgQavNkxQmURXHWfrbQcSqm0K61d8M9EI+z95Zl5S6qQYQANCkLHnAvWUOGj7sYOMhY
 6Z6pUZui/iHn3XNBhX6h53LLiWJCgoqMDEYzt3t36wau368EsJGauOGkgsDaB54kHmObSj
 LVBnnc+JS0zM6sKBXswx0RiAzq7ZUH8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-R4tgMUYqOSCdhmlGetqkeA-1; Tue, 10 Aug 2021 00:58:09 -0400
X-MC-Unique: R4tgMUYqOSCdhmlGetqkeA-1
Received: by mail-wr1-f70.google.com with SMTP id
 z1-20020adfdf810000b0290154f7f8c412so1064979wrl.21
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 21:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fR+nW1zElCkUKeVXc1nwa1fkOoOHfW/VJcRn9mkvTeo=;
 b=LsvJ+OiP3yWRk0+IVXtEHLNAW8NnfQ9U2SY9jMz+oLP0LVK/K2mZuUMA33WoTOue+m
 7xKxZ5oMg2xJY5uI/yr8R3mm1NibPwGKIAZvhsVB7gDE3ARrANOqL5Naqjr9fiPW2QiL
 NQ7MagR4z71Qn0M0usbvPS1salwwkjQHQdpWtXmLrkhRUeBbKytsmOKZs8tfbiJQC1yk
 dYkyCS1Fq6Z3IwwGCxnUFx7KToHriz0pXf42oLYFK6noM5ODaxHTxO75ljnQ8iimxony
 yb8lyaAeQmbZz58V1OYEeUYlNcXYccjPblGi2RQJ7y2hOpXe5QS5J9gFSJx+bJ5SI0we
 digw==
X-Gm-Message-State: AOAM5305DQiqVPtT/btfPvCbzOChfuNuVUxh7WEGFWOtfguE7D8NicGE
 IQykc2RWMqAVY9JPylTz9Mp9z+pSLcmKYqHmKIrZE8AfwpMnIAh55cxgNuUB7NivsZ7E7l4N3c/
 0rtnRDzDscbr7wKo=
X-Received: by 2002:adf:f08e:: with SMTP id n14mr7386685wro.427.1628571487888; 
 Mon, 09 Aug 2021 21:58:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgAoKf5bMafkpHTWYiBg2koAPxcA4h3P1YSmqhvJaL5EInvAKpBx7GFc8vb1m1mzXezxZfFg==
X-Received: by 2002:adf:f08e:: with SMTP id n14mr7386662wro.427.1628571487625; 
 Mon, 09 Aug 2021 21:58:07 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id 129sm19742413wmz.26.2021.08.09.21.58.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 21:58:07 -0700 (PDT)
Subject: Re: [PATCH] audio: Never send migration section
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
References: <20210809170956.78536-1-dgilbert@redhat.com>
 <YRFiDMlKFQ/Kxrhx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bedb4670-4e44-2d69-c611-3bf3bdce6587@redhat.com>
Date: Tue, 10 Aug 2021 06:58:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRFiDMlKFQ/Kxrhx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kraxel@redhat.com, qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 7:12 PM, Daniel P. Berrangé wrote:
> On Mon, Aug 09, 2021 at 06:09:56PM +0100, Dr. David Alan Gilbert (git) wrote:
>> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>>
>> The audio migration vmstate is empty, and always has been; we can't
>> just remove it though because an old qemu might send it us.
>> Changes with -audiodev now mean it's sometimes created when it didn't
>> used to be, and can confuse migration to old qemu.

Not a 6.1 regression but easy change for rc3 IMO.

>> Change it so that vmstate_audio is never sent; if it's received it
>> should still be accepted, and old qemu's shouldn't be too upset if it's
>> missing.

Worth Cc: stable@ maybe?

>> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> ---
>>  audio/audio.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Tested-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> 
> For testing I have a VM with -audiodev, but *WITHOUT* any sound
> frontend devices. Live migrating to a QEMU using QEMU_AUDIO_DRV
> would previously fail. With this applied it now works, showing
> that we dont uncessarily send this.
> 
> I also tested migration to a QEMU with -audiodev, but without
> this patch, and that still works as before, showing that QEMU
> is happy if this section is not sent.
> 
>>
>> diff --git a/audio/audio.c b/audio/audio.c
>> index 59453ef856..54a153c0ef 100644
>> --- a/audio/audio.c
>> +++ b/audio/audio.c
>> @@ -1622,10 +1622,20 @@ void audio_cleanup(void)
>>      }
>>  }
>>  
>> +static bool vmstate_audio_needed(void *opaque)
>> +{
>> +    /*
>> +     * Never needed, this vmstate only exists in case
>> +     * an old qemu sends it to us.
>> +     */
>> +    return false;
>> +}
>> +
>>  static const VMStateDescription vmstate_audio = {
>>      .name = "audio",
>>      .version_id = 1,
>>      .minimum_version_id = 1,
>> +    .needed = vmstate_audio_needed,
>>      .fields = (VMStateField[]) {
>>          VMSTATE_END_OF_LIST()
>>      }
>> -- 
>> 2.31.1
>>
> 
> Regards,
> Daniel
> 


