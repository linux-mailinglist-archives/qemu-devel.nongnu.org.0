Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5B75FA44D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 21:46:15 +0200 (CEST)
Received: from localhost ([::1]:49970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohyj7-0005P1-60
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 15:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohyMh-0000VJ-H0
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 15:23:03 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:43762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohyMf-0004Wy-LB
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 15:23:03 -0400
Received: by mail-pg1-x534.google.com with SMTP id h185so3964881pgc.10
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 12:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WqLFe7v9gnl6SNP1mQ1mj5X5784qK44yiTbv1N3EoNI=;
 b=F+Sol3SAOuG0RFdoxGkPVP6CigyqaqM4QkftKlTQrCnoZ60V+LeOPy/zZpSxQa5pgR
 SFUItC5Inzhb2qiXpp9okjH1OfpGUUH+6rqhPhbaYXYvFVELNMqO9W4ZN/3BLoTsbYHP
 KyYqfJZrNbvXQ2jQ4TDZyRJdL+O44q1qFZ7FbtwGmTpkS3dpN8GG9PJgv0IYOdyzJVZH
 iWNuMiRyCUib5vC6k8WKS4JYot4JQcW13nXZGwLgfkvA/4ZTeIlsxku5u6Oj9Ov+hczQ
 3dCpoAhY/zg5gAUOekIN7cdKgPHA0RI4TsyGkJZ8aFphXnxLR/zYDC1Sfw+8IPlMmWM8
 dowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WqLFe7v9gnl6SNP1mQ1mj5X5784qK44yiTbv1N3EoNI=;
 b=0gjB/ulXtBkz8geCXOJLUyMenqKZlUKMQD3J3QXXnIn77OBPVQshKDRgJUllsHAmy8
 sYIbONblsC9uGJIFYBPEnEPRytPwWlKvGfuMAr/oDlFwrRPXqKn60VxoMJuKKZhSsJOv
 rBIHbGGVDS+36ybAqsucZwy0iruefjP6oXSwQ819mhdau0oZxTXKtbQpYU5lh7eSwYx0
 Ap/HSB2Ghno1RV4E79H2RxyH7TZpG3PX931bFv1HO6BpfVpSe/jaGx2ZatpdRsouEuVx
 ALA2g92utZjYEj3jPMR5kozQW5zU1Xi+Z27eF7nSwZtBmG/XD/dfQ1lNHvhOazLodEAo
 0NaQ==
X-Gm-Message-State: ACrzQf0+O+BkgZj1dtIPibBTTMRWTBfgM4pnT5zzhdyUb4uT12G1SbGQ
 9B1HS+R/9NP2pjdtQ65WweXpjA==
X-Google-Smtp-Source: AMsMyM6KYZaW7pzZ7AHmMgZno+f19ltfUmahqAwU3HU+J6G+5HqRM2N5AVXNtQa4zfhxyBlLyEpgIw==
X-Received: by 2002:a05:6a00:150c:b0:563:9f05:bd68 with SMTP id
 q12-20020a056a00150c00b005639f05bd68mr1736537pfu.44.1665429780102; 
 Mon, 10 Oct 2022 12:23:00 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7?
 ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a17090a3d0800b001fd76f7a0d1sm9638855pjc.54.2022.10.10.12.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 12:22:59 -0700 (PDT)
Message-ID: <063bd050-a09e-b099-b50e-7d673e061ee1@linaro.org>
Date: Mon, 10 Oct 2022 12:22:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 03/12] target/ppc: Move V(ADD|SUB)CUW to decodetree and
 use gvec
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20221010191356.83659-1-lucas.araujo@eldorado.org.br>
 <20221010191356.83659-4-lucas.araujo@eldorado.org.br>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221010191356.83659-4-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.007,
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

On 10/10/22 12:13, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> This patch moves VADDCUW and VSUBCUW to decodtree with gvec using an
> implementation based on the helper, with the main difference being
> changing the -1 (aka all bits set to 1) result returned by cmp when
> true to +1. It also implemented a .fni4 version of those instructions
> and dropped the helper.
> 
> vaddcuw:
> rept    loop    master             patch
> 8       12500   0,01008200         0,00612400 (-39.3%)
> 25      4000    0,01091500         0,00471600 (-56.8%)
> 100     1000    0,01332500         0,00593700 (-55.4%)
> 500     200     0,01998500         0,01275700 (-36.2%)
> 2500    40      0,04704300         0,04364300 (-7.2%)
> 8000    12      0,10748200         0,11241000 (+4.6%)
> 
> vsubcuw:
> rept    loop    master             patch
> 8       12500   0,01226200         0,00571600 (-53.4%)
> 25      4000    0,01493500         0,00462100 (-69.1%)
> 100     1000    0,01522700         0,00455100 (-70.1%)
> 500     200     0,02384600         0,01133500 (-52.5%)
> 2500    40      0,04935200         0,03178100 (-35.6%)
> 8000    12      0,09039900         0,09440600 (+4.4%)
> 
> Overall there was a gain in performance, but the TCGop code was still
> slightly bigger in the new version (it went from 4 to 5).
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  2 -
>   target/ppc/insn32.decode            |  2 +
>   target/ppc/int_helper.c             | 18 ---------
>   target/ppc/translate/vmx-impl.c.inc | 61 +++++++++++++++++++++++++++--
>   target/ppc/translate/vmx-ops.c.inc  |  3 +-
>   5 files changed, 60 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

