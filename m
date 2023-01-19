Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAB267442F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 22:20:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIcKa-0000nO-Bj; Thu, 19 Jan 2023 16:20:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcKQ-0000i9-OT
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:20:14 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcKD-0006r8-C2
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:20:08 -0500
Received: by mail-pf1-x433.google.com with SMTP id s3so2496278pfd.12
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 13:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=72zLcV3sK1RlCOCsOdXIc/58H/AkVHfMnNzdXl4YEeU=;
 b=V9ssgleXcoeejMPdq1Np/hHKxegHPs15Z0a0nQYDk3RuFypEag/DY2Lfb5tidWoo+I
 Y3xOVBaLwI+3VF8qe6TCTAawB0wbc2+F31SZVR2drOnW7jXqZ7u6GqGNeXet8NRLtgu6
 yAR/2HcNK/57TFc5S+PkeF2z+BV/lSnWFZgqKrAoR5sjA/7IZCHKnubxYrazIsgzuZpc
 gWcKKdpK1DkzBJxJhWcxjeHN1VTNqkEmrRacnWY/OSu+qtnEJAT4xNDHiiUjhfGOUqI/
 jpiGcgguza+0NdpoOvAz3ZOFxMh+6U1Q/7iZobPqkFpaQvFJlfjNoCo3b91lgjgUZWHa
 6oWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=72zLcV3sK1RlCOCsOdXIc/58H/AkVHfMnNzdXl4YEeU=;
 b=57LOypbTqqG0EVzygnJQ2reAd6JLRqf/l10uHhhzyg00u9gD+pdSJo8HsATCYIHQj1
 hCqvJ7rIkB2vLD+q2sDhr030iMSmng5N/JWqE9KBonafql3HqxKgw6CXkn9ZEu+rKF12
 qAZ+YIHq6P4JegOnhxB+aM4RVJoKQXTV+4cd1/ucEfHc1dmmNYuTmH6CwviCQPz9l8V1
 h8jqVv5HJ3eMgnqOqZhKZXWnl9IRQ+hGIE6hvJ8yh/cwpGHM9K4/UshQy4rW+/KfwVtZ
 Q5K9uDMVWFHGhwIHOHOXMPKr3YHoyjXrp6GLDAlBXUtZp9yuLNFuXM1+vDTa9FnvV1Ah
 dxLQ==
X-Gm-Message-State: AFqh2kpWZGlqUvD9BTKLlckbujgZ9hgYYOVMZSCsLnJfr7lqkNleNkEh
 rBEvCQuP8RkFco2rGLqrzzGVdQ==
X-Google-Smtp-Source: AMrXdXu5em4hP733Ne0Po9TlnG4vN3Csg7XO5ZTmUZyrygcg2mssgZpHW2UJhPxKtu/HKwQUUExsbg==
X-Received: by 2002:a05:6a00:181f:b0:58b:d244:b525 with SMTP id
 y31-20020a056a00181f00b0058bd244b525mr18742724pfa.17.1674163189382; 
 Thu, 19 Jan 2023 13:19:49 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 o22-20020aa79796000000b00581ad007a9fsm998773pfp.153.2023.01.19.13.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 13:19:48 -0800 (PST)
Message-ID: <c4371f5a-3e2c-c6f3-b370-b34578bcf8d9@linaro.org>
Date: Thu, 19 Jan 2023 11:19:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 11/11] tests/qtest/migration-test: Only use available
 accelerators
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-12-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> For example, avoid when TCG is disabled:
> 
>    $ make check-qtest-aarch64
>    ...
>    20/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
>    qemu-system-aarch64: -accel tcg: invalid accelerator tcg
> 
> Reviewed-by: Dr. David Alan Gilbert<dgilbert@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/migration-test.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

