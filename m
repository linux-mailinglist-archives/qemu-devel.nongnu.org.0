Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374E06DA222
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 22:02:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkVma-00026D-JD; Thu, 06 Apr 2023 16:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=846085a62b=leonid_komarianskyi@epam.com>)
 id 1pkRLb-0003FR-Dh; Thu, 06 Apr 2023 11:16:23 -0400
Received: from mx0b-0039f301.pphosted.com ([148.163.137.242])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=846085a62b=leonid_komarianskyi@epam.com>)
 id 1pkRLZ-0003Zx-Hp; Thu, 06 Apr 2023 11:16:23 -0400
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 336DGuOY010269;
 Thu, 6 Apr 2023 15:16:17 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3psm7paq9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 15:16:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WF87Tq9wpmGJ45CRCT9JCJT9MNRYEm3XkmsWqNIW+RjU4dPRHdCTBVh0QlXr7ZXp1CSjUe/R8dxyRXnvW4+dkaSNpHqiBIHCCjHe2vixd5JNAqRNdtYoxn0pFE8Lnp/kHN5DpU7q299a7754/OZ9Pbbkh5L5xjFjc74eTUe3DGOre5D1AkO2V8itIFZSAIfIbmSXM64wQG+yWKgTotuht5xYbYQ+5dtX+LUwLHrXmakMw5B/12aiEOU16wK6KhMq80WEFygxrRdy9Tn8RloEXa5KTPWi53ZO2WC17o7TF9WDu9+hIsutw50H/I0h1vvmQwCsVWYrEc04s7AIDxG7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+i1wWHC5U7cQIY/bBGFO83zT+usrtojYgNPkHer3G3Q=;
 b=Wo8kXXsj+9EblA4qJNcivjvsKM3Cc2eyRElfVdrgV7EcW4Fs1Ev8tAV5p2MOz8T1Ex8uNbi5cPQuUzz0hGGcqtBI86kjhyrDGvtWxr01EWpPOW6QohctJDW5fR+Sl7RtGVjE0txnRco+ZRjHId7X+HZ8cV576tJqHFk2dEmfxOdMsUvpMQIyb7fAoE5S4RB41spFMgK1NXkmaWfpUvSANrrQqptPPwtyDCL7lq+mWCxKQcO6qkJUTxNV2pDNoBkS1Wg4C/r0hXDNMom9PUHg56ANd6/+iLSaKiCdrGyIwA9Fl3Hjj9o8HucGOeWPV9Ywp3DRH4R/rVUX9Hgz3+IWow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+i1wWHC5U7cQIY/bBGFO83zT+usrtojYgNPkHer3G3Q=;
 b=qqZWp0Kle5oy5p8r+5TrHdbSKZpSGXLfOWFWWJ3XFfc8niP1fggW9tDQc1Qh9Tt8v5++7++uGIkt1EWsVxIrZlHYPc/UwK4u7QlZYwZnjtQZrglQt4KX4hYPO83wRTbZ30DZ5rhDt7YlLXE3XcN8f81HAu2r3DqhSL27HowV4D5B5OXB0nP8MqiUqFzQ3zEfPZS65r2uH8JK9PmFcrZnUVQh2o/JZmjUb+yf54x9E22yDR9tGw1DgC7xLJU80UIY48TL9UKmPS+fuFW3XD9uny/GqWIScv3j6NBeqMhLXO3iyFNEZ+w9Flmtw4PKLbLaYdPY4/k/B5CizzlFwIcmPw==
Received: from AM0PR03MB6259.eurprd03.prod.outlook.com (2603:10a6:20b:15b::11)
 by AS8PR03MB8783.eurprd03.prod.outlook.com (2603:10a6:20b:53c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Thu, 6 Apr
 2023 15:16:11 +0000
Received: from AM0PR03MB6259.eurprd03.prod.outlook.com
 ([fe80::76eb:5165:fe5a:1de5]) by AM0PR03MB6259.eurprd03.prod.outlook.com
 ([fe80::76eb:5165:fe5a:1de5%7]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 15:16:11 +0000
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Dmytro Firsov <Dmytro_Firsov@epam.com>,
 Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
Subject: [PATCH] target/arm: Add overflow check for gt_recalc_timer
Thread-Topic: [PATCH] target/arm: Add overflow check for gt_recalc_timer
Thread-Index: AQHZaJq4GdLx0OoYRkqnG+8otqWPjA==
Date: Thu, 6 Apr 2023 15:16:11 +0000
Message-ID: <20230406151441.1027662-1-leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB6259:EE_|AS8PR03MB8783:EE_
x-ms-office365-filtering-correlation-id: 8f5b8c2c-fbb0-4472-e534-08db36b1db20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1pzfoVAoG/BS3pmS/rdzx2kdaPkZhYqeVGdu1YWTi2TKfy8cL5u7RzKiYzdDnbh7MWpfsKLdemrat2SocbvhzD2cUqhvR1fHCHx4qxStuYnbNoPilmiz9XCW7kwvT/YChTNUWyTk7VrwSUncP2y+I+VqL4rX/BkA7GZRw6w2fRrB2WqoXVKLNCbuBCVyE/xU75VD5JPMTCXRgqFgyR6xpR2R20u94rfb/ATQ211CDdh1BlxW96DhkVZg+iZhqLJmjppiNhMkcbzkftOoAQ4Dtn7AVAAh94xLd/2350mT7WKW308xXo5m3laUiU8qTh6/GScazcGf5OuqeU1+PLma78fns+lzS9qv9puPKzJhmH+D1aIA4t9sum3kHYbAk7bbTcE1WWexuakBgfG4aZA5CdGtiT4+dkggbCDRKkxafk9udW3l1HSI6uJR07a9K0KOWLoAJYeVCn2QFGg8lhi9GT94fuaKTiIkD3QlGy047pbPDLeYDUPjlVrQlo+yqzf87CtN8G9qbHSu8IJT2qEH1FcjQ2zezADRi7fawnYWwQF6nF0BYzn67YAncrJow4Xn06kjMDWPwrVXGiUqcVtRPuqEMtCv/eG4FjzIbXAdI9dAmzS1781Fbv1YprYGN5wA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6259.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(2616005)(8676002)(64756008)(66446008)(66556008)(66476007)(76116006)(6916009)(122000001)(41300700001)(38100700002)(316002)(54906003)(5660300002)(66946007)(4326008)(55236004)(107886003)(186003)(91956017)(71200400001)(83380400001)(26005)(6506007)(1076003)(6486002)(6512007)(478600001)(2906002)(36756003)(38070700005)(86362001)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Jv4IXaoEeie+4gH0jK9j65lWhEIVEAk8CF1OX/2VLFp81LuwY+fscOycGA?=
 =?iso-8859-1?Q?QELOl4eeI90XXuE8X/OeiIK7YNqsrYDeSorQFDSyUq6AOSoTgdjQmiZLn1?=
 =?iso-8859-1?Q?YUm6j8DPh14RoAd2hsE75v9owUgvsUUrmLsqwuIwCLOCQd6YmLdoFhsIR9?=
 =?iso-8859-1?Q?yJJ2Hm+5cHQFaEwwfJZZu0KgOerHxN/5PX393zXMFJCDNHigNeQS0ws102?=
 =?iso-8859-1?Q?rC7qroL9ANDLG+HH4aI1ZiU/rWa6vADmuLd1yw97AOCdr+EEZzNuQl6M9E?=
 =?iso-8859-1?Q?jxm5Fa0kV7lZDlFC7nRzsiD59NJJj9PNisqWlZft/z+bix/pzeG8sNDkgg?=
 =?iso-8859-1?Q?AY7nf6LGcj0HP0LbAcKP+lHsbXE317AeQkMA+CUIZCjBMC8YAdafJTc7Id?=
 =?iso-8859-1?Q?QbaVGA0R+Mm8nZOZiyTFRxPHnE78LGKEjLSDBE+hX4MJfcYXVJE5+y4jwu?=
 =?iso-8859-1?Q?Hldsu7DJ4v6Tya2jNF2Ul76ogxZ0G+xfHIWnl5zir56y3Mc4s7f0cKmY41?=
 =?iso-8859-1?Q?glYNZrMKwUHI1WolSfCcXsUoj5bwgfMHC8qdzFO/Rbf1eovtska9vadPt4?=
 =?iso-8859-1?Q?N5yo2Hj86lHWJyLyRn/eMYFo8dn1WGEG5YXsc3mPD1AWni8kmsoLFii5h2?=
 =?iso-8859-1?Q?joIMr7DiiVGuSDvHiqJcqjBXLTn39RF/tWESsBvLPtnICpdoqG1px9reCr?=
 =?iso-8859-1?Q?WxRpM6ihK3dKU4cMR40IkEtePYmF5XmBVtQ2EHe5C6gPLdP+b0TNTDk+BB?=
 =?iso-8859-1?Q?RtlYvz77510HpmC3ks1OXZz1YoNdNKxkf2ioOJKQXsBW16aeKLMXZ83yS2?=
 =?iso-8859-1?Q?k65CGIyW55opJQhLshPrsUG8o82khCRDdWzpUe7PYZb6pCEVIkFtzfm//L?=
 =?iso-8859-1?Q?sspJJmPz06wxdYRPPbpfe4is8jXPsf1WmGxTKTPy74PMc90tiVhcpnkLXG?=
 =?iso-8859-1?Q?JyFCGq8/DD+mTxH7ndlJe63T15cmSgDtM2RSlzzn842lN5XALdgwuQ9D6h?=
 =?iso-8859-1?Q?aUtYq5opXqBmklrhJnnPzme5waLzDF3olR1u3+Lvl3DgkdNOcZWaBZZqZ3?=
 =?iso-8859-1?Q?o5AcZ0N6PJR1CWaG0fxzHS18heN8i0mfnHvF/5ZFrYudytPCGjsjsYacvH?=
 =?iso-8859-1?Q?6RSRkKk7QE0ctwWzPPkd0Jz78BqaZ0wO8NSKIA7iXk3BBexXRzznlJbd0G?=
 =?iso-8859-1?Q?jgFvVkpm209x01Q/oFarTmNiPKwEsrhqUeSmNJK5kFy+72Ag2cCB+JoWQx?=
 =?iso-8859-1?Q?sJoH6BLnqflE3NY0OYAbTZUYysA/QXMMqkmAQ/ugSzxucy+GtV5XjV/w3C?=
 =?iso-8859-1?Q?vyFUeDm62z5yfz684/rhIXEyZ6xUYzlRGcXpX/LujOp1fGXgHhFqgPg9kd?=
 =?iso-8859-1?Q?xbiAe/OwCNzCjeTxvrtbGWZQCJGLnUCRwx4WUyxto5jIrrjR6UVykzHUKQ?=
 =?iso-8859-1?Q?v689Mq/q25pr1LaWoAgZgUlfqABVhRguurZeEP82OfcTO9MBM6ueR24/Ok?=
 =?iso-8859-1?Q?dv1QBBoHoRXPjuREzXJGb1Ywy9RD2cYti0+aIm1i2HlSmEAoIvRlA32LJi?=
 =?iso-8859-1?Q?DCgiR1RtSij/wPe8ho7eS1BI6ZnpcK9asVCInppVimpTPzRimA7VShMSwj?=
 =?iso-8859-1?Q?L/QOtDMpGKb0T7DB0m5vLZR/7plvisle6eJhZepz5pumkDhnWQNUK+WFHC?=
 =?iso-8859-1?Q?cddeG6kg0gUh6y/83Cg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6259.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f5b8c2c-fbb0-4472-e534-08db36b1db20
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2023 15:16:11.6393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oMKVbO8qQo2PM8X12mXsEhpbwa7j8Dj4rOtJVM91gAuGUckCG8SdZQTdRAMjv+sLjeAQPvly0Povf+4j9KEvn8uyOA1gXYcwN4fXeTZlvDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8783
X-Proofpoint-GUID: 71KBHhPlrzm6SKjpvJmBpFFMmsG7ACDP
X-Proofpoint-ORIG-GUID: 71KBHhPlrzm6SKjpvJmBpFFMmsG7ACDP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_08,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1011 spamscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=912 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304060135
Received-SPF: pass client-ip=148.163.137.242;
 envelope-from=prvs=846085a62b=leonid_komarianskyi@epam.com;
 helo=mx0b-0039f301.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Apr 2023 16:00:26 -0400
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

If gt_timer is enabled before cval initialization on a virtualized
setup on QEMU, cval equals (UINT64_MAX - 1). Adding an offset value
to this causes an overflow that sets timer into the past, which leads
to infinite loop, because this timer fires immediately and calls
gt_recalc_timer() once more, which in turn sets the timer into the
past again and as a result, QEMU hangs. This patch adds check for
overflowing of the nexttick variable.

Suggested-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Co-Authored-By: Dmytro Firsov <dmytro_firsov@epam.com>
Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
---
 target/arm/helper.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2297626bfb..2fbba15040 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2618,6 +2618,7 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx=
)
         int istatus =3D count - offset >=3D gt->cval;
         uint64_t nexttick;
         int irqstate;
+        bool nexttick_overflow =3D false;
=20
         gt->ctl =3D deposit32(gt->ctl, 2, 1, istatus);
=20
@@ -2630,6 +2631,16 @@ static void gt_recalc_timer(ARMCPU *cpu, int timerid=
x)
         } else {
             /* Next transition is when we hit cval */
             nexttick =3D gt->cval + offset;
+            if (nexttick < offset) {
+                /*
+                 * If gt->cval value is close to UINT64_MAX then adding
+                 * to it offset can lead to overflow of nexttick variable.
+                 * So, this check tests that arguments sum is less than an=
y
+                 * addend, and in case it is overflowed we have to mod tim=
er
+                 * to INT64_MAX.
+                 */
+                nexttick_overflow =3D true;
+            }
         }
         /*
          * Note that the desired next expiry time might be beyond the
@@ -2637,7 +2648,8 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx=
)
          * set the timer for as far in the future as possible. When the
          * timer expires we will reset the timer for any remaining period.
          */
-        if (nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu)) {
+        if ((nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu))
+             || nexttick_overflow) {
             timer_mod_ns(cpu->gt_timer[timeridx], INT64_MAX);
         } else {
             timer_mod(cpu->gt_timer[timeridx], nexttick);
--=20
2.25.1

