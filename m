Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17510743EE
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 05:26:08 +0200 (CEST)
Received: from localhost ([::1]:55494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqUOM-0003Uu-NK
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 23:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40240)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alxndr@bu.edu>) id 1hqUMH-0004Hc-6q
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 23:23:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alxndr@bu.edu>) id 1hqUMG-0001r1-9Z
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 23:23:57 -0400
Received: from mail-co1nam04on070e.outbound.protection.outlook.com
 ([2a01:111:f400:fe4d::70e]:20866
 helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alxndr@bu.edu>) id 1hqUMG-0001qN-3T
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 23:23:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjHIqvUi++gOIGOXU2ImvENfsMMLPlJGDwrZGdGPgXYRvTfsZ/QpDm3IUWdORpuVxrQQ8xTNv/6e+kYw4+IjvL8JuawNLsb9yLqKCOXoW4Y0P4LH80wl0TCGCmsNXmLxAjSuJvn//STcyXTFbH4QmhD0Fx9k25/FcWWWGyVuwI2WqmbsPoLG34HaOcjrJTsS3828QC1Tm/XNQ8SxATis1z0va22tWVoiL7tx3hTyaMMxH8m9He0gMhB7AfZV1ngQtqnMZYMABeIzafY9eb9kwMtg7BfT6rE/3zVNe42RTgzlijZrapvAsfC3Hb4T6X2TN8SJp2JwdS2kSUdfUIa7JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkTpUbSsjXzNmbZgIvE1yXVUG8FH2MQgzlMyNHTS22A=;
 b=jXe1Z2vbWU5P9DcMPss87+wCB66JN3CQbOPXbZNss/IOAY5ALvh2U1WbBY67TkSdC51t82pVBW5BpOPFncP8FRS+TxfZUd0e2dRj6YPRRZmYxPRzJCMmJ+V23ve+DUUIVXwZHcvEGwOsNcrKyqxrYagtQHkgrp6SfXJQAcLNVgHrt0xQd365m9EOvEf2YhYw3hxseTd0Es7tUu8GltixollcZJz103X4xKR0p7khHj81zZ2KHmPj3FIH3xgfgcbDvPQrrbD0ewzcCN78ug2J7b7CML3oIv4EA07iyi9PA6vj8pL8g11jzA2FJOk/0l8YZ10j3ZNJW0jbJc4hhDTegA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bu.edu;dmarc=pass action=none header.from=bu.edu;dkim=pass
 header.d=bu.edu;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkTpUbSsjXzNmbZgIvE1yXVUG8FH2MQgzlMyNHTS22A=;
 b=sifzW9nGrorjz49TqfXBrWZVhNxguPt+PAW4M729SVekLSD1qB1iyknI6+q6bFzEzmDJ68BDYbMO64SdzBF7ktiHXtnKNvvYZyv8vC2qaMEpoy7HyRpTOK1aeevw2c2Ya2/6lTGprMyZif8UXswlrzbMaCMh3EESQfEHz7IweDs=
Received: from CY4PR03MB2872.namprd03.prod.outlook.com (10.175.118.17) by
 CY4PR03MB2726.namprd03.prod.outlook.com (10.173.40.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 03:23:54 +0000
Received: from CY4PR03MB2872.namprd03.prod.outlook.com
 ([fe80::25e1:d1e3:2ad8:e6b5]) by CY4PR03MB2872.namprd03.prod.outlook.com
 ([fe80::25e1:d1e3:2ad8:e6b5%5]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 03:23:54 +0000
From: "Oleinik, Alexander" <alxndr@bu.edu>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [RFC 12/19] fuzz: hard-code all of the needed files for build
Thread-Index: AQHVQphjtHKBYrsIkE+2gkuV9myZtw==
Date: Thu, 25 Jul 2019 03:23:54 +0000
Message-ID: <20190725032321.12721-13-alxndr@bu.edu>
References: <20190725032321.12721-1-alxndr@bu.edu>
In-Reply-To: <20190725032321.12721-1-alxndr@bu.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-originating-ip: [128.197.127.33]
x-clientproxiedby: BL0PR02CA0039.namprd02.prod.outlook.com
 (2603:10b6:207:3d::16) To CY4PR03MB2872.namprd03.prod.outlook.com
 (2603:10b6:903:134::17)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=alxndr@bu.edu; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a277230-6579-44c4-b891-08d710af85a4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR03MB2726; 
x-ms-traffictypediagnostic: CY4PR03MB2726:
x-microsoft-antispam-prvs: <CY4PR03MB272637836D74A2EC91F9C621BAC10@CY4PR03MB2726.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(199004)(189003)(50226002)(3846002)(53936002)(6512007)(14454004)(66066001)(5660300002)(6116002)(25786009)(4744005)(68736007)(316002)(99286004)(54906003)(1076003)(2351001)(2501003)(2616005)(75432002)(7736002)(76176011)(52116002)(305945005)(14444005)(6436002)(71200400001)(6506007)(26005)(6916009)(478600001)(8936002)(5640700003)(786003)(86362001)(4326008)(256004)(88552002)(71190400001)(386003)(2906002)(476003)(66946007)(446003)(11346002)(8676002)(81156014)(81166006)(66476007)(66446008)(36756003)(6486002)(66556008)(64756008)(486006)(186003)(102836004)(42522002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR03MB2726;
 H:CY4PR03MB2872.namprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bu.edu does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OHewxIiMG1UQpJWhPXf+VhB7oYNZG1MmJjVwNw7kDMsKj/wfesbnt+2r8UX7eAkeCv3T/LSeKE/ry+KOLy18ZTVL9gaOqPlMlwgjNolhgXSh/oC8MRGz664NjH2ERe+XJtiQxQf+PDP2+1lbFjdwhzZ+mhmxlAKSONcb4HNGvRnes5VrQOS+B+Xr7mSDyyQWz+HhQg9LWvNeC8O33eAUTyhZ6SO4Tiy+bp0cR63Baj9a/hxPbcWl+csNwAxCKEtWxr0NqL/K+QRTpG12MzWneXOHfQLmw2QtTe83k7WP79xhEVgsLnuA5BWKYU9Vv3EBSlUCLYFhrshp9WuwH5PJFm8CBNgl4zIckpZkBU2koEkMKS1WXHeAUud4lLnO3Qc+QdMNatR3hl3/NuOBpQlGy8IMq2JQBglRMW30IOC4ERs=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a277230-6579-44c4-b891-08d710af85a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 03:23:54.5989 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: alxndr@bu.edu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2726
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe4d::70e
Subject: [Qemu-devel] [RFC 12/19] fuzz: hard-code all of the needed files
 for build
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Oleinik,
 Alexander" <alxndr@bu.edu>, "bsd@redhat.com" <bsd@redhat.com>,
 "superirishdonkey@gmail.com" <superirishdonkey@gmail.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Once the fuzzer is better-integrated into the build-system, this should
go away

Signed-off-by: Alexander Oleinik <alxndr@bu.edu>
---
 target/i386/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/Makefile.objs b/target/i386/Makefile.objs
index 3d646848ef..c8834f6ad1 100644
--- a/target/i386/Makefile.objs
+++ b/target/i386/Makefile.objs
@@ -23,7 +23,7 @@ endif
 # I find a better way to integrate into the build system
 ifeq ($(CONFIG_FUZZ),y)
 obj-$(CONFIG_FUZZ) +=3D ../../tests/fuzz/ramfile.o ../../accel/fuzz.o
-obj-$(CONFIG_FUZZ) +=3D ../../tests/fuzz/fuzz.o
+obj-$(CONFIG_FUZZ) +=3D ../../tests/fuzz/fuzz.o ../../tests/fuzz/fuzzer_ho=
oks.o
 obj-$(CONFIG_FUZZ) +=3D ../../tests/fuzz/virtio-net-fuzz.o=20
 obj-$(CONFIG_FUZZ) +=3D ../../tests/fuzz/qtest_fuzz.o
 obj-$(CONFIG_FUZZ) +=3D ../../tests/libqtest.o
--=20
2.20.1


