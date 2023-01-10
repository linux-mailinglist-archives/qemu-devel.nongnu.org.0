Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368536638AA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 06:38:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF7KR-0004KI-Qh; Tue, 10 Jan 2023 00:37:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pF7KP-0004K2-IT
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 00:37:41 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pF7KL-0000ij-M7
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 00:37:39 -0500
Received: by mail-pl1-x629.google.com with SMTP id d3so12042180plr.10
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 21:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z4M+M7Q4vK+c/tLWBjrETXUl0PEhAhKao/mOyAJMqvI=;
 b=Itdzru01jrOIjqxlTSTA6eCEFg0q9BDavME4TsSrR2HErJTPy/a4Qwzp+nWO3UgD8N
 2YO+DJtDMD3sQW2emI3PHAr7pdeSqKAluTH8o8o2W/WOJXcFOnfjlfUE0BMF0DcCueX8
 RKVnU+jnQF9NmJoekWxjUPI3dcTvUWOtrtg/3to/nU+zjfJLkDMjQzrPMJep7SnGHeW/
 FrWcJNag2U+i2zTP1Ex78aLerQEfllZRDh4/AVEsrfZfUIRGziebWqxvxk8t4l8O/mLt
 YAsHUlLcHSUzSko/PYVaLfdkC7GO8syDl1/7h8hFB636olB2xzmb5kV1Z5VAec1re4iU
 2HqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4M+M7Q4vK+c/tLWBjrETXUl0PEhAhKao/mOyAJMqvI=;
 b=VFT081tFWHYctBwJng5kOCq2XCkQc0xLmGOkqt2uNkLmDnuun/VIRYWQ7d3qmfeVNR
 J+6QqkLaCVDe0R/7zmJq6JGMIyjUDYdroP8yKdfzYlwmtxL2agARPNjAMOUH/Vp0O0SY
 nz1eb36cu9ku3tlrcZcitfmZd2gCFwLZDo8KA5bUW71bIxkVOQHy8f23PlRNmsPrrukG
 mcRoCXCfBfizzeEMarRWVViiTRCSd4LxqFdu2zORBH1a1P5cyO38qMpciCxVsfQbUvtG
 hYReyP3WO1uyH5XH5dHTTwI9MRPnw1+1kEpG6FH2V3THNOiHES8JKoYLQfbttTq70lkj
 bVNg==
X-Gm-Message-State: AFqh2kr2Co4oB5EYo/kMw8lex/tAo2/FAaV+DR4T/eMQubBMX8Z6sjzB
 58VS2Fj8BYXB91f/W6EaEkpKTg==
X-Google-Smtp-Source: AMrXdXtSvOLUpa4OYQtf6gSdt2AEM0xmwq6I4OQNvfMQoNJNBk4GQObF3dfkH7hLtM+vc/uy2etS3A==
X-Received: by 2002:a05:6a20:b91c:b0:af:9dda:b033 with SMTP id
 fe28-20020a056a20b91c00b000af9ddab033mr68113368pzb.37.1673329055614; 
 Mon, 09 Jan 2023 21:37:35 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:fbd5:d294:fb18:71f9?
 ([2602:47:d48c:8101:fbd5:d294:fb18:71f9])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a654c4d000000b00496317241f9sm6018758pgr.51.2023.01.09.21.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 21:37:35 -0800 (PST)
Message-ID: <5ba2a9d6-936a-e3fc-511e-af9866a001dd@linaro.org>
Date: Mon, 9 Jan 2023 21:37:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 05/19] target/arm: Move cpregs code into cpregs.c
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-6-farosas@suse.de>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109224232.11661-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 1/9/23 14:42, Fabiano Rosas wrote:
>   target/arm/cpu.c           |    1 +
>   target/arm/machine.c       |    1 +
>   target/arm/meson.build     |    1 +
>   target/arm/op_helper.c     |    1 +
>   target/arm/translate-a64.c |    1 +
>   target/arm/translate.c     |    1 +

These additions of #include "cpregs.h" are unrelated to the code movement.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

