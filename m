Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FD0434E37
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:47:04 +0200 (CEST)
Received: from localhost ([::1]:37778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCrw-0002S9-0v
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdCpb-0000rz-Ss
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:44:39 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdCpZ-0005S3-9i
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:44:39 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so676228pjl.2
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 07:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vjlZA7uAXEtmANBdgMsH9fFzOKvO7u8iPP4kXJ12K8A=;
 b=Tso9QMEiEwGij2vZzwYChHamBgITabvBBGxjjJvAAiEpY3PiNSzQ8qeou79z76V1i4
 +tCBkGpIle1mDeL6hPDZ2RtOFoxQ7vQm0QmeFhRU3XQW41BhB5GVaOx4cmbWZmWG4bCN
 1qU2h8J/8hVJ9YjDav0TKoMFLWDXUqYGU9pon0ddMzy8jpxtHekG8rFvU7NsFgL9FLuc
 XXllUL7ty4UU2H9bz9QzC0NOvMovp0vNAwzfI/dRiD6X0g+TktvXPmK5rqHcjRfQOocg
 3MSpzfMDwRVyXdDS9dD5COsIjKHyhsjprVTyljJ4976MJVMwib8uMlTK+bSX1FAe7TM0
 xVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vjlZA7uAXEtmANBdgMsH9fFzOKvO7u8iPP4kXJ12K8A=;
 b=m6Cp7tPqD4aAKcxLlCttAt+iEy4o7d0EG8IRPiiwifKd6LYwOxijzt/7SsQbW1Gwy2
 y3dcz56ElNzyop5RkXNWTEHafmMi+Gh8mYydOIAcvzPkGep5BzM+/WecWuTV75ymrtri
 dSgGOQJSMNwzwhnTZTC+mmtrpV+NyvYuz3UEMH60ycaQBUWETMgIPXy0MdgznOW4v+Sp
 W8nJT7RAnYujxyW9WR5G4kXWOeNLqj9PWBX5zgllJjM9UsVEkwc1RfzFi6kToYj9pYFt
 ssvJzA6au6jTgmUIuLysDZqXBRZjxyaQUJlhHZIn1ypxtg/LO0DSY7buQYIDdY6TtIjQ
 it8g==
X-Gm-Message-State: AOAM530Ho6laKGpifch5YmDngyQTYlwVTLOHHoq46P5Ceq8c0V2Nz0hL
 XZ8z/Pe8bgF0r1vug6UY0S3K+g==
X-Google-Smtp-Source: ABdhPJyu1yF50u7KQ65S66EbKPUWgjt3n+LxiZIFkBGali7wT8czLSgWKQXfO/1R0CREBWguw8XGEQ==
X-Received: by 2002:a17:90a:8a8c:: with SMTP id
 x12mr411292pjn.44.1634741075265; 
 Wed, 20 Oct 2021 07:44:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t32sm3224316pfg.29.2021.10.20.07.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 07:44:34 -0700 (PDT)
Subject: Re: [PATCH v3 06/21] target/riscv: array for the 64 upper bits of
 128-bit registers
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-7-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <820e8060-694d-9566-9d7a-da7ef9e06d21@linaro.org>
Date: Wed, 20 Oct 2021 07:44:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-7-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 2:47 AM, Frédéric Pétrot wrote:
> The upper 64-bit of the 128-bit registers have now a place inside
> the cpu state structure, and are created as globals for future use.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/cpu.h       | 1 +
>   target/riscv/translate.c | 5 ++++-
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c24bc9a039..c8b98f1b70 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -109,6 +109,7 @@ FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
>   
>   struct CPURISCVState {
>       target_ulong gpr[32];
> +    target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */

At first I was going to suggest that the 128-bit value be represented in host byte order, 
but then I thought that would just get in the way until such any such host operations are 
apparent.

You are missing an update to machine.c for migration (and probably more importantly, 
loadvm/savevm for debugging).  I think you'll want to put these into a separate 
subsection, controlled by misa_mxl_max == RV128.

>       for (i = 1; i < 32; i++) {
>           cpu_gpr[i] = tcg_global_mem_new(cpu_env,
>               offsetof(CPURISCVState, gpr[i]), riscv_int_regnames[i]);
> +        cpu_gprh[i] = tcg_global_mem_new(cpu_env,
> +            offsetof(CPURISCVState, gprh[i]), riscv_int_regnames[i]);

This will just be confusing in the tcg dumps -- let's not name the two temps the identically.

Honestly, I'm not 100% thrilled about the / that appears in the current name; I think it 
would be easiest to do

   g_string_printf("x%d", i)
and
   g_string_printf("x%dh", i)


r~

