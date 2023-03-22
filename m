Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB91B6C4F71
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:30:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf0P5-0003Lj-9u; Wed, 22 Mar 2023 11:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pf0Oy-0003EQ-Gg
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:29:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pf0Ow-0003zn-Vx
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679498962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jJavURMZISrH7yUwJw/8LVU5lNa69B0cvDZCmj2DXeI=;
 b=cDcYdMkJArekI4gQ66c5lE0L5tQ74Y0112SbZhLmsmfnrWNxk4k5KPSv4yO9Oj0gYDCIr6
 ruuxIPsRZ+f++FpE63uue0C8olzddDi+XxotxpZBihAxW1qNwmXcqDWvzn9YG3bFM7OlKH
 RCMdwYQgbXm+Ff58tufvAVfR3mph2o0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-vo8iSSbmNpOtTzLuAiqhmQ-1; Wed, 22 Mar 2023 11:29:21 -0400
X-MC-Unique: vo8iSSbmNpOtTzLuAiqhmQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 p19-20020ac87413000000b003d2753047cbso11080987qtq.19
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679498960;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jJavURMZISrH7yUwJw/8LVU5lNa69B0cvDZCmj2DXeI=;
 b=u90l3/j3DLG0dznHc+exkE9fEW3A5CSy7icc+MGt3ALs+qI1A0ScX2YPZfby4929qo
 tmsXF4veAbxV0rx9kiRGvuJRfnoIPC6fbgOGuLEkd/1y1T5Kn1doW7ScxP4mLEWU2eE4
 JDuL0Z7aGlEIL8HZX7dcal5Kax14Z1hrQ0oStPABsknowp+Jb/lv2iIrkHD1xp1JTHeS
 YTLNNkcWBmoDOOoNFjEL2ruyUDbNyicYECZfTnRMOUj1yIb2DYixQdCNf53SCdP9sFy1
 1xyR2DFXaj93sMQr1JNtNxmrtv3Htm6HyYa99KOx2zPh9r5p3OvpWz/hCgZOJIzRCfGm
 bzsQ==
X-Gm-Message-State: AO0yUKUX+hjXi/ueEw/7eloYmpnimbvArFlS5DEXbNU+tt8S4l8abL6L
 V5AWtMzspLXJ8eom9RtS+9R6lJi2wli2orkGconkykpAHwO2igI2yENED9lfNzEz9o+Rnyjp7iF
 9UMgiEXM9FHHRrbo=
X-Received: by 2002:ad4:5948:0:b0:5ba:168d:d3fc with SMTP id
 eo8-20020ad45948000000b005ba168dd3fcmr5221007qvb.4.1679498960431; 
 Wed, 22 Mar 2023 08:29:20 -0700 (PDT)
X-Google-Smtp-Source: AK7set/k6Xsl+xr0RzzZyRGLikiJz9YyF7cK3M2OUgRa7ugFknIr1BMGgtSrnHqJhbH3IZgxYqCEqA==
X-Received: by 2002:ad4:5948:0:b0:5ba:168d:d3fc with SMTP id
 eo8-20020ad45948000000b005ba168dd3fcmr5220975qvb.4.1679498960121; 
 Wed, 22 Mar 2023 08:29:20 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-44.web.vodafone.de.
 [109.43.177.44]) by smtp.gmail.com with ESMTPSA id
 s10-20020a05620a16aa00b0074341cb30d0sm11358398qkj.62.2023.03.22.08.29.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 08:29:19 -0700 (PDT)
Message-ID: <be5942ad-d213-9229-c7e5-4b310f603443@redhat.com>
Date: Wed, 22 Mar 2023 16:29:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] tests/vm: skip X11 in openbsd installation
Content-Language: en-US
To: Brad Smith <brad@comstyle.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230322123639.836104-1-berrange@redhat.com>
 <20230322123639.836104-2-berrange@redhat.com>
 <d8fe0d24-03ee-4c4a-6886-36319eaa2948@linaro.org>
 <c3c944e3-f7e6-1ec2-5a18-e694d4c9c842@redhat.com>
 <1d0081e1-1a01-037b-1317-947acf43a78d@comstyle.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <1d0081e1-1a01-037b-1317-947acf43a78d@comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 22/03/2023 16.20, Brad Smith wrote:
> On 2023-03-22 9:40 a.m., Thomas Huth wrote:
>> On 22/03/2023 14.38, Philippe Mathieu-Daudé wrote:
>>> On 22/3/23 13:36, Daniel P. Berrangé wrote:
>>>> As a VM used only for automated testing there is no need to
>>>> install the X11 stack.
>>>>
>>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>>> ---
>>>>   tests/vm/openbsd | 3 +--
>>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git a/tests/vm/openbsd b/tests/vm/openbsd
>>>> index eaeb201e91..6af7afac0d 100755
>>>> --- a/tests/vm/openbsd
>>>> +++ b/tests/vm/openbsd
>>>> @@ -106,8 +106,7 @@ class OpenBSDVM(basevm.BaseVM):
>>>>           self.console_wait("Password for root account")
>>>>           self.console_send("%s\n" % self._config["root_pass"])
>>>>           self.console_wait_send("Start sshd(8)", "yes\n")
>>>> -        self.console_wait_send("X Window System", "\n")
>>>> -        self.console_wait_send("xenodm", "\n")
>>>> +        self.console_wait_send("X Window System", "no\n")
>>>
>>> Wasn't this useful to link a X11-ready binary, even if only testing
>>> with -display=none?
>>
>> tests/vm/openbsd later installs sdl2 and gtk+3, so I assume that will pull 
>> in the required libraries if necessary, without all the other 
>> non-necessary stuff.
> 
> No, it will not. If you want sdl2 / gtk+3 you have to have X enabled.

I meant for compiling, not for running QEMU... and we're only running in 
non-graphical mode here later, so I hope that should be fine.

  Thomas


