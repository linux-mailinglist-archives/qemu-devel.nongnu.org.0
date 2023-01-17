Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3445766E55F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:56:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqAk-0003d6-Vh; Tue, 17 Jan 2023 12:54:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pHqAi-0003cq-T8
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:54:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pHqAh-0005Np-FQ
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:54:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673978094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OjgstlamuylfDiM6J62Gz76c1zI/KKwYNW5GH181734=;
 b=Ty1zIQhJRWzDkJ+BTDCUTgTpXxBgXV8WKi7tNPq/+btoT0vrD8o+9OuCp9TzDm5C4y+V0k
 Yb0oY9d2JEXw/J5i3b6pj0sr0vrnZl95Dwbz2vhfvz0U0U1a77CyIm5yqi3sARGIFndJ0n
 Vqivm9G63b3g3yGOvIDfhNXfjvzIbng=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-365-co_-a-YLM_W5pSUY81Cn2A-1; Tue, 17 Jan 2023 12:54:36 -0500
X-MC-Unique: co_-a-YLM_W5pSUY81Cn2A-1
Received: by mail-wr1-f72.google.com with SMTP id
 i2-20020adfaac2000000b002bc40f98167so5609450wrc.2
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 09:54:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OjgstlamuylfDiM6J62Gz76c1zI/KKwYNW5GH181734=;
 b=Obr5MpvZteTjR5FqltqDIUPJZIq8SyRpNCs8T6OWJ7pSH93bB0FXuhtDJHwg1HNZ5L
 cbMRQJ5KhnuHv1pAstGuqysni47rhnER+UoxYZ9LUg50mpNWvUhbzdzYt01zNzSC08zR
 tOF6xTvP3xXledJdVoQyWFWlv4USS1dQZgRxoqzrXyvLDASJgXyaRc3OgOZTQSb+ZUip
 pmt4Gz7jVfyMDcWtONW0jGIy5O2iLHlVCfQmpHxuXnxveKI4716YmrwpIQGpUIf2xubY
 QK/Cm/d6RJJZp6nLveongsz4ewW0tzL+p5kAiRQRJWSNbpjLlAYyLRVSQPE5BOoVTvcf
 lvRA==
X-Gm-Message-State: AFqh2kpTi+sf5h76gfp1ksAgI1USRyeuH6idAEoW1lezfYBWvieUYdvu
 Q9Nwt+qaQ2X5oUKbwT1uN1CoZQhI3RctjjRbtRtLjw8/X5XYTFARSYBnpVnQH3YG+U74BvUNZWe
 oE2/uH0y7O6pAvvU=
X-Received: by 2002:a05:600c:2281:b0:3da:c07:c5fe with SMTP id
 1-20020a05600c228100b003da0c07c5femr12579118wmf.5.1673978042184; 
 Tue, 17 Jan 2023 09:54:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtJD2UaA7k7LYWPG+ig9ym8aMzvrorUindhCPUVDaIuudtoRe/YEDVWBTedb8WJSzzH/rKfXQ==
X-Received: by 2002:a05:600c:2281:b0:3da:c07:c5fe with SMTP id
 1-20020a05600c228100b003da0c07c5femr12579100wmf.5.1673978041977; 
 Tue, 17 Jan 2023 09:54:01 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b003db0b0cc2afsm2285976wmq.30.2023.01.17.09.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 09:54:01 -0800 (PST)
Date: Tue, 17 Jan 2023 17:53:59 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v4 1/2] arm/kvm: add support for MTE
Message-ID: <Y8bgtwNjXn/icLX5@work-vm>
References: <20230111161317.52250-1-cohuck@redhat.com>
 <20230111161317.52250-2-cohuck@redhat.com>
 <CAFEAcA9BKX+fSEZZbziwTNq5wsshDajuxGZ_oByVZ=gDSYOn9g@mail.gmail.com>
 <Y8bR7xrsCMr5z6xI@work-vm>
 <CAFEAcA-rnb=fSW+ZiZkX7EAgTnmksr4Grow3P=UdQR1yhay4TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-rnb=fSW+ZiZkX7EAgTnmksr4Grow3P=UdQR1yhay4TQ@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Tue, 17 Jan 2023 at 16:51, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > On Wed, 11 Jan 2023 at 16:13, Cornelia Huck <cohuck@redhat.com> wrote:
> > > > +MTE CPU Property
> > > > +================
> > > > +
> > > > +The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
> > > > +presence of tag memory (which can be turned on for the ``virt`` machine via
> > > > +``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
> > > > +proper migration support is implemented, enabling MTE will install a migration
> > > > +blocker.
> > > > +
> > > > +If not specified explicitly via ``on`` or ``off``, MTE will be available
> > > > +according to the following rules:
> > > > +
> > > > +* When TCG is used, MTE will be available iff tag memory is available; i.e. it
> > > > +  preserves the behaviour prior to introduction of the feature.
> > > > +
> > > > +* When KVM is used, MTE will default to off, so that migration will not
> > > > +  unintentionally be blocked.
> > > > +
> > > > +* Other accelerators currently don't support MTE.
> > >
> > > Minor nits for the documentation:
> > > we should expand out "if and only if" -- not everybody recognizes
> > > "iff", especially if they're not native English speakers or not
> > > mathematicians.
> > >
> > > Should we write specifically that in a future QEMU version KVM
> > > might change to defaulting to "on if available" when migration
> > > support is implemented?
> >
> > Please make sure if you do something like that, that the failure
> > is obious; 'on if available' gets messy for things like libvirt
> > and higher level tools detecting features that are available and
> > machines they can migrate to.
> 
> If we have a plan for how this ought to work when we eventually
> implement migration support that's great and we should document
> it. My point is really "we should make sure we don't box ourselves
> into a set of defaults that we regret in the future, eg where
> TCG and KVM always have different defaults forever". If we don't
> have a plan for what the future is, then I'd rather we delayed
> adding MTE-without-migration-support until we've determined that
> plan.
> 
> Though the default for the CPU property is a bit moot, because
> at the machine level we only implement tag memory on the virt
> board, and there we disable it at the machine level (ie the
> machine property 'mte' defaults to 'false').

Oh, if you're disabling it at the machine level that's fine;
with versioned machine types the answer then is to turn it on
at the machine level when it all works, and that keeps the old
machine types with it off, and then VMs migrating with the old
machine type don't get confused.

(Having said that, there are always odd rules around CPU flags and
machine types and what libvirt thinks of them, but I'd ask a libvirt
person (jdenemar) for more details if needed).

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


