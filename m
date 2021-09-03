Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6938640073F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 23:06:10 +0200 (CEST)
Received: from localhost ([::1]:36922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGO1-0003w4-Gs
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 17:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG5C-0007LR-FF
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:46:42 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG5B-0005LU-2n
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:46:42 -0400
Received: by mail-wr1-x436.google.com with SMTP id b6so385398wrh.10
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iqdwPLo2K3RI21l9gXuiXao4eP8JB8WY+vqQ0WaBJYA=;
 b=cV4LBnHBdSH4DPwIQGvvqXR9USmhQnakcT3EL2mDgM2cS/Rc32IzPN0IoSzqVDUCjH
 tlhML3wH180OMeg0lGMzrMid9ck4nE0felZBPhqnAURHl7qOUSnIhdRN1o1iZWfhVZwr
 qdKkNdZ3xvsjx9qQycmFWk589DLzje0h7z3c/NJ/USc2vwOJ13WHH+AyqAYZYHznHPx4
 8iFcZMuv+ADAEK9kA0DhHVQlQy0G7JSSzO6Xn2eWsc1YoWB6FnnxsOoAcvhbOgGu4SeB
 f01FFeIVwPd1sly4hsuWDRNM2B0A9ATB7Yv+WmY9D+ghmCrwEii+y3gXX+ZspjoVJ5lI
 OOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iqdwPLo2K3RI21l9gXuiXao4eP8JB8WY+vqQ0WaBJYA=;
 b=KGfIHpBsCPrr5HrxXHGer5ujhzvSXbwTzCgd4POV1V7l5YW2/MeJQXXqCmZB/RbZwi
 ksJYDzTXh+MG1mX0Cdrl7B/HbGZCGJsu1liNIAWgyy3aZjDD1Awni896ucIE7wgmzjxh
 s2Cn1XxXr+OIZgxZTZM8t18k+7KUEf9rUrD0eabZB7SA88KzKCtzHR178HbBiYPO3UxF
 gPFf/CamMcyJ996JwGs9yV3dUnky1AmLReNwAnGMUM7vqpt5k/kTwJx2Ho5Dzcsj6Pbj
 nXvRymC/zf8p+Z5I5IX+M1UMKLSJ7QUPeVfa1HTmJ9uTLIKPRVAQeS2zH/6WDR4DS0i4
 UirQ==
X-Gm-Message-State: AOAM5313vfeXJ0lKcLFwxFL/R4b774rB9LLHgoraAT8TivgHL9bH9LAH
 ZLgw8L2OMKnqfPGOyO3h1buyFb5cEtDZdJxo6R8=
X-Google-Smtp-Source: ABdhPJwOZrrxs+WNE9l+CEwkAPQxn1SgJQQnwBR2RtEao2rfkQb+2qQcpo5tAJUx4+5V17DYDgrP4w==
X-Received: by 2002:adf:9e01:: with SMTP id u1mr916408wre.420.1630701999870;
 Fri, 03 Sep 2021 13:46:39 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id u27sm306852wru.2.2021.09.03.13.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:46:39 -0700 (PDT)
Subject: Re: [PATCH v3 28/30] target/tricore: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210903181435.761585-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fbc8ce60-35d7-9cc7-21ef-3f28c76df2ca@linaro.org>
Date: Fri, 3 Sep 2021 22:46:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903181435.761585-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 8:14 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/tricore/cpu.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

No CONFIG_TCG, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

