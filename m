Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 819F72E27F5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 16:38:12 +0100 (CET)
Received: from localhost ([::1]:37642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksSgt-0006zE-19
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 10:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ksSft-0006Tg-Hk; Thu, 24 Dec 2020 10:37:09 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ksSfr-0002KP-IQ; Thu, 24 Dec 2020 10:37:09 -0500
Received: by mail-wm1-x32a.google.com with SMTP id e25so1906784wme.0;
 Thu, 24 Dec 2020 07:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jMWHkd1Hyk7KMWkXk2aBjvPWHs+unLt0KN70vpSS9fE=;
 b=VA4UDsKrRp1erhOkMT6DgNcAZCFqFcQIwZDH8foIok8lZIQZqOFIe3H4f9/rJGlnRt
 DgkkMim1aGYr0GS6kJWYDXrG/fd9Hefvi4B5KSU+nq7a13ipWwwuhYUqdD12+XsX+JTV
 FHBNKugPVz3ce+1hTDlBf/JdsI6w2XTgQNVfBjCVQ4W2OiRxhH6X5ZTovCLv9GUac5Hw
 BFaJsWQquIe2MYIg4hdWVBcnsWu9fPWtsmY9SW00C6R1zlXg0Wdo3UHY28xlL5yI/Xat
 mhIFK5zZpbTvEIG/qooySddd9Zsvt5SfOFO6Ffytbo2OjZ5sDFAKa5AWp2hq6WbMHpQG
 /Kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jMWHkd1Hyk7KMWkXk2aBjvPWHs+unLt0KN70vpSS9fE=;
 b=m2gHZ9PKvfWg5B3+Fz4JI4Pjy8AHZLHJO6IS7/pE7GoYYbXiLEHssKHtZkuLwZ+19y
 1aq81/zMYeQAfEzn/o4DyaPDaYQI3K1Gb2eDiLioAdlBrykSu21X2BV+EWktIUpINL5N
 1pEx/yu4c/6339AaIPhUYyKUBhZapB4LWGgcT5hxfm7Rl0U6US48WzQWaaW/WVBTEz1R
 k2AN7Ouo7lqnlUmQ81RdDaaCPoI4QPoZ0OPqx18aUeYmX9V4bomGVbA/6qsss6wIW5oN
 gLeJZ9DAkCYXPVAzzRoX6gaxZi63wqSSb/wrSfxw4768PJYqJhNJHVgYBlXJjMKVxcRk
 vcZQ==
X-Gm-Message-State: AOAM530ufkIY095S8tj5ioR6g7bwLMJEVcxnXhVmQV32WT2g7KdFIYT6
 5rrAEylwzUZHq/s0gTHuxesbgG7OpThXiQ==
X-Google-Smtp-Source: ABdhPJygcmIgqp16dUaLP++M/n3qpPX0mwTaqwmMMn7wPsx5R9FIeIqeHOaAryZsvNQrcnEQw3iyAQ==
X-Received: by 2002:a7b:c4c7:: with SMTP id g7mr4962601wmk.29.1608824225099;
 Thu, 24 Dec 2020 07:37:05 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id w18sm41498926wrn.2.2020.12.24.07.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Dec 2020 07:37:04 -0800 (PST)
Subject: Re: [PATCH v2 1/2] ppc: Fix build with --without-default-devices
To: Paolo Bonzini <pbonzini@redhat.com>
References: <160875160729.98237.3219319022197329254.stgit@bahia.lan>
 <aae93661-1e66-f659-2351-270ee483ce6e@amsat.org>
 <CABgObfZjrwps4F5ksG=KXj3Di6DqApHU23cTBMhQtzeEA2j6_g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a3c57ae8-4a2a-0c88-5ca3-af299229849e@amsat.org>
Date: Thu, 24 Dec 2020 16:37:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CABgObfZjrwps4F5ksG=KXj3Di6DqApHU23cTBMhQtzeEA2j6_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.825,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/24/20 3:42 PM, Paolo Bonzini wrote:
> Why? It's all KVM.

I find it not obvious to figure out by simply looking at this diff.
I'm probably too tired. Anyway Cédric already reviewed it.

> 
> Paolo
> 
> Il gio 24 dic 2020, 11:58 Philippe Mathieu-Daudé <f4bug@amsat.org
> <mailto:f4bug@amsat.org>> ha scritto:
> 
>     On 12/23/20 8:26 PM, Greg Kurz wrote:
>     > Linking of the qemu-system-ppc64 fails on a POWER9 host when
>     > --without-default-devices is passed to configure:
>     >
>     > $ ./configure --without-default-devices \
>     >               --target-list=ppc64-softmmu && make
>     >
>     > ...
>     >
>     > libqemu-ppc64-softmmu.fa.p/hw_ppc_e500.c.o: In function
>     `ppce500_init_mpic_kvm':
>     > /home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/e500.c:777:
>     undefined reference to `kvm_openpic_connect_vcpu'
>     > libqemu-ppc64-softmmu.fa.p/hw_ppc_spapr_irq.c.o: In function
>     `spapr_irq_check':
>     > /home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/spapr_irq.c:189:
>     undefined reference to `xics_kvm_has_broken_disconnect'
>     > libqemu-ppc64-softmmu.fa.p/hw_intc_spapr_xive.c.o: In function
>     `spapr_xive_post_load':
>     > /home/greg/Work/qemu/qemu-ppc/build/../hw/intc/spapr_xive.c:530:
>     undefined reference to `kvmppc_xive_post_load'
>     >
>     > ... and tons of other symbols belonging to the KVM backend of the
>     > openpic, XICS and XIVE interrupt controllers.
>     >
>     > It turns out that OPENPIC_KVM, XICS_KVM and XIVE_KVM are marked
>     > to depend on KVM but this has no effect when minikconf runs in
>     > allnoconfig mode. Such reverse dependencies should rather be
>     > handled with a 'select' statement, eg.
>     >
>     > config OPENPIC
>     >     select OPENPIC_KVM if KVM
>     >
>     > or even better by getting rid of the intermediate _KVM config
>     > and directly checking CONFIG_KVM in the meson.build file:
>     >
>     > specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_OPENPIC'],
>     >               if_true: files('openpic_kvm.c'))
>     >
>     > Go for the latter with OPENPIC, XICS and XIVE. While here also move
>     > XIVE_SPAPR to hw/intc/Kconfig where it belongs.
>     >
>     > This went unnoticed so far because CI doesn't test the build with
>     > --without-default-devices and KVM enabled on a POWER host.
>     >
>     > Signed-off-by: Greg Kurz <groug@kaod.org <mailto:groug@kaod.org>>
>     > ---
>     > v2: - check CONFIG_KVM in the meson.build as suggested by Paolo
>     > ---
>     >  hw/intc/Kconfig     |   14 +++++---------
>     >  hw/intc/meson.build |    9 ++++++---
>     >  hw/ppc/Kconfig      |   15 ---------------
>     >  3 files changed, 11 insertions(+), 27 deletions(-)

