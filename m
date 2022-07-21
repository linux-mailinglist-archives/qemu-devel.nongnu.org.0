Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BCB57CB7E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 15:10:00 +0200 (CEST)
Received: from localhost ([::1]:40826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEVwE-00079q-JU
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 09:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oEVpf-0007TE-2n
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 09:03:11 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:32902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oEVpc-0003Gu-UQ
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 09:03:10 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A4B81B82472
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 13:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF741C341C6
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 13:03:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="lvb70eaH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658408582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=trcg9QLYdMwhWVZyDmx8ZPxmYTZnrCl1xBwptnz+YX4=;
 b=lvb70eaHLH/woneWyL7yDYZ82qPKixGSm8/HBuEFZ8jo/mQXrAtQx3P9b2u0vQtpRodEwO
 glcuBYKccrgf2Y6Mn8TjRcVgKZgSNq0H1QHhlfHzdOw5FMwH9jEDdMXu7Lo0R3o/t9hr3Z
 65dSpkEnHbDoE+RKG//FYqKnOVCpWGI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0d0b78e9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Thu, 21 Jul 2022 13:03:02 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id f14so1226168qkm.0
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 06:03:01 -0700 (PDT)
X-Gm-Message-State: AJIora9VgQfj2wf7RDqJ9e6qeYWYudIYxVNrzVy7uUbJx2OT+svuKLWV
 igjKp/5/K6RyPZouBHTZ/diRX1nWjokycnYayF4=
X-Google-Smtp-Source: AGRyM1ty70iAH7FdBBL6nhznY8YCjTVJfA2SJfM2vnF6TkFu49dCqyth9irloUzAdoI973B2A/Y98xO7EkMjhiSlnYk=
X-Received: by 2002:a05:620a:45a9:b0:6b6:895:2d2 with SMTP id
 bp41-20020a05620a45a900b006b6089502d2mr7652379qkb.70.1658408581168; Thu, 21
 Jul 2022 06:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220721122937.729959-1-pbonzini@redhat.com>
 <20220721122937.729959-5-pbonzini@redhat.com>
In-Reply-To: <20220721122937.729959-5-pbonzini@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 21 Jul 2022 15:02:49 +0200
X-Gmail-Original-Message-ID: <CAHmME9rSgye+Wpgk52pqsyHUAWiL4nLQMSsQUJt617A_wfCUAw@mail.gmail.com>
Message-ID: <CAHmME9rSgye+Wpgk52pqsyHUAWiL4nLQMSsQUJt617A_wfCUAw@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/i386: pass RNG seed via setup_data entry
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 21, 2022 at 2:29 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> +static void x86_machine_get_linuxboot_seed(Object *obj, Visitor *v, const char *name,
> +                                           void *opaque, Error **errp)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(obj);
> +    OnOffAuto linuxboot_seed = x86ms->linuxboot_seed;
> +
> +    visit_type_OnOffAuto(v, name, &linuxboot_seed, errp);
> +}
> +
> +static void x86_machine_set_linuxboot_seed(Object *obj, Visitor *v, const char *name,
> +                                           void *opaque, Error **errp)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(obj);
> +
> +    visit_type_OnOffAuto(v, name, &x86ms->linuxboot_seed, errp);
> +}
> +

Gross, no! There is no reason at all to make this into a user tunable.
Please don't do that. The whole point is that this is a simple
transparent mechanism.

There's also no need to usurp my patchset. I sent a v7 incorporating
your feedback. So this isn't really appreciated either. I actually
asked you not to usurp this over IRC, but you did anyway. If your goal
is "alienate this contributor so he doesn't like working on QEMU,"
then you're succeeding.

Here's v7:
https://lore.kernel.org/qemu-devel/20220721125636.446842-1-Jason@zx2c4.com/

This will handle your ridiculous theoretical migratory concerns with
minimal invasiveness and without having to introduce userfacing
tunables.

Let's keep discussion on that v7 thread, please.

Thanks,
Jason

