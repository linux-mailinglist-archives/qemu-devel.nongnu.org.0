Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB54434BD4D
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 18:43:41 +0200 (CEST)
Received: from localhost ([::1]:43448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQYVo-0006Hw-AH
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 12:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYT7-0004vV-EH
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:40:55 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d]:39775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYT3-0005MP-QY
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:40:52 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 r17-20020a4acb110000b02901b657f28cdcso2464907ooq.6
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 09:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B4bFnk8G06jqiNC5NdshcRb3jT0yWe8TdrUsYes775o=;
 b=s8LDGSziQUJE+zL2IM54p1opgAt+llujDR3nGtFSiXLSHPbKdcLREilER7c5uD/HU5
 aTJ+ctuZvlvxYylWgCKhcN8bIa5mLuw+aROii39IRWF+TojKr3HnOvz8KYPajcyddEhq
 lbCJs3re09Yusyd8JvO5cd2Z3Q1EFZuOw6vK682f7nKCCFmq0M0WsRHV7BFE4qPfOgvJ
 uxZP/rJkGlZ9u+F0/ceBnWujuic5gBpauUsAFyggvT8c1JHRsTvoRYGeLquknumV7/5J
 v1vNdXmVJHZAZssYVC6YDalqFAN4vHwUfs4Vq14O73DFSSqrRWf6MrSdKdhS9vJvdqoI
 jM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B4bFnk8G06jqiNC5NdshcRb3jT0yWe8TdrUsYes775o=;
 b=Ko9yoYSmGnosrctiX+651S316KgY7A3vQfq9ki46ALKpYNqTuVCiD7tmvGHXbZOmuE
 2fDJRWd0a/kxN/Js1YpqU7rEDsNld2WUJSdBZPjfJ8gTInnDosGLewkN7UYF08f9fM0S
 w1basM8T3+up3BXUWCgsztsd5QJy4j1lRP2RmDkZ4BMAc5uzRW/TEKp5/7hFE1/Tl1eI
 +9RhRy7fDi6wAuyca7GS4IdHgs+IFXKaOhFCg0A8lNLdwomyB0oT3hqLWXtrohXBooiI
 0ldnfkRr42DV2c5Mh2szzMJZZ8EcV+qlMrePla1lp0YNgZKyUWmo33wV3CgioAoEZ5fY
 /vHQ==
X-Gm-Message-State: AOAM530rcq4HoKXxmhzgJKCUDmkd6rdU4Bjp+zoorr0JEJxQKrBZJNKa
 RC/inWDKi5Rje49z1mE0jZV7RA==
X-Google-Smtp-Source: ABdhPJzHjUTlIBPhgTCFtS8t1qoXCasAg5jn/QuWAEosDc9QCXW76xAhK4RjDWBMKVVqKoxiOJgPDA==
X-Received: by 2002:a4a:c316:: with SMTP id c22mr18844746ooq.65.1616949648499; 
 Sun, 28 Mar 2021 09:40:48 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id k11sm3890728otp.28.2021.03.28.09.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 09:40:48 -0700 (PDT)
Subject: Re: [RFC v12 31/65] target/arm: move exception code out of
 tcg/helper.c
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-32-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fe889df8-c11a-8e29-0ef5-84a89b449b36@linaro.org>
Date: Sun, 28 Mar 2021 10:40:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-32-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> +#ifdef CONFIG_TCG
> +    arm_rebuild_hflags(env);
> +#endif /* CONFIG_TCG */

No functional changes during code movement.
Really.
I cannot emphasize this enough.

Also, why is this an ifdef and not tcg_enabled()?

> +    aarch64_restore_sp(env, new_el);
> +#ifdef CONFIG_TCG
> +    arm_rebuild_hflags(env);
> +#endif /* CONFIG_TCG */

Likewise.

> +#ifdef CONFIG_TCG
> +    if (tcg_enabled()) {

Likewise.  And, why in the world do you need both?


r~

