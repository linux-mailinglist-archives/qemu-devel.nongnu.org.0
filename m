Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7AE441A48
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:57:16 +0100 (CET)
Received: from localhost ([::1]:57058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhV07-00016x-AT
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUyx-0008MZ-BB
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:56:03 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:40878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUyu-0007mT-H8
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:56:03 -0400
Received: by mail-qk1-x736.google.com with SMTP id ay20so764886qkb.7
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 03:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yh3NyBdqmGOhzN4dgR/QSEJ7wdjsGz78tYYbTHWwKO8=;
 b=pOcYMzbzNHFAC1smawj62yHkMrDbCux5qm2fHOFffWGuHnrv1SyhhGrxNxCTM7ESw8
 wJcXf8lOEtTHyYBdRrpyqkdE+GSg9lDMoEPl7jZOqm8oxEffKjtJcWqNgQMkPeytYKQO
 hf/XdNm0ruxHI93lk7icvf2NvvFZybe0Itw+UeRNBLOD0HF1WP0biMqsA9SWE1bGlXlU
 UbCn+OPUsXFxfwag6UhPSWK0iUhGAA4HBfgBPT66Ic+//jPXGmlDfMq+5KPPBHeYAfQa
 /vH22SPmenEkqE8G4UO5+mnJDQikLWlb+hXn9nkp8p9cDnbSEQ4O02eXz+GPsmC/QceI
 WWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yh3NyBdqmGOhzN4dgR/QSEJ7wdjsGz78tYYbTHWwKO8=;
 b=5PWydFAYVsMRFvraM3Q5w7ryXELk0Sv4km7lr8e12rSccRR9G0X0ToAYX4YdJvSdhy
 Ax8kDNxjwA0B/XUq7N64zt6V68CHxUp0ONjp18rzxmr3PTjUxTnsY0SOusCjPChOZwUa
 mkinIgtRkslBE2j3wFEy1L3rdXd+DpRo7eT57Zm4Il/OtoMNtu0P2uJO/vVWdj6Y5qUO
 P5oAZrMCItLXa7kFA6Xhc0h19XUCtM3V0srwI3Id+5Zg03UNwNi5kNgXIHb3KUeO5K3o
 fydnWZe3xk1g4xIpao7G2H4hvPj5hFfpa81qP7Rcin2xPTPbgy5q2/7zyZ39aV3Htf5J
 jDYw==
X-Gm-Message-State: AOAM533C14NbYjxjuKgNWfTgrwA3vveyU07bE1cCmd4voc7ceBKa2NyL
 GhoEbmUsor+YLYpbPDVUKh86bQ==
X-Google-Smtp-Source: ABdhPJzZthEbBEp3E82yoW6zXLHKGtvmv9F0yUrhMMe+C4XuI2AIOLhSS3mpTTA9J1CzeqYmJZzfjg==
X-Received: by 2002:a05:620a:2442:: with SMTP id
 h2mr22999140qkn.298.1635764159653; 
 Mon, 01 Nov 2021 03:55:59 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id o8sm8163109qtk.77.2021.11.01.03.55.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 03:55:59 -0700 (PDT)
Subject: Re: [PATCH 07/13] target/riscv: Ajdust vector atomic check with ol
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-8-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4a0138ad-a759-9efb-1504-a4df8d831ad9@linaro.org>
Date: Mon, 1 Nov 2021 06:55:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101100143.44356-8-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.592,
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 6:01 AM, LIU Zhiwei wrote:
> -            ((1 << s->sew) <= sizeof(target_ulong)) &&
> +            ((1 << s->sew) <= (get_olen(s) / 8)) &&

XLEN not OLEN.

But this will also clash with rv128, since we still won't have 128-bit atomics.  So I 
think you need to be more reserved in this change:

     /* TODO: RV128 could allow 128-bit atomics */
     (get_xl(s) == MXL_RV32 ? 4 : 8)


r~

