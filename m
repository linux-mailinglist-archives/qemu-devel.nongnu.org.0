Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BCC6ED1D0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:55:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqyWq-0001p6-8q; Mon, 24 Apr 2023 11:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqyWn-0001oe-A4
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:54:57 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqyWl-0005nk-MH
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:54:57 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f19b9d5358so22850685e9.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 08:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682351694; x=1684943694;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3r2aUnBf70iczuWlEAbWwEzpYb1rvqs0sYREe8Tc414=;
 b=bdETVDC2r1jrEqd6LVxifvmyiz9B2tkVFP9ystLASnEYE1t69w2w1Pw8KatAxX7BOV
 G3zcnC5AeDiRs5bLkM8cFp9Lv+VZsXcW4f4/RtoY8B2KukD+tbc1z/kIdihAT5O8D43r
 SE1Yh+lYNaKZvl4TLtk2zlAPqXTAjQb0F8IMqD8+AHk27rX/pzf5en+/BMZNzVSkRFJM
 U8Hej0wRk+fwCzKeVG/zjdN/Xjf4tYt7/C8ACRJcDmrm5NRn0N6vALao9sMjhkDZM0pD
 96RTa9pyZ1syd200PhF0uQ5JynRLzCdloIokGVI1z0NaNlG1qbGm+6qkyy/99Bne/Qmb
 7olQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682351694; x=1684943694;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3r2aUnBf70iczuWlEAbWwEzpYb1rvqs0sYREe8Tc414=;
 b=aRmGbUdi3PlSmPBDsigtf40bQU5k1Lba8J1xINllME1UQ+ejuaD6YUoWWdyGt1RqMO
 yPGouhwKSwAcRj3WyAP14F/7hKaNTxhqo/w7cY/MGeKdS/FGRcg4YpHFKvcEf7RsvQ66
 Ba3LlgWvtuk2K6yRCcyuheBMkdUv/2RNO3fgzAJzdOReV8pLG4b48znxFSZpaalJ0mKk
 y58XpUaL6V7yXoN6EZrVptCuhzRvJm2B+rUpptl0IS08DobnXu0Vm5xSdHTOOaM6QEQF
 cEiNp67KC9ad7JuGSXdFtvDvcKjqF9RmcxOQiZV05SvGVxkqbFYrnEmi+Yd/n6Ueku81
 DeUA==
X-Gm-Message-State: AAQBX9c4W0BSZSG84LCtydaoY5723DCDGKr6mO+9+dTxJ8eA2BKXzm0h
 GocL9AEtkcatBruTZVNup2u+gg==
X-Google-Smtp-Source: AKy350aICPmKP21wFyvw5lYoHiH5pU0vCXf/m4X0U8JQZMmsSOeT+quanz/QLkubBxARxHeTAdOzeQ==
X-Received: by 2002:a5d:6052:0:b0:2f9:cee4:b7d with SMTP id
 j18-20020a5d6052000000b002f9cee40b7dmr8486761wrt.70.1682351694200; 
 Mon, 24 Apr 2023 08:54:54 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b003f173987ec2sm15911476wms.22.2023.04.24.08.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 08:54:53 -0700 (PDT)
Message-ID: <23586202-25e0-a4d7-c807-696c98784d61@linaro.org>
Date: Mon, 24 Apr 2023 16:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v3 40/44] target/loongarch: Implement vilvl vilvh
 vextrins vshuf
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-41-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420080709.3352575-41-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
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

On 4/20/23 09:07, Song Gao wrote:
> This patch includes:
> - VILV{L/H}.{B/H/W/D};
> - VSHUF.{B/H/W/D};
> - VSHUF4I.{B/H/W/D};
> - VPERMI.W;
> - VEXTRINS.{B/H/W/D}.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  25 ++++
>   target/loongarch/helper.h                   |  25 ++++
>   target/loongarch/insn_trans/trans_lsx.c.inc |  25 ++++
>   target/loongarch/insns.decode               |  25 ++++
>   target/loongarch/lsx_helper.c               | 148 ++++++++++++++++++++
>   5 files changed, 248 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

