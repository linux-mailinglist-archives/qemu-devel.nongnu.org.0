Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158AC2B5F6D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 13:56:14 +0100 (CET)
Received: from localhost ([::1]:44672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf0Wr-0005Al-6O
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 07:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kf0VZ-0004hC-SG
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:54:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kf0VY-000788-6L
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:54:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605617691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OSMLlxbIdW6jP33g2oct1JppFuoIuX3awH2e6qI22Rc=;
 b=QSrOSc5lNiIXfJMho6If1sWdMbJVO4dO1MnMb/pX1RNaAWGSVO8vvg+YM7remF8yuuzgvg
 zldU5AJfrA5gXf9EN6sFTEAGjrMon16Gi6D7vkMayJkGjpfWrGA+hJIuZlo3/IZ+Yo7BCR
 zXu7u0apRgLZLJVhVrRHPHlAjko+I48=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-_r-n-UxRPImKs1L2mzeCBQ-1; Tue, 17 Nov 2020 07:54:49 -0500
X-MC-Unique: _r-n-UxRPImKs1L2mzeCBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14FB18015AD;
 Tue, 17 Nov 2020 12:54:48 +0000 (UTC)
Received: from gondolin (ovpn-113-115.ams2.redhat.com [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 975115C1CF;
 Tue, 17 Nov 2020 12:54:39 +0000 (UTC)
Date: Tue, 17 Nov 2020 13:54:36 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [RFC PATCH-for-5.2] hw/s390x/pci: Fix endianness issue
Message-ID: <20201117135436.1b644a36.cohuck@redhat.com>
In-Reply-To: <20201117120115.1234994-1-philmd@redhat.com>
References: <20201117120115.1234994-1-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Nov 2020 13:01:15 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Fix an endianness issue reported by Cornelia:
>=20
> > s390x tcg guest on x86, virtio-pci devices are not detected. The
> > relevant feature bits are visible to the guest. Same breakage with
> > different guest kernels.
> > KVM guests and s390x tcg guests on s390x are fine. =20
>=20
> Fixes: 28dc86a0729 ("s390x/pci: use a PCI Group structure")
> Reported-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> RFC because review-only patch, untested
> ---
>  hw/s390x/s390-pci-inst.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 58cd041d17f..cfb54b4d8ec 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -305,7 +305,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintpt=
r_t ra)
>          ClpReqQueryPciGrp *reqgrp =3D (ClpReqQueryPciGrp *)reqh;
>          S390PCIGroup *group;
> =20
> -        group =3D s390_group_find(reqgrp->g);
> +        group =3D s390_group_find(ldl_p(&reqgrp->g));
>          if (!group) {
>              /* We do not allow access to unknown groups */
>              /* The group must have been obtained with a vfio device */

Hmm... when I tested this change on top of 28dc86a0729, it worked; when
tested on top of my s390-fixes branch, I get

operand exception: 0015 ilc:3 [#1] SMP=20
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc3+ #174
Hardware name: QEMU 2964 QEMU (KVM/Linux)
Krnl PSW : 0704d00180000000 00000000001727be (zpci_mod_fc+0x2e/0xf8)
           R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3 CC:1 PM:0 RI:0 EA:3
Krnl GPRS: 000003d080fb8040 8002000000000004 8002000000000004 000003e00000b=
b30
           000003e00000bb2f 0000000040ffffff 000000003efa8804 0000000000000=
002
           000003e00000bb2f 8002000000000004 0000000000000000 000000003f1b4=
400
           000000003f41c000 0000000000000000 000003e00000ba88 000003e00000b=
a20
Krnl Code: 00000000001727ae: e3e0f0980024=09stg=09%r14,152(%r15)
           00000000001727b4: b9040084=09=09lgr=09%r8,%r4
          #00000000001727b8: e310300000d0=09mpcifc=09%r1,0(%r3)
          >00000000001727be: b22200b0=09=09ipm=09%r11
           00000000001727c2: 88b0001c=09=09srl=09%r11,28
           00000000001727c6: 42b0f0a7=09=09stc=09%r11,167(%r15)
           00000000001727ca: eb110018000c=09srlg=09%r1,%r1,24
           00000000001727d0: 42104000=09=09stc=09%r1,0(%r4)
Call Trace:
 [<00000000001727be>] zpci_mod_fc+0x2e/0xf8=20
 [<000000000016d364>] zpci_register_ioat+0x64/0x88=20
 [<0000000000170532>] zpci_dma_init_device+0x13a/0x1b8=20
 [<000000000016e008>] zpci_enable_device+0x48/0x70=20
 [<000000000016e1b2>] zpci_create_device+0x14a/0x170=20
 [<0000000000171224>] clp_add_pci_device+0x504/0x528=20
 [<0000000000170c46>] clp_list_pci+0xf6/0x1d0=20
 [<00000000001712f4>] clp_scan_pci_devices+0x44/0x68=20
 [<00000000011e859e>] pci_base_init+0x12e/0x1a0=20
 [<00000000011ddf92>] do_one_initcall+0x132/0x2e0=20
 [<00000000011de3cc>] kernel_init_freeable+0x28c/0x308=20
 [<0000000000cfc822>] kernel_init+0x22/0x150=20
 [<0000000000d08f60>] ret_from_fork+0x24/0x28=20
INFO: lockdep is turned off.
Last Breaking-Event-Address:
 [<000000000016d35e>] zpci_register_ioat+0x5e/0x88

(Yeah, I know it's not the newest guest kernel.)

This patch probably uncovers further endianness problems in the
following zpci patches. Looking.


