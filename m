Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705F1388FAF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:57:47 +0200 (CEST)
Received: from localhost ([::1]:41360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMhm-0002Bt-HO
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljMgT-00081v-I0; Wed, 19 May 2021 09:56:25 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljMgS-0004PG-0o; Wed, 19 May 2021 09:56:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id a4so14170652wrr.2;
 Wed, 19 May 2021 06:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rdoRjS4qt/lVaW9y8YmGBUBN1UFbTTtEV/CIENTJiHM=;
 b=RAzRMS1Apuyu1D8jB/Gguw6AzPM6yFmTMmGasp3PBaW/1xzZ24A3vdGaqrkSoTM6x3
 jL017Vw9v2fuIlOBaO84ncrYPrdSv145YmMrFyQsN8QN9Cq3ezceZ90ObFAepXyi0e/V
 htV2MjglHO9d5ikC0npNdefUdSFePdHSJvePme6rK1EW/neEkJuV/oz1ALOykV3AC1xh
 dOu4IYBV7AXDilo6OkdK6ceD1NIeDb29Cy518OmHw+SHZlwIrWwFvzoXGjPim3f38t/Q
 EQAVFpnq9jKPUpJBPHrXktKQE5c8lFYbSLHhA/wUkdADQZeHuo45G0I6aXidrFTKtfer
 a4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rdoRjS4qt/lVaW9y8YmGBUBN1UFbTTtEV/CIENTJiHM=;
 b=KHSG4tHSeQI0Kg5Gxm2fp22LXGqvVcbqijXh6Z/E9KGhkYIYSJUDSZg+nUbaFMotzX
 cXbnj6QytwHDdRTE3FDdjTUaX7TwLf20bZUlHzuMiU13RBa7csK4agPrdwp1yq5yXxqS
 +D3ZqhawG4rEWrbFkumratBsbW4wOsgNGRuhAVuZDw+i8FMUpac6J6Olxf35wEo7Xbsf
 oFd36Ttb0RzGsISZBOKUHFC4LR29zhmrkN4N4j/6INeSkKhIJAdfFiIj2bpqM82hx9X1
 r2dimvsNdOb8HU9FJXXIheGPQC3LmSutgIGhvd9FrvkcO4/RNSGKyvBx/c4Si2e6hoyf
 wMgw==
X-Gm-Message-State: AOAM531wsjdrhTD8oEkVlQoOBKPIh6IAt65jIj5EjLh1xWzTYnpdwJbP
 MUDh4qvonOKs6EjnaHljC4Y=
X-Google-Smtp-Source: ABdhPJwC3orFLQif3L40U3G4xiasjr9R3qynau2iUOAo9NxnOxigsaaqvJQgFjYdQjCG2FrKjqmFuw==
X-Received: by 2002:a05:6000:1b8a:: with SMTP id
 r10mr14858822wru.296.1621432580979; 
 Wed, 19 May 2021 06:56:20 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id h13sm22527407wml.26.2021.05.19.06.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 06:56:20 -0700 (PDT)
Subject: Re: [PATCH] target/xtensa: fix access ring in l32ex
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20210519104433.16870-1-jcmvbkbc@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3811d64f-b41e-c73a-05f9-4fec714e128e@amsat.org>
Date: Wed, 19 May 2021 15:56:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519104433.16870-1-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Joaquin de Andres <me@xcancerberox.com.ar>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Joaquin who has interest in Xtensa ISA :)

On 5/19/21 12:44 PM, Max Filippov wrote:
> l32ex does memory access as all regular load/store operations at CRING
> level. Fix apparent pasto from l32e that caused it to use RING instead.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  target/xtensa/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
> index f93df87ec490..95f6b21c2a1e 100644
> --- a/target/xtensa/translate.c
> +++ b/target/xtensa/translate.c
> @@ -1814,7 +1814,7 @@ static void translate_l32ex(DisasContext *dc, const OpcodeArg arg[],
>      tcg_gen_mov_i32(addr, arg[1].in);
>      gen_load_store_alignment(dc, 2, addr, true);
>      gen_check_exclusive(dc, addr, false);
> -    tcg_gen_qemu_ld_i32(arg[0].out, addr, dc->ring, MO_TEUL);
> +    tcg_gen_qemu_ld_i32(arg[0].out, addr, dc->cring, MO_TEUL);
>      tcg_gen_mov_i32(cpu_exclusive_addr, addr);
>      tcg_gen_mov_i32(cpu_exclusive_val, arg[0].out);
>      tcg_temp_free(addr);
> 

Looking at s32ex, it makes sense.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

