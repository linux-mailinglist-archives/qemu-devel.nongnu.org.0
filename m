Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 112734B8FC1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:56:44 +0100 (CET)
Received: from localhost ([::1]:38150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOXj-0007Cj-5N
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:56:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKOHb-00037P-NN
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:40:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKOHZ-0000SI-PZ
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:40:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645033200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Wse3h7v20yE/+ft0yWHcC8W21EfM2PRqhajoXrUVYU=;
 b=f+GXklH64sLhQkcM/R/1+ZeOqDqNjZDmftV0gsvj4jms47PqfubvALOl0YmTMATddFoiSU
 5vuH7qZbMDwdoNRG4dhL9pA6MEl3FpcKZzIAkGLSgdepII5sngE2F4CXRciGIjlQEMem/w
 dVmXvyfd0kWp4QJfQVssuIw5qPJEs8s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-q2KOHKPRMdKx1qEYyiTyQg-1; Wed, 16 Feb 2022 12:39:57 -0500
X-MC-Unique: q2KOHKPRMdKx1qEYyiTyQg-1
Received: by mail-wm1-f71.google.com with SMTP id
 j39-20020a05600c1c2700b0037becd18addso720635wms.4
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 09:39:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4Wse3h7v20yE/+ft0yWHcC8W21EfM2PRqhajoXrUVYU=;
 b=PbVm1iiUq9Y6AD2eEQS/ydEl2QRlQNEDdZIn9bkqh3XoyGPcT2DTq8gMPCu4WMIV+4
 jZOi5NTiobIGoaLyQWnmeHc8m+lsBlgIyfG++zzyPpMaoD9NGuewy8PLewtuVV7RAYLr
 ZPL1n99OywLBt09vxnsk+GzMleFTsG+3TSDQnhqx+Mj+uucxaeOh+FCnVKFLMal3DYSX
 80+8gQoJ6D7ee8AUyDoZKvOEY7g4Nzih5BGonHBzQFh5KJ9hcPRQ3/8YW4gZb/a8teC9
 uD2aoK3KTNXYHWg8QCl5OR/6Ar7MsPZ8/ksE9vydcAiOpOFBYkHg3h/5f9Tp0eAQCGG4
 tShQ==
X-Gm-Message-State: AOAM530FXCmOmc9d+8OTIBlRT1pDoI1AudzEVzzUTa4r0K7tHieqDuJu
 lQu5UL9xgLkFflR3rsowGMdhhNXbt400uEChy7AGLVhgb2fc9JC50EHn1bMokkFmeYEHRsBwn/b
 qn50vFZspzs0Xl24=
X-Received: by 2002:a5d:6652:0:b0:1e6:b9ba:f82 with SMTP id
 f18-20020a5d6652000000b001e6b9ba0f82mr3160845wrw.494.1645033196256; 
 Wed, 16 Feb 2022 09:39:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBssGRea1XuM+l5AJYTFsXX1ybFmNws+AeGxqx3CEjRXUUtHTkEkFVSwNhpg8UHInAP1x6IQ==
X-Received: by 2002:a5d:6652:0:b0:1e6:b9ba:f82 with SMTP id
 f18-20020a5d6652000000b001e6b9ba0f82mr3160825wrw.494.1645033196066; 
 Wed, 16 Feb 2022 09:39:56 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id b18sm28834593wrx.92.2022.02.16.09.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 09:39:55 -0800 (PST)
Message-ID: <2af2336b-8a33-1860-5842-95d34263e5fe@redhat.com>
Date: Wed, 16 Feb 2022 18:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: QEMU's Haiku CI image
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 Richard Zak <richard.j.zak@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <c13291ec-ed73-a62d-24bc-e4282aad2031@redhat.com>
 <777cb005f1c2197ff3fd610f89215b4d@unixzen.com>
 <0a36d4b2-965d-84ad-1e04-ab4cd8c437f1@redhat.com>
 <ea30ad98-8e15-7404-c91c-ec475551b866@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ea30ad98-8e15-7404-c91c-ec475551b866@amsat.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/2022 18.16, Philippe Mathieu-Daudé wrote:
> On 16/2/22 17:32, Thomas Huth wrote:
>> On 16/02/2022 16.52, Alexander von Gluck IV wrote:
>>> February 16, 2022 6:31 AM, "Thomas Huth" <thuth@redhat.com> wrote:
>>>>
>>>> while researching the different "sed" options on our supported build 
>>>> platform today, I started
>>>> "make vm-build-haiku.x86_64" in my QEMU build directory for the first 
>>>> time since many months again.
>>>> And I had to discover that this is completely out of date. The image 
>>>> does not contain any version
>>>> of Python 3 yet which we require for compilation since more than a year 
>>>> now already, and the Haiku
>>>> version in there seems to be too old to do a "pkgman install -y python3" 
>>>> ... so this has been
>>>> completely been bitrotting since more than a year now. Is anybody still 
>>>> interested in keeping the
>>>> Haiku support in QEMU? If so, please help to get the VM image updated. 
>>>> Thanks!
>>>
>>> I submitted
>>> https://patchwork.kernel.org/project/qemu-devel/patch/20220216154208.2985103-1-kallisti5@unixzen.com/ 
>>>
>>> to fix this issue.  The build runs as expected after that patchset.
>>>
>>> Likely cause is us no longer packing a "python" binary, deferring to 
>>> "python2" vs "python3"
>>>
>>> I'm still the most likely maintainer.  Are there still plans to automate 
>>> the tests for Haiku to
>>> prevent this from happening again in the future?
>>
>> AFAIK we still don't have a machine where we could properly run VM-based 
>> tests in the CI, do we? Peter? Cleber?
> 
> We still have unused fosshost.org resources. What we don't have is a
> sysadmin willing to install the VM and maintain it over time.

I thought that one does not have KVM enabled?

  Thomas



