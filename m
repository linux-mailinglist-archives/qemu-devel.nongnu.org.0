Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F9C4CC56F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 19:50:47 +0100 (CET)
Received: from localhost ([::1]:48942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPqXE-0006YY-Kd
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 13:50:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqSw-0004re-51
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:46:18 -0500
Received: from [2607:f8b0:4864:20::636] (port=43779
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqSu-0001OV-Mp
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:46:17 -0500
Received: by mail-pl1-x636.google.com with SMTP id e2so5447059pls.10
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 10:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PpxuLShSycpXuZqouhGR0Lci22vquvB+6fcHnGmKvBI=;
 b=kWC5Gin8GS1OIvV01VGViyoIRY7MeGC/JDSakSOIp7MF7m2Nx1H7g3yQ1DmWnxo0OC
 +Bu3vL4PKpqpy1LEuB5JoUPVXghjlmOe8a/h1xqO+LtXk9cOFRT3ZImWPXRwPMlHFaAV
 4EO8L8LY0uSJT/2cF1tQ+xecGQx79okWfevv35opwECMsZ7hUQTnpEW+wr29+qsXY5PJ
 gXGgVmDxl8Z5haLeeAXRVx/0v8JjIRR+oNnLCimPnOnKZXZHY0ZQPrahJJqXIGDWBBLS
 CrLvpS7Ie9fFHQnjSFYh4a6Ahg5BAINVXRmkG1IPx6k5FEnqqjQULDqrdQOOrUeB5JUV
 t3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PpxuLShSycpXuZqouhGR0Lci22vquvB+6fcHnGmKvBI=;
 b=2IB7zXGlGIdiTbVOUlmjVLOyqPk4REcGW88EYL0qR1G1InEywSTajpq6C0r9p6iC1C
 RAph/wGjKA89kr+mwY05cgBYJMh1JlraSYfFd7x6cyHVjbFxi0VsA9C5hFjXrH1sh64C
 lEmJU5vjNIA1EhiY6fOPAH2SOxd6F0h1r/+Ymz4RSqgrp8/mNXyWSV1QGwdBgLPmjhi8
 mmNj+F5vQGyFOuI0I46EqB0tHmr3IftvK+m6xoIqa/60vSyXN2kBpOZB/AMxwZDKPwxk
 GJNW/FjLC0EEfIhFq9XZ1E0yjGY3ztrWliDsUPpndKDgZ6LnYm4V/CjUqxMtituJGNH4
 /pAA==
X-Gm-Message-State: AOAM532MpVSVLSlklVEEMoJO4oSyMRq5oTOuA6ulIso7InM2+8Xxnrpi
 BWKUeAabJHvvPyl2Hbi+/10uFg==
X-Google-Smtp-Source: ABdhPJzGfbLhjECsriTrIlxAS/c+YrEgcGysGoOpFvLj43ddzprY0VFLTlgYWWhtG+pU7yB1kr5EOw==
X-Received: by 2002:a17:902:b589:b0:14f:3f88:15e2 with SMTP id
 a9-20020a170902b58900b0014f3f8815e2mr37077571pls.171.1646333175426; 
 Thu, 03 Mar 2022 10:46:15 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:e819:4400:f268:c391?
 (2603-800c-1201-c600-e819-4400-f268-c391.res6.spectrum.com.
 [2603:800c:1201:c600:e819:4400:f268:c391])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a63230b000000b00372a08b584asm2581492pgj.47.2022.03.03.10.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 10:46:15 -0800 (PST)
Message-ID: <90ef60a8-69b5-696c-eb58-d5ebc4c3f3f0@linaro.org>
Date: Thu, 3 Mar 2022 08:46:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/5] tests/tcg/ppc64le: use inline asm instead of
 __builtin_mtfsf
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220303172041.1915037-1-matheus.ferst@eldorado.org.br>
 <20220303172041.1915037-2-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303172041.1915037-2-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: thuth@redhat.com, danielhb413@gmail.com, groug@kaod.org,
 philippe.mathieu.daude@gmail.com, clg@kaod.org, mrezanin@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 07:20, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> LLVM/Clang does not support __builtin_mtfsf.
> 
> Acked-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   tests/tcg/ppc64le/mtfsf.c | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

