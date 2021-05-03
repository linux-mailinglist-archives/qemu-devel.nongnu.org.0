Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD183712E6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:19:04 +0200 (CEST)
Received: from localhost ([::1]:50382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUjH-0001RD-QL
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ldUR6-0003Nt-DW
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:00:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ldUR0-0005CM-0a
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620032408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d/pOJWH0v6z3cllqpY5CATkVhwMqVFfZ7Ov93DghIf8=;
 b=KlY+d41eZY9lunNAA3RPlmAm0hKGam2UNDK/dKG56ET2qxXlu0J/u9wQVCxhiMuunujFoq
 wUTakj0FCDri94k30gfYfydw8WjmkRnKvPqr4o2oKOHSJq95xcec9lKQTx8vglGqDrjxQ2
 PnRiX0OqIoMbWL0ZFASVAGlZ2JdjJYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-DdtKXkt6PBC-p1vu1uzC3w-1; Mon, 03 May 2021 05:00:05 -0400
X-MC-Unique: DdtKXkt6PBC-p1vu1uzC3w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 536E71854E25;
 Mon,  3 May 2021 09:00:04 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-109.ams2.redhat.com
 [10.36.113.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FD1977F3D;
 Mon,  3 May 2021 09:00:03 +0000 (UTC)
Date: Mon, 3 May 2021 11:00:00 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/4] pc-bios/s390-ccw: Silence GCC 11 stringop-overflow
 warning
Message-ID: <20210503110000.56f175ac.cohuck@redhat.com>
In-Reply-To: <20210502174836.838816-4-thuth@redhat.com>
References: <20210502174836.838816-1-thuth@redhat.com>
 <20210502174836.838816-4-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun,  2 May 2021 19:48:35 +0200
Thomas Huth <thuth@redhat.com> wrote:

> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
> When building on Fedora 34 (gcc version 11.0.0 20210210) we get:
>=20
>   In file included from pc-bios/s390-ccw/main.c:11:
>   In function =E2=80=98memset=E2=80=99,
>       inlined from =E2=80=98boot_setup=E2=80=99 at pc-bios/s390-ccw/main.=
c:185:5,
>       inlined from =E2=80=98main=E2=80=99 at pc-bios/s390-ccw/main.c:288:=
5:
>   pc-bios/s390-ccw/libc.h:28:14: warning: writing 1 byte into a region of=
 size 0 [-Wstringop-overflow=3D]
>      28 |         p[i] =3D c;
>         |         ~~~~~^~~
>=20
> The offending code is:
>=20
>   memset((char *)S390EP, 0, 6);
>=20
> where S390EP is a const address:
>=20
>   #define S390EP 0x10008
>=20
> The compiler doesn't now how big that pointed area is, so assume its

s/now/know/
s/assume/it assumes that/

> length is zero. This has been reported as BZ#99578 to GCC:
> "gcc-11 -Warray-bounds or -Wstringop-overread warning when accessing a
> pointer from integer literal"
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D99578
>=20
> As this warning does us more harm than good in the BIOS code (where
> lot of direct accesses to low memory are done), silence this warning
> for all BIOS objects.
>=20
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Message-Id: <20210422145911.2513980-1-philmd@redhat.com>
> Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
> [thuth: Use the pre-existing cc-option macro instead of adding a new one]
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
> index f0fe84c9eb..83fb1afb73 100644
> --- a/pc-bios/s390-ccw/Makefile
> +++ b/pc-bios/s390-ccw/Makefile
> @@ -30,6 +30,7 @@ OBJECTS =3D start.o main.o bootmap.o jump2ipl.o sclp.o =
menu.o \
>  =09  virtio.o virtio-scsi.o virtio-blkdev.o libc.o cio.o dasd-ipl.o
> =20
>  QEMU_CFLAGS :=3D -Wall $(filter -W%, $(QEMU_CFLAGS))
> +QEMU_CFLAGS +=3D $(call cc-option,-Werror $(QEMU_CFLAGS),-Wno-stringop-o=
verflow)
>  QEMU_CFLAGS +=3D -ffreestanding -fno-delete-null-pointer-checks -fno-com=
mon -fPIE
>  QEMU_CFLAGS +=3D -fwrapv -fno-strict-aliasing -fno-asynchronous-unwind-t=
ables
>  QEMU_CFLAGS +=3D $(call cc-option, $(QEMU_CFLAGS), -fno-stack-protector)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


