Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADAC3C6F06
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 12:54:31 +0200 (CEST)
Received: from localhost ([::1]:54424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3G3a-0003bn-4u
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 06:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3G2p-0002xI-2b
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:53:43 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3G2n-0001UL-G3
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:53:42 -0400
Received: by mail-ej1-x62d.google.com with SMTP id gn32so40705033ejc.2
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 03:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CoXNUJA86EAy6dA2IAJWgLMrSoIq2t1lpovPE6N0ZRs=;
 b=cyrxarhm8/guz47ArH5JDQ/bQGJlrCxZCAdpGuHEHNIFE/INz4S4WLTExx91391jLj
 OkvnDsvHaOzLhNJS1g7IFNKAnGIDcrnoPCy5J2T94/9+DsV0n70kNVznVSTSZ4LhAUm+
 XFtXyIFZkwd96NqcAt+Da6KGts6wefIwpWRQgzKhuswxYCR1P3JBnCShM+b4j9Em1Aqc
 AaB5pXmL07xrGhAZ5+YZ5RMfFqkJI839o8wNR6ZdZ6Vs8Lbmxz0sWErXsIMextB+LqQ9
 Yo+vzsS5IAaoMC9c4ybhQKTDSDIJ/J7q54pewjNVF3VCeoy8UEWWwYQxNiN5DnE/2ig9
 4maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CoXNUJA86EAy6dA2IAJWgLMrSoIq2t1lpovPE6N0ZRs=;
 b=HB7KRXX1vWSINXfTXJLOafqhk15W8G45LrUFEI2+xSXvNRiqfuYXym6/+cEBT5tv3a
 +GIFwBNwIvJJT3vMJUCCafSYOGxtRfFxshemBQ2dR3BU7YAj9owoiuUXYE1bdlksWqHS
 ikOe96ytSIUz5PKQbDVi4Vr+OE80qxqTt+vlmqyaj1PRh+zEcyShAydKJmT9Yy3ofWkV
 B9Q0ze+OgktIXugPJcnHUMvb+DUhqytZE+8FWQbSluoT2K8OfPTa49g5h+E1vR43+sCG
 wyORsKMQ1QjqU06Hf8g1v4gAbGwUKFhBTnYsrWGsmE89K8UTnpqe70klnUCxRLR500nz
 IQnA==
X-Gm-Message-State: AOAM533Wg6XYFLIFehwQqnHV7p7gVaiqPRdc05XonmYgwP2mu+1CwOlf
 8QcwtFp9G1h89tYZCNGjP9M9GA1Vkz1TDx94IFaBrw==
X-Google-Smtp-Source: ABdhPJz9Mmw8mpSqMMnvzneZazfcaaJJVk68LzLNYgtxDAmTcrEr/4UaL1NsrZn3nOCm/kNtW5DxnwOTkppb57r0JoA=
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr4933269ejd.250.1626173619857; 
 Tue, 13 Jul 2021 03:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210706100141.303960-1-pbonzini@redhat.com>
 <20210706100141.303960-38-pbonzini@redhat.com>
In-Reply-To: <20210706100141.303960-38-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 11:53:00 +0100
Message-ID: <CAFEAcA8tCSENSrvb4j_==EpsxmKpcg-8=8Eyzbc2h_uXkDKvfw@mail.gmail.com>
Subject: Re: [PULL 37/40] machine: add smp compound property
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Jul 2021 at 11:39, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Make -smp syntactic sugar for a compound property "-machine
> smp.{cores,threads,cpu,...}".  machine_smp_parse is replaced by the
> setter for the property.
>
> numa-test will now cover the new syntax, while other tests
> still use -smp.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Hi; Coverity reports a bug in this function (CID 1458083):

> +static void machine_set_smp(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(obj);
> +    MachineState *ms = MACHINE(obj);
> +    SMPConfiguration *config;
> +    ERRP_GUARD();

ERRP_GUARD() ensures that 'errp' is never NULL...

> +
> +    if (!visit_type_SMPConfiguration(v, name, &config, errp)) {
> +        return;
> +    }
> +
> +    mc->smp_parse(ms, config, errp);
> +    if (errp) {
> +        goto out_free;

...so this condition is always true, and we always take the goto...

> +    }

...and the sanity-checks below here are dead code.

> +
> +    /* sanity-check smp_cpus and max_cpus against mc */
> +    if (ms->smp.cpus < mc->min_cpus) {
> +        error_setg(errp, "Invalid SMP CPUs %d. The min CPUs "
> +                   "supported by machine '%s' is %d",
> +                   ms->smp.cpus,
> +                   mc->name, mc->min_cpus);
> +    } else if (ms->smp.max_cpus > mc->max_cpus) {
> +        error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
> +                   "supported by machine '%s' is %d",
> +                   current_machine->smp.max_cpus,
> +                   mc->name, mc->max_cpus);
> +    }
> +
> +out_free:
> +    qapi_free_SMPConfiguration(config);
> +}

With ERRP_GUARD(), the test you want for "is there an error?"
is "if (*errp) {..."

thanks
-- PMM

