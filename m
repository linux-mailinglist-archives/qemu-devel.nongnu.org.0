Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF18367B0A3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 12:08:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKdcB-0005Jt-Ht; Wed, 25 Jan 2023 06:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKdc9-0005Jk-1J
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 06:06:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKdc7-0004Cj-4J
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 06:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674644805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OO2/ZauJ6QROwhcWjYwRaD7ZC8cMKRdGRQWgwUuoHtc=;
 b=OUObUBUl+/F/AYnpEWeSROeiWetrVdO3+XtvRS2wOImXSd6Hperfvx9swOatvWxBgdgDme
 dmLdcyQ7imal78AxcmX+kf2djJ2Ro8LU2ALgQvdlYnFdLA2VULyS/tqEdUBaerVok3B2vf
 Rfwk/0s/VfnEyk4QpkhHZYpu8Ca2AJQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-122-QLIEGLYgOLWsEezE_xv6lw-1; Wed, 25 Jan 2023 06:06:44 -0500
X-MC-Unique: QLIEGLYgOLWsEezE_xv6lw-1
Received: by mail-qt1-f197.google.com with SMTP id
 br26-20020a05622a1e1a00b003b62dc86831so7325567qtb.8
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 03:06:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OO2/ZauJ6QROwhcWjYwRaD7ZC8cMKRdGRQWgwUuoHtc=;
 b=pqqYc29mG40WLEDvozgW6XxFE4/aTH7LbJEkOI9kgPBk41oimuystz2DnQ/kINUqK1
 nmRexjlYW8a5/EnuGElw7oYRZFd9bQC/yK6IyBzWxjawDsWeSdhlkgOTNpjvAsq23sZb
 OfLtQTsdm6+aBOolOlat6qBgsN/UQ4wW8vsj7F1E+/ko8/KdbzUiqSCHINOd0SpzlBO+
 ca64WX/GsVhX4fMEQehq4jcJw7yrre+KyP32Ks/sL9sRX9lztNeElRN0iRifkSOfenfx
 H4dqCODXLQ0k+ypA9OGGY7zBbLy7qhWt87nJcs7ZcC4xqU3tXY3Txi3zxuz3Os3zdHLT
 KF1Q==
X-Gm-Message-State: AFqh2kq2pSfstlnbzeM7L7twQB5uYm+sDLtqk856dEQ7C6NHTMBz8Nt2
 TTVB+F20TNgeWUMZXYnQk87RbaPaEv8IBiLxFA2/JQOG2bJQ6vw4TZe9TVxp4GxunGJytcGo2kp
 78cBjppUIUR9qbNE=
X-Received: by 2002:ac8:6a0e:0:b0:3ab:7928:526c with SMTP id
 t14-20020ac86a0e000000b003ab7928526cmr43496807qtr.17.1674644803603; 
 Wed, 25 Jan 2023 03:06:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu47iEvJYtnPbvDTbb8jwAdOZhs6a1wXOyLadvnJx4F9BEfsZkqtzXt0dcC1Lo5MX/r1OsN/g==
X-Received: by 2002:ac8:6a0e:0:b0:3ab:7928:526c with SMTP id
 t14-20020ac86a0e000000b003ab7928526cmr43496784qtr.17.1674644803338; 
 Wed, 25 Jan 2023 03:06:43 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-209.web.vodafone.de.
 [109.43.178.209]) by smtp.gmail.com with ESMTPSA id
 q126-20020ae9dc84000000b00706adbdf8b8sm3273668qkf.83.2023.01.25.03.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 03:06:42 -0800 (PST)
Message-ID: <a1ce59ee-98ef-eb77-7a46-21cbbe73fd07@redhat.com>
Date: Wed, 25 Jan 2023 12:06:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/2] qapi, audio: add query-audiodev command
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <20230123083957.20349-1-thuth@redhat.com>
 <20230123083957.20349-2-thuth@redhat.com>
 <47d18f28-73b1-af59-ab65-2366ed3da55a@linaro.org>
 <Y85rVoXhR5skLVOz@redhat.com>
 <c94b801d-3c19-24c7-505a-7ab0d98faa67@linaro.org>
 <Y855BSwizi0n+w7r@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Y855BSwizi0n+w7r@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 23/01/2023 13.09, Daniel P. Berrangé wrote:
> On Mon, Jan 23, 2023 at 01:05:45PM +0100, Philippe Mathieu-Daudé wrote:
>> On 23/1/23 12:11, Daniel P. Berrangé wrote:
>>> On Mon, Jan 23, 2023 at 10:20:29AM +0100, Philippe Mathieu-Daudé wrote:
>>>> On 23/1/23 09:39, Thomas Huth wrote:
>>>>> From: Daniel P. Berrangé <berrange@redhat.com>
>>>>>
>>>>> Way back in QEMU 4.0, the -audiodev command line option was introduced
>>>>> for configuring audio backends. This CLI option does not use QemuOpts
>>>>> so it is not visible for introspection in 'query-command-line-options',
>>>>> instead using the QAPI Audiodev type.  Unfortunately there is also no
>>>>> QMP command that uses the Audiodev type, so it is not introspectable
>>>>> with 'query-qmp-schema' either.
>>>>>
>>>>> This introduces a 'query-audiodev' command that simply reflects back
>>>>> the list of configured -audiodev command line options. This alone is
>>>>> maybe not very useful by itself, but it makes Audiodev introspectable
>>>>> via 'query-qmp-schema', so that libvirt (and other upper layer tools)
>>>>> can discover the available audiodevs.
>>>>>
>>>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>>>> [thuth: Update for upcoming QEMU v8.0, and use QAPI_LIST_PREPEND]
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>     qapi/audio.json | 13 +++++++++++++
>>>>>     audio/audio.c   | 12 ++++++++++++
>>>>>     2 files changed, 25 insertions(+)
>>>>>
>>>>> diff --git a/qapi/audio.json b/qapi/audio.json
>>>>> index 1e0a24bdfc..c7aafa2763 100644
>>>>> --- a/qapi/audio.json
>>>>> +++ b/qapi/audio.json
>>>>> @@ -443,3 +443,16 @@
>>>>>         'sndio':     'AudiodevSndioOptions',
>>>>>         'spice':     'AudiodevGenericOptions',
>>>>>         'wav':       'AudiodevWavOptions' } }
>>>>> +
>>>>> +##
>>>>> +# @query-audiodevs:
>>>>> +#
>>>>> +# Returns information about audiodev configuration
>>>>
>>>> Maybe clearer as 'audio backends'?
>>>>
>>>> So similarly, wouldn't be clearer to name this command
>>>> 'query-audio-backends'? Otherwise we need to go read QEMU
>>>> source to understand what is 'audiodevs'.
>>>
>>> The command line parameter is called '-audiodev' and this
>>> query-audiodevs command reports the same data, so that
>>> looks easy enough to understand IMHO.

Should we maybe use a "x-" prefix here if we feel not certain enough about 
this command yet? ... that would still enable the Audiodev part in the qapi 
schema, but give us the flexibility to rename or drop it later in case there 
is some better way to enable the Audiodevs in the schema?

  Thomas


