Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD004900BE
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 05:16:45 +0100 (CET)
Received: from localhost ([::1]:50974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9JRk-00029D-5D
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 23:16:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n9JNo-0006lD-Et
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 23:12:40 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:30538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n9JNm-0003Mv-61
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 23:12:40 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20H3I4GT011096;
 Sun, 16 Jan 2022 20:12:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=jdBLatFfZQgIAeVKzCsuAft5+5bH67jwOxFnsHpVJUE=;
 b=SWJYXhf81IaWN0C5v1QfI1INKL1hkCDszzqRDYFh9I7DSiXfoKPiex3Tr2iydaB4xtfa
 TLkhJKOAiVpU4d/Q81F4d6cEO5SuxfD2ZykEDFcZmwz3x5xmZBhwVDxq/aAA0FhCr0Li
 nf8e353db+n4nvpFTHAyPiiHBtxUQ6b8rQa8oZ+ElIPn9T2hpejKa2+qumZF5T3Kl12U
 eSL19+9cpAFTgHOYmKOx+pLaeD1LgYo14JQQ2jyCv7QlfmcChhvnQWg9LTyUWVAJU33+
 7o6Bb4zrElmKXNbnbPb14G8j+cO3xYEk6W51mETE4VTXigwr37c+83Xa9kwXH/e2mp15 lQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3dkufw2hf2-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 16 Jan 2022 20:12:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEgUjfbAWsyYLlIcqAsI2ZdkzXaNIFTnJMnwp+ZOOC4mPvV261uuNSkcaHfYsl0Ec2mBei4r3SuCAMSoarKmiorukkxsWheOj1vN1DOAIjhG7K9DRsMEiejQQaHVF687eGf+bSj/3ZRgMXmXaZp25oNx8hFn7kbd+ibMroYEElvFAaDqmKAqYC3FgXiZXmGMvnFvf4NK707wOqwXRmrHwPDhSwnKsqQlNI5JVQc0dtxjpMZiZisECrTDJBZ+L4CYrdt05B7u2O2b3r4opjl/l7nzF2ijSWTcpE4HVMMkOqvmjZ9EYlVxcdgZPfG+luEt4vPtAMihYT9jg3BdxYGw1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdBLatFfZQgIAeVKzCsuAft5+5bH67jwOxFnsHpVJUE=;
 b=ofzBM6V41zBnYX+hFxWZiUa19qLMTCJ1KUct61U98IKiQnyPyM1S48PxGAzPh/MQEl1ohMnOxddIt9S2QzFRWjVSJ2Dg3zajvYRFin27A3y3w2TINTNKAWu3louneiMP8s20ncf+vll5Y0ZLpWmBvwfdJPSRKooWP3b+3zL/jWrNrIOPNxTuYqRM0XEuWpZEY2dF/BfmED3qL5kXR4xGhYp6Fz1ROXhdL92Y2ZoZVZ3t6rXJD/yJOx3HdrkfAWNcGe4aWzeGvxmyechoBbTe+gm7t2OEtGczY6v+gj/FPvlnu7iDiT7GoVhb+q9MrNoTYG5lKBXUiZwrh5mHUVHlmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL3PR02MB8018.namprd02.prod.outlook.com (2603:10b6:208:359::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 04:12:34 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4ce1:59d7:578d:7e75]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4ce1:59d7:578d:7e75%5]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 04:12:34 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Subject: [PATCH v3 5/6] libvhost-user: prevent over-running max RAM slots
Thread-Topic: [PATCH v3 5/6] libvhost-user: prevent over-running max RAM slots
Thread-Index: AQHYC1h0Lmuup4pxo0qGaWbHhV/eVA==
Date: Mon, 17 Jan 2022 04:12:34 +0000
Message-ID: <20220117041050.19718-6-raphael.norwitz@nutanix.com>
References: <20220117041050.19718-1-raphael.norwitz@nutanix.com>
In-Reply-To: <20220117041050.19718-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f03a471-19db-4492-c052-08d9d96f9712
x-ms-traffictypediagnostic: BL3PR02MB8018:EE_
x-microsoft-antispam-prvs: <BL3PR02MB8018E4D985A68076C28CC13BEA579@BL3PR02MB8018.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: knCkOcPcFQQK3i6e0FYNnnpmNgy+IZ75sgjEQU9XoVCqZoKd85PV9QIuk4xA0Flmxi2ve68IQKtjHqmT33rpSz6VNGiVrjB5LVctWW8whCo6zp10gbYAOQrt6uKA51I9IXwEK24VOfMdinBOJMcgM65t+zVdFUNnW/Oz4aZJCaSJ/BA+uZ9h4m9i5KB76aZV+L9WybabiQTtPG1surmxSgMk9dBkHJcv1RcjIeCJ5LXE+bMwzZBcNsnUajaYEoURpcXYN4pwrFXR1BULvfo1D9GU/RxSktqo/p/Y779kZ3shJfi8sYmpAuWv+LiQ7X4EsYuDCLY3QmLyNgP3UCee4RtDUAk9VMOwKcbkbwJiRV7sB6rP6Vq0V2yt34crMaWGrbAXaMuYo8Sfuq7jrUAwF+nZYO3WU33Al85akmocE4ySmxgTDOUMFzmALz313Cbhe+wBF8epd6l8beEhn3hmTsodASBenw3TjrxdfjC7zfWwUnOkIuy9Th5xRzYI9mAKw3asySE63aK9XmuNMm1WACsP8QcpFIaczogyMVSgaZr+JBpNeGmjgfHhj5aQryuGIo9ZgwhCpblmbJvY9QxDEwlCR/yUU+llSYEpJfD9hpZ9YO3n8Zko+w7fsJrCeUs/8RDzQ7Y9KWd5SEVWkaJkM8eVFT3Kwp8ZHtAyTptac6E5z8ac7EpFbtB6+isAWiqIEDuvAdJGEgbv6Te1p4M/lg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(508600001)(66946007)(1076003)(316002)(71200400001)(64756008)(83380400001)(36756003)(8676002)(76116006)(66446008)(66556008)(6486002)(66476007)(86362001)(6506007)(8936002)(44832011)(2906002)(26005)(6512007)(5660300002)(4326008)(38070700005)(54906003)(122000001)(110136005)(186003)(2616005)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ocb+zWXI57gctF6Bc/hYNBYagLAirs56/nxdyIUYpiQbjjBx2KCJPbTUTE?=
 =?iso-8859-1?Q?EwZ5trGMFs+Z6RH47wapC9+xkRZj/BPyT37V6yL6TAIZ1pX+aqflIsgPQ7?=
 =?iso-8859-1?Q?Qv30zIBbgKi3R2lv2vUgYit18aIbszWoJFVc1WVvMdNJ+uhLnlG/t6QtA1?=
 =?iso-8859-1?Q?L4W6Zgpclbp4IVykrmGnx8iuC4uK1fZ9yn6zd/ufJ6qvzmUsfoLoh9Su+t?=
 =?iso-8859-1?Q?oF+L2EUXJLEzHDCfMhziOFxAGs0Q6lkOG5zZE7Y7m0fi5CCsOnEJkYqvCy?=
 =?iso-8859-1?Q?I5IlbusiSy5U4syYUqrNIwvRq6345SscKTBEUjBCBu941JKC9OTS154k+N?=
 =?iso-8859-1?Q?pVMgDLYPuaxWA1ettlwEys4RuWl+lCm82H7aCyv70zUw962QVQph+gFGV1?=
 =?iso-8859-1?Q?T7NWIYuswmcXTda/p83yYLbzYTCGvvES9TAOzof3tRuYkWwHahnTJwwyWl?=
 =?iso-8859-1?Q?dTLPqQJsw3XgCrKbdmzzfbJTTj5UQ8SiFgen1kcaK42ql8toovGDBVvgvm?=
 =?iso-8859-1?Q?Luawx7b2b6owDGFIPlJd+837G+TGr3atBlwxTodwGb7yykI/0McM5HVpjl?=
 =?iso-8859-1?Q?gVnU3TjHa1bfBZei5eeG6AnulSLqTxrp5US+pyL7iBl47hLIK5AsLAI3U1?=
 =?iso-8859-1?Q?2dLVe7/5YVkbs7i+wj2y/s09M/dstPHOumZ5hwVd4aEU74iPESgWaLUC/L?=
 =?iso-8859-1?Q?B5t/y7iQefdLI3twR/AGVfnfCLzT+WYl05TM7p61FoGjTLH+2NwWt2PBf4?=
 =?iso-8859-1?Q?ETes7j6zFVJ81TfBYbGkyc8qef8xvwtSPNY+Wce0nud1ZAM8GaGcvNvdgk?=
 =?iso-8859-1?Q?BNRRAl3mGwKGMcuCocfCPHmRddtka3I35HyePMTwAu/8MSc7KPeHmQscEn?=
 =?iso-8859-1?Q?yspHDhxHwETs5bEEGu24v84iWST3E87oeTHsWbMKewsl4VnZ5IyhYFLYVs?=
 =?iso-8859-1?Q?W1Bcs+mPK+Q8yc47uAnNBQbwrK0z+mp7zLgnzmBBZsS+aOLWK5S1e+9nxG?=
 =?iso-8859-1?Q?FzYIsTEkl6BqsHfHNOXEtVCBM/TqMO0C1w/JKhF3FOdapEADbnI28AnJIW?=
 =?iso-8859-1?Q?mLrMcfj/ex/bqpFpciElpXoEYtm9yk89By3mq32HkkSEU1LnLyhVplq8tg?=
 =?iso-8859-1?Q?cuqCU+OSJLmt3e64JzH5dhP5NglsdzAqJUJ++JLtj9qALh2IjAI0RlOtv1?=
 =?iso-8859-1?Q?F0mXkt9Wn5mWZ5DbAn+lk/y71vt3xQucNe7FiSoZ5JIxsLbyKMJRYkCiYk?=
 =?iso-8859-1?Q?pI9cLbsQb93KNMhInibfpOOUlOpYHRDwy9Q8vVZrIXOj7/yYGb3WTLuE/v?=
 =?iso-8859-1?Q?HGt3NlFcQrGaoqIO7/5M9M8g2ttr3ft/3FYP13Skn1tzMwZBbDf3qZ9X2s?=
 =?iso-8859-1?Q?uh6xqQ1MLi0uoBUzbNtqIFLlatnY6vL1esAn4dV8JTt0bpYwtggh1Jei5z?=
 =?iso-8859-1?Q?ZKiizq1aDxFBS5FjzKLTqrwDEgMqx8fwB5YokfgqQ9RGuKtnaQhiFrAvKc?=
 =?iso-8859-1?Q?TLhUVmzdtRVSmpA5PXtgSUD0mLfR1uvYibLvqFj70tapqIk3bblb1NQjOB?=
 =?iso-8859-1?Q?0OtXpqC/3GGhgy6UWzypo6GoT7K3iQe+mJ07g1BCaaa5ru7H/kCTOPFGjv?=
 =?iso-8859-1?Q?S5FikDUqdttRqzw/dw7QNot7341meIqif/LRTAMrtw4Fpo8u+bRKt6wUZU?=
 =?iso-8859-1?Q?aNNZAUTtTcujjbETkpheJjvEKve8VzP94xGFo8P4n68O4oD5vuh8ldcfkS?=
 =?iso-8859-1?Q?FL9zIaP+pgzpm7hIlsUsyS8Uk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f03a471-19db-4492-c052-08d9d96f9712
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2022 04:12:34.8039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IwaXOSNiRoowjDUzmC5TyhIeJe5NgJiszP8AM0IgleX28tIufaMKJX1quoBYKWb93pK7T/1ZpOZvA++1SlZ4BQuXZ16V9lBURgq/PINs9+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8018
X-Proofpoint-GUID: yi0k7HknDm3XQnIsUlUDMRQ7Xp3EAJai
X-Proofpoint-ORIG-GUID: yi0k7HknDm3XQnIsUlUDMRQ7Xp3EAJai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_01,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS support was added to
libvhost-user, no guardrails were added to protect against QEMU
attempting to hot-add too many RAM slots to a VM with a libvhost-user
based backed attached.

This change adds the missing error handling by introducing a check on
the number of RAM slots the device has available before proceeding to
process the VHOST_USER_ADD_MEM_REG message.

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 subprojects/libvhost-user/libvhost-user.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvho=
st-user/libvhost-user.c
index 3f4d7221ca..2a1fa00a44 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -705,6 +705,14 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
         return false;
     }
=20
+    if (dev->nregions =3D=3D VHOST_USER_MAX_RAM_SLOTS) {
+        close(vmsg->fds[0]);
+        vu_panic(dev, "failing attempt to hot add memory via "
+                      "VHOST_USER_ADD_MEM_REG message because the backend =
has "
+                      "no free ram slots available");
+        return false;
+    }
+
     /*
      * If we are in postcopy mode and we receive a u64 payload with a 0 va=
lue
      * we know all the postcopy client bases have been received, and we
--=20
2.20.1

