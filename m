Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7646CCB7D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 22:32:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phFzY-0007jq-MK; Tue, 28 Mar 2023 16:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFzQ-0007j4-3B
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:32:20 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFzO-0006NJ-DV
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:32:19 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 h12-20020a17090aea8c00b0023d1311fab3so13923189pjz.1
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 13:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680035537;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=85WHE6VpgzKLDMcGcaiiKGsWgnOyDez+QweqoLIZBZw=;
 b=piJnW2bl8nHjmbZ8Srp5QE+kphvUYhpMp8cAqcerrAMBqm/aVCELcmdsf5FLGS4NnG
 H3q1F12iKHJUEkhxRmYkNiW9tt9PVDCp3+g0SK8WGMNEFW4sKeAz8Olh+GGy36iPV8zr
 l9capIO8GsQeJGlTipwSuVbr9iM919wAhEqlmydWThQFjOa8Iwf5pqYFiaHsRuoHmE8w
 /jhPgX7oXKSUiYo8tE6JFDeT2EMcX4V6ppHzKEifnrUMSjKqq8hjDrlFd1+L3EBzfHB1
 Ef4cZeN1zo00e1bKcU7lvyFcWWRW4WBNqyrO5LbDX/bWNTACDib/qj9T4MOs0vn1TfKZ
 LCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680035537;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=85WHE6VpgzKLDMcGcaiiKGsWgnOyDez+QweqoLIZBZw=;
 b=gt4OWVFHLVt5wzmnM/lrJDyK6TYId9TkOgrS58Lg9aEBSTTwXTpCJ67Djj6OCpqIRg
 ov7wZL2GfISYaI3uNclGcFKToLMaIfHgHTeV4sa4Xavsen46iC2kF+yhXq0D8Af1HRPD
 SOjv4rvNFJ1X8EOEB1fhcwIHSlyO/rG1iZ4ves+ocfUwXOOzgp/6yrjuXrLSQaYfF51w
 Pv0ugSCovyiz/xJU377y5EWzFIZaBTaTf9oX/jXDa0rb1kp9uXzxozs7BjNHuhkDO05k
 n0l5RzuAicgDbMQ+9DI4OLB+zqv866DIKhyev3vDhyCE4bkM0hGSmU9dXyyrWBPhSxWM
 8vsA==
X-Gm-Message-State: AO0yUKWKGz6FWQo+267/q2fFd01RsJGj2XQadg1op/y0USyJXm6jtzns
 Jgb1TdGD3yPKfrOuLFTXUYGF7w==
X-Google-Smtp-Source: AK7set8LbOIGVTlC/H/0ZTgH6ySUnjd5URspLvTr7iLDbGaJdAlUvbsbsXLkS/NkzfYLFJrXrkBhNg==
X-Received: by 2002:a05:6a20:7b29:b0:dc:a14e:d9bf with SMTP id
 s41-20020a056a207b2900b000dca14ed9bfmr12429297pzh.43.1680035536699; 
 Tue, 28 Mar 2023 13:32:16 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 bn10-20020a056a00324a00b005d72e54a7e1sm21545335pfb.215.2023.03.28.13.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 13:32:16 -0700 (PDT)
Message-ID: <08a10dd3-2799-9331-8603-eb14c59b511c@linaro.org>
Date: Tue, 28 Mar 2023 13:32:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 12/44] target/loongarch: Implement vabsd
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-13-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-13-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 3/27/23 20:05, Song Gao wrote:
> This patch includes:
> - VABSD.{B/H/W/D}[U].
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  9 ++
>   target/loongarch/helper.h                   |  9 ++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 95 +++++++++++++++++++++
>   target/loongarch/insns.decode               |  9 ++
>   target/loongarch/lsx_helper.c               | 36 ++++++++
>   5 files changed, 158 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

