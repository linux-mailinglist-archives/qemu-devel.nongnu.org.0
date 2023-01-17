Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD9366E459
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:03:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHpLC-0000bl-V0; Tue, 17 Jan 2023 12:01:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHpLB-0000b3-9k
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:01:41 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHpL9-0003Eh-IL
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:01:41 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 y3-20020a17090a390300b00229add7bb36so1677796pjb.4
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 09:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rZYOg2f+szhhX3cBVgOIK9JGWCbhOCSqTfu1Pg+gH+Y=;
 b=u7YGpSfziXUPkvB/gafuQpp2n2O9dmMUBX3rWS3KKN6ZokdDcMtvDAYv3XOMw+2h/T
 iD6qSMgkCtx10QxQcDOGuejP4c78ZAdJxc+9+H3z/UfiysUm7BlHsWQHhEOmEGhxpeOy
 7ESUswWmKjB+l8k0BuOHdYNXOTLlVcz+CTtX2hPpLX/r7KZwQBCmP5cEQ2nGx8ON0Lwv
 RqDhVFB3bPkQ+5ryUeOd/zJN+dPcaPhOKlochWNUuWmIlnsk8D6NCtAut3efDsUuE1hS
 5UDDbQJtOdCDuHjRhQFXBYg6orXmCb1JceLkLPScsHA9CiIMQsc8szFu83ccrCdL4t5Q
 s7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rZYOg2f+szhhX3cBVgOIK9JGWCbhOCSqTfu1Pg+gH+Y=;
 b=5+HQdttGySfkrrtyloSwJlFBbaWoXaJH1fziPPBY9BhdACWBMmWh5+NmfINCQ1MAcf
 g6PJHhrKy91cSjJ5mEpiOM+HG4xOh7xus50T5gVHPvabNq65piwlmZZEuFnpqusuGHcE
 00uL6p2nxsuD0h6x+l7r04PXW/adBxssMDJZ8ninuI7LF3IqP8x4vU4h6YrxmaOfi6/x
 m66GD+fY+QdSC4H+JyMtowY2jsMbLXi0Yfb8J9uypwnjrDrLrCDlVm/AqEaBp4zFN/4G
 VWKnrsJuCSqVaksbhBCWyxdIz+CjUr99fjWzIZkgLs1h6UBdZ+4XZRoa8YA6bkJpSd+t
 RZig==
X-Gm-Message-State: AFqh2koY3BmgNpMyjRikIcR0+/qJgyQVBtlvoxxSNXEB3U1PzdLGLqX7
 Cg6vM7zbaH8SSXvlqyHEX4+kDc5h3KQMo/NTbzwPiw==
X-Google-Smtp-Source: AMrXdXuvLav+bgABDopdSuhT0cEIBf3n6Dnbex6flB0fvffB62+ptSfmetDMVHtjKcskfnqLm2gAMuqvU9E8UNfc92o=
X-Received: by 2002:a17:90a:ea92:b0:229:189b:6fee with SMTP id
 h18-20020a17090aea9200b00229189b6feemr340092pjz.221.1673974897929; Tue, 17
 Jan 2023 09:01:37 -0800 (PST)
MIME-Version: 1.0
References: <20230111161317.52250-1-cohuck@redhat.com>
 <20230111161317.52250-2-cohuck@redhat.com>
 <CAFEAcA9BKX+fSEZZbziwTNq5wsshDajuxGZ_oByVZ=gDSYOn9g@mail.gmail.com>
 <Y8bR7xrsCMr5z6xI@work-vm>
In-Reply-To: <Y8bR7xrsCMr5z6xI@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 17:01:26 +0000
Message-ID: <CAFEAcA-rnb=fSW+ZiZkX7EAgTnmksr4Grow3P=UdQR1yhay4TQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm/kvm: add support for MTE
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Eric Auger <eauger@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 17 Jan 2023 at 16:51, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Wed, 11 Jan 2023 at 16:13, Cornelia Huck <cohuck@redhat.com> wrote:
> > > +MTE CPU Property
> > > +================
> > > +
> > > +The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
> > > +presence of tag memory (which can be turned on for the ``virt`` machine via
> > > +``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
> > > +proper migration support is implemented, enabling MTE will install a migration
> > > +blocker.
> > > +
> > > +If not specified explicitly via ``on`` or ``off``, MTE will be available
> > > +according to the following rules:
> > > +
> > > +* When TCG is used, MTE will be available iff tag memory is available; i.e. it
> > > +  preserves the behaviour prior to introduction of the feature.
> > > +
> > > +* When KVM is used, MTE will default to off, so that migration will not
> > > +  unintentionally be blocked.
> > > +
> > > +* Other accelerators currently don't support MTE.
> >
> > Minor nits for the documentation:
> > we should expand out "if and only if" -- not everybody recognizes
> > "iff", especially if they're not native English speakers or not
> > mathematicians.
> >
> > Should we write specifically that in a future QEMU version KVM
> > might change to defaulting to "on if available" when migration
> > support is implemented?
>
> Please make sure if you do something like that, that the failure
> is obious; 'on if available' gets messy for things like libvirt
> and higher level tools detecting features that are available and
> machines they can migrate to.

If we have a plan for how this ought to work when we eventually
implement migration support that's great and we should document
it. My point is really "we should make sure we don't box ourselves
into a set of defaults that we regret in the future, eg where
TCG and KVM always have different defaults forever". If we don't
have a plan for what the future is, then I'd rather we delayed
adding MTE-without-migration-support until we've determined that
plan.

Though the default for the CPU property is a bit moot, because
at the machine level we only implement tag memory on the virt
board, and there we disable it at the machine level (ie the
machine property 'mte' defaults to 'false').

thanks
-- PMM

