Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F9F552563
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 22:09:57 +0200 (CEST)
Received: from localhost ([::1]:48428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Nie-0003WU-8l
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 16:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3NdV-0000PX-9B
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 16:04:37 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3NdT-0005BP-Ls
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 16:04:36 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 a11-20020a17090acb8b00b001eca0041455so2818632pju.1
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 13:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=IhII8OdSc3XawDljzPXKPLCb4OvlxBhP4TfgJe4pUps=;
 b=fvmkraezfqcS7sQLHbYBmyouuoiaMZ+Q2LHK9KjEO7sVivUBYjW0vngiK3SF5Y1Fw6
 MjLM7yIDmj0tXl1crFsPXu4jWqZM3zqU88VFuDRYsFUnszT71+/DYBnXH+BThfxJV1M6
 ZvbVRUkzArIVFdDcjpW7czIDoN4j7ghTlwZ+swLy/xEyMlQipgzee6ZV1owMnE+lsp2L
 pq94JKCRdudYYehpSfoeYeXN4xaG1VGvKT6rMxUmCwV1nczsyiX5sfhjaeKChL1Ex0hh
 SWBV+NRNDVzHF8rgiogaCgb7HGWQ7OD8YFSyZ9X8y0XTeFG9VkGGlbu/yghYQcUE6b9L
 bTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IhII8OdSc3XawDljzPXKPLCb4OvlxBhP4TfgJe4pUps=;
 b=3ux5uhE5w52leOAZVoU82WrNZJ8hkFOyQppTk5YwfcB5x2ZJ4um5+feGNQ+zFkJ+V7
 lXJeowy8GKLq6vPTrnKJW1NPW5zW8/AzbJiYHdJ+KWzMWfGYCe0QA6A/ogbVNV2coJpG
 vzaNJYLDuaO6eYGm0SivNXD/uj71sjZ69noRsKGGMVil8ccf8EWRBHN6dnKx1/8qaSmr
 fdhHUfoWJx1hFx7i3B0nuafUgYH0N2aSWwDAami6gWO1ZdPuPXk81Plb6r2cGY3WtH+J
 nTZriGzgk6mLUdUhM5nmDKB92DwvKhLtDLDAvemoKg7/l7ppiyjNDRK3T9H7kBpkkNm1
 5O8w==
X-Gm-Message-State: AJIora/a/eZN3KuVuiUfFknQkpQrsRJXcXRG7ILB+GrDhk65iK08i+a4
 d0tb1JS1k4CRzcnJq/TioZCQhA==
X-Google-Smtp-Source: AGRyM1uj0bWbPOmBARpZYj82TsdwuIzp/sAzckkl5Q6HV+7hfcR9ycSh0nLLR78kiggnpwSRt7ch/g==
X-Received: by 2002:a17:903:246:b0:153:857c:a1f6 with SMTP id
 j6-20020a170903024600b00153857ca1f6mr25158505plh.153.1655755474272; 
 Mon, 20 Jun 2022 13:04:34 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a17090a4bc200b001e2ebcce5d5sm8436010pjl.37.2022.06.20.13.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 13:04:33 -0700 (PDT)
Message-ID: <b24af9a6-0ad4-86b0-c956-630b0528c59f@linaro.org>
Date: Mon, 20 Jun 2022 13:04:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 05/13] accel/tcg: Init TCG cflags in vCPU thread handler
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
 <20220323171751.78612-6-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323171751.78612-6-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 3/23/22 10:17, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Move TCG cflags initialization to thread handler.
> Remove the duplicated assert checks.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   accel/tcg/tcg-accel-ops-mttcg.c | 5 ++---
>   accel/tcg/tcg-accel-ops-rr.c    | 7 +++----
>   2 files changed, 5 insertions(+), 7 deletions(-)

Queued to tcg-next.


r~

