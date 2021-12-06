Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDFC4692E7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 10:46:51 +0100 (CET)
Received: from localhost ([::1]:60738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muAaA-0004qi-2F
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 04:46:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muAYQ-00043i-LS
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 04:45:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muAYJ-00035G-TB
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 04:45:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638783894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WfYvGMtxpkDncxpxw89ardRg5SfllVNyH3eQeNGyVbU=;
 b=ZtHbaOnoUhY4usUzWtrns4VbhELJrGcgzMj2/ngSLpzzdm4HnWi43+2xqYn/bmtW8HC/Xf
 7ez/FCTZ40JNvGQ3ztoAXnszrLi31uMGBtXo9da4F9MJ+cNVH/2thatCl+/js9kyJnYfYy
 SSYywd4ua1UrWJEIPTbShfocfCNwqX0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-6kS4sxcdNh-VapXVnaEXjQ-1; Mon, 06 Dec 2021 04:44:53 -0500
X-MC-Unique: 6kS4sxcdNh-VapXVnaEXjQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 d7-20020a5d6447000000b00186a113463dso1831986wrw.10
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 01:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=WfYvGMtxpkDncxpxw89ardRg5SfllVNyH3eQeNGyVbU=;
 b=Wr/5NYIVKRebB+DBwfs2Cj/baguCJ8yshAkEePWHsEXHucZ62jMBC1DBLls9haJ+am
 32/BJ8mKEvOjDvV9zv9pmYPjzxokIax9xE6wpBBAy1VGThojAF+eHYbrryz/dV3mXM2o
 u+0Gh7DcdeUPDC+b4D/YXVY3eut//cWGKC6RH0VcOSgT5VWxomU27vlrq0P3dh/N4ksn
 9CWp6279kq9pmlta/i6ndBPej40dKhLzUmlI6QKda2Jd9+3M5D7b/p/QVc00wxAzToke
 Vx6njRxNUsd0Z9iBdD9odbS8zVLnRmPsQnc7CW0ums0yueM4lQTEvAbYnPdhULePudYS
 5vng==
X-Gm-Message-State: AOAM530bkrq3s+7C+nTuof+6iomBjngeyAAjRSar6vvgM+udJugjkFWe
 xgQNUFOk7IbliKeo1UUFmA80FcqB15PgXOBgBb26ZXHnWz6TaHp3xbjCk5o0bwy3U0AkUcCAnh0
 SdIDsfI8BmmFvZ+Q=
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr40783586wrq.94.1638783892217; 
 Mon, 06 Dec 2021 01:44:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJR3ljnQUc10E2L86PgYj4d0x5qkQQxDl1TGPHvUjljmzIP8+13a57x546d58R9XVit5sYLg==
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr40783564wrq.94.1638783892007; 
 Mon, 06 Dec 2021 01:44:52 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id l5sm13800465wrs.59.2021.12.06.01.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 01:44:51 -0800 (PST)
Message-ID: <d27c47cb-e0bb-761a-e613-27be752197ac@redhat.com>
Date: Mon, 6 Dec 2021 10:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: Peter Krempa <pkrempa@redhat.com>
References: <20211206084012.49277-1-thuth@redhat.com>
 <10bc4172-f6c0-504b-cecb-e7caf9edb074@redhat.com>
 <Ya3QltUi9CkqDJEN@angien.pipo.sk>
 <1fd3a291-0970-5a5f-9428-9539afc8559b@redhat.com>
 <Ya3VhFvT0cRfvvXU@angien.pipo.sk>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-7.0] i386: Deprecate the -no-hpet QEMU command line
 option
In-Reply-To: <Ya3VhFvT0cRfvvXU@angien.pipo.sk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.076, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Libvirt <libvir-list@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/12/2021 10.19, Peter Krempa wrote:
> On Mon, Dec 06, 2021 at 10:02:44 +0100, Thomas Huth wrote:
>> On 06/12/2021 09.57, Peter Krempa wrote:
>>> On Mon, Dec 06, 2021 at 09:47:58 +0100, Thomas Huth wrote:
>>>> On 06/12/2021 09.40, Thomas Huth wrote:
>>>>> The HPET setting has been turned into a machine property a while ago
>>>>> already, so we should finally do the next step and deprecate the
>>>>> legacy CLI option, too.
>>>>> While we're at it, add a proper help text for the machine property, too.
>>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>     docs/about/deprecated.rst | 6 ++++++
>>>>>     hw/i386/pc.c              | 2 ++
>>>>>     qemu-options.hx           | 2 +-
>>>>>     softmmu/vl.c              | 1 +
>>>>>     4 files changed, 10 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>>>>> index 5693abb663..1dfe69aa6a 100644
>>>>> --- a/docs/about/deprecated.rst
>>>>> +++ b/docs/about/deprecated.rst
>>>>> @@ -198,6 +198,12 @@ form is preferred.
>>>>>     Using ``-drive if=none`` to configure the OTP device of the sifive_u
>>>>>     RISC-V machine is deprecated. Use ``-drive if=pflash`` instead.
>>>>> +``-no-hpet`` (since 7.0)
>>>>> +''''''''''''''''''''''''
>>>>> +
>>>>> +The HPET setting has been turned into a machine property.
>>>>> +Use ``-machine hpet=off`` instead.
>>>> [...]
>>>>
>>>> Forgot to CC: the libvirt folks, doing so now.
>>>>
>>>> Seems like libvirt is still using -no-hpet in some few spots, so I guess
>>>> these would need to be changed first, before we could finally remove this
>>>> option in QEMU?
>>>
>>> Yes we need to switch to the new property first.
>>>
>>> Is the new way via -machine property by any chance usable with
>>> qemu-2.11? If yes, then we can do it unconditionally, otherwise we'll
>>> need a witness to detect the support for the new flag as a qemu
>>> capability.
>>
>> The machine property has been added just a year ago:
>>
>>   https://gitlab.com/qemu-project/qemu/-/commit/0259c78ca79
>>
>> So it's just available on QEMU v5.2.0 and newer.
> 
> Okay, so we can't unfortunately always use the new way.
> 
> I had a brief look in what libvirt queries to build the capability list
> and unfortunately neither query-command-line-options nor query-machines
> list anything which we could detect.
> 
> Since only the config knob is changing the presence in qom-list-types
> doesn't help either.
> 
> So if qemu want's to deprecate the '-no-hpet' spelling we need something
> which we can detect by one of the above means or other probe command to
> use the new spelling.

I just had another chat with Peter on IRC, and seems like it could be 
detected by running "qom-list-properties" on e.g. the "generic-pc-machine" 
object. However, libvirt does not have that information in their test data 
yet, so it's not a very trivial change to support this in libvirt.
Thus, please don't merge this patch yet, it will currently cause more hassle 
than benefit.

  Thomas


