Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C857E64FB93
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 19:31:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6bxR-0000dq-IE; Sat, 17 Dec 2022 13:30:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6bxP-0000dh-Fw
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:30:47 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6bxO-0005Ch-2a
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:30:47 -0500
Received: by mail-pj1-x102d.google.com with SMTP id gt4so5446006pjb.1
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 10:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AgPO0xu817FhYOLr5RRQ4TwQtrLFO1xlfrar83km9aQ=;
 b=AxD4sVyybFKBxGSKugKmccpko6ZHIdNWX1zec+fY0OwpMSLcc6j7e1ZP+M/uBD6d3D
 mUY1dgmT+DhLt1F3fm1UF1q/rwHQH4QtK7REnvFrY1g3wSDnG3cnvJnH+FUTkPtvnLPL
 m7I9mqKgG3MabzMmqWQ1hT8Tfpmpjqa/GdH0Xke2Gnhvv69t7NNDERKfFtsgLDJjTr7x
 BblveeN0JiXpknntJFmRaO8Y4UZBjgK3O/GT0P6JfPqz8yFlBuMldnPwkdQMkblajxOP
 HMds1xmV2GlOSQCUIv+HpOedn6FQlqt+meTkLkxhEq8pWM2xCU0EayL6bgrM2qRcCkz+
 YWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AgPO0xu817FhYOLr5RRQ4TwQtrLFO1xlfrar83km9aQ=;
 b=Zvw9+bfCPeuHz4qlun7ylVoN8I7C1A4TnnzdEQTYn3XmMdBLFRCN1mr0BaRQ0lKfbU
 vpWztjSR2/5V3zznUvR3Z4JWA8Ke90T2UogQ0QpHIZd6X88DKNZkVdHLYhcwhtxSqkE1
 XZFT1GVYTt3HgeQWQNYjDZRs4lomw/TK3gNKw0uLgLp/2MjN/EVq5/wti+B62yOd11ib
 WSF6MKUdzADAzwv81qOUhXllAhjZPV0HPQBFGZDvKhWgQCbpFmCgtHlEvxLQOtq1pG5r
 4kbeIgk9QnTaNtHxr1+WiiTIcYv6dkFszo3dyCDOzd4PP0Lf1oxJxqt/K4TzxQihPNPc
 w/PA==
X-Gm-Message-State: ANoB5plePoAz+aX5sHEEQX475ApkrEbmfSjYjZt32/9+I0P4LnuFO/qF
 ty9kuhv6l6rASGZ2WJFEtfIT2Q==
X-Google-Smtp-Source: AA0mqf6DMp/KBuqFjUEfnnpSvgm1XeYEuZXEhSiehyvNsqPeD1J18LOFisbkf2o+uV1jE7r/8UZrcw==
X-Received: by 2002:a17:902:9b97:b0:189:9e91:762e with SMTP id
 y23-20020a1709029b9700b001899e91762emr36452236plp.57.1671301844809; 
 Sat, 17 Dec 2022 10:30:44 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:dbe7:d50a:f977:e69b?
 ([2602:47:d48c:8101:dbe7:d50a:f977:e69b])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a170903210900b0018853dd8832sm3858580ple.4.2022.12.17.10.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 10:30:44 -0800 (PST)
Message-ID: <f26578fb-d426-2db2-2681-ab5261f3fb15@linaro.org>
Date: Sat, 17 Dec 2022 10:30:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 5/9] target/ppc/kvm: Remove unused "sysbus.h" header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221217172907.8364-1-philmd@linaro.org>
 <20221217172907.8364-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221217172907.8364-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

On 12/17/22 09:29, Philippe Mathieu-Daudé wrote:
> Nothing requires SysBus declarations here.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/ppc/kvm.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

