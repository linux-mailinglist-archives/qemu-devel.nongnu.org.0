Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25208592E83
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 13:51:48 +0200 (CEST)
Received: from localhost ([::1]:50232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNYdG-0004ne-OI
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 07:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNYXB-0000rQ-D9
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 07:45:29 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:44575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNYX9-0001kZ-OE
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 07:45:29 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 e8-20020a17090a280800b001f2fef7886eso6514223pjd.3
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 04:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=CX5CfII/E+5mCuQERAYWJFJSSS3l73YAxA97+aT2Ekc=;
 b=nQh6slNKrEUVgapqQ+3IQmL4CeRjoPInfNiF2jRSQbA6QrVUBUnqoZ745T3F7+mXVm
 bEgqH8wX21bn1F2aI5+tfcfRphIogxIJBVdemR2vW8HObOzpfrnnNOAi5kEXA1cU83ct
 /JhFrnV2DfsY9TnBpqKPXtxCTKOVUaf4w21iqtZzaQIb2f3FYCb1vYq7IR50Qp+FKdzB
 FlbKSEgYv3tYMq75Y0s3KURDW4J1RmwQ72o1DFbr6F9OhDH94fsMzWYteXxPh4ERHXUj
 HnVX3lJOynbJfF7aDad02Z2WdHENuotd6iHiNy1LFEPMWus+tyvgdFkUDtaTBKKx3DHq
 kthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=CX5CfII/E+5mCuQERAYWJFJSSS3l73YAxA97+aT2Ekc=;
 b=XlgKt7Y+XVBUu5EMXK21ApaBTJaRMWTk1pnTDuJ6j6c9mFkxszyHA2XJIjhcmBGsH5
 8sHnPhZRrskeMgwot/UvossqCEVp1zum7F6iNn5yZekxBuwzNyaimV8bhlKWqffa12ln
 9bfzX/O+ZThrFdEhBuBdDENmzGtuR935CMej1aYyzVmZ35z2NF4ocbuGAGCSS5/rKwcc
 cRT6OxnoWtUhRRHPxoIiIojZxJAUZ2eBDlQdNZ1NG6tA1q/trd45F30VL2zUvBHF6HlE
 FdlOCkCa2/sP5W6g9p3+TO9h+7c+9JFDoiE8k7CM07aVfKOqRl2ouJ5NjQUcNtqm9Q+4
 cgjw==
X-Gm-Message-State: ACgBeo34fhBkunFezP6IRBwlRAwGoIiSXd+5ll4Ssh2akKi9HcXIjDX/
 YbsPaCb/sExKjSJcUN8zHTw=
X-Google-Smtp-Source: AA6agR7e6vlLJ+GNol9dh4I7Pdi1nCa4i+cVVaCBYTc6gNT50rJDAd90Yupb4s1+CTWf6mdwX+33Nw==
X-Received: by 2002:a17:902:eac2:b0:172:57c5:42f8 with SMTP id
 p2-20020a170902eac200b0017257c542f8mr11775615pld.139.1660563926343; 
 Mon, 15 Aug 2022 04:45:26 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 192-20020a6215c9000000b0052de390357esm6390691pfv.130.2022.08.15.04.45.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 04:45:25 -0700 (PDT)
Message-ID: <5f39bb7c-8f8a-97a3-3423-ab105446d947@amsat.org>
Date: Mon, 15 Aug 2022 13:45:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 06/20] disas/nanomips: Remove disasm methods from class
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-7-milica.lazarevic@syrmia.com>
In-Reply-To: <20220815072629.12865-7-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 15/8/22 09:26, Milica Lazarevic wrote:
> NMD class methods with the disassembly_function type like
> NMD::ABS_D, NMD::ABS_S, etc. are removed from the class. They're now
> declared global static functions. Therefore, typedef of the function
> pointer, disassembly_function is defined outside of the class.
> 
> Now that disassembly_function type functions are not part of the NMD
> class we can't access them using the this pointer. Thus, the use of
> the this pointer has been deleted.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 2546 ++++++++++++++++++++++----------------------
>   disas/nanomips.h   |  640 +----------
>   2 files changed, 1274 insertions(+), 1912 deletions(-)
> 
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index 9e720d0e8d..205c4f3143 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -815,7 +815,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
>                                   return -6;
>                               }
>                               type = table[i].type;
> -                            dis = (this->*dis_fn)(op_code);
> +                            dis = (dis_fn)(op_code);

   dis_fn(op_code);

>                               return table[i].instructions_size;
>                           } else {
>                               dis = "reserved instruction";

> diff --git a/disas/nanomips.h b/disas/nanomips.h
> index 0e6670adf5..d27711b4e2 100644
> --- a/disas/nanomips.h
> +++ b/disas/nanomips.h
> @@ -32,6 +32,7 @@ typedef uint16_t uint16;
>   typedef uint64_t img_address;
>   
>   typedef bool(*conditional_function)(uint64 instruction);
> +typedef std::string(*disassembly_function)(uint64 instruction);

    typedef std::string (*nmd_disas_fn)(uint64 instruction);

>   
>   enum TABLE_ENTRY_TYPE {
>       instruction,
> @@ -72,8 +73,6 @@ public:
>   
>   private:
>   
> -    typedef std::string(NMD:: *disassembly_function)(uint64 instruction);
> -
>       struct Pool {
>           TABLE_ENTRY_TYPE     type;
>           struct Pool          *next_table;
> @@ -90,643 +89,6 @@ private:
>       int Disassemble(const uint16 *data, std::string & dis,
>                       TABLE_ENTRY_TYPE & type, const Pool *table, int table_size);

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

