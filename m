Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245B0440C1E
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 00:27:37 +0200 (CEST)
Received: from localhost ([::1]:36980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgwp5-0000QD-OC
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 18:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgwng-0007zG-Uj
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 18:26:08 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:46937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgwnd-00007j-2c
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 18:26:08 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 lx5-20020a17090b4b0500b001a262880e99so9859446pjb.5
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 15:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dEb4+Tb48c6ror8+8Bx1ijIJhmOV2XCVMKIgQnTs2ho=;
 b=e72EIr5rgicI+qlIpCyBuDcC+3xj2+gyKqvUSztdkA8AZjmQP9nHxLpNOrzwHmjMyQ
 W8CGGrnqO5TQU66jpDWW98C5I5RgROo1vtejlvX7kc7D2mnja9XlVyU8AFRTv4bo03wN
 fNmxGKApBziF+w+2LB+spzKCUjFMXSSSlmk1cvQ72Q8TOYkTaZfVj+jVFzMTvXKh34ac
 k2ePfcFWv9fCvzFrSiiH2MYHGt2w5mqNA/zKHw7fN4uB3UoCVAD/nd10evAZyxr8vsK1
 t0GP43QMKiQpHJcY75jNXasHq5/craOU8WmLf5oVCV4spnqHxZivX6uD5DKNbVwskO8D
 w4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dEb4+Tb48c6ror8+8Bx1ijIJhmOV2XCVMKIgQnTs2ho=;
 b=HmZ+4YPuLRiKuv2dXb8px/BYFnGxyO3L5Kr6ez/XuviFvwH33Xr5qXZx0Yy/Nk8NBL
 Zd3XbC5sbdu/N/mV80agHTfGfXP4DokwyDeYj8QpqUMg2akRWsfBrOwDA3uj1TMgFX2s
 i0oEd9ygGwd63BIyyj2McHawcDnWf8pPQPPGQvGhh1DZz5KXu2IWdyxNNqDPfz0OG57a
 TSwfXukcGejWeFWYJHZ48FyChpiUfbTfkXpxKtDJgOTEJZfAyoaitgKNmbKPxEvFouDO
 YZzACy8XwJ2w2odC8/V14fkNtnGmIJ2eQziVZsX0CZ+nphyyXnZ6CL2lrBCujwnMDURz
 9PTQ==
X-Gm-Message-State: AOAM5324W3gCHdEKnSEh0ERAnENmSEdGtDSxlRrHP9AVX3NcFynEECl1
 VJ+rJBLDsP/Exx3+a2OYLzdV/Q==
X-Google-Smtp-Source: ABdhPJy0eSTjce+K7kYBAIJfVQI/URy78xtg2fRs8VGYjsrQhQ4jOKWr2/vjCCBarqVS4acI31NznA==
X-Received: by 2002:a17:902:6bc8:b0:13f:8a54:1188 with SMTP id
 m8-20020a1709026bc800b0013f8a541188mr16975911plt.49.1635632763485; 
 Sat, 30 Oct 2021 15:26:03 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id q8sm11614809pfk.75.2021.10.30.15.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 15:26:02 -0700 (PDT)
Subject: Re: [PATCH v2 15/34] target/ppc: Implement Vector Insert from GPR
 using GPR index insns
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
 <20211029202424.175401-16-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e71fe5c2-3749-80d8-a597-9a72034ec8db@linaro.org>
Date: Sat, 30 Oct 2021 15:26:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029202424.175401-16-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 1:24 PM, matheus.ferst@eldorado.org.br wrote:
> +        memcpy(ELEM_ADDR(t, idx, sizeof(TYPE)), &val, sizeof(TYPE));           \

You need to copy val to TYPE before you can memcpy out of it, otherwise failure for 
big-endian host.


r~

