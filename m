Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8F72DFAFA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 11:23:35 +0100 (CET)
Received: from localhost ([::1]:40568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krILm-0000G1-4c
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 05:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krIKU-0008Fp-81
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 05:22:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krIKS-0003Ss-Dw
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 05:22:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608546131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=koEPrJXkX++jJWxossQFHTvpGPu79f4cnJs9OGCFK/U=;
 b=VXro0gv4kxsln8lwgthW19rnzQKQhdlYilu6Wc2XkmC3IKXwgu61N+PF+kXEP6rlIXqHLC
 0f9JFJh9c73UjK0agIh/AHlit+MlnbXP0KQ1WuAwd4D3lrvCxpJLNGav4ZDuvILraKxl/c
 UMnjFaf4+LRiVUB6v8qmjN8auGA8WU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-OwVeFLDTO8yRPfGvDYsZrQ-1; Mon, 21 Dec 2020 05:22:07 -0500
X-MC-Unique: OwVeFLDTO8yRPfGvDYsZrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAFEA19251AB;
 Mon, 21 Dec 2020 10:22:05 +0000 (UTC)
Received: from gondolin (ovpn-113-49.ams2.redhat.com [10.36.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04F9860C17;
 Mon, 21 Dec 2020 10:21:56 +0000 (UTC)
Date: Mon, 21 Dec 2020 11:21:54 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] s390x/pci: Fix memory_region_access_valid call
Message-ID: <20201221112154.4dbdc876.cohuck@redhat.com>
In-Reply-To: <79611b57-f88d-00d0-a13b-a9acc1100781@linux.ibm.com>
References: <1608243397-29428-1-git-send-email-mjrosato@linux.ibm.com>
 <1608243397-29428-3-git-send-email-mjrosato@linux.ibm.com>
 <72f4e03f-7208-6af0-4cd2-9715d9f9ec77@linux.ibm.com>
 <20201218120440.36b56e80.cohuck@redhat.com>
 <2c5a2ccb-dbe1-f355-3980-462be1d93942@linux.ibm.com>
 <20201218163206.7b8efa2a.cohuck@redhat.com>
 <52c93c12-b9a4-99ba-186c-4db2e6267b9f@linux.ibm.com>
 <20201218175119.5f43b378.cohuck@redhat.com>
 <608f9aff-965f-62ee-6034-c61f98213200@linux.ibm.com>
 <79611b57-f88d-00d0-a13b-a9acc1100781@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: thuth@redhat.com, Matthew Rosato <mjrosato@linux.ibm.com>, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Dec 2020 09:50:23 +0100
Pierre Morel <pmorel@linux.ibm.com> wrote:

> On 12/18/20 6:05 PM, Pierre Morel wrote:
> >=20
> >=20
> > On 12/18/20 5:51 PM, Cornelia Huck wrote: =20
> >> On Fri, 18 Dec 2020 17:40:50 +0100
> >> Pierre Morel <pmorel@linux.ibm.com> wrote:
> >> =20
> >>> On 12/18/20 4:32 PM, Cornelia Huck wrote: =20
> >>>> On Fri, 18 Dec 2020 15:32:08 +0100
> >>>> Pierre Morel <pmorel@linux.ibm.com> wrote: =20
> >>>>> On 12/18/20 12:04 PM, Cornelia Huck wrote: =20
> >>>>>> On Fri, 18 Dec 2020 10:37:38 +0100
> >>>>>> Pierre Morel <pmorel@linux.ibm.com> wrote: =20
> >>>>>>> On 12/17/20 11:16 PM, Matthew Rosato wrote: =20
> >>>>>>>> In pcistb_service_handler, a call is made to validate that the=
=20
> >>>>>>>> memory
> >>>>>>>> region can be accessed.=C2=A0 However, the call is made using th=
e=20
> >>>>>>>> entire length
> >>>>>>>> of the pcistb operation, which can be larger than the allowed=20
> >>>>>>>> memory
> >>>>>>>> access size (8).=C2=A0 Since we already know that the provided b=
uffer=20
> >>>>>>>> is a
> >>>>>>>> multiple of 8, fix the call to memory_region_access_valid to=20
> >>>>>>>> iterate
> >>>>>>>> over the memory region in the same way as the subsequent call to
> >>>>>>>> memory_region_dispatch_write.
> >>>>>>>>
> >>>>>>>> Fixes: 863f6f52b7 ("s390: implement pci instructions")
> >>>>>>>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> >>>>>>>> --- =20
>=20
> ...snip...
>=20
> >>>> =20
> >>>
> >>> The ops already exist, I thought adding a dedicated callback for s390=
 on
> >>> every regions used by vfio_pci instead of the default.
> >>> But it does not add a lot, just looks cleaner to me. =20
> >>
> >> But we end up here for every pci device, not just for vfio devices,
> >> don't we?
> >>
> >> =20
> >=20
> > Yes, but isn't what is done here?
> >  =20
>=20
> It was not my intention to slow the integration process.
> We can start with this fix and eventually move the code to the callback=
=20
> in another series when/if we all agree.

Yeah, I also fear that we might have been talking past each other. It's
late in the year :)

>=20
> Acked-by: Pierre Morel <pmorel@linux.ibm.com>

Thanks!


