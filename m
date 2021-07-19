Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289653CEE26
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:33:59 +0200 (CEST)
Received: from localhost ([::1]:52074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ati-0000Tl-6X
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5arq-0006fc-FZ
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:32:02 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aro-0006e0-St
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:32:02 -0400
Received: by mail-pl1-x633.google.com with SMTP id b2so5818615plx.1
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MMg8mkBKwgcBPaLlisbuj03OH43/Mu+yVu70jDRIJnU=;
 b=keyPTdk7DORjAMtSkXdDigwSZ6H/JR3DjV+6EShDlL4jtSK74irrPIvzwimOFQaoDI
 kP5n8xtsMPqPhfnT3NIKcJEi3nJ6Y1KQ5qYk3yqU2JZeCtD65pzd0LYUDi1wTPcMjEOV
 JIgspZZf82dj/RdgYfI2SfAOrxYaNhQQnjjg9BI6e3cDEEySy5HxNJE+SKN3tcHuyrFr
 WNPws3Wd2VBWm8pHm7Z0EzwHlND9WJDlP1u4LmnGPX3P1lxRZsqRCh6FEI5m3skXji5s
 YL3FaqfJ/WoHE6xfmMAduhnjkQ3n4ZGTYzkH9fnnoYqtUSyThYNy+l5q1bmdn56ToxFY
 IjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MMg8mkBKwgcBPaLlisbuj03OH43/Mu+yVu70jDRIJnU=;
 b=DqZpptU0NrX8srFQM9cii6eaOh7hV/EPjuIjvf2cfd4FNDeB2w3ryas6xe59LhzT39
 Abc+lM4PD8W5BcUCCBhz7OeKrVZfXCu6g3WdM+wh4/6d+3mGRRlqL83JAy4tBzIIF4ga
 XOT1evZXS4vYKGr8IUMuKmH2rlXSf/GmWgF5xwLrSw/ydzyBLLPeXQ4QujJUxmDVQ3cT
 x4nyg+UHjNi8zBtLtMgYAVUE8ot5qz8YrCffOqbe7dP0Pom+wGNaEMJ4C/X1Gpyqij7z
 5dG3g/MabNLI9mxO5rITF8wU3t+vM4RwhtLgCJ1SJJRqCFDmgZdtDCPaA7kYmixzn2/U
 X7kw==
X-Gm-Message-State: AOAM530k3KuaCaBUmXlbFp0eVi5AQ3u6oBF94TO2fQDZ53E24D+yee2N
 yXGdq9Oc8AOhoY4kEVioOCg8qg==
X-Google-Smtp-Source: ABdhPJxZHnmQig4LLwvjNbL6d4XjhAe001vJpPx4JiPYGdb2qkBJyfRLAWpyrOHCi2aHX3PGoQJEzg==
X-Received: by 2002:a17:90a:4d04:: with SMTP id
 c4mr31372306pjg.148.1626730319264; 
 Mon, 19 Jul 2021 14:31:59 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id o3sm413560pjr.49.2021.07.19.14.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 14:31:59 -0700 (PDT)
Subject: Re: [PATCH 2/2] hw/registerfields: Use 64-bit bitfield for FIELD_DP64
To: Joe Komlodi <joe.komlodi@xilinx.com>, qemu-devel@nongnu.org
References: <1626725783-133765-1-git-send-email-joe.komlodi@xilinx.com>
 <1626725783-133765-3-git-send-email-joe.komlodi@xilinx.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3bc5aff-f961-84fc-feb2-15cd3c533cf3@linaro.org>
Date: Mon, 19 Jul 2021 11:31:56 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626725783-133765-3-git-send-email-joe.komlodi@xilinx.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: alistair@alistair23.me
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/21 10:16 AM, Joe Komlodi wrote:
>   #define FIELD_DP64(storage, reg, field, val) ({                           \
>       struct {                                                              \
> -        unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;                \
> +        unsigned long v:R_ ## reg ## _ ## field ## _LENGTH;                \

Won't work for a 32-bit host.  Use uint64_t.


r~

