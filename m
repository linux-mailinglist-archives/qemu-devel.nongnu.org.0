Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB630606B8E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:48:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleKv-0005d9-Rm
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:48:25 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleHM-0000j6-Oq
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oleH8-0000Zy-FQ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:44:31 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oleH7-0003ew-0n
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:44:30 -0400
Received: by mail-pf1-x42d.google.com with SMTP id 67so844127pfz.12
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QOijmtpVeb65TK7BLzCuibCE8xCtwjuUc6Qwkb3WQIw=;
 b=y6oD6Zs83fv+i+qdUfVuql5z+Vzx9T5m006qW+egHjT7b5GUNP0+kD4FltghyFKqyQ
 jZr+asGHoPXSE6wLvC7RT8MdM8V6eVQf3ku7edzY/EMKNs395HkyAb+O6TLO6q7VDd80
 hXBgENfQzcGmA+3Xqh3UquumjTAayS7kIrR7LFkZRFJDNli/PakSo0OuG1ECyqxgQRfB
 LQ9hRJawdVI03xEtcAB5+zVjBrhe2FacVsbKE6VGIa8/oBFO+WeM30GA15cLob0jRiUz
 qOKmGY4jb6JLo1F5S0YPdcBurOT116MA9ZGw6O48qIosG7IsaZ9rIHZW5mCEDzmGfR4t
 RvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QOijmtpVeb65TK7BLzCuibCE8xCtwjuUc6Qwkb3WQIw=;
 b=H/TJJVDFivUIHtNXYBJwgqVwiBTHu9ms9/0COcKWe9U7atlxSsezJ5Tp1YJvtfNDDm
 +Cq4kLbL05gINk87+oaRxESw27jkJT3tmEbKsoN7m2h8g2fn/nViKxzJF8Mr091Wv69C
 nHeGfuVxWavqtEPOm1Q9hU63+//zfNSvB6hmREjFIADvN8yFwqxOR3XlLS0dnOm8f8Am
 yFRbFltnssJ5eeZjFbs6v6kv/KUqH9FAfX95ODAecQ1IjMcCUzltyAfQOeIC3N4ejKAO
 1k3dqJVyli7j10MaWX0GzehSOnwKmMRstAKMNEbE14WhIdYhrKrgGdOGAVI7cI6FCLdw
 NQ6A==
X-Gm-Message-State: ACrzQf1PRKbuzwIRSzEjcvlpXtZSo3o/W58qcHh3rx7n8MTL9oxDX7jc
 LFOHR2/YajkabS6UMCLcABAviQ==
X-Google-Smtp-Source: AMsMyM73EIUOGRmkimlRNeMCn0u/NoeABsXQrN+JulE3UwC1W315C81wm0FB0itpPbrzue1n7Q5EVg==
X-Received: by 2002:a63:fa17:0:b0:43c:3f26:48e3 with SMTP id
 y23-20020a63fa17000000b0043c3f2648e3mr13627384pgh.66.1666305865982; 
 Thu, 20 Oct 2022 15:44:25 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a17090abc8600b0020669c8bd87sm312673pjr.36.2022.10.20.15.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 15:44:25 -0700 (PDT)
Message-ID: <ce5e2852-3a85-1ea9-c537-d04aef4b4aab@linaro.org>
Date: Fri, 21 Oct 2022 08:44:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] tcg/aarch64: Remove unused code in tcg_out_op
Content-Language: en-US
To: Qi Hu <huqi@loongson.cn>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, WANG Xuerui <git@xen0n.name>
References: <20221017020826.990729-1-huqi@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221017020826.990729-1-huqi@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/17/22 12:08, Qi Hu wrote:
> AArch64 defines the TCG_TARGET_HAS_direct_jump. So the "else" block is
> useless in the case of "INDEX_op_goto_tb" in function "tcg_out_op". Add
> an assertion and delete these codes for clarity.
> 
> Suggested-by: WANG Xuerui <git@xen0n.name>
> Signed-off-by: Qi Hu <huqi@loongson.cn>
> ---
>   tcg/aarch64/tcg-target.c.inc | 31 ++++++++++++++-----------------
>   1 file changed, 14 insertions(+), 17 deletions(-)

Thanks, queued to tcg-next.


r~

