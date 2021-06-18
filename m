Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04A23ACB69
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 14:54:52 +0200 (CEST)
Received: from localhost ([::1]:49442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luE1L-00050D-Gr
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 08:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1luE0Q-0003pN-C3
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 08:53:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1luE0N-000620-Fe
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 08:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624020830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kTnIq/uYASK+pHcDZAakersFlmflhzl8P0SOsHmbtaM=;
 b=MHSlxgZOce8/xMtL3hWD2Ah/J3KoeQXP/s1g5HMJvs2ShaMu+SP+k4+NHkhzMY2esInui7
 6aVAnQzatvUxw+GJIUH+cGKFnVdSfFL6NRg3lEQXM5/0BFsjiBD1GCwNLzNWjRZIZ9yECr
 mch45qKZJfoEF5bwQ1fCa9bNtPW1azc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-riEknsI0Mi2J2V9VApeEeg-1; Fri, 18 Jun 2021 08:53:46 -0400
X-MC-Unique: riEknsI0Mi2J2V9VApeEeg-1
Received: by mail-wm1-f71.google.com with SMTP id
 f22-20020a1c6a160000b029018f49a7efb7so3347227wmc.1
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 05:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kTnIq/uYASK+pHcDZAakersFlmflhzl8P0SOsHmbtaM=;
 b=o5Amxz3u28tOLoiH7XMWrIM3XccPHVOVtcfVPPJKuFCcIOlniteQIlqQ9jjVBr+/uj
 0enlav0bUkBBWPvojq4ZiUYRCi2ahPlbU/0JSgqacxpKuqjTXZ8l9JQXxQV8yKodkhAP
 m2ziuB4FDrwDFPJd13LO7cAVUoT4Wc9MkS4LFxLWfPmgJSGxgdZihTAdIb2z7yyOwjNh
 ER+/fisilJFhu7+u0GNgYyl5TIZy43CUVZFA79wOst5xV//jvdwb4tTY+Q6JTBROfaMt
 0JDAjLY3qrvSeKtMBQ8Fbi3ZjyaZk995Z2HOvnJFXa2QlUKxG6DLnaUYUELNumdDkx9J
 7Qzw==
X-Gm-Message-State: AOAM531SWyIeiUz/5+PTK78hqB9WEyZksbFyZmshilN/pK2RFDTBA0a0
 +0z8MTSOONordufsHiqWuf/1fccPKdoel6uMdtZaYRYGtSo6AeqVgJ1ESHZ3RP7VA7Qe7mIe9bA
 REpPtIM0gFeO7AkI=
X-Received: by 2002:a5d:698a:: with SMTP id g10mr11029074wru.129.1624020825595; 
 Fri, 18 Jun 2021 05:53:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpSX3yl6gkbyvA3ocB6UIbH4ge7oaAbAXRScfG2AlENZXy+SeWJuGU9/IIlND6enF9w6ZEnw==
X-Received: by 2002:a5d:698a:: with SMTP id g10mr11029043wru.129.1624020825380; 
 Fri, 18 Jun 2021 05:53:45 -0700 (PDT)
Received: from redhat.com ([77.126.22.11])
 by smtp.gmail.com with ESMTPSA id k5sm8661223wmk.11.2021.06.18.05.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 05:53:44 -0700 (PDT)
Date: Fri, 18 Jun 2021 08:53:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 00/23] target/i386/sev: Housekeeping (OVMF +
 SEV-disabled binaries)
Message-ID: <20210618085317-mutt-send-email-mst@kernel.org>
References: <20210616204328.2611406-1-philmd@redhat.com>
 <20210617164114-mutt-send-email-mst@kernel.org>
 <20210618134623.5964098e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210618134623.5964098e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Eric Blake <eblake@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 18, 2021 at 01:46:23PM +0200, Igor Mammedov wrote:
> On Thu, 17 Jun 2021 16:42:24 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Wed, Jun 16, 2021 at 10:43:05PM +0200, Philippe Mathieu-Daudé wrote:
> > > Hi,
> > > 
> > > While testing James & Dov patch:
> > > https://www.mail-archive.com/qemu-devel@nongnu.org/msg810571.html
> > > I wasted some time trying to figure out how OVMF was supposed to
> > > behave until realizing the binary I was using was built without SEV
> > > support... Then wrote this series to help other developers to not
> > > hit the same problem.
> > > 
> > > Some SEV patches I was following have been queued on Eduardo's
> > > 'x86-next' tree, so I used his tree as base, and included David and
> > > Connor patches to reduce merge conflicts.
> > > 
> > > Patches 1-16 are SEV related,
> > > patches 17-23 are OVMF related.
> > > 
> > > Special comment for Laszlo: Please don't review this version,
> > > wait for the respin (hoping the SEV cleanup patch get accepted,
> > > the respin will be focused on OVMF).
> > > 
> > > Based-on: https://gitlab.com/ehabkost/qemu/-/commits/x86-next/
> > > Supersedes: <20210610064556.1421620-1-philmd@redhat.com>  
> > 
> > 
> > acpi things
> > 
> > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > do you want to split acpi things out so I can merge?
> I agree they should have been split out.
> (I see in cover letter SEV don't look into series anymore, so
> this APCI patches which are totally irrelevant to SEV weren't
> even unnoticed).
> 
> Perhaps I should take these into my ACPI refactoring series
> (with your acks), which would need to be rebased on top of these.

OK.

> Though I'd drop 19/23 which doesn't look correct to me.

Yes let's drop that one.

> > 
> > > Connor Kuehl (1):
> > >   MAINTAINERS: Add Connor Kuehl as reviewer for AMD SEV
> > > 
> > > Dr. David Alan Gilbert (1):
> > >   target/i386/sev: sev_get_attestation_report use g_autofree
> > > 
> > > Philippe Mathieu-Daudé (21):
> > >   qapi/misc-target: Wrap long 'SEV Attestation Report' long lines
> > >   qapi/misc-target: Group SEV QAPI definitions
> > >   target/i386/monitor: Return QMP error when SEV is disabled in build
> > >   target/i386/cpu: Add missing 'qapi/error.h' header
> > >   target/i386/sev_i386.h: Remove unused headers
> > >   target/i386/sev: Remove sev_get_me_mask()
> > >   target/i386/sev: Mark unreachable code with g_assert_not_reached()
> > >   target/i386/sev: Restrict SEV to system emulation
> > >   target/i386/sev: Move qmp_query_sev_attestation_report() to sev.c
> > >   target/i386/sev: Move qmp_sev_inject_launch_secret() to sev.c
> > >   target/i386/sev: Move qmp_query_sev_capabilities() to sev.c
> > >   target/i386/sev: Move qmp_query_sev_launch_measure() to sev.c
> > >   target/i386/sev: Move qmp_query_sev() & hmp_info_sev() to sev.c
> > >   monitor: Restrict 'info sev' to x86 targets
> > >   hw/i386/acpi-common: Remove unused includes
> > >   hw/i386: Rename acpi-build.c -> acpi-pc.c
> > >   hw/i386: Move pc_madt_cpu_entry() to acpi-pc.c
> > >   hw/acpi: Do not restrict ACPI core routines to x86 architecture
> > >   hw/i386: Introduce X86_FW_OVMF Kconfig symbol
> > >   hw/acpi/Kconfig: Add missing Kconfig dependencies (build error)
> > >   hw/i386/Kconfig: Add missing Kconfig dependency (runtime error)
> > > 
> > >  qapi/misc-target.json               |  78 ++++++++--------
> > >  include/hw/i386/pc.h                |   1 +
> > >  include/monitor/hmp-target.h        |   1 +
> > >  include/monitor/hmp.h               |   1 -
> > >  target/i386/sev_i386.h              |  11 ---
> > >  hw/i386/acpi-common.c               |  45 ----------
> > >  hw/i386/{acpi-build.c => acpi-pc.c} |  39 ++++++++
> > >  hw/i386/pc_sysfw.c                  | 107 ----------------------
> > >  hw/i386/pc_sysfw_ovmf-stubs.c       |  26 ++++++
> > >  hw/i386/pc_sysfw_ovmf.c             | 135 ++++++++++++++++++++++++++++
> > >  target/i386/cpu.c                   |   1 +
> > >  target/i386/monitor.c               |  91 -------------------
> > >  target/i386/sev-stub.c              |  49 +---------
> > >  target/i386/sev-sysemu-stub.c       |  69 ++++++++++++++
> > >  target/i386/sev.c                   | 130 +++++++++++++++++++++------
> > >  MAINTAINERS                         |   8 ++
> > >  hw/acpi/Kconfig                     |   4 +
> > >  hw/acpi/meson.build                 |   3 +-
> > >  hw/i386/Kconfig                     |   5 ++
> > >  hw/i386/meson.build                 |   4 +-
> > >  target/i386/meson.build             |   4 +-
> > >  21 files changed, 443 insertions(+), 369 deletions(-)
> > >  rename hw/i386/{acpi-build.c => acpi-pc.c} (98%)
> > >  create mode 100644 hw/i386/pc_sysfw_ovmf-stubs.c
> > >  create mode 100644 hw/i386/pc_sysfw_ovmf.c
> > >  create mode 100644 target/i386/sev-sysemu-stub.c
> > > 
> > > -- 
> > > 2.31.1
> > >   
> > 


