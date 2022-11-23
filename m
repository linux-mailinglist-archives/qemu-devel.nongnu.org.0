Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B9D6365A9
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 17:23:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxsWZ-0008DI-DO; Wed, 23 Nov 2022 11:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxsWX-0008D8-9R
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:22:57 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxsWV-0006SW-KQ
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:22:57 -0500
Received: by mail-wm1-x330.google.com with SMTP id o30so13453954wms.2
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 08:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BkWgpVNENmMkTM7oSK2LXUY5f755z7PjdGK3ZXxp52M=;
 b=AtrBjFOuYCJqKKPsqkkNHGVhUYbWzFFfUzLncxG/09Amodz+LIkYZ6h3vo/gx8NArw
 b7IjikAdf5MPGdZmIWE2Oxy9o3pdevr4nzQo7mCKnGS9AbJaPmixTJZZJRB8n26JJg1w
 qil+6VFPkvCycB8VFzxzYKOijRWOANvFN6YNqzlmJBuqq6GgnPlEt0g8xMgPb+6wV2Zg
 gM9jRYlg8Cl4DYK+OqYt969fZE9WgKBZ+8wu78i4s6L/tY1Tth2d6dCLNw7GBToCZ46K
 w0RDhvtb0jYfhS+ZgAML0wz3D+P/vrG4pOs/kNJYBR+EV/6bHU4o/LAj1AJY9U2o+ow3
 SgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BkWgpVNENmMkTM7oSK2LXUY5f755z7PjdGK3ZXxp52M=;
 b=CPmwQn7dqN1DW8SfIdQGNzXVa0d8ZMP89fNJtY9UST/8rjrLsRh4UQYhN8gM5yzi7R
 he2PR1lcSPlmqL4dqXmfXhPfX/uGJ406qsR8HefnABDsZ59VKU7fsU6Dv3toIszNRglM
 tcNxylvbPVI+zsCIm6+/PizCqeiTos4DXF8hjkVyPILfGO8GmD5geBr9bsdd4K3dsJtF
 /WWE7zxsVWl98dGU4S4Z9btt4UrkiJ5whBULNKM9hOHDCE04KcLwju/QKtGfIgVg+h6t
 Z0b1kC5KB7AJq1xSJIKv8MO1AGjmMoziLzGUk/VAzjZOf7GgyGF0L1bi3mKRCXLAmgHC
 Upkg==
X-Gm-Message-State: ANoB5pnOOw9E5BhPmfTdEoRnWAnmoyd0M0lRlj2RJuSJB6Eq57LVbPhA
 XRtQ7mY4F1G6tVGrSPQS9rcx7dRQvIgG+Q==
X-Google-Smtp-Source: AA0mqf6e4HIQpaGidV9NdUnLht4HmVWCbx9jF9oXBczlZrNRKgQZdBC+B8fr4AUMuCZz5kzCIVNo/g==
X-Received: by 2002:a1c:7504:0:b0:3cf:8ebf:69b with SMTP id
 o4-20020a1c7504000000b003cf8ebf069bmr11446681wmc.86.1669220573476; 
 Wed, 23 Nov 2022 08:22:53 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g15-20020adff40f000000b00241db7deb57sm7368666wro.114.2022.11.23.08.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 08:22:53 -0800 (PST)
Message-ID: <2a4bc1ad-500e-d87f-c319-35e260713659@linaro.org>
Date: Wed, 23 Nov 2022 17:22:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 3/3] tcg: Move ffi_cif pointer into TCGHelperInfo
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
References: <20221111074101.2069454-27-richard.henderson@linaro.org>
 <20221122180804.938-1-philmd@linaro.org>
 <20221122180804.938-4-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221122180804.938-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 22/11/22 19:08, Philippe Mathieu-Daudé wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Instead of requiring a separate hash table lookup,
> put a pointer to the CIF into TCGHelperInfo.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20221111074101.2069454-27-richard.henderson@linaro.org>
> [PMD: Split from bigger patch]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tcg/tcg-internal.h |  7 +++++++
>   tcg/tcg.c          | 26 ++++++++++++++------------
>   2 files changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
> index c7e87e193d..6e50aeba3a 100644
> --- a/tcg/tcg-internal.h
> +++ b/tcg/tcg-internal.h
> @@ -25,6 +25,10 @@
>   #ifndef TCG_INTERNAL_H
>   #define TCG_INTERNAL_H
>   
> +#ifdef CONFIG_TCG_INTERPRETER
> +#include <ffi.h>
> +#endif
> +
>   #define TCG_HIGHWATER 1024
>   
>   /*
> @@ -57,6 +61,9 @@ typedef struct TCGCallArgumentLoc {
>   typedef struct TCGHelperInfo {
>       void *func;
>       const char *name;
> +#ifdef CONFIG_TCG_INTERPRETER
> +    ffi_cif *cif;
> +#endif
>       unsigned typemask           : 32;
>       unsigned flags              : 8;
>       unsigned nr_in              : 8;
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 9b24b4d863..d6a3036412 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c

I forgot this hunk:

-- >8 --
@@ -62,10 +62,6 @@
  #include "tcg/tcg-ldst.h"
  #include "tcg-internal.h"

-#ifdef CONFIG_TCG_INTERPRETER
-#include <ffi.h>
-#endif
-

---

> @@ -552,8 +552,6 @@ static TCGHelperInfo all_helpers[] = {
>   static GHashTable *helper_table;
>   
>   #ifdef CONFIG_TCG_INTERPRETER
> -static GHashTable *ffi_table;
> -
>   static ffi_type *typecode_to_ffi(int argmask)
>   {
>       switch (argmask) {
> @@ -576,9 +574,11 @@ static ffi_type *typecode_to_ffi(int argmask)
>   static void init_ffi_layouts(void)
>   {
>       /* g_direct_hash/equal for direct comparisons on uint32_t.  */
> -    ffi_table = g_hash_table_new(NULL, NULL);
> +    GHashTable *ffi_table = g_hash_table_new(NULL, NULL);
> +
>       for (int i = 0; i < ARRAY_SIZE(all_helpers); ++i) {
> -        uint32_t typemask = all_helpers[i].typemask;
> +        TCGHelperInfo *info = &all_helpers[i];
> +        unsigned typemask = info->typemask;
>           gpointer hash = (gpointer)(uintptr_t)typemask;
>           struct {
>               ffi_cif cif;
> @@ -586,8 +586,11 @@ static void init_ffi_layouts(void)
>           } *ca;
>           ffi_status status;
>           int nargs;
> +        ffi_cif *cif;
>   
> -        if (g_hash_table_lookup(ffi_table, hash)) {
> +        cif = g_hash_table_lookup(ffi_table, hash);
> +        if (cif) {
> +            info->cif = cif;
>               continue;
>           }
>   
> @@ -611,8 +614,12 @@ static void init_ffi_layouts(void)
>                                 ca->cif.rtype, ca->cif.arg_types);
>           assert(status == FFI_OK);
>   
> -        g_hash_table_insert(ffi_table, hash, (gpointer)&ca->cif);
> +        cif = &ca->cif;
> +        info->cif = cif;
> +        g_hash_table_insert(ffi_table, hash, (gpointer)cif);
>       }
> +
> +    g_hash_table_destroy(ffi_table);
>   }
>   #endif /* CONFIG_TCG_INTERPRETER */
>   
> @@ -4413,12 +4420,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
>       }
>   
>   #ifdef CONFIG_TCG_INTERPRETER
> -    {
> -        gpointer hash = (gpointer)(uintptr_t)info->typemask;
> -        ffi_cif *cif = g_hash_table_lookup(ffi_table, hash);
> -        assert(cif != NULL);
> -        tcg_out_call(s, tcg_call_func(op), cif);
> -    }
> +    tcg_out_call(s, tcg_call_func(op), info->cif);
>   #else
>       tcg_out_call(s, tcg_call_func(op));
>   #endif


