Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBD5417181
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:07:56 +0200 (CEST)
Received: from localhost ([::1]:56184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjzf-0007aI-D5
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjrY-0005kC-4I
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:59:32 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:37708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjrW-0002Ev-CZ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:59:31 -0400
Received: by mail-qk1-x729.google.com with SMTP id 73so27787890qki.4
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HfNvGRwRQXFejBv/zgC2uGmnomFa1B/M42zR82vESsI=;
 b=TCeyQ6g8CzJXW0KU8X8V8ycrxnuMsD8f8a/Komsn2hAAAHI7DVsvszoVtb9rsdUmWb
 g2XkthXRgyIwDYmXI3aKq49HZRI0Di5dtNNAADEvX2MqLOoaSJg/XId7p8uRFMlCZwPD
 SacP9U0U1ugQ0VE7AxEkhj/ssBQNVYDJVZRpOmQ0L84mPmaheuI+0RrKt1gU+Z+N56Y9
 MVHlcFpOEbTaqf+uI7pkNa+FXoS8jMXJ5R3qQ4P/eopiGz7k3Csn2loCUuF7VK1wEGEl
 Inw0FNQHe0Z8sIyXazGiTTuNJ+CvQ+42CFFUqzfpOK1Bg4ZfNniZBYB3ObDZQCOgg2aG
 wLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HfNvGRwRQXFejBv/zgC2uGmnomFa1B/M42zR82vESsI=;
 b=u8l0e6qzdfL1/TsBovAG7vEEKSs7CpmBg67qyQYF7JfJ3ZHhwOs0TOmKtQI9xiG6RB
 Ttp0N4952XKWokv50ZDwOopBzY2oBtpRUYWTv+B4TYeV6Pb7/M81wmiiHUDnTEItUjDd
 JF3XXm5+YWM3Z4Jrl+a5dpzFU4yPh4BAmo89DrJQXjcVUa1n0Ekl3gRIyjZjcieI+YvS
 FM6fkkP5Beq4GW+Softom9GcqX63qQW1yhrsmtYljDcVYRlGLlKQlamaJRFNRIYq++vX
 lcNuKsWHcwI0a8Eoy0NAJP7lOqAHi/iEr1xZ2rnlC+JheNH2isi5Bf6az97ylFsbZl+A
 woEw==
X-Gm-Message-State: AOAM532vH27CiXEbDZyqA+LhGL+MyviUQyP7d60TBYK1nQvqqDnGmSD4
 3qMU+5Z3Dc/yG+lQkqcbAAVmeQ==
X-Google-Smtp-Source: ABdhPJzZ5ES8ZyZQ2YD3bCY9gX+f/wtiLa1ohPYOKbgqdcgs4h+6eCGq+i9b5YxhWm/TdygW8R2+9Q==
X-Received: by 2002:a05:620a:22e:: with SMTP id
 u14mr10132949qkm.101.1632484768848; 
 Fri, 24 Sep 2021 04:59:28 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id x10sm286047qtq.45.2021.09.24.04.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 04:59:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-10-git@xen0n.name>
Message-ID: <5ace7b10-b7de-46e2-2021-01129024ffe2@linaro.org>
Date: Thu, 23 Sep 2021 09:50:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922180927.666273-10-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 11:09 AM, WANG Xuerui wrote:

Following up on previous, I suggest:

> +static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
> +                         tcg_target_long val)
> +{
> +    if (type == TCG_TYPE_I32) {
> +        val = (int32_t)val;
> +    }
> +
> +    /* Single-instruction cases.  */
> +    tcg_target_long low = sextreg(val, 0, 12);
> +    if (low == val) {
> +        /* val fits in simm12: addi.w rd, zero, val */
> +        tcg_out_opc_addi_w(s, rd, TCG_REG_ZERO, val);
> +        return;
> +    }
> +    if (0x800 <= val && val <= 0xfff) {
> +        /* val fits in uimm12: ori rd, zero, val */
> +        tcg_out_opc_ori(s, rd, TCG_REG_ZERO, val);
> +        return;
> +    }

> +    /* Test for PC-relative values that can be loaded faster.  */
> +    intptr_t pc_offset = tcg_pcrel_diff(s, (void *)val);
> +    if (pc_offset == sextreg(pc_offset, 0, 22) && (pc_offset & 3) == 0) {
> +        tcg_out_opc_pcaddu2i(s, rd, pc_offset >> 2);
> +        return;
> +    }

     /* Handle all 32-bit constants. */
     if (val == (int32_t)val) {
         tcg_out_opc_lu12i(s, rd, val >> 12);
         if (low) {
             tcg_out_opc_ori(s, rd, rd, val & 0xfff);
         }
         return;
     }

     /* Handle pc-relative values requiring 2 instructions. */
     intptr_t pc_lo = sextract64(pc_offset, 0, 12);
     intptr_t pc_hi = pc_offset - pc_low;
     if (pc_hi == (int32_t)pc_hi) {
         tcg_out_opc_pcaddu12i(s, rd, pc_hi >> 12);
         tcg_out_opc_addi_d(s, rd, rd, pc_lo);
         return;
     }

     /*
      * Choose signed low part if bit 13 is also set,
      * which gives us a chance of making more zeros.
      * Otherwise, let low be unsigned.
      */
     if ((val & 0x1800) != 0x1800) {
         low = val & 0xfff;
     }
     val -= low;

     tcg_target_long hi20 = sextract64(val, 12, 20);
     tcg_target_long hi32 = sextract64(val, 32, 20);
     tcg_target_long hi52 = sextract64(val, 52, 12);

     /*
      * If we can use the sign-extension of a previous
      * operation, suppress higher -1.
      */
     if (hi32 < 0 && hi52 == -1) {
         hi52 = 0;
     }
     if (hi20 < 0 && hi32 == -1) {
         hi32 = 0;
     }

     /* Initialize RD with the least non-zero component. */
     if (hi20) {
         tcg_out_opc_lu12i_w(s, rd, hi20 >> 12);
     } else if (hi32) {
         /* CU32I_D is modify in place, so RD must be initialized. */
         if (low < 0) {
             tcg_out_opc_addi_w(s, rd, TCG_REG_ZERO, low);
         } else {
             tcg_out_opc_ori(s, rd, TCG_REG_ZERO, low);
         }
         low = 0;
     } else {
         tcg_out_opc_cu52i_d(s, rd, TCG_REG_ZERO, hi52);
         hi52 = 0;
     }

     /* Assume that lu12i + ori are fusable */
     if (low > 0) {
         tcg_out_opc_ori(s, rd, rd, low);
     }

     /* Set the high 32 bits */
     if (hi32) {
         tcg_out_opc_cu32i_d(s, rd, hi32);
     }
     if (hi52) {
         tcg_out_opc_cu52i(s, rd, rd, hi52);
     }

     /*
      * Note that any subtraction must come last,
      * because cu32i and cu52i overwrite high bits,
      * and we have computed them as val - low.
      */
     if (low < 0) {
         tcg_out_opc_addi_d(s, rd, rd, low);
     }

Untested, and all bugs are mine, of course.

Try "qemu-system-ppc64 -D z -d in_asm,op_opt,out_asm".
You should see some masking constants like

  ---- 000000001daf2898
  and_i64 CA,r9,$0x7fffffffffffffff        dead: 2  pref=0xffff

   cu52i.d rd, zero, 0x800
   addi.d  rd, rd, -1

  ---- 000000001db0775c
  mov_i64 r26,$0x300000002                 sync: 0  dead: 0 1  pref=0xffff

   ori     rd, zero, 2
   cu32i   rd, 3


r~

