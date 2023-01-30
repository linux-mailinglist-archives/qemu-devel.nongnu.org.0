Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D078681C79
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:14:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbSw-00048e-RI; Mon, 30 Jan 2023 16:13:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbSu-00048W-UE
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:13:25 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbSt-0007ki-4N
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:13:24 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 c10-20020a17090a1d0a00b0022e63a94799so1962886pjd.2
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pnxOWhs0dsFWFkY9vVSlpp/XEvorggQRqeR1fKz8B3c=;
 b=SQ5tPc/YEj48bDloDDcbJHedrLn9F9j4viM0WHuWk/YbiEmF9e5bZ7Db9NKJaA3I8+
 qBH1xJG5Qdy4JbEZ877uVUagHATpIcmv3mtMnrcaL6iE6nSEIhyZ7W0JOyOMzH9HSv1D
 prmNMsPBcOPB+H6xZVm8qHc/0BvdpmV2VzcM5RFgf5Aw6r9wImDZ9dJZ8ZADPDS9skNS
 V5oCgggiQfGF4T250mhhWhvjfAEKdrz5xSyKOQqMijz3YQZS1Vy5aNqSO7ijtVx4KyIv
 /pNt4NphIb4zPI3r8JdI2VfhoOlM1rcFsirWUQHbXFsh1HBpIf6doTyfQSATdf1J8VGs
 GwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pnxOWhs0dsFWFkY9vVSlpp/XEvorggQRqeR1fKz8B3c=;
 b=fCpUsS6CHlG439zhUlBKYxzszPQwnleM5JOYV0s0VNhc81yh4HzM4oH6h4I6ZgMe5J
 Q9n0BvBwnlEEYjYF5wyE1OuvpejtU7HrKX2dMBawfwCs13jD8M9K1czUdM4GgEeG8epp
 vWzpPZoUda0Oc7LqPf/0NsP2wdXdQWeqdWgTLEAllSLToBig9baZsjkIratS34uusMu8
 AgkTaU4T660auqmiHP8ryqxYF+nsDG1ngj8Uh/p6TvhZO8R1PJld9GGK/K2Q+FPxaAj8
 LtPR2py94e2mDKTL3cN+PxIHq7Er8Fu1sS27fKFb4ynW++m6SbAZLzzDDMVfDXJbJLw6
 8A9w==
X-Gm-Message-State: AO0yUKWcVVT0+LqO3VOCjbUzMeb749OQlb6w37aI8rcJkE+4PWBfTmTM
 iydsvzPAc/WLF/LWt+A4+STwEQ==
X-Google-Smtp-Source: AK7set8uuDXDsgupLJgvFA6i3L28TWWzdOD/3K9wlGXoHnnMfheoVnTJOjQZmRnSexX93Qh/LmudSg==
X-Received: by 2002:a05:6a20:840b:b0:bc:fb05:3c3f with SMTP id
 c11-20020a056a20840b00b000bcfb053c3fmr8394892pzd.43.1675113201434; 
 Mon, 30 Jan 2023 13:13:21 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 j6-20020a170902da8600b0019601f98550sm8256753plx.132.2023.01.30.13.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 13:13:20 -0800 (PST)
Message-ID: <ba570f7f-8853-7e29-b351-5df0277b7373@linaro.org>
Date: Mon, 30 Jan 2023 11:13:17 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/6] tests/qtest/display-vga-test: Add proper checks if a
 device is available
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-4-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230130104446.1286773-4-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 1/30/23 00:44, Thomas Huth wrote:
>   int main(int argc, char **argv)
>   {
> -    const char *arch = qtest_get_arch();
> +    const char *devices[] = {
> +        "cirrus-vga",

static const char * const devices[]

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

