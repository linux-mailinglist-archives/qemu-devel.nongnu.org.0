Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 580BD6FF066
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 13:11:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px4Ck-00054e-LU; Thu, 11 May 2023 07:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px4Cf-000518-7g
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:11:21 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px4Ca-0007BG-Or
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:11:20 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f415a90215so62580315e9.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 04:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683803475; x=1686395475;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BX9t730xrZGBCYA3zGeIzOCxOydOOiQkLsUaCsSswtU=;
 b=YKfmlnA2MfNA0/ftyTiISC6IXOh4i69id3uezVBmGWAL6p0woqelXZNWzc91NyMEpy
 T40Xs7hjowuZXqUMglY4Dlj2Q+PZc4CgvC6+lgi4TImSTI/x3WXErV38eeCp7CckO/3I
 eMNSzqM2C8WyEo0MRQoiYNKt8ykqMOMmSZS+uwjm2YIxyAITXlvnYT5PAvmILYT42jCP
 nhmqpE2Cf5I17KhYWqJZ21fRnN/D2+Y+qsh6MrEU8C6Y6/R28xfbPX0vQvu0s48RQdBM
 z11C4Hx0UG3a++2ejDCOlYKN3EXH4kxXyy/13AMyoytYt15UI7DW43of3XE8YfMSHul6
 cxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683803475; x=1686395475;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BX9t730xrZGBCYA3zGeIzOCxOydOOiQkLsUaCsSswtU=;
 b=QIufvW//ri0rtaJxNlp7JH9G0cnR6cJAya9UAow32tQsFhR4cYdZ+OI8dDVxJeg6tf
 Razxx16V80mH5OTsC0sfCNPi5GW8jpqZz3wLUuvhTJ/Oanjmlop3h/GLcFOk/lZV+7a8
 nBv8Uy0Vr0l8n6L89VLLtZsSb2tfRK6Ts1O67QrbdPPbUYhKspBGesCujr80vD3SXGri
 1y9yFI2I/M5kcW9ITSD4NMUr6IkWgNkqRmpKPp2wra2kcebi1pYcodHaTNhQWWd+IHua
 U8phy8Tw1MmKuYVNCaZdEiM1FcD6CVXf+O8SZh841lfebXYpDtbmJ9ubsqtWWFNFZKxh
 Inbw==
X-Gm-Message-State: AC+VfDyoX99wdwCBZfQ5xVM/b3c8VG0WNAXREWxcOiJEyhbZUyE0LAhJ
 /DZeYQeoUh4HOLn9vXtQvkim6g==
X-Google-Smtp-Source: ACHHUZ5UUFPWReiro7QKWI8y+E7cKi5fFQx3ecbAMdtcet/SOjAgsfIuWXZDa+pjqAY0dVppbPzkuw==
X-Received: by 2002:a1c:7304:0:b0:3f3:888b:ab78 with SMTP id
 d4-20020a1c7304000000b003f3888bab78mr14162398wmb.37.1683803474903; 
 Thu, 11 May 2023 04:11:14 -0700 (PDT)
Received: from [192.168.110.227] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a05600c219300b003f173419e7asm25122358wme.43.2023.05.11.04.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 04:11:14 -0700 (PDT)
Message-ID: <a4194673-7d4e-f84e-cc1b-7129426c8379@linaro.org>
Date: Thu, 11 May 2023 12:08:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] migration: Teach dirtyrate about
 qemu_target_page_bits()
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Andrei Gudkov <gudkov.andrei@huawei.com>,
 Leonardo Bras <leobras@redhat.com>, Chuan Zheng <zhengchuan@huawei.com>,
 Peter Xu <peterx@redhat.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>
References: <20230511092239.14607-1-quintela@redhat.com>
 <20230511092239.14607-3-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230511092239.14607-3-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/11/23 10:22, Juan Quintela wrote:
> Signed-off-by: Juan Quintela<quintela@redhat.com>
> ---
>   migration/dirtyrate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

