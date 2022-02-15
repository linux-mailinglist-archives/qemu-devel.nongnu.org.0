Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23974B684F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:58:10 +0100 (CET)
Received: from localhost ([::1]:32952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJub2-0004i0-Qs
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:58:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nJuXN-0003Xc-Ph
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:54:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nJuXL-0003Le-7G
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:54:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644918858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=43LlOSf988CWfXlgYN3dSaMcXykgOa+ysVsUH/WmlFc=;
 b=NLTaj71Nt7IzG50gjIK4IuMFQOgc+Q6tsWTvMT7F2ZyN9AplczhGRdt82hCbkI6XDnNpfA
 eEphR7XE8WkDbb+AKb0iMHk2K7aH8d1e4keZ68XEFndZNED7vNkIbuK/9ug7Wbi5yQNDqx
 iyw65M2YfLu4Gz78AB4CY+SzRgqTPHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-vFEve0D0NcKxs7TLiHGlOg-1; Tue, 15 Feb 2022 04:54:15 -0500
X-MC-Unique: vFEve0D0NcKxs7TLiHGlOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BC401006AA3;
 Tue, 15 Feb 2022 09:54:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C986C5F90C;
 Tue, 15 Feb 2022 09:53:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0FDB71800613; Tue, 15 Feb 2022 10:53:58 +0100 (CET)
Date: Tue, 15 Feb 2022 10:53:58 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH RFCv2 2/4] i386/pc: relocate 4g start to 1T where
 applicable
Message-ID: <20220215095358.5qcrgwlasheu63uj@sirius.home.kraxel.org>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-3-joao.m.martins@oracle.com>
 <20220214155318.3ce80da0@redhat.com>
 <fa172a19-5db6-a844-27d7-8497d306024e@oracle.com>
 <20220214163158.4c4b210b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220214163158.4c4b210b@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> I don't know what behavior should be if firmware tries to program
> PCI64 hole beyond supported phys-bits.

Well, you are basically f*cked.

Unfortunately there is no reliable way to figure what phys-bits actually
is.  Because of that the firmware (both seabios and edk2) tries to place
the pci64 hole as low as possible.

The long version:

qemu advertises phys-bits=40 to the guest by default.  Probably because
this is what the first amd opteron processors had, assuming that it
would be a safe default.  Then intel came, releasing processors with
phys-bits=36, even recent (desktop-class) hardware has phys-bits=39.
Boom.

End result is that edk2 uses a 32G pci64 window by default, which is
placed at the first 32G border beyond normal ram.  So for virtual
machines with up to ~ 30G ram (including reservations for memory
hotplug) the pci64 hole covers 32G -> 64G in guest physical address
space, which is low enough that it works on hardware with phys-bits=36.

If your VM has more than 32G of memory the pci64 hole will move and
phys-bits=36 isn't enough any more, but given that you probably only do
that on more beefy hosts which can take >= 64G of RAM and have a larger
physical address space this heuristic works good enough in practice.

Changing phys-bits behavior has been discussed on and off since years.
It's tricky to change for live migration compatibility reasons.

We got the host-phys-bits and host-phys-bits-limit properties, which
solve some of the phys-bits problems.

 * host-phys-bits=on makes sure the phys-bits advertised to the guest
   actually works.  It's off by default though for backward
   compatibility reasons (except microvm).  Also because turning it on
   breaks live migration of machines between hosts with different
   phys-bits.

 * host-phys-bits-limit can be used to tweak phys-bits to
   be lower than what the host supports.  Which can be used for
   live migration compatibility, i.e. if you have a pool of machines
   where some have 36 and some 39 you can limit phys-bits to 36 so
   live migration from 39 hosts to 36 hosts works.

What is missing:

 * Some way for the firmware to get a phys-bits value it can actually
   use.  One possible way would be to have a paravirtual bit somewhere
   telling whenever host-phys-bits is enabled or not.

If edk2 could figure what the usable (guest) physical address space
actually is it could:

  (a) make sure it never crosses that limit, and
  (b) pick better defaults, for example make the pci64 hole larger
      than 32G in case the available address space allows that.

take care,
  Gerd


