Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1726F35F4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 20:42:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptYSz-00026L-Bt; Mon, 01 May 2023 14:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptYSv-000260-Ps
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:41:37 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptYSt-00017x-RM
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:41:37 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-306281edf15so2213514f8f.1
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 11:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682966494; x=1685558494;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=56o9MBjha8RjgfV5hmWt+VpdTKxDxZnZEOm3GjB7RZo=;
 b=g5B0kghkLJQ2qLlJr4i2ectCHj9J7o3TYAOcdwLyr8EHqSzmxVWX1GuF68L9+6XqIz
 GAIMZlnhyKFTwZuu660TCYt9P3e6EseD77AZbksNnMs0/fHkwv/R2lNmwH6Dbn+Xe5Pg
 DHOTm9ovVM2mIpUOY4RPEwlZjVLqTDbpBSznT5/LVcfz1RYYc9gwTieeKXH539R3dmEo
 k+jHXqnehkIjVyHlLXVfrjVIgLtNw9LT1pahASGOVEKAFK7XXsIHMN/zroQ4S9VNsvNn
 KjjFKT+sY9oDS5pi6vKfh0ZcKTXilWHsR3rn5Ly7yEE2GCyBRTHPqrpwS/MhtGZa9VwA
 lZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682966494; x=1685558494;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=56o9MBjha8RjgfV5hmWt+VpdTKxDxZnZEOm3GjB7RZo=;
 b=LPAI7QElfSAew9OnnoIuwAv9n1/C7Z/yw78RFiKzZiaFjUIjSoPLHQCqavIWYTBoyB
 pbuRVEjXSPTilJ62BGGD4/I8KPD9HoQb5uEpPFXFVDh6CL4Z6Y6+18s78ebo8FSguw1+
 jH0R1zOp6Jyy4/n7P8pQxCYhGUTGUlBFbbQhS3tPGE41LujSYQ+kLMd3vo5IRKK0y4lU
 j82Dlhje30Wdio+ySRn6nM7xv8Fwn17L89l14izsUbKgTyUqbyMYcAhGMj/cQ8sqWh2l
 7FP88pri4rqZlOFMaywAdBM/mGUi1pBC1D+nPTrPA+fmM3lW2wcm5mVgBfMbvZBuii7R
 rStA==
X-Gm-Message-State: AC+VfDxyXgg2fG2bEz4mjACtUZj78mRsHzVqoXZWvlw53bz4giVc69JN
 ZjQDV9qq/x+Pm0yofFCXp4UbLQ==
X-Google-Smtp-Source: ACHHUZ6h7FS7C5VgEFPbfDjTKSKdw7hdQ1fHNO6N6UzoLH8nCz1cV0SPabP5gQGyEriFr3r3RGH3RA==
X-Received: by 2002:a5d:6649:0:b0:306:2aea:3dff with SMTP id
 f9-20020a5d6649000000b003062aea3dffmr4167887wrw.31.1682966494030; 
 Mon, 01 May 2023 11:41:34 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940?
 ([2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940])
 by smtp.gmail.com with ESMTPSA id
 i11-20020adfe48b000000b002c3f81c51b6sm28790268wrm.90.2023.05.01.11.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 11:41:33 -0700 (PDT)
Message-ID: <139ac799-7491-a894-2cee-9a3c7cae3bc0@linaro.org>
Date: Mon, 1 May 2023 19:41:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v4 41/44] target/loongarch: Implement vld vst
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230425070248.2550028-1-gaosong@loongson.cn>
 <20230425070248.2550028-42-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230425070248.2550028-42-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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

On 4/25/23 08:02, Song Gao wrote:
> +    tcg_gen_qemu_ld_i128(val, addr, ctx->mem_idx, MO_128);

You need MO_128 | MO_TE, here and elsewhere.
This will make things correct for big-endian hosts.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

