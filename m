Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517443257FB
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 21:51:15 +0100 (CET)
Received: from localhost ([::1]:55322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFNbO-0001OJ-4P
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 15:51:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFNYv-0007ye-4B
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:48:41 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFNYt-0006Kg-If
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:48:40 -0500
Received: by mail-pj1-x1029.google.com with SMTP id o6so4285845pjf.5
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 12:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gfjqp3dlhkTfhHqRZ6BJZeV7U+Vgg4F5/MCwacMX5to=;
 b=ZTMgDG09t0RJ8RYinaWaH2iqM+HqOT+Y0/1REN8we6HTCWY+92RUetfYMxR4JJ2mkH
 gVkaCTomG62OoZ9GfAXuKmO3/+7JzV+0HN91PkTTHZxCAW++C5i1pvVy0mF57B2INnMT
 kSx5L/uNRVuCGvynf7V5QW4mAvr7SMtwt1YG/dtsNS5No2wj4OZ6JG68/TPgT5MG1v33
 sKbpWdjA+0o06VBiE7r7lY3MSKSe8W9cMXb5eqJo2t985IaeNo263NCdQOR0Ww1jhb7t
 1PWRZ8/fkFM7Mjq9VD4EhJ44JT/ug6p+RfBB9c7jLlx/TWY/h9rJzPBtgsxXq1xTLBdi
 mUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gfjqp3dlhkTfhHqRZ6BJZeV7U+Vgg4F5/MCwacMX5to=;
 b=CGE2Cs8iNQJvm3PbzxWaIOuvG7gw+zH97rWm2wUCGYgQVm0v4iFxN1WXACn1pCL95x
 R9O+fBEg08XjhzvMLI+Nj0eY0B8OlJS6ZrPCJ6kjBRjNVyNBgzBmK9TMPOehGBAhtoVV
 zXR2Pt/B7hDdP7nfCuzSA9Z44PLCIU4v/BACJxQLeWqZ7ZcUKa4rmBIza/KEQd9d8PLK
 Vex4+oHaL4hMLKKJ5Sxe9tG8lt8dNAv6MflMyXMR27axLjSuUU8GuGMRIjUEOn2ET8QT
 +l7HtEjsy2T9FjEwcoMxIq2W7WVkNcKlXFwElwdWc4GLIMpgzeBeHNJ5InUegN4++/6Q
 lovg==
X-Gm-Message-State: AOAM533kAjCLgxbDJMAim1DEXYFo8F2ny4xiPgQH9YAYgcHG7TcwPzf9
 fjEsm6jCDmg0KkKNo7nXJQNhOg==
X-Google-Smtp-Source: ABdhPJxLM5gmwr64KX1y4HsCwT7nJWEy/zi1dla/CGs9chBfTB8/xJp+DjQB6DWbCxY1TSHPqGQksA==
X-Received: by 2002:a17:902:a714:b029:e3:1cd:a033 with SMTP id
 w20-20020a170902a714b02900e301cda033mr4334933plq.27.1614286118035; 
 Thu, 25 Feb 2021 12:48:38 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 14sm7345003pfo.141.2021.02.25.12.48.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 12:48:37 -0800 (PST)
Subject: Re: [PATCH v2 05/10] target/hexagon: expose next PC in DisasContext
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210225151856.3284701-1-ale.qemu@rev.ng>
 <20210225151856.3284701-6-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5616470e-7308-6941-94e0-4e6d9b53bdc4@linaro.org>
Date: Thu, 25 Feb 2021 12:48:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210225151856.3284701-6-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.435,
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 7:18 AM, Alessandro Di Federico wrote:
> From: Paolo Montesel <babush@rev.ng>
> 
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> ---
>  target/hexagon/translate.c | 4 +++-
>  target/hexagon/translate.h | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)

> +        ctx->base.pc_next = ctx->npc;
> +        ctx->npc = 0;

Any particular reason you're clearing npc?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

