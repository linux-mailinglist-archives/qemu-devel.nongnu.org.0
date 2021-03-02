Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C097F329D52
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 12:56:30 +0100 (CET)
Received: from localhost ([::1]:55628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH3dd-0006GG-BY
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 06:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lH3cW-0005kt-83
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 06:55:20 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lH3cT-0004y3-0N
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 06:55:19 -0500
Received: by mail-ej1-x632.google.com with SMTP id ci14so15713510ejc.7
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 03:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KIGVZR3RnhuxYifg2TRsVlVqLtJpWmNZz2tpCHns6fI=;
 b=SjTEtbLKLoCC06i6Faq0BnlPKeOYwtza340mcgOCS96xpE9UoC6Wo/JQ5HEQdMZ9yB
 BSL0nNvPF++moD/5rH1V5ty0PUQbBI7DzLo1pTvBAJYcW9bkUx/myacOpSj73fAPxmqc
 kwXcB2W2Ixatj8ZGe5uT4AaGyR7GbIeOpMKQ/rQtV/f4OCaZnJ099YLDo7uiKbdvN25f
 jKHsSy9+ahUA7dtJk+oJYLuvkLzy5sz01XbeckQ1IBPgsWp3jlLYya+R103XujX98cL/
 866/8MALj9fGCspC0olt2Zt1YyqEAaOr33GBk6DjUSqe2ZvSac4TPG6+shnQnjPmskwB
 kbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KIGVZR3RnhuxYifg2TRsVlVqLtJpWmNZz2tpCHns6fI=;
 b=ER8dQqDGMs0vkusia3C7OaaHK1mHvCW92rEX5VbBEuFKG5lvVxgMWJ49Krdr7Djm7H
 lkfmcDbxfMrZvde4RCuhxII0zZ4FWrs1eiusS1Sb7Np05p8XAjpg109+PNG8SiVV3dvs
 vgJwKOAYcROwld5xLtsOvEHCyl1YhYZLqjWIInL7G/piTIUNfOuowMX6fdikFt4TH4mj
 n2UmkHFeXp4bNpsCI7OcGWNZSWno8vXwOzcHfqxuoJtudWEd2o6r33mAZ8VoJfXji6fq
 FVL3/JUpGHs1Zf15biy++aykIiBlWtt+pZ02xJZSOBmhwZ2Lb+uJv3PAfwhp7NfWr92n
 a/kQ==
X-Gm-Message-State: AOAM530ovF68pwNQxb5SvZUFmMZ/qTWKDex+HUvrfbL7Hi3bmDlesvCV
 AD0q3XQ1HD4pcf35Qrg+k8BCxfzj/16V1WrEXs29gw==
X-Google-Smtp-Source: ABdhPJxlXL3W1dNIfv73MXxyIcS+DMy67U3QNfz9ecwPTjk7XZKuB7ouBh2zQp5/QkahHJSZ9p3vLjGUCaoJnGFUSPY=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr20529118ejj.4.1614686111248; 
 Tue, 02 Mar 2021 03:55:11 -0800 (PST)
MIME-Version: 1.0
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-5-cfontana@suse.de>
In-Reply-To: <20210301164936.19446-5-cfontana@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Mar 2021 11:54:56 +0000
Message-ID: <CAFEAcA8nGhxj6DF-ayCeJxzaAh1iyw6rJuxFH9DwAteAUsfufQ@mail.gmail.com>
Subject: Re: [RFC v2 04/24] target/arm: move psci.c into tcg/sysemu/
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Mar 2021 at 16:49, Claudio Fontana <cfontana@suse.de> wrote:
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---

I note that the not-yet-landed aarch64 support for the hvf accelerator
is hoping to share the tcg psci implementation...

-- PMM

