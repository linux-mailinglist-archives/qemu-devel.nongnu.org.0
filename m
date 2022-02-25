Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D688E4C51A6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 23:40:04 +0100 (CET)
Received: from localhost ([::1]:56802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNjFr-0007AN-UA
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 17:40:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNiBw-0001gX-V5
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:31:57 -0500
Received: from [2607:f8b0:4864:20::633] (port=39733
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNiBv-0007FN-5k
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:31:56 -0500
Received: by mail-pl1-x633.google.com with SMTP id l9so5416245pls.6
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 13:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=I/aSuMQDNkfF1SiKH2j5wWQQUx/LMO3VpdR24n3bsw8=;
 b=ev74sqjNn53iiG/AvkZFlajkbFWbBY07dzzuZbYrKQ62q53HsXNSLd5VLAm+3htwZJ
 9pwTh7m5fk5SUUzLLvJfKWnzCdXXetjWyqr2Cw6YoX/SgKRUchGUAZnL/C5WQSCK+IRg
 fMzqamOB6FAUaCJfPNt3M/4IOHWPytNJdYJoFMBjKvyFzjLU5vekj3itGhOl/fT+ypQ7
 JRlhLyrZ7O243/9dkFUSXF+0ihWJRnkWmP8SONewmIfMkLlEVews4NHgo90sdYhdW2r1
 tJx7rePO43Bq/xAoRbkPcGZWumHCtsV8pqoueP0gaq1LtRChL/yOHzvZnMCSNjM7iEV1
 2SzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=I/aSuMQDNkfF1SiKH2j5wWQQUx/LMO3VpdR24n3bsw8=;
 b=UuFpQC96IiKeSyGLe8aJAgvSZwmVmy9oH6/saaFWx6mlev7GJwLXD6qrrkg6BCuVZV
 ZSgeiXbqnexJGmL6k96EnJFmgb6bae1+H8Q6vaey4MlZhxwCWr7yfb8xPd0zGlSvAZrt
 yW1fzxIEG1wkytSzMbDY2xgvF5ReO+MkK3QvcSNaB9oG8vFJN2t1J9ol3iAZfm5NYzwF
 mZiW8uIr+mgvlyeqSeKn7e4KTio20a5Wixvf6GN5+cL8BegaiEgOGFrbJkWRHDoQ2de1
 kIKhQr+QKfdNjun8DEKvnaj6l4cqdupAa2KxAsmClxPJ1qflUd0ANbqgV8ZpHlQ9iZYr
 2XiA==
X-Gm-Message-State: AOAM531AwD7M1PIyh5CRgAyhEie0TPDXinWWn/evTrk7/yfKN07jPJSr
 PybJOGlvHPTDL4CWNI0WcSbU2CI5J4CVIw==
X-Google-Smtp-Source: ABdhPJzrCD4uX+hSWColKIkZw10ZFJ6Jbs2UaH6hPhDEHjcpBho4bIPjn8RlLW62Nl3Kvp6GADOoIQ==
X-Received: by 2002:a17:902:a511:b0:14d:a378:b5b0 with SMTP id
 s17-20020a170902a51100b0014da378b5b0mr9455068plq.9.1645824711448; 
 Fri, 25 Feb 2022 13:31:51 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 a20-20020a056a000c9400b004f396b965a9sm4581260pfv.49.2022.02.25.13.31.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 13:31:51 -0800 (PST)
Message-ID: <5f7c60d8-3551-79d5-cbc7-3a125c501869@linaro.org>
Date: Fri, 25 Feb 2022 11:31:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 24/49] target/ppc: move vrl[bhwd]nm/vrl[bhwd]mi to
 decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
 <20220225210936.1749575-25-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225210936.1749575-25-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/22 11:09, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> I couldn't figure out how to use tcg_gen_gvec_rotlv here. Since the code
> is in the fniv implementation, we have TCGv_vec instead of offsets. I'm
> keeping the masking for now, so the generated code has the desired
> effect.

Fair.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

