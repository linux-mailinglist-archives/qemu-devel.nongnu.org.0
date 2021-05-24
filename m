Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C8C38F234
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:24:13 +0200 (CEST)
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEJI-0005X7-U4
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llDnR-00016j-IY
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:51:17 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:42804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llDnN-0007wv-8V
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:51:17 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so11477506pjv.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yLBGaOG6ccgL5RPnD1PZUTRq8gOxQGuPFlWTblMQsJs=;
 b=q4Qb0tTDcvSd4BhqTqUdw82539D8Qc5h37KbHJQgmw0i7KKHenNtHrDW4YEMwkSiQJ
 xwK92efwoJGUZrnPeUv6sMAdc7z/ZVCY1yRHzA0ML0G8M/aUTlJY5jgtLfjD1luNvJAS
 lYv2WWpa0pQVxBI6sAoaFd2NO36hR2K3s2vbiO6NYBpJ4yQecj/QivLqRc2AYg5xxA6d
 Xo+UoCNm6+XCmp/wRCOK5u/7Dogok2dPFJvA0RF6wQ79vTFTc6NRmcfxePT33mxa9tJO
 FwLU/EdKKhH1rs7DM42tiV8I7TWmQ4M17loQ5nOLtruRBgIss4l+H/Wc5V6+W/PCnoSm
 D3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yLBGaOG6ccgL5RPnD1PZUTRq8gOxQGuPFlWTblMQsJs=;
 b=M+lyNzQMvcfiZ0lXs7TKgxI2DN3yP3aKOF8mhYCai6stNgr7cH5J8d9dTcNxheMoBG
 A+4rUxXxPdCicOT/IzL8jLh+xp9QVfb7CPf78Ut9H/tDlatmT4bUQsDmyR7Xp0WBzv/m
 zjNGDWVXenZPMUXxE/DseFz7ZmIMWlYwaqa56Ky9jlVW05OH/ykxEDf8VM28izOm0Co1
 +jjQMQ0Dqn0SrsCT3C8maqihHIl20M/hpoKqgBNbybdKbCXev0dFtXveYA0e074u71iP
 4RMHMTwKg6/dtMLveNT5vybanHfRKsRfojahLskjocj6nXZ13ULnhyIppfUrWal0Ztse
 prTA==
X-Gm-Message-State: AOAM530Yc//V6Rb4EHjHU3E+Lvx3S7wtbnZGzukPMOchQFfmbs8RuygH
 nhDt8lst/UyIF/oKUk3zmZ12j7SoJ7LAvA==
X-Google-Smtp-Source: ABdhPJzaZK9z1wToIaofo0/w1WC8uuJHaS4FeNZXHBgH4Z8ZMQvMC6p6vV2GyB+Qb5z+3jWXMijecQ==
X-Received: by 2002:a17:902:a5c9:b029:f7:9f7e:aa2f with SMTP id
 t9-20020a170902a5c9b02900f79f7eaa2fmr15726784plq.54.1621875071675; 
 Mon, 24 May 2021 09:51:11 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 c3sm11199698pfi.213.2021.05.24.09.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 09:51:11 -0700 (PDT)
Subject: Re: [PATCH 6/9] target/arm: Implement M-profile VPR register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210520152840.24453-1-peter.maydell@linaro.org>
 <20210520152840.24453-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e3b04611-5704-90d9-6dbb-9e0105b01d30@linaro.org>
Date: Mon, 24 May 2021 09:51:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520152840.24453-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 8:28 AM, Peter Maydell wrote:
> If MVE is implemented for an M-profile CPU then it has a VPR
> register, which tracks predication information.
> 
> Implement the read and write handling of this register, and
> the migration of its state.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h           |  6 ++++++
>   target/arm/machine.c       | 19 +++++++++++++++++++
>   target/arm/translate-vfp.c | 38 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 63 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

