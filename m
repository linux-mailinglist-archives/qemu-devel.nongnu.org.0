Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328A1245135
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Aug 2020 17:18:21 +0200 (CEST)
Received: from localhost ([::1]:58976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6xwq-00032K-6n
	for lists+qemu-devel@lfdr.de; Sat, 15 Aug 2020 11:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6xph-0001AU-UJ
 for qemu-devel@nongnu.org; Sat, 15 Aug 2020 11:10:57 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:36065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6xpg-0000Ic-4p
 for qemu-devel@nongnu.org; Sat, 15 Aug 2020 11:10:57 -0400
Received: by mail-oi1-x243.google.com with SMTP id l204so10830715oib.3
 for <qemu-devel@nongnu.org>; Sat, 15 Aug 2020 08:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4Rvz56oO5wS/gMgAnvaeiayH0Bj18HTZcfeBlsrcvaU=;
 b=sx0twEdKFmR1s1b/dP1mQSBuUNbQdOfQHeh7IlxU0ysmGTucYigzneu4qe2kIOY+WS
 cz4zWnBzeuHgOuGEA7mrZHfxkjFyLknxaJNYB34UUb4GCU64hoCC8GmU10Drs+FPQJNM
 7Vd60kPL8jshCIBki9EFqG6lvXJXALjobFsfh2U6xgRpM+AyS82GFJXxJQQbMhD7Ju6+
 cV/1S8sZbT9wzdveN4KH17CiQaS2FNsWfi+Y+4zXO/hd+8boAlnhMgdsw0SyjbRQhEeF
 DgYRakxscZhZelH/WBQGbPozFYYppys7TAhgURYHSNtz5EMb0zpqLBZhS8kYHTHY/BY8
 CAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Rvz56oO5wS/gMgAnvaeiayH0Bj18HTZcfeBlsrcvaU=;
 b=br+2cPmB450yQhdC1We4sjLVwoLwvgkZRg94oe8QbxBMBScRUrbhC1viBNfugZxJDK
 8Rv5xP76/5HnvXlYNspFQylxsuYIL5XIDgV2RF3A1I/ypCxJqnMlnQS6tFi5goaeefTT
 xD7UVij4vNjj65Co+e7dobch2qmWzFejYLq7vD/ZVHXEehOfzTBA9Ih75/yP3BP4EsPf
 xVu88prxrWuCkTui/0Ef2871SI/JiInYoDtZS+8kDENoqAiw77lbKyqtVfKlQHBEO7rb
 Je+EJIG01D/1KYmqtKkl5Aofkw3Um91kMJUNhjk6CfQ9rcsyPgMLA9QKY6XRAu572GqO
 VGTA==
X-Gm-Message-State: AOAM5329nrhexc6aImIGJ+BnT1KwgfF/ENU6NljCekHX7u5O4Lw0jQf2
 JkJCCkSMcfn52oxS+C2My5hXZwA2GHd0ng==
X-Google-Smtp-Source: ABdhPJwtioCtXoEeUPyW18e1rdlB07N3HB8mkB+aEIlDmV+9i60+5GQMeqI0BovQBokdEqpZWU283g==
X-Received: by 2002:a17:90b:3009:: with SMTP id
 hg9mr3599594pjb.38.1597438864337; 
 Fri, 14 Aug 2020 14:01:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id o134sm10019221pfg.200.2020.08.14.14.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 14:01:03 -0700 (PDT)
Subject: Re: [PATCH v5 10/14] cpus: add handle_interrupt to the CpusAccel
 interface
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
References: <20200812183250.9221-1-cfontana@suse.de>
 <20200812183250.9221-11-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee2b8640-2446-32f8-47c3-b327db42f7b7@linaro.org>
Date: Fri, 14 Aug 2020 14:01:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812183250.9221-11-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>, Wenchao Wang <wenchao.wang@intel.com>,
 haxm-team@intel.com, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Richard Henderson <rth@twiddle.net>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/20 11:32 AM, Claudio Fontana wrote:
> +static void generic_handle_interrupt(CPUState *cpu, int mask)
> +{
> +    cpu->interrupt_request |= mask;
> +
> +    if (!qemu_cpu_is_self(cpu)) {
> +        qemu_cpu_kick(cpu);
> +    }
> +}
> +
> +void cpu_interrupt(CPUState *cpu, int mask)
> +{
> +    if (cpus_accel && cpus_accel->handle_interrupt) {
> +        cpus_accel->handle_interrupt(cpu, mask);
> +    } else {
> +        generic_handle_interrupt(cpu, mask);
> +    }
> +}

First, by this point you have converted all of the accelerators, so I would
expect cpus_accel to always be non-null.  I would expect a patch immediately
preceding this one to place an assert to that effect somewhere in the startup
code, and to remove all of the checks.

Second, I would prefer that all methods be non-null, so that you don't need to
check that either.  This patch would add generic_handle_interrupt (perhaps
named cpus_accel_default_handle_interrupt declared in sysemu/cpus.h?) to the
CpusAccel structure of all except TCG.

Similarly for all other methods that are checking non-null-ness of the method
pointer.  Perhaps assert non-null for each method in cpus_register_accel().


r~

