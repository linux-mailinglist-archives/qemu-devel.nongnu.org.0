Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A41239A62C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:47:01 +0200 (CEST)
Received: from localhost ([::1]:59394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqUm-0007T7-CH
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1loqEp-0006GM-QX
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:30:31 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:34735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1loqEf-00011X-Oi
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:30:31 -0400
Received: by mail-lf1-x135.google.com with SMTP id f30so9791778lfj.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=8sIwnHEa/R5nbOBjZCbk3U1kvdVkRfmbWFGeT3chHDo=;
 b=s7eqE6ESEHBTXvA7xyVhMJ9MMtpfKDGO69e9vpTWxPCY/FmYqTk1ggH45q0eP3+RdN
 ONFke0ypDr1gucuWL8/GO5vmov25fTLnr1j6m1tNhnhRa7GTd0uK+xmuOzipwWJxv/zz
 Fq16Y08Hoy1rpp3qJQpjkp/MBBdaXqwtW0EPmStTH4Zy39gKTeg1NKOMHJzSHrj5JjhD
 IKeZS0OXr3MmtBEbf9ghPwKKn1siIqgek1tcWC6zhTms7FP+jRutJ3rfVSXFFDt0tmcV
 oomqJyt7eB2rVgYe5qjqV/pl6QAKFhHqzv+PbAgJ8T+T2ASQrNt0uyxT+bGR/Jhiswji
 aWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8sIwnHEa/R5nbOBjZCbk3U1kvdVkRfmbWFGeT3chHDo=;
 b=qlGRFBh7UogAo2dpTh0TJ33nE3h+zdM2hCiUR3OIA4Owejbx8Knn6ZAufQOtyXZ5Hp
 lxSg4qYYdu6R7IPqODHo/PZ2aY830gdB1hIUnG1N8FiDbSMuwViX90VHcwnfa18acOfk
 40MnCLzkZpPWcHdgsmps4DQ8sXs0+1uKft88b9Hug6OwvvvZNqUILZIPd+A/3zBA+kuS
 IcR7C1FkU1L8KIuZqj3/5wq/RJvueZxXLspymuliMwyjdR2cj4YnEsu2OsJG7Bm0KKVN
 JVUUBJllIZDB0Y7sjF9pZXKNOgJ4ZefHD3PmVESjsMOc/3QrwntnQ+t2yAFGwX1P0nv0
 BdtQ==
X-Gm-Message-State: AOAM531NNnUWhwcjyp/TdlkEQmhvJO7lIbQbCox3/j+gLxoDJI1qKAvl
 JF42VpbM7bzTViPpDExPrb0=
X-Google-Smtp-Source: ABdhPJzhS9qsOcKNXYiWJDmQBLdItzcXfCVBBBA6Lb0gC0qiYD293C22Wvb9Ut5ugh2P/5DVc5hqyA==
X-Received: by 2002:ac2:5de6:: with SMTP id z6mr309555lfq.373.1622737819076;
 Thu, 03 Jun 2021 09:30:19 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id w4sm412213ljo.1.2021.06.03.09.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 09:30:18 -0700 (PDT)
Date: Thu, 3 Jun 2021 18:30:18 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/6] target/microblaze: Assert transaction failures have
 exception enabled
Message-ID: <20210603163018.GJ477672@toto>
References: <20210603090310.2749892-1-f4bug@amsat.org>
 <20210603090310.2749892-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210603090310.2749892-4-f4bug@amsat.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 03, 2021 at 11:03:07AM +0200, Philippe Mathieu-Daudé wrote:
> If exceptions are disabled, we must not get a transaction failure.
> Assert they are enabled passed that point.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/microblaze/op_helper.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
> index 8d20522ee88..1048e656e27 100644
> --- a/target/microblaze/op_helper.c
> +++ b/target/microblaze/op_helper.c
> @@ -122,9 +122,7 @@ void mb_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
>                    access_type == MMU_INST_FETCH ? "INST_FETCH" :
>                    (access_type == MMU_DATA_LOAD ? "DATA_LOAD" : "DATA_STORE"));
>  
> -    if (!(env->msr & MSR_EE)) {
> -        return;
> -    }
> +    assert(env->msr & MSR_EE);


This doesn't look correct. MSR_EE is a runtime flag...


>  
>      if (access_type == MMU_INST_FETCH) {
>          if (!cpu->cfg.iopb_bus_exception) {
> -- 
> 2.26.3
> 

