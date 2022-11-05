Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C9161A664
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 01:23:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or6xT-00043F-4l; Fri, 04 Nov 2022 20:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or6xR-00042q-2K
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 20:22:45 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or6xP-0007Dw-H9
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 20:22:44 -0400
Received: by mail-oi1-x22f.google.com with SMTP id c129so6849319oia.0
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 17:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WRpPaCMxZTkpEwd/fl15AFd+MWGcuhE+vU2cGtOJZcg=;
 b=zoVw07G5dpJuTXXz26etR18Btozu+8LuAK1U9G4z9bT2ACeKp/sSxDYG4V6VdRanKF
 o0KhIwPF8NtmHqzxhVW+pnKIJj2iyI8WnU89vjopFArqzoE0hCcgIViIX2YBGoxeAI5y
 D+K0cBzIyU7GgdFMA4APcNqSpoJvm/kvS0d5zGCVEFwbE6rtESI81AhIS+iQWs9lIIw6
 GFo6tAbCCPUpncyNOCm0cXNkcsSM5VWuBjtMzWiIW04CDJh3d6npy9uojIOBEGIXttJ1
 y8TlgoGBCCq3gcCAV66lpvzUKm6sFFUNha435bz0ZDjWOwe/ttd9jQIWDSyQ7s1nj29F
 7VgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WRpPaCMxZTkpEwd/fl15AFd+MWGcuhE+vU2cGtOJZcg=;
 b=qKZjbl5km7y8SvND08QgudtwDuwfDhhbDrVVHlAa4ZZc9GxhZTq7XlHLhipDDyPOv8
 mtsE7xmEh4MipIRD5RKMm4t61j161/zRBf7uyXvJHytFceK6/f3XK1X3HQtS59McRqhv
 wIoTLBnL7SHmt8AZSC5+CSqnX4hTl5NGWIvcajvjN8k/4+XlClMfzyJ+21Fszm0xldHe
 BlCrwA/yHWJaUcSNowaEAUiMAjk0zC4+IENpCIx/EtxUQrTttgzX2ORZFXScq9fAgb5b
 DOoHDcfYfCIfI8QqF3+nF5/A3ZoH/aJQ9CnLz75flYSC047bg0xk8y5eLydE/W58tp54
 +eyg==
X-Gm-Message-State: ACrzQf2klDw0RpVv0apDzij61ionblyBzUcDls6dN/jFYG9TqqL+LCrj
 WqaW6s3SNumYvDONYWs2dflvBA==
X-Google-Smtp-Source: AMsMyM7xP7MMuL9mUy96UB82uLRoU/0hp+9P7pP7MCSapAMKBSvGZ0aiIlzjibwLo4as2mr6AnV4SA==
X-Received: by 2002:a05:6808:1446:b0:35a:e73:5c39 with SMTP id
 x6-20020a056808144600b0035a0e735c39mr16269174oiv.113.1667607762283; 
 Fri, 04 Nov 2022 17:22:42 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.28])
 by smtp.gmail.com with ESMTPSA id
 s124-20020acac282000000b003458d346a60sm205170oif.25.2022.11.04.17.22.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 17:22:41 -0700 (PDT)
Message-ID: <96fc7ba0-fde4-9525-ee16-98e06b31c2e4@linaro.org>
Date: Sat, 5 Nov 2022 11:22:32 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 09/11] Hexagon (target/hexagon) Add overrides for
 various forms of jump
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20221104192631.29434-1-tsimpson@quicinc.com>
 <20221104192631.29434-10-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221104192631.29434-10-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/5/22 06:26, Taylor Simpson wrote:
> +static void gen_cmp_jumpnv(DisasContext *ctx,
> +                           TCGCond cond, TCGv val, TCGv src, int pc_off)
> +{
> +    TCGv pred = tcg_temp_new();
> +    tcg_gen_setcond_tl(cond, pred, val, src);
> +    gen_cond_jump(ctx, pred, pc_off);

This, in particular could benefit from the complete branch condition being passed down, 
rather than setcond here then brcond based on the result.

But it's still an improvement, so,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

