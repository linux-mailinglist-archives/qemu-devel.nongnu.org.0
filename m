Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D3C6B50EA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:27:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paiNz-0001aa-MA; Fri, 10 Mar 2023 14:26:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiNq-0001aJ-3A
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:26:30 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiNn-0007MN-W4
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:26:29 -0500
Received: by mail-pj1-x1029.google.com with SMTP id kb15so6310917pjb.1
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678476386;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vT3ID/KP1SvBB/YLWkxWOKWFd8yhemDwObKF6sGwVmM=;
 b=DEv3ped04Zya81UT0THZAfBMwvKVTSnot0SOIpTXFuQ1zJVYGFdXPjv2c3p7LptUJE
 uO0ttbLryNjTDT2OLpaA6GyLXuoTz6MtxC4/VYyzK2pxsp8eEP4juWwSPGWTh9jsQLBE
 GVBc0H/EJ0V2w3mjAhuWHKQAHo8duocaeNzwE/Lluwy3cM43+dmo3gpUpWf3q7pZF6t7
 p/9h0aukJemhEL0xS1i0vnpgSvtJZ04pajAmiVMkuyRx0RWVKnv012DbxirzcfBQOOkS
 Du69R4W50qSAXKUdYG9tBM4KFztm0RD1RX1LRUoGD/GiCduTqbFMgnuuY94E3TKX2Hpn
 qr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678476386;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vT3ID/KP1SvBB/YLWkxWOKWFd8yhemDwObKF6sGwVmM=;
 b=kbdijQO8Jl05z3Z3FXyiC9cmP++1LUQ6oRK+3Slbx8kOEFh8hJiPEgW+3KelGxHBfC
 gy862Ody2GBVtNDG2iDmfnkqSaYzGEt3uTRCKV+0EYSYnq+GkmvfGr3U5R8Hq7JU7gU5
 OfN/PLBTmZE7gZoJ8Btq5PR+VOAYbKLLb5F4wrRGPKAwZR1bFP0Oh8+hJCtUEB3QAn1N
 dt16bxn0jTZfA/H8mrYS1eXxHqSjUNbUPvHep3ISH3rKlO1j9oc6Y5mYvVKGDJta79n1
 +LtaoBcEls03cZU3+SDfE+C3vKsopEd30/Lvg3lhfa0aUU+nBPyuFDwm2ljpO+8kfrdP
 c0Pg==
X-Gm-Message-State: AO0yUKUpaUJRjVSd0rQhT5fQFdolsmwY8Z9S7EIuq6rXUPxEao/6pBg7
 WrvlbryzSPBYJH0DMgEZDzrBag==
X-Google-Smtp-Source: AK7set/1sk/DrT/d9F3lsWrFl2U96U8OPGAe0mHdeW25mFFuylUSgUfLhy411/rzACsI+S3t1KkR/Q==
X-Received: by 2002:a17:902:d544:b0:19d:387:6602 with SMTP id
 z4-20020a170902d54400b0019d03876602mr27023124plf.58.1678476386552; 
 Fri, 10 Mar 2023 11:26:26 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62?
 ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 kf3-20020a17090305c300b0019c91989a1csm304811plb.300.2023.03.10.11.26.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 11:26:26 -0800 (PST)
Message-ID: <64ec697c-928d-fb38-7005-4582258458bb@linaro.org>
Date: Fri, 10 Mar 2023 11:26:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 03/12] target/s390x: Handle LGRL from non-aligned addresses
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230310174223.944843-1-iii@linux.ibm.com>
 <20230310174223.944843-4-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230310174223.944843-4-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/10/23 09:42, Ilya Leoshkevich wrote:
> Use MO_ALIGN_8 and let do_unaligned_access() generate a specification
> exception.
> 
> Reported-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> Suggested-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   target/s390x/tcg/insn-data.h.inc | 6 +++---
>   target/s390x/tcg/translate.c     | 3 ++-
>   2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

