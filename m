Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039B3698DE1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 08:38:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSYqN-00046S-0v; Thu, 16 Feb 2023 02:38:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSYqD-00041y-1p
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:38:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSYqB-00029Q-5S
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:38:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676533080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4IBR1SHwu6ZT8H16tIJvB/Kte+LvBpPr85s2MmaP5VQ=;
 b=QFANcc5SMxvXXV8wiLnB7nAabtSwiHVZtNJ1hzWXb1JbgvNGIX6hBR008+xUwVc7GY9zKq
 S6P1HhH+VuqXbzANEpVNx7e+4ybZnDWKdGHYqu6FVUlNVxwRaGgeSr/OMujuzvHkWaoIK4
 z2a063290ea4jSolSrAAK5op1dwf1VA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-231-B6jhVxMWNkOpwRTY6a3L-A-1; Thu, 16 Feb 2023 02:37:59 -0500
X-MC-Unique: B6jhVxMWNkOpwRTY6a3L-A-1
Received: by mail-qk1-f200.google.com with SMTP id
 o24-20020a05620a22d800b007389d2f57f3so692847qki.21
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4IBR1SHwu6ZT8H16tIJvB/Kte+LvBpPr85s2MmaP5VQ=;
 b=pU4NXl6NUY6Rsj2LnME+pWaghA8VUuLlmrYCVYjf5qTn6X93fT4vC5LPOJFoXHiemE
 FeaOieD7QY6VqgF4BA/topGwwbLRQJ6cg/6ugiosbkDGgDB24+e9aOn9UcPpe5QHFF72
 AsQnXikOe1HYFwD6UoEzr+ss0ybhRBCTfPmldjC5PjkMZoKxsRyjuRTUvnrPM/6neOfo
 ogyoNnktvABe7HEdhoRBi6TLzrAQbncYgxqooCuuVSXrXRZT/470NL9i+QV/4tRG3ae0
 nfPhseFx35L2QajwXfmyP+KsAPQT12zIndMteu861IS6KmQeEUzaUGxbGATVVMk1Hiet
 i7Rg==
X-Gm-Message-State: AO0yUKUpGVGpCObrIA5M9X2HgeWH3thG6ZUGLoLE9TqXA1miOGM3107E
 sfcVcy1VAdCOruNbruB2+TW9PvrUoxol42+l9bilT1foFQQ6K1FcKB7QSVn8bb07rHsBn7iv2zI
 2vOlhcqtXXNhGZJU=
X-Received: by 2002:ac8:58c4:0:b0:3bd:48:70a3 with SMTP id
 u4-20020ac858c4000000b003bd004870a3mr6958945qta.1.1676533079089; 
 Wed, 15 Feb 2023 23:37:59 -0800 (PST)
X-Google-Smtp-Source: AK7set+qQ5SJWh7KB6sR1O7KGKnbSpqtm1yhBV0w5CWYUcrrktuZTqKyTTRDaFxpg0XLjBv1103lxg==
X-Received: by 2002:ac8:58c4:0:b0:3bd:48:70a3 with SMTP id
 u4-20020ac858c4000000b003bd004870a3mr6958923qta.1.1676533078848; 
 Wed, 15 Feb 2023 23:37:58 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de.
 [109.43.176.144]) by smtp.gmail.com with ESMTPSA id
 a4-20020ac84344000000b003b2957fb45bsm816701qtn.8.2023.02.15.23.37.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 23:37:58 -0800 (PST)
Message-ID: <4969b132-8cb2-609e-4724-b7d4db41db76@redhat.com>
Date: Thu, 16 Feb 2023 08:37:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 05/12] gitlab: reduce default verbosity of cirrus run
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
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
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230215192530.299263-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 15/02/2023 20.25, Alex Bennée wrote:
> We also truncate the echoing of the test log if we fail. Ideally we
> would want the build aretefact to be available to gitlab but so far
> how to do this eludes me.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/cirrus/build.yml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
> index 7ef6af8d33..6563ff3c7a 100644
> --- a/.gitlab-ci.d/cirrus/build.yml
> +++ b/.gitlab-ci.d/cirrus/build.yml
> @@ -32,6 +32,6 @@ build_task:
>       - $MAKE -j$(sysctl -n hw.ncpu)
>       - for TARGET in $TEST_TARGETS ;
>         do
> -        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1
> -        || { cat meson-logs/testlog.txt; exit 1; } ;
> +        $MAKE -j$(sysctl -n hw.ncpu) $TARGET
> +        || { tail -n 200 meson-logs/testlog.txt; exit 1; } ;
>         done

I think it should be OK to publish the artifacts on cirrus-ci.com instead - 
you have to click a little bit more often, but you can still get the 
artifacts there, see:

  https://lore.kernel.org/qemu-devel/20230215142503.90660-1-thuth@redhat.com/

  Thomas


