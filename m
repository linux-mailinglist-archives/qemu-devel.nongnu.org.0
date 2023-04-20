Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E58E6E8DFD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:24:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQWS-0001vg-O0; Thu, 20 Apr 2023 05:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQWL-0001v9-58
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:24:05 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQWJ-0007Xo-4C
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:24:04 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l31-20020a05600c1d1f00b003f1718d89b2so2769482wms.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681982641; x=1684574641;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BbKMShqpTCaMdDAQB7Il7LjSiCAatZBhC9CdSj1CVuc=;
 b=tOsId2VV+m/i09tI9KzdSXeG/AaomyZ4D5X7FfS3AtKxTvGaAH74VjdmP9I8tOOVlS
 05Evu2y9SJ9NA5bTMnqYpw4RHqTmVUe0Vyo7ocy8Kj035eRdHTDo+NUGLX8nVbifB0nm
 s0fFm2ADGEp6bZle6JltPLgs1gkqjvOE3XNz2eJmf6+wpWUtatvubu92gpC5J1Ymn3Mf
 8XjvRJOSE7q+O/mfVEbnXDEX1jVMvQrd7f2//jcyXQPGO41o5187VOCJJvZwDrdJjdPM
 vPDJ+uTXYzEqTgm9nO3owfrOkohh2AM8FrhrJnivG3sh5QRFNZw0UO0DRI3/2ISlaAMl
 Ws6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982641; x=1684574641;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BbKMShqpTCaMdDAQB7Il7LjSiCAatZBhC9CdSj1CVuc=;
 b=eVD/doejYqX8q6sIvY43wqY4+yuNDQ+XbOwP9pFnXYfv/1yaDfyrWGUO2vde0g9tNK
 535o4SBr3sKeT6H1pSHsLT87qji335C9pl4pCeYqfXEfU+tLg1iiQt/arI6p4GW/CkLP
 8vpWmcc0hkxk+YvTQjRVYFe4f7QcPNjfW8tsKFGbTL6YAPSkJNcxyCSo6HZt3HsoQyl1
 wal4c0TjLcKC73lWg3oTWZ3XPKohhKjxJZkqA4OEJxblVnkvA2/iTu70amWB6ribdp9A
 5q/5C/5FbAudlAELUH/O8x7tc6sdMiQ4pZDLESuOCT86g+z3ePRv7maoEOkVb3etEqij
 zPFg==
X-Gm-Message-State: AAQBX9cVq/IhJzcjM/TSSjZwH7v6/aw3geVq21s2eMozkAqgAFtid9sH
 x1B4fsu0snaDcZrEzOu1MpWRiw==
X-Google-Smtp-Source: AKy350bn/4w3/1tQONssHKfaa6Gir/qYnc32sXTV4Cu6Mipqk1MUmQGELawmOo/CT0hRk/GxXIZ2vg==
X-Received: by 2002:a1c:f608:0:b0:3f1:8430:523 with SMTP id
 w8-20020a1cf608000000b003f184300523mr742994wmc.14.1681982641455; 
 Thu, 20 Apr 2023 02:24:01 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v11-20020a5d43cb000000b002ff77b033b1sm1463605wrr.33.2023.04.20.02.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 02:24:01 -0700 (PDT)
Message-ID: <c96288ed-56c5-00a6-c69b-c6ec9dc048b9@linaro.org>
Date: Thu, 20 Apr 2023 11:23:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2] travis.yml: Add missing 'flex','bison' packages to
 'GCC (user)' job
Content-Language: en-US
To: Vaibhav Jain <vaibhav@linux.ibm.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Anton Johansson <anjo@rev.ng>
References: <20230417162354.186678-1-vaibhav@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230417162354.186678-1-vaibhav@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 17/4/23 18:23, Vaibhav Jain wrote:
> Since commit fd8171fe52b5e("target/hexagon: import lexer for idef-parser") the
> hexagon target uses 'flex', 'bison' to generate idef-parser. However default
> travis builder image for 'focal' may not have these pre-installed, consequently
> following error is seen with travis when trying to execute the 'GCC (user)' job
> that also tries to build hexagon user binary:
> 
> <snip>
> export CONFIG="--disable-containers --disable-system"
> <snip>
>   Program flex found: NO
> 
> ../target/hexagon/meson.build:179:4: ERROR: Program 'flex' not found or not
> executable
> <snip>
> 
> Fix this by explicitly add 'flex' and 'bison' to the list of addon apt-packages
> for the 'GCC (user)' job.
> 
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> ---
> Changelog:
> 
> Since v1:
> Link: https://lore.kernel.org/qemu-devel/20230414210645.820204-2-vaibhav@linux.ibm.com/
> 
> - Added 'bison' also to the addon package list (Thomas)
> - Updated the patch description
> ---
>   .travis.yml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/.travis.yml b/.travis.yml
> index 11894eb810..b958eca5de 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -237,6 +237,8 @@ jobs:
>             - libglib2.0-dev
>             - libgnutls28-dev
>             - ninja-build
> +          - flex
> +          - bison
>         env:
>           - CONFIG="--disable-containers --disable-system"
>   


