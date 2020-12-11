Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506BF2D7C36
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:07:46 +0100 (CET)
Received: from localhost ([::1]:50802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knltR-0001Bc-3d
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:07:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knlhL-0001fB-JM
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:55:20 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knlhI-00058w-03
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:55:14 -0500
Received: by mail-oi1-x244.google.com with SMTP id q25so10503687oij.10
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 08:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7j6nbs/vWcHKc6ZdR+T2bZK+TGf1c4qfKvxZgRIsPJ8=;
 b=QIWh89vIN4dU5ss/V2anHAfN+CDmcNeYtPJ4oePnVDIf7IeqgPnxdTAcgxt3LPr3lh
 r312vPE8RqF2S4gtHXO9Sh5oDeH3TJR60dP7MDDW+urAs5ztC+YcRBiuM6EuRCP0dQRb
 13S4WWzNxqVusrzmDc9K9QVL+Z/IR0NS14oiSmHRKc0hRStxkd+60IhM5ZfSi+l7kEMT
 zckg50p/NXRBeVrWrxapMdx1zmbkBBIQQ66DNGcyg1LpowpL2w2kPXxTerZm2cPuBkBT
 a0fS9WpaPR3g/kdfjL2XVfhsZtZyChqPkaDJXyn3Qs3FCnJpzm8j1t9bLX023ifHJLtL
 wPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7j6nbs/vWcHKc6ZdR+T2bZK+TGf1c4qfKvxZgRIsPJ8=;
 b=c5Myo0g4UV+IbEqIf2rJh4hBCNfb4EAv9N3UOxU/+vuNyxTZIV73KMZ3ZIw09Hrp/Y
 DAcvJw5j82eYVwDXu4VXqXVfD5BCCrMyCNt3crS3iXubQvkurHbFHGGwvou/F5GpJs1t
 Q9wbDyFyBAP153WhiMncKecMJ+izSI8lljUn7s/UvNc0Wj6K2eCbfx+MtJNxSQeqmna3
 Nr7nBIA9WKKhBF0voTBjL6ZX9xEZx7D0RLvIywwBUx19h3ZvdqReO0TC3oilDuWXD7Vd
 umFbW+Ur1soGv6z0NUPQ57UWitwHq/aHqPSsw6McZQ1AHtrlQm2gx0CefqyoczeeFh7f
 GG+g==
X-Gm-Message-State: AOAM531yGuyxDJVcS+DfVe9vuNa1XU4yuoXRZInGaoWjVWoweqqAGf9X
 dduFN9whF9zAh+/gy1WML9BdNQ==
X-Google-Smtp-Source: ABdhPJwITNYWreYE80bIxet/iGllrIRF6xIs8aic6gqRHpH/aGy6BBFCsWwL6LYjR0iPonBW2AUnhw==
X-Received: by 2002:aca:c0c6:: with SMTP id q189mr9925059oif.178.1607705710561; 
 Fri, 11 Dec 2020 08:55:10 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id w138sm1540019oie.44.2020.12.11.08.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 08:55:09 -0800 (PST)
Subject: Re: [PATCH v11 15/25] cpu: Introduce TCGCpuOperations struct
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-16-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <40394142-58e8-a1b3-0e6f-921518ea83b0@linaro.org>
Date: Fri, 11 Dec 2020 10:55:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-16-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:31 AM, Claudio Fontana wrote:
> --- a/cpu.c
> +++ b/cpu.c
> @@ -174,14 +174,18 @@ void cpu_exec_initfn(CPUState *cpu)
>  void cpu_exec_realizefn(CPUState *cpu, Error **errp)
>  {
>      CPUClass *cc = CPU_GET_CLASS(cpu);
> +#ifdef CONFIG_TCG
>      static bool tcg_target_initialized;
> +#endif /* CONFIG_TCG */
>  
>      cpu_list_add(cpu);
>  
> +#ifdef CONFIG_TCG
>      if (tcg_enabled() && !tcg_target_initialized) {
>          tcg_target_initialized = true;
> -        cc->tcg_initialize();
> +        cc->tcg_ops.initialize();
>      }
> +#endif /* CONFIG_TCG */

Not a big fan of the extra ifdefs.  Are we expecting that there won't be any
more of these, that other references to cc->tcg_ops will be completely within
accel/tcg/?

We can at least combine these two,

#ifdef CONFIG_TCG
    if (tcg_enabled()) {
        static bool tcg_target_initialized;
        if (!tcg_target_initialized) {
            tcg_target_initialized = true;
            cc->tcg_ops.initialize();
        }
    }
#endif


r~

