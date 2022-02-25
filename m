Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AB44C51B6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 23:46:31 +0100 (CET)
Received: from localhost ([::1]:38856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNjM5-0005wd-Sd
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 17:46:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNiOB-0006qY-3E
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:44:37 -0500
Received: from [2607:f8b0:4864:20::1031] (port=36515
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNiO9-0001jw-0y
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:44:34 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 g7-20020a17090a708700b001bb78857ccdso9571403pjk.1
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 13:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YK4Jm/rJ+wa0E2Q/y/x8h1qMdDF0FPx2UMJFldij6Q8=;
 b=jXJEIroHddGsOA/PWwAzC7p/9UIwV0oxMANY7hqMmzBndBsg13tHa5zrx2jDa0OmL9
 GuDA8MhXs4Dh+MRdSAewhFesxpg5NatfUlaDcV4N8WNhHB1NxQhKc0dNLl96QXAGMLI7
 Z4aeOZjGEDwDxKIO0TWcSh+rX99+vXPRTGbtAWNV6VsJNHehW8SnYc03tMxZa5gzXN+x
 h70l3Udyry//F30yyfHnfLfEGb3NkO2Adu5v9YPrsssm+R3zhACp0OGqjxuYDWpTG4ID
 AjygDt831zr9fS6gI1kOG7wBAFPFtjiBM6ykj1WhKUHNemRJxlhOn06rmuLSMxly6JmQ
 x9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YK4Jm/rJ+wa0E2Q/y/x8h1qMdDF0FPx2UMJFldij6Q8=;
 b=jZOzqqPycGRSCWdhzLXuQ1+EK21I8epVe0bdQ+KBfSU30sYX2EqpNC7+NLcuYj6xK9
 NPhtugDM88JOymYs0tcbGCu4q5J49NkQvKT+KRzILkYnZrFAvd6NCL1AbTatjaQWkSJ7
 EUY5+BvgxJWQert/NNAIiGRj0ZCt6idmR8DDI2F8fPVFjnTKAYtYImTFTSivoFFPE2H0
 9QwJ6lkl0VTyT42Us0yoV4omBAsrFVDib4luONt/6Ro99PLKHgg1NjuMCfEGbGePQe4V
 1UYHr67zf/Kc2l1v78sFXPnY7gAyPbmd8mB5qekD2y8I2OyEsZzjANqFqrj0AVgUHbIK
 5NUA==
X-Gm-Message-State: AOAM533FHipANA5y9P5qi3qsykMXLRKTT1AkvkjaDkDPWZH/U2uvngFz
 rqOcrdbHhB4HQza/CVielRBeMg==
X-Google-Smtp-Source: ABdhPJwOo9E8BggXS11kMRvkCf1sbksUYb7ZaroaWDcbufDT/EFczVBfBzsWMLLGSwWi4oXAIrLqnQ==
X-Received: by 2002:a17:90a:d30f:b0:1bc:2cb4:bef6 with SMTP id
 p15-20020a17090ad30f00b001bc2cb4bef6mr5060626pju.186.1645825471749; 
 Fri, 25 Feb 2022 13:44:31 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 be6-20020a656e46000000b0036c7c63e915sm3370387pgb.48.2022.02.25.13.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 13:44:31 -0800 (PST)
Message-ID: <8b50da84-5c9d-31f1-f877-3e6621531c18@linaro.org>
Date: Fri, 25 Feb 2022 11:44:28 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 27/49] target/ppc: implement vrlqmi
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
 <20220225210936.1749575-28-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225210936.1749575-28-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
> +        if (insert) {
> +            get_avr64(n, a->vrt, true);
> +            get_avr64(vrb, a->vrt, false);
> +            tcg_gen_not_i64(ah, ah);
> +            tcg_gen_not_i64(al, al);
> +            tcg_gen_and_i64(n, n, ah);
> +            tcg_gen_and_i64(vrb, vrb, al);

Two tcg_gen_andc_i64.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

