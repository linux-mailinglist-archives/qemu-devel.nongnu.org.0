Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBD33F1A61
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 15:30:01 +0200 (CEST)
Received: from localhost ([::1]:38290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGi7M-0004cg-EE
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 09:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGi5Y-0003OW-Ls
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:28:10 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:39900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGi5X-0002Ek-1D
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:28:08 -0400
Received: by mail-ed1-x52b.google.com with SMTP id cn28so8882144edb.6
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 06:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=byfOvag5+5Wjtyv1JqsS31vAuP/a2Iq4KlJVIZBKMOw=;
 b=cjWeLE4VFPbNSeNj861zjd6kixSvGADx1wqCPBcmMDZ1j/X5TZ/3xs04Hwg9yKxNqV
 I8FIHwPvxWZ066rJo4ycU7oV8ESpgPebBkKS055/H130jJfiX/0305b/qXg1GpqRcatT
 APNNkVvWung/m9xhUuzrtentge9knDLA/l9nR5UVxk8W0o3/0OQrzCBEnjJ9EcUDw9dG
 vgPv0AJhO3Ui88KSSCVOUXZOsoIlBMo9joHQF1GnKpIhw7Rk/QEtr8304wcfvrhmYMsA
 DN2BZX2S+RvjUaYu5HfLZlXtoYjGAZVZTx88fjEQ4gcoiASUBDLowoJejtehJw7xpybL
 jjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=byfOvag5+5Wjtyv1JqsS31vAuP/a2Iq4KlJVIZBKMOw=;
 b=Gky2+tPG3fm0xj3YRtWOifjztznvGObqKwZnC7/B7u1aaSsFlUDTGQf3CyIdzlRG9z
 PMxkagQtEpIeqoRTb1NDc4J33jl/BvvCtvuDe0pPuTMjEG3Ur2xP5V+axMQUNw5+6Z9m
 LjzGYIGe3pz7jmY9VhGuH8lwukHZOq0vBQkKNckRlSwxBJxWY2icqdFpQ2z3AXowXoO4
 euwh7XWRDUZy2zH/KAEa2i3PVj/sQYD4CNQy1VSRulSal1prRb5wcqHRNCMQMOyFJmcF
 PdjoUcb+NC2IwfVy8kOku9dwc+IxjPurBA3W+zaCH5yRIl+Mnxll5LOECfX799K1LaH1
 RKUw==
X-Gm-Message-State: AOAM531EDO/8IZ020bKMkaQ9sFoccBV3nXDSv/ngYsCU/Ibr6R9tEwJ2
 R3rBhyW1Yv9oe3YIzYFv3+2O4MQrnlqALnpGopyjGA==
X-Google-Smtp-Source: ABdhPJy5BrfS7R5WzHg99VJ7OlR8759yc8/HM3zop1SYoIDKNyJsHs7H1nEv78lgUdgwZrJNoS8MzST5nyF/ijz8QwA=
X-Received: by 2002:a05:6402:3099:: with SMTP id
 de25mr16283113edb.36.1629379685438; 
 Thu, 19 Aug 2021 06:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org>
In-Reply-To: <20210812165341.40784-8-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:27:19 +0100
Message-ID: <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 Aug 2021 at 17:53, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Included creation of ITS as part of SBSA platform GIC
> initialization.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 79 ++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 75 insertions(+), 4 deletions(-)
>

> +static char *sbsa_get_version(Object *obj, Error **errp)
> +{
> +    SBSAMachineState *sms = SBSA_MACHINE(obj);
> +
> +    switch (sms->version) {
> +    case SBSA_DEFAULT:
> +        return g_strdup("default");
> +    case SBSA_ITS:
> +        return g_strdup("sbsaits");
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static void sbsa_set_version(Object *obj, const char *value, Error **errp)
> +{
> +    SBSAMachineState *sms = SBSA_MACHINE(obj);
> +
> +    if (!strcmp(value, "sbsaits")) {
> +        sms->version = SBSA_ITS;
> +    } else if (!strcmp(value, "default")) {
> +        sms->version = SBSA_DEFAULT;
> +    } else {
> +        error_setg(errp, "Invalid version value");
> +        error_append_hint(errp, "Valid values are default, sbsaits.\n");
> +    }
> +}
>
>  static void sbsa_ref_instance_init(Object *obj)
>  {
>      SBSAMachineState *sms = SBSA_MACHINE(obj);
>
> +    sms->version = SBSA_ITS;
>      sbsa_flash_create(sms);
>  }
>
> @@ -850,6 +915,12 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
>      mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
>      mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
>      mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
> +
> +    object_class_property_add_str(oc, "version", sbsa_get_version,
> +                                  sbsa_set_version);
> +    object_class_property_set_description(oc, "version",
> +                                          "Set the Version type. "
> +                                          "Valid values are default & sbsaits");

This doesn't look right; where has it come from ?

If you want a command line switch to let the user say whether the
ITS should be present or not, you should use the same thing the
virt board does, which is a bool property "its".

If you want the sbsa-ref board to become a proper "versioned machine
type" such that users can say "-M sbsa-ref-6.1" and get the SBSA
board exactly as QEMU 6.1 supplied it, that looks completely different
(and is a heavy back-compatibility burden, so needs discussion about
whether now is the right time to do it), and probably is better not
tangled up with this patchseries.

thanks
-- PMM

