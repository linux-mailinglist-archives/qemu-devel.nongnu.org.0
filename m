Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9AA570441
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 15:27:40 +0200 (CEST)
Received: from localhost ([::1]:33348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAtRq-0007ZK-QQ
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 09:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oAtOa-000525-1V
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:24:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oAtOW-0005gR-6z
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:24:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657545850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lhVxvNjbjnB/fa4puPuW6uBZESUv0tQdSdTkI3nrexU=;
 b=jM06rFemicRV4SJaAxxa5Vr1I+evuElUArZkBOkIXtpfQiXxD6qWykQcH3JbOZwNkob8+4
 EprJYuGgzYnfueC/ysWs+DvWP3Tx5yqeb8eiEj7rvNhKqY1lo6acpALIFtIYKSgp7RXWue
 KgDpCCJ9hCo1NPEbWMZO2bzA/JdJ0r0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-7hJ7zjMbNQids-o7Xb5kqg-1; Mon, 11 Jul 2022 09:24:09 -0400
X-MC-Unique: 7hJ7zjMbNQids-o7Xb5kqg-1
Received: by mail-wm1-f72.google.com with SMTP id
 i184-20020a1c3bc1000000b003a026f48333so2724506wma.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lhVxvNjbjnB/fa4puPuW6uBZESUv0tQdSdTkI3nrexU=;
 b=1nieN2uav/N8OEE90JGSu5AIGKQ5/MGfFjos2IqG3xk4QMZipxDObOeGCXMjgWvibB
 Edj1hnoZQgDzZQ9O/vqUMFFQ6+binI+dzNKWlqtOHa2s4W04raaLEitjlGrB5T6nnyzx
 devQ4g9PfWOHzrH7FrrjEvzeQXml9JXCCcW2UmS0MV/Hcl4+v08GFtqsOs/jaya1WvDp
 BkUgV54w+9vYCMK9C9p2fIKbAgQYSAvRRRuGVjku57PVAMjXq8ohyTRAx7XiiKzNbuao
 i/vBeYffwG77tZc9Sh3HnQWiShgTFmC9+Nk2UgPA9KB9wQ/G4sg3qXZ3YURIRqP9EEKS
 BR8w==
X-Gm-Message-State: AJIora/JGlokvap0yykE5j24dnHQr0Pr9rJ4Lkbe8Tg/1VwArrfTDv2c
 lIDQ1UwABnUKztYkt1ZhZoejdw7NDSSNGNzM2QGAjHv0j68rvpn2/DFsTGyikGuNAarByyy0TZE
 0htK1CysfvtsKhs0=
X-Received: by 2002:a05:600c:219a:b0:3a2:e4b0:4cfb with SMTP id
 e26-20020a05600c219a00b003a2e4b04cfbmr9502646wme.2.1657545848495; 
 Mon, 11 Jul 2022 06:24:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sw4NzH8Shmsn5L/XtCeTBFOOUlLx0cppJNCaI1EPTU3rC+Jr6JuVhxRj+gLhUfhwUrA2kMNQ==
X-Received: by 2002:a05:600c:219a:b0:3a2:e4b0:4cfb with SMTP id
 e26-20020a05600c219a00b003a2e4b04cfbmr9502609wme.2.1657545848155; 
 Mon, 11 Jul 2022 06:24:08 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 ay26-20020a05600c1e1a00b003a2e89d1fb5sm2235622wmb.42.2022.07.11.06.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:24:07 -0700 (PDT)
Date: Mon, 11 Jul 2022 14:24:05 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eric Auger <eauger@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/2] arm: enable MTE for QEMU + kvm
Message-ID: <YswkdVeESqf5sknQ@work-vm>
References: <20220707161656.41664-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707161656.41664-1-cohuck@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Cornelia Huck (cohuck@redhat.com) wrote:
> This series makes it possible to enable MTE for kvm guests, if the kernel
> supports it. Again, tested on the simulator via patiently waiting for the
> arm64/mte kselftests to finish successfully.
> 
> For tcg, turning on mte on the machine level (to get tag memory) stays a
> requirement. If the new mte cpu feature is not explicitly specified, a tcg
> vm will get mte depending on the presence of tag memory (just as today).
> 
> For kvm, mte stays off by default; this is because migration is not yet
> supported (postcopy will need an extension of the kernel interface, possibly
> an extension of the userfaultfd interface), and turning on mte will add a
> migration blocker.

My assumption was that a normal migration would need something as well
to retrieve and place the MTE flags; albeit not atomically.

> My biggest question going forward is actually concerning migration; I gather
> that we should not bother adding something unless postcopy is working as well?

I don't think that restriction is fair on you; just make sure
postcopy_ram_supported_by_host gains an arch call and fails cleanly;
that way if anyone tries to enable postcopy they'll find out with a
clean fail.

> If I'm not misunderstanding things, we need a way to fault in a page together
> with the tag; doing that in one go is probably the only way that we can be
> sure that this is race-free on the QEMU side. Comments welcome :)

I think it will.
But, ignoring postcopy for a minute, with KVM how do different types of
backing memory work - e.g. if I back a region of guest memory with
/dev/shm/something or a hugepage equivalent, where does the MTE memory
come from, and how do you set it?

Dave

> Changes v1->v2: [Thanks to Eric for the feedback!]
> - add documentation
> - switch the mte prop to OnOffAuto; this improves the interaction with the
>   existing mte machine prop
> - leave mte off for kvm by default
> - improve tests; the poking in QDicts feels a bit ugly, but seems to work
> 
> Cornelia Huck (2):
>   arm/kvm: add support for MTE
>   qtests/arm: add some mte tests
> 
>  docs/system/arm/cpu-features.rst |  21 +++++
>  target/arm/cpu.c                 |  18 ++---
>  target/arm/cpu.h                 |   1 +
>  target/arm/cpu64.c               | 132 +++++++++++++++++++++++++++++++
>  target/arm/internals.h           |   1 +
>  target/arm/kvm64.c               |   5 ++
>  target/arm/kvm_arm.h             |  12 +++
>  target/arm/monitor.c             |   1 +
>  tests/qtest/arm-cpu-features.c   |  77 ++++++++++++++++++
>  9 files changed, 256 insertions(+), 12 deletions(-)
> 
> -- 
> 2.35.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


