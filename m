Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D77853D0BB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 20:12:09 +0200 (CEST)
Received: from localhost ([::1]:35334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxBmK-0005wT-EP
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 14:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxBjv-00047f-Is
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:09:39 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:41603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxBjs-0001Va-TY
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:09:39 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e66so7769243pgc.8
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 11:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hZmGHvl04PoM32yHYJoPdCE8ccxPRR5uYPUnFiFQFoI=;
 b=WtWDL/r4RwTBTJgClczDEpOkpq43RDIDFcOjcB5Iq7OVMQB3TvuIWnCjv6Wh8hrkuw
 r00l1ZkJBuWaTBKvTf/VBJzK6VPju9MFzM3eSKIOpTFxWU5ifAzfE9s2t9S+I9bt+bGa
 1bp47EBUpB71EcMw/61xI2k2Hpf4NT/s+2pcuerVmR6yJHBLQkrRmsccWA08kiGhUGUF
 llKz1x+OTqhtqmoqqYOsAfnPJRUcYxQyABV22DmL4UqCGc4dmjSGJ9c3/2tfo+TMD560
 KGnFWJcY0GmECobwK0Q/nppESByFKl/0mFhwE0bvbQ0alS4j6O1DPU1Y/Rdwo36bIe/s
 O68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hZmGHvl04PoM32yHYJoPdCE8ccxPRR5uYPUnFiFQFoI=;
 b=2CtQff7T9LqVV7QA3leXqYT9t6c7N4VBNEfM3KRv6B2FIq4yMQgfQoRkurntLw5bST
 1Te+LETXLz26KUrZESrlewFvJVhglV9DCG/wdH9oEYCK3LqigCtlsbFBKxk+RMGOOxls
 kaMwe2jrjQoIb3CjjrFHEuXxvdLStTGEZpsafMiFvPopNKJO84t4H4DL2YmRQ3xi/m/Y
 19dB5e8aXaJEszmnbIEhI1v7fuxqiShlXh2LhpFEY8uIsjmOYDkgQ5gails8alrRFAo5
 r9Dd6MjPuzWt0C9+yHatW2jyHliGxQA/A5IP8Afv6cx3rU3YX0QINC2cjZFtphnmrl41
 QKVg==
X-Gm-Message-State: AOAM530SPzfoptpInkmCrxEoAkkjfT9TwJR1oxFvt2s3yMdqKyZ+KHXR
 UKh1HGuRC3ravpXvdZhZurNvfw==
X-Google-Smtp-Source: ABdhPJziuk4wx0Mnb7ow4sM43VEOy2V3HxGyGcmc4ro9vo67XraQTYVT9/W+PRX0E/Ca4qYtKTfKiA==
X-Received: by 2002:a62:8101:0:b0:51b:b859:7043 with SMTP id
 t1-20020a628101000000b0051bb8597043mr11534736pfd.25.1654279774471; 
 Fri, 03 Jun 2022 11:09:34 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3286:cc26:3d5e:3f94?
 ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b0016632179ecfsm4948860plk.264.2022.06.03.11.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 11:09:33 -0700 (PDT)
Message-ID: <87f0f8fc-2593-c3f1-7dad-cd1d160f4b31@linaro.org>
Date: Fri, 3 Jun 2022 11:09:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RESEND v3 7/8] target/ppc: Implemented vector module
 word/doubleword
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220525134954.85056-1-lucas.araujo@eldorado.org.br>
 <20220525134954.85056-8-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220525134954.85056-8-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/22 06:49, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> vmodsw: Vector Modulo Signed Word
> vmoduw: Vector Modulo Unsigned Word
> vmodsd: Vector Modulo Signed Doubleword
> vmodud: Vector Modulo Unsigned Doubleword
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  5 +++++
>   target/ppc/translate/vmx-impl.c.inc | 10 ++++++++++
>   2 files changed, 15 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

