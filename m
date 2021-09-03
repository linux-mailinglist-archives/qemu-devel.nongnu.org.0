Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47274400611
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:48:02 +0200 (CEST)
Received: from localhost ([::1]:47842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFAP-0006pU-Al
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEuD-0004Yg-B0
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:31:17 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:47085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEu6-0002hJ-DF
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:31:14 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso214145wmi.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5AI83WewnZnYkPXwZnd2Q/eU9eygrBsbivngRE4BXiQ=;
 b=P4ISVXfvobqG12Z6RoTOI5UGIr/4McKEzBRjkpnJVeCZevklJ/WV/0lQBT+voH2SUY
 t0dVslctqlM5DOtyjeqjkUvPjGWjj1dhiEdyZQeWioK8rQRoWy5A5NcKlSGuzKW3aWqj
 t2bT7b9xG9bD7XISjXwWDKsCHqd+100iir2zh/3XRm8EAkGO06KgFLng+vuhbRGyvSoR
 AObhwaMSw7osyojtzotiYTY7cxvr3JYasdODvCk6KW0vBIVPJ0cpLiVEP0EFP/cmNIcL
 vTd4VlnM3ebyqP3INvEw9GWo/Z410XL/Oo2itgtLLE/TkG/P7c4oBYv9h2IqwiQYnS7X
 J5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5AI83WewnZnYkPXwZnd2Q/eU9eygrBsbivngRE4BXiQ=;
 b=oXPueMIxVvfMhlOjPbpTZalEExsFAG30ob4jRLNENte4ecBwJWfuyRIEAP67HNTBp2
 sce4Me2yKIg19b1oQUbtjvGXQNsE7A5yNucHXjgwdidEHJa04PeA7EMH2djplE66nPPM
 F8KPRt/NbikObN+iRNDPRTKIcZtmvtfOAOgjlkoc0bGCpHhITreF09YbHQuRbgaQ513W
 ZkcRfIae+8dgdIEDtPNQ/EMX2GHWehfj2RhUU80Qg3mrup0NyM1LAOO/pHEUP+h5PJn7
 u6mpYGq1agBd6IgxvQ5jU1xLIo1GkqmiIdx8jjftDMFHx7kqBB4pS8DEuXykQi0sGuNz
 QvNQ==
X-Gm-Message-State: AOAM53193KNI7d9eNopZB/YeVF6P9WMZ2sgtRYGWs1aZTxgMpA5jwOlf
 WuUYb1De0Adt8p/fCy2jlkcKRQ==
X-Google-Smtp-Source: ABdhPJyNPnhhhAtbo2njo6bCAr3WAaEKFNGmuE7LF325krCnfwymK4ah4w6eYAokj7v99c7wD74wnA==
X-Received: by 2002:a1c:1c2:: with SMTP id 185mr289419wmb.11.1630697468395;
 Fri, 03 Sep 2021 12:31:08 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id f17sm286460wmf.4.2021.09.03.12.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:31:08 -0700 (PDT)
Subject: Re: [PATCH v3 01/30] accel/tcg: Restrict cpu_handle_halt() to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cdbffa64-98a4-859d-d8f1-50d959197542@linaro.org>
Date: Fri, 3 Sep 2021 21:31:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> +#ifndef CONFIG_USER_ONLY
>   static inline bool cpu_handle_halt(CPUState *cpu)
>   {

Hmm, slightly better to move the ifdef just inside here,

> @@ -607,6 +608,7 @@ static inline bool cpu_handle_halt(CPUState *cpu)
>   

and here,

>       return false;
>   }
> +#endif /* !CONFIG_USER_ONLY */
>   
>   static inline void cpu_handle_debug_exception(CPUState *cpu)
>   {
> @@ -865,9 +867,11 @@ int cpu_exec(CPUState *cpu)
>       /* replay_interrupt may need current_cpu */
>       current_cpu = cpu;
>   
> +#ifndef CONFIG_USER_ONLY
>       if (cpu_handle_halt(cpu)) {
>           return EXCP_HALTED;
>       }
> +#endif

which would eliminate this one.


r~

