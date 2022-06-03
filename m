Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BA753CA8B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 15:19:46 +0200 (CEST)
Received: from localhost ([::1]:42372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx7DN-0001OS-A1
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 09:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx7Au-000888-Tj
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 09:17:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx7Ah-0004Cb-6w
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 09:17:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654262157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=655T2+LzeLJp6z6kgiBg05Dllmm9oC9oGUuA2ygFv04=;
 b=EraQwnShpjon3LMqyeiw4xyauAiES79X00aXvZHEbkIbhbofURM7nCMKngFLSYAK5iMreA
 ZqwSfOs7dgKn+3MY8va5ebOemrOd4L9XM7NLVqCdUJzONivmEq00j+P+RlV8Lcjr7Zg/is
 DVPKmbOh2RnzMP6197YR6LJwByVZbfQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-yvkkR83AOMWqw7X_4VlE5g-1; Fri, 03 Jun 2022 09:15:56 -0400
X-MC-Unique: yvkkR83AOMWqw7X_4VlE5g-1
Received: by mail-wm1-f70.google.com with SMTP id
 i30-20020a1c541e000000b0039c1bf9739fso3546808wmb.6
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 06:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=655T2+LzeLJp6z6kgiBg05Dllmm9oC9oGUuA2ygFv04=;
 b=nnLu2b67KsyQRkJFDS0g8SgG5yR3GY12ZmehC9OWQAjY2SJVu2Vrz8T2QRNzA/hSFK
 rI6A7PEsC4pgqG9fQd7f2pLTlqfYnD/p0HyQiAsuLNwj/C68tqC41yb2cALIbNzCVq2o
 jWEpI8dCvil2YsaEEFEMqsVLtLaC1aMf41R0PAfpKRWmEWTAx/YBeKDmO2csQdC2tdq3
 JYrdHoLEtELzTj7BMO4yTj+X/0TPYKUlHI2p918PS9mbV4Gys9m4Q+3fdpI4X76++Pm8
 s1A7x8RjGmI1aEJVxo2ALTVmlBAb44jjzxAy29wnAeSeZwER0H7RjJGe3tUAkexVkfCr
 T8IA==
X-Gm-Message-State: AOAM532zHHTtA0xofxExyk47cYAToK2BxJ73EA3M+ykkIEzLUfq+a+q7
 5YAzzWzexzFUiyGCWFxslpRkM8M12JP6NBCg4PqdDnJcBFLZUOGyKr5fphpEUX2RnHY3ZBswE1I
 Mr6+utHBeiJicoCM=
X-Received: by 2002:a5d:4d07:0:b0:20e:5aa1:3acd with SMTP id
 z7-20020a5d4d07000000b0020e5aa13acdmr8092320wrt.186.1654262155225; 
 Fri, 03 Jun 2022 06:15:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFyW2OJpNdro+11wBwX5bBvt7+8Mpm3I/drC5D/I3/dKraXi2MwWpoUbKpjNQ22qVfS56Rbg==
X-Received: by 2002:a5d:4d07:0:b0:20e:5aa1:3acd with SMTP id
 z7-20020a5d4d07000000b0020e5aa13acdmr8092300wrt.186.1654262154924; 
 Fri, 03 Jun 2022 06:15:54 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-176-98.web.vodafone.de.
 [109.43.176.98]) by smtp.gmail.com with ESMTPSA id
 v190-20020a1cacc7000000b003975c7058bfsm8692188wme.12.2022.06.03.06.15.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 06:15:53 -0700 (PDT)
Message-ID: <0a3e29b2-5dff-94bb-b4f0-f4f2a7859ece@redhat.com>
Date: Fri, 3 Jun 2022 15:15:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Debian MinGW cross compilation (was: Re: [PULL 2/3] qga-win32:
 Add support for NVME but type)
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220523194111.827805-3-kkostiuk@redhat.com>
 <541f46cf-fc45-f7bb-e121-2aad216e11d5@linaro.org>
 <CAPMcbCq7fzubG4ej7p164vwQkCMChjWBubx27R=kVxukWDhuBg@mail.gmail.com>
 <CAPMcbCqeQ_7YuJg+eS9Qqtq9ptRb57_wfT=jGOuHYtx64M5azA@mail.gmail.com>
 <CAMxuvawvaZBp0sxV-jwQuDwxahuFjN10BDcBcgOn88XpN87RPA@mail.gmail.com>
 <f4f5afc8-0b01-e134-bb83-b3d0ded0439a@redhat.com>
 <CAPMcbCr8_zgYcMQ9Q0GSQL-TgvOGY-q16sMoVNxBpvwG4JDEng@mail.gmail.com>
 <449f117b-32c9-e066-55dd-1208313bce3f@redhat.com>
 <CAPMcbCpgyNnggdMTY9K3=nv_BBF8Fbsp_MoAQ6ubeUEA5-aL=A@mail.gmail.com>
 <59b8bdee-ef2f-83b4-fbc7-4283cb964c33@redhat.com>
 <Yozfv2k3dnPy4hEJ@redhat.com>
 <39ab44eb-5115-6af3-37e2-ca79973dad2b@redhat.com>
 <625aa52e-731c-c80c-791f-12ef8a6c5c3d@weilnetz.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <625aa52e-731c-c80c-791f-12ef8a6c5c3d@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/06/2022 15.09, Stefan Weil wrote:
> Am 03.06.22 um 14:56 schrieb Thomas Huth:
> 
>> On 24/05/2022 15.38, Daniel P. Berrangé wrote:
>>> On Tue, May 24, 2022 at 03:28:37PM +0200, Thomas Huth wrote:
>> ...
>>>>
>>>> Daniel, do you remember whether we supported Debian for MinGW
>>>> cross-compilation in the past?
>>>
>>> At one time we used to have Debian with the 3rd party 'mxe' builds
>>> of mingw added. It broke periodically and we deleted it in the
>>> end. It wasn't adding value over what Fedora mingw could provide
>>> as both more or less tracked the same versions of software in
>>> their mingw packages.
>>
>> I wonder whether anybody still tried to compile with this mxe repo in 
>> recent times...?
>> Should we adjust our support statement and just mention Fedora there? 
>> Otherwise we should maybe explicitly mention MXE there next to "Debian", 
>> too, so that people don't get the impression that QEMU can be compiled 
>> with a vanilla MinGW installation on Debian?
>>
>>  Thomas
> 
> 
> My QEMU for Windows builds are all done on Debian. They use the cross tools 
> which are provided in the normal Debian distribution. I don't use the (few) 
> cross libraries from Debian.
> 
> Until end of last year, I added library packages from Cygwin (plus a few 
> self compiled libraries, for example for braille support). See 
> https://qemu.weilnetz.de/debian/.
> 
> In 2022 I switched to using the library packages from msys (I still have to 
> write some documentation for that).

Ok, thanks for the info. Seems like there are multiple ways to get the 
missing packages for the MinGW installation on Debian, so let's simply keep 
the support statement in the current shape.

  Thomas


