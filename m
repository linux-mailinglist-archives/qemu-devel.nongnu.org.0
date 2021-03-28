Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A369534BD71
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 19:12:58 +0200 (CEST)
Received: from localhost ([::1]:34604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQYy9-00087N-AD
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 13:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYwy-0007eX-Pe
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:11:44 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:36453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYwx-0002kj-3i
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:11:44 -0400
Received: by mail-oi1-x22a.google.com with SMTP id c16so10976662oib.3
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 10:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S10USTEU1jET0H8lb0JezNzjVHWvbnrVQM/TTkNmtv8=;
 b=VjpXrDYfWm2q0fpLHu8GQbZP5ItyNvTi1C+UFrqFp1sYU6+wb5j1tnW7Q6NFv8kz5D
 gCHQlJeyoTFTtxUatOcGU4MriEUTo+L49aa3/eSTVfJmAloQqS84v1XFgwzYn1Cvc8de
 snc+WOKdC+1pfPTX2QRSx3MF/d3mL31CV8LyyXgExGPirVqIVzC0e8i2FCZzNteAbaCd
 XaY3h2es5oPdDMgjL4VKDkzZqe4CeVzrxEPay8zEP53Gk+9sQdffPnXO+PSakElLqlB3
 PlCMrn2eUln5Gg1yx5uTvSuukiY02ZuhdxtpgZcoksXqMmWrvQORyXwCtQBpUexb3apj
 8eOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S10USTEU1jET0H8lb0JezNzjVHWvbnrVQM/TTkNmtv8=;
 b=Gyq8peTntB+K0kUxUN+7WPt5zIqf3txXWYMHL4jrVl3YU0VIXlGzu0olHsXDwHx8k4
 UJNflPJYw7PQEUgsL3wpwZrgK+t1MVBcdpZFpPazjQOzNpIaVPzPXolJ/oowOwCpkF65
 YgTz6JceZOgjnAlgvDMgwO0BdhQGLIpn07fG8Z7+AfEshNgPHRrHtWrfLk7br1pQXAqw
 P9AsCi3zMQsNjwjDMGALaeapzM8SjMDmztSeKD0+eqx5h/cIqfX+AgP+CwKytufHEJFH
 7XCnysXm6U+bsLI3kRAIxMnBnl9YuHWqPRJnMZfr3y8xjMU21S2coI9vKKAIGY2T0rO8
 nVww==
X-Gm-Message-State: AOAM530Fv9f5ejKOBhXILSJjx8ssJlWtkM4C2oRwJygmj60sbtuq84iJ
 2yikgbhkRaIH3jfbrSknElFIFQ==
X-Google-Smtp-Source: ABdhPJz82b8r3M+NVsywOJOzDtZ5IpZeeJhK7p0JydtoNEE8fa7O9ThIZ+2OvjRLPXdNX7Tg4K5nfA==
X-Received: by 2002:aca:f48f:: with SMTP id
 s137mr16179949oih.101.1616951501671; 
 Sun, 28 Mar 2021 10:11:41 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id x3sm3110363oif.22.2021.03.28.10.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 10:11:41 -0700 (PDT)
Subject: Re: [RFC v12 38/65] target/arm: remove broad "else" statements when
 checking accels
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-39-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <00984c12-4861-7234-d62c-3a8a84ad5e31@linaro.org>
Date: Sun, 28 Mar 2021 11:11:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-39-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Julien Grall <jgrall@amazon.com>,
 qemu-devel@nongnu.org, Olaf Hering <OHering@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> @@ -638,24 +638,21 @@ static int cpu_pre_save(void *opaque)
>   
>       if (tcg_enabled()) {
>           pmu_op_start(&cpu->env);
> +        if (!write_cpustate_to_list(cpu, false)) {
> +            /* This should never fail. */
> +            abort();
> +        }
>       }
> -
>       if (kvm_enabled()) {
>           if (!write_kvmstate_to_list(cpu)) {
>               /* This should never fail */
>               abort();
>           }
> -
>           /*
>            * kvm_arm_cpu_pre_save() must be called after
>            * write_kvmstate_to_list()
>            */
>           kvm_arm_cpu_pre_save(cpu);
> -    } else {
> -        if (!write_cpustate_to_list(cpu, false)) {
> -            /* This should never fail. */
> -            abort();
> -        }
>       }

Hmm.  Not perfect.  I can't decide on

   if (tcg) {
      ...
   } else if (kvm) {
      ...
   }

or

   if (tcg) {
     pmu
   }
   if (kvm || tcg) {
     write_cpustate_to_list
   }
   if (kvm) {
     rest of kvm stuff
   }


r~

