Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C9A332BF8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:28:28 +0100 (CET)
Received: from localhost ([::1]:42370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfDf-0004pK-0f
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lJemY-00054g-UY
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:00:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lJemV-0004Dg-7m
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:00:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615305622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WHryAdSDJQegAzyYDr4AIkJe1OcoRqJQ2nzxm1qAR/k=;
 b=fBwk+zDrXvHB124c+DSgcgiRfjWacqvm8Y5bk7xpbrvjENgwqDe7UwwvQQwV0/NGAE4WrO
 0C+xOldeP62hFrv3qI93GGH1IvX13tTdxU/A1OseYj/VcC37caPsAjVYMVMhQ2FxtZaC5y
 qOzdeJV0WKdinvaqRu19FhJdmlxVef8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-rerEaODHNxu7OeAxB1TpNA-1; Tue, 09 Mar 2021 11:00:11 -0500
X-MC-Unique: rerEaODHNxu7OeAxB1TpNA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77458881D44;
 Tue,  9 Mar 2021 16:00:09 +0000 (UTC)
Received: from work-vm (ovpn-112-63.ams2.redhat.com [10.36.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA6FE19C46;
 Tue,  9 Mar 2021 16:00:07 +0000 (UTC)
Date: Tue, 9 Mar 2021 16:00:04 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v5 4/8] vt82c686: Introduce abstract TYPE_VIA_ISA and
 base vt82c686b_isa on it
Message-ID: <YEebhGGvGeWpK5+x@work-vm>
References: <cover.1614719482.git.balaton@eik.bme.hu>
 <07df96112b78673ca191f9a4ffa17bf3a11160f3.1614719482.git.balaton@eik.bme.hu>
 <da48a752-9b2d-6cd8-9603-4cc528fea628@amsat.org>
 <11fb7590-89f3-62e7-48e3-d44226876e78@eik.bme.hu>
 <14cc6696-869d-679a-883f-fbcd30fe6ba1@amsat.org>
 <YEGDLehnK3Vhp56s@yekko.fritz.box>
MIME-Version: 1.0
In-Reply-To: <YEGDLehnK3Vhp56s@yekko.fritz.box>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Gibson (david@gibson.dropbear.id.au) wrote:
> On Thu, Mar 04, 2021 at 11:42:10PM +0100, Philippe Mathieu-Daudé wrote:
> > On 3/4/21 9:16 PM, BALATON Zoltan wrote:
> > > On Thu, 4 Mar 2021, Philippe Mathieu-Daudé wrote:
> > >> On 3/2/21 10:11 PM, BALATON Zoltan wrote:
> > >>> To allow reusing ISA bridge emulation for vt8231_isa move the device
> > >>> state of vt82c686b_isa emulation in an abstract via_isa class.
> > >>>
> > >>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> > >>> ---
> > >>>  hw/isa/vt82c686.c        | 70 ++++++++++++++++++++++------------------
> > >>>  include/hw/pci/pci_ids.h |  2 +-
> > >>>  2 files changed, 40 insertions(+), 32 deletions(-)
> > >>>
> > >>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> > >>> index 72234bc4d1..5137f97f37 100644
> > >>> --- a/hw/isa/vt82c686.c
> > >>> +++ b/hw/isa/vt82c686.c
> > >>> @@ -609,24 +609,48 @@ static const TypeInfo vt8231_superio_info = {
> > >>>  };
> > >>>
> > >>>
> > >>> -OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
> > >>> +#define TYPE_VIA_ISA "via-isa"
> > >>> +OBJECT_DECLARE_SIMPLE_TYPE(ViaISAState, VIA_ISA)
> > >>>
> > >>> -struct VT82C686BISAState {
> > >>> +struct ViaISAState {
> > >>>      PCIDevice dev;
> > >>>      qemu_irq cpu_intr;
> > >>>      ViaSuperIOState *via_sio;
> > >>>  };
> > >>>
> > >>> +static const VMStateDescription vmstate_via = {
> > >>> +    .name = "via-isa",
> > >>
> > >> You changed the migration stream name, so I think we have
> > >> a problem with migration... No clue how to do that properly.
> > > 
> > > I don't think these machines support migration or state description of
> > > vt86c686b was not missing something before these patches that would make
> > > it not work anyway so I did not worry about this too much. I doubt
> > > anybody wants to migrate a fuloong2e machine so this should not be a
> > > problem in practice but maybe you can mention it in the release notes if
> > > you think that would be necessary.
> > 
> > Maybe just add in the description:
> > 
> >  This change breaks migration back compatibility, but
> >  this is not an issue for the Fuloong2E machine.
> 
> Hrm.  If migration was never supported, why is there a vmstate
> description there at all though?
> 
> That said, I don't think breaking compat is a problem: that's only an
> issue where we actually have versioned machine types, which covers
> only pc, pseries, arm virt and a very few others.  I don't think this
> device was used on any of them.

Except 'vt82c686b-usb-uhci' is a generic PCI device that anyone can
instantiate, so it's not actually Fuloong specific.

Dave

> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


