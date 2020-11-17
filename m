Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F23B2B62E6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 14:33:42 +0100 (CET)
Received: from localhost ([::1]:50566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf177-0004X3-2g
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 08:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kf15A-000418-EO
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:31:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kf156-0004QK-55
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:31:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605619894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3IvPxRL2zPQKwNCV+Tg+eV9MkORWP3MQcQUnpyOEHc=;
 b=LNu3pJDliNIyMB8k6SlJBn+jZs7IAwQ1xYdaJGt9oZa3jkODbo8befTOMnuPAT1x1VK5W7
 E6r/xFCribfjcRGIChIJLPIHmJQvWioBtAu3AZKOyHRTxBVMzE5GqRZsS/EtwV13OLiZye
 oWe6AHFCygYN4P6z+1ijQwzGG3S58xc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-HnIUsIFlMgy_QnLNCTTvBA-1; Tue, 17 Nov 2020 08:31:30 -0500
X-MC-Unique: HnIUsIFlMgy_QnLNCTTvBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E929E8018A1;
 Tue, 17 Nov 2020 13:31:28 +0000 (UTC)
Received: from gondolin (ovpn-113-115.ams2.redhat.com [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FD8410013D0;
 Tue, 17 Nov 2020 13:31:19 +0000 (UTC)
Date: Tue, 17 Nov 2020 14:31:17 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [RFC PATCH-for-5.2] hw/s390x/pci: Fix endianness issue
Message-ID: <20201117143117.4b05db78.cohuck@redhat.com>
In-Reply-To: <d945234d-4725-9928-11cb-f34606c8524c@linux.ibm.com>
References: <20201117120115.1234994-1-philmd@redhat.com>
 <CAFEAcA-c3hw2w23OR0moKDYuvyD3O=Bqjp3fiid0byH7K+nr-Q@mail.gmail.com>
 <d945234d-4725-9928-11cb-f34606c8524c@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGll?= =?UTF-8?B?dS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Nov 2020 14:23:57 +0100
Pierre Morel <pmorel@linux.ibm.com> wrote:

> On 11/17/20 2:00 PM, Peter Maydell wrote:
> > On Tue, 17 Nov 2020 at 12:03, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote: =20
> >>
> >> Fix an endianness issue reported by Cornelia:
> >> =20
> >>> s390x tcg guest on x86, virtio-pci devices are not detected. The
> >>> relevant feature bits are visible to the guest. Same breakage with
> >>> different guest kernels.
> >>> KVM guests and s390x tcg guests on s390x are fine. =20
> >>
> >> Fixes: 28dc86a0729 ("s390x/pci: use a PCI Group structure")
> >> Reported-by: Cornelia Huck <cohuck@redhat.com>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >> RFC because review-only patch, untested
> >> ---
> >>   hw/s390x/s390-pci-inst.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> >> index 58cd041d17f..cfb54b4d8ec 100644
> >> --- a/hw/s390x/s390-pci-inst.c
> >> +++ b/hw/s390x/s390-pci-inst.c
> >> @@ -305,7 +305,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uin=
tptr_t ra)
> >>           ClpReqQueryPciGrp *reqgrp =3D (ClpReqQueryPciGrp *)reqh;
> >>           S390PCIGroup *group;
> >>
> >> -        group =3D s390_group_find(reqgrp->g);
> >> +        group =3D s390_group_find(ldl_p(&reqgrp->g)); =20
> >=20
> > 'g' in the ClpReqQueryPciGrp struct is a uint32_t, so
> > adding the ldl_p() will have no effect unless (a) the
> > structure is not 4-aligned and (b) the host will fault on
> > unaligned accesses, which isn't the case for x86 hosts.
> >=20
> > Q: is this struct really in host order, or should we
> > be using ldl_le_p() or ldl_be_p() and friends here and
> > elsewhere?
> >=20
> > thanks
> > -- PMM
> >  =20
>=20
> Hi, I think we better modify the structure here, g should be a byte.
>=20
> Connie, can you please try this if it resolves the issue?
>=20
> diff --git a/hw/s390x/s390-pci-inst.h b/hw/s390x/s390-pci-inst.h
> index fa3bf8b5aa..641d19c815 100644
> --- a/hw/s390x/s390-pci-inst.h
> +++ b/hw/s390x/s390-pci-inst.h
> @@ -146,7 +146,8 @@ typedef struct ClpReqQueryPciGrp {
>       uint32_t fmt;
>       uint64_t reserved1;
>   #define CLP_REQ_QPCIG_MASK_PFGID 0xff
> -    uint32_t g;
> +    uint32_t g0 :24;
> +    uint32_t g  :8;
>       uint32_t reserved2;
>       uint64_t reserved3;
>   } QEMU_PACKED ClpReqQueryPciGrp;
>=20

No, same crash... I fear there are more things broken wrt endianness.


