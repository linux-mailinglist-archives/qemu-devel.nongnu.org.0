Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65774200BD5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 16:39:05 +0200 (CEST)
Received: from localhost ([::1]:45464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmIAa-0008R0-06
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 10:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmI9a-0007Nq-Bv
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 10:38:02 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:46505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmI9X-00014K-CA
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 10:38:02 -0400
Received: by mail-ot1-x342.google.com with SMTP id g7so7402076oti.13
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nBoKVae58ToSfWedQL5+pEeleproogYVa99U5gP9OUY=;
 b=QiDxat2K6HXhC5EXiF/jNEteSQboMepNPyQfVOoOKipdTpVYCvm67n9R2uIKGlq1F7
 LEMUM5V0/6A+1IDTMw1dJU3yVotGskv0xHKDJSNF12vJ08KptlSwp5bVlpc637qp5b2T
 v76XrUboXpMwR242FzXgiBVq3eJzqAVteQuTuEXHR4ZP+s4xz6igbqgL9m8wcS2SGDkw
 ssoOA3kApvwEQ/THcdBxs/sbtQECK9YdzVY5Oqt1/Qy9iB498JZaV8rqLHPUmkwtNHvc
 2zB9ID8nBI19ifys7cwHkfN4QdvjrBdo3662l5Tiu7RprD/TgjeHSwsAkH1pDZrhzrTO
 HeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nBoKVae58ToSfWedQL5+pEeleproogYVa99U5gP9OUY=;
 b=WlAEsHdUiQgaJRoBtziZLJh8WbX6Tynx/JiDoQbnJ9rSnVDMaOPDAiCmsEuYZUmvQG
 Nh/vmNlSt2yc9kiGMuQlHZPKY8FwGEWAXjq8CA4GkU+ogC+MBmIs5tSSu9Ue2VqNjPFh
 4ibUW5Yb/qQdBNAoW5GS+YsIFJGB93OdHjA+VjnbQcFEFPEnrSlzWxkC26IAJm/V6/DB
 B0eQ4jNd7504W9Mlpe6xcNByjrUnBOi/GompzXPAwKygtZo2u1rmwyTInbd4h1WRzkIs
 z96AjAmZe0XgHaReR6AMd4Ol1K4oUSIwjiHEpWnXqG44fQx1EGfe9gFnNScYPicKlwIL
 eRqQ==
X-Gm-Message-State: AOAM531qa2+tqohziLgQz1d0qEfIWXYJv6YJxE5DDDqdaRC0S0xwymXs
 JzKPbeAfwDFdzCXM57idrR2lBctDT+bCNjdNB/fYkg==
X-Google-Smtp-Source: ABdhPJyxdkpqpaJKj9BvILqg8upAONf5O4H9zQnnTIS+abVZsc/0TxIX4nvNygjkP5cAfKGkDCkkb9ehncAL2otBrAE=
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr3222712oto.91.1592577478051; 
 Fri, 19 Jun 2020 07:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-42-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 15:37:47 +0100
Message-ID: <CAFEAcA_zz6Ed65qk4wVBriuREe24ppSUVce2JfFO4xXLeZSwPw@mail.gmail.com>
Subject: Re: [PATCH v7 41/42] target/arm: Create tagged ram when MTE is enabled
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Jun 2020 at 02:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v5: Assign cs->num_ases to the final value first.
>     Downgrade to ID_AA64PFR1.MTE=1 if tag memory is not available.
> v6: Add secure tag memory for EL3.
> ---


>  static void arm_cpu_finalizefn(Object *obj)
> @@ -1735,17 +1754,43 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>      MachineState *ms = MACHINE(qdev_get_machine());
>      unsigned int smp_cpus = ms->smp.cpus;
>
> -    if (cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECURITY)) {
> +    /*
> +     * We must set cs->num_ases to the final value before
> +     * the first call to cpu_address_space_init.
> +     */
> +    if (cpu->tag_memory != NULL) {
> +        cs->num_ases = 4;
> +    } else if (cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECURITY)) {
>          cs->num_ases = 2;
> +    } else {
> +        cs->num_ases = 1;
> +    }

1: neither MTE nor TrustZone
2: TrustZone but not MTE
...but why is MTE always 4 even if no TrustZone? I would have
expected MTE-no-TZ to have 2 ASes...

> +    if (cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECURITY)) {
>          if (!cpu->secure_memory) {
>              cpu->secure_memory = cs->memory;
>          }
>          cpu_address_space_init(cs, ARMASIdx_S, "cpu-secure-memory",
>                                 cpu->secure_memory);
> -    } else {
> -        cs->num_ases = 1;
>      }
> +
> +    if (cpu->tag_memory != NULL) {
> +        cpu_address_space_init(cs, ARMASIdx_TagNS, "cpu-tag-memory",
> +                               cpu->tag_memory);
> +        if (cpu->has_el3) {
> +            cpu_address_space_init(cs, ARMASIdx_TagS, "cpu-tag-memory",
> +                                   cpu->secure_tag_memory);
> +        }
> +    } else if (cpu_isar_feature(aa64_mte, cpu)) {
> +        /*
> +         * Since there is no tag memory, we can't meaningfully support MTE
> +         * to its fullest.  To avoid problems later, when we would come to
> +         * use the tag memory, downgrade support to insns only.
> +         */
> +        cpu->isar.id_aa64pfr1 =
> +            FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 1);
> +    }
> +
>      cpu_address_space_init(cs, ARMASIdx_NS, "cpu-memory", cs->memory);

...and indeed the code here only inits the ARMASIdx_NS and
ARMASIdx_TagNS spaces in that case. I guess we need to leave
ARMASIdx_S in the array but unused since we're effectively
indexing them by constant integer, but even so shouldn't
num_ases be 3 (0 and 2 used, 1 present but empty, 3 not needed) ?

thanks
-- PMM

