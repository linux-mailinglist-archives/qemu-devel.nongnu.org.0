Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 355952DAE83
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:08:25 +0100 (CET)
Received: from localhost ([::1]:52572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpB04-0003H9-8X
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:08:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpAxi-0002Ov-Hn
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:05:58 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpAxf-0004jE-MV
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:05:58 -0500
Received: by mail-oi1-x241.google.com with SMTP id f132so23377443oib.12
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sF5MqK4yxd9gDJ0iX5slLKtyZ6EKixC9fgB+YXtc2dk=;
 b=oMqXJtOwgpkEv3jAmMh9mvWAKKuW+kre0fOiqr4U1JaQonzU//HA9TtT3V4ocbKqs4
 ryJhp8EesYy2SlzCKgCmW5MAaNujYOfx1Z459yAFitQQb94w7PYySZKqGpPUlA1tFIVS
 a1oQ1PaahYhAC5Xuvrgrath/Y/IGnlnp1/AI6argTrGsr1t148nP3xoPElfzoG1HE9KM
 ilmFUTjRyUHApXMSToFOC79yY3yyNBw9uXZ2S6BLKFIcll/rQtS38JC1zA9HJhpkM7+1
 npR3geazLj1Cv7mlqhFQQu6TKI4ljojRiTRZFpjOTDRFujohjMvxlBN7ilc6o9z5B1kW
 4dDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sF5MqK4yxd9gDJ0iX5slLKtyZ6EKixC9fgB+YXtc2dk=;
 b=jsyqKcPLTjkPoHOvXx57Pjc1un6e3pd/CnbTDBE8RkP2UU+4fWRmFSXJ8DuVLnWaG7
 KYdeVg2O/sgIj2Dtaau9w/Ttd7iSOoJCCluGfm4Z7R+NNY+WjNtgC8fioV8hi33gAlqE
 fhofF5jDf2RQGOvuO70/sjnHT2HaxS6L94GbHERBCRAzQOZ3MWNcQHp89WJQ9NIHgn87
 9IF10wrSLGRkL8T2duXRzOS7Hy4Eu4aGmjLaZcOxnzNuZ1pNCpxnCcSwsrqgaWWr9RoF
 rYQJ+agg0qYFJRKiMeqry8wSERVE86q4TUts1yppO6TsxrJkLztyXQCNb3ebSAetJyUx
 1jrw==
X-Gm-Message-State: AOAM53212tZWVYwFNeSB05hXAs/qn3i9L0Lh/v1zhQKW4X8/G6mqrAMD
 8TybnyukWuU0ivGH9OxNa8u6cg==
X-Google-Smtp-Source: ABdhPJwGyo0ebi1PtpjkY3UEX+D+pWBmfOuIapdRwZ2HL5QN2jdZP2U/wv3hHEfKsrPIKJdMOiTAuA==
X-Received: by 2002:aca:4f47:: with SMTP id d68mr21718103oib.135.1608041154730; 
 Tue, 15 Dec 2020 06:05:54 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u24sm19515otj.27.2020.12.15.06.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 06:05:53 -0800 (PST)
Subject: Re: [PATCH v2 04/16] target/mips: Remove consecutive CONFIG_USER_ONLY
 ifdefs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201214183739.500368-1-f4bug@amsat.org>
 <20201214183739.500368-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1a39c10c-4bc0-3468-e781-727b6d23710a@linaro.org>
Date: Tue, 15 Dec 2020 08:05:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214183739.500368-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 12:37 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/helper.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


