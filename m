Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3F7698E40
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 09:04:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZFQ-0005Es-Ea; Thu, 16 Feb 2023 03:04:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSZFO-0005Di-4W
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:04:06 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSZFL-0005sG-58
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:04:05 -0500
Received: by mail-wr1-x42f.google.com with SMTP id m14so940124wrg.13
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 00:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eC51j45rluXUGkX/RbLNOy0O2H5SCOfnOAxT/bkaoNk=;
 b=Nl+QfVXXanrGqbGesQ60OntxRGFxei+Z3iy+KfYOp0GJ3jwA/PHYadTVrrwMQDAnFS
 LaYrzDjRT1VaIdrCe8qisgxopxRJr9jIAleWoBEtB5YbGMRffgQjOXgNj8Cn0h0iXCz2
 8RIAndUh//mPtZTneWbUK4vG1jZgZ4+NyVvGlUQWO3V3COsa6wQJpAdjz9grdiSFAlmp
 KFT9qUpW6tayQyqato3jeCXtIgeRd/oGo4nhQx27MlV8jqZbVOaJGiIicL+YHo0tA99A
 8Wmb5eyvJCDQQWr+/W29z58OEesTiEqNNdM7PYvkHPCiraMvWsAhCXFgvfybfjH/NWyc
 cc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eC51j45rluXUGkX/RbLNOy0O2H5SCOfnOAxT/bkaoNk=;
 b=nHiVq6FuUssLj1Bus7M06brPMQyBwpvQoY2OsEMdHDL1wdeYn1qMDKyStzqj0r7JjT
 zNDcbXpmt6uDxJGItI+VXwwi32WiNF4iXf3XCif8FIbS1T9W94Qn7Ke6iKI3jj9Kh/a3
 uWBqGO66Ntk4bg6PlcYsFGxNbHjc1LSkLnkUpd5I7ogFzzbENZefmSrRATbTBSkmiu1m
 LGZCLfZJA4fUtGCgu7tw9XgoTo4PdnrxHDtJ+2crQ+6uKGSCdJ4uTpwU8A83SFQf6G5r
 zrKZdblJwK+vwo4vMTe547FUEc0YfB7mYQniBCHNFNUtXR4gs9usCh7UokXr5FzJ0yhA
 15fw==
X-Gm-Message-State: AO0yUKUdyW23waVCdnGn5s0pa99O250D5nwwBXXF0XFQZanuw3Qc4BUF
 pn3qY8p2pRmcNa9ynSQeZRWjNQ==
X-Google-Smtp-Source: AK7set8IVxdApuIbBwcI9DSHmksxxKf83iBqE0PcB7mcYoNlz55/jxM1f97KIhY6wknwHn6YM6Ximg==
X-Received: by 2002:a05:6000:1685:b0:2c5:5297:24ae with SMTP id
 y5-20020a056000168500b002c5529724aemr1179012wrd.2.1676534640489; 
 Thu, 16 Feb 2023 00:04:00 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a5d4207000000b002c552c6c8c2sm788966wrq.87.2023.02.16.00.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 00:04:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A34821FFB7;
 Thu, 16 Feb 2023 08:03:59 +0000 (GMT)
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-6-alex.bennee@linaro.org>
 <4969b132-8cb2-609e-4724-b7d4db41db76@redhat.com>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, Alexander
 Bulekov <alxndr@bu.edu>, Qiuhao Li <Qiuhao.Li@outlook.com>, =?utf-8?Q?Mar?=
 =?utf-8?Q?c-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Markus Armbruster <armbru@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Darren Kenny
 <darren.kenny@oracle.com>, Stefan Hajnoczi <stefanha@redhat.com>, Bandan
 Das <bsd@redhat.com>, Cleber Rosa <crosa@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Yonggang Luo <luoyonggang@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>, Ed Maste
 <emaste@freebsd.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 05/12] gitlab: reduce default verbosity of cirrus run
Date: Thu, 16 Feb 2023 08:02:58 +0000
In-reply-to: <4969b132-8cb2-609e-4724-b7d4db41db76@redhat.com>
Message-ID: <87k00i82a8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Thomas Huth <thuth@redhat.com> writes:

> On 15/02/2023 20.25, Alex Benn=C3=A9e wrote:
>> We also truncate the echoing of the test log if we fail. Ideally we
>> would want the build aretefact to be available to gitlab but so far
>> how to do this eludes me.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> ---
>>   .gitlab-ci.d/cirrus/build.yml | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>> diff --git a/.gitlab-ci.d/cirrus/build.yml
>> b/.gitlab-ci.d/cirrus/build.yml
>> index 7ef6af8d33..6563ff3c7a 100644
>> --- a/.gitlab-ci.d/cirrus/build.yml
>> +++ b/.gitlab-ci.d/cirrus/build.yml
>> @@ -32,6 +32,6 @@ build_task:
>>       - $MAKE -j$(sysctl -n hw.ncpu)
>>       - for TARGET in $TEST_TARGETS ;
>>         do
>> -        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=3D1
>> -        || { cat meson-logs/testlog.txt; exit 1; } ;
>> +        $MAKE -j$(sysctl -n hw.ncpu) $TARGET
>> +        || { tail -n 200 meson-logs/testlog.txt; exit 1; } ;
>>         done
>
> I think it should be OK to publish the artifacts on cirrus-ci.com
> instead - you have to click a little bit more often, but you can still
> get the artifacts there, see:
>
>  https://lore.kernel.org/qemu-devel/20230215142503.90660-1-thuth@redhat.c=
om/

But dropping the V=3D1 also helps by reducing those chatty softfloat
tests. If we could merge that with yours. Are you sending a PR soon or
should I pull your patch into this series?

>
>  Thomas


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

