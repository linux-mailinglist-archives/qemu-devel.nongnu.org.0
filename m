Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7195368F9C1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 22:32:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPs1h-0002D7-1Z; Wed, 08 Feb 2023 16:30:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pPs1f-0002Bw-5f
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:30:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pPs1c-0003ka-CL
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:30:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675891843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NXLuqRNOmPTFx/KUUmoCZ9AHaL0UUWEWPM32EnhjBBk=;
 b=brwv0ME7tLI8KSEyow+PRq5azyP6c9qe+Qlr/tAEb/17Q3a7Bs3EpzroCt7pA4/eOSBHB/
 eAoJ8/EiNuXuIWjUSALR/u6onUBTnvONEi2P9FbCNiSIUoySLH2H/lPYaLDO31yLp2DZoo
 eQH5bA5AJnCW+rMO3vPwlWW3osLhK1k=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-xKzK3pX6NkysBsZNtqKQ8w-1; Wed, 08 Feb 2023 16:30:42 -0500
X-MC-Unique: xKzK3pX6NkysBsZNtqKQ8w-1
Received: by mail-io1-f70.google.com with SMTP id
 d8-20020a6b6e08000000b00722d8d9c432so12082343ioh.19
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 13:30:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NXLuqRNOmPTFx/KUUmoCZ9AHaL0UUWEWPM32EnhjBBk=;
 b=FNVH5rxF+TUmKQ0AuDaWxZ8OSQ8PT9Hx+Owzp35lhuK/HgDczCuv7yI1ic7cqcZmNL
 s3oSazH9s5oTRxyUa6YoYZArAi43DIx7b29pmEdJEX5LO2w5hOOETV7vuIEf3I5Fx2dQ
 QXciGiC6IrrTJSHd7pKnuc7S9aYSgLzASz00lSjMtJ1rFdvIrZkgEpboesUuyXG/dNjs
 83O87GCfLc8O8onDUXybiBo2faZdjdcxEXKHbY/Mrj/BZu+KRoSJmzV+CsfEY52Y7nLz
 sDP6MvYGAuHr+Ig80m58IVsUUSrfvLDJyyTHf0AjposgCrO4T+aLka+T9hgZpG6r6rL9
 0/Fw==
X-Gm-Message-State: AO0yUKUybeQtpBgElkzPYUPkB691mJS/hF6YBcRzxoJtGcAVnIyKhdM1
 ALFkEvqbJzuu1K4RKnF9jn2BErP7a0nZGK3Ort9l8hIK00dA44YB05A2d3zAnDqQ9GqJ4NOrKEd
 fjYsxH4WsEYsDPc8=
X-Received: by 2002:a5e:a505:0:b0:734:2621:58e2 with SMTP id
 5-20020a5ea505000000b00734262158e2mr6169417iog.20.1675891841234; 
 Wed, 08 Feb 2023 13:30:41 -0800 (PST)
X-Google-Smtp-Source: AK7set+O2Bi01XdSq1oExw3/UB7cKD9pBBCLxcHdffcVhuQQijs1bvRaduk2xLzLU9eL9ecFoZZO3A==
X-Received: by 2002:a5e:a505:0:b0:734:2621:58e2 with SMTP id
 5-20020a5ea505000000b00734262158e2mr6169404iog.20.1675891840997; 
 Wed, 08 Feb 2023 13:30:40 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 v11-20020a02cbab000000b003a8032371fcsm5814513jap.100.2023.02.08.13.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 13:30:40 -0800 (PST)
Date: Wed, 8 Feb 2023 14:30:38 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Cc: QEMU Devel Mailing List <qemu-devel@nongnu.org>, =?UTF-8?B?Q8OpZHJp?=
 =?UTF-8?B?Yw==?= Le Goater <clg@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>
Subject: Re: [PATCH v2 15/23] vfio-user: forward msix BAR accesses to server
Message-ID: <20230208143038.010498c2.alex.williamson@redhat.com>
In-Reply-To: <A4B80A84-DD5D-4B33-AF63-B5F2E221A417@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
 <0ad69e4ea3d1f37246ce5e32ba833d6c871e99b1.1675228037.git.john.g.johnson@oracle.com>
 <20230206133327.3b254677.alex.williamson@redhat.com>
 <A4B80A84-DD5D-4B33-AF63-B5F2E221A417@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Wed, 8 Feb 2023 06:38:30 +0000
John Johnson <john.g.johnson@oracle.com> wrote:

> > On Feb 6, 2023, at 12:33 PM, Alex Williamson <alex.williamson@redhat.co=
m> wrote:
> >=20
> > On Wed,  1 Feb 2023 21:55:51 -0800
> > John Johnson <john.g.johnson@oracle.com> wrote:
> >  =20
> >> Server holds device current device pending state
> >> Use irq masking commands in socket case
> >>=20
> >> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >> ---
> >> hw/vfio/pci.h                 |  1 +
> >> include/hw/vfio/vfio-common.h |  3 ++
> >> hw/vfio/ccw.c                 |  1 +
> >> hw/vfio/common.c              | 26 ++++++++++++++++++
> >> hw/vfio/pci.c                 | 23 +++++++++++++++-
> >> hw/vfio/platform.c            |  1 +
> >> hw/vfio/user-pci.c            | 64 +++++++++++++++++++++++++++++++++++=
++++++++
> >> 7 files changed, 118 insertions(+), 1 deletion(-)
> >>=20
> >> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> >> index 4f70664..d3e5d5f 100644
> >> --- a/hw/vfio/pci.h
> >> +++ b/hw/vfio/pci.h
> >> @@ -113,6 +113,7 @@ typedef struct VFIOMSIXInfo {
> >>     uint32_t table_offset;
> >>     uint32_t pba_offset;
> >>     unsigned long *pending;
> >> +    MemoryRegion *pba_region;
> >> } VFIOMSIXInfo;
> >>=20
> >> /*
> >> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-comm=
on.h
> >> index bbc4b15..2c58d7d 100644
> >> --- a/include/hw/vfio/vfio-common.h
> >> +++ b/include/hw/vfio/vfio-common.h
> >> @@ -143,6 +143,7 @@ typedef struct VFIODevice {
> >>     bool ram_block_discard_allowed;
> >>     bool enable_migration;
> >>     bool use_regfds;
> >> +    bool can_mask_irq; =20
> >=20
> > How can this be a device level property?  vfio-pci (kernel) supports
> > masking of INTx.  It seems like there needs to be a per-index info or
> > probe here to to support this.
> >  =20
>=20
> 	It is only used for MSIX masking.  MSI masking is done with
> config space stores, and vfio-kernel and vfio-user handle them the
> same by forwarding the config space writes to the server so it can
> mask interrupts.

I suppose this does slip through on vfio-kernel, though support via
SET_IRQS would really be the uAPI mechanism we'd expect to use for
masking, just as it is for enabling/disabling MSI.  MSI is not well
used enough to have flushed that out and it seems harmless, but is not
the intended API.

> 	MSIX is trickier because the mask bits are in a memory region.
> vfio-kernel doesn=E2=80=99t support SET_IRQS on MSIX vectors, so if the h=
ost
> doesn=E2=80=99t allow client mapping of the MSIX table to do the masking,=
 vfio
> switches a masked vector=E2=80=99s event FD destination from KVM to QEMU,=
 then
> uses the QEMU PCI emulation to mask the vector.

Lack of support for MSIX ACTION_[UN]MASK is not an API limitation, it's
an implementation issue in the kernel.  Same for MSI.  I believe this
is resolved now, that there are mask/unmask APIs available within the
kernel, as well as mechanisms to avoid the NORESIZE behavior now, so
the intention would be to implement that support, along with a
mechanism for the user to know the support is present.  We already have
that for NORESIZE via IRQ_INFO, so I suspect the right answer might be
to add a new VFIO_IRQ_INFO_MSI_MASK to advertise masking support.
=20
> 	vfio-user has to use messages to mask MSIX vectors, since there
> is no host config space to map.  I originally forwarded the MSIX table
> writes to the server to do the masking, but the feedback on the vfio-user
> server changes was to add SET_IRQS support.

Which is what I'm describing above, QEMU should know via the VFIO uAPI
whether MSI/X masking is supported and use that to configure the code
to make use of it rather than some inferred value based on the
interface type.  Thanks,

Alex


