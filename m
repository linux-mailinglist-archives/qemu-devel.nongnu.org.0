Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088E23875C2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:53:41 +0200 (CEST)
Received: from localhost ([::1]:53636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwQ0-0006NI-2G
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw1W-0002pj-Sa
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:28:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw1S-0008Ke-Nh
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621330098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m6Q0VvoL0oExrvqvPcAD3t1h5hqPh9emBkw8Vg2WBNI=;
 b=SBJCSePwR4+1EhANhqP2ZQC+cJJB+yJBS7ms4PuYCe9jEROgQC+w8EDr88tVgWk/0ijo9S
 6xcNIjSi+Ip6geSFyy5dC1iDUMhu5NEULEZnz3HRb39flNP+tioK+FwrlatXHV8vh0LACn
 xjuuf1o5VWLW7twbowXZc1OvwiE9uLY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-D2DjCN9YPKC9uD6An8BjCg-1; Tue, 18 May 2021 05:28:16 -0400
X-MC-Unique: D2DjCN9YPKC9uD6An8BjCg-1
Received: by mail-ed1-f72.google.com with SMTP id
 w22-20020a05640234d6b029038d04376b6aso5385866edc.21
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m6Q0VvoL0oExrvqvPcAD3t1h5hqPh9emBkw8Vg2WBNI=;
 b=m6TDqy7cxVngIztZ7B4CZWd6SLdbqcv27v5e+vZF2pxiVmEnBeFcoVpLHAyD6y31YR
 RwBAPKHy9/1n7JNRWpnnX35d/sdS2jm3UtklgeIv3/6fBGwF2AuG6XQTptxEbyhPoRh2
 OA5x/OqdSMGCpKnOOIh4n3+4eetBBFoIsoMvIfqadK+tJ2IRhffu4FQ2u6eXgctT4s+P
 8BdWj7Mldgb8t9xpeovau6YN0INzF0612iS6eFdfMYVHFgFcunZ/W4SArvqNrNygDEHV
 PQY7bHq5k3vmrFtkaT9yzeIxydOfkfTcX4+J7Z+VATrPXUz1w/YFpD8TO0eyYy1fsBJV
 4mVA==
X-Gm-Message-State: AOAM530OpPhjXHwBx26ici/xl+Ii41Pt2HNL1C31LhWpeu0BfNrR1zUA
 mo5pP3mg/9gP1OTZe3araB5X5V947tX0z5veBg942MpKJp/zd9gRoTee/64N3PgLNsaQ/fntmLD
 9MqZg8k9gIn8SkK8=
X-Received: by 2002:a17:906:a48:: with SMTP id
 x8mr5093650ejf.127.1621330094999; 
 Tue, 18 May 2021 02:28:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXCkhhuN7hjg3Y+sZYAhUuq8L+I0rSJqpNJMC3gf8vOgxAuysKMRTNn+Zomo0IDA3lZzwoXA==
X-Received: by 2002:a17:906:a48:: with SMTP id
 x8mr5093637ejf.127.1621330094842; 
 Tue, 18 May 2021 02:28:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q16sm12794909edv.61.2021.05.18.02.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:28:14 -0700 (PDT)
Subject: Re: [PATCH v2 16/50] target/i386: Tidy REX_B, REX_X definition
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-17-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5eda8504-448c-e55d-7dc6-8f3d1a263230@redhat.com>
Date: Tue, 18 May 2021 11:28:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-17-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> Change the storage from int to uint8_t since the value is in {0,8}.
> For x86_64 add 0 in the macros to (1) promote the type back to int,
> and (2) make the macro an rvalue.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Might be easier in the end to put all rex bits in the same uint8_t, but 
that can be done later.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> ---
>   target/i386/tcg/translate.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 79a37fb1a7..9bb37215d8 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -41,14 +41,6 @@
>   #define PREFIX_VEX    0x20
>   #define PREFIX_REX    0x40
>   
> -#ifdef TARGET_X86_64
> -#define REX_X(s) ((s)->rex_x)
> -#define REX_B(s) ((s)->rex_b)
> -#else
> -#define REX_X(s) 0
> -#define REX_B(s) 0
> -#endif
> -
>   #ifdef TARGET_X86_64
>   # define ctztl  ctz64
>   # define clztl  clz64
> @@ -100,7 +92,8 @@ typedef struct DisasContext {
>   #endif
>   
>   #ifdef TARGET_X86_64
> -    int rex_x, rex_b;
> +    uint8_t rex_x;
> +    uint8_t rex_b;
>   #endif
>       int vex_l;  /* vex vector length */
>       int vex_v;  /* vex vvvv register, without 1's complement.  */
> @@ -173,8 +166,12 @@ typedef struct DisasContext {
>   
>   #ifdef TARGET_X86_64
>   #define REX_PREFIX(S)  (((S)->prefix & PREFIX_REX) != 0)
> +#define REX_X(S)       ((S)->rex_x + 0)
> +#define REX_B(S)       ((S)->rex_b + 0)
>   #else
>   #define REX_PREFIX(S)  false
> +#define REX_X(S)       0
> +#define REX_B(S)       0
>   #endif
>   
>   static void gen_eob(DisasContext *s);
> @@ -4617,7 +4614,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               rex_w = (b >> 3) & 1;
>               rex_r = (b & 0x4) << 1;
>               s->rex_x = (b & 0x2) << 2;
> -            REX_B(s) = (b & 0x1) << 3;
> +            s->rex_b = (b & 0x1) << 3;
>               goto next_byte;
>           }
>           break;
> 


