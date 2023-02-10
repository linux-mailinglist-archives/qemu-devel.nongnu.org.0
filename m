Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0975691FC5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:32:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTVD-0002KE-49; Fri, 10 Feb 2023 08:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTVB-0002Jz-9Z
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:31:45 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTV8-0006UF-Jz
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:31:45 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 r34-20020a05683044a200b0068d4a8a8d2dso1511109otv.12
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NiJ5PCwDTQoChsxOyh6ryxHsj0w230XsvFO7l1LuRvA=;
 b=H5QxgVv3WHoQ8uc7OAmkq4lTHagMHH1DjGdqlOYw+iZ3ISwbQwY/k2A61zhn1E8YEw
 Gbi05+ZSbLpDhPZfHY9AUNb5pQ8JZpr7IjB1HvRDlBiKTHA3RbzkWgxChEwHIYToYd6L
 iRS3qM3YZSLnEK5/kfN9TLBSkK1rYUXNqPYpcL57Ld1ZSvfT/P2TmOdVfdnlnBKskyUd
 3v4j79Tt3gEz/nPPFKYzUV3hIGXcBrPQLrZDlcGfwhomxlY7ZvERlenki0csD0beZaPi
 he2isAcleiwAL3nIhahKAqWpAZKiiM1L+BCDuclscj9oQO6zNJCK/xjPUPB5PYOZYyO9
 qQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NiJ5PCwDTQoChsxOyh6ryxHsj0w230XsvFO7l1LuRvA=;
 b=DlthgyTVvD1cTXQel8buuZPPgcTIH5FDjgBysBuU0lMJ6WBIggzDm/kBv3iANCkSLa
 bS8ag3VwgFTRg5akLu9r/Uk1ImAtQO/oyxxguy+PfXUqn6rmvdZreX3U44RGALmPgY3J
 awsqsrTeiaRX7Je7IDXIKCYyo1QXM1uWJuMrFAp8lXkTOc7y3FAjzjmBfpiOFe3jtCWD
 pjVxUo9y/zG8YYKLWS+yfHe5FtDlPTiKIbDmlIgIFH4UvAYt3z/kUsiMB0HyYSiPGRGb
 xX/o3ChGMYs0CCmg9B8348rWsOb5QHXn+xcwsj8ZlGFYzcry353XpThbEgkjKHG7BnqB
 llDg==
X-Gm-Message-State: AO0yUKUTDGZuPW/+f6GXSiCRa8EAImk/0lgySSBMeRMw5PDSrJGvOUcJ
 LQnhnkfpOKJcqoYtKsXYSRuLFw==
X-Google-Smtp-Source: AK7set9DOI+POHMPoyV+GRt5vHa2SZsj08DT6RQQ0ucS4bz92FF8Kp7VwL0foeFXGhPuUvxE+9Dbhw==
X-Received: by 2002:a9d:775a:0:b0:684:eca3:fa4a with SMTP id
 t26-20020a9d775a000000b00684eca3fa4amr7504855otl.31.1676035901118; 
 Fri, 10 Feb 2023 05:31:41 -0800 (PST)
Received: from [192.168.68.107] ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a9d6486000000b0068bcef4f543sm1993050otl.21.2023.02.10.05.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 05:31:40 -0800 (PST)
Message-ID: <08fe08cc-9e9a-8d5d-9c66-3068f347a9b5@ventanamicro.com>
Date: Fri, 10 Feb 2023 10:31:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] target/i386: Remove pointless env_archcpu() in
 helper_rdmsr()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20230210125700.13474-1-philmd@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230210125700.13474-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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



On 2/10/23 09:57, Philippe Mathieu-Daudé wrote:
> We have a X86CPU *cpu pointer available at the start of the function.
> 
> Inspired-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/i386/tcg/sysemu/misc_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
> index e1528b7f80..e47db9376e 100644
> --- a/target/i386/tcg/sysemu/misc_helper.c
> +++ b/target/i386/tcg/sysemu/misc_helper.c
> @@ -326,7 +326,7 @@ void helper_rdmsr(CPUX86State *env)
>           val = env->sysenter_eip;
>           break;
>       case MSR_IA32_APICBASE:
> -        val = cpu_get_apic_base(env_archcpu(env)->apic_state);
> +        val = cpu_get_apic_base(x86_cpu->apic_state);
>           break;
>       case MSR_EFER:
>           val = env->efer;

