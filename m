Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C250129D1B7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 20:35:05 +0100 (CET)
Received: from localhost ([::1]:53602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXrDs-00062G-R4
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 15:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kXrBH-00043P-Bm
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 15:32:23 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:35965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kXrBF-0001Zh-F9
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 15:32:22 -0400
Received: by mail-pl1-x644.google.com with SMTP id r10so129521plx.3
 for <qemu-devel@nongnu.org>; Wed, 28 Oct 2020 12:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=48Ii98kvxfnb0+4GFB3a22YFl4kb6Qs0d9AIKmvQ7Rs=;
 b=m3IaaapXTxgygLWKuYqMdlY/tlw/1jCJs5zrLgnQtxhINxX3W1Gq48zLre0DtpB0Hd
 LXhZARPeXnQa/1h9JcXFORllz1lrojUf8U9pXCt1FkwFRMmmVmFfUhQiX5KDNcDwNZMl
 Jz16e7zqi+XvVSCEtRMLL64RlCanXNeFY88UX+DrV+8YpgS9R4dEzkR2s/Iq0w/HuKf4
 fDzU5dCFAqdcGiE97aGtdGUXiqU8L7d25X5iPer72PRwFQfvLzLvkNLHkb+nGFmjZl8X
 gedEdwSHvqdJ0xrvG1gW3gOxcN8htBeuGnwjlkhbmbA3/daMcWfYK0ANZNjJVt0tepZY
 pUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=48Ii98kvxfnb0+4GFB3a22YFl4kb6Qs0d9AIKmvQ7Rs=;
 b=jG5n4uAL1vDc4j75KFGB4xCGTzhX09nMogU3gJv0QhKXfCRUvYIOC6b3RYK2B3j17e
 YuIwTN5Ubv+7k2VnCfzRBxze2RM+RhTTv2WOzbFFkLTnAcf6LumsPj4V5OZSVr3XvozM
 sc+a1K1P+2+c862hrIE0RzJSZxEMdjZHlpCdqxyXAEta40zCylOrzJkxDprEJuk5enRu
 2aM089fkZgxVT2bqGefVNQX8FP5TqalMgpFTismNeFqLcgh2KKwYHPLJGrorn01IoTyP
 wnk+Xfg2dY5M70QLEWqtZwUJGBziQORO8wtoIBmtfqy4xCzz6e/pvjGkKwOql3X1X+62
 sUjg==
X-Gm-Message-State: AOAM533mp885NHnBmmv7FnAIj5rj4CErXs2mM5xMiPJjk5hwQGqZlA0k
 5g/Ikx0Bn4YScHYGOec4FPOhZPYb66RSFw==
X-Google-Smtp-Source: ABdhPJy0h7HqTuzyAywr40EusqBGI73IIBnx38a0+UkErdKslm9ptwkiP5wwCnUdEtVtX3I1AC9aFg==
X-Received: by 2002:a17:902:6b07:b029:d3:ebaa:d028 with SMTP id
 o7-20020a1709026b07b02900d3ebaad028mr585852plk.11.1603913539020; 
 Wed, 28 Oct 2020 12:32:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id e6sm176646pgn.9.2020.10.28.12.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 12:32:18 -0700 (PDT)
Subject: Re: [PATCH 00/11] target/arm: Fix neon reg offsets
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201028032703.201526-1-richard.henderson@linaro.org>
 <CAFEAcA9v7VHpy48rRShyei_TQpzt=_HWVitGEuaybpG9w7-y_g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d7768ff7-c6a3-033d-41cf-f1d8d22d9f0d@linaro.org>
Date: Wed, 28 Oct 2020 12:32:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9v7VHpy48rRShyei_TQpzt=_HWVitGEuaybpG9w7-y_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.921,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/20 9:48 AM, Peter Maydell wrote:
> I haven't reviewed this yet but it fixes a lot of the
> problems I saw in my risu run on an s390x box, and I
> don't see any regressions on x86-64. However these still
> fail on s390x compared to an x86-64 host:
> 
> insn_VPADD_float_f16.risu.bin FAIL
> insn_VPMAX_float_f16.risu.bin FAIL
> insn_VPMIN_float_f16.risu.bin FAIL
> insn_VSDOT_s.risu.bin FAIL
> insn_VUDOT_s.risu.bin FAIL

FWIW, a risu run with my cortex-a15 trace files came up clean on a ppc64 host.
 But that wouldn't have tested DOT...


r~

