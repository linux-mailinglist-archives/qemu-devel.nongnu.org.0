Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F5F3BE051
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:36:59 +0200 (CEST)
Received: from localhost ([::1]:35104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0vYf-00089q-TZ
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0vWZ-00069h-5Y
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 20:34:47 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0vWX-0001UE-Ki
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 20:34:46 -0400
Received: by mail-pg1-x52d.google.com with SMTP id g22so476767pgl.7
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 17:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g1p2AjI8JYika7A1YooOzWsc2JX5r+JgbAKfclHVyiE=;
 b=Qo7Xqgtt8xSx09egzglgIcgeaxrX8exLBtslwUcpDHntcl7zJy6ElP8LuG7uhtgZal
 hqM0NFgKPZtKIkpsCgFkSXP4Dz2Ra4U3AeLINwthohuSQCi7oWVwWZdEcz3vISH/M+QN
 1iY+t7OyKg4d6H13K06lOpoB/+PrDUxskm5jeL54cR5GigmjTB2sD3Oc/k2XP0IYLkg1
 Mk+w5EHp18o/MjAQZ7ieuCt5L3lA32FOKdBdBzE8aU92+SvJ9CUK7X7tX4d+retgjxGY
 2nCMwiUSU2Z6eeg+amS1oclt5b/Jdg1x5YY/M6aFNO8hlMQ1rAk40/I5l0wRTdIe8tjt
 qMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g1p2AjI8JYika7A1YooOzWsc2JX5r+JgbAKfclHVyiE=;
 b=oZTsbjrXLVAF4AJEjeJENvJRsmnuuaBujMV6nkWmmFCuTZcvObIZEJw9bytN5Ngu4H
 /4YyyHeNObsq+YO0RjrUrJEoEHYKeNgJkSHVwHFxljsAkldSQ8XwrhlyUDOGNbAe3ONR
 6PVwJUSVmYz96VPnHdMmcxaR95Q6GxWiyoGbWzEp8RyENdPUYJY8f7HCo1AO5GJwQLKj
 xrrOIDSvsvZTRepwOUKlCE/drFX2xU75+aqh1S91HTLuZ15Nn8w2E7nla4HiH7QucGNp
 oCwiU3L0Bu7tpFTIyJYBDLdBoGDtKMKJzd2RM9Cn/mgbOK5UVMIv/YCNAzVFBYeRQvix
 r1FA==
X-Gm-Message-State: AOAM530eEZ3wZwSfAU4UqG8fPItM+zQJ7OhnFsJQxE7VwfpQhlPl78Pf
 iZqL8btEQhuN2Mfb+2kG19Ld5960DrRU5A==
X-Google-Smtp-Source: ABdhPJyuvMsmAl4oDmPeyZMz7qSU3X4lBQkA+PJBqTNBkJb8ncnj7O1/lZmvovtWFeEKaA0EwHohqA==
X-Received: by 2002:a63:4d62:: with SMTP id n34mr23368637pgl.302.1625618084200; 
 Tue, 06 Jul 2021 17:34:44 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b22sm7411802pfi.181.2021.07.06.17.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 17:34:43 -0700 (PDT)
Subject: Re: [PATCH 2/2] tcg: Bake tb_destroy() into tcg_region_tree
To: Liren Wei <lrwei@bupt.edu.cn>, qemu-devel@nongnu.org
References: <cover.1625404483.git.lrwei@bupt.edu.cn>
 <8dc352f08d038c4e7a1f5f56962398cdc700c3aa.1625404483.git.lrwei@bupt.edu.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6cf44d4a-c127-2910-f0b6-de32db273738@linaro.org>
Date: Tue, 6 Jul 2021 17:34:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8dc352f08d038c4e7a1f5f56962398cdc700c3aa.1625404483.git.lrwei@bupt.edu.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/21 7:31 AM, Liren Wei wrote:
> -static gint tb_tc_cmp(gconstpointer ap, gconstpointer bp)
> +static gint tb_tc_cmp(gconstpointer ap, gconstpointer bp, gpointer _)

Using _ here as the variable name isn't ideal.  I guess if this were c++ we would actually 
omit the name, which is kinda the same.  But I think it's just as easy to name it 
userdata, as per glib docs.

I'll fix that up while queuing, thanks.

I'm not keen that the spinlock init and destroy are in different places, but surely that 
should be fixed by moving the init to tcg_tb_alloc, probably moving it to tcg/region.c as 
well.


r~

