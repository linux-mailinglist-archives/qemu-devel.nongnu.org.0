Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFA62C2E76
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:28:02 +0100 (CET)
Received: from localhost ([::1]:34788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khc6j-0008GL-9c
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khc4E-00072Z-Fc
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:25:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khc4B-0003EE-MH
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:25:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606238722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ok5pIfHQHqsEEqR8obfH7OlFckc9VYefaJsIeop2kBA=;
 b=GKkOXM+hgoBKVUdrTUN2jLZ5BU3B0ukAOuGkKuC5lRqn4delwwRQc2cU8xPYTR3u8K/NYz
 LmcGLHoJNkuTwwmDQzWE/bKWdeaaZ4eWbAU9q4vSMDy2+a1p5r7+l8PmOuwRC6+UZLn+hP
 Y1wfz6kRl7MrhMgqrIR6xnaRh+MQGQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-XlWiFXExPNiwIz6Dl05VEQ-1; Tue, 24 Nov 2020 12:25:20 -0500
X-MC-Unique: XlWiFXExPNiwIz6Dl05VEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95F1C1006C81;
 Tue, 24 Nov 2020 17:25:18 +0000 (UTC)
Received: from work-vm (ovpn-115-42.ams2.redhat.com [10.36.115.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DD1519C45;
 Tue, 24 Nov 2020 17:25:00 +0000 (UTC)
Date: Tue, 24 Nov 2020 17:24:58 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201124172458.GK3366@work-vm>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <20201110131404.2c0f0d9d@w520.home>
 <20201111124853.5a7fa359.cohuck@redhat.com>
 <20201111151449.GC1421166@stefanha-x1.localdomain>
 <20201111163543.2839e4c7.cohuck@redhat.com>
 <20201116110251.GC96297@stefanha-x1.localdomain>
 <20201116145226.57139a21.cohuck@redhat.com>
 <20201116103015.5dc20ab2@w520.home>
MIME-Version: 1.0
In-Reply-To: <20201116103015.5dc20ab2@w520.home>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>, quintela@redhat.com,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>, "Zeng,
 Xin" <xin.zeng@intel.com>, qemu-devel@nongnu.org,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Alex Williamson (alex.williamson@redhat.com) wrote:
> On Mon, 16 Nov 2020 14:52:26 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
>=20
> > On Mon, 16 Nov 2020 11:02:51 +0000
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >=20
> > > On Wed, Nov 11, 2020 at 04:35:43PM +0100, Cornelia Huck wrote: =20
> > > > On Wed, 11 Nov 2020 15:14:49 +0000
> > > > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > > >    =20
> > > > > On Wed, Nov 11, 2020 at 12:48:53PM +0100, Cornelia Huck wrote:   =
=20
> > > > > > On Tue, 10 Nov 2020 13:14:04 -0700
> > > > > > Alex Williamson <alex.williamson@redhat.com> wrote:     =20
> > > > > > > On Tue, 10 Nov 2020 09:53:49 +0000
> > > > > > > Stefan Hajnoczi <stefanha@redhat.com> wrote:     =20
> > > > > >      =20
> > > > > > > > Device models supported by an mdev driver and their details=
 can be read from
> > > > > > > > the migration_info.json attr. Each mdev type supports one d=
evice model. If a
> > > > > > > > parent device supports multiple device models then each dev=
ice model has an
> > > > > > > > mdev type. There may be multiple mdev types for a single de=
vice model when they
> > > > > > > > offer different migration parameters such as resource capac=
ity or feature
> > > > > > > > availability.
> > > > > > > >=20
> > > > > > > > For example, a graphics card that supports 4 GB and 8 GB de=
vice instances would
> > > > > > > > provide gfx-4GB and gfx-8GB mdev types with memory=3D4096 a=
nd memory=3D8192
> > > > > > > > migration parameters, respectively.       =20
> > > > > > >=20
> > > > > > >=20
> > > > > > > I think this example could be expanded for clarity.  I think =
this is
> > > > > > > suggesting we have mdev_types of gfx-4GB and gfx-8GB, which e=
ach
> > > > > > > implement some common device model, ie. com.gfx/GPU, where th=
e
> > > > > > > migration parameter 'memory' for each defaults to a value mat=
ching the
> > > > > > > type name.  But it seems like this can also lead to some comb=
inatorial
> > > > > > > challenges for management tools if these parameters are writa=
ble.  For
> > > > > > > example, should a management tool create a gfx-4GB device and=
 change to
> > > > > > > memory parameter to 8192 or a gfx-8GB device with the default=
 parameter?     =20
> > > > > >=20
> > > > > > I would expect that the mdev types need to match in the first p=
lace.
> > > > > > What role would the memory=3D parameter play, then? Allowing gf=
x-4GB to
> > > > > > have memory=3D8192 feels wrong to me.     =20
> > > > >=20
> > > > > Yes, I expected these mdev types to only accept a fixed "memory" =
value,
> > > > > but there's nothing stopping a driver author from making "memory"=
 accept
> > > > > any value.   =20
> > > >=20
> > > > I'm wondering how useful the memory parameter is, then. The layer
> > > > checking for compatibility can filter out inconsistent settings, bu=
t
> > > > why would we need to express something that is already implied in t=
he
> > > > mdev type separately?   =20
> > >=20
> > > To avoid tying device instances to specific mdev types. An mdev type =
is
> > > a device implementation, but the goal is to enable migration between
> > > device implementations (new/old or completely different
> > > implementations).
> > >=20
> > > Imagine a new physical device that now offers variable memory because
> > > users found the static mdev types too constraining.  How do you migra=
te
> > > back and forth between new and old physical devices if the migration
> > > parameters don't describe the memory size? Migration parameters make =
it
> > > possible. Without them the management tool needs to hard-code knowled=
ge
> > > of specific mdev types that support migration. =20
> >=20
> > But doesn't the management tool *still* need to keep hardcoded
> > information about what the value of that memory parameter was for an
> > existing mdev type? If we have gfx-variable with a memory parameter,
> > fine; but if the target is supposed to accept a gfx-4GB device, it
> > should simply instantiate a gfx-4GB device.
> >=20
> > I'm getting a bit worried about the complexity of the checking that
> > management software is supposed to perform. Is it really that bad to
> > restrict the models to a few, well-defined ones? Especially in the mdev
> > case, where we have control about what is getting instantiated?
>=20
> This is exactly what I was noting with the combinatorial challenges of
> the management tool.  If a vendor chooses to use a generic base device
> model which they modify with parameters to match an assortment of mdev
> types, then management tools will need to match every mdev type
> implementing that device model to determine if compatible parameters
> exist.  OTOH, the vendor could choose to create a device model that
> specifically describes a single configuration of known parameters.
>=20
> For example, mdev type gfx-4GB might be a device model com.gfx/GPU with
> a fixed memory parameter of 4GB or it could be a device model
> com.gfx/GPU-4G with no additional parameter.  The hard part is when the
> vendor offers an mdev type gfx-varGB with device model com.gfx/GPU and
> available memory options of 1GB, 2GB, 4GB, 8GB.  At that point a
> management tool might decide to create a gfx-varGB device instance and
> tune the memory parameter or create a gfx-4GB instance, either would be
> correct and we've expressed no preference for one or the other.  Thanks,

What you've described here is exactly what happens with QEMU/libvirts
confusion of CPU models.  Both QEMU and Libvirt have their idea of what
a named CPU model means and then add/subtract flags to get what they
want.
When libvirt wants a CPU model that doesn't quite match what it has
(e.g. a host-compatibility thing where the host is a CPU it didn't know)
it's heuristics to either start from above and remove things or start
from below and add them.

Dave

> Alex
--=20
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


