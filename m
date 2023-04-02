Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5466D3594
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 07:18:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piq6K-0008Ls-Ql; Sun, 02 Apr 2023 01:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piq6A-0008Lb-DD
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 01:17:52 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piq67-00008a-9u
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 01:17:49 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 om3-20020a17090b3a8300b0023efab0e3bfso29488868pjb.3
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 22:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680412665;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AkkJ+Wgi7EgHY0xddgvSWtxC/9Pi0g+AGI8saiyR6+A=;
 b=vLwFVksn3t+R8QwfkKgcMgA4QZq46NR+DG/ZiXh3C9HWa4YqbHDVDAJ57fyPE65WP0
 9doWyU1GxXyUXb6tUtbEbyDnMBFZM51hutRM1vXp9QUVsjvTpeOfjTHuHVy75xap6/DW
 YZT1AHnMj0nqd8b+bHwYkbgLqauNB8vR0WpQykc7ok+NnQALKWMOY9DW3KoS26TMUs/n
 c6xETReCByrnJYa57R5oYaQHCABJb1knhNpKbgxcbBanEScgUSm19q6KZTQqZEYuswem
 4Q7x9+CuI1UkGacz5gdAoC/42AGC9QL5G3mcNKNzFO+GfU1s3gA85HgX5/k9kHtP/qLp
 dSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680412665;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AkkJ+Wgi7EgHY0xddgvSWtxC/9Pi0g+AGI8saiyR6+A=;
 b=M+pLnSnx58Iuy7dWOwDNjkRvvxW/Xfe1t8JJOrvxjz8RRh1FKXJq08bfAaBYx+KJFx
 AiTlbIJYEJsukLTcynRVN7L9o+1eZszIp0fbNjvFrqfDu3jEaFTyWU6sewG+oBtthLkq
 QWIH1IvKIYqGqItgRbms5Rp0hoAtgEdlb5O9ua1SU9NYc11nafs/3wnNHLhJPAoegf9a
 vfzSH8iMg8RB9AOpfdd+ZAeBhe0kMK79oh/W1jgX68+mmFe+A0JhAidCV4bZOfwV2Ckz
 IgmxboVQE/2Kaz46cq26ZU9FYhf/bswfG1s9tOyh3e9g1rZaUBORRtoyE5o5b7lkqt5k
 5NCw==
X-Gm-Message-State: AAQBX9elFHX/9Xp3GS0tGdwtfjdqj2u9fNzFetiOsyLNzpxl7/yXesAq
 L2C2HXGX23CGeF1KvaW+zNa21g==
X-Google-Smtp-Source: AKy350a7ycf9Xdo7K20hL1QIozTlsByPgEi+cQ++4e4sHfIl6cKEY7OLYRaFKzmS4LkB+cRWrovMyw==
X-Received: by 2002:a17:902:f546:b0:19c:be57:9c82 with SMTP id
 h6-20020a170902f54600b0019cbe579c82mr40590134plf.65.1680412665698; 
 Sat, 01 Apr 2023 22:17:45 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:f30a:3ab0:889f:f03d?
 ([2602:ae:1541:f901:f30a:3ab0:889f:f03d])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a63d914000000b0050be8e0b94csm3897869pgg.90.2023.04.01.22.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 22:17:45 -0700 (PDT)
Message-ID: <1fdc07f3-4e0b-8bd9-3ff4-474c4df6425f@linaro.org>
Date: Sat, 1 Apr 2023 22:17:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 33/44] target/loongarch: Implement vfrstp
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-34-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-34-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 3/27/23 20:06, Song Gao wrote:
> This patch includes:
> - VFRSTP[I].{B/H}.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  5 +++
>   target/loongarch/helper.h                   |  5 +++
>   target/loongarch/insn_trans/trans_lsx.c.inc |  5 +++
>   target/loongarch/insns.decode               |  5 +++
>   target/loongarch/lsx_helper.c               | 41 +++++++++++++++++++++
>   5 files changed, 61 insertions(+)

This one's obscure.  Find first negative element in Vj,
store that value in Vd element indexed by Vk?

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

