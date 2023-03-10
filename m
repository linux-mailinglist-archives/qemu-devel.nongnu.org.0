Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BBA6B4021
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 14:20:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pace6-0004e2-DD; Fri, 10 Mar 2023 08:18:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pace0-0004cW-QD
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 08:18:48 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pacdy-0005va-UH
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 08:18:48 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so5978490wmb.5
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 05:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678454325;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eXNvw8Dc3oFInCNkw8dWdNNkEyxuB9j0bP0TYn6aI8o=;
 b=LRH9Bi/x10ZnXqSKfn551f3EB6zuWIwPd/qsbyR0hTuU20GNIi/arm+h7d/jeP/6+1
 0EPWHu6HxB/KYTuCmk75/X5FOxrX9dvSaRmqkO8m90FzsV4GtBahVNb5H4gXdWGDRqt1
 KkQffxDvhJ3R7SpR/ANtMnRjfwio9Uo7tqVr0P2n3l1hrHa1mPRBenTfyI7zjNeoJ4pX
 DUhp/bmXjfDuu4bD75LaEr/lbJP02zX+12gpogP6VNk342JFSTMggtAtrCIAe6PnFPgE
 3ZppH3n65Yj8qn5qE5Mr6h/PAZAceskEk5yKyYs+Y1P+0PAKIKuUbWIjmGAkF7yvF++Y
 S90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678454325;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eXNvw8Dc3oFInCNkw8dWdNNkEyxuB9j0bP0TYn6aI8o=;
 b=7nJAKIAnapq1xBjqrlAXh2FwcMH4/2c2RWsxx+2A9DUDGYrJJNBBqNS3aTRW4t6KOq
 OGumOTd922wUfOScl3PUovO6hzDZMupG8y2ibTWk2F+kcUIBttw8GzVORanC/RC+NcV2
 HbpmeYNEHaYDR0U8JkYx5ZFXvhVVKTbDgKPw5ET/fAGL0pX+ogUlDhHpfvLUX1mu7SCc
 +55nbUowkNLAHfavNP4Hx7/twMmwhO/YXNb5TZZ/o95JqCqV4cMju0TMU7nSn5HUNDcf
 mjsfSk5tUfzayYh4PLtFjtTn6ECqL+sDRCnVyKFhDcJlC/frtJHRaRrb+PyXPF8Dm8Jj
 GARw==
X-Gm-Message-State: AO0yUKUpULKv1KgBYuT49FJUxvwCorv69NubBq1xKdojFYF5/ufKq6kw
 DDQ2O77euLDj6Dh+MEsekjYvEQ==
X-Google-Smtp-Source: AK7set82//e2ePQM8dFrMa5XUUBblSl1qUBYCtKs7dejBe4zwM4sD3sWCrqDQLmgP+6au73HW18mqw==
X-Received: by 2002:a05:600c:538b:b0:3eb:2b88:5af2 with SMTP id
 hg11-20020a05600c538b00b003eb2b885af2mr2589327wmb.20.1678454325097; 
 Fri, 10 Mar 2023 05:18:45 -0800 (PST)
Received: from [192.168.1.115] (4.red-95-127-40.staticip.rima-tde.net.
 [95.127.40.4]) by smtp.gmail.com with ESMTPSA id
 n11-20020a05600c3b8b00b003e00c453447sm3194190wms.48.2023.03.10.05.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 05:18:44 -0800 (PST)
Message-ID: <4147a97c-d62c-1f1b-3b20-83d73a0f5fd2@linaro.org>
Date: Fri, 10 Mar 2023 14:18:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 0/3] Edk2 stable202302 20230309 patches
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20230309115714.906369-1-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Simon Glass <sjg@chromium.org>
In-Reply-To: <20230309115714.906369-1-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Gerd,

On 9/3/23 12:57, Gerd Hoffmann wrote:
> The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:
> 
>    Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/kraxel/qemu.git tags/edk2-stable202302-20230309-pull-request
> 
> for you to fetch changes up to 75bc97ac50634229fa9da45faa1fa64bbe6024c7:
> 
>    edk2: update firmware binaries (2023-03-09 12:49:29 +0100)
> 
> ----------------------------------------------------------------
> edk2: update to 202302 stable tag
> 
> ----------------------------------------------------------------
> 
> Gerd Hoffmann (3):
>    edk2: update submodule to edk2-stable202302

Please update pc-bios/README:

   The images were built at git tag "edk2-stable202008". The firmware
   binaries bundle parts of the OpenSSL project, at git tag
   "OpenSSL_1_1_1g" (the OpenSSL tag is a function of the edk2 tag).
   Parts of the Berkeley SoftFloat library are bundled as well, at
   Release 3e plus a subsequent typo fix (commit
   b64af41c3276f97f0e181920400ee056b9c88037), as an OpenSSL dependency
   on 32-bit ARM.

>    edk2: replace build scripts
>    edk2: update firmware binaries

