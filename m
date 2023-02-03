Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870FD689C7E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 16:02:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxa7-0007O2-7v; Fri, 03 Feb 2023 10:02:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxa2-0007NR-GL
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:02:23 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxa0-0007Ib-HQ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:02:22 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso6197924wms.5
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 07:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bppv2R66jPTnr2tFWbWB4K5kszDw5tAaKP1jq1I7/EA=;
 b=pF0aoCfZy2ZmByGA3lX0cAu6T6SPAvBkg+18yJdH/mbkbfpb3wM14XQJycYUQWmc+x
 vSai4ijdJKED5omkOTcPdgyqKALswhWNSv/3vwzt8XsRtFNksW5UOZCDTWyLtnRy8Qw2
 u/SLuA3cVpxyQiSAQ6XBpoRHDYOAdNTOa+BVKrl/DHr2nHVwnzpl+EPwohOgva4C4a40
 vIk/Acawm+nUIOBFN+XmFJ1DOYLJqG0oOS6yHLYr/XfirQeobxB1BQng7GQvF7QToGtn
 ApMmJ9wLbbRgv9KtooPEKhCd/YWpzROz1bTrgdkcip+o5c6ZJLFeDkZw3DDs5MttOP/o
 S0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bppv2R66jPTnr2tFWbWB4K5kszDw5tAaKP1jq1I7/EA=;
 b=QFsSGSlikkEt/KzmKs9nNQ+sZUXAjmosinnu51aa4sBMg/xj8wy5gXTKwqBGhuuhmq
 nJXTHYtk1bPLrUaSbcpENSgz1eh4yHTPWmlQVizB/VgggnWRurvfQAb2K7VtooWgEsVc
 6LZSIgrt3l1vHriy3Trf2ZyPQHqyMfABVvKezlVs3PCCCSfg6itjKm/qsO10uLdLJNkA
 ZuBk35bJweOlcsVyBg6f18FoifF4WLsacqMiFhgJmEzO4zQHC+VjgqxJSr7vlW1MHmM+
 sJIWJW56B7bxFqodX8L5mLE69QqESK2zrpZpLwq247O9kv21kNQQNr9KQ+2bpghGAXIE
 hzZQ==
X-Gm-Message-State: AO0yUKUgBmem/PLEh8KPm1sDd9PCc87Xi+uXok377X+qs/ZXPC595Eef
 GvM/w+nX4+teoCuO2lwAReKy/Q==
X-Google-Smtp-Source: AK7set8JPB25IieGUZ3sufNtDgyFV/oS9Z5YahJ9FSLMO3J6y7nQATiJ6bA9snOQrjuFlK1wLNWAgw==
X-Received: by 2002:a05:600c:1c1d:b0:3de:a525:1d05 with SMTP id
 j29-20020a05600c1c1d00b003dea5251d05mr4675692wms.8.1675436538125; 
 Fri, 03 Feb 2023 07:02:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i10-20020a05600c354a00b003dd1c15e7fcsm9202300wmq.15.2023.02.03.07.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 07:02:17 -0800 (PST)
Message-ID: <c21d19e6-7e8a-a66e-0c65-f05954e429d7@linaro.org>
Date: Fri, 3 Feb 2023 16:02:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] tests/docker: Use binaries for debian-tricore-cross
Content-Language: en-US
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
References: <20230203145404.1043301-1-kbastian@mail.uni-paderborn.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230203145404.1043301-1-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

Hi Bastian,

On 3/2/23 15:54, Bastian Koppelmann wrote:
> since binutils is pretty old, it fails our CI repeatedly during the
> compilation of tricore-binutils. We created a precompiled version using
> the debian docker image and download it instead of building it ourself.
> 
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
> Peter, I was having trouble with the new version of binutils, I mentioned. I
> think this needs more time to sort out. So for now, let's just use a precompiled
> version of the current binutils.
> 
>   .../dockerfiles/debian-tricore-cross.docker    | 18 +++---------------
>   1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
> index 5ae58efa09..4abcf07e68 100644
> --- a/tests/docker/dockerfiles/debian-tricore-cross.docker
> +++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
> @@ -16,32 +16,20 @@ MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
>   RUN apt update && \
>       DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
>       DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
> -       bison \
> +       curl \
>          bzip2 \
>          ca-certificates \
> -       ccache \

You might not use ccache, but others do, so please let it:

$ git grep DOCKER_CCACHE
tests/docker/Makefile.include:203:DOCKER_CCACHE_DIR := 
$$HOME/.cache/qemu-docker-ccache
tests/docker/Makefile.include:212:      @mkdir -p "$(DOCKER_CCACHE_DIR)"
tests/docker/Makefile.include:234:                              -v 
$(DOCKER_CCACHE_DIR):/var/tmp/ccache:z \

> -       flex \
> -       g++ \
> -       gcc \
> -       git \
>          libglib2.0-dev \
>          libpixman-1-dev \
>          locales \
> -       make \

Why remove gcc/(git)/make?

>          ninja-build \
>          pkgconf \
>          python3-pip \
>          python3-setuptools \
>          python3-wheel
>   
> -RUN git clone --single-branch \
> -        https://github.com/bkoppelmann/tricore-binutils.git \
> -        /usr/src/binutils && \
> -    cd /usr/src/binutils && chmod +x missing && \
> -    CFLAGS=-w ./configure --prefix=/usr/local --disable-nls --target=tricore && \
> -    make && make install && \
> -    rm -rf /usr/src/binutils
> -
> +RUN curl -#SL https://github.com/bkoppelmann/tricore-binutils/raw/master/release/tricore-binutils.2.13.tar.gz \
> +    | tar -xzC /usr/local/
>   # This image can only build a very minimal QEMU as well as the tests
>   ENV DEF_TARGET_LIST tricore-softmmu
>   ENV QEMU_CONFIGURE_OPTS --disable-user --disable-tools --disable-fdt


