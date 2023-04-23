Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D679B6EC215
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 21:42:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqfah-0006DO-JT; Sun, 23 Apr 2023 15:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqfaf-0006DG-Dj
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 15:41:41 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqfad-0002LT-Ah
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 15:41:40 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so22749805e9.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 12:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682278897; x=1684870897;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/veav/GtEaROmlvGGesa/Lm/SKXlvaB+8Gk+ODfZT6I=;
 b=TdpmrO1U5ZN4VFNyJfrkw0kDcLN0FnFNt6iRhCD5YVtzCnl6A/OUbn1QcjCnHfaw0K
 jlppCpOL7xwHXwSJUFfshpuTCpPfZkregVZ1GbPROigTTNp/1xX+uvNuS9EyRZr0xLVd
 2g8rowwJM0k+NfC7XHSF+WfSgntsmg7kZ8x6w9HZvDGVvVjr1CXINYO6+WfH5FcAUkJk
 Ui5+iBqP+hWIGmvnWgRjTI1wXZp0Nd68pQLCbIHCqqGXdsDGZEhCPj0joz3Pcisim6Ag
 yCpaeuyrhLNe8+lUltaswgZ3JTy7NJz6m17X7f8e/3ak8D3B3Oj9tLpQpkIbYcjydvzS
 CgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682278897; x=1684870897;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/veav/GtEaROmlvGGesa/Lm/SKXlvaB+8Gk+ODfZT6I=;
 b=aYny0uUAU1GdHtl4rQvnizeuiStwU6FzyNZFn7bru8sXcMCPH9ZihQTsXC2VXr3xol
 /cdNpBmjcvwNdQ5A/HYFGbhqXR2Ww65HldL8a/xehP49g27z99KMa6MOqSBXGyceatx1
 F6UrhoLk9amplt6uG5s61a+ZslYgiU2zb8fAGSooKWU0OwFCygUNJy9A2QIe35/fmIvP
 Qq4lxqC0D1rC3xI5SOkNf65NoWDR95telWMqqm6EOiLkFpRRi32Q1P6nWJRcS8WTXbSA
 t8ietdAqoeUwbIxpBdWv9I2OYEWqJ5CuHsYgxAuAayVpsQdIl6Er6i9tJkmJdyx+TVN+
 chtg==
X-Gm-Message-State: AAQBX9d14nR+bbLlCoGYIxGz/mQbDDgFh4QWs5rwVX3be0yF5WMARHGQ
 qOm10ZtOfOGSAmG4mR10iV3F5lS/sYC72ngi9DeMsQ==
X-Google-Smtp-Source: AKy350bV8IzOV+x8xAhWitvsxN8Zdkxnz3p0z258sf6zHydzwPcBlfg/TYQAd0a8odTSJTJqpaH/6g==
X-Received: by 2002:a7b:cbd9:0:b0:3f1:94fe:65e2 with SMTP id
 n25-20020a7bcbd9000000b003f194fe65e2mr5343434wmi.33.1682278897320; 
 Sun, 23 Apr 2023 12:41:37 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 m18-20020a7bcb92000000b003f24f245f57sm1561918wmi.42.2023.04.23.12.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 12:41:37 -0700 (PDT)
Message-ID: <a2d5ca6c-8480-4c0b-7404-611d8f238ca9@linaro.org>
Date: Sun, 23 Apr 2023 20:41:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v3 01/44] target/loongarch: Add LSX data type VReg
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-2-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420080709.3352575-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/20/23 09:06, Song Gao wrote:
> diff --git a/target/loongarch/machine.c b/target/loongarch/machine.c
> index b1e523ea72..a67b735a32 100644
> --- a/target/loongarch/machine.c
> +++ b/target/loongarch/machine.c
> @@ -10,6 +10,112 @@
>   #include "migration/cpu.h"
>   #include "internals.h"
>   
> +/* FPU state */
> +static int get_fpr(QEMUFile *f, void *pv, size_t size,
> +                   const VMStateField *field)
> +{
> +    fpr_t *v = pv;
> +
> +    qemu_get_sbe64s(f, &v->vreg.D(0));
> +    return 0;
> +}
> +
> +static int put_fpr(QEMUFile *f, void *pv, size_t size,
> +                   const VMStateField *field, JSONWriter *vmdesc)
> +{
> +    fpr_t *v = pv;
> +
> +    qemu_put_sbe64s(f, &v->vreg.D(0));
> +    return 0;
> +}
> +
> +static const VMStateInfo vmstate_info_fpr = {
> +    .name = "fpr",
> +    .get  = get_fpr,
> +    .put  = put_fpr,
> +};

These functions are old style.
Compare target/i386/machine.c, vmstate_xmm_reg.

I notice you're migrating the same data twice, between fpu and lsx.
Compare target/i386/machine.c, vmstate_ymmh_reg, for migrating only the upper half with 
lsx.  I assume lsx without fpu is not a valid cpu configuration?

>   const VMStateDescription vmstate_loongarch_cpu = {
>       .name = "cpu",
>       .version_id = 0,
>       .minimum_version_id = 0,
>       .fields = (VMStateField[]) {
> -
>           VMSTATE_UINTTL_ARRAY(env.gpr, LoongArchCPU, 32),
>           VMSTATE_UINTTL(env.pc, LoongArchCPU),
> -        VMSTATE_UINT64_ARRAY(env.fpr, LoongArchCPU, 32),
> -        VMSTATE_UINT32(env.fcsr0, LoongArchCPU),
> -        VMSTATE_BOOL_ARRAY(env.cf, LoongArchCPU, 8),
>   
>           /* Remaining CSRs */
>           VMSTATE_UINT64(env.CSR_CRMD, LoongArchCPU),
> @@ -99,4 +200,8 @@ const VMStateDescription vmstate_loongarch_cpu = {
>   
>           VMSTATE_END_OF_LIST()
>       },
> +    .subsections = (const VMStateDescription*[]) {
> +        &vmstate_fpu,
> +        &vmstate_lsx,
> +    }

Need to increment version_id and minimum_version_id.


r~


