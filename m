Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C84243040D
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:05:46 +0200 (CEST)
Received: from localhost ([::1]:41782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbo41-0001u0-Ke
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbo2F-00018A-Vb
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:03:55 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbo2A-0000lk-LE
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:03:55 -0400
Received: by mail-pf1-x433.google.com with SMTP id c29so11275855pfp.2
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=7oE3LphHX+5q2W3aczMQPQe+qrUif4FLrOSzuX19Blw=;
 b=sSakhlxp7ee0KYwJA8ZQIxbqGersIATMScrzF2FL1DZOEL49CrE9nDiIR2F+CvxZ48
 r9ZxV9o4t69nDeEHnItz3bh79JkbJ5w2DdCDecnj5AYIPSdZwwWn3ueyvlaf5TzPJGmG
 BSkXw7q9U2kEDmX44vbztj7UpUhw8YzVM7tgnWPIkdzp+7wLR2sJB0Jma6ufoWvgzNFs
 H0rbiwvwBbxQAeIbOULaGWxI4fdk8uAqhEI5QzsblUMg3bo0B9lN2sa4YXPySC1v1W/p
 mAqMO0vPQjXGdUAh0cnhtJPpSwC/jWOYfb73Gu7XnH9UXaFeQWKsDWwmczzr/6oz4sZS
 SF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7oE3LphHX+5q2W3aczMQPQe+qrUif4FLrOSzuX19Blw=;
 b=1ikammhtVrwW4uVOk1k3L4QVHCdyC/1QBxHB9Xz5SR94juAFeB0B7l8fotmkFPN+0V
 ivxF5mhNydiludYYPeQwxMPHVSxrp73Nbdj9Zch3y3nrBYJaUFIg+ZBH/BeMc2hWZaji
 +IaIsYqNhIgr4AVuI+q5k+qLQT+hdm+/rJYSDqB7fDE8j5xEcWok3NpBjTXDC4gGJJuo
 Rh0cI6sdpKlb9gpnmCMGIDvWrq606jT1LAeXyXn635gJRwzNyyws97mJlkM/Hhh9u9V9
 4dJX4OBRnrMqr6fHVDVR9OSWk0sFMqhBEDBRQvJD3vcXjysQokaUYLPaj08bKCYvqnKz
 uxgA==
X-Gm-Message-State: AOAM531Gs8457kprr9743BiVznYG6ABU2dpR/RWBLxROR0YgjvFGdEnX
 rWn/igxVq6pMZXsyULteR4HjHg==
X-Google-Smtp-Source: ABdhPJzcaU/6ERIL2S/EUcaNZ8ks9aSicDr04RFYw9sWUbAldFr4E3icqqBcV3/g/PDTjhvdeXWC6w==
X-Received: by 2002:aa7:8b49:0:b0:44d:65a9:fb9d with SMTP id
 i9-20020aa78b49000000b0044d65a9fb9dmr18774795pfd.24.1634407429107; 
 Sat, 16 Oct 2021 11:03:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id r130sm8282198pfc.89.2021.10.16.11.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Oct 2021 11:03:48 -0700 (PDT)
Subject: Re: [PATCH v3 0/6] target/riscv: support Zfh, Zfhmin extension v0.1
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211016090742.3034669-1-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e05ac0c9-3be7-7270-e46b-4da82466ad0e@linaro.org>
Date: Sat, 16 Oct 2021 11:03:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211016090742.3034669-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

On 10/16/21 2:07 AM, frank.chang@sifive.com wrote:
> Changelog:
> 
> v3:
>    * Use the renamed softfloat min/max APIs: *_minimum_number()
>      and *_maximum_number().
>    * Pick softfloat min/max APIs based on CPU privilege spec version.

So... Given that Zfh 0.1 post-dates F 2.2, does that mean that Zfh should always use the 
2019 functions?


r~

