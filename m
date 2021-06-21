Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA733AE968
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 14:51:12 +0200 (CEST)
Received: from localhost ([::1]:39638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvJOP-0004Vq-V9
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 08:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvJNc-0003mV-4L
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:50:20 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvJNa-0004K6-Dw
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:50:19 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 n35-20020a05600c3ba3b02901cdecb6bda8so13779303wms.5
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 05:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ljL1mL2joPxEPfpk12dZfV2wVppisBO5YhYbRyjMJXE=;
 b=nCg0ff1CbN3sZHs0bcT1mQ/RDFIvDg1370R8mE8l+KMIPwlCscfJ39kWRtBVjcZBAT
 Yb92ycxRknbVi+UtUd3QSsB56bv8hlh2ohch8CARk1UmPe6eIOqKLD9ZLvk7Ain7TSOL
 pElAobx62/uWdnNiAg7Csi3mfBlvtjHsRpt+7HWpdL6Zr3K7sQk4gIQMs+xrfOd79p5S
 w104f4Wokf47H5qgzUbxh9o/U7l9n7QEfuM/QCkiYU2R3osudYDItiARyItPFucBjEex
 m827nagBg6HTFLM7cAtJgnBtXX49sTVkhP30ETo3VB6i96aNsdwshSZfJl10FEscLs3P
 xH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:cc:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ljL1mL2joPxEPfpk12dZfV2wVppisBO5YhYbRyjMJXE=;
 b=Ukr3J7zfD3MCxk3pNZuTHRsoMHbbWQlmwPnt4NWG9k5cyOmgys2GTL38fkrg9ko0Mu
 fBirslUKx6hvpAl7To0uw8Iv7wC4f/BzO8qI+Ie70nftRNzK446hMFzM7wUDJqFkNoo2
 Ni5CVuNuOtltR/U5NUKxqLGwXo0/UnJk/f+Ee4w6uzgFsI8EeJFI95yeXpayW56zJorg
 /iPWvwwNigmewhNfJiVl8BH/zs8DuxPtoHtjHULUVHRiNniFqKQE5sFZp5PSjU4SZ6d5
 yI2U+ARQaLHYuI01HQ8DXDo6+przfcUtMhFq9NGblCRTSUJjLMhIVNHg01D4QmbZ54+S
 wzIQ==
X-Gm-Message-State: AOAM531CRSt/stwdRUArB/mtQ+3YX3GNw+pi142zs06G0lHAWbkM4zGx
 8+4NGlZM49hKS8TF6y33oEE=
X-Google-Smtp-Source: ABdhPJxGem0CoNvqGYC/WR37RBf1PFSEj39X6GlcIb9K8idfEZt3/UR1UyYyvUyMhf5AMFRXe4CWIA==
X-Received: by 2002:a1c:a445:: with SMTP id n66mr26874216wme.140.1624279816952; 
 Mon, 21 Jun 2021 05:50:16 -0700 (PDT)
Received: from [192.168.43.238] (47.red-95-127-153.staticip.rima-tde.net.
 [95.127.153.47])
 by smtp.gmail.com with ESMTPSA id r1sm734414wmn.10.2021.06.21.05.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 05:50:16 -0700 (PDT)
Subject: Re: [PATCH 01/26] accel/tcg: Introduce translator_use_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
 <20210621013439.1791385-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d0f44918-da3f-60a2-d07c-1fde60b445d5@amsat.org>
Date: Mon, 21 Jun 2021 14:50:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210621013439.1791385-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 6/21/21 3:34 AM, Richard Henderson wrote:
> Add a generic version of the common use_goto_tb test.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/translator.h | 10 ++++++++++
>  accel/tcg/translator.c    | 11 +++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/include/exec/translator.h b/include/exec/translator.h
> index 24232ead41..dd9c06d40d 100644
> --- a/include/exec/translator.h
> +++ b/include/exec/translator.h
> @@ -145,6 +145,16 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
>  
>  void translator_loop_temp_check(DisasContextBase *db);
>  
> +/**
> + * translator_use_goto_tb
> + * @db: Disassembly context
> + * @dest: target pc of the goto
> + *
> + * Return true if goto_tb is allowed between the current TB
> + * and the destination PC.
> + */
> +bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest);
> +
>  /*
>   * Translator Load Functions
>   *
> diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
> index 1d32732198..59804af37b 100644
> --- a/accel/tcg/translator.c
> +++ b/accel/tcg/translator.c
> @@ -31,6 +31,17 @@ void translator_loop_temp_check(DisasContextBase *db)
>      }
>  }
>  
> +bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
> +{
> +    /* Suppress goto_tb in the case of single-steping.  */
> +    if (db->singlestep_enabled || singlestep) {
> +        return false;
> +    }
> +

I notice various targets do:

#ifdef CONFIG_USER_ONLY
       return true;
#else

> +    /* Check for the dest on the same page as the start of the TB.  */
> +    return ((db->pc_first ^ dest) & TARGET_PAGE_MASK) == 0;

#endif

> +}

Is that OK to remove this case? If so, it might be worth a comment
somewhere.

Regards,

Phil.

