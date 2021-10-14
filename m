Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D64C42D1AD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 06:34:15 +0200 (CEST)
Received: from localhost ([::1]:37134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1masRZ-00056Y-Us
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 00:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1masPx-0004QO-1z
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 00:32:33 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:7528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1masPu-0002YT-3R
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 00:32:32 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19DNxTQl022544; 
 Wed, 13 Oct 2021 21:32:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=nKG6bwIsfWMJ6+OwCGnkiIbMtAki0NBJCDNXWyRJ//E=;
 b=KLutvwFAfZ6nH8bZtaIHaXwNupa0mnR/qJSGwyC/GUz/CdW1Do5KBRxnHuatUwUO3Ggs
 rpgPVvc/GUSrXSr6qG9qvwcX0BTMjYEZQmBG/am9bih7whc3nXzh10YMYbFnbCFrnJiI
 vn6bTzYnM64Olnn2lbUufD/j/zlXiRzWFj92Hxht3oRe/mOxaCus5KoOWBar+Kbxp3ou
 jfrbHImqqTLBP8SPOggb8qGr7Ju1sW6CHkFteCylFLnKB+TC/zDUeVHF8Ei+9RHfp0Ll
 BFCdzaM67BfdHBsJ3sVBXGHgQ76NfPLBxgV96JOoQwJIrtAaVfktSAC7gSAWpYTv6J+v fw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 by mx0a-002c1b01.pphosted.com with ESMTP id 3bp6yx8kp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 21:32:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=giz/ZV1sFaKAnYq2g0XVD+INt3X+qyNZptGOZ/DoHyNFdQjQONbcqYbBULqXjfxk7x6QJ53gPxljPneVF8KixlKHW2CcY33UL0vRG01tpvy8xDifgOOx7o+iAtpaH31/7Oe35n6zjCBGUzkMfedjUGFSvejDwPaAEZu4tTSomdCPEZE1oSPMYOISaAJnRzYkF7W2yvvg5FlLJL0m5WJLHkR2cjD3MfYscrxyqlpyBWkh02SOMTCUqM6rY4XMzqrK/zX9zpv/thF7Cn1iAApONhfjLyxdB26KuKjGw997zfm53vasQnGlvkIaS+HQS/n0CujJvdAhI6a+Q/d0k+05Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKG6bwIsfWMJ6+OwCGnkiIbMtAki0NBJCDNXWyRJ//E=;
 b=YgpI0/msoFGMlaWX4ZgpVqIgqYs2kS0f78Jr3P1E+nWcLUF50m9u63rhuhFAuDSCp/dTULOEEN2RK15JKuwF6/lnXlgMLS21HOGp63s3C3/29zUAyxv5FPy0kSOsJUVl7eWlI1DG2Kaeoir3qcaGvHuGn9sTHCY1ywjzpfuXr3O+t0S3pIkA4hjMt+bkIBklJflEEA2eGPtXBVyfWVrK6ouDkqPm2VGDM7qr+WnM8Qs4aBWgco2uCmrPiZQ/dIphbD6saPiFy4jZ3wCTUK0X6AXJpubOhihcxycDsLkhLCeKy3pqmJHDUmckC0MdJm+tTZsgHXS0Oj2edM/f55NQvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by MN2PR02MB6893.namprd02.prod.outlook.com (2603:10b6:208:200::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Thu, 14 Oct
 2021 04:32:23 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::804:50eb:bd2:eb3c]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::804:50eb:bd2:eb3c%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 04:32:23 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "eblake@redhat.com" <eblake@redhat.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "sgarzare@redhat.com" <sgarzare@redhat.com>
Subject: [PATCH v6] Work around vhost-user-blk-test hang
Thread-Topic: [PATCH v6] Work around vhost-user-blk-test hang
Thread-Index: AQHXwLR7owf86s2m50iPvIronnTPVQ==
Date: Thu, 14 Oct 2021 04:32:23 +0000
Message-ID: <20211014043216.10325-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 371afb92-1be7-4bb4-f3a5-08d98ecb9e4a
x-ms-traffictypediagnostic: MN2PR02MB6893:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR02MB68935B644971BC18445E4242EAB89@MN2PR02MB6893.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zjEY77V7jwXA4KoMRMdDvLFai55nUTKmC3CcNjhzB316OphaI+ZCxXhBpWo3Y3KnRvjNUwsvHcUu0hq/SB/XkS5d082Lqdh7WZvUuvuJCul+MfcDRotJ6/OzX+QILn0Lfw/bsgNC6lWE2QuuEXFzmePtJGzjDBaOHSP4Mqu+YVfF1VFItMeCl7qnqHabBUTj7BFNV6DKHXgwmVma19bMjGImqNpDBGdDxNbCfUpkiATIyckmLl3DMhpQMDUHPWwsqRwsjvwOgighv4CvmUOiT7LUZhIH4MzXnWoH8K2Oh27PkLKuB8JIUEbEeSwGkFd/TytLphMyNVzALaVGVhlNvTx8dfq9NTX9sufa31UxkCZedtd0lIg89vrl2u0P3KNOny0HXyEFA7qyd327L0o6j61KZ/IPVsDsvq0f/e0X5wReegbKuH5QmL7e8B1is0RAUlnYt83ooK7clR4YVJjL70KJq1z0sqSu5annG058iz11Frn9cOcg+WvNhreLJs9yw16htpZEbXkCD0eX561GvzITkSR8BEX5hSzBVILQt9ZsnOpuD0XCBqA7Mkoy8vwqrUcHP+iDkLEeBAHCNm1UTkHsZB8B0mhKqoCw3yPvF0vwY0yzvZhG56FS7064CcX5CbEiTtj8itIhwjF79GeqJKH5Nc7QLE9CgvaiAcwzJ2XEC4qUYB0/ymdJHOvAi7HWGm7s0QLTE4RO01y8d9LNT1nGdvdSO2zJwkYso6AuTtNVzHUaa8RBkVwfoZB8Um9tQvfAnoDthuI9jz5G0yO45AcuT4sFal/kW8mHlgNuBa7dPXrIetHOm4QpoE95PIBak8mVVlpDFbEVAWlwr7uzVw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(966005)(1076003)(91956017)(71200400001)(36756003)(83380400001)(2616005)(6512007)(64756008)(66476007)(38100700002)(107886003)(66946007)(76116006)(122000001)(6506007)(186003)(66556008)(8676002)(66446008)(86362001)(508600001)(6486002)(8936002)(44832011)(4326008)(54906003)(110136005)(5660300002)(2906002)(316002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xcYIIzLwAnikbeHORQmCgEo+FRxiVp4DzZtoK0PGIM0fY3g/+cWfRFsH/R?=
 =?iso-8859-1?Q?MFFiUznpCGw28TM/Jq9pni8UX3Dltn+yk2d+kgutLW2sQgdqG0NeVrqIzt?=
 =?iso-8859-1?Q?jPX8nmQxg4+cjlvzVa48Bp4TE3TNP+ZS9w43poZOKPCtqoMbWMH1+VscS6?=
 =?iso-8859-1?Q?1uwMSMq+/lk5MXHcdgMqnarQB7pKIkK6s8ulxB/i2U9nxduzJPZJjAAjEF?=
 =?iso-8859-1?Q?S4rqnUUowAbDm4RgCC7y9g8ic5CoG3s8H3Dqm8/8I5wWIfKALV5XUDy6TG?=
 =?iso-8859-1?Q?Xn556oKfbpFig1GimEtI3jUrz0JsBS4QWwVvEPeThge3orQjh/zwdK0S3U?=
 =?iso-8859-1?Q?GRxRtyE7KEY61d9cFlW2DnSix0r0I2dkwKFGYNAhnsrduQgVzLBppmHVtr?=
 =?iso-8859-1?Q?k9FOPIPcewQnQyBuRwhh8h6pU3JozBmhZXlRVSDB79/kaM/Fq279Y/6S84?=
 =?iso-8859-1?Q?COK2HGMG59X319n4tw+BhOJJ10DPUy5kTl3sVCuDos21u8mFFIGUHStVzV?=
 =?iso-8859-1?Q?GGPugNTmUsmUPnVyaOUpczCKoH7gIBA5Jf+1gAuf8zRIwow2of8h9kmLhD?=
 =?iso-8859-1?Q?6grReKz99Oma/GYmeiO/+1xnWFPr/E55cLbFu5xpS1dDqAlMzwewft2GwQ?=
 =?iso-8859-1?Q?ojn+NzuVq2pnSyEZXGzuzaGekixAVc6Xo4jjvAbDeKAZD30NpRaOW17/fh?=
 =?iso-8859-1?Q?cU2+KYSbbwRDlWYvwYwTHc8PAwodpJFDE02bXKH2t9cCoNfrSdjNiIm3RJ?=
 =?iso-8859-1?Q?UKbiciBkLSb5mY4fBzN5TRgYdldKd5u1XhbFOJGK3pfvRqnbsvGAbLn1EW?=
 =?iso-8859-1?Q?+ItjSUlcQAHDnKKiubB7B2nr0N/TI4GBD8SIeEeb7tvV95DDa5DHGcDJTk?=
 =?iso-8859-1?Q?IEANUKisFtyiW43csYZ5arFdPeab42PhVec8QhKj6OuXTAsuJz4H/UF9SQ?=
 =?iso-8859-1?Q?MA/RwcjJgkhOtgTFFZI6dH1LYbT1fvD7s6jiZmR5UKMQg51yBpC+GxRHuh?=
 =?iso-8859-1?Q?RqHh+C6fU6JIxuIPU4fKszECiOLXU7rZb9oq1iy9wmar7hnfSAXG05Cfx2?=
 =?iso-8859-1?Q?Gp6Zvrihd2HdrQpV3pslCfyrq93gJu0EwHGio/kusQPjQrLwhnzH2Ng/6V?=
 =?iso-8859-1?Q?eS9vAc5I7twMniZ2kXq0bP+JToW+yoZVAHGC1SDtLW1YnITwgmHxLkDrqi?=
 =?iso-8859-1?Q?mPWS9he6ZrvKMU4zKkV9vX53PoMGC3leQhHL59ExtNuzi0c3akoeYGGI98?=
 =?iso-8859-1?Q?PjBLVd3Jha0SVhVGVpLundHGTHIIZe4Sw+ifXhf1UqWvt/WKBRnm6wzrix?=
 =?iso-8859-1?Q?s/aZ6YKEChLlu9aqd72dOcll9/DbvpwrALWEHo4aXG5BvEOjkIv/GpmCSX?=
 =?iso-8859-1?Q?vUneH8SxqV?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 371afb92-1be7-4bb4-f3a5-08d98ecb9e4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2021 04:32:23.4166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fdarnnFOcpfjmZ3wlw5RQykOlbQPl80+NQNG3i3+iLap+eGhiBJV2+bpTld/SdSmEiORKWDl6DtRacISjnQckeMFe1KSVGpN/tVSNoOJgQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6893
X-Proofpoint-ORIG-GUID: vymkWLf4cTz6TQpIoa7eLszrNNAyff3q
X-Proofpoint-GUID: vymkWLf4cTz6TQpIoa7eLszrNNAyff3q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-14_01,2021-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vhost-user-blk-test qtest has been hanging intermittently for a
while. The root cause is not yet fully understood, but the hang is
impacting enough users that it is important to merge a workaround for
it.

The race which causes the hang occurs early on in vhost-user setup,
where a vhost-user message is never received by the backend. Forcing
QEMU to wait until the storage-daemon has had some time to initialize
prevents the hang. Thus the existing storage-daemon pidfile option can
be used to implement a workaround cleanly and effectively, since it
creates a file only once the storage-daemon initialization is complete.

This change implements a workaround for the vhost-user-blk-test hang by
making QEMU wait until the storage-daemon has written out a pidfile
before attempting to connect and send messages over the vhost-user
socket.

Some relevent mailing list discussions:

[1] https://lore.kernel.org/qemu-devel/CAFEAcA8kYpz9LiPNxnWJAPSjc=3Dnv532bE=
dyfynaBeMeohqBp3A@mail.gmail.com/
[2] https://lore.kernel.org/qemu-devel/YWaky%2FKVbS%2FKZjlV@stefanha-x1.loc=
aldomain/

Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qtest/vhost-user-blk-test.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk=
-test.c
index 6f108a1b62..c6626a286b 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -24,6 +24,7 @@
 #define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
 #define QVIRTIO_BLK_TIMEOUT_US  (30 * 1000 * 1000)
 #define PCI_SLOT_HP             0x06
+#define PIDFILE_RETRIES         5
=20
 typedef struct {
     pid_t pid;
@@ -885,7 +886,8 @@ static void start_vhost_user_blk(GString *cmd_line, int=
 vus_instances,
                                  int num_queues)
 {
     const char *vhost_user_blk_bin =3D qtest_qemu_storage_daemon_binary();
-    int i;
+    int i, retries;
+    char *daemon_pidfile_path;
     gchar *img_path;
     GString *storage_daemon_command =3D g_string_new(NULL);
     QemuStorageDaemonState *qsd;
@@ -898,6 +900,8 @@ static void start_vhost_user_blk(GString *cmd_line, int=
 vus_instances,
             " -object memory-backend-memfd,id=3Dmem,size=3D256M,share=3Don=
 "
             " -M memory-backend=3Dmem -m 256M ");
=20
+    daemon_pidfile_path =3D g_strdup_printf("/tmp/daemon-%d", getpid());
+
     for (i =3D 0; i < vus_instances; i++) {
         int fd;
         char *sock_path =3D create_listen_socket(&fd);
@@ -914,6 +918,9 @@ static void start_vhost_user_blk(GString *cmd_line, int=
 vus_instances,
                                i + 1, sock_path);
     }
=20
+    g_string_append_printf(storage_daemon_command, "--pidfile %s ",
+                           daemon_pidfile_path);
+
     g_test_message("starting vhost-user backend: %s",
                    storage_daemon_command->str);
     pid_t pid =3D fork();
@@ -930,7 +937,27 @@ static void start_vhost_user_blk(GString *cmd_line, in=
t vus_instances,
         execlp("/bin/sh", "sh", "-c", storage_daemon_command->str, NULL);
         exit(1);
     }
+
+    /*
+     * FIXME: The loop here ensures the storage-daemon has come up properl=
y
+     *        before allowing the test to proceed. This is a workaround fo=
r
+     *        a race which used to cause the vhost-user-blk-test to hang. =
It
+     *        should be deleted once the root cause is fully understood an=
d
+     *        fixed.
+     */
+    retries =3D 0;
+    while (access(daemon_pidfile_path, F_OK) !=3D 0) {
+        g_assert_cmpint(retries, <, PIDFILE_RETRIES);
+
+        retries++;
+        g_usleep(1000);
+    }
+
     g_string_free(storage_daemon_command, true);
+    if (access(daemon_pidfile_path, F_OK) =3D=3D 0) {
+        unlink(daemon_pidfile_path);
+    }
+    g_free(daemon_pidfile_path);
=20
     qsd =3D g_new(QemuStorageDaemonState, 1);
     qsd->pid =3D pid;
--=20
2.20.1

