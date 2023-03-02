Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8016A80EE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:20:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXgyN-00077O-4N; Thu, 02 Mar 2023 06:19:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXgyL-00077C-GG
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:19:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXgyI-0004Vs-Nh
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:19:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677755977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ikM8Qdt6lDU7Qjo0jHduF9YltvPcv+t/0tlZq+3y10=;
 b=dytu40Mi5eWj/sl/TfoV3O5YMmquNHr7sRJLtMONzhZCRBfTU1EKWgUTtYEyJe2iSLaNtI
 1r0StINj753VdaWtR/+yv/2QAZ9eNcnLPqboCAVloHTLhvHXRwm2DGpdZGnw6wjGfyhK/N
 KmEAxe60dS5XjpXmyPifFqqv+rCnmjQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-wUq1LF8-O4i1eyd_RN-wjA-1; Thu, 02 Mar 2023 06:19:36 -0500
X-MC-Unique: wUq1LF8-O4i1eyd_RN-wjA-1
Received: by mail-wr1-f69.google.com with SMTP id
 l14-20020a5d526e000000b002cd851d79b2so1958585wrc.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 03:19:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5ikM8Qdt6lDU7Qjo0jHduF9YltvPcv+t/0tlZq+3y10=;
 b=1/Tb114Ga9D60CJ4mXuUE/afI3SB7vAYqjgY7EWKhpf+7mV/BB8KRF7SXmvYYFCZqv
 +LuvPbe7RBlv8PCmDAzdKZb0PRntqnVVP/SRPW4ECPkD8irSIMiDgjSrv9DYPr6nFXnv
 O9ZTs2XwkyWjkaqDoGizr9ryWecvFtmzQIuyMYtdzMlIWd+cfbjrP2ig1fq3zKSM77Jw
 1iX8V04MO9AkoAS2XbG/WwRBk8f9rk5Ou8YQ1hClvtuCLaYsP8+U4VAf0PoBGao4JzSC
 dlGmlDSHIV+WFkFlKtA858pAS5iuY7yywWSxBWzE/8k1vzqd7yh3/RkqGjkkhjeC6Op5
 tLeQ==
X-Gm-Message-State: AO0yUKVsFfQ2OkclfwzdCz1H6V7g6OUYTkdS0anpmLF39FWsFflV87Pi
 a90ZgRHfi5XBenU8S96yXemZZ9bD4seuNhHub69tNolWtO3GYp2gqrJUCh0rbe6RFIJstpodd7b
 ExW/fexI+LawMAVY=
X-Received: by 2002:a5d:58fa:0:b0:2c5:a07e:4bb6 with SMTP id
 f26-20020a5d58fa000000b002c5a07e4bb6mr6927650wrd.33.1677755975091; 
 Thu, 02 Mar 2023 03:19:35 -0800 (PST)
X-Google-Smtp-Source: AK7set8iyTWKB4MMVbZ1zB4s9ORGxHdGaLhIaWhbBmJlClW2d2p9CmgtGWSucfe8/aT2VGzNJ4kTww==
X-Received: by 2002:a5d:58fa:0:b0:2c5:a07e:4bb6 with SMTP id
 f26-20020a5d58fa000000b002c5a07e4bb6mr6927636wrd.33.1677755974823; 
 Thu, 02 Mar 2023 03:19:34 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-83.web.vodafone.de.
 [109.43.179.83]) by smtp.gmail.com with ESMTPSA id
 t11-20020a05600c450b00b003dc47d458cdsm2906686wmo.15.2023.03.02.03.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 03:19:34 -0800 (PST)
Message-ID: <06d20492-7624-942d-dc2f-8a9e6edecc2d@redhat.com>
Date: Thu, 2 Mar 2023 12:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL v2 00/24] testing updates (gitlab, cirrus, docker, avocado, 
 windows)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
 <CAFEAcA_ok_VSAWk2uqhTs5sF2y3C_JmBNkb8HUGMX6ZX-xdVoA@mail.gmail.com>
 <87356ocp56.fsf@linaro.org>
 <CAFEAcA9X9nQ-6iYqGV9fWWmzDU_SE1ADed6xToOoDmMbvEBkuA@mail.gmail.com>
 <CAHDbmO19_HT7ZgtdvWfzp-BEn3uyhw7NKAW9f9adSHoaZ1mEug@mail.gmail.com>
 <CAFEAcA-Pve7oOuDmP=BDSt5Smdn8MUg2y47Y6PL3YMXwg=Q4Sw@mail.gmail.com>
 <eb6e47c4-546e-b191-d142-009b52b1e3fa@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <eb6e47c4-546e-b191-d142-009b52b1e3fa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 02/03/2023 12.15, Philippe Mathieu-Daudé wrote:
> On 2/3/23 11:56, Peter Maydell wrote:
>> On Wed, 1 Mar 2023 at 19:47, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
>>>  From the other thread:
>>>
>>> I think the underlying config needs updating:
>>>
>>>    .git/modules/tests/fp/berkeley-testfloat-3/config
>>>
>>> I'm surprised the git config for submodules doesn't carry the metadata.
>>
>> Yeah, in my local repo that I merge stuff with that file
>> does still have a github URL:
>> url = git://github.com/cota/berkeley-testfloat-3
>>
>> So I guess my questions are:
>>   (1) why hasn't this been a problem up til now ?
>>   (2) does this mean that if I merge this then everybody will
>>       need to manually go in and update this file somehow
>>       to be able to pull the updated qemu master ?
> 
> I assume you are not passing --disable-git-update or
> --with-git-submodules to ./configure.
> 
> I am not, and each time I run 'make' it annoyingly calls 'git
> submodule update':
> 
> $ make check-qtest
>    GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 
> tests/fp/berkeley-softfloat-3 dtc
> 
> Maybe we should also call 'git submodule sync' first?

Another idea: Since we diverged with the softfloat repo from upstream anyway 
in our mirror, maybe we should simply ditch the submodule idea here and copy 
the code over into the main repository? ==> No more submodules, no more 
pain! ;-)

  Thomas


