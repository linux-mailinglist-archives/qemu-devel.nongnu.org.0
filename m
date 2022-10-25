Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C2060CBE1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 14:31:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJ49-0001FP-V8; Tue, 25 Oct 2022 08:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1onJ47-00011s-7E
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:29:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1onJ45-0000Cz-Km
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:29:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666700992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R6MGmxJG1GkAQzbWfdPKLJUgcsl1Hyz0x6JTgzOOZLA=;
 b=WM+MqyxMGvhUjLFhUpYvN7xWYCjAALC5ip8pJPkZG5MXKKtWMkZ3q0/PHIq+x6OVspvxa8
 8xPRc1zf33wMeIWkhWhBFVv6kW79DcUOH5glbWzqIAUbJIwq2KfL6JGUptvB8VgcJsRi+n
 yfmYmf519Fxc+r5/lWMOJyiEWbG0BVc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-330-L4T6bhBOPeCvEBmYVqTxGA-1; Tue, 25 Oct 2022 08:29:51 -0400
X-MC-Unique: L4T6bhBOPeCvEBmYVqTxGA-1
Received: by mail-qk1-f199.google.com with SMTP id
 x22-20020a05620a259600b006b552a69231so11250795qko.18
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 05:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R6MGmxJG1GkAQzbWfdPKLJUgcsl1Hyz0x6JTgzOOZLA=;
 b=l8iqxwAyv4Q/VlizM+tciceuVXiVi2L3Gy+nJmHvQS5WUNyVJld9FB1apsVd2fvsFI
 KGmFod5O05gifnzrC8UsYlXyYbE82QhW/nb4qqbIyXUHkcB+cuXEBtxh/M/H6l3fYY+v
 3dKmEshk10fyDRDwTsCSfZcvVS0cy6KbICi5aFbi5VMwYC+HVu1VeqAJJiJicxJ5Pgen
 B0GNb7EwfyyVtt+7BiPFfDwzaSuZqEMko2Qxet/EhfDE3O+u+SDbQTt0ymjiykGOvkWn
 K3UEfiZbZoAvBrgEzue9BemudlsuLqmRFb9KH8+8k1rUXKQNU6D5eIzYewXW7akZlAVC
 66kg==
X-Gm-Message-State: ACrzQf1ZSasG6uVBIJ+cnsx16xDbjaEYS/NIVdwla7fGqN1yqaa0ylSX
 l6lfWK2CLHdwNYPwGBCdjLXm+alEYXsi5UmtDKbHb+pW0YfZd8/9oF2O4XLUiViF62e0pzi9Hxt
 ieBJnnwNINaUpzdk=
X-Received: by 2002:a37:8243:0:b0:6ee:ca5d:99b6 with SMTP id
 e64-20020a378243000000b006eeca5d99b6mr26145498qkd.553.1666700990676; 
 Tue, 25 Oct 2022 05:29:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6mwTkyyO58utrPOgXvB/ku94wl2DgtbA5AzawyJVjjgEQam7lwAzP5KQXRKwcu/8SMlem8MA==
X-Received: by 2002:a37:8243:0:b0:6ee:ca5d:99b6 with SMTP id
 e64-20020a378243000000b006eeca5d99b6mr26145479qkd.553.1666700990377; 
 Tue, 25 Oct 2022 05:29:50 -0700 (PDT)
Received: from [10.201.49.36] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a05620a004100b006ee957439f2sm1811312qkt.133.2022.10.25.05.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 05:29:49 -0700 (PDT)
Message-ID: <7c33ff5c-69c5-a6b7-7f8a-7e8eaaeb33c6@redhat.com>
Date: Tue, 25 Oct 2022 14:29:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/3] accel/tcg: Add a quicker check for breakpoints
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 david@gibson.dropbear.id.au, groug@kaod.org
References: <20221021170112.151393-1-leandro.lupori@eldorado.org.br>
 <20221021170112.151393-2-leandro.lupori@eldorado.org.br>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221021170112.151393-2-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/21/22 19:01, Leandro Lupori wrote:
> Profiling QEMU during Fedora 35 for PPC64 boot revealed that a
> considerable amount of time was being spent in
> check_for_breakpoints() (0.61% of total time on PPC64 and 2.19% on
> amd64), even though it was just checking that its queue was empty
> and returning, when no breakpoints were set. It turns out this
> function is not inlined by the compiler and it's always called by
> helper_lookup_tb_ptr(), one of the most called functions.
> 
> By moving the check for empty queue to the have_breakpoints()
> macro and calling check_for_breakpoints() only when it returns
> true, it's possible to avoid the call overhead. An improvement of
> about 3% in total time was measured on POWER9.
> 
> Signed-off-by: Leandro Lupori<leandro.lupori@eldorado.org.br>
> ---
>   accel/tcg/cpu-exec.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index f9e5cc9ba0..9eec01ad9a 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -304,16 +304,15 @@ static void log_cpu_exec(target_ulong pc, CPUState *cpu,
>       }
>   }
>   
> +#define have_breakpoints(cpu)   (likely(QTAILQ_EMPTY(&(cpu)->breakpoints)) ? \
> +                                 false : true)
> +
>   static bool check_for_breakpoints(CPUState *cpu, target_ulong pc,
>                                     uint32_t *cflags)
>   {
>       CPUBreakpoint *bp;
>       bool match_page = false;
>   
> -    if (likely(QTAILQ_EMPTY(&cpu->breakpoints))) {
> -        return false;
> -    }
> -

It's a little more readable to just split out the slow path:

-static inline bool check_for_breakpoints(CPUState *cpu, target_ulong pc,
-                                         uint32_t *cflags)
+static bool check_for_breakpoints_slow(CPUState *cpu, target_ulong pc,
+                                       uint32_t *cflags)
  {
       CPUBreakpoint *bp;
       bool match_page = false;
   
-    if (likely(QTAILQ_EMPTY(&cpu->breakpoints))) {
-        return false;
-    }
      ...
  }
+
+static inline bool check_for_breakpoints(CPUState *cpu, target_ulong pc,
+                                         uint32_t *cflags)
+{
+    return unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))
+        && check_for_breakpoints_slow(cpu, pc, cflags);
+}

Paolo


