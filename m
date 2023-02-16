Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69F9698E74
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 09:17:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZQu-0003OO-6f; Thu, 16 Feb 2023 03:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSZQr-0003O4-IX
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:15:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSZQp-0005A5-Ig
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676535353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7yj86WCyOwEULoySJQ17fpwniZYtn7FDCwVmQ8BM7oY=;
 b=Ro3Nai+COKXlT2DS4OlPKr7bwXj0td+Ie49narEy3LLvcYijD4/OavAH4bPvB5um4LU4LA
 ZIqIoVWJhSjUehy+7jM38xeDcNDVNkAv1ofWzOOuPIFnQvbDaV6IaW9KzXzX457Xp93q39
 /6hiuMKkWLblg22gm9yQjRTChnMUMFE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-208-_L58SUybNsSvMsWA1VOIig-1; Thu, 16 Feb 2023 03:15:52 -0500
X-MC-Unique: _L58SUybNsSvMsWA1VOIig-1
Received: by mail-qt1-f199.google.com with SMTP id
 s4-20020ac85284000000b003b849aa2cd6so808727qtn.15
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 00:15:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7yj86WCyOwEULoySJQ17fpwniZYtn7FDCwVmQ8BM7oY=;
 b=3T/072oDgVROG7MG2SBlLp9PLTq2lXSBwDVb+o1DN3tgA8VHzm1pJacYZZx6S7zTrY
 g7SJKEE8jGt3IiBg3sEn304Xk/tzFnn8khLQYOpe3ewoymK/BNNUKCO6Sb9fJbLuGm69
 8W/2vMYOt0D79GPmYUM8KDbBzWkTnBEMMguTvlcwUt82Zqi6XJGWkJWfCi7f4d0+QnAt
 cOk9chME2wTvzHp6GXXsPCR7wxtZ7npjeaNLWKDoVU8IdGBwmM2+gRdBnwq6YMixYW8y
 6ncAkBNlKxFZC9vEeaVC3kr8BlmH7bb9wqBxRKHvftGgfGvbPkSvxI/bo40vyYdZZc7L
 IdoQ==
X-Gm-Message-State: AO0yUKX95pPoYEgki1ZTDm2gj2ss3XhxNlTI/yKKLFVdAdZjZjtKjgpl
 9+/ffqyvENNhG6vBbjKyT5kRRbOP990ZKllX4lxmd8eo20Y6bCmCKQPqNqQUdg9JvjI6HEIJCXz
 l8UmfuolY8o9FXS0=
X-Received: by 2002:a05:622a:3c9:b0:3af:b6bd:aba7 with SMTP id
 k9-20020a05622a03c900b003afb6bdaba7mr8600674qtx.43.1676535352097; 
 Thu, 16 Feb 2023 00:15:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8l4FmvwKdAg5M582X/E3U+i8QFh7uujEih9Y98/NVeAFVTTV5G3skXKsZz4WwJ1dh7KWJzNw==
X-Received: by 2002:a05:622a:3c9:b0:3af:b6bd:aba7 with SMTP id
 k9-20020a05622a03c900b003afb6bdaba7mr8600646qtx.43.1676535351846; 
 Thu, 16 Feb 2023 00:15:51 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de.
 [109.43.176.144]) by smtp.gmail.com with ESMTPSA id
 o62-20020a374141000000b0073b676274e7sm715427qka.94.2023.02.16.00.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 00:15:51 -0800 (PST)
Message-ID: <67c50099-ed3f-0062-17eb-3cc5806ce320@redhat.com>
Date: Thu, 16 Feb 2023 09:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 05/12] gitlab: reduce default verbosity of cirrus run
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Alexander Bulekov <alxndr@bu.edu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-6-alex.bennee@linaro.org>
 <4969b132-8cb2-609e-4724-b7d4db41db76@redhat.com> <87k00i82a8.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87k00i82a8.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 16/02/2023 09.02, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 15/02/2023 20.25, Alex Bennée wrote:
>>> We also truncate the echoing of the test log if we fail. Ideally we
>>> would want the build aretefact to be available to gitlab but so far
>>> how to do this eludes me.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Daniel P. Berrangé <berrange@redhat.com>
>>> ---
>>>    .gitlab-ci.d/cirrus/build.yml | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>> diff --git a/.gitlab-ci.d/cirrus/build.yml
>>> b/.gitlab-ci.d/cirrus/build.yml
>>> index 7ef6af8d33..6563ff3c7a 100644
>>> --- a/.gitlab-ci.d/cirrus/build.yml
>>> +++ b/.gitlab-ci.d/cirrus/build.yml
>>> @@ -32,6 +32,6 @@ build_task:
>>>        - $MAKE -j$(sysctl -n hw.ncpu)
>>>        - for TARGET in $TEST_TARGETS ;
>>>          do
>>> -        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1
>>> -        || { cat meson-logs/testlog.txt; exit 1; } ;
>>> +        $MAKE -j$(sysctl -n hw.ncpu) $TARGET
>>> +        || { tail -n 200 meson-logs/testlog.txt; exit 1; } ;
>>>          done
>>
>> I think it should be OK to publish the artifacts on cirrus-ci.com
>> instead - you have to click a little bit more often, but you can still
>> get the artifacts there, see:
>>
>>   https://lore.kernel.org/qemu-devel/20230215142503.90660-1-thuth@redhat.com/
> 
> But dropping the V=1 also helps by reducing those chatty softfloat
> tests. If we could merge that with yours. Are you sending a PR soon or
> should I pull your patch into this series?

I'm not planning a new pull request in the next few days, so feel free to 
pick my patch up or simply ignore it.

Anyway, the V=1 has just been added a little bit more than 2 years ago to 
address a different problem:

  https://gitlab.com/qemu-project/qemu/-/commit/2a5a79d1b57280edd

I'm fine with dropping the V=1 again, but it still feels like we're going 
around in circles here.

  Thomas


