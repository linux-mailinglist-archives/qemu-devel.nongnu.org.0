Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95C5610459
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 23:27:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooAMu-0003UN-Cr; Thu, 27 Oct 2022 17:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooAMl-0003Tm-H9
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:24:43 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooAMj-0004rb-Ss
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:24:43 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso7946715pjc.0
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 14:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uPXzuCHEB5BxCRke55hKoHXJpNYGFfyyER+tqCHhcb4=;
 b=VhxFj6Mwr6OWyvpD0xge0FoPvGfd+rH99T/GFmq9K3tp00stMm8zMdgXKOO/eFojLp
 zU1zMINN3Jr2/Y2Ev1dOs7rnTXTY4fLd4uYYRKcNJSfLsF2gFNL0SObusoe2z6eOEoGS
 PJWuzJaQFmcrFGv2sJE7gc8BMtQgT8MwS124Gd4CniD2u6w5PEWBPKfUUyFDuNb65aOT
 aScWV/N7XnRPPoEUkbiowizBYsTuA7IlMOIrEVY3dWFyET8JMXzi3rMxyCPvvF2WvGqZ
 KHyopAI2ySyhDCNJm5Engmp3YRmun3rZE1C8+O/bcSqevJdb3BSizqnTBJRdfSdupE4v
 wI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uPXzuCHEB5BxCRke55hKoHXJpNYGFfyyER+tqCHhcb4=;
 b=i71H4pC2NneM1fWNU2DdwfOyKYew2Fh1IcadBnx2U4tKgTsLnikacdfSV95XOmmUEH
 quOvaNBPJCAbHBAh57xsYp97i/1M3mUjkGdg82LfG+97lvKxVSKuTRddgSUyFCRq1e9c
 +l0Eq82MJaeMWjJUxx3/JDokHnMepJAGBBS5ruZvXUIJuOgSdIzZHiyurbUj2JnXMQJl
 Yy9HIQlPtFi97+vcQ38PDaCAg7o+PrMKTI2Nbvce62j5wC1YbFVEy0DZOvZLQXbS+8ft
 i49aET124+taetN3f2yA/m29lYt3E9LarLEIXclRbrdZX2fwsYOIqXg3dSvp1aX+3DfQ
 IHXA==
X-Gm-Message-State: ACrzQf3iJnTswL4bE1S+66ez2YfQ/C2M0DcFsJDakNserq0pqmt9mHOn
 WA96tZC5kSdWYi70zry/UwNYLA==
X-Google-Smtp-Source: AMsMyM77Mo0wqbWD5rR0dvOapyvEZ3gUDKHyflJk5452xoEthyE0O0lt50Bh5mh/0NLLlEsYUxDsrw==
X-Received: by 2002:a17:902:e546:b0:186:cf80:978b with SMTP id
 n6-20020a170902e54600b00186cf80978bmr13214259plf.167.1666905879554; 
 Thu, 27 Oct 2022 14:24:39 -0700 (PDT)
Received: from ?IPV6:2001:8003:501a:d301:93c4:c1c9:4368:47fa?
 ([2001:8003:501a:d301:93c4:c1c9:4368:47fa])
 by smtp.gmail.com with ESMTPSA id
 a14-20020aa78e8e000000b0056be9f8b814sm1583467pfr.217.2022.10.27.14.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 14:24:39 -0700 (PDT)
Message-ID: <fb1394fe-b244-7df7-5c9b-b4aa57cd6071@linaro.org>
Date: Fri, 28 Oct 2022 07:24:31 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 01/30] tests/docker: update fedora-win[32|64]-cross
 with lcitool
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
 <20221027183637.2772968-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221027183637.2772968-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/28/22 04:36, Alex Bennée wrote:
> Convert another two dockerfiles to lcitool and update. I renamed the
> helper because it is not Debian specific. We need an updated lcitool
> for this to deal with the weirdness of a 32bit nsis tool for both 32
> and 64 bit builds. As a result there are some minor whitespace and
> re-order changes in a bunch of the docker files.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20220929114231.583801-10-alex.bennee@linaro.org>
> ---
>   tests/docker/dockerfiles/alpine.docker        |   2 +-
>   tests/docker/dockerfiles/centos8.docker       |   2 +-
>   .../dockerfiles/debian-amd64-cross.docker     | 234 ++++++++---------
>   tests/docker/dockerfiles/debian-amd64.docker  | 236 +++++++++---------
>   .../dockerfiles/debian-arm64-cross.docker     | 232 ++++++++---------
>   .../dockerfiles/debian-armel-cross.docker     | 230 ++++++++---------
>   .../dockerfiles/debian-armhf-cross.docker     | 232 ++++++++---------
>   .../dockerfiles/debian-mips64el-cross.docker  | 226 ++++++++---------
>   .../dockerfiles/debian-mipsel-cross.docker    | 226 ++++++++---------
>   .../dockerfiles/debian-ppc64el-cross.docker   | 230 ++++++++---------
>   .../dockerfiles/debian-s390x-cross.docker     | 228 ++++++++---------
>   .../dockerfiles/fedora-win32-cross.docker     | 139 ++++++++---
>   .../dockerfiles/fedora-win64-cross.docker     | 138 +++++++---
>   tests/docker/dockerfiles/fedora.docker        | 230 ++++++++---------
>   tests/docker/dockerfiles/opensuse-leap.docker |   2 +-
>   tests/docker/dockerfiles/ubuntu2004.docker    | 234 ++++++++---------
>   tests/lcitool/libvirt-ci                      |   2 +-
>   tests/lcitool/refresh                         |  48 ++--
>   18 files changed, 1499 insertions(+), 1372 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

