Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D931B2307
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Apr 2020 11:40:36 +0200 (CEST)
Received: from localhost ([::1]:54740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQpOM-0004xb-Ug
	for lists+qemu-devel@lfdr.de; Tue, 21 Apr 2020 05:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36944)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1jQpNG-0004Wc-EK
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 05:39:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1jQpND-0007mH-II
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 05:39:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56010
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jQpND-0007kw-4j
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 05:39:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587461962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ddot2fWszCCRots0kT1Ggp/Dov+YWtgUFgAuYlFU0Jk=;
 b=JW0EXciqLWJWrnT/v7AC1nfzHcnM+48Su383ytJSl6jlrrFyT+zDgV3D3PZ5QP/SF/LAkf
 778c9D2267JsURI1oZuuA1zd8r5KPvaRfy3BzbtjKsE0TjeDmz9cUxaWgqrDnQOOSYFdFC
 WoK8jXbLRb0dKQQHqfTC9EBlEtyZx5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-IHVa96aiPKSBpnzG7QbApA-1; Tue, 21 Apr 2020 05:39:20 -0400
X-MC-Unique: IHVa96aiPKSBpnzG7QbApA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20C338018A3;
 Tue, 21 Apr 2020 09:39:19 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D2105C1B2;
 Tue, 21 Apr 2020 09:39:16 +0000 (UTC)
Message-ID: <69e5bb5700bf80bf90e5533f57361c9f30a88cb9.camel@redhat.com>
Subject: Re: [PATCH v2 01/16] nvme: fix pci doorbell size calculation
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>, Klaus
 Jensen <its@irrelevant.dk>, qemu-block@nongnu.org
Date: Tue, 21 Apr 2020 12:39:14 +0300
In-Reply-To: <6570b2a5-7173-38f9-725d-394c0e5dac8d@redhat.com>
References: <20200415130159.611361-1-its@irrelevant.dk>
 <20200415130159.611361-2-its@irrelevant.dk>
 <6570b2a5-7173-38f9-725d-394c0e5dac8d@redhat.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 03:31:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Javier Gonzalez <javier.gonz@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2020-04-15 at 15:13 +0200, Philippe Mathieu-Daud=C3=A9 wrote:
> On 4/15/20 3:01 PM, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > The size of the BAR is 0x1000 (main registers) + 8 bytes for each
> > queue. Currently, the size of the BAR is calculated like so:
> >=20
> >      n->reg_size =3D pow2ceil(0x1004 + 2 * (n->num_queues + 1) * 4);
> >=20
> > Since the 'num_queues' parameter already accounts for the admin queue,
> > this should in any case not need to be incremented by one. Also, the
> > size should be initialized to (0x1000).
> >=20
> >      n->reg_size =3D pow2ceil(0x1000 + 2 * n->num_queues * 4);
> >=20
> > This, with the default value of num_queues (64), we will set aside room
> > for 1 admin queue and 63 I/O queues (4 bytes per doorbell, 2 doorbells
> > per queue).
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> >   hw/block/nvme.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index d28335cbf377..5b5f75c9d29e 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -43,6 +43,9 @@
> >   #include "trace.h"
> >   #include "nvme.h"
> >  =20
> > +#define NVME_REG_SIZE 0x1000
> > +#define NVME_DB_SIZE  4
> > +
> >   #define NVME_GUEST_ERR(trace, fmt, ...) \
> >       do { \
> >           (trace_##trace)(__VA_ARGS__); \
> > @@ -1345,7 +1348,9 @@ static void nvme_realize(PCIDevice *pci_dev, Erro=
r **errp)
> >       pcie_endpoint_cap_init(pci_dev, 0x80);
> >  =20
> >       n->num_namespaces =3D 1;
> > -    n->reg_size =3D pow2ceil(0x1004 + 2 * (n->num_queues + 1) * 4);
> > +
> > +    /* num_queues is really number of pairs, so each has two doorbells=
 */
> > +    n->reg_size =3D pow2ceil(NVME_REG_SIZE + 2 * n->num_queues * NVME_=
DB_SIZE);
>=20
> Unrelated to this change, but it would be cleaner to initialize reg_size=
=20
> using MAX_NUM_QUEUES, then in the I/O handler log GUEST_ERROR when=20
> registers > n->num_queues accessed. This would model closer to the hardwa=
re.
Agree.

Also keep in mind that NVME_DB_SIZE is configurable by setting the doorbell=
 stride.
(but this is optional, so currently this code is OK)

Other than that,
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

>=20
> >       n->ns_size =3D bs_size / (uint64_t)n->num_namespaces;
> >  =20
> >       n->namespaces =3D g_new0(NvmeNamespace, n->num_namespaces);
> >=20
>=20
>=20


Best regards,
=09Maxim Levitsky



