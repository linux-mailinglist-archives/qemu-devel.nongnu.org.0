Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695D64B9A25
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 08:52:37 +0100 (CET)
Received: from localhost ([::1]:56746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKbad-000581-TV
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 02:52:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKbVI-0002TV-SD
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:47:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKbVF-0004FS-0W
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:47:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645084019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTLXu+FCD37XaR0w9qtaTUF9FlZKBOg455nZZGXwu/I=;
 b=EF6Dcm4EYYL91Oc+SlBta6+t8YkYyi/zA8YFErBF8vHXNmvc1E3oIlbXGt/14Jnf0m17aA
 Agl9InyXKnA6wG6fWpkxMf2tI8iSiz9csv8ICYR2F1jjmz/FtGgg+x+iphtxD238/HXzwN
 z30k1CXw6s+QX4PgN+90jz/EAQCbWfM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461--tbRCvexMsenvkpEKIRq_w-1; Thu, 17 Feb 2022 02:46:58 -0500
X-MC-Unique: -tbRCvexMsenvkpEKIRq_w-1
Received: by mail-wm1-f71.google.com with SMTP id
 a8-20020a7bc1c8000000b0037bc4c62e97so1316832wmj.0
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 23:46:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VTLXu+FCD37XaR0w9qtaTUF9FlZKBOg455nZZGXwu/I=;
 b=VnWYEZ0mENjZtWkpjm+lN61mDHj1+iKOk65J+P0GB9KqXe6a+fTyq/vbYEjhwNznER
 /Uc/1jgr2Ozd4cyAMcQ40w+s26SpPWNZ3avWstTVECTh575kVpRMwNqtHycCubdTK8w5
 jaOid9gKGFXf8KFXpthHHw42EK72te+cWpyBSNQ41l/lo9+bxtgFqEXrlFpCHCJDX0Y+
 Bc7DfbDAOiTU3knpI25bzsNFc1DwadhY4T4UPbXlE2V1DeOgf5CkZWVpN8MNCPnpHZHb
 C7Ahj7b77Q6LyD86+bMTLZzu+XFf1WywG0GYItwDybo2+hopommuZ1LZQJb8w8rHJYyl
 z2mA==
X-Gm-Message-State: AOAM531mss8+ZVF4IRZLeIH0w31c4xWHw128plv2Pq53KFVSo+I5YTDP
 2C7RWM8rIropdtarxyxqt8VO0POVQxtXnKUJ09VEUt7yF7EQLKVX7Ou0muGWstDPbReCdu4moMt
 SYhMXx9ulbRMH3iw=
X-Received: by 2002:a5d:6652:0:b0:1e6:b9ba:f82 with SMTP id
 f18-20020a5d6652000000b001e6b9ba0f82mr1263540wrw.494.1645084016942; 
 Wed, 16 Feb 2022 23:46:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKYjMgMW2tv9k74pUsu8RWgeo4EWsNvBEpsckBR+r8KWU5Yw3n6Xspvfc9K0mMGQyeLu0NBA==
X-Received: by 2002:a5d:6652:0:b0:1e6:b9ba:f82 with SMTP id
 f18-20020a5d6652000000b001e6b9ba0f82mr1263516wrw.494.1645084016637; 
 Wed, 16 Feb 2022 23:46:56 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id i7sm5113548wrf.67.2022.02.16.23.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 23:46:56 -0800 (PST)
Message-ID: <45e4f959-8f04-3baf-5e95-d23ed62e4b27@redhat.com>
Date: Thu, 17 Feb 2022 08:46:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] x86: Switch to q35 as the default machine type
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-4-dgilbert@redhat.com> <YgvtLmoJcv+ZSW1S@redhat.com>
 <20220216105808.77kqhmsagz3ej74h@sirius.home.kraxel.org>
 <YgzZhHKSAFYTYFDc@work-vm> <db583712-cd6e-d67d-ad98-989a9867499a@redhat.com>
 <Yg03HB5KHGYWyI0J@work-vm> <Yg042JzxCjgF2siM@redhat.com>
 <Yg067jLmVM4aIFIq@work-vm>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Yg067jLmVM4aIFIq@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: eduardo@habkost.net, mst@redhat.com, quintela@redhat.com,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/2022 18.57, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
>> On Wed, Feb 16, 2022 at 05:40:44PM +0000, Dr. David Alan Gilbert wrote:
>>> * Thomas Huth (thuth@redhat.com) wrote:
>>>> On 16/02/2022 12.01, Dr. David Alan Gilbert wrote:
>>>>> * Gerd Hoffmann (kraxel@redhat.com) wrote:
>>>>>>     Hi,
>>>>>>> Given the semantic differences from 'i440fx', changing the default
>>>>>>> machine type has effects that are equivalent to breaking command
>>>>>>> line syntax compatibility, which is something we've always tried
>>>>>>> to avoid.
>>>>>>
>>>>>> And if we are fine breaking backward compatibility I'd rather *not* pick
>>>>>> a default, effectively making -M $something mandatory, similar to arm.
>>>>>
>>>>> Oh, that's probably easy to do;  what are other peoples thoughts on
>>>>> that?
>>>>
>>>> I agree with Gerd. Getting rid of a default machine on x86 is likely better
>>>> than silently changing it to q35. But I'd maybe say that this should go
>>>> through the deprecation process first?
>>>
>>> So just adding something like the following under 'System emulator
>>> machines':
>>>
>>> x86 default machine type
>>> ------------------------
>>>
>>> x86 currently defaults to the very old ```pc``` machine type
>>> which is based on the very old ```i440f``` chipset.  This default
>>> will be removed and the user will be required to specify a machine
>>> type explicitly using -M; users are encouraged to switch to the
>>> not quite as old ```q35``` machine types.
>>>
>>>
>>> (This option is going to take a lot more work switching all the
>>> test cases over; in my world here I'd only changed the tests that broke
>>> on q35, now everything is going to need to specify a type).
>>
>> ....which is still nothing compared to how many users will be impacted
>> and the docs all over the internet we'll never be able to change, which
>> give illustrations using qemu command lines without '-M pc'
> 
> What's your prreference - it sounds like you'd prefer to leave the
> default as 'pc' ?
> 
> aarch's message is:
> qemu-system-aarch64: No machine specified, and there is no default
> Use -machine help to list supported machines
> 
> We could add a:
> 'Use -machine pc for the old default behaviour'

Sounds like a good idea, but then I'd also do:

'Use -M pc for the old default behaviour, or -M q35 for a more modern 
machine' or so.

  Thomas



