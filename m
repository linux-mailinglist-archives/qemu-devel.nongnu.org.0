Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D696F2100
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 00:42:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psWmP-0004I3-3B; Fri, 28 Apr 2023 18:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psWmN-0004Ho-9k
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:41:27 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psWmL-0007mN-JS
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:41:26 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3047ff3269aso164931f8f.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 15:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682721683; x=1685313683;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0cuvsEbBhCtuQzbt1hUViFpMfr807snK5BPN0pHj8nk=;
 b=Dpb24JZjNfF/BBFERkAAmCteJ+a4xGF8bpRWFODOs+TwSLuV3e1f2x1sS+5QpnK/d+
 JIfAcr45f6QVaA6dxbmX67CSSl3iFCybIr1zBQ77H2aBbdJxXAh7B0r9wSfYs/RrqdM6
 XXOkXslemMdv+Xcia9bFz4sgqSTbyf08UYAgETEPCpJDjPuzPl5sS/UG+5qEK3N422uS
 ijgjuDvJeh9fJkkXFhTMJfhkc0hWoEfua14jAMgQkyRlk0Ax5Ak7e14nP3GhG2jgy1yd
 8s2bLBWzZzN8klGtpd9Fhp9tmPZUngmnpJ4dvrfG22itG4gFU7iYF8MQBqfJmtWQbBcL
 vH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682721683; x=1685313683;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0cuvsEbBhCtuQzbt1hUViFpMfr807snK5BPN0pHj8nk=;
 b=a+1jw6zI0sT42gjjdBb0JvkwzL9qFhiq3MFBvxGDCq1kRoGLUF5cMt0M0CBn+JfFIK
 gdiWyQ8qhl6uod/gBPCfabwBSP2J9ycEvTHTIGKNNJl0FWMGQy486CYh8CqOM3TAWyY0
 ekEEuuJlMzob7NdmfWGNEsRND5+F2qTlleNBFYI3+nF7Y5XAWY0QrHd2yCXiB7qb1rSb
 92iwEa6F5wXP/q5cL0nle8Bs1Gi6OVlOsaCgbYUxuEymV8hyx0GIPl/1AkE65r52rSu+
 BJrmEGpeNSn+jLyi7vRdJK6Gc+YTAP+9xej1XorzT/TePwb2Zu2Myp+n/Uj++wSEfUSx
 udrg==
X-Gm-Message-State: AC+VfDyCzCuw8BEPv3JlwvYHusdKs/VAXbXMBkUWzBoOnqQCpEEoA++p
 QDF5Bsmd7lwAJ1/e8NUEEiGszA==
X-Google-Smtp-Source: ACHHUZ6CBXLQ5gCKt2seqdiKXKMVQKpM3dyIKRg7+KjCHZbPYn5VcaDPJ7EtiQQUy6Q+kqkjAcgDtw==
X-Received: by 2002:a5d:544e:0:b0:2f5:c57c:192f with SMTP id
 w14-20020a5d544e000000b002f5c57c192fmr5346414wrv.68.1682721683677; 
 Fri, 28 Apr 2023 15:41:23 -0700 (PDT)
Received: from [192.168.192.175] (47.red-88-28-19.dynamicip.rima-tde.net.
 [88.28.19.47]) by smtp.gmail.com with ESMTPSA id
 c13-20020adfe70d000000b002fbaef32231sm22057901wrm.22.2023.04.28.15.41.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 15:41:23 -0700 (PDT)
Message-ID: <2acdf22e-52d8-64c2-a41e-b55dc30dab17@linaro.org>
Date: Fri, 28 Apr 2023 23:41:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v11 01/13] target/arm: Move cortex sysregs into a separate
 file
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-2-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230426180013.14814-2-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 26/4/23 20:00, Fabiano Rosas wrote:
> The file cpu_tcg.c is about to be moved into the tcg/ directory, so
> move the register definitions into a new file.
> 
> Also move the function declaration to the more appropriate cpregs.h.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/cortex-regs.c | 69 ++++++++++++++++++++++++++++++++++++++++

Worth renaming explicitly as cortex-a_regs.c?

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   target/arm/cpregs.h      |  6 ++++
>   target/arm/cpu64.c       |  1 +
>   target/arm/cpu_tcg.c     | 59 ----------------------------------
>   target/arm/internals.h   |  6 ----
>   target/arm/meson.build   |  1 +
>   6 files changed, 77 insertions(+), 65 deletions(-)
>   create mode 100644 target/arm/cortex-regs.c

