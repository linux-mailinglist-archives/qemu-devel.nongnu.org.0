Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098DB6F0483
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 12:53:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1przEy-0006vB-VE; Thu, 27 Apr 2023 06:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1przEx-0006uz-Gs
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:52:43 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1przEv-0004DB-Uv
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:52:43 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-953343581a4so1272108366b.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 03:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682592760; x=1685184760;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z4HfwUyrM6lLB1NF+R0TvcNNnSDmxBtGvYevW585MqA=;
 b=dL0ivYTZ5hah+mYKGVptrmC2ILtgp5r1/ThtEZwKWQnenmPootSxdg+cX1d4uofKIW
 PZMPW+cSCrwtxMYEzALejuLJhicb7ciG7+GXngfj8Fe0QrwTMo/09deS0keIaIS9wiEG
 gYGgX8gDFKCvZCCLsAJvXcPjaqJLNCpN1gQIorAmB+dgbhU1zVXqkyF69+eucoqXdevg
 AQGwv7pWrzYOptapwx9pGGu/d98d3VTLjVenodr9mQusx/AersURoSlKjtxOL3Hs8F2g
 F3/ri+HqKAOIUia9PWr5u4gZhG7qvSduCECcm2cEC2AG+X2DYymIsDkE54mPbT/bDRoe
 vGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682592760; x=1685184760;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4HfwUyrM6lLB1NF+R0TvcNNnSDmxBtGvYevW585MqA=;
 b=HZTcY2KR3dZmhxAkYmpee9M9iJJJUh+kLEghBnZz6i3Q7a35DkdOmcmmUKCMktn0si
 DbAUNm162vPacjfJIyaUuSNrTYr5Dp+Ls7HPx7ohUJleSn8eidtmjuNqnwxaAXGkM0fQ
 +4OQi1FnqL8f59VGhg4oZu85wvg6OdXV3esYX2YCMTzwmkrkHPVHaItIcOjwuSEQzWAz
 RDC58ti/ZEV/8TXfGlVQ/GfGBQFLtJU4N/ejr+mG09g8mtTjtzRMwnq4WqlrMky+b+ei
 BHJk24oo37aBFesZIsJCICPnp+Gm8P/jr8Dw24TQu2bOfWwMtpNUSiVnBX6pZcpBSNri
 6Dug==
X-Gm-Message-State: AC+VfDzIeJ6DFjzGUA1qRg2cJZ0GboEJUseQ0qPJfB1fNq/p4wBhljh+
 q7MGBo9ZNAOlaikgXcixoBnt+A==
X-Google-Smtp-Source: ACHHUZ7+4eovaGI7VQ6ZypP6UY6LFjIEh86FztwqNrJpv4U0d/+BLVHGGrt4aQaXGnmYnq+Uv2ogvQ==
X-Received: by 2002:a17:907:6e90:b0:94f:5079:ade2 with SMTP id
 sh16-20020a1709076e9000b0094f5079ade2mr1333125ejc.62.1682592760178; 
 Thu, 27 Apr 2023 03:52:40 -0700 (PDT)
Received: from [172.23.3.19] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 ml24-20020a170906cc1800b0094e6a9c1d24sm9724140ejb.12.2023.04.27.03.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 03:52:39 -0700 (PDT)
Message-ID: <3425ca09-0576-105e-4707-63c668c90260@linaro.org>
Date: Thu, 27 Apr 2023 11:52:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 15/21] Hexagon (target/hexagon) Add overrides for disabled
 idef-parser insns
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004234.1319401-1-tsimpson@quicinc.com>
 <20230426004234.1319401-6-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004234.1319401-6-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62f.google.com
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

On 4/26/23 01:42, Taylor Simpson wrote:
> +    tcg_gen_not_i64(tmp, tmp);
> +    tcg_gen_and_i64(result, result, tmp);

tcg_gen_andc_i64(result, result, tmp);

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

