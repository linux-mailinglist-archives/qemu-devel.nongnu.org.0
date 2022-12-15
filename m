Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCB364E214
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 21:00:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5uOK-0001Vx-OF; Thu, 15 Dec 2022 14:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5uOI-0001Vg-2B
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 14:59:38 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5uOG-0001nU-JU
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 14:59:37 -0500
Received: by mail-pl1-x62e.google.com with SMTP id g10so77025plo.11
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 11:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mmlz48Yl4LQYLJVbybQ6cfHMAxFG9VrL34pW7l2suUE=;
 b=o1kmBse0hXeRydXRRuP+42+ZCahMdfJk+2nWVptXU939PrFiO5qnMdZJkwPOva5JXO
 WlpvL/V2mbrX5WpvYpJtwTpUXrvtHW9AgXuWpLRloK1lFirVAd5TgYvTe90azRHnVO/t
 6IieaPioSjyOSjVXYO5yS5rfF//W5jrZk8yOd3RPIeDaENRTg5RmvVIbBVKskOFT94r1
 GtuvZT+Tn1JJkXU9OZCmyvQpImhmND7C7TwlGuX8lKqW8NuCIx7VTnt9asYru+ooEwbe
 ZNIDTN6YkrJhW8507yL4oIB8Y5IqdDAgwtT+yWXy3e1qd2CkEU4S8CyrynMfu79g6TXy
 8XpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mmlz48Yl4LQYLJVbybQ6cfHMAxFG9VrL34pW7l2suUE=;
 b=r+VBi63+eTAUBB6TtanWjQ2svrwTRVWn7TV35TpWH0YRYRQPGyIa6TP0YVzgWM6eow
 x2zTFLIhbnIjDda+g1FlWmRrCqdCFMhEbqaUtwubO7tZPFabSlCXRJo+RJLyB+ybV19T
 QbecymAJEU5S9QwrI7sd6uBVv1GIshW3l5/NRcQ/BeF/1wlvIuffxwuH0guiv3+hWmoF
 Yk8bGTRpitMoB+6VzF5ByeRThusRnTebVP9FjyZOpqLeTyw+D/SaGvzOkglpjQERTa3c
 /5diytK1fq73m187OqGYUSgUbBsAD6O1RVSEcGpIuYcYTvUfY3dxcWQTNGZidVZu7KpY
 QCzw==
X-Gm-Message-State: ANoB5plOSHjNllCnDpjX26xBzoDhwnLgrLo5jt/zvdLe7Myvt3SL5ySd
 St/UCDmxOtpEW7fTADF554zaHQ==
X-Google-Smtp-Source: AA0mqf4OL/vDosATRVPUmoiiJFxmkGM1Yw2n8CbW+lo+pH5eflVbMyLzJxQKRE40z9/35Xovh4R53w==
X-Received: by 2002:a05:6a20:9e49:b0:a2:c0e2:587f with SMTP id
 mt9-20020a056a209e4900b000a2c0e2587fmr37842477pzb.10.1671134374878; 
 Thu, 15 Dec 2022 11:59:34 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a80f:54a1:edc3:6cb4?
 ([2602:47:d48c:8101:a80f:54a1:edc3:6cb4])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a170902b49000b001899c2a0ae0sm50323plr.40.2022.12.15.11.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 11:59:34 -0800 (PST)
Message-ID: <40660187-fd37-53e2-f3ef-b8e8a9cc27d1@linaro.org>
Date: Thu, 15 Dec 2022 11:59:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/8] tcg/loongarch64: Update tcg-insn-defs.c.inc
Content-Language: en-US
To: WANG Xuerui <i.qemu@xen0n.name>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 WANG Xuerui <git@xen0n.name>
Cc: qemu-devel@nongnu.org
References: <20221206044051.322543-1-richard.henderson@linaro.org>
 <20221206044051.322543-4-richard.henderson@linaro.org>
 <f6a305b3-692a-28fd-2587-a7e17b0fe363@linaro.org>
 <fac0ef00-d806-4041-0fe3-806d38acf544@linaro.org>
 <ae502c46-3751-e4ff-9d3d-aafe770887e4@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ae502c46-3751-e4ff-9d3d-aafe770887e4@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

On 12/15/22 11:50, WANG Xuerui wrote:
> So do you need the addu16i.d marked as @qemu now?

Soonish.  I made the change locally, but merging back to your repo seems to be disabled.

> I can push the change into 
> loongarch-opcodes tomorrow if so wanted.

Or that; it's probably easier.

> Of course it's probably better to maintain the 
> used opcodes list in qemu's repo, let me refactor this after I somehow crawl out of the 
> pile of day job...

No rush on that.  I don't see any other insns that are likely to be used.


r~


