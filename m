Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B322F743EB
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 05:25:22 +0200 (CEST)
Received: from localhost ([::1]:55472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqUNd-0000WM-0v
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 23:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40122)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alxndr@bu.edu>) id 1hqUMA-0003x0-Nj
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 23:23:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alxndr@bu.edu>) id 1hqUM9-0001o4-Px
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 23:23:50 -0400
Received: from mail-eopbgr810120.outbound.protection.outlook.com
 ([40.107.81.120]:6127 helo=NAM01-BY2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alxndr@bu.edu>) id 1hqUM9-0001mt-Jl
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 23:23:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTbZzFVhpu4bfkECvbhAB12c33eBf5KkblsXiF9tBJw2iMuEeX+8dPyF99qbJpuhY3ol+DfDjR1441HumLh3lhjld6M5GkY1MCeQdtz41jmtlyamGLdaPlzn2Gy4CgVvgRRPN9Zi+vBCZrB3Uv8kRQzfE/vzorHgr+ArRGrwwNNMKbrs3pXc5p90pLe9t33xDiXrp5xle8qrIhLiVO5WOpOx2+pGLeW82hE3FlWhx5zJ5DeZrLm2ObTptvgDnGINbhdr54ueI97JImQOBtcW4YVrvutQBnm0SyvT//Wup6CnN4s2oPTH7Peerjm3hh1Mr7lQaq1qrqCnnJEWZpis6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9kfLVAyAtFl21JsJqAPmwX7GiqtX5TTmBvTmzjM+CM=;
 b=Sc4ItwnDBFkZAJ8dSLxKtqGHAiIYctcpjsMeg3i6rYR/sY6fdxN2EuFXNJyYzaXGgUgo6bzsZjM80tsX0hwmfWUdiu1xZjS0sUkffYgesEgs2+Ew/7hqjcBWStYIT1+5uPzwTZq5eFsdbBfJQNEqaF7p5+ekDlaH3fvFNP2MOPl7ieVsrpwZsSXMAr22orlrCdwlcs7wqBcTJA63U6R/Je4X86QEQRa4WXFwwKHTAcWrX3dVcKg11tWwonaVz/2UWa+AeTimUYrMj74VsfkomVuF3GA6hdSHQ/T/PQ96oueOwLcd2HrxTbqEIqrMYUbYJ/f4/5vdgrO4maxXV0xJHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bu.edu;dmarc=pass action=none header.from=bu.edu;dkim=pass
 header.d=bu.edu;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9kfLVAyAtFl21JsJqAPmwX7GiqtX5TTmBvTmzjM+CM=;
 b=51wPtCY2YJED0j8cfp+T3tOS3OBOUXpCFmNl7oVLsEQ+alf8YN8sYLHKYH6cIeDw6Zd4fAXZukZ+uH5WphJejfDILVP/YneVpe8+6aR4rAEC+8OWIKeMGWPikIARqzAShOHUqCnx3Z0wB2PGPs8kAKhek6qY3O+avXqNA9mWQGk=
Received: from CY4PR03MB2872.namprd03.prod.outlook.com (10.175.118.17) by
 CY4PR03MB2726.namprd03.prod.outlook.com (10.173.40.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 03:23:46 +0000
Received: from CY4PR03MB2872.namprd03.prod.outlook.com
 ([fe80::25e1:d1e3:2ad8:e6b5]) by CY4PR03MB2872.namprd03.prod.outlook.com
 ([fe80::25e1:d1e3:2ad8:e6b5%5]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 03:23:46 +0000
From: "Oleinik, Alexander" <alxndr@bu.edu>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [RFC 03/19] fuzz: add fuzz accelerator
Thread-Index: AQHVQpheYFobq+cGnkitQVnD//dVtA==
Date: Thu, 25 Jul 2019 03:23:46 +0000
Message-ID: <20190725032321.12721-4-alxndr@bu.edu>
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
x-ms-office365-filtering-correlation-id: 508c9b93-9a25-462e-b3af-08d710af80ae
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR03MB2726; 
x-ms-traffictypediagnostic: CY4PR03MB2726:
x-microsoft-antispam-prvs: <CY4PR03MB2726937E472C06D387E04E51BAC10@CY4PR03MB2726.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(199004)(189003)(50226002)(3846002)(53936002)(6512007)(14454004)(66066001)(5660300002)(6116002)(25786009)(4744005)(68736007)(316002)(99286004)(54906003)(1076003)(2351001)(2501003)(2616005)(75432002)(7736002)(76176011)(52116002)(305945005)(14444005)(6436002)(71200400001)(6506007)(26005)(6916009)(478600001)(8936002)(5640700003)(786003)(86362001)(4326008)(256004)(88552002)(71190400001)(386003)(2906002)(476003)(66946007)(446003)(11346002)(8676002)(81156014)(81166006)(66476007)(66446008)(36756003)(6486002)(66556008)(64756008)(486006)(186003)(102836004)(42522002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR03MB2726;
 H:CY4PR03MB2872.namprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bu.edu does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FtAbJ81akugZP+JrVOBHWamI34orTupz9eaXcd61gnHd6xukocJbvOPdZZK0MHtf1kwf8bvrVwdKj5BCm1qKDwF8S1AJ9RklT6I4o4hFmhChT5Eb6otvEFw+lsULBCoDJnFdoFwu5EJCwtlcG56QtCRxKrOKr8vRwZ5LiezxYY35pWZG2of8K1qmJYGyeAsLeRpsNHKBHO/99U3Y4/D8N2yXuuACKLgFz5Q4VqNW1wSQo3MfaetO8AfiWjH0UWVgdfL+l+rj2OYBIBq5InO/RRuIarDlrKL6WBWHKZRoffIceWg1fH7dcl21jKUADmmElwCUA6G4RlqaC+kJ8MgPPemhtRTGuaT4uzis0Dkkq8xi43RkvJucVTWVHyCWcAVPQ4XbKWqYtJFUWTmutF/wLnbTLpdm2MwC3BMlM6MtyFw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 508c9b93-9a25-462e-b3af-08d710af80ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 03:23:46.3627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: alxndr@bu.edu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2726
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.81.120
Subject: [Qemu-devel] [RFC 03/19] fuzz: add fuzz accelerator
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "bsd@redhat.com" <bsd@redhat.com>,
 "superirishdonkey@gmail.com" <superirishdonkey@gmail.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "Oleinik, 
 Alexander" <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Much like the qtest accelerator, the fuzz accelerator skips the CPU
emulation

Signed-off-by: Alexander Oleinik <alxndr@bu.edu>
---
 include/sysemu/qtest.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/qtest.h b/include/sysemu/qtest.h
index cd114b8d80..adfbd10d20 100644
--- a/include/sysemu/qtest.h
+++ b/include/sysemu/qtest.h
@@ -23,7 +23,12 @@ static inline bool qtest_enabled(void)
 }
=20
 bool qtest_driver(void);
-
+#ifdef CONFIG_FUZZ
+/* Both the client and the server have qtest_init's, Rename on of them... =
*/
+void qtest_init_server(const char *qtest_chrdev, const char *qtest_log, Er=
ror **errp);
+void qtest_server_recv(GString *inbuf); /* Client sends commands using thi=
s */
+#else
 void qtest_init(const char *qtest_chrdev, const char *qtest_log, Error **e=
rrp);
+#endif
=20
 #endif
--=20
2.20.1


