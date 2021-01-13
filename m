Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DF62F4BDB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 13:57:23 +0100 (CET)
Received: from localhost ([::1]:44376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzfiE-0001CZ-8M
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 07:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzfgy-0000h1-2I
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 07:56:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzfgv-0006oK-8f
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 07:56:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610542559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HgQnr8OMRtUaMKLra3UBviLbVVg32+UgBl8S110Q81o=;
 b=MU2jTGyXfj+6t0vfRoiAgrdFWViDKBnwEzLzXknH6LKofip+YCSrT+qCe63H8B4oaBfvBe
 toygSR8rqMsVaM+3zDv1A73ax1Rj98VKRlmkJqYCCAhL2mI7vTyn5VzQBfMNibWkw6Y8NY
 9SSp6B4dQKlgIEg6guJ/jE4QU8/Rn7g=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-UiKyO4H8PjWUcoTeiyo3tA-1; Wed, 13 Jan 2021 07:55:57 -0500
X-MC-Unique: UiKyO4H8PjWUcoTeiyo3tA-1
Received: by mail-ej1-f71.google.com with SMTP id ov1so843064ejb.1
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 04:55:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HgQnr8OMRtUaMKLra3UBviLbVVg32+UgBl8S110Q81o=;
 b=C5rHVz5gp+hKHWXk/BKtsQzkQfxLWng+TpILGfL2CNzwqcCgaHYfFiOM4l1k6b+7Y1
 JjHFx11lZmI+2bR/4tmIvheWnYk+Pg2rh6sngakp6CclVM6kJUl8olDaKYWAv9OTZ9qP
 5UIxN/W1QqoOTLBGgMAWqXCAvTf/JgCRPqSXvmrlKEWrS9HRUMGxp0+rhaSf2vH4Tvki
 P1phuD6dPHZjhLEydgX2VwAhuYxQjcHJnbRnG3r4u2pZl6B4PJXemGe4sfvWVGBK7h/X
 KaQ0q2pUX7LIRyliqQXVzkdxXCtkDdPS0aKTfj4YzTFQzen06TUdTNECb8PC+3vUo50e
 41Mg==
X-Gm-Message-State: AOAM532VOwGlfukvM4kPPRfxNKr4t8TkncAbk3YDoq+WgsqDYBQSErZ1
 ylhGAOAwUJwquaT5u83Z9OfRfIo88Qne9MABND/3r9+HqSgy3Xhbe73LW6b3282RH+ramuPzfye
 3YXH7LymkoxsT+XY=
X-Received: by 2002:a05:6402:45:: with SMTP id
 f5mr1640603edu.273.1610542556300; 
 Wed, 13 Jan 2021 04:55:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSU0EcKNtmi7L0mx5nxt2SOJvOBgshLW4nWd532bjufjcBsgLM88hRGUz5c2Weu+WLHpjV3g==
X-Received: by 2002:a05:6402:45:: with SMTP id
 f5mr1640590edu.273.1610542556077; 
 Wed, 13 Jan 2021 04:55:56 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id hr31sm669662ejc.125.2021.01.13.04.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 04:55:55 -0800 (PST)
Subject: Re: [PATCH] scsi: allow user to set werror as report
To: Zihao Chang <changzihao1@huawei.com>, Fam Zheng <fam@euphon.net>
References: <20201103061240.1364-1-changzihao1@huawei.com>
 <33fd8330630defb91feb6c627800a3ca952a4b55.camel@euphon.net>
 <8e53dc93-2312-375e-b67e-4df1b6901890@huawei.com>
 <2130de2b-d1cd-cfb9-51ee-a775e253d4a6@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e7b91a1f-0c7e-25bc-c51c-6240b2982a7b@redhat.com>
Date: Wed, 13 Jan 2021 13:55:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <2130de2b-d1cd-cfb9-51ee-a775e253d4a6@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org, xiexiangyou@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/12/20 03:55, Zihao Chang wrote:
> Ping? This is a fix patch which has been reviewed, whose tree should it go via?
> 
> Thanks
> Zihao
> 
> On 2020/11/3 22:03, Zihao Chang wrote:
>>
>>
>> On 2020/11/3 18:52, Fam Zheng wrote:
>>> On Tue, 2020-11-03 at 14:12 +0800, Zihao Chang wrote:
>>>> 'enospc' is the default for -drive, but qemu allows user to set
>>>> drive option werror. If werror of scsi-generic is set to 'report'
>>>> by user, qemu will not allow vm to start.
>>>>
>>>> This patch allow user to set werror as 'report' for scsi-generic.
>>>>
>>>> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
>>>> ---
>>>>   hw/scsi/scsi-generic.c | 3 ++-
>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
>>>> index 2cb23ca891..2730e37d63 100644
>>>> --- a/hw/scsi/scsi-generic.c
>>>> +++ b/hw/scsi/scsi-generic.c
>>>> @@ -664,7 +664,8 @@ static void scsi_generic_realize(SCSIDevice *s,
>>>> Error **errp)
>>>>           return;
>>>>       }
>>>>   
>>>> -    if (blk_get_on_error(s->conf.blk, 0) !=
>>>> BLOCKDEV_ON_ERROR_ENOSPC) {
>>>> +    if (blk_get_on_error(s->conf.blk, 0) != BLOCKDEV_ON_ERROR_ENOSPC
>>>> &&
>>>> +        blk_get_on_error(s->conf.blk, 0) !=
>>>> BLOCKDEV_ON_ERROR_REPORT) {
>>>>           error_setg(errp, "Device doesn't support drive option
>>>> werror");
>>>>           return;
>>>>       }
>>>
>>> Accepting the report sounds sane to me, it matches what we actually
>>> (always) do. Is the idea to allow users to spell it out explicitly in
>>> the command line?
>>>
>> Actually, qemu supports user to spell it out explicitly in the command
>> line like "enospc", "report" & "action". This patch just allows user to
>> set werror as "report" for scsi-generic, which is a common scenario.
>>
>>> Reviewed-by: Fam Zheng <fam@euphon.net>
>>>
>>> .
>>>
> 

Queued, thanks.

Paolo


