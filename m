Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24002C100C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 17:23:15 +0100 (CET)
Received: from localhost ([::1]:41422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khEcU-0000QR-7V
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 11:23:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khEaA-0007vQ-2c
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 11:20:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khEa4-0003l8-G4
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 11:20:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606148441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d96BieSpbYYLUvI015Uw7YfJKlGTJuHqmqaAjZ7UocA=;
 b=OszQORYmz+t0kOI5ZuLEmbtdMS/jAwPuZn0x7A5iVXjlhmXpcZfPTGoDFqB9ySL+4xlLQ9
 +tFJsSW1GjajVLYyJs9cWaqo2qhJ7dC6Wgp6r0ILq18XPEvuHULR2olKJe4QSwMZeevCya
 byfYM9MrN+0LSPxWlIA+e0tnZevZ54Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-6WArALCZN5K5oMheMN6-yw-1; Mon, 23 Nov 2020 11:20:38 -0500
X-MC-Unique: 6WArALCZN5K5oMheMN6-yw-1
Received: by mail-ed1-f69.google.com with SMTP id p24so6750864eds.7
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 08:20:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d96BieSpbYYLUvI015Uw7YfJKlGTJuHqmqaAjZ7UocA=;
 b=lID8CgZV76+X4ZYI52KSQFZljLeAuktyQBRN0zzxWumcNS107IaRhDxQIiFRhsOuBq
 BZfGl63cPZDfiz6VszXMvtGiEdKXzrr0Zfw4xHSfwfTdF01zQM5a51WlVgYzMTZga2xo
 puLBWsf5rcS84edUaserexihg9Y+tfgwZhTu3tKD9iPeMe0n9aRvexnnqNMbZ56J6I1g
 rfMZ1q9PmQvBaIzN5/KtsvKlKnRJbcN+il/oixO1gr6kgs210ni2/grgHZJ1QdrZFnM1
 3ZoKihNm0EaJvz1v6YIsH8YqUItOXzhaH0SY2NypI7LQH1f4V6sxJx7RQ6/QbCa3lz5o
 m4NA==
X-Gm-Message-State: AOAM530017gTqGXL7qopQxNVvRpScNBqddOFSsPfNsfm6wj1YRyrD6hB
 nU3z4WTtkpjwGrHSi76yzTlIJEr0aUp8sDKmzVfqeeqkRgvu3HO+StQHoyrNIy5ReOQ6Jm+xmj1
 xaQKpILyZkAerPlU=
X-Received: by 2002:a17:907:3da3:: with SMTP id
 he35mr333350ejc.9.1606148436064; 
 Mon, 23 Nov 2020 08:20:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfcX5DXlQ4WedLkkMAigVgs+iYfLRVlDTUG78qh/gmGUIxTzpui5YlMOKqLcmZDbDubX2npw==
X-Received: by 2002:a17:907:3da3:: with SMTP id
 he35mr333321ejc.9.1606148435829; 
 Mon, 23 Nov 2020 08:20:35 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cw15sm5226938ejb.64.2020.11.23.08.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 08:20:35 -0800 (PST)
Subject: Re: Regressions in build process introduced since August
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
References: <97b04446-ca94-cebd-2d8d-4c2013521208@weilnetz.de>
 <20201117175030.eqz5run2m7qmx5qt@steredhat>
 <a6c8de1a-da41-1a4a-8907-790c2467a0b0@redhat.com>
 <ee31c6f2-19dd-f3f6-d916-f04490909dd8@weilnetz.de>
 <d69b024e-9762-2b27-b558-0c60b3e96811@weilnetz.de>
 <53da03f4-f044-fb1d-9a1a-a793077cccc3@redhat.com>
 <496e409e-533a-74fb-c4f7-8b394452d0be@weilnetz.de>
 <20201123152839.GJ987095@redhat.com> <20201123154106.GK987095@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <06cdb8fb-7218-c197-30fa-261db68f5e2e@redhat.com>
Date: Mon, 23 Nov 2020 17:20:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201123154106.GK987095@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/11/20 16:41, Daniel P. Berrangé wrote:
> On Mon, Nov 23, 2020 at 03:28:39PM +0000, Daniel P. Berrangé wrote:
>> On Mon, Nov 23, 2020 at 03:40:48PM +0100, Stefan Weil wrote:
>>> Am 23.11.20 um 14:55 schrieb Paolo Bonzini:
>>>
>>>> On 21/11/20 12:09, Stefan Weil wrote:
>>>>> --- a/meson.build
>>>>> +++ b/meson.build
>>>>> @@ -649,9 +649,8 @@ if get_option('vnc').enabled()
>>>>>      vnc = declare_dependency() # dummy dependency
>>>>>      png = dependency('libpng', required: get_option('vnc_png'),
>>>>>                       method: 'pkg-config', static: enable_static)
>>>>> -  jpeg = cc.find_library('jpeg', has_headers: ['jpeglib.h'],
>>>>> -                         required: get_option('vnc_jpeg'),
>>>>> -                         static: enable_static)
>>>>
>>>> Does it work if you just remove "static: enable_static"?  That asks
>>>> Meson to look explicitly for a ".a" file instead of just adding a
>>>> "-ljpeg" flag.  However it is not what configure used to do so it
>>>> shouldn't be necessary.
>>>
>>>
>>> No, that does not help. Neither header file nor library will be found in my
>>> cross environment without using the provided --extra-cflags and
>>> --extra-ldflags, because all those files are installed below
>>> /usr/i686-w64-mingw32/sys-root/mingw or
>>> /usr/x86_64-w64-mingw32/sys-root/mingw which is not searched by the default
>>> compiler settings. The Meson checks obviously don't use those flags.
>>>
>>> pkg-config provides the right paths and works therefore.
>>
>> Relying on pkg-config should be our strong preference. I expect we're doing
>> the old fashioned library check just for historical reasons, but even RHEL-7
>> supports pkg-config for libjpeg. So I think we're safe to just unconditionally
>> rely on pkg-config these days and thus have it "just work" for cross compiles
>> too.
> 
> For that matter I think we can also rely on  pkg-config for sasl too, as
> again all our supported platforms have a new enough cyrus-sasl to have
> a pkg-config file present these days.

Yes, I agree.  However we have at least -lmpathpersist that does not 
have a pkg-config file.  In the meanwhile I'll integrate Stefan's patch. 
  Stefan, is libjpeg the only one that is affected in your build 
environment?

Paolo


