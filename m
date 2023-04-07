Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A646DB6FC
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 01:11:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkvF6-0000qj-9m; Fri, 07 Apr 2023 19:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkvF4-0000k0-7W
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:11:38 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkvF1-0002ap-UK
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:11:37 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-517c01edaaaso17265a12.3
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 16:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680909094;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4cErFy4VVSXH+T35LT4D8bhMQRXEc0jWj0rx0ggjSPk=;
 b=OJFinG4r+Jx35MVNhHZcNTMCoIxRVzugHa8wQb0aF3/WTzIXXBfPwEM81GLW5qzvA3
 5ETEJsnkXy63xKZpvH1BGx4E4mJabdebFUPIucQkQ109TgyzR/OJANaStfogZeUwJSvB
 +n0AkGdqt/wNTf7EIX5oMoy0GvlBdDdwbxgBQ/FNmniodkjKXrGRz7rWA6vw+T9AgziT
 RkNSL9rUUEBJmTGgAlLH2V6qPGr0J/0/wvBQXd6nbZl2I2R617/+2FmNyTRd56JrEd17
 LWo9ZJvzBF+Jg+CjaCPLtDsd5FPc+J0a2N1UTbzoR7A8cxU06vM7OEL1iLwmOTtAizig
 nHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680909094;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4cErFy4VVSXH+T35LT4D8bhMQRXEc0jWj0rx0ggjSPk=;
 b=VnoMSyoBxwHRAL1B9OLMmW4bsxyrc3kWaQYGyX0ZJ42c6UBnvCXP0MuMomYvpDz54W
 Q85DjSKMmg9VBmK3LECgzCXoQusx6OX221SnR3un3+i/K7Zs8GxMBWTrMB3RM1WZl6T5
 5THhl/4Nybbfkb+hHD7MoGs361eePJwYR5Qg5aTzDMstjOw9T8VPbFdXkmQ9UMT6+BX2
 MggvrZfOux57MOUfT21OrNOuV2GFFh4nlw/7B7+JzQNFSVEZYe/S2Gx+eI1SIFyF+K+R
 azjdQ65Ist5FxFYI07awmmZgOlrAhlwkwbVXsyF1i17y7yCVxZEkyUoO3g20FL+Zjs3G
 tSNQ==
X-Gm-Message-State: AAQBX9equnRD9TTAuQuRr444ID/Lf5PxpXZIoZEFawTO7YyCLz2zYfK2
 i1K926Wv+NotKxtiZ+0jmvpIkw==
X-Google-Smtp-Source: AKy350bXu0YXNAHiNTKVWIi38x7qw1rEbHmvanIsHsxL3sMeptcsGTDsDeyKqZftiwBuvO2w43WOyw==
X-Received: by 2002:a62:1850:0:b0:62d:8376:3712 with SMTP id
 77-20020a621850000000b0062d83763712mr155681pfy.28.1680909093896; 
 Fri, 07 Apr 2023 16:11:33 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 80-20020a630253000000b005136d5a2b26sm3141345pgc.60.2023.04.07.16.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:11:33 -0700 (PDT)
Message-ID: <b2778af0-52e1-88fa-f2a8-cc4060835464@linaro.org>
Date: Fri, 7 Apr 2023 16:11:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 11/14] accel: Inline NVMM get_qemu_vcpu()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-12-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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

On 4/5/23 03:18, Philippe Mathieu-Daudé wrote:
> No need for this helper to access the CPUState::accel field.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/i386/nvmm/nvmm-all.c | 28 +++++++++++-----------------
>   1 file changed, 11 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

