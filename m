Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58546CBF07
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 14:29:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph8Ro-0002ay-EG; Tue, 28 Mar 2023 08:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ph8Rk-0002am-JY
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:29:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ph8Rj-0004zP-3N
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680006542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pbRSlH4QYU18m0aASejFYN2XkP7Q10CTXDHVjbrOtb8=;
 b=IReYS6OZPGp1QVAIdVnTSzXs2JmjVv5UrvwNsK/fX4XizA4MaHW2Kh94Cado0p5ZoDDLAX
 p7DTNR4w746m8A5aLOpwHSdZGwdPRNtZDu5Djv7s7A0giceG7EFDPgJ1zM1LOeNUvK1GAG
 Mz1FUlPrt3mT0PjJ2jZkcSpwvEjZhvo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-z7o4Q0DJMc-nXSvvvSLRLg-1; Tue, 28 Mar 2023 08:29:00 -0400
X-MC-Unique: z7o4Q0DJMc-nXSvvvSLRLg-1
Received: by mail-ed1-f72.google.com with SMTP id
 c1-20020a0564021f8100b004acbe232c03so17042524edc.9
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 05:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680006539;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pbRSlH4QYU18m0aASejFYN2XkP7Q10CTXDHVjbrOtb8=;
 b=n0AcQ5unkepfztVGOXxknpKl3Ko7PZX27mtTeAsxIBIbRzsQTlG5x3EKZrDlYOniMD
 SxQP5+SkeVrVCWtUZBrpWlG/r2GRUvhmCvLjLeD4855L+VAO4zdSBcgNH8+qOs7k8ZNW
 k63u0unoAF2DOgZQVDpfg+EVWb+2lYOg5aztTiMe2t6vU1jwHJ1AMpzz7fzQdsfwN9tz
 dgcOx0+5ElHaNN7iSdsUxdYymc4GPZrY7KKcZPgZ3NtdUidvM4ZQWTxc1LCZXI4FGY4r
 LklQoevaq94p5COJ+zNl0MPvKhOKIRw5/VNN8U8wD/u72fZRKSn7GuWq9TZWBRPzHkmQ
 xZAA==
X-Gm-Message-State: AAQBX9dVMBsOvPRUZEkX8w5NZnmqLmX8Zd/DObRmZ/T+k6CM9J3M7GzX
 OOD10Agb8vRtwHVfNwp6Wi4sAaT24LCjviuDUpyHkIkLa6TL68/LQE5J6MCXRe87n+3S5XDUovI
 6+JwUKT9eK/hAAj0=
X-Received: by 2002:aa7:cd9a:0:b0:4ac:b687:f57e with SMTP id
 x26-20020aa7cd9a000000b004acb687f57emr14802973edv.1.1680006539012; 
 Tue, 28 Mar 2023 05:28:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350a7wVjAM70Ra1kLszCDwocg+P5Rwh5jm2HiVB9DfEg+i4g/ybcPBMHPKyAsIvqVpPp/a9NhEA==
X-Received: by 2002:aa7:cd9a:0:b0:4ac:b687:f57e with SMTP id
 x26-20020aa7cd9a000000b004acb687f57emr14802958edv.1.1680006538776; 
 Tue, 28 Mar 2023 05:28:58 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 a25-20020a50c319000000b004bc15a440f1sm15943802edb.78.2023.03.28.05.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 05:28:58 -0700 (PDT)
Date: Tue, 28 Mar 2023 14:28:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 2/6] bios-tables-test: use 128M numa nodes on aarch64
Message-ID: <20230328142857.6f752969@imammedo.users.ipa.redhat.com>
In-Reply-To: <ZCLZAWYrPOIxCXup@redhat.com>
References: <20230316095432.1514080-1-kraxel@redhat.com>
 <20230316095432.1514080-3-kraxel@redhat.com>
 <20230328140338.7afa05e3@imammedo.users.ipa.redhat.com>
 <ZCLZAWYrPOIxCXup@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 28 Mar 2023 13:09:37 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Tue, Mar 28, 2023 at 02:03:38PM +0200, Igor Mammedov wrote:
> > On Thu, 16 Mar 2023 10:54:28 +0100
> > Gerd Hoffmann <kraxel@redhat.com> wrote:
> >  =20
> > > Recent edk2 versions don't boot with very small numa nodes.
> > > Bump the size from 64M to 128M.
> > >=20
> > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > > ---
> > >  tests/qtest/bios-tables-test.c         |   6 +++--- =20
> >  =20
> > >  tests/data/acpi/virt/SRAT.acpihmatvirt | Bin 240 -> 240 bytes
> > >  tests/data/acpi/virt/SSDT.memhp        | Bin 1817 -> 1817 bytes =20
> > binary blob updates should be in a separate patch =20
>=20
> Won't that break git bisect if it lands on the commit with the
> bios-tables-test.c change and is thus missing the corresponding
> blob change ?
nope, before change is introduced the affected blobs are white-listed
(see patch 1/6 (btw it should be fixed to inl, all affected blobs))=20
and the patch updating blobs also may cleanup whitelist as well
or do it in separate patch (but it's usually done at  the same time).

The process is described in at the top of tests/qtest/bios-tables-test.c

>=20
> >=20
> > with this fixed:
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > =20
> >  =20
> > >  3 files changed, 3 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables=
-test.c
> > > index 76d510091177..873358943784 100644
> > > --- a/tests/qtest/bios-tables-test.c
> > > +++ b/tests/qtest/bios-tables-test.c
> > > @@ -1679,9 +1679,9 @@ static void test_acpi_virt_tcg_acpi_hmat(void)
> > >      test_acpi_one(" -machine hmat=3Don"
> > >                    " -cpu cortex-a57"
> > >                    " -smp 4,sockets=3D2"
> > > -                  " -m 256M"
> > > -                  " -object memory-backend-ram,size=3D64M,id=3Dram0"
> > > -                  " -object memory-backend-ram,size=3D64M,id=3Dram1"
> > > +                  " -m 384M"
> > > +                  " -object memory-backend-ram,size=3D128M,id=3Dram0"
> > > +                  " -object memory-backend-ram,size=3D128M,id=3Dram1"
> > >                    " -object memory-backend-ram,size=3D128M,id=3Dram2"
> > >                    " -numa node,nodeid=3D0,memdev=3Dram0"
> > >                    " -numa node,nodeid=3D1,memdev=3Dram1"
> > > diff --git a/tests/data/acpi/virt/SRAT.acpihmatvirt b/tests/data/acpi=
/virt/SRAT.acpihmatvirt
> > > index 691ef56e34bc84509270db316d908f5979c209bb..6fe55dd7d07fef0f8fe16=
a209e96a89dd48ca240 100644
> > > GIT binary patch
> > > delta 67
> > > zcmeys_<@ltILI;N0|NsC^R$Uvjf@-<d*mlxmepX?U;>JPK>(EIfYJ<%Fb0qY0P4I6
> > > AJ^%m!
> > >=20
> > > delta 59
> > > zcmeys_<@ltILI;N0|NsC^Qwtljf^Z4d*l^dfLst@flv$#j4%d}X4GJsxL6ecZ+{66
> > >=20
> > > diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/S=
SDT.memhp
> > > index 2fcfc5fda955dc4ba78a5f4116eed99ec7202fbd..ef93c44464f1fe38f7e5b=
abd5d67f345cc6363a6 100644
> > > GIT binary patch
> > > delta 22
> > > dcmbQqH<OPmIM^jblAVEpap^`bUUsI7&Hz1t1wsG-
> > >=20
> > > delta 22
> > > dcmbQqH<OPmIM^jblAVEpv2i08FFVs$X8=3D5?1wsG-
> > >  =20
> >=20
> >  =20
>=20
> With regards,
> Daniel


