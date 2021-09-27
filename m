Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 673D5419CEC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:34:22 +0200 (CEST)
Received: from localhost ([::1]:60346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuWD-0006Dl-Df
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mUuFa-0000kT-I3
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:17:10 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:15070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mUuFX-0005x0-J3
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:17:10 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18RB35un019705; 
 Mon, 27 Sep 2021 10:17:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=yOl4YaRq2eZ1Svj5Xxge5Pz3+vzf21xEVQi6IOG+Rm0=;
 b=jNPXdz81SZL8eD/xVmSirF22Mpx7ObTt47sFIlwfRf8LXVu7PW9Aou+66O5T2KFmYgRZ
 eKvcU7C4xjn6lcUYhCLbdjbBqjsXTD4MASNsaFtrF82LC+3V3wktf3bc/DG4kpmVM3Fz
 Lb/Ror/vaiVYU9MPN1IYFGlWSx8kD2uZNGW9P9Q+w9XGQ8mo1fBWLeTVyGdwmWV1m1t8
 IcUaMMtJvab6Dyj2DkMrwK06ypDJOsCWxLYwNk8fK11Ah9S7dHofvRUlChOWH4HjgJFg
 qCzwNmNwJ6o9TX60wHHOlcprjWXLteuRFIhTZjW2VClaWyjFCCLltDwzb/UhWO6Ujfb/ Gg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by mx0a-002c1b01.pphosted.com with ESMTP id 3bbcr88rmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 10:17:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1T0Q5i1bWLcR0ieyBj5a6+T9+i1Kd8TWBGBUjjpOlmmjxYM51H8fcolELyNPRcQj5x/I4whWnVSPGjND3zg2iFpAbYhUYgQhNuoB5H0pG/x6DIRKhWzkVL+/Q8Pz/b5NwEqFcOfbb6udirn28tv4l8Axu+U+gEW+TvxZOJAq125lIwQ1lwzD8Soy1Yu2FeFw/rA0PFdLr6XJ8yC+7n9TEfMFWCXiTnhyydtSD9p0ApN0BBDa0oGTzscgFSwbFy1TDxvTJZLjr4NvayeaNhyptos9gEuQ9F6NVFXUIi0yMkKfDDI7XJN1UVY+NRMdk6ip+Jpou7j6VN4uKhTAFpVyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=yOl4YaRq2eZ1Svj5Xxge5Pz3+vzf21xEVQi6IOG+Rm0=;
 b=Y4+0VWQY3xzp+dfR4EqyzZelT107QbiiWe/3TKDN7sKMRLyQ/15rTNo0rb04KrIC9X1q8Pe34qHXlbggAMISuZBI/D+N6hb0XzH2gPPg4BLKptG+31JQ0gw0OL5tCkdAd3X92vMvD4AS0c5nNp8ezaxgCqNeKBFMHp1bduCUf2XoIWKxipfACATbxsVtK+GiNdIaVudODHLYPqiycoT+mQkRrj4cYz3e2v/BBMUm/zj8VGzMXi+RpLYgQKXNseMUZ1GM6dVXCTWUGLDzk0cl33jKUAY3q2ZKF8DBj/X4lGL3/11GFquUo/WtmRgFXiV5udomg0taerftOKbPUQPjFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB4275.namprd02.prod.outlook.com (2603:10b6:208:47::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.19; Mon, 27 Sep
 2021 17:17:01 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e965:c7c0:3eb2:329]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e965:c7c0:3eb2:329%8]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 17:17:01 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "mst@redhat.com" <mst@redhat.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "eblake@redhat.com" <eblake@redhat.com>
Subject: [PATCH v5] Prevent vhost-user-blk-test hang
Thread-Topic: [PATCH v5] Prevent vhost-user-blk-test hang
Thread-Index: AQHXs8N7V3zNlGYXNUuXU3U0hU/D0Q==
Date: Mon, 27 Sep 2021 17:17:01 +0000
Message-ID: <20210927171651.1433-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e36c3b27-d095-4118-e3b1-08d981da9e83
x-ms-traffictypediagnostic: BL0PR02MB4275:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR02MB4275340AD0B5C38AE7EBCDCEEAA79@BL0PR02MB4275.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:773;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iTPEP5epUcGYYqRFaitQQMMKgsBuyB1MOgH1TQ/41ykKO3SDMHMOx/ETAOLoOBtWSwPidu2Wt52wdSYIC/3Y7GQ2zqgoZmJAy/eCmnx9DghMbA6blo8D30VCCimZ09Yt0RR2xv16l3fnB9Df6XvZMd5YSIJY6cvOdnXePtPKDzO20ljROyO42G5B/kfkNwRHi8o5kSUgOgvnPR69oSIkdH15VcoT26vO4TUeHTkht6h+f53b3V8WoI69Yh+blqG7GbY4YKTwdadLvt75rAlFs9QR9zlgu/37LGk7OWD1P/k8rC4RLBMYN5nqkntc1dZZ+kehVK6bZ3XsKuwd7xzgNq9h37C/eL9LBOR2SQ0RVss+9+mlBibhHKF98GsaEGfNWItfDDw2djQuHhzxkgCE/AyhB0M+QnANVkKuL3MwyCLPSLVO/pv8rnXjTBBumhB9jhNOV2t0a3G4L8i+ZP+qF8dtq4QAEmFSQk+i1/+3XJwC2VoCwl3blhXI2I6xw7Mvgyt8EZN8XivHEo5PzwJPoITH3nPmOk2+34DslGcuIYr8O+bycVpZf8zDdccnffGZXDiJIvN5to3lQ/wNNImiHGx6qSzVcV5ch1E2495w2Qu7qC1gV8Fhdc0TsAUuDasJyyQyYTtM+fFyl7wuDSYcvYwiib0kTySB3rVmLuEon914ZNIarTTbCbRTCvi7pYqr5lLHfH0Il7msJa4a6RblW5i0BDmjzbwCAGYKInexSeKQC6IVUf1lMAHRAGAHXnRSeGza/dYUupCmupkYrxPkiZr6/wS054SCC+uOKTIcnMo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(966005)(8676002)(83380400001)(86362001)(8936002)(6512007)(508600001)(4326008)(44832011)(6486002)(54906003)(26005)(38100700002)(71200400001)(66946007)(110136005)(122000001)(186003)(2906002)(316002)(5660300002)(1076003)(2616005)(66446008)(36756003)(64756008)(66476007)(66556008)(107886003)(76116006)(6506007)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?AgL1nKvMDx8SgVSHTKCpUajzFNaahGFegYyLRC/WErY8Lc79epa8sFW+If?=
 =?iso-8859-1?Q?HJmGv39O2yOKh0Ksp84uR6po2578ukfolub7NuZgpqxwNRdAex+A4KNk8w?=
 =?iso-8859-1?Q?ajk8zshdI3oD35odvVffA4R8gnbKNxlkVIJk5dkJRU217vAforqwmePN+A?=
 =?iso-8859-1?Q?vMLuER9wg9ahvV56kh66w+YterYvgb5eCc17c3E8IX18AHJhO2ryD718RT?=
 =?iso-8859-1?Q?3k95Le72DvQjuvgxsgwxCb+cIDHuCFgVNTk4kCsYvYwVallmocg9JXoG4r?=
 =?iso-8859-1?Q?2J+c177KJfrAW5RSfgztp44xVAN+M98x2Oh79iTBHgQ1UhjaAGN5SC3OOv?=
 =?iso-8859-1?Q?pOfY431QMcvcvEY7VD8Cs1PFZ7zDrcoVIJBS86cTTMm7qETB20WRdeAsyf?=
 =?iso-8859-1?Q?1DTDSxlXkcC+KUZihd2ctf6S0fQ6AynZwthbyogZbkjsMDiUiS6w94IhJY?=
 =?iso-8859-1?Q?y7qfKHo1FkeUPB2YE0zQ34QKJLUawR7HFXFUKFi7S7vBZVcrcQrYRbfiV3?=
 =?iso-8859-1?Q?wTVL8YQIa7OF3BZorMchgBNQaluzynXxojDXlwX1/sBTy+fNLvWNznYGN4?=
 =?iso-8859-1?Q?kJ0TOVfEtF0+4apHedtrnSsvG2tqY7B9XQpMsUpyLFkVBQlrANGpHe4b9V?=
 =?iso-8859-1?Q?NoirH/+ImxY53D9x8LO3Q1D688jYgJY1E0Yls5kZE0Ez6tkSR4mDuM2pDB?=
 =?iso-8859-1?Q?aBHAGgReALuusIbwV1kRmydSLAKwwrSPEYi2Is6aJSGfp3Inlap0pik6E1?=
 =?iso-8859-1?Q?0RkpVlIB94E6iL5qZnc6vhupqWqLhSynwOvOARYOm/11jBzswtO7sVgGgn?=
 =?iso-8859-1?Q?Vqkd8KEbbwWMzGg85dHp4ZPsQua4gdltuhJVEDteSF88PjZX3TBKrtjQNI?=
 =?iso-8859-1?Q?GjCQ5X74uYga9LOURAVA1TOjnVqOWs8iYy5Nc63RF/NwAoTAQ0vI76QPuj?=
 =?iso-8859-1?Q?LjssfOdcouVn2NizBh+PJJBejj3r1mlDa+O4yRI9AJnJpNyGG1VkI5mx2G?=
 =?iso-8859-1?Q?iUrgZ8I02Lyoe7upiTJefflO/Q9xXDKNjcbBfp63ecg/Q5alnLjeub9gql?=
 =?iso-8859-1?Q?4I4Pa7MGLwb/d1FPXypONzweyZPrgQqrgwcxtSApNxNkIOFjN3L79BnFOQ?=
 =?iso-8859-1?Q?5/9cPoqenejHfpWYrbIUg/2EwOOf/g8yCNo4lQRrTOdSh9OiwIZMRXrYu+?=
 =?iso-8859-1?Q?pQX6cgbGIYxfZYC4eSB/qZ/D6CK9/c+rMxhvO3JsCbM1S2vG6xiPp1uktt?=
 =?iso-8859-1?Q?SUMDGJOVhkjGjrP2wCm6obabATo+mIN1P0Wj/y8kg/vCISYi8GtbABt1WT?=
 =?iso-8859-1?Q?g3gixePnpGftKbxZ6j9voreDybS7hgH/2WTMYitNywFlqn+iBlR+obJYTI?=
 =?iso-8859-1?Q?crUnnyF+F+5i0eZ/0ud9h5N7uoNvM7sg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e36c3b27-d095-4118-e3b1-08d981da9e83
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 17:17:01.1305 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3lOhhOzFV1j83VmGFgpkcmQ9YWGa7I18v9zGCE4PGDDjQLlQGmd0/nipe4/3hKZQUwenWu4VWHNTX/Au2odTztM9jgkkZ5IXPn9LaYDCsW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4275
X-Proofpoint-GUID: cNKttpoX7gLd9CetZjMy0KhnHsybcFGF
X-Proofpoint-ORIG-GUID: cNKttpoX7gLd9CetZjMy0KhnHsybcFGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_07,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the vhost-user-blk-test, as of now there is nothing stoping
vhost-user-blk in QEMU writing to the socket right after forking off the
storage daemon before it has a chance to come up properly, leaving the
test hanging forever. This intermittently hanging test has caused QEMU
automation failures reported multiple times on the mailing list [1].

This change makes the storage-daemon notify the vhost-user-blk-test
that it is fully initialized and ready to handle client connections by
creating a pidfile on initialiation. This ensures that the storage-daemon
backend won't miss vhost-user messages and thereby resolves the hang.

[1] https://lore.kernel.org/qemu-devel/CAFEAcA8kYpz9LiPNxnWJAPSjc=3Dnv532bE=
dyfynaBeMeohqBp3A@mail.gmail.com/

Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qtest/vhost-user-blk-test.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk=
-test.c
index 6f108a1b62..5fed262da1 100644
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
@@ -930,7 +937,24 @@ static void start_vhost_user_blk(GString *cmd_line, in=
t vus_instances,
         execlp("/bin/sh", "sh", "-c", storage_daemon_command->str, NULL);
         exit(1);
     }
+
+    /*
+     * Ensure the storage-daemon has come up properly before allowing the
+     * test to proceed.
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

