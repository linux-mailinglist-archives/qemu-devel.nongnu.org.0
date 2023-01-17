Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFA066DC7E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 12:32:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHkCi-0001kI-KT; Tue, 17 Jan 2023 06:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHkCg-0001jw-JB
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:32:34 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHkCd-0007j8-BH
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:32:33 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so4592662wml.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 03:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6DSid+X6Xlwt+M+LuemuyE6YxNuFj/0MKfUZkPBnaAE=;
 b=lXFFIHiihpkcEZL+v7yxJHKHCAGhGS6lO03wBlgDQaGKkUCFWlAMJVmEExTZHiKO0M
 mhMwbW4Hh0mdNH8tAUMOprD6F/ktM6/Dul3zcLQN/vuwBIYG1AufPUqkbX/AUs6Ew5Yh
 yEc3s44SjpyN0h0+B94ix5NpR4BMr1QJWLsGWkbGd20pp+q41ORpe4ue19jVbmEeUEOq
 RYdOgt9UQLa72rZVw07eSABLXkgWwJQrQYulaMhD3yfBpPtAnYFX6hIpIE2sG62Oe3Kf
 u3JfOYz34mBJF8MX1Xd8etdb4a4Q4H8yxMrvpnzuoFMB0whjWzrLdDrvgNztJWxOnANW
 vXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6DSid+X6Xlwt+M+LuemuyE6YxNuFj/0MKfUZkPBnaAE=;
 b=8A2Vysaal4+Y8+NoIxliCW5wn4oDGya42K+L7X5RrgA2cTG1CYhSwapIUh5pLuwIaY
 3dggOkk3f4MnghrmjCldD7kIeZ1z7n6p1g12V2bMpQuxaoD9BJRz8/MsAoZzV9oIdS5J
 rAhQeQuXFn5PDAHsVSjp7q+5KjNHzX4lq+tot3fDfqC47Oql0sjKzSPfCfivh+tWa54e
 O+UF/WcAwEMEeBefBX4raZ1qXOXXBXpzrvT/JMAgRXDr5RfCNeO+UnY6J10z62okGYW2
 yYFeIDjxy2TgmbuPqMOHS1c/MagrQa46WZE8xUg/UFoOpkypW38JAZg6g9+ymI6kgjl5
 v1YQ==
X-Gm-Message-State: AFqh2koriFFdk9+VYHOjO6h0a0BpRPw8FcvgG3kDiET8x2nhI8Z0UNr6
 9p7lpQQXajAYYx3TzoeT9d8m8g==
X-Google-Smtp-Source: AMrXdXvGuytNG87KdlwYJl+28Z4wmh9qRihMf1dM+nI7gG2bRapjKXmWKWoTr2U0RiG4obigQp7YKA==
X-Received: by 2002:a05:600c:4f86:b0:3db:66e:cfdd with SMTP id
 n6-20020a05600c4f8600b003db066ecfddmr1980335wmq.9.1673955149694; 
 Tue, 17 Jan 2023 03:32:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l24-20020a05600c1d1800b003daf6e3bc2fsm10491820wms.1.2023.01.17.03.32.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 03:32:29 -0800 (PST)
Message-ID: <4b12b445-f8e3-8003-60a2-a5aec0a12026@linaro.org>
Date: Tue, 17 Jan 2023 12:32:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v5] tests/qtest: netdev: test stream and dgram backends
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
References: <20230105093751.416666-1-lvivier@redhat.com>
 <3d55b710-4601-4f8b-5289-72997ea09e5a@redhat.com>
 <0b29c231-da85-5302-31bc-b2e420c2b394@redhat.com>
 <5a13b5c9-f8d4-6b4f-b55b-4b8a0ac54867@redhat.com>
 <a364fceb-66a9-2055-ca61-ac49cf9a8a12@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <a364fceb-66a9-2055-ca61-ac49cf9a8a12@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/1/23 12:03, Laurent Vivier wrote:
> On 1/17/23 11:00, Thomas Huth wrote:
>> On 16/01/2023 09.40, Thomas Huth wrote:
>>> On 16/01/2023 09.29, Laurent Vivier wrote:
>>>> ping
>>>>
>>>> On 1/5/23 10:37, Laurent Vivier wrote:
>>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>

>>> Acked-by: Thomas Huth <thuth@redhat.com>
>>>
>>> I'll queue it for my next pull request (unless someone else wants to 
>>> take this first)
>>
>> Sorry, but I have to unqueue it again. I'm still seeing failures
>> in the Windows Cirrus-CI:
>>
>>   https://cirrus-ci.com/task/5867407370092544
>>
>> For example:
>>
>> 218/556 qemu:qtest+qtest-aarch64 / qtest-aarch64/netdev-socket 
>> ERROR           0.02s   exit status 3
>> ------------------------------------- 8< 
>> -------------------------------------
>> stderr:
>> socket_check_protocol_support() failed
>>
>> (C:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-ci-build/build/tests/qtest/netdev-socket.exe:3300): GLib-CRITICAL **: 09:08:00.984: g_utf8_to_utf16: assertion 'str != NULL' failed
>>
>> (test program exited with status code 3)
>>
>> No clue where this comes from, though, I don't see a call
>> to g_utf8_to_utf16() in your code?
> 
> OK, there is an error in the log:
> 
> socket_check_protocol_support() failed
> 
> So tmpdir is NULL and we try an g_rmdir(tmpdir)

"In case of errors, NULL is returned and error will be set."

I don't see the ""Can't create temporary directory" string in
Thomas' failing job.

In such case, are the g_strconcat(tmpdir) calls returning "\0"?



