Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F165704CB
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 15:57:53 +0200 (CEST)
Received: from localhost ([::1]:39414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAtv6-00064Y-Ii
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 09:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oAtsi-0003tN-AA
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:55:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oAtse-0007aO-FV
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:55:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657547719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i6aMyK5Ntv0hUxRexx3zBfDiHceMvVJG/f5gGbTdYak=;
 b=fWH0uEx+PdlwAHTS/lTplmYno3tWqoVgFNC0lBQ7gMo77V1juoFexqcnUWLky/OjREbRlw
 Y5DqcLMVaQByVYQJEFyrVoefPltfb63VRmRItHjIYy+PTktvMi4iCbdldRCwXwejoR08BS
 h6Cku7+z3dqR2+ZKRHUELmkF4tbmT2Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-fY9hmxikPoq_Mcv6oXlOTw-1; Mon, 11 Jul 2022 09:55:18 -0400
X-MC-Unique: fY9hmxikPoq_Mcv6oXlOTw-1
Received: by mail-wm1-f70.google.com with SMTP id
 h10-20020a1c210a000000b003a2cf5b5aaaso882495wmh.8
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i6aMyK5Ntv0hUxRexx3zBfDiHceMvVJG/f5gGbTdYak=;
 b=S3/C+dMVZniFV/8AyE71KIotouAbuRKoGiMS40p5x0+dEa2MB6K3FvmGjVGiK7m1mO
 /yEFhjmyDdN85mq+RhY44XoVxzyuA3gEESDy6U0TNseJvI8w5RqRMkQMgwnngE1sSf2f
 Ae3aVHymSh+wPdxfozC8XEh3e2fOAx0orHXIl+zcbC+DVkL3f6YxHOFvFfekgeC333i3
 TkYe4XVViWGlakw971XFUlU53MqApciSS+hJBKzTnVX7Zs4AvzLCjUVOZ2syhRNdrmVm
 7EcE7uVWw4ERUVeBXWOkjGiiDEynmmvbjN754FnnNe/JSWFDzVlWiNJw5HE8D1hj2RaE
 JXkA==
X-Gm-Message-State: AJIora8mHW4e+0BUSmC6VisIIjo4cv/PEKNpizNnpY/pH53WdWArjD/W
 J5wCbouKChO7gSCe+RULpyrL0+OISUnb3kh5Q2A2OJtWMcBDQkrUBWYZA5NqaLGLBBCeJcuznCy
 E4jeJ5nHsbuog02I=
X-Received: by 2002:a5d:440f:0:b0:21d:888b:a65b with SMTP id
 z15-20020a5d440f000000b0021d888ba65bmr17363570wrq.655.1657547716844; 
 Mon, 11 Jul 2022 06:55:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sQcBSF1WN0t72ZglVSiQslVZ3Xs38A/mwVHxR3ubM07DEwj9YOlq0hBqmBeD5F2c6ONw5dYQ==
X-Received: by 2002:a5d:440f:0:b0:21d:888b:a65b with SMTP id
 z15-20020a5d440f000000b0021d888ba65bmr17363542wrq.655.1657547716581; 
 Mon, 11 Jul 2022 06:55:16 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 f12-20020a05600c4e8c00b003a2cf17a894sm11047981wmq.41.2022.07.11.06.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:55:15 -0700 (PDT)
Date: Mon, 11 Jul 2022 14:55:13 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eric Auger <eauger@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/2] arm: enable MTE for QEMU + kvm
Message-ID: <YswrwWVLlhoF2fN6@work-vm>
References: <20220707161656.41664-1-cohuck@redhat.com>
 <YswkdVeESqf5sknQ@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YswkdVeESqf5sknQ@work-vm>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

* Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> * Cornelia Huck (cohuck@redhat.com) wrote:
> > This series makes it possible to enable MTE for kvm guests, if the kernel
> > supports it. Again, tested on the simulator via patiently waiting for the
> > arm64/mte kselftests to finish successfully.
> > 
> > For tcg, turning on mte on the machine level (to get tag memory) stays a
> > requirement. If the new mte cpu feature is not explicitly specified, a tcg
> > vm will get mte depending on the presence of tag memory (just as today).
> > 
> > For kvm, mte stays off by default; this is because migration is not yet
> > supported (postcopy will need an extension of the kernel interface, possibly
> > an extension of the userfaultfd interface), and turning on mte will add a
> > migration blocker.
> 
> My assumption was that a normal migration would need something as well
> to retrieve and place the MTE flags; albeit not atomically.
> 
> > My biggest question going forward is actually concerning migration; I gather
> > that we should not bother adding something unless postcopy is working as well?
> 
> I don't think that restriction is fair on you; just make sure
> postcopy_ram_supported_by_host gains an arch call and fails cleanly;
> that way if anyone tries to enable postcopy they'll find out with a
> clean fail.
> 
> > If I'm not misunderstanding things, we need a way to fault in a page together
> > with the tag; doing that in one go is probably the only way that we can be
> > sure that this is race-free on the QEMU side. Comments welcome :)
> 
> I think it will.
> But, ignoring postcopy for a minute, with KVM how do different types of
> backing memory work - e.g. if I back a region of guest memory with
> /dev/shm/something or a hugepage equivalent, where does the MTE memory
> come from, and how do you set it?

Another case that just came to mind, are the data content optimisations;
we special case all-zero pages, which I guess you still need to transmit
tags for, and the xbzrle page-difference code wouldn't notice
differences in tags.

Dave

> Dave
> 
> > Changes v1->v2: [Thanks to Eric for the feedback!]
> > - add documentation
> > - switch the mte prop to OnOffAuto; this improves the interaction with the
> >   existing mte machine prop
> > - leave mte off for kvm by default
> > - improve tests; the poking in QDicts feels a bit ugly, but seems to work
> > 
> > Cornelia Huck (2):
> >   arm/kvm: add support for MTE
> >   qtests/arm: add some mte tests
> > 
> >  docs/system/arm/cpu-features.rst |  21 +++++
> >  target/arm/cpu.c                 |  18 ++---
> >  target/arm/cpu.h                 |   1 +
> >  target/arm/cpu64.c               | 132 +++++++++++++++++++++++++++++++
> >  target/arm/internals.h           |   1 +
> >  target/arm/kvm64.c               |   5 ++
> >  target/arm/kvm_arm.h             |  12 +++
> >  target/arm/monitor.c             |   1 +
> >  tests/qtest/arm-cpu-features.c   |  77 ++++++++++++++++++
> >  9 files changed, 256 insertions(+), 12 deletions(-)
> > 
> > -- 
> > 2.35.3
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


