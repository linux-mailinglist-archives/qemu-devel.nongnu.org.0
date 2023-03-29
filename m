Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 771BC6CD31B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 09:26:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phQAB-0000h2-Gm; Wed, 29 Mar 2023 03:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phQA9-0000gm-Fl
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 03:24:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phQA7-0000kK-Ex
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 03:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680074641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Df84HfYJKUD2jF/ZAcNsgHFNw8he/8a1ihAv9USDsKg=;
 b=Ci826gMOybj1lHgof9CZAg9X92b72gyBANI3NOF37DvE5duoYjMUjyjxjbYsAf+LpF8p6i
 JlYrFuTdZuyrMUKWDeqiMcikjgfWCCiu+p2hHyCX7Moh8Scf3Ec/WHgxSGQBMg5sy/sZKt
 sj50PgZKV2vZxpYbYCpkp6JDulImdj4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-lGLpiWiuNAOTmUkJMM_hsg-1; Wed, 29 Mar 2023 03:23:22 -0400
X-MC-Unique: lGLpiWiuNAOTmUkJMM_hsg-1
Received: by mail-qk1-f200.google.com with SMTP id
 198-20020a370bcf000000b007468cffa4e2so6881034qkl.10
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 00:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680074602;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Df84HfYJKUD2jF/ZAcNsgHFNw8he/8a1ihAv9USDsKg=;
 b=DCgaUwmzhKdheYEl6BtlaOiQqgZ7kiuxyNt/NyJRUG8jn3r2HdhiPukbeInamqkcdH
 63eg2aT5Ih88+oOXsF00epaJPAogrxb2Xt0nEnZ5KMASJwrKgXIF+btjKj2manoF6s8+
 9qhGqSs0fnSCgwKvTx3Xvn8kICE6AvNtcU9v4gW7oLT6bSmf56w5UGRW4npmNOvIxVRd
 WJp+RDuQjT00gi4IExrO8P1pRIf0e6APTLAy1hmZUQCdK7W91DRX0CTvf6vAy2LIg4fS
 gLO8Bq55jZXLJriZqluqK6hVfBCTSJ5AIBMj3vfWn5xkRZ/UuwDz6mKzMZGHELV3dDii
 F1pw==
X-Gm-Message-State: AO0yUKU2IEBebA9cKe3KhYGmq8xcmdhzY3EwcG+cCCHlkvTC7cNkIG8N
 wmd27KlsoL/YO+8Y/xhbd6BRvgr5K5697do53pAPkkS0X/raP9+tRiXNfWY6Suew4PZisZwe+Ym
 y0miMIATR0kuZZJA=
X-Received: by 2002:ac8:7e8e:0:b0:3d2:5776:4b39 with SMTP id
 w14-20020ac87e8e000000b003d257764b39mr31754498qtj.37.1680074601832; 
 Wed, 29 Mar 2023 00:23:21 -0700 (PDT)
X-Google-Smtp-Source: AK7set87FXOOA6a9YWR4oDaEhX1o/V9suLNL8Quqnc/+ZaE6Whm3z7A9FR9XEd0+mkcC7Ds9QIssvA==
X-Received: by 2002:ac8:7e8e:0:b0:3d2:5776:4b39 with SMTP id
 w14-20020ac87e8e000000b003d257764b39mr31754488qtj.37.1680074601585; 
 Wed, 29 Mar 2023 00:23:21 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-100.web.vodafone.de.
 [109.43.177.100]) by smtp.gmail.com with ESMTPSA id
 q26-20020a05620a025a00b00746a0672cf3sm9073611qkn.94.2023.03.29.00.23.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 00:23:21 -0700 (PDT)
Message-ID: <9f745757-d5f5-e17a-a6fd-adc4db3e3fea@redhat.com>
Date: Wed, 29 Mar 2023 09:23:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: egl compile error on msys CI runners
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>
References: <CAFEAcA96hY7wxj9NjbkZmBshA6VECUQktNXAyGdS+-zLL5rWmw@mail.gmail.com>
 <CAJ+F1C+6YYdNoFbraKwaw0A5NeUnwdJvrM6q98V6z0f-hr68Tw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAJ+F1C+6YYdNoFbraKwaw0A5NeUnwdJvrM6q98V6z0f-hr68Tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 29/03/2023 09.01, Marc-André Lureau wrote:
> Hi Peter
> 
> On Tue, Mar 28, 2023 at 6:39 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> The msys CI runners have started failing to compile with an EGL
>> related error:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/4015682307
>>
>> In file included from
>> C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/include/epoxy/egl.h:46,
>> from C:/GitLab-Runner/builds/qemu-project/qemu/include/ui/egl-helpers.h:5,
>> from ../ui/egl-helpers.c:21:
>> C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/include/epoxy/egl_generated.h:11:10:
>> fatal error: EGL/eglplatform.h: No such file or directory
>> 11 | #include "EGL/eglplatform.h"
>> | ^~~~~~~~~~~~~~~~~~~
>> ninja: build stopped: subcommand failed.
>>
>> Dan says this is because of a msys2 packaging issue:
>> https://github.com/msys2/MINGW-packages/issues/16492
>>
>> Can we have a meson test that doesn't try to enable EGL on systems
>> like this one where it's broken ? Changing the current meson.build
>>    if cc.has_header('epoxy/egl.h', dependencies: epoxy)
>> to whatever the meson is for "actually try to compile with the
>> header" ought to do the trick, I think.
>>
> 
> This is an unfortunate consequence of using a fast-moving rolling
> distribution, there are random breakages. It would make sense to have
> tagged / pre-built images instead. That would also speed up the CI a
> bit, hopefully.
> Thomas, any idea how to do that?

Sorry, I've got no clue how that container stuff works on Windows :-(

  Thomas


