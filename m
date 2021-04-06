Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B613355B83
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 20:37:42 +0200 (CEST)
Received: from localhost ([::1]:59362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTqa5-0008OS-2y
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 14:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lTqYx-0007Z3-RJ
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 14:36:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lTqYs-0003Mz-W0
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 14:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617734185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MX+Jp42J4gjcObfF4//n/OvS9S0NO5UVHQR/wiak9sQ=;
 b=NYXojCdUvw/0DsI3xOIemphWuKF4DjaS+epTybZg/ZBt2eEyre6ugMoc9g4BNY8Pcu3o57
 FjU4HD/vHMsAjsvRo6iYq0UEyIsHvhfF6e/VJBpdJWdIOyk8O1+q4TT4SxDPwcFg6prg2D
 USMfL8awtuIIJRue1nrQ2MPZqJofBlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-WOyNwjOJMx26fVe2VOShCg-1; Tue, 06 Apr 2021 14:36:22 -0400
X-MC-Unique: WOyNwjOJMx26fVe2VOShCg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C0198030A1;
 Tue,  6 Apr 2021 18:36:21 +0000 (UTC)
Received: from localhost (unknown [10.40.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D62B65D72E;
 Tue,  6 Apr 2021 18:36:15 +0000 (UTC)
Date: Tue, 6 Apr 2021 20:36:13 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH v3] hw/smbios: support for type 41 (onboard devices
 extended information)
Message-ID: <20210406203613.01cdf294@redhat.com>
In-Reply-To: <20210406074250.hsmm5yrzhfxdwjs4@kamzik.brq.redhat.com>
References: <20210401122658.37842-1-vincent@bernat.ch>
 <20210401225846.411ebd76@redhat.com> <m37dllk939.fsf@bernat.ch>
 <20210401233225.16e572e4@redhat.com>
 <20210406074250.hsmm5yrzhfxdwjs4@kamzik.brq.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Vincent Bernat <vincent@bernat.ch>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Apr 2021 09:42:50 +0200
Andrew Jones <drjones@redhat.com> wrote:

> On Thu, Apr 01, 2021 at 11:32:25PM +0200, Igor Mammedov wrote:
> > On Thu, 01 Apr 2021 23:07:06 +0200
> > Vincent Bernat <vincent@bernat.ch> wrote:
> >  =20
> > >  =E2=9D=A6  1 avril 2021 22:58 +02, Igor Mammedov:
> > >  =20
> > > >> This can be invoked with:
> > > >>=20
> > > >>     $QEMU -netdev user,id=3Dinternet
> > > >>           -device virtio-net-pci,mac=3D50:54:00:00:00:42,netdev=3D=
internet,id=3Dinternet-dev \
> > > >>           -smbios type=3D41,designation=3D'Onboard LAN',instance=
=3D1,kind=3Dethernet,pcidev=3Dinternet-dev   =20
> > > >
> > > > an ACPI alternative was merged recently (current master).
> > > > assigning 'designation=3D' wasn't implemented there, but important =
part
> > > > of giving users control over PCI devices 'eno' index is implemented=
.
> > > >
> > > > When I looked into the issue, smbios way was a bit over-kill for th=
e task
> > > > and didn't really work if hotplug were used.
> > > >
> > > > See, for example how to use new feature:
> > > >  https://www.mail-archive.com/qemu-devel@nongnu.org/msg794164.html =
  =20
> > >=20
> > > It seems simpler this way. I don't think my patch is needed then. =20
> >=20
> > SMBIOS ways is fine for static configs where no hot-plug is involved.
> > Also potentially SMBIOS way may be used by arm/virt board,
> > since acpi-index shares a lot with ACPI PCI hotplug infrastructure
> > and we haven't ported that to arm/virt impl. yet.
> >=20
> > It also won't work for Q35 at the moment, but Julia is working
> > on adding support for ACPI PCI hotplug to it, and once it arrives
> > acpi-index will become available there.
> >=20
> > Perhaps we should also add support for ACPI PCI hotplug to virt/arm,
> > along with Q35.
> > =20
>=20
> What's required of the guest kernel for ACPI PCI hotplug? If there are
> arch-specific aspects to that, then do we know if Linux for AArch64
> has the support?

I could only guess, it could be just a matter turning on HOTPLUG_PCI_ACPI
in Kconfig.


>=20
> Thanks,
> drew


