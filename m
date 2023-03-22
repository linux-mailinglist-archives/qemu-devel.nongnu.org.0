Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE226C4A74
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 13:27:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pexY7-0002Jy-1z; Wed, 22 Mar 2023 08:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pexY4-0002JM-Jk
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:26:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pexY2-0005lk-T2
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679487991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qoYZDcts4NPPigQVTA+A5GeGdwQbf9UjsqltNaFuRak=;
 b=Tmz0CefPBG8BBgxIgXJQ57N31PHpuiYeUREyPOky9A41RMOYYg5UWHr6x7i6FAqNz25SaC
 07DL0JeU+KnrNsfavVzs1A00UDO8COZLgw14NDFJtsn8x1KAWyAKr4UV7i2j2ESuZvCAne
 FLsc/QBgVzD/Mcw0y5VRxOJffa4OGaI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-pcQxP2CqO3OVqVORBJy_iQ-1; Wed, 22 Mar 2023 08:26:28 -0400
X-MC-Unique: pcQxP2CqO3OVqVORBJy_iQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 px9-20020a056214050900b005d510cdfc41so1926422qvb.7
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 05:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679487988;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qoYZDcts4NPPigQVTA+A5GeGdwQbf9UjsqltNaFuRak=;
 b=aPIjU0hkAmEaE4xZ4L1fdowM06DMInHdtUU6LqZu4KcTzPNUCSVSM786TnQ40Kq7By
 Znp+9xTbUWOOuq7Fs4gu9GEshJg/oY8q1foBTkjh0nx10MQXS4BbKEql1AiDQ3rJ74iZ
 LI1We7ssMwbYlIXRoQL4dCq2eIyMhENcygfSJtN+bRSoMdaOjAsqmoXTC7QO498T3l9r
 O30Xsizgb6gqRCVa56I0/z548GsAE74sSlYL07JuCDKkq/77d+jcfwoz1ufPg7Kdiwiv
 7kl5zpLmHnTorx/hEE34cnUwbUWR9fU6jV2lVjrvszfDEKlbDucZag9jw/aO/VI4mo5I
 1Naw==
X-Gm-Message-State: AO0yUKUociiITH4KTKrrJmLWFe8M+korLPAZ8731xdiatm2qeSCpOOHR
 cnHo6BRpOrfApnZu2l1gDNg135ikj1GNxK3lVanoO0VaI9KD0xbGGzq3qhAhSsVfNqm89367Oln
 oCoZLA3rKipfT0AQ=
X-Received: by 2002:a05:622a:50a:b0:3d3:95fd:9085 with SMTP id
 l10-20020a05622a050a00b003d395fd9085mr4880251qtx.42.1679487988095; 
 Wed, 22 Mar 2023 05:26:28 -0700 (PDT)
X-Google-Smtp-Source: AK7set+Y7TuLmVkuo1jiM38gsF+Lc2oaiWv8GAaQkGNUZ4Yi3HEt99mdaGN/vtDEHRvvdAuY8tpv/Q==
X-Received: by 2002:a05:622a:50a:b0:3d3:95fd:9085 with SMTP id
 l10-20020a05622a050a00b003d395fd9085mr4880224qtx.42.1679487987884; 
 Wed, 22 Mar 2023 05:26:27 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-44.web.vodafone.de.
 [109.43.177.44]) by smtp.gmail.com with ESMTPSA id
 j2-20020a378702000000b00746059d9c3fsm11291396qkd.35.2023.03.22.05.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 05:26:27 -0700 (PDT)
Message-ID: <102b1198-9995-25da-2d49-1dcd11df558f@redhat.com>
Date: Wed, 22 Mar 2023 13:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] cirrus.yml: Cover SPICE in the MSYS2 job
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Yonggang Luo <luoyonggang@gmail.com>, Jintao Yin <nicememory@gmail.com>,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230322110521.59949-1-philmd@linaro.org>
 <91fda177-fdb4-e3be-7cd7-e231c97a9300@redhat.com>
 <133c2b45-452c-c9e7-7fc4-c07d31d94298@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <133c2b45-452c-c9e7-7fc4-c07d31d94298@linaro.org>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 22/03/2023 13.13, Philippe Mathieu-Daudé wrote:
> On 22/3/23 12:30, Thomas Huth wrote:
>> On 22/03/2023 12.05, Philippe Mathieu-Daudé wrote:
>>> Include the mingw-w64-x86_64-spice package so SPICE is covered:
>>>
>>>    C compiler for the host machine: cc -m64 -mcx16 (gcc 12.2.0 "cc 
>>> (Rev10, Built by MSYS2 project) 12.2.0")
>>>    ...
>>>    Run-time dependency spice-protocol found: YES 0.14.4
>>>    Run-time dependency spice-server found: YES 0.15.1
>>>
>>> In particular this would have helped catching the build issue
>>> reported as https://gitlab.com/qemu-project/qemu/-/issues/1553:
>>
>> Well, hardly anybody is looking at the output on cirrus-ci.com, so this 
>> patch here likely would not have prevented the merging of this bug... for 
>> that, you rather have to add it to .gitlab-ci.d/windows.yml instead.
> 
> It seems we have 2 jobs doing the same testing (even same version,
> msys2-base-x86_64-20220603.sfx.exe). Does it make sense to maintain
> both? At least with GitLab we notice a failure.

We can test more things (targets) in the Cirrus-CI job since the build 
machines are way more powerful there ... but yes, since people rarely look 
at this output, it's maybe better to disable them and focus on the gitlab-CI 
jobs instead.

  Thomas


