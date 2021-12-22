Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC61647D470
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 16:56:34 +0100 (CET)
Received: from localhost ([::1]:34488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n03yj-0000mI-HW
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 10:56:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=19906fbbc0=hkleynhans@fb.com>)
 id 1n03wZ-0008Gi-BZ
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 10:54:23 -0500
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:59716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=19906fbbc0=hkleynhans@fb.com>)
 id 1n03wW-0007ii-Jg
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 10:54:18 -0500
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BMAq1bt028725;
 Wed, 22 Dec 2021 07:54:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=K6JCiKBlYbvIGrBkAPTuw8vCG3jeCftrWR04sSbu6CY=;
 b=f65tcHdDbLI/AK8G9PWflkN71pvEHSWP2cW3L34mBloTNyuFhUOtfSqU6yS4Ea6JDjC2
 IinH9r7OkQ0pCdO6g35y4T0wK4NP3cpYH2XyDPB8g2rfW2CuaO2WpNBMVryMWES0P8g1
 y5/DGV289bCz4iR6YA9mF9t2Fi8h0SzdjtI= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3d42mxhuyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 22 Dec 2021 07:54:10 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 22 Dec 2021 07:54:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=liD2VH/BeXD4Ck9HhiQuuNWmqUNW21biUBYrxXqa4V1CVhVtf5A9u6IlDA0UseaEB7RiPgRD9DyGHnX8npcDp4L2M6AiOJ1of0/2dT5lO7kMGmNQ2zsgl/94YtX4Hk/t6nOqdAPldbyT0cgAsUz4FwJLOUOLGAhbHqD3e8+obXe32QQfxcJvgp1tvBeP95b6M5ChtsWwrDEa2AWEFAgaPgQD1kCIkPzVCBqR6ZCHM7R1pj5eGFOS/5+FImocu4MJ+PIY4lpxmeKijbDGkZCNNJ1tgZjle2HZ5kzh5bkik/X3UfEEKSyznb0NSENv5CGxSnbr3UfSiLUyWR+tY5O/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6JCiKBlYbvIGrBkAPTuw8vCG3jeCftrWR04sSbu6CY=;
 b=Mpc3X4KchetdQb18ab5pYQf9poJSiHGIxh5fWIECmpqO9dzS101wFSSTUiAZmG06wnUXHpH82oEwJMGhd4ZP3x7NolNq8HgU49r6RVcvwFMjZ5iBKxD7u23BaDkhsilWJ9yVXCMoQoBYRd6gA2dPV0yFjusH6y5kRzZtSDNP7jQ7EyigecSnRurnIYUVghlLQd1a0ci8SS/2gSW67TME9NxXlOJuA4BLYOAOrjTYqwQRaGxnKuitDC4kHmToQNVXclwdMemcj9v6BkP3RLsfZ1I1Bis/lGuLS+uFFpazH1ERcoRcBWTL0Vg6//98pl3vqbHMhMo+Cn3IcUMmEtXIIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BY5PR15MB3572.namprd15.prod.outlook.com (2603:10b6:a03:1b2::24)
 by BYAPR15MB3365.namprd15.prod.outlook.com (2603:10b6:a03:111::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 15:54:08 +0000
Received: from BY5PR15MB3572.namprd15.prod.outlook.com
 ([fe80::84c5:3255:12c:bd58]) by BY5PR15MB3572.namprd15.prod.outlook.com
 ([fe80::84c5:3255:12c:bd58%6]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 15:54:08 +0000
From: Henry Kleynhans <hkleynhans@fb.com>
To: Henry Kleynhans <henry.kleynhans@gmail.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "berrange@redhat.com" <berrange@redhat.com>, "henry.kleynhans@fb.com"
 <henry.kleynhans@fb.com>
Subject: Re: [PATCH 2/2] [crypto] Only verify CA certs in chain of trust
Thread-Topic: [PATCH 2/2] [crypto] Only verify CA certs in chain of trust
Thread-Index: AQHX90V9z35174OBTEaBiwicj7+5waw+pwHE
Date: Wed, 22 Dec 2021 15:54:08 +0000
Message-ID: <BY5PR15MB3572B35B9EEFE823B9F1270FB87D9@BY5PR15MB3572.namprd15.prod.outlook.com>
References: <20211222150600.37677-1-henry.kleynhans@gmail.com>
 <20211222150600.37677-2-henry.kleynhans@gmail.com>
In-Reply-To: <20211222150600.37677-2-henry.kleynhans@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 270cfbe2-34d2-4f36-2ce6-08d9c5634a27
x-ms-traffictypediagnostic: BYAPR15MB3365:EE_
x-microsoft-antispam-prvs: <BYAPR15MB3365BEA3A325C127B49A2823B87D9@BYAPR15MB3365.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T+BwnNrDySLf0TzEs30XfIUuXv32GVsf1GJd8rw9yUS0Q1kUGjJFdYXD4BXzrOjfYmKk0HWsZKoZueLbqa3VNnMDY35r9Zu5qntoAiUmtLe8sp8N7jBbWIhvdOqRnc5nDAtd7hXB/Rfhh8k+9Eaj7m+TK+e5KmHAvR1yHq34TetGtNUoAsT3eQFheOf8XRGnGpPJt6xOWPM1d3jfoGq34WaS8sMSJC7ui4VZu5+FBtx48ioziIe0M98d3xSh5XbFtHEdC412FO08wRhh/PY3DJoM3JRHRS9OJV5iWH9lPLf/yUzQBcbLwtOWbyD9aI6QL/eaoJZljqA4BxqQJ8ZDky9HDL6lcZOPxcrowlVG6c+Kc90a6cvXsk61jPMuDa5OfqrirwRLH+vGX26iPV0QzniGxVcGdQzQht4szaTHO1nUzRB1DBPwu2sDSd3t4ScCLJ5MOCOvglE/tjZLB2Rnj28rTCHxWWSmQOP0vwIGmPrjWvoW8ivDz5aZvmPyL1QCgR5eCXWgpMh9HdPg3DFLZlhMfwqi0e7B19xrHnCNhfxl6TDT3A5XO/XuWaR3YMzSCh3P5srrUBr6kCXh721Vnc1RVeYBt0Y9gOKqNYHAeRkGA3yFCLhGAdo8Fa8OYZf3g5R3hvV7cCAnvPnaokhBLR6SbgGWPgQFybtoJpiYvBY+d2CUk6XdFjxNzhC2s70+2v5pY/9ccgNydlrMmp1vPg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3572.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(53546011)(7696005)(8936002)(316002)(54906003)(110136005)(186003)(55016003)(9326002)(508600001)(122000001)(38070700005)(86362001)(5660300002)(38100700002)(33656002)(4326008)(9686003)(83380400001)(66446008)(64756008)(66556008)(66476007)(15650500001)(8676002)(52536014)(66946007)(91956017)(2906002)(76116006)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?te3MKHCWBSF7qdU87hp+6iT3c60WnEqEjOnBljHeVjADddD3FpN4liTEJ7Or?=
 =?us-ascii?Q?4q4JOESbVpnQStfANnOnovkHyJxkoV4oIHCLOBLdiQCZPerSFcw/c/g2rXfF?=
 =?us-ascii?Q?R01MC4zpRlJy01AF3cQxiQlQlMev3M64F8iY9hmr9nn0JossMgVsyruB3HVq?=
 =?us-ascii?Q?1lCoVP6kSxLmt3tpuJhkACEoyzGcTe1bevjrAQr9r4OkGFkpmFKyI9+w0/b3?=
 =?us-ascii?Q?DHbuz8XQ0NuOtQGHGfi/4PXHSkkr7LXfvOHDy/77CQHLCgwobBvCL75ulubj?=
 =?us-ascii?Q?citpg0ZfXDF0oRGjLHLxlBUtUs+4aCUYeXbKXauwmVdfIUoDMVtI/jadOIlq?=
 =?us-ascii?Q?NjKLscAKEi8iadozTU3FqIhGf1IkgpbaeUoYCmGNNdqK1ck1+5w4dpkXhZLo?=
 =?us-ascii?Q?uNkJz1+9DzugAiS/mridjGJX/gdd3Oo74ejzq+2dUIWbP6qbZoY4Fc2hidmz?=
 =?us-ascii?Q?t9Qr3qcSsuzmtqh4glxHUR+ysA3ACpSS6FmNjdDe4T4fhrTocmkMqGAMcDji?=
 =?us-ascii?Q?VhVuvnoJCOB/k1/3VW4qBHocDDMZiWIak+7NWDksHVnpLjEvvBDABpWWjUsT?=
 =?us-ascii?Q?uQ6ckQXAWjsM1YstS6OY91HrGqzTZLDm8rI1ulFeKln6zdYxiDY0sQxn0U0q?=
 =?us-ascii?Q?wk4jKCMeD/QrqkguFpNCrchpQ2vvTiiB7r5NJPHV9JX4LomJI4xubf90AajS?=
 =?us-ascii?Q?jJO9lirLTv0NRReaqFlnbI3dyx6Q6zBK1HHCjTywVnPSVN0tkgoQ9mb88vIj?=
 =?us-ascii?Q?ZuchZ3i3QnbImYccrQbjoXtPhs7taIXpWNYMRYLok8Azh+TrrhSQkyl8+Lhz?=
 =?us-ascii?Q?r0NtUqJo8bpO9uZYE/CXqcWvN+/jg9gchli93p9RkR9+fWSl1YE4XyawfVUc?=
 =?us-ascii?Q?hKQ0+O1GbrqFm3GTiBnUeFOpVjxUJchoq0G/38Sauub54AkXgEvHnbKLachR?=
 =?us-ascii?Q?LXanAdn86z2SvwKHqmGcGX0DYOqzh/Pix7SdiDal70EeZZQWrHgaTb5YVAw3?=
 =?us-ascii?Q?ocVTUB2cQpf5GSxP9IHwy9E0dTVgX36XNvHsIPz/PJWSJV7AKEanxHzNx/hM?=
 =?us-ascii?Q?Gzo77UwPLmL8jIkO2Qx6+O0xuDNHP+QYJPFJIT/olvJ2Wnf9N9TbOv1pHUQD?=
 =?us-ascii?Q?iK9MsTWRfU066SeI9T6jgOY/Ex0+8MJ66xEAo6pNms4FLtdZz3h2a+IibKdJ?=
 =?us-ascii?Q?ir5OLZxkbc8B/CbELOPUy6iJ8sIIvxTgWsxFDvAIRZiSwWvoA7AxoQ1JPoiH?=
 =?us-ascii?Q?mlob7lyNdoXU8v8EQ6VKpDRcwrCSgb2TLDB4k3TXxshI8LZfcwoK+oV51Jer?=
 =?us-ascii?Q?lsmDDPC5SgxJQDj/uxatyyj0nFv8Xd8f+PMZvG4ee5RHSup6coBpsjS6U7SA?=
 =?us-ascii?Q?WRpKszE8kMri1WUwJ6vEwm4qKPdBQ9CANyPLDLVCVoJ+oks0ocZcIpdsIREZ?=
 =?us-ascii?Q?w05P1LQ9QjD5COowTjm2roFG6u7EpohYdurOgqvd7nXMRP8rdhk/w4Ze43BY?=
 =?us-ascii?Q?5SXBSEDu7QRjF6tdCK4v062c1QC4mPtv8imTUcoOSy149QSkmiSmovThSDJ9?=
 =?us-ascii?Q?uVGlwKUB0O0WKwYC+3RUeJTu/Kj/ANTAJ62GmUyUZn6EO1a+CVj9j88lotWm?=
 =?us-ascii?Q?S080k0SS9ojHfYfUaic75B2j6Q1STS2cCR05M3dfz5ofYl8MAw/FIlajoFxz?=
 =?us-ascii?Q?R+N3ww=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BY5PR15MB3572B35B9EEFE823B9F1270FB87D9BY5PR15MB3572namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3572.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 270cfbe2-34d2-4f36-2ce6-08d9c5634a27
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 15:54:08.5213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hFEllqbtFoBQZcv/4jTeXapGHizj8MX13nZjxJlcrW7kZLZmO8pHaI9oi8MALQVqosu8/iKax3uDM8ZvSaHa5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3365
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: F7FFh83L4YyriGmYnhg1WQfPo23C4TwY
X-Proofpoint-GUID: F7FFh83L4YyriGmYnhg1WQfPo23C4TwY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_07,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=fb_outbound_notspam policy=fb_outbound score=0
 adultscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220090
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=19906fbbc0=hkleynhans@fb.com;
 helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_BY5PR15MB3572B35B9EEFE823B9F1270FB87D9BY5PR15MB3572namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

This patch tightens the CA verification code to only check the issuer chain=
 of the client cert.  I think this will still not catch expired/invalid cer=
ts if the client and server certs have different issuer chains; so maybe th=
is too is not quite the correct fix.  Let me know what you think.

Kind regards, Henry

From: Henry Kleynhans <henry.kleynhans@gmail.com>
Date: Wednesday, 22 December 2021 at 15:06
To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
Cc: berrange@redhat.com <berrange@redhat.com>, henry.kleynhans@fb.com <henr=
y.kleynhans@fb.com>, Henry Kleynhans <hkleynhans@fb.com>
Subject: [PATCH 2/2] [crypto] Only verify CA certs in chain of trust
From: Henry Kleynhans <hkleynhans@fb.com>

The CA file provided to qemu may contain CA certificates which do not
form part of the chain of trust for the specific certificate we are
sanity checking.

This patch changes the sanity checking from validating every CA
certificate to only checking the CA certificates which are part of the
chain of trust (issuer chain).  Other certificates are ignored.

Signed-off-by: Henry Kleynhans <hkleynhans@fb.com>
---
 crypto/tlscredsx509.c                 | 50 +++++++++++++++++++++++----
 tests/unit/test-crypto-tlscredsx509.c | 25 +++++++++++++-
 2 files changed, 68 insertions(+), 7 deletions(-)

diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
index d061c68253..841f80aac6 100644
--- a/crypto/tlscredsx509.c
+++ b/crypto/tlscredsx509.c
@@ -315,6 +315,44 @@ qcrypto_tls_creds_check_cert(QCryptoTLSCredsX509 *cred=
s,
     return 0;
 }

+static int
+qcrypto_tls_creds_check_authority_chain(QCryptoTLSCredsX509 *creds,
+                                        gnutls_x509_crt_t cert,
+                                        gnutls_x509_crt_t *cacerts,
+                                        unsigned int ncacerts,
+                                        const char *cacertFile,
+                                        bool isServer,
+                                        bool isCA,
+                                        Error **errp)
+{
+    gnutls_x509_crt_t *cert_to_check =3D &cert;
+    int checking_issuer =3D 1;
+    int retval =3D 0;
+
+    while (checking_issuer) {
+        checking_issuer =3D 0;
+
+        if (gnutls_x509_crt_check_issuer(*cert_to_check, *cert_to_check)) =
{
+            /* The cert is self-signed indicating we have reached the root=
 of trust. */
+            return qcrypto_tls_creds_check_cert(creds, *cert_to_check, cac=
ertFile,
+                                                isServer, isCA, errp);
+        }
+        for (int i =3D 0; i < ncacerts; i++) {
+            if (gnutls_x509_crt_check_issuer(*cert_to_check, cacerts[i])) =
{
+                retval =3D qcrypto_tls_creds_check_cert(creds, cacerts[i],=
 cacertFile,
+                                                      isServer, isCA, errp=
);
+                if (retval < 0) {
+                    return retval;
+                }
+                cert_to_check =3D &cacerts[i];
+                checking_issuer =3D 1;
+                break;
+            }
+        }
+    }
+
+    return -1;
+}

 static int
 qcrypto_tls_creds_check_cert_pair(gnutls_x509_crt_t cert,
@@ -500,12 +538,12 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCredsX5=
09 *creds,
         goto cleanup;
     }

-    for (i =3D 0; i < ncacerts; i++) {
-        if (qcrypto_tls_creds_check_cert(creds,
-                                         cacerts[i], cacertFile,
-                                         isServer, true, errp) < 0) {
-            goto cleanup;
-        }
+    if (cert &&
+        qcrypto_tls_creds_check_authority_chain(creds, cert,
+                                                cacerts, ncacerts,
+                                                cacertFile, isServer,
+                                                true, errp) < 0) {
+        goto cleanup;
     }

     if (cert && ncacerts &&
diff --git a/tests/unit/test-crypto-tlscredsx509.c b/tests/unit/test-crypto=
-tlscredsx509.c
index aab4149b56..e4d657ba61 100644
--- a/tests/unit/test-crypto-tlscredsx509.c
+++ b/tests/unit/test-crypto-tlscredsx509.c
@@ -589,6 +589,12 @@ int main(int argc, char **argv)
                  true, true, GNUTLS_KEY_KEY_CERT_SIGN,
                  false, false, NULL, NULL,
                  0, 0);
+    TLS_CERT_REQ(cacertlevel1creq_invalid, cacertrootreq,
+                 "UK", "qemu level 1c invalid", NULL, NULL, NULL, NULL,
+                 true, true, true,
+                 true, true, GNUTLS_KEY_KEY_CERT_SIGN,
+                 false, false, NULL, NULL,
+                 360, 400);
     TLS_CERT_REQ(cacertlevel2areq, cacertlevel1areq,
                  "UK", "qemu level 2a", NULL, NULL, NULL, NULL,
                  true, true, true,
@@ -617,16 +623,32 @@ int main(int argc, char **argv)
         cacertlevel2areq.crt,
     };

+
     test_tls_write_cert_chain(WORKDIR "cacertchain-ctx.pem",
                               certchain,
                               G_N_ELEMENTS(certchain));

+    gnutls_x509_crt_t certchain_with_invalid[] =3D {
+        cacertrootreq.crt,
+        cacertlevel1areq.crt,
+        cacertlevel1breq.crt,
+        cacertlevel1creq_invalid.crt,
+        cacertlevel2areq.crt,
+    };
+
+    test_tls_write_cert_chain(WORKDIR "cacertchain-with-invalid-ctx.pem",
+                              certchain_with_invalid,
+                              G_N_ELEMENTS(certchain_with_invalid));
+
     TLS_TEST_REG(chain1, true,
                  WORKDIR "cacertchain-ctx.pem",
                  servercertlevel3areq.filename, false);
     TLS_TEST_REG(chain2, false,
                  WORKDIR "cacertchain-ctx.pem",
                  clientcertlevel2breq.filename, false);
+    TLS_TEST_REG(certchainwithexpiredcert, false,
+                 WORKDIR "cacertchain-with-invalid-ctx.pem",
+                 clientcertlevel2breq.filename, false);

     /* Some missing certs - first two are fatal, the last
      * is ok
@@ -640,7 +662,6 @@ int main(int argc, char **argv)
     TLS_TEST_REG(missingclient, false,
                  cacert1req.filename,
                  "clientcertdoesnotexist.pem", false);
-
     ret =3D g_test_run();

     test_tls_discard_cert(&cacertreq);
@@ -694,10 +715,12 @@ int main(int argc, char **argv)
     test_tls_discard_cert(&cacertrootreq);
     test_tls_discard_cert(&cacertlevel1areq);
     test_tls_discard_cert(&cacertlevel1breq);
+    test_tls_discard_cert(&cacertlevel1creq_invalid);
     test_tls_discard_cert(&cacertlevel2areq);
     test_tls_discard_cert(&servercertlevel3areq);
     test_tls_discard_cert(&clientcertlevel2breq);
     unlink(WORKDIR "cacertchain-ctx.pem");
+    unlink(WORKDIR "cacertchain-with-invalid-ctx.pem");

     test_tls_cleanup(KEYFILE);
     rmdir(WORKDIR);
--
2.34.1

--_000_BY5PR15MB3572B35B9EEFE823B9F1270FB87D9BY5PR15MB3572namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Hi Daniel,
<br>
<br>
This patch tightens the CA verification code to only check the issuer chain=
 of the client cert.&nbsp; I think this will still not catch expired/invali=
d certs if the client and server certs have different issuer chains; so may=
be this too is not quite the correct
 fix.&nbsp; Let me know what you think.<br>
<br>
Kind regards, Henry<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Henry Kleynhans &lt=
;henry.kleynhans@gmail.com&gt;<br>
<b>Date: </b>Wednesday, 22 December 2021 at 15:06<br>
<b>To: </b>qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;<br>
<b>Cc: </b>berrange@redhat.com &lt;berrange@redhat.com&gt;, henry.kleynhans=
@fb.com &lt;henry.kleynhans@fb.com&gt;, Henry Kleynhans &lt;hkleynhans@fb.c=
om&gt;<br>
<b>Subject: </b>[PATCH 2/2] [crypto] Only verify CA certs in chain of trust=
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">From: Henry Kleynhans &lt;hkleynhans@fb.com&gt;<br>
<br>
The CA file provided to qemu may contain CA certificates which do not<br>
form part of the chain of trust for the specific certificate we are<br>
sanity checking.<br>
<br>
This patch changes the sanity checking from validating every CA<br>
certificate to only checking the CA certificates which are part of the<br>
chain of trust (issuer chain).&nbsp; Other certificates are ignored.<br>
<br>
Signed-off-by: Henry Kleynhans &lt;hkleynhans@fb.com&gt;<br>
---<br>
&nbsp;crypto/tlscredsx509.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 50 +++++++++++++++++++++=
++----<br>
&nbsp;tests/unit/test-crypto-tlscredsx509.c | 25 +++++++++++++-<br>
&nbsp;2 files changed, 68 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c<br>
index d061c68253..841f80aac6 100644<br>
--- a/crypto/tlscredsx509.c<br>
+++ b/crypto/tlscredsx509.c<br>
@@ -315,6 +315,44 @@ qcrypto_tls_creds_check_cert(QCryptoTLSCredsX509 *cred=
s,<br>
&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
+static int<br>
+qcrypto_tls_creds_check_authority_chain(QCryptoTLSCredsX509 *creds,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; gnutls_x509_crt_t cert,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; gnutls_x509_crt_t *cacerts,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; unsigned int ncacerts,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; const char *cacertFile,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bool isServer,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bool isCA,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; Error **errp)<br>
+{<br>
+&nbsp;&nbsp;&nbsp; gnutls_x509_crt_t *cert_to_check =3D &amp;cert;<br>
+&nbsp;&nbsp;&nbsp; int checking_issuer =3D 1;<br>
+&nbsp;&nbsp;&nbsp; int retval =3D 0;<br>
+<br>
+&nbsp;&nbsp;&nbsp; while (checking_issuer) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; checking_issuer =3D 0;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (gnutls_x509_crt_check_issue=
r(*cert_to_check, *cert_to_check)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* The =
cert is self-signed indicating we have reached the root of trust. */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
qcrypto_tls_creds_check_cert(creds, *cert_to_check, cacertFile,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isServer, isCA, =
errp);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; ncacer=
ts; i++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (gnu=
tls_x509_crt_check_issuer(*cert_to_check, cacerts[i])) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; retval =3D qcrypto_tls_creds_check_cert(creds, cacerts[i],=
 cacertFile,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; isServer, isCA, errp);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (retval &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return retval;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; cert_to_check =3D &amp;cacerts[i];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; checking_issuer =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp; return -1;<br>
+}<br>
&nbsp;<br>
&nbsp;static int<br>
&nbsp;qcrypto_tls_creds_check_cert_pair(gnutls_x509_crt_t cert,<br>
@@ -500,12 +538,12 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCredsX5=
09 *creds,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto cleanup;<br>
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ncacerts; i++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (qcrypto_tls_creds_check_cer=
t(creds,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; cacerts[i], cacertFile,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; isServer, true, errp) &lt; 0) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto cl=
eanup;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp; if (cert &amp;&amp; <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qcrypto_tls_creds_check_authori=
ty_chain(creds, cert, <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cacerts, ncacert=
s,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cacertFile, isSe=
rver,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; true, errp) &lt;=
 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto cleanup;<br>
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; if (cert &amp;&amp; ncacerts &amp;&amp;<br>
diff --git a/tests/unit/test-crypto-tlscredsx509.c b/tests/unit/test-crypto=
-tlscredsx509.c<br>
index aab4149b56..e4d657ba61 100644<br>
--- a/tests/unit/test-crypto-tlscredsx509.c<br>
+++ b/tests/unit/test-crypto-tlscredsx509.c<br>
@@ -589,6 +589,12 @@ int main(int argc, char **argv)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; true, true, GNUTLS_KEY_KEY_CERT_SIGN,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; false, false, NULL, NULL,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 0, 0);<br>
+&nbsp;&nbsp;&nbsp; TLS_CERT_REQ(cacertlevel1creq_invalid, cacertrootreq,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; &quot;UK&quot;, &quot;qemu level 1c invalid&quot;, N=
ULL, NULL, NULL, NULL,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; true, true, true,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; true, true, GNUTLS_KEY_KEY_CERT_SIGN,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; false, false, NULL, NULL,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; 360, 400);<br>
&nbsp;&nbsp;&nbsp;&nbsp; TLS_CERT_REQ(cacertlevel2areq, cacertlevel1areq,<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;UK&quot;, &quot;qemu level 2a&quot;, NULL=
, NULL, NULL, NULL,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; true, true, true,<br>
@@ -617,16 +623,32 @@ int main(int argc, char **argv)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cacertlevel2areq.crt,<br>
&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&nbsp;<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp; test_tls_write_cert_chain(WORKDIR &quot;cacertchai=
n-ctx.pem&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; certchain,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G_N_ELEMENTS(certchain));<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp; gnutls_x509_crt_t certchain_with_invalid[] =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cacertrootreq.crt,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cacertlevel1areq.crt,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cacertlevel1breq.crt,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cacertlevel1creq_invalid.crt,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cacertlevel2areq.crt,<br>
+&nbsp;&nbsp;&nbsp; };<br>
+<br>
+&nbsp;&nbsp;&nbsp; test_tls_write_cert_chain(WORKDIR &quot;cacertchain-wit=
h-invalid-ctx.pem&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; certchain_with_invalid,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; G_N_ELEMENTS(certchain_with_invalid));<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp; TLS_TEST_REG(chain1, true,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; WORKDIR &quot;cacertchain-ctx.pem&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; servercertlevel3areq.filename, false);<br>
&nbsp;&nbsp;&nbsp;&nbsp; TLS_TEST_REG(chain2, false,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; WORKDIR &quot;cacertchain-ctx.pem&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; clientcertlevel2breq.filename, false);<br>
+&nbsp;&nbsp;&nbsp; TLS_TEST_REG(certchainwithexpiredcert, false,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; WORKDIR &quot;cacertchain-with-invalid-ctx.pem&quot;=
,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; clientcertlevel2breq.filename, false);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; /* Some missing certs - first two are fatal, the l=
ast<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * is ok<br>
@@ -640,7 +662,6 @@ int main(int argc, char **argv)<br>
&nbsp;&nbsp;&nbsp;&nbsp; TLS_TEST_REG(missingclient, false,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; cacert1req.filename,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;clientcertdoesnotexist.pem&quot;, false);=
<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp; ret =3D g_test_run();<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; test_tls_discard_cert(&amp;cacertreq);<br>
@@ -694,10 +715,12 @@ int main(int argc, char **argv)<br>
&nbsp;&nbsp;&nbsp;&nbsp; test_tls_discard_cert(&amp;cacertrootreq);<br>
&nbsp;&nbsp;&nbsp;&nbsp; test_tls_discard_cert(&amp;cacertlevel1areq);<br>
&nbsp;&nbsp;&nbsp;&nbsp; test_tls_discard_cert(&amp;cacertlevel1breq);<br>
+&nbsp;&nbsp;&nbsp; test_tls_discard_cert(&amp;cacertlevel1creq_invalid);<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp; test_tls_discard_cert(&amp;cacertlevel2areq);<br>
&nbsp;&nbsp;&nbsp;&nbsp; test_tls_discard_cert(&amp;servercertlevel3areq);<=
br>
&nbsp;&nbsp;&nbsp;&nbsp; test_tls_discard_cert(&amp;clientcertlevel2breq);<=
br>
&nbsp;&nbsp;&nbsp;&nbsp; unlink(WORKDIR &quot;cacertchain-ctx.pem&quot;);<b=
r>
+&nbsp;&nbsp;&nbsp; unlink(WORKDIR &quot;cacertchain-with-invalid-ctx.pem&q=
uot;);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; test_tls_cleanup(KEYFILE);<br>
&nbsp;&nbsp;&nbsp;&nbsp; rmdir(WORKDIR);<br>
-- <br>
2.34.1<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_BY5PR15MB3572B35B9EEFE823B9F1270FB87D9BY5PR15MB3572namp_--

