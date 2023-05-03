Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77376F54D7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:35:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8sp-00057U-7m; Wed, 03 May 2023 05:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pu8sn-000575-Ao
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:34:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pu8sl-0007pp-OG
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683106482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tjqg7kCYsyCb7j42RiZFjdXyBQhukHv/BpkJuuVPrVY=;
 b=IjuxzEy1Oe4kwd5HDHgszthTxuwHsKBiMyJy2/eOQLCKbbR3XrkF9ZnTDAK4mpWsZI7LPv
 CUSVQCsXHKzv+ddH9TG6kkPRu1H1uuugJ/5f0g9kbqxIJgP3NDlw2QqzxKtDReF1l4hLyp
 jtCnGcKQQzT8u+h06B4s8EsEVHQlkBw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-DZ1NIPI0Mnaw8VLh8kE00w-1; Wed, 03 May 2023 05:34:41 -0400
X-MC-Unique: DZ1NIPI0Mnaw8VLh8kE00w-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30467a7020eso2980130f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683106480; x=1685698480;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tjqg7kCYsyCb7j42RiZFjdXyBQhukHv/BpkJuuVPrVY=;
 b=QStHLxSrvtBPffq0YmZXsZ9I6Zm8pmqdaU+Q5lA/1DxHgNQfYFANVVrduUtBxYDewJ
 v6uBktqFl4XXvqXEpY3kQ3+qP81ztztWBirPFjfJKtwYYGTtojEwtpkzdrCDDmJ6bjpT
 GABL/reYZmnMEeEBWgGrxtzpDy4NFO9/LlyNnJIP/bjcNy2BGinz/snsm8ASIXUWyuSt
 KEwYD66grgCX8Z8tTUm6Yl2eqHmz8AQR/9C5ZEQLPHUmCp4ZzmJ3OaxPRcUOO+teEWPa
 66Bzjo7MgGbbzQ+wdqu9ws+J/IsOR3a/AheoYt0TWwygMyqB7RWtb1QYvFEw2YhC+c8B
 MsnA==
X-Gm-Message-State: AC+VfDwcTEZaPfIb+potdi8QhjtkQOvSBjOG14iBoqrV/tHt4OENDSSe
 898oUaQNxFKmB2PCRSocxYJdazNkatrbef+zuDj6gzRyYHyAPCV+4MttMV1mVlmpV7qPIClcaFQ
 JpXZPn8/GROwKMX4=
X-Received: by 2002:adf:e442:0:b0:306:3911:dff0 with SMTP id
 t2-20020adfe442000000b003063911dff0mr3618512wrm.4.1683106480537; 
 Wed, 03 May 2023 02:34:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ52pU4nGxwyKG2XoNadtrfFu/UYDHp8t60fQb/Nx+GM/oeWZAfW1nNqPV9o7bcViqKnoz8pig==
X-Received: by 2002:adf:e442:0:b0:306:3911:dff0 with SMTP id
 t2-20020adfe442000000b003063911dff0mr3618477wrm.4.1683106480224; 
 Wed, 03 May 2023 02:34:40 -0700 (PDT)
Received: from [10.33.192.225] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a5d6850000000b003063a1cdaf2sm3421996wrw.48.2023.05.03.02.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 02:34:39 -0700 (PDT)
Message-ID: <23155e96-8c8c-335e-6bc3-9df5f0df5997@redhat.com>
Date: Wed, 3 May 2023 11:34:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 19/22] gitlab: add ubuntu-22.04-aarch64-without-defaults
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-20-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230503091244.1450613-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 03/05/2023 11.12, Alex Bennée wrote:
> This does a very minimal build without default devices or features. I
> chose the aarch64 runner as it doesn't count towards CI minutes and is
> a fairly under-utilised builder.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .../custom-runners/ubuntu-22.04-aarch64.yml   | 22 +++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
> index 57303c12e1..f8489dd3fc 100644
> --- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
> @@ -45,6 +45,28 @@ ubuntu-22.04-aarch64-all:
>    - make --output-sync -j`nproc --ignore=40`
>    - make --output-sync -j`nproc --ignore=40` check
>   
> +ubuntu-22.04-aarch64-without-defaults:
> + extends: .custom_runner_template
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_22.04
> + - aarch64
> + rules:
> + - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> +   when: manual
> +   allow_failure: true
> + - if: "$AARCH64_RUNNER_AVAILABLE"
> +   when: manual
> +   allow_failure: true
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-user --without-default-devices --without-default-features
> +   || { cat config.log meson-logs/meson-log.txt; exit 1; }
> + - make --output-sync -j`nproc --ignore=40`
> + - make --output-sync -j`nproc --ignore=40` check

Reviewed-by: Thomas Huth <thuth@redhat.com>

Maybe you could also enable "check-qtest" for the "build-without-defaults" 
job in builtest.yml now?

  Thomas


