Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBBF63E261
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 21:56:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0U5x-0008Qv-Lx; Wed, 30 Nov 2022 15:54:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0U5o-0008QG-2g
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 15:54:10 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0U5m-00055r-2S
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 15:54:07 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 u15-20020a17090a3fcf00b002191825cf02so3531107pjm.2
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 12:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5yhNouruUapTnAaRsA/KXfAb8bNRxPhTwhL30ApBMqw=;
 b=H9yJlLhkFDF0ce/V4g+r6it132bQJvsa9dHPYsNIyonNXLelPatvDKYAOI+7XNt95C
 Ib7RW6CWzur2NrHEa42O347WCwnBlgeaxGlSVRFYr5aq9CV6tsXXvtXJN8hVJWETx95P
 xkvanU7+MHPRPWsX8AhylF7rZr+VvBayH28ZsqShmL7IjGAnUofi7CE+haAcYeatwTs/
 2g3K//GQbPf4ESNSHw+QoCabdc1ZHy3gylKYroP8rbI0vi14Phda9hCR20s3RF8la4fA
 bj0AFfiITMhiZMDDZSNkkktjcj6qy+I2cZDrpBRBry+WxBIXeePJE+zRmDODtmt4hKJb
 fa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5yhNouruUapTnAaRsA/KXfAb8bNRxPhTwhL30ApBMqw=;
 b=isb16QL811PlQZLNofiVwieu3tIpmSc9uBCxNorI99V/1sfjmceyKfJLJHxFuGVNcB
 Ec7vpPtQEIfh4ZWEXsh8SzV35L7pc2O7czuXO5aHOqpy9AhAMD8LSbdAUcfo3dst83n/
 JolxWVq/no3h7KbguhzePzR/0mhP8g22CDY19Vbrw7QZLVsYb7HkM8xgzxP0BV900W4q
 FHq1aOjxbl10sNTrBY63IOFkhtlFSDy7TYqc1wGteDFFBdqXFxwcg53tbJVFA6tsYIDe
 cSjLJyKDoINokcga1IMHKxtAl6+ae3R59jmNY9/p9Y4cDt6xEl/mFpw8dPN+dUWSyeHH
 qp+g==
X-Gm-Message-State: ANoB5pnrlgHO6kC5jFUcSC4NLP/57BnrUq0N9qjv/suFvvQSolCNMHGR
 ndo0WrUD3cmfWaL1G60RBk0Rew==
X-Google-Smtp-Source: AA0mqf6N0kZzaguxWV2TsnlUSlqvnOHxaQKh8BZVziS5o1Ez/VFNdcLmNX9GUsg6I1eQkEZ3HbK0Ew==
X-Received: by 2002:a17:902:d38c:b0:188:4c74:e1f1 with SMTP id
 e12-20020a170902d38c00b001884c74e1f1mr44255228pld.98.1669841639674; 
 Wed, 30 Nov 2022 12:53:59 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:7dfe:6c55:976b:754?
 ([2602:47:d48a:1201:7dfe:6c55:976b:754])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a17090332c500b001897de9bae3sm1938450plr.204.2022.11.30.12.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 12:53:58 -0800 (PST)
Message-ID: <73bb82f7-bc43-beb5-3533-615a4dc3b7ef@linaro.org>
Date: Wed, 30 Nov 2022 12:53:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 0/2] target/tcg: Use TCGv_i64 with
 tcg_temp_new_i64()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alessandro Di Federico <ale@rev.ng>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Anton Johansson <anjo@rev.ng>
References: <20221130163436.87687-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221130163436.87687-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/30/22 08:34, Philippe Mathieu-Daudé wrote:
> Although on 64-bit targets TCGv is defined as TCGv_i64,
> clarify using the correct type for tcg_temp_new_i64().
> 
> Philippe Mathieu-Daudé (2):
>    target/s390x: Replace TCGv by TCGv_i64 in op_mov2e()
>    target/sparc64: Replace TCGv by TCGv_i64 in gen_op_multiply()
> 
>   target/s390x/tcg/translate.c | 2 +-
>   target/sparc/translate.c     | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

