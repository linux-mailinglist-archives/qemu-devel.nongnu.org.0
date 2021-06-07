Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BFC39E440
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:43:44 +0200 (CEST)
Received: from localhost ([::1]:55784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqILn-0008Bb-IL
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqIK7-0006Yx-7l
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:41:59 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqIK5-0001tR-JC
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:41:58 -0400
Received: by mail-pf1-x42e.google.com with SMTP id q25so13512043pfh.7
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t0nDpuDzn3JA7UxECElFthKtEWeLHPEQHDIisjV97KQ=;
 b=Ybwq23zwds2U3LiyAf06CKtAvWk/mj3bG6EYUeyf3Pepanb0iMozFIMuGk7pVF0nYm
 /+OGerJi0I4vSD8ktc1WnbJNexHWs0M/TS+Ru8Ryc+RJ5xXrddBo0b87UbStEykFe9EP
 yd9FXHugjswnxhlI8DRbUYxZmJbyGSvdmQFh362heoCIt3SGsxr6IiP58rCAo8vUboaw
 DlEqrpC2eR9MIX620WohylPgoeXp/csNF5cdeBXFHLr1rnLQ15bMYS6lHsQMfm/HSNeu
 3kCFz/0E9DT6f+yDPKbIq0zGAwleoxiNph+2B2sfBofKldU1EpMQ83e81P2GYj+f29Ru
 /YFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t0nDpuDzn3JA7UxECElFthKtEWeLHPEQHDIisjV97KQ=;
 b=ul1L74TMwcEYn6Ozug8s8Y4MzmMJ30XzXqoOm3igLUq2KhDDzsj1qQFN2D2nsUJXa4
 BjsIfIB71OYFylvHX66JygM3W24ZbXSqlfoB+XCMqoF/txOJk9birMVgqMabKWhtqs4P
 /LDUbpUxcjE3Hm4k1zPOsGYkjP+aiLRx41hWNSVh+lqD5bq3rYgbMjuKdfFwclDMiYAu
 sPn35LMsVNoZRoaExlq2RaCt23EpQkeFQaBPyoSCnIOM2epIqaH54WzuvOztyIKZnxR7
 MaUZ8sYsjBnjqFBsCMCh1SyqkFK9eo+c/LqYl+Fwju66iNAdhgDr0luldQoGA6ruyk+L
 D/nA==
X-Gm-Message-State: AOAM530QhzVea9ylxIS4kd6owG5KpWEHQN0cAXqL541WPt9PqgSYSu9D
 aJmiyFKWLt1gGQxEPpWCdxfFmg==
X-Google-Smtp-Source: ABdhPJxtsW/5omcsfw+kqCY6VtwsC1TS9lzdHQuU5hP/MbuMqd31NcwjscVSv2Vxh2qFjbp5Jv/PrQ==
X-Received: by 2002:aa7:8509:0:b029:2e5:8cfe:bc17 with SMTP id
 v9-20020aa785090000b02902e58cfebc17mr17971747pfn.2.1623084115795; 
 Mon, 07 Jun 2021 09:41:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 gg22sm18063pjb.17.2021.06.07.09.41.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 09:41:55 -0700 (PDT)
Subject: Re: [PATCH 03/11] softfloat: Introduce float_flag_inorm_denormal
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-4-richard.henderson@linaro.org>
 <871r9dod1w.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31a70d8a-0b1c-9641-e2bf-3625690fa6b6@linaro.org>
Date: Mon, 7 Jun 2021 09:41:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <871r9dod1w.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mmorrell@tachyum.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 8:35 AM, Alex Bennée wrote:
> So I'm guessing Emilio had the original flush code split was to avoid
> multiple checks against s->flush_inputs_to_zero in the code. The was
> possibly a good reason, comparing the before/after of float32_mul:

I assumed that the most important thing now is that we test floatN_is_denormal 
only once -- the test for flush_inputs_to_zero is fairly trivial.

If you've got a better ordering of operations for this, do tell.


r~

