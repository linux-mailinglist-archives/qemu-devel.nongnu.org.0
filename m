Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CB866DCCB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 12:45:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHkOP-0005D3-Tu; Tue, 17 Jan 2023 06:44:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pHkOM-0005Ca-Vf
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:44:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pHkOK-0004FF-QS
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:44:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673955875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hV95RP1TUQ09ah0Uyi+8oq+od2XQ0lHgYfYgQP19ukg=;
 b=Jw+Bh2qwDfFG1+mKm9Lf7/+qA5Y4A5D/O3+xEmHnFvJy7V3TWnXhlpYXcTOP+KJv3RpyOU
 57z6nh/bCGfsOWvuVhj7HLxKbL9m/z5wOvp4BqoSKGPMAFgRV/HW6c3HfnoyMyQa6JI921
 KMGHdaZZegSj8Uv7b1Q/8sej9W/XbCU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-54-wtbbGhrnM-aPAl31WJgrKQ-1; Tue, 17 Jan 2023 06:44:34 -0500
X-MC-Unique: wtbbGhrnM-aPAl31WJgrKQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 h13-20020a05620a244d00b006fb713618b8so22620405qkn.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 03:44:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hV95RP1TUQ09ah0Uyi+8oq+od2XQ0lHgYfYgQP19ukg=;
 b=7jhM4ubSUMXUzkeZf7d3/izl1XkLKnTPpjkEHmxCcqIl2XpuodOpQqinVQl4LFNCCw
 +vauzEzhv15dQgb1lmuzLggjYleoFrGO8BHlQNLvs2JvwCm+Xe2ecGClpm/06pD3av+F
 ld6/gDns3gtktjd2AqzkhQOUK7k46MTJjnOXxjFvyDv/Crt4De5Ii5VxP3pk9IOr/ZCy
 iXi9Sp5LKYs7gjtTnfKwVYF60pxLClw3kEnSj+7y695Fh1oJI4hGUyyxl11AcHnf1tTU
 nFTuLUPRb1p24lHb7kCUluXe1MbmPVsD5BZh2ceOl0W3f3jduUGFNupvLBMV/mWD4S9M
 /TcQ==
X-Gm-Message-State: AFqh2kreTtMR14aWGeNkUXSQtJg6o/gmANJuFC8ReAYqDMKi+rpkzyqI
 iuScdz9/mfpCuSlYXh7pMnv+eSIFMdcta3F2pp90k2oCm8jSaNXQ43Br3efGaz7DP40NKDhCzx4
 07vkYllytOxDCx1g=
X-Received: by 2002:ac8:7a86:0:b0:3b2:d1fe:90c4 with SMTP id
 x6-20020ac87a86000000b003b2d1fe90c4mr3492881qtr.19.1673955874138; 
 Tue, 17 Jan 2023 03:44:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsJgL9y/fUY1cuikMgkaNnY3n2GAr2b03yiBfHQw4798TYTAGMyjYr5gP8ehdcbJIeRnwvPZw==
X-Received: by 2002:ac8:7a86:0:b0:3b2:d1fe:90c4 with SMTP id
 x6-20020ac87a86000000b003b2d1fe90c4mr3492861qtr.19.1673955873868; 
 Tue, 17 Jan 2023 03:44:33 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 q30-20020a05620a025e00b006fc40dafaa2sm19891545qkn.8.2023.01.17.03.44.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 03:44:33 -0800 (PST)
Message-ID: <819db04a-0b00-96e2-65f2-57db1e244fe3@redhat.com>
Date: Tue, 17 Jan 2023 12:44:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5] tests/qtest: netdev: test stream and dgram backends
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
References: <20230105093751.416666-1-lvivier@redhat.com>
 <3d55b710-4601-4f8b-5289-72997ea09e5a@redhat.com>
 <0b29c231-da85-5302-31bc-b2e420c2b394@redhat.com>
 <5a13b5c9-f8d4-6b4f-b55b-4b8a0ac54867@redhat.com>
 <a364fceb-66a9-2055-ca61-ac49cf9a8a12@redhat.com>
 <4b12b445-f8e3-8003-60a2-a5aec0a12026@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <4b12b445-f8e3-8003-60a2-a5aec0a12026@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 1/17/23 12:32, Philippe Mathieu-Daudé wrote:
> On 17/1/23 12:03, Laurent Vivier wrote:
>> On 1/17/23 11:00, Thomas Huth wrote:
>>> On 16/01/2023 09.40, Thomas Huth wrote:
>>>> On 16/01/2023 09.29, Laurent Vivier wrote:
>>>>> ping
>>>>>
>>>>> On 1/5/23 10:37, Laurent Vivier wrote:
>>>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
>>>> Acked-by: Thomas Huth <thuth@redhat.com>
>>>>
>>>> I'll queue it for my next pull request (unless someone else wants to take this first)
>>>
>>> Sorry, but I have to unqueue it again. I'm still seeing failures
>>> in the Windows Cirrus-CI:
>>>
>>>   https://cirrus-ci.com/task/5867407370092544
>>>
>>> For example:
>>>
>>> 218/556 qemu:qtest+qtest-aarch64 / qtest-aarch64/netdev-socket ERROR           0.02s   
>>> exit status 3
>>> ------------------------------------- 8< -------------------------------------
>>> stderr:
>>> socket_check_protocol_support() failed
>>>
>>> (C:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-ci-build/build/tests/qtest/netdev-socket.exe:3300): GLib-CRITICAL **: 09:08:00.984: g_utf8_to_utf16: assertion 'str != NULL' failed
>>>
>>> (test program exited with status code 3)
>>>
>>> No clue where this comes from, though, I don't see a call
>>> to g_utf8_to_utf16() in your code?
>>
>> OK, there is an error in the log:
>>
>> socket_check_protocol_support() failed
>>
>> So tmpdir is NULL and we try an g_rmdir(tmpdir)
> 
> "In case of errors, NULL is returned and error will be set."
> 
> I don't see the ""Can't create temporary directory" string in
> Thomas' failing job.
> 
> In such case, are the g_strconcat(tmpdir) calls returning "\0"?
> 
> 

I'm going to use g_error() on socket_check_protocol_support() failure to exit. Without the 
problem with g_utf8_to_utf16() I would not know the socket_init() function was needed.

Thanks,
Laurent


