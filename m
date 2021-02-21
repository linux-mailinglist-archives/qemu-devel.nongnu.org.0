Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B091532098D
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 10:55:14 +0100 (CET)
Received: from localhost ([::1]:36552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDlSL-00089b-Q2
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 04:55:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDlR9-0007hu-4k
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 04:53:59 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDlR7-0008By-J8
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 04:53:58 -0500
Received: by mail-wm1-x333.google.com with SMTP id n10so11678491wmq.0
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 01:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DkgzDClQESOvVgfZAIsa50g+k6kDPib0kchRuXUJZaI=;
 b=rldz6AOMLQSayB+uKtZxvFXvRuA/bXcM/xVWaAO4YDZkHWKn7XxKL6MUlt/FomF0UP
 MraR89TpugX13bNlXoTs0mkMVMadDUR3MYmqQkGvI4vgRbS6UUdoGoCt5W7+lvjEAKXD
 bK/tLeQ4D9AhSinjCygvFWoTMGiKiC+BubkRylQg1FYSLab6ITLg+2Msc3XP0BgDkXol
 43FrET+oDH0hllgrNtzsPzzM5D7Cblx9bFfjN9P4IQIP+BJlDMUgd77IxgZxb4OjNMm1
 a532aaCqIXneSVok8VVXV4lEWqvNAwycyuEu5jshPSOzCgQE2GTRvzb6hy0WhG9gAPPm
 mWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DkgzDClQESOvVgfZAIsa50g+k6kDPib0kchRuXUJZaI=;
 b=MNplo3I/crsdUszVF3hg8w5SP7yLjk3YOs4+NCVsFwfaeEbwRsc5xKZodO7CO9ABtN
 KybMJzoQZgmQudgXQH/W1qyPBHzvEgygvLDEpbTzI3vdgwOV2Bvt+0daObKVBjx3RBnX
 lKvzMjrdYaRZrG+B2TlAPERHcEJ9YnksgSU9QjwEfBFZkWFDHsLfc4JAJw8O3ejDaeds
 fCd6juzpjYb2zD4X8I7UmV3/Lv75S55qc2MvZf/4//T1d1x0AS02Q/BMU0ENpI6gExLD
 Fpex+FnQ9cyaUbnrUm5rFUJl8nrRfvilSnIbVz8cCUp4Ywu4I1JIpQnEZTrZgesCsUwJ
 Ud2g==
X-Gm-Message-State: AOAM531WBkIPnfvbd7y8V+KyqWJVp2yqTcXqVmoscKPInyaH9FcQGnun
 ZN7ItGDfODv9weYVYs5u557f/aOwE7M=
X-Google-Smtp-Source: ABdhPJwVQtz6jghMYZ2vSd0H9EXjmFts8lSti0RdRdkDrWf8YgdAodpN7A9Qp/YXgxKvhr75+jBU+A==
X-Received: by 2002:a1c:9d82:: with SMTP id g124mr9119661wme.115.1613901235223; 
 Sun, 21 Feb 2021 01:53:55 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t2sm7390141wrx.23.2021.02.21.01.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 01:53:54 -0800 (PST)
Subject: Re: [RFC v1 32/38] target/arm: cpu: do not initialize TCG PMU for KVM
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-33-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ea91e888-10db-8abe-7a62-bc4532ba99eb@amsat.org>
Date: Sun, 21 Feb 2021 10:53:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210221092449.7545-33-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@centriq4.arch.suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 10:24 AM, Claudio Fontana wrote:
> From: Claudio Fontana <cfontana@centriq4.arch.suse.de>
> 
> KVM uses its own PMU initialization.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index a8321fecf8..d334987cad 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1648,6 +1648,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          unset_feature(env, ARM_FEATURE_PMU);
>      }
>      if (arm_feature(env, ARM_FEATURE_PMU)) {
> +#ifdef CONFIG_TCG

Shouldn't this be #if !defined(CONFIG_KVM) ?

>          pmu_init(cpu);
>  
>          if (!kvm_enabled()) {

And remove this ^

> @@ -1659,6 +1660,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, arm_pmu_timer_cb,
>                  cpu);
>  #endif
> +#endif /* CONFIG_TCG */
>      } else {
>          cpu->isar.id_aa64dfr0 =
>              FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMUVER, 0);
> 


