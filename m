Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF884CE04E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 23:41:52 +0100 (CET)
Received: from localhost ([::1]:35866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQGcR-0006bd-VO
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 17:41:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGZh-0003dv-K3
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:39:01 -0500
Received: from [2607:f8b0:4864:20::102f] (port=54200
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGZg-0008Bc-4d
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:39:01 -0500
Received: by mail-pj1-x102f.google.com with SMTP id bx5so8459939pjb.3
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 14:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XcIksF7k1YHPK3TZ0uW+oFODBm4fN3tn7bNPQs5us5U=;
 b=TV+SZ34yivvx5MRVTnLJzOVc6P50AMZI6//WhpZyksbA0frfSz3DLtaz56mHfUOVEV
 qKQLVeE1AA9/Oldkgz4yjit24rDhrw325EmQLL6bVs+2oeccVkZui2Mu3CFuZvtW3vw5
 v0WzZMASa1FTtAVHGrJGC8f8mii4Nf3PLNDUlH2TZg2k8pQ9eH0I2lhKld6s8alePZFf
 YOtV8sjlN1ifLlcxurgjj4U9L7ZApRmEyMw99I9LgCkAMu+qZ4uBTLLMDabG5O9DEJ3T
 jGNV/hOAronOmg76amvMpQsEbUzlK2YhstqZZbkXhgjVDURAxqVuo0lFrLBvDUp34l0u
 y71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XcIksF7k1YHPK3TZ0uW+oFODBm4fN3tn7bNPQs5us5U=;
 b=aVvOAhPaPCexRh/Ycaj1AvL8S95tx7fi8MC8p7zFC7HN3FeutCWuMpu2OnCPzWbSJU
 TnOLKTco3gRqAycyIYHRXtkwnEuBi3haPgXV32E6CLHyRwBSve47p/vCq6kg2n8l4PoM
 p7mP9rGC6KlflTUL7rLEzhUgYKBVDpLecEKJ7pRsAsAy/38rv/cbx1hGWQId8fQ2sURl
 RME01DhGhwrCN1a0tQaaAyOy2Tv0pZFLem/dexfm9/XXNYPOlLAxmUkQ7jL692KrYKab
 9qc2uDeLtYOHZBWZZGtthNvp195o0sL2+d8kVo05WBMszj0fU4ucUobzxxjaUGr4cdqE
 vl0A==
X-Gm-Message-State: AOAM530nqPJD1NkpSTJ98Mj0wT+pDrmsSe07zAqldTEZE5bx8uhQHel4
 J/YVYASk+AGik6qLb/iD9B3t+g==
X-Google-Smtp-Source: ABdhPJwiLyHxK2QxNmtuU2H3LYngu3OqneYMOjSoOSyhfHbM7Kl82HBIGlUqgO6jIw5HtrXDYWYDwg==
X-Received: by 2002:a17:902:b941:b0:14d:af72:3f23 with SMTP id
 h1-20020a170902b94100b0014daf723f23mr797655pls.6.1646433533873; 
 Fri, 04 Mar 2022 14:38:53 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304?
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a056a000b5000b004f669806cd9sm7042379pfo.87.2022.03.04.14.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 14:38:53 -0800 (PST)
Message-ID: <f7acff4e-1db4-bf35-2fd1-8ebae833630b@linaro.org>
Date: Fri, 4 Mar 2022 12:38:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/7] target/ppc: split XXGENPCV macros for readability
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220304175156.2012315-1-matheus.ferst@eldorado.org.br>
 <20220304175156.2012315-6-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220304175156.2012315-6-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 3/4/22 07:51, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Fixes: b090f4f1e3c9 ("target/ppc: Implement xxgenpcv[bhwd]m instruction")
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/int_helper.c             | 28 +++++++++---
>   target/ppc/translate/vsx-impl.c.inc | 71 +++++++++++++++--------------
>   2 files changed, 57 insertions(+), 42 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

