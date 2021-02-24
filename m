Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF8A323565
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 02:41:08 +0100 (CET)
Received: from localhost ([::1]:55202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEjAp-0002uw-SI
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 20:41:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEj8L-000297-C4
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 20:38:33 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:37505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEj8J-00081I-VB
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 20:38:33 -0500
Received: by mail-pg1-x536.google.com with SMTP id o10so404796pgg.4
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 17:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9P9Uje7yNTMpqc035Yzyg5SVj7YJsp7wrKAUUnCIOek=;
 b=d4qaZFVq37RAbG6qZhIjKvdk7b8X/GyY5MTD9RkFc4u1PfEPQ++2N/wA3ECI/YL8x6
 c+MuT2vMs29jr+l5Km/EjGhUcsS4HyJGekqI1EKNne8ssIGbf0byoUez+KXog5pNw3JQ
 KQRnI70a0UZNCwhI1uN7AhYWUTNPCI/BWswH3AvdzJgpNdtHhnHHScRqM3MgHTyo3Zbg
 YkwkI8/ns/NPoQmjZ92YUn/e65O+82K4EHV/9R7cTVrCFs84yR+P13oOMgDz7ChZ2yEb
 Qmxq5Ej2hOdprW7KIKJXmF6Lsw0tWsYPCGoqtGDzm0o9tKjnYH9LIbhMTZymgHlXMuvE
 HSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9P9Uje7yNTMpqc035Yzyg5SVj7YJsp7wrKAUUnCIOek=;
 b=OwaNX5s2fLyQPKljHXLtewB4K8q5IOastKPbLWUcEwstCPnOHxK2b6ej3itRNjPTLN
 jPSmLKpnE1dQ7uR2UeTbDMWkl/I0T7zTpN+ae9pOZYMVGwPpG5tyBGDaEQaHBS/KyGMw
 n4HDWuRGykMiyem0mJ+0JfvDfguLEu8dTeDH61GrDCD/t5yjTdPHavGhNv0yOwcnvo/4
 YH2q+ItZqMeeDFIHax7xh97HI8ebfA7TwZbuBPwW4WpSo+PWF5aij6zF1XNtlX1pqLi2
 9j7ZvO+btvOxI8RzSDhHUZbKSKklWP9WfFB+47A2uDE4BAbMmwqdB4W7eotUGxBTZ5yv
 rvrA==
X-Gm-Message-State: AOAM53300d/rphVFV/mfJDOdDjxUqu3Su2Ox331Ybm6oRNVVcS2g4AYx
 F4lLZaIbAs0SUrmgg8GUeu4eRA==
X-Google-Smtp-Source: ABdhPJySYZWkuuv18GXzCvH1SBbCR4DelIf9JxzhGlofBzEplOCmxJPpH0G4SZzNkEH7Xco/fquBYA==
X-Received: by 2002:a63:44c:: with SMTP id 73mr27531944pge.128.1614130710566; 
 Tue, 23 Feb 2021 17:38:30 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id z68sm217432pgb.41.2021.02.23.17.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 17:38:30 -0800 (PST)
Subject: Re: [PATCH v3 08/10] target/mips: Make mxu_translate_init() /
 decode_ase_mxu() proto public
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210222223901.2792336-1-f4bug@amsat.org>
 <20210222223901.2792336-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8e6bbe51-eecc-fbb5-0637-5bc527c77bfa@linaro.org>
Date: Tue, 23 Feb 2021 17:38:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222223901.2792336-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 2:38 PM, Philippe Mathieu-Daudé wrote:
> +#else /* !defined(TARGET_MIPS64) */
> +void mxu_translate_init(void)
> +{
> +    g_assert_not_reached();
> +}

This is suspect, see next patch.
The rest of it seems ok.

r~

