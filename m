Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A07652264
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:23:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dPx-0006lH-5d; Tue, 20 Dec 2022 09:16:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dPv-0006l1-As
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:16:27 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dPp-0005a8-H5
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:16:24 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 i187-20020a1c3bc4000000b003d1e906ca23so8319737wma.3
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Hkuy0ZQRhwG7WX5rLQj1lQAdU3ZsflkOywrVyJKTdc=;
 b=hPR0D1q0cYfm+FOfx9pqLBYHNUkH1zN8BkQHFHFTcNoXxoJBEXywwWlo+vwlp7QfTC
 aitPTLg9OsBblGef6TeZ3zr7LwHEIkkW2XPI9kjer3/2991vbmojgA+ROn1JS46TiGJG
 1ApYNZ7MnoH3S7KVy4JUGkXMuT1LvjjqswwS1UEmRZGieTw8K/iosKHYkEAbqnP0g9L6
 jNFiIUf+wqTurCIh2N+jsuMQIEPBpYi6DsSge4PTLOvkxXYc/tyria7Xp21x6/hVPdZd
 tGfr5Rn5R5p4q4FzY9gMyN9QpoHM6x+o8G9QvHkKoeWGAjszzLlNZdQ5gPRsrE8nF9eX
 ICDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Hkuy0ZQRhwG7WX5rLQj1lQAdU3ZsflkOywrVyJKTdc=;
 b=G794RxLuJXObRtQGnp/ecjyFeUhlk3VouVAUHfdW++UJPTOz3dpy89laD02IonbUbw
 ZrikMDiJ9+Ue1cAqtwjYE118yyrsDYc0QWInd/J7adqYdF3cnkbv0QYgKEAxd8sVl1ZS
 T08D2dRvOSVNFYuXD4sGTJs2tXLKJ8LI+catc4gU48GNhLFI3lHrU4Syes6usMgCT5An
 HXxUdrG419iIg4rLJhhXwiXrkDTa7XmlpzvEeVBfDbI/M6GiWo0EqYYsDKB8SU6Eg3sy
 TrGoGn4uqvCePy/x1/TDw4ZF+Z8iXwGKqzcnYyO0EXaSw8jRo4/+rddA+CDj9FTT4oHd
 hjvQ==
X-Gm-Message-State: ANoB5pl1qjwH5gERGZK8j+fuJaUkLo2urf7O38rgw5d8+qaYgYHuFYMx
 jrSqhTYfH4A0LTaO703vO+7bxg==
X-Google-Smtp-Source: AA0mqf6kMWWjsCNjq5MnPxTCwtKwk5CuvVTYW5qMH8XICFO2IiFWAdQ9lJGUsR4HbVvEBX95M6+lEQ==
X-Received: by 2002:a05:600c:43c9:b0:3d1:f0b4:8827 with SMTP id
 f9-20020a05600c43c900b003d1f0b48827mr37510153wmn.25.1671545779825; 
 Tue, 20 Dec 2022 06:16:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y21-20020a1c4b15000000b003d1b4d957aasm15997982wma.36.2022.12.20.06.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 06:16:19 -0800 (PST)
Message-ID: <cc14240c-6fc7-7412-8023-a2d4a047efbc@linaro.org>
Date: Tue, 20 Dec 2022 15:16:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: Should -overcommit cpu-pm=on|off be converted to some machine
 sugar property?
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <3ce8e739-4894-b79e-1972-f972fd763e5b@linaro.org>
 <CABgObfaWX=x-RinK0F+XbYi1oVHF53kiahb7FLQjBuoR4eQ_UQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CABgObfaWX=x-RinK0F+XbYi1oVHF53kiahb7FLQjBuoR4eQ_UQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 20/12/22 09:16, Paolo Bonzini wrote:
> It's implemented only for x86, but it is not architecture-dependent. For 
> example on ARM you would implement it by mapping guest WFx to the host 
> instructions.

OK, thanks for clarifying!

>     Hi Paolo,
> 
>     I just noticed 'enable_cpu_pm' which seems architecture specific
>     option that ended into common code:
> 
>     $ git grep -E 'cpu[_-]pm'
>     accel/tcg/user-exec-stub.c:5:bool enable_cpu_pm = false;
>     include/sysemu/sysemu.h:49:extern bool enable_cpu_pm;
>     Binary file pc-bios/skiboot.lid matches
>     qemu-options.hx:4196:    "-overcommit
>     [mem-lock=on|off][cpu-pm=on|off]\n"
>     qemu-options.hx:4199:    "                cpu-pm=on|off controls cpu
>     power management (default: off)\n",
>     qemu-options.hx:4204:``-overcommit cpu-pm=on|off``
>     qemu-options.hx:4214:    guest) can be enabled via ``cpu-pm=on``
>     (disabled by default). This
>     softmmu/globals.c:38:bool enable_cpu_pm;
>     softmmu/vl.c:350:            .name = "cpu-pm",
>     softmmu/vl.c:3440:                enable_cpu_pm =
>     qemu_opt_get_bool(opts, "cpu-pm", false);
>     target/i386/host-cpu.c:44:static void host_cpu_enable_cpu_pm(X86CPU
>     *cpu)
>     target/i386/host-cpu.c:88:    if (cpu->max_features && enable_cpu_pm) {
>     target/i386/host-cpu.c:89:        host_cpu_enable_cpu_pm(cpu);
>     target/i386/kvm/kvm-cpu.c:43:        if (enable_cpu_pm &&
>     kvm_has_waitpkg()) {
>     target/i386/kvm/kvm.c:390:        if (enable_cpu_pm) {
>     target/i386/kvm/kvm.c:2576:    if (enable_cpu_pm) {
> 
>     Do we want to maintain this as a generic property or
>     can it be deprecated / converted to a machine-specific one?
> 
>     Thanks,
> 
>     Phil.
> 


