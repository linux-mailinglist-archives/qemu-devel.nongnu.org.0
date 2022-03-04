Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E734CE04A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 23:39:51 +0100 (CET)
Received: from localhost ([::1]:59212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQGaU-0003BR-52
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 17:39:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGYG-00019s-JE
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:37:32 -0500
Received: from [2607:f8b0:4864:20::102c] (port=52075
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGYE-00083D-Gm
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:37:31 -0500
Received: by mail-pj1-x102c.google.com with SMTP id cx5so8485190pjb.1
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 14:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RPUnaAdC230sfmbKxJxdXq17FWqnrIf/x1bs/i0/bGU=;
 b=nlOduQMKFz8tgW5cpxEM0Thmw4yy5NaKwZ1T7NlqMgyEJ27+EH69oma5tnrG9bpPQO
 48RVqFcRBSgisG7NcwIH68XMUxnmiSi68IPp6i5R1R1vnnF3mNeYcTkYGhOE8r4sBszk
 NxfiS1pkU5YPBbZqvvSVa8/yXtDF1GeLaduVqpcyk+SnCK/uVgNA5IEepwOj/zf1kU/r
 yCHCHRTqDIGpgWIJj9bZJMqIPzHSppO9oM3nJgajHzoRIk20ez4st0Y5ZRHRSb56Uf3i
 wjwKZfpC7GwNzIkcDnsC6DLNQP3byYRuUg3n4lzzAsu/BV2zY/AifIs3YMF0w3enRlKQ
 uYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RPUnaAdC230sfmbKxJxdXq17FWqnrIf/x1bs/i0/bGU=;
 b=mdNcCW4vrGk6FXfRR2TUPUk24Gs1p+v1x/iekEa8B5L3ETLnZyexjkgbqLqY/N0RZw
 7Pg3r9yEoWpMj5YrpWXUsQKjOoJGMmLPyAqwy2VDSbYWogq+rWa8GZBsriNAmqPEfOxc
 rYIMLl/G2NWYX/Yt7/g+mH326U3M9LeJeBS0CNmADLqPwWFDySHrfbQBklOBBi3m3gpT
 XtyS7CVCfBbdzB3ARMGmNCbdyRnis0ubEchI8p3xJ5FvAYVHRUgAiOfBfJdPgT/q2xUB
 z0KYntwziC57AzgB5CP16I6aH32QL1T501NE21n0DxMOs5xZ9NVVMOkd40EVozNuFJ0s
 rFHg==
X-Gm-Message-State: AOAM530XyTx3GD+03JnBn3/AasgaQEyRXKLXv1mf2kk9nf0jlEKMjhU2
 eWOfc/BQ0TfTCXgu1xeI28xSvw==
X-Google-Smtp-Source: ABdhPJwfGq+XxO6/HJv8hhecC/B5kJDnaMNPI3dh7N0AWSJeqSCo3JXp5JmsohrJQNOLupAAXF1+Pg==
X-Received: by 2002:a17:90a:10c8:b0:1bc:e369:1f2c with SMTP id
 b8-20020a17090a10c800b001bce3691f2cmr12833319pje.193.1646433448619; 
 Fri, 04 Mar 2022 14:37:28 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304?
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 p25-20020a637419000000b0037fa57520adsm1231472pgc.27.2022.03.04.14.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 14:37:28 -0800 (PST)
Message-ID: <8d53f96a-b90e-fbba-7e87-c634c83330c3@linaro.org>
Date: Fri, 4 Mar 2022 12:37:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/7] target/ppc: use extract/extract2 to create vrlqnm mask
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220304175156.2012315-1-matheus.ferst@eldorado.org.br>
 <20220304175156.2012315-4-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220304175156.2012315-4-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
> Fixes: 4e272668406b ("target/ppc: implement vrlqnm")
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/translate/vmx-impl.c.inc | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

