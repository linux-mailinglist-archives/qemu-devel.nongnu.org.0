Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764304CE02B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 23:18:40 +0100 (CET)
Received: from localhost ([::1]:41032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQGFz-0006SX-HZ
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 17:18:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQGCR-0004Pp-Qz
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:14:59 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=35592
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQGCQ-00079B-CE
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:14:59 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id z30so6739210ybi.2
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 14:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gdbNZ31XJWqaW2I50GKPywK8aWePiBstoRfT9w+s8NQ=;
 b=y5toeCs0w6vEPJZqTyb7RK5llfhp6MkKw65YGg+9hO/jNa+KrRDMvOxMS7KkE12TxT
 p1o1GUmrrPv+mZ2/penZ4A0gTzt+UBU+YQydR/1BRiN9xAynXH9sBNnt/kQX6Z7Jt6Fu
 nfwOdN13EmHBOZjawDYl6joMR3TNArlr2ZO1pJqrSzVPJCffRV59jmqLc/qzii8PyTom
 M/sv3PM27HSyfaxPtYtyZcf7nTxHHMNRgNhf8YHU4rUqqvISaTgPPyojhJxjNj4pOXtH
 kXW2LCPbBVVuDFr9UPg6U2krplVz5pkfC0XAjhwKfd4ulEYca4GzuKYvDfjC4uQ767Qr
 uXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gdbNZ31XJWqaW2I50GKPywK8aWePiBstoRfT9w+s8NQ=;
 b=BPbEKSsszSjhP3VSX/j0PWeQupAXQ55mWkgOFxHpHiHcrRMTHK49fgy29W/OXxRekQ
 QvHnAKb42xVDqDmwGIYa0MNxT6F8EHGtYgpkNUtzzI11udFhpPAiFylWK470lydpbPtw
 fCVkL8O1ADDwzzSNFnMPtyBohm/jjQ5t+99XMwWd6v/Ka7X10O7UL8ZkMzCpYDon76MT
 4IBcMNgDKJ4FIGLY9W/M90v2jwx4UIjBkytFSR4O7gmZitrzJ3GACZVQSd5t5CWFH4T0
 dMU1ctpuxFXRTXtFuH3H4rQM85HQgpH+5VyXiSw8LjGZqSc4Gx3fEN1ap6qrgMi3Sn8G
 jTdw==
X-Gm-Message-State: AOAM533fGv3T/o8QU6PgVlbLHVvMABey86jYggAz8G7ZtPcMAJCQ7XHO
 FxbSDIMqT73BFJwvicjiF0kzhG0UMBHAA8isNSmsmw==
X-Google-Smtp-Source: ABdhPJwCfGnIUStDaJdo/A22UqD9aLbnobpLxj0U0StM4r7HZIDU+8PjP2ISl2KadVmaQA6Hpk2XO9SHzCR5mc32xeI=
X-Received: by 2002:a25:32c6:0:b0:629:130:a037 with SMTP id
 y189-20020a2532c6000000b006290130a037mr590672yby.193.1646432097345; Fri, 04
 Mar 2022 14:14:57 -0800 (PST)
MIME-Version: 1.0
References: <20220301215958.157011-1-richard.henderson@linaro.org>
 <20220301215958.157011-19-richard.henderson@linaro.org>
 <CAFEAcA9zcf+A6h3R+x2uSEk1aUpV_iWfEZT72CCUeSs32OUJcA@mail.gmail.com>
 <df2c63db-54d9-ae40-f403-b1adfa6bdbdc@linaro.org>
In-Reply-To: <df2c63db-54d9-ae40-f403-b1adfa6bdbdc@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 22:14:46 +0000
Message-ID: <CAFEAcA8J7e_KeiV4bqZd_UnTveN8-5-YRr7MRKXWSWHa+x2WvA@mail.gmail.com>
Subject: Re: [PATCH v4 18/18] hw/arm/virt: Disable LPA2 for -machine virt-6.2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Mar 2022 at 19:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/4/22 01:52, Peter Maydell wrote:
> > Is it not possible to implement this in the usual "change
> > property for older versioned machines" way of adding to
> > the hw_compat arrays?
> >
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index d856485cb4d..dac82a709ba 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -37,7 +37,9 @@
> >   #include "hw/virtio/virtio.h"
> >   #include "hw/virtio/virtio-pci.h"
> >
> > -GlobalProperty hw_compat_6_2[] = {};
> > +GlobalProperty hw_compat_6_2[] = {
> > +    { "arm-cpu-max", "lpa2", "false" },
> > +};
> >   const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
>
> Hmm, I didn't try that, just mirrored the other examples within hw/arm/virt.c.
> I guess the real type name would be TYPE_ARM_MAX_CPU, or "max-arm-cpu".
>
> ...
>
> Yes, that works.  I'll send an update.

Do check it with KVM as well, to check the "CPU doesn't actually
have that property" case...

-- PMM

