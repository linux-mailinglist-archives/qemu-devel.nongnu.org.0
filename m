Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255DE6B50F6
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:32:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paiTw-0004Tx-9X; Fri, 10 Mar 2023 14:32:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiTq-0004Sh-9M
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:32:43 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiTo-0000L3-OY
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:32:42 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso10949979pjb.2
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678476759;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G2O2CSINUC19SC/GV8iyQBuDLYP1TaoXXX1aUC+SqJI=;
 b=n02KBwYsea5J+qJf7p0goHiSHnrbv7ZBa+eh4JIjYokUXe7ns8ara9a8RRs9lElLxM
 KRHi70eH4EAR3hSwU5/8F5KmpILG1zPnlKwjmDiHGFOHy5r4R86374m6BnV0AuR+/mBL
 yYAkiXru6uU38QJy1mnwl+cBamKP7p3Ixeb4gH0NSF4JNNoe0AyYFEuA3z/65Rd1SLXc
 GHqbGCfgnAZpWlllRaww5Vi8UNJdSPU5y83Va29JvopILdBp97wR55TAiQFt3rmA9qux
 75bxtOMciyMxSvNCM26a26SUVkgBkBEh/4dx/UvVjCKEWyT+Tm1AqXlZVMOVWFI+L3AM
 YLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678476759;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G2O2CSINUC19SC/GV8iyQBuDLYP1TaoXXX1aUC+SqJI=;
 b=mpCZkO7coc354X15c5wkLjS91/nKcpucllvwE3h9PSNt8Ie7DsM6qEHnQfyYOf3f1D
 Nwkk1u+QCqZz+meZUyYw+kB5rrLzyoGCTlYmq9Oie5yGRtOUl+Fj9slLJSlxTQMijAkb
 V2KffP4hNybtQs/1rm5MWi+KfqwN6CKIXU+mMXHA23bluarcGcf1BYHFTpGZf4tg+1bf
 b6m9WaxnoiX8XCX3FiZvybm6aZAa9ZdJbfYf9iOagHcC/wRwcFWytQFEGBg/rX6uL4hJ
 nkNcVBu9GkzfVH5oET46T5v34TG49xja2PU3mBnYXLabP5bprHUKofpdNNPGQVu+kCw/
 4y+Q==
X-Gm-Message-State: AO0yUKXV2J+tEWd9PUeJ+A/RzrvLWg88ggAtHhy10d8lkiCmsGL8jU2S
 FhOyev+e3eZzx3eF0ZgXTQ6v3CLez8UcwY7JbXc=
X-Google-Smtp-Source: AK7set9Oeby5ZiO4j1WfQPLMW7hqMfGTMtI89HVlCZ9I/MfTSbRdXG3HGk42A/9lx/anNGf3hIccAw==
X-Received: by 2002:a17:902:bb8c:b0:19e:72c9:7ebf with SMTP id
 m12-20020a170902bb8c00b0019e72c97ebfmr21951433pls.6.1678476759560; 
 Fri, 10 Mar 2023 11:32:39 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62?
 ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 kb7-20020a170903338700b0019908d2c85dsm386799plb.52.2023.03.10.11.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 11:32:39 -0800 (PST)
Message-ID: <43cad0ca-5d73-40dc-2cc0-dd58f1cb2b07@linaro.org>
Date: Fri, 10 Mar 2023 11:32:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 06/12] target/s390x: Handle CRL and CGFRL with non-aligned
 addresses
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230310174223.944843-1-iii@linux.ibm.com>
 <20230310174223.944843-7-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230310174223.944843-7-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
> Use MO_ALIGN_4 and let do_unaligned_access() generate a specification
> exception.
> 
> Reported-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> Suggested-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   target/s390x/tcg/translate.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

MO_ALIGN again, but otherwise
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

