Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFF13722B5
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:55:07 +0200 (CEST)
Received: from localhost ([::1]:39018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldgWv-0000LM-Lg
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldgVa-0008Ih-5J
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:53:42 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldgVX-0005o8-5k
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:53:40 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 p6-20020a05600c3586b029014131bbe5c7so127420wmq.3
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 14:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GrojwS3eLVhc0RMuTtVeZUWzQ6mmv3iA4VyzMxYOqkw=;
 b=F5r1/g4VjmHHD4aTgTnG9EJT5pYpjs5SlgrN+Maw/P7IayyDPwYf+ltNQadR9KctdC
 tEeOILbqkM3hM4mQL0QI9rmun633/wNvJuiUCXimdhMhCrn7tYZ4J6YGEi1Kc/RtNOOu
 R7CSISbI0tAjSJk9yALP2p18bJihvUCXvIMw42GGxWqnTkDG5TD9H6q6T+EeJecwArIw
 yfL6QL/LfXG2I2aQh+MxAqm5pzj3Yu+m8KxVfsQq+NwNNJ94WTbRwcqHik4sgoxltBFb
 luTr4Jj1eV4/wP46WvVG4diwWHMWiOhDhGnf1C0W3uaTk3fYC1nrk9hh0Et933OvM7HC
 8YKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GrojwS3eLVhc0RMuTtVeZUWzQ6mmv3iA4VyzMxYOqkw=;
 b=ZYdsvsdcpTD8xruOxCl9OPtQvPu0v30Je1OsqGNZClWrIRtUOxFDWXF9CnZuOL+pCU
 L6VpTko7E55Gc1uc2jwMD1r1mADzt4csaAkSd71vAO50BdBLo/O+1S2IEEosOAtcs1iZ
 uG35FO3+nHs4uraL8wPTNbolRtmGLlj9Posw9uR6+wDJ926OFJ2cq2SiY+Fc3J85QG+8
 77moTPfEiFhm6d/FBA1bsPImw18nZ7fCL+XztqHRTHTOhOdKjwWau/nyeiatpc4XrUSv
 7Qb/t49IK2taWX3oN00PbkVVaGL3+Dr+LvWlU9iuxs2uU4ZvQ8Kfsngrb3XCY6ZyO9Db
 NE+A==
X-Gm-Message-State: AOAM530hSxBF5BTlEThy4PemEAew4mJWo0fVj473xwOmnnz6rFLtZFIz
 gc+Jb87PqpXC1SfyNO7XSg50z7r9t2G4pA==
X-Google-Smtp-Source: ABdhPJyzo0IS+9glmbmQd0GXrc79+Segaij6+r6V3v1FwLdBHNRcUmPNw2Tu+ESS565nXqPCBx2AeA==
X-Received: by 2002:a1c:804a:: with SMTP id b71mr24112683wmd.82.1620078817268; 
 Mon, 03 May 2021 14:53:37 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id f18sm622611wmg.26.2021.05.03.14.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 14:53:36 -0700 (PDT)
Subject: Re: [PATCH v6 14/26] tcg/tci: Remove tci_write_reg
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <df74740e-5dd9-6619-5ff8-3c7afd89f4c4@amsat.org>
Date: Mon, 3 May 2021 23:53:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502235727.1979457-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 1:57 AM, Richard Henderson wrote:
> Inline it into its one caller, tci_write_reg64.
> Drop the asserts that are redundant with tcg_read_r.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

