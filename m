Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C44E69D261
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 18:51:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUAIH-0005sJ-7J; Mon, 20 Feb 2023 12:49:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUAIG-0005sA-0I
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:49:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUAID-0002eF-PA
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:49:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676915376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAp1xrlNEM2mXRK0xew0h4TAH5jRKjDVRh8FjdEbNZY=;
 b=CAI+eeBwWejWTrlXt/zHK1zeCy3xsKSZWmLlSXKirijeM3Lkgk5wjqkxlfpmAaybAu+u6G
 u/GOj9gue462gSvdFjBpMGsKV0lFbi6FW3ep3kgK5od+gBxe4RWRwWuPsQu20++F70msFu
 WLo9kt066+UcSlDL9LtWDEaGqKQAaWs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-511-_Ou7XG0uNOiApE-A0VUQMw-1; Mon, 20 Feb 2023 12:49:35 -0500
X-MC-Unique: _Ou7XG0uNOiApE-A0VUQMw-1
Received: by mail-wm1-f72.google.com with SMTP id
 s18-20020a7bc392000000b003deaf780ab6so757803wmj.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 09:49:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CAp1xrlNEM2mXRK0xew0h4TAH5jRKjDVRh8FjdEbNZY=;
 b=yZ52zE1Jodk2K6WP4RMcS1AUNqHmr0AAGGTCGbtoHVyDHbMuEfp+au020Hw7s06THg
 SQkuwIQ3Hf9FERxtSCwYzWm8oI1xOuwQBv8XqD+PP5rvanCL2rCDJC4uob0AJD+NAB/l
 WaMXt5qv2JD1Jf6qrTnwAXINvPBF7xPYqOK/8YafiapxpchBGk8uQHg9WDNSjC5eynWw
 Gz1UKJSE4Da0bgPBZfxEARmm98d8XfRWcEZ0g4ziNjtZlAT5C/KPgmw5kSbn5MtWA45B
 29H2MUv8Oh3nNqheY2/9bCcnZsOg15qdOU8f9bgx2siCHwIbcyDOFlPRc/tyQOrE/ZVX
 OfbQ==
X-Gm-Message-State: AO0yUKW3/rJ3KO4evOw71dZzqaQY8xJZDjxEE4ApJluc0OoNlsD6w2XN
 bIY7A1FYE4vvPSwmtI9w5YqZ3OoE7Zqhrg9WZy6yQdGmSQaI+c/xr7ClVlkznyTeOEPxpaOTRTN
 TLGPq14iHfiKEqL8=
X-Received: by 2002:a5d:6b90:0:b0:2c5:9cb8:d2f2 with SMTP id
 n16-20020a5d6b90000000b002c59cb8d2f2mr1629527wrx.15.1676915374511; 
 Mon, 20 Feb 2023 09:49:34 -0800 (PST)
X-Google-Smtp-Source: AK7set8pMRRTh7zNpy5dKALRSDOVe8CROTy16LGxDJjhI7n+LHopMQtrUVsA7+bdIaKuyzsQfJtEFQ==
X-Received: by 2002:a5d:6b90:0:b0:2c5:9cb8:d2f2 with SMTP id
 n16-20020a5d6b90000000b002c59cb8d2f2mr1629516wrx.15.1676915374225; 
 Mon, 20 Feb 2023 09:49:34 -0800 (PST)
Received: from [192.168.8.104] (tmo-100-40.customers.d1-online.com.
 [80.187.100.40]) by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c510b00b003e1f2e43a1csm1350975wms.48.2023.02.20.09.49.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 09:49:33 -0800 (PST)
Message-ID: <7f76ccf3-bce8-cb89-18a7-5e08d962da98@redhat.com>
Date: Mon, 20 Feb 2023 18:49:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 01/27] target/s390x: Use tcg_constant_* in local
 contexts
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
 <20230109200819.3916395-2-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230109200819.3916395-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 09/01/2023 21.07, Richard Henderson wrote:
> Replace tcg_const_* with tcg_constant_* in contexts
> where the free to remove is nearby.
> 
> Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 416 +++++++++++++----------------------
>   1 file changed, 149 insertions(+), 267 deletions(-)
...
> @@ -2141,24 +2106,22 @@ static DisasJumpType op_clclu(DisasContext *s, DisasOps *o)
>           return DISAS_NORETURN;
>       }
>   
> -    t1 = tcg_const_i32(r1);
> -    t3 = tcg_const_i32(r3);
> +    t1 = tcg_constant_i32(r1);
> +    t3 = tcg_constant_i32(r3);
>       gen_helper_clclu(cc_op, cpu_env, t1, o->in2, t3);
> -    tcg_temp_free_i32(t1);
> -    tcg_temp_free_i32(t3);
>       set_cc_static(s);
>       return DISAS_NEXT;
>   }
>   
>   static DisasJumpType op_clm(DisasContext *s, DisasOps *o)
>   {
> -    TCGv_i32 m3 = tcg_const_i32(get_field(s, m3));
> +    TCGv_i32 m3 = tcg_constant_i32(get_field(s, m3));
>       TCGv_i32 t1 = tcg_temp_new_i32();
> +
>       tcg_gen_extrl_i64_i32(t1, o->in1);
>       gen_helper_clm(cc_op, cpu_env, t1, m3, o->in2);
>       set_cc_static(s);
>       tcg_temp_free_i32(t1);
> -    tcg_temp_free_i32(m3);
>       return DISAS_NEXT;
>   }
>   
> @@ -2217,8 +2180,8 @@ static DisasJumpType op_cdsg(DisasContext *s, DisasOps *o)
>   
>       /* Note that R1:R1+1 = expected value and R3:R3+1 = new value.  */
>       addr = get_address(s, 0, b2, d2);
> -    t_r1 = tcg_const_i32(r1);
> -    t_r3 = tcg_const_i32(r3);
> +    t_r1 = tcg_constant_i32(r1);
> +    t_r3 = tcg_constant_i32(r3);
>       if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
>           gen_helper_cdsg(cpu_env, addr, t_r1, t_r3);
>       } else if (HAVE_CMPXCHG128) {

This seems to have a conflict with another patch of yours ("Use 
tcg_gen_atomic_cmpxchg_i128 for CDSG") which has been merged first.

Could you please rebase and send a v4?

  Thanks,
   Thomas


