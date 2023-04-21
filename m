Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D056EB49B
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 00:21:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppz6u-0007GT-C4; Fri, 21 Apr 2023 18:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppz6r-0007FT-Nb
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:20:05 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppz6p-00043G-FB
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:20:05 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3023a56048bso1729828f8f.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 15:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682115601; x=1684707601;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hH+CvDoYoPdBsPqTz0C7nRbqeWnKiOcvphox59dCQ68=;
 b=d3zdmNgJqtRRNR3T3SoYkl2b6O68Gpabj3V7I5IxolrXcSWwuxEjeuUHEYR3+LrGTZ
 3ZY+iVJzNKxyCUOH7k3Vx59sXBwLsm1DDiDKzBl5p7+kJKDXeOStpluLV4/Ojr8AjVch
 2gmhszFUuRzPEjmO8mbNg5gq1iTS/uO4+4FiYzBRMh3PFenAetd8Dq/TqqpK0YTjzqnx
 68gDRyvUp/FhThbnarAv9LjLisYQ2E9Acpk4nOGPtVsE19hS7pLXB00yzyc9MTHNb1+J
 RFTmcTgIEliztXbuxcZCL4P/uVAhzjaZXfCx71QbSN2VY6Nr3XDGvdvOnLAfi3n5VKZA
 PxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682115601; x=1684707601;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hH+CvDoYoPdBsPqTz0C7nRbqeWnKiOcvphox59dCQ68=;
 b=aItzXU3eO/Y24CcGiCOHizHT8vebW8FvvIKpMr38B+wgk2gv4tYBmpE+Jw7po+KpLO
 Q6UXlFwVWDg1yd+Mc76cOBoqXYy169aZpRyCN9ITe7SyI6ZA3ZrO8w4WrvDw3hBP2fgw
 fkjIxBJVrZfEUcNEatnVpF5YKpQeG/N/lvorn/YubAIOlizSsgu+lGMbkao610ET3R2n
 eQHH1w5ghFv4qRypK5TvAMh/kOYR7//cZGllfL1QbrFX+uMi+bJw17PRVe8kuGe46MJF
 fx4cXRHQKMNxzl2pEn4VOQZ/DYS3UCrZH13xYgZ5TCvPrnkflPrMzcO91F/IJeQqrK5C
 VHnQ==
X-Gm-Message-State: AAQBX9d8ltYYSqs03Se+TbV0GGFHzAOibHls8FQehDTDOui4PWPfpFj1
 jF8qzGFbgHYjvOmrxcqpm+QqMw==
X-Google-Smtp-Source: AKy350baRBAl1Y6/0dAIsI+GcRzuWfBIre1u9VhBIZxFMT72Jkp5QVYdBWJzqa6NMvjXZmHYs6bENA==
X-Received: by 2002:a5d:5582:0:b0:2fc:4e4:b4dd with SMTP id
 i2-20020a5d5582000000b002fc04e4b4ddmr5091979wrv.33.1682115601701; 
 Fri, 21 Apr 2023 15:20:01 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 v19-20020a05600c215300b003ee20b4b2dasm5854655wml.46.2023.04.21.15.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:20:01 -0700 (PDT)
Message-ID: <7f944d19-fb20-cc39-e03f-4d59a7c951b5@linaro.org>
Date: Sat, 22 Apr 2023 00:19:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 21/54] tcg/aarch64: Rationalize args to
 tcg_out_qemu_{ld, st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 11/4/23 03:04, Richard Henderson wrote:
> Mark the argument registers const, because they must be passed to
> add_qemu_ldst_label unmodified.  Rename the 'ext' parameter 'data_type' to
> make the use clearer; pass it to tcg_out_qemu_st as well to even out the
> interfaces.  Rename the 'otype' local 'addr_type' to make the use clearer.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/aarch64/tcg-target.c.inc | 42 ++++++++++++++++++------------------
>   1 file changed, 21 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


