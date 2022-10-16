Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B012600304
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 21:40:11 +0200 (CEST)
Received: from localhost ([::1]:34470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok9UY-0007YR-76
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 15:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ok9MW-0003AW-SY
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 15:31:53 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:42668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ok9MV-0002wP-AU
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 15:31:52 -0400
Received: by mail-pl1-x633.google.com with SMTP id c24so9014914pls.9
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 12:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ef4SU4m9rkphfr0e41s7IEw5ImKzOOdRCzmKkuWyfR8=;
 b=By3t955oFnGr588HQcJPg5vrCF0TTG+AN1vP7HlqqtjNHDwKbSAFBtZIPGpdv9N65+
 +dJiDZTvE7U8N5zgbc+qXihJuGh20PuAF6QE1diTGhnCLJxMeBMSBQpswVaghmGODn2P
 0Ht1JR0mE7lzSW7TdBf8K16Sj++9kQnxVDohCLdc8N3c3BOA2BpLNLfVOuCE94T7tlO2
 FFqDx/AVybKLuRcjnDgKS7pVw1jZSCi8tKJ7CubrA++B0Xe46X3ZLv+n+2rY49XxxAbK
 V5NSgHXRt0GultpjA8A0aY33QraTzR0KPXH76orsEIVJuN+0v8+cnzZjh0t2SFeKS44z
 +OAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ef4SU4m9rkphfr0e41s7IEw5ImKzOOdRCzmKkuWyfR8=;
 b=rYq79ee77VvWq3Z8zRXockAXicFdlZPQc70+9O0C3wKVAvMhkpD5Tnn5ZWnVxwracX
 uEz+vBe3xvAxmg1VJcgrR2z0sqlOPS+HyiZoFCmyPsz3j8qIsSu0nN9mMGJU6/kxjz2W
 f/Z7YE9qa26Fj5U1M0UgIBUp34dve4wi57PZLpRayGvPmJXIhRCVdVTq28QbdTxnR0UH
 nHkSRM9x3Zt5lb9PYOODakSTHZiM1gaKWARsWPM8+nZCFR3P/PXTeBBlTXbpr5m8+/LM
 TtJXapabq0cEP/3eYY8DgfCjYix6Pn/2srwNWRGlfphXy0OhWojefj0auFS2d1VKFgC7
 kP2w==
X-Gm-Message-State: ACrzQf0mMCzOvGjkfn1qjpNwrHRRvnhQXZgObz6x6gTQAmbw7LOicWu7
 gbiNqXswB0vuN0W1VXRhoNNcIw==
X-Google-Smtp-Source: AMsMyM7yltmQ+jjfLICTjGzMSmnvWUjZccs1WQd+AQeMxeHUCQN0rcU8UXYOWLgsnMUblb7ztMdKkw==
X-Received: by 2002:a17:902:d502:b0:185:4eaf:fb0f with SMTP id
 b2-20020a170902d50200b001854eaffb0fmr4239586plg.139.1665948709522; 
 Sun, 16 Oct 2022 12:31:49 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a170902e84400b0017829f986a5sm5136359plg.133.2022.10.16.12.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Oct 2022 12:31:48 -0700 (PDT)
Message-ID: <0240e34f-06c0-ff7f-32f0-a8d1a94d476c@linaro.org>
Date: Sun, 16 Oct 2022 20:04:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4] tcg/loongarch64: Add direct jump support
To: Qi Hu <huqi@loongson.cn>, WANG Xuerui <git@xen0n.name>
Cc: qemu-devel@nongnu.org
References: <20221015092754.91971-1-huqi@loongson.cn>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221015092754.91971-1-huqi@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/22 19:27, Qi Hu wrote:
> Similar to the ARM64, LoongArch has PC-relative instructions such as
> PCADDU18I. These instructions can be used to support direct jump for
> LoongArch. Additionally, if instruction "B offset" can cover the target
> address(target is within ±128MB range), a single "B offset" plus a nop
> will be used by "tb_target_set_jump_target".
> 
> Cc: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Qi Hu<huqi@loongson.cn>
> ---
> Changes since v3:
> - Fix the offset check error which is pointed by WANG Xuerui.
> - Use TMP0 instead of T0.
> - Remove useless block due to direct jump support.
> - Add some assertions.
> ---
>   tcg/loongarch64/tcg-target.c.inc | 48 +++++++++++++++++++++++++++++---
>   tcg/loongarch64/tcg-target.h     |  9 ++++--
>   2 files changed, 50 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

