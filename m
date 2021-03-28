Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3BF34BE5F
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 20:53:39 +0200 (CEST)
Received: from localhost ([::1]:41390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQaXa-0001oy-23
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 14:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQaRa-0003kE-9m
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:47:26 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:36395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQaRY-0001ce-OI
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:47:26 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso10217702otq.3
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 11:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YNppx5Xh5zWR3JOI2PgkuSIfbDEOstenekLMju845mc=;
 b=NeEAFS61XawZw87joaCJlc1qXQ+fgORbPz9EyOxcJDnR75hGWMM5dWe3T1tq6OuPb/
 n9XyCTB/Rh8GYsQi1oA7a1HCNmRyWZLi98oqEYg99sWNyNkzCO4Do2ZJmrizQo3+IAoo
 18BH22cP2FBHV/sLSnigDHj44P/XveDAKoLRaUkINS6uxziED0D3c4W5UbH3Zqeg+a+u
 67CoFYvlDdmCsD90nIgYgqX2Rk0D2i9nPufZVPJ1+WbokdjD7Tftr1Cs+60shVOpGbju
 uDs5VI1zym77gBlSMTlr062gw2wCFpRcM2yBHqHiMaZPY6HTyyDDRKDmZ4A7XkM1s0mr
 S0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YNppx5Xh5zWR3JOI2PgkuSIfbDEOstenekLMju845mc=;
 b=UilKFxsnbTxzd8HIcdzqJio2150zNhFIfTYad4GGaNNcw/XmB+UY6Umj5UqFMJaH/E
 ki4jOuZKa87v/hdsrw9UB7JlrXSxHOSkijYi7dtNuqhRe5n2KIHZsunQSD5J6iRonsfk
 CMDzpIUDG3O5UiCV9TFIWpQm60f6dG8EiI/ZtJh3Zg1q/yJ1hDQS+HwaOU2Wlo5wHNnt
 oPNWYFkw3gMjACIeUXcwiCyQwnZi02JegqAMBwlQYX+GqwbK5/+HTMqgdToj8Jniqch3
 y3UphBG8Z8T4Za3Ai2h2YeOq4erOT18KGD6JRru/7GKcJumz8MkYFm/FUpJGLRerAT67
 pGSQ==
X-Gm-Message-State: AOAM533gBjzIvjRXZ/mHXaQjwjzQqv687yJMqXPEPGNAIHIjS5vmHrgA
 Ak+oqPw2St30ZQsoLg59dzoEVw==
X-Google-Smtp-Source: ABdhPJyCtD+zv3fVeNm+w5/tBTLptYbG3MQOQ87NPpoZil4v/DVfFpDmdVX/aHXmMo//PMuu3wa7QQ==
X-Received: by 2002:a05:6830:408a:: with SMTP id
 x10mr20191345ott.248.1616957243214; 
 Sun, 28 Mar 2021 11:47:23 -0700 (PDT)
Received: from [192.168.44.35] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id v30sm3845959otb.23.2021.03.28.11.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 11:47:22 -0700 (PDT)
Subject: Re: [RFC v12 56/65] target/arm: tcg: restrict ZCR cpregs to
 TARGET_AARCH64
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-57-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <39e854c0-e6bc-5104-a8d5-3c5f20b5f511@linaro.org>
Date: Sun, 28 Mar 2021 12:47:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-57-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> restrict zcr_el1, zcr_el2, zcr_no_el2, zcr_el3 reginfo,
> and the related SVE functions to TARGET_AARCH64.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/tcg/cpregs.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

