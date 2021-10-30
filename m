Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62C4440C20
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 00:28:39 +0200 (CEST)
Received: from localhost ([::1]:39382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgwq7-00021i-2e
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 18:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgwou-0000vE-T4
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 18:27:26 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:56270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgwos-0000Jf-Ss
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 18:27:24 -0400
Received: by mail-pj1-x1034.google.com with SMTP id om14so9671998pjb.5
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 15:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sdTB52J5CsrfJ33+1SfZQ89pFcG8sK8ueogMfxQruMM=;
 b=N4n6TUHFNMAua7tp71hSRs1GniZmZi/3sreNvXqF92H/M3YjgrRneeBpXbfzs9x5qj
 kdyVBuUijzOIHA+YToK27CR94KHdKUnmMB34huUepFCrAV2C7/I4BKtIpDGgGSZVCg6t
 zJ28Z2R52axAvr+tu841pollPqKysLgAO6znUTlSB77eWJkdJdNH+++w69yKv4f374jQ
 1it78Qa5PVEUdkDQ9vqM9ws9LOHuyWjD/zZJOzy7832J10tJUIDfWpuLkDtjevan9JoQ
 VSv+ttlkILeB9WG+KEx9p9c/nvB741miu+C7FN8pGiATsLGOeAjd/NZtoPQbaV4ILshj
 AE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sdTB52J5CsrfJ33+1SfZQ89pFcG8sK8ueogMfxQruMM=;
 b=TkNZYzk6/oYULJ0JHZaT5+fLaO26P/BNQQc5OjnAyCWvPRcvOTGsewh98Eo5RuT7tB
 arSWKDf3sym1yFu2ZImM2MfnQrfFL9vSkDRHmVk1mWCxdddF1YzlpqffMYme/VhnDd3t
 l8oXdFvGXx6mi9A19y4TTrwDVbgy3V0UGC+hmxZKqYf+stTrsOc02hBSbveMxz9aba49
 uIS0Vqrs5NvlNh2eguRh8Im5T7B7DTAESrp92xP1KFFi5xTVtNU0RWME5XF+uJHPwy1J
 KfO+ztI1QkuNrcFARRGclHBPj+C/fXC9n+smmi8PLBj+44Gn0cHP92HW99GJsR1wLWS5
 dsaQ==
X-Gm-Message-State: AOAM532AvNRYNgmWX/gCwijISpr9gn/44BaTqUkEOz5t/7112PB5ouic
 K3FKKS3BNWGE97RmHENgvqUEo/sg56vq+g==
X-Google-Smtp-Source: ABdhPJw5NoQL1HteeokjyhbS5b/jVGw/qB6uSGhQBcvrDew6RdhHJ4u7AzpxVNw5jAEmGuL2ks38Ew==
X-Received: by 2002:a17:902:ec92:b0:141:b7e6:997b with SMTP id
 x18-20020a170902ec9200b00141b7e6997bmr8923192plg.81.1635632841562; 
 Sat, 30 Oct 2021 15:27:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id co4sm887472pjb.2.2021.10.30.15.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 15:27:20 -0700 (PDT)
Subject: Re: [PATCH v2 16/34] target/ppc: Implement Vector Insert Word from
 GPR using Immediate insns
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
 <20211029202424.175401-17-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <78448d85-7ab9-dc26-dccf-20ae8872f40c@linaro.org>
Date: Sat, 30 Oct 2021 15:27:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029202424.175401-17-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 1:24 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Implements the following PowerISA v3.1 instructions:
> vinsw: Vector Insert Word from GPR using immediate-specified index
> vinsd: Vector Insert Doubleword from GPR using immediate-specified
>         index
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> v2:
> - #ifdef TARGET_PPC64 removed from translation code
> - Comments about real hardware behavior
> ---
>   target/ppc/insn32.decode            |  6 +++++
>   target/ppc/translate/vmx-impl.c.inc | 37 +++++++++++++++++++++++++++++
>   2 files changed, 43 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

