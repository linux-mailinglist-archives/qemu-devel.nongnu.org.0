Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC7E6B50FF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:34:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paiVn-0007Ip-0k; Fri, 10 Mar 2023 14:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiVZ-0007Ez-CT
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:34:30 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiVW-0000jk-9m
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:34:28 -0500
Received: by mail-pg1-x52c.google.com with SMTP id h31so3683160pgl.6
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678476864;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/2aCjQP1TaJLpVXcJP+cRv14HDdEAS4EI7lYCNYwteo=;
 b=LkVoe40buFzwzawBLRJsfBjcpvazEGC0ZnLzZx0pmDoMeSljga7v0GYlR2P9iPhlW8
 2OhKQ8eX5W6FF+KUR6bHiH/ZXUcKscwnVMZTdZVG4WOQHvRvQH9P/AZIxRSW2zazdslO
 SCOGXZwqfbhE2rkJOFgCS2OCLuJMspN5iGF6bE1tOr8r4i41FCV9wPLHO74NU83MqqAN
 4Fzo87TQ7vkR6hrpV2BcUkStvMRtSmrERCcnS3rkCvzYn+LkPtJN9Czb7Ga+Z9yRL3hq
 LWBGMsWsM3W6GouwoO6mxxdnMERHCMG5SkTuWiQVglA2QNnVBn/qeUJbMKSRsIkswj0i
 jwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678476864;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/2aCjQP1TaJLpVXcJP+cRv14HDdEAS4EI7lYCNYwteo=;
 b=I5DcGzCkTyQTdECZoeGd7Mrtu2d/vnGMb6LzVnLOtu76qeSz2NEa+csvjEzSxfmRo6
 uNttDwAd+aGadOVwBzybRm10iq5H0i3jSXYCmNWTm8v4SeiybTw9N3nu301jlShptRoY
 eeGmwzU7tW1h1/B0JG21lKc2T8YycmIUjMI4aycNx6qROwpcubcQUD6tjzpvBwhMt8aN
 Gfr3iplW7IzUqJFjabw+2RIqYzztr08V3OwOc4z+UAqTDRAGFktW0fYj/iZ49M4jPaEd
 FmnZx2OnbWzT82W4+OdcHAYV5qq3QAeDCRmuEeMoabs05iO7x2hxddTIrXfHfp7wFENo
 kNuA==
X-Gm-Message-State: AO0yUKXsWVukJUB/l4lQsjBZ1NMGyyVIoJqyIIcgKSIv7eSdjj+623U3
 FOuc7oXpYVR8ItUhqACOxSaq6g==
X-Google-Smtp-Source: AK7set9v2kLa8/ITlPW8GW+lAXbWyjAlycLZcY/Uf9REapzw2k9PvJZBZsBoYpf+OX24et0wfLSfHg==
X-Received: by 2002:aa7:9514:0:b0:5df:5310:e2ee with SMTP id
 b20-20020aa79514000000b005df5310e2eemr22636321pfp.29.1678476864599; 
 Fri, 10 Mar 2023 11:34:24 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62?
 ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 j26-20020aa78dda000000b005810c4286d6sm213711pfr.0.2023.03.10.11.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 11:34:24 -0800 (PST)
Message-ID: <47b25222-16a1-c058-dd74-7ffbcf20151c@linaro.org>
Date: Fri, 10 Mar 2023 11:34:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 10/12] target/s390x: Handle STGRL to non-aligned addresses
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230310174223.944843-1-iii@linux.ibm.com>
 <20230310174223.944843-11-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230310174223.944843-11-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
>   target/s390x/tcg/insn-data.h.inc | 8 ++++----
>   target/s390x/tcg/translate.c     | 3 ++-
>   2 files changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

