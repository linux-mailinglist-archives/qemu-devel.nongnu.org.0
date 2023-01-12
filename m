Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABFC666DE4
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 10:16:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFtfy-0002O6-33; Thu, 12 Jan 2023 04:15:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFtfv-0002Mg-A5
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:15:07 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFtfs-0003Zl-6q
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:15:06 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso14473024wms.5
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VRgN7jM2i2uWnBORbHAQaWiBRV8VB33yEpTKVQT0RtQ=;
 b=MiM/VlZkaNkzPvcqm/XJ2yID6ov8SyDgyf48CYOVwKTp+kTPbqeY22RmRF8GxtP1V+
 y4ZuqeTviVbfiApDAYoNSsXK+Uror10K3kcAdd0z44QpUWrepUmwjVWQTQkQk2irfvXL
 tL2aYQmZ2nYmSWNQAdIPI9tM1gRRG2bEr3e4bkCp/j5C4jMOEQGDPtYForHiiOBCu2tu
 M0Mp+bFRIQ0uSK5tdpjt6MtdMGl5wkqZW6R81J1dn9RjL3oyjdl1BtyyWBnfM4LrL+Xz
 AoxAohcrdoqKRpzLzwRsoGXSBAeYOXF/Ns7HI0Mdui9j25dR1vzLlaAa22YpqvUGLkIs
 YlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VRgN7jM2i2uWnBORbHAQaWiBRV8VB33yEpTKVQT0RtQ=;
 b=BHEt5Q+4VsCrdMsR7R24jupiJ1tGpTu78Iudv2ZYw88jMU+2yWTqMKCQZaze3nnBUa
 8rDK01GmXauOhzZEEaa42Yre+wvvKeZL8GXfdTwYalEjGb+W3jj81HD6yFVM8/ZQoZ3M
 k9DihqSSjktfyJ3/HA6C6kbgavbM/mPEctuYt4NkBe5gEdNNBlsvfudIGs8ENjHmq7k9
 APc6w0cCXtVm6wyM2nZqkzkva3t8xvt/uXxpaYorCh0HYh52d398MPGyq0YuYKSgpEeW
 n7pjoTB2gw2WwTfJhp5M3T1QxEbQO4Np1mSdhwV5Hcyb5h5Y/ePDATnXXIxnQkTU6CIV
 7K3w==
X-Gm-Message-State: AFqh2koh5AqfmWTAiJvf0SqLFxhNayLMF21I82pAgf1wPl3xp3iSEyMX
 XdO1ZzuE/9Qun5NRrr23Fq6gmg==
X-Google-Smtp-Source: AMrXdXtC0Nqaz7JY+CZeqjLnLc8M2/v3N+/AY7GUanv2LgjbjkPBCfP6TL+TNASHTm0LyYrHvB5Y3Q==
X-Received: by 2002:a05:600c:42d5:b0:3d6:e790:c9a0 with SMTP id
 j21-20020a05600c42d500b003d6e790c9a0mr64966847wme.10.1673514902314; 
 Thu, 12 Jan 2023 01:15:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c358900b003cffd3c3d6csm23114941wmq.12.2023.01.12.01.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 01:15:01 -0800 (PST)
Message-ID: <b749a663-475f-558c-30ba-0b46d752c0d3@linaro.org>
Date: Thu, 12 Jan 2023 10:15:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] hw/misc/sifive_u_otp: Remove the deprecated OTP config
 with '-drive if=none'
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org
References: <20230112082951.874492-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112082951.874492-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/1/23 09:29, Thomas Huth wrote:
> '-drive if=none' is meant for configuring back-end devices only, so this
> got marked as deprecated in QEMU 6.2. Users should now only use the new
> way with '-drive if=pflash' instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/about/deprecated.rst       | 6 ------
>   docs/about/removed-features.rst | 7 +++++++
>   hw/misc/sifive_u_otp.c          | 7 -------
>   3 files changed, 7 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


