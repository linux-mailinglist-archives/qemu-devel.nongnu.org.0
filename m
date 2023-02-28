Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9876A5DA8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 17:50:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX39y-0006Z1-6W; Tue, 28 Feb 2023 11:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pX39w-0006YZ-Go
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 11:49:00 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pX39u-0007uQ-ND
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 11:48:59 -0500
Received: by mail-pl1-x634.google.com with SMTP id u5so7685150plq.7
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 08:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5dze6lFdGwvMwGWaoDcn+1noTjhrr9r1Da+Rc7qCZpU=;
 b=ptWplnVaLoaRHNC2TtnmfMwyYYImVszZ/d/cLuuhDZhBJnnjd+5P+I5sMrjuWIKCfu
 FXyObi1ane50ZuYn/t+gSk7n5WBoKV1LmOKxQDURu8rJPv4t2CAYLihlOCy+Wiv06+IC
 9NEIJ3ITjn+85KOg2w2CpzdsQF3bAIcaoq2ybpnPURtMMkaShC1Ffxo08NpicPeBASwX
 JErbuhO1ln3CqOTODvBBvZsA5tbQaaf5jq7H3TymK49KC1SKd0jQEPVn9pToRM0QSe6O
 Fk0ULqqJrfoyluIBKOuwqBC9ISM8jglnqQZve0m6XIA6NuV19I5c4ffncNWN4NVTZ7n8
 3PuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5dze6lFdGwvMwGWaoDcn+1noTjhrr9r1Da+Rc7qCZpU=;
 b=dSOy1Btc4J3frUEgm/dF1EuLD5H2PcaxSnD1HuBdxLNX0dQZOOpdwnpC9EJBl+vld6
 b7G2AkASlKMGpn62DRFfedlmYrFZnJ+1k0Df2wQc8JmO3+d/JXQeVG686jN7NZxrekiI
 weEyu+VbRLsl4+f8dvJy91KXv2qjy3RliKWOK0Na4p9iUBq67QsfVHJOWjUzpweLA2x3
 pu/cOuvAVIRsUQ0+vRtYY+Bgw8JN5T0VGi1syEtUYjoSB2ZUoLY6KVYPYtqMOw+RniOM
 7snab2wK94uMuioTutFnxeNpi+Cxw7sf/K3H0DRu9vTbnxuQyIH3dZZKHb0f8e5WXgiQ
 vxlQ==
X-Gm-Message-State: AO0yUKVSM4CD54+lIhrgSC8rmS5I5Ot8ba/ikDKkV4ivIXByrbO177Bq
 kU3cbhgqkee+M22m/NU8jrXw5g==
X-Google-Smtp-Source: AK7set/IqrZ6Kdc91bZqN75YiI2Du/6rz1yk8l/0e4RCJeCJjdY0uZ6WBp/DT9uoYMbjm9Yi3vJk+Q==
X-Received: by 2002:a17:90b:4a52:b0:233:f365:1d0b with SMTP id
 lb18-20020a17090b4a5200b00233f3651d0bmr4150796pjb.5.1677602936646; 
 Tue, 28 Feb 2023 08:48:56 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 c2-20020a17090a020200b002372106a5casm6406884pjc.44.2023.02.28.08.48.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 08:48:56 -0800 (PST)
Message-ID: <058f2dc0-ee24-8a88-4cbc-03f2ce63d675@linaro.org>
Date: Tue, 28 Feb 2023 06:48:51 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 10/43] target/loongarch: Implement vaddw/vsubw
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-11-gaosong@loongson.cn>
 <268ef762-fce5-ca47-d5f7-bd60955a3a0f@linaro.org>
 <f5c0796d-62c9-691a-c2ba-e4dd9e654831@loongson.cn>
 <e75fd2b7-9955-ad2b-62d2-30d7b85d7e7b@linaro.org>
 <f484b933-8f9f-6f0b-0d81-7202bed31d83@loongson.cn>
 <1ad204fc-8f7e-0f1c-e8f6-163d11f3880b@linaro.org>
 <c795a157-21a8-a8d7-bbc1-ed33e7f32747@loongson.cn>
 <c5913a52-e5de-4fb5-688c-6d3fb3215353@linaro.org>
 <5ce46e81-b2c3-8b45-1bd9-9705520f4557@loongson.cn>
 <5b3120cd-ddfb-770b-3216-0f02e89c9c24@linaro.org>
 <0ba7a544-347d-0a07-5f73-dff7fd347cc4@loongson.cn>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <0ba7a544-347d-0a07-5f73-dff7fd347cc4@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 2/27/23 17:30, gaosong wrote:
>          Vd->Q(0) = int128_add((Int128)Vj->D(0), (Int128)Vk->D(0));

You cannot cast like this.
You must use int128_make{64,s64}.

> These ways are can be chosen? 

Yes, out-of-line is a valid choice.


r~

