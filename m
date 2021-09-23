Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403EB416163
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 16:47:53 +0200 (CEST)
Received: from localhost ([::1]:39168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTQ0u-00025X-AZ
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 10:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mTPyr-0001Ki-Dd
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 10:45:46 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:18760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mTPyn-0006DF-QA
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 10:45:44 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18NE52sw002096; 
 Thu, 23 Sep 2021 07:45:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=qP/e8os3SWnpSnTKE9F7ira9foXW3jvEmtEaWBG/UfQ=;
 b=PbaCAsfbijQA+cyRQbjdwNZw450vsR/b/lYQkriqAvTzIleVUqfYTKzxYg1NJWMnfE9q
 2Zv2FVJY2KY7XK0mAqB8Yj7eZEMwiCfWugNynbfLkRBGmO919BbvGt3VJLtn7CTf5hJQ
 Y3ERGBzG1BPh+/6zGIsYyAxyec05A0wdqg8vxf9qd2FAoxDeAjnKshEz6DVc9Rq9NE/d
 MNNeagBdNc26zldC9A5XLOGXK0nEi9NIC4qlPtka4Khedl2GWzPe17tBCXmWzjAbf5Y+
 OKbOg5kGy+6QKPYCVOCq7uioux1acwWGA7QxxfaMOOErXVU/Pc12MxjrOvCc1wBgZN0n Gg== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0a-002c1b01.pphosted.com with ESMTP id 3b8arksu1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 07:45:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLJSncksmYlVScpPZT6EYZcq47zYeBOaU0WJsISFwemPHscsGSbM0xm5hbvqq9fxb7sYxN2XS9QSFRduLxzmAf2Cn5Tx1BgVAgu9apQDRzKmB5B3DSUNnhD34QO9gx0zwiCeHgdcvGT0w5g84yKC+6FjU9gtPva6prOOIG1CzBAl20lFseMJqW+iDpD+bQe1+rlCNVWR1jx6Uz+JsR7poNCCuD67J+900gGOwfyWTb0swi0zh45zw/ieGgNDNsYbjPkQqYjVO0PgMdZo3zOuGCYxLL9zA0/AkIwoPvPx+WbdYsZrC/1L56vyhf3yKAboh4M9N5R9NBBoGFKiodOWng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=qP/e8os3SWnpSnTKE9F7ira9foXW3jvEmtEaWBG/UfQ=;
 b=g1HqWf2WHgc3X+R2n7xkus2M3lg12jQWMpSHLOW3w+po3GfI9NJZj0IfQ0bn7BXXRH852r0Hkqbbn1M0HM8fgchMVi1zwO5v9SmXq1PpNk65DFyicscYpboGC1lzaPCsuGvo42kIEQeWisrSIpYkBSB9Cxn6J+bkSh7fd5gAADmJVoARcMRxZlSJt9v2n25f9aFugUIJYYQnY+UKQMXGxDvvW8WBxIHErAJ9PWcq6NwbZVXXWug+RBojthAs8OiIcxudpBCL0lWLFn3xDp6PGLvDPWI6yoOBhjf8U9cKNbpCliHcIfDtF0QEWdKZNBgGIC59s/24s3wXikjJJAxU6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SN4PR0201MB3583.namprd02.prod.outlook.com (2603:10b6:803:45::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 14:45:30 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::992f:b2c5:6a7c:3cfd]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::992f:b2c5:6a7c:3cfd%3]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 14:45:30 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "mst@redhat.com" <mst@redhat.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "eblake@redhat.com" <eblake@redhat.com>
Subject: [PATCH v3] Prevent vhost-user-blk-test hang
Thread-Topic: [PATCH v3] Prevent vhost-user-blk-test hang
Thread-Index: AQHXsImndLAOcgO8DEuf/MI2vsXIgA==
Date: Thu, 23 Sep 2021 14:45:30 +0000
Message-ID: <20210923144520.21873-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ceaf0fc6-d009-429d-9fd9-08d97ea0ca47
x-ms-traffictypediagnostic: SN4PR0201MB3583:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN4PR0201MB3583D54A535DAE99BD841DB3EAA39@SN4PR0201MB3583.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:773;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xrTSUp7hrnLOAnVzV6aNvRcrCh3ipFlSt6PCSjOYTRabH0Cj3bedGdvYmqQTAx6vivxNtYmMJKqv+dHpb3xJojGu7v/rNmwoJA/MKaVlcZEcfRfPo8/IEiyHjhJ5zBA2QqC1pL7T+uVbJwwhDfnaUwZs5W5xR6R9LJkFDlp/LTtG3+ZE0TnZSUs3lOHwSELn4XeJhCEay+HkK5QzrCKoeGckUrvSKAPIQBAlm0V8b8nHQQ1uRDa/vHGkyDbNFljxg9PKQm+dba+1rukm8dklBZfoyh+yw8fQdqM8WRiNjxFeDXtF3RT0B0n02DX3oVjySv9lVJwAji410TVxuigQEXuEc6Kxdqb4uTdPf49Qmvl0yXIMvOj6RbaFkjJn3+vWOXcDsH/zsfA//CtHD/bC0SKmYZ6sa1GZmKFFeCO9IZm9Bu61pFqsKxbBvoVS4lP688kLIc9S/iQ5cotCvKAdmrWbfqS1o8g8PTXYId8hd3bd6HdUGRf+rCpZhPWbbS93VSucEqJ8ZKURg8Se9vRY80ekSuEArpJvJbtlfWDzBeh1Hshc/F6qi3P/u5uhJCBqHowJbCBhN4frudsO1QngrRKpOxM7Rv0zcMHN9ZWbj/txi57XM8I3FHcgE9B681gBlliFKvAARZ6ElrejK9qabk8GMNAzb5u/rYWdlWAcPamFjcFxQJtSx07fhw+ixpke2oFmcGk9Ux2LzTbNvsdZpup/ycU4g2H+0k2yUynFOtfAP3dxqPQN3Tyym6D1K8ik6YCGa6L1UUjPBIVWZ+h/9SqfqrOmKaaJ6/4dOMg6pN4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(107886003)(44832011)(1076003)(6486002)(71200400001)(86362001)(4326008)(36756003)(6512007)(76116006)(91956017)(66446008)(66556008)(66476007)(26005)(966005)(8676002)(186003)(2616005)(6506007)(110136005)(316002)(38100700002)(54906003)(38070700005)(122000001)(83380400001)(5660300002)(66946007)(8936002)(508600001)(2906002)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QVsz/vipjpJBGXL1IkK8rVBZgjNGYR+wuknluXBgF+Cj/jWTDFhG/P4jAx?=
 =?iso-8859-1?Q?srph+JfvSp9SEiuHyHGtoNtBOW4y9DmIR0qXlnB4kME288rOJ/UHtVDagJ?=
 =?iso-8859-1?Q?uGQ8UvCiP0RFGTe9wr74sGEKUi5L8NS/XQN+9+gz5cLegzZUNMl9Kst5ko?=
 =?iso-8859-1?Q?SeFr3dE1ZnhyBQqZLauw84vl6dcwyoIHxtZBq33xJRPh5fkP/7PsbXaqOI?=
 =?iso-8859-1?Q?pSUhsSvTL/pK68WwlhGJOPpYIfVN651wXiD//x1bUALg349Z++kxqJ9gvP?=
 =?iso-8859-1?Q?NbUNDzcdDyu7QB6i5ErHusPFEiUEP0q1ml6OskGgATXubmBbA780kQ78uC?=
 =?iso-8859-1?Q?rmGJgiOSTOmvbhuPD5kVHtDGSvnRzNnJpXu3GmkHEEodLzYnRB5dsPDHnZ?=
 =?iso-8859-1?Q?1jOlD8FuGMBdq5QbFaVWA39TYYHuhzhBBX+FlSJDt3rXA3rvERQkjL6znR?=
 =?iso-8859-1?Q?chYJNTGUDD3mC72BBsmA+BhwftH4Z1jyKXwWeDO8gyL3Q4vU4xnDR67A4N?=
 =?iso-8859-1?Q?xtkE6tZ9VFzIm84ut7nr/VrvSH5hac1XQOyzlbdmU5ka1O/hb1WzAcE8/M?=
 =?iso-8859-1?Q?vwdzYJ7stgyJCTGfcHJ8y7/dqd2/bpqivmOJt0qz9P50TK896NZQrvTjgk?=
 =?iso-8859-1?Q?Adb2qIFPJnpJ8kejYUhCDvIGp3WUorPHmTr2wN65BxrX+VQGT2b9bY5t2p?=
 =?iso-8859-1?Q?QDC6A6YNKSboUYRaGH8sT5L5tRiBMD15k4Q1RzdbUnW+Qm2RoMPzZCyDw/?=
 =?iso-8859-1?Q?hDJ6ls65CrHDpbPi70HMk9CBQfOfdZOCInK1h8BBLPPLpGTd9i/F7D8unC?=
 =?iso-8859-1?Q?XWnzvKQsiIN7GCxkavZaOiUPPPtU3cnQtIil9EjYyrXYNMyMvcLNDFpYHU?=
 =?iso-8859-1?Q?7WV0uCYJMoRHqK9Mkb69UpLNSzG3lhDdNzD6gr0e8hvqKRaWXm+nJlEDb1?=
 =?iso-8859-1?Q?uaOdJhY+XviW+oVs/6Xdl+FjJynHq8nqXrEu4EjdE8xcyBzTJxAPWY8VYn?=
 =?iso-8859-1?Q?7QCcK+DTGCDJdvR+FVrUepQYava9RkGx3yyYzihhYWkVEBYik7jlSALTyU?=
 =?iso-8859-1?Q?A1I0muWZRTB4qe9CF02G2dHO2HL3oonkVk8CSPwZZ50+zo2qJJgfe3bwHu?=
 =?iso-8859-1?Q?iVzjN+TqOS9R2flFqnSsNFIVmxUqlNbKGISKq38hDQX8Am9/av8Z50WeM0?=
 =?iso-8859-1?Q?eu0oMTkp5jeYPA1NCnAHSSuZEnX9F3i8jPRTCVS/oT2XNS9iq5mTousOFw?=
 =?iso-8859-1?Q?TrUb/60NDgo0RI+CgpsTFtAl3zvLTST/6E8w0OeS3eyc56PWgLU8DRgpfi?=
 =?iso-8859-1?Q?U4MnZc0YppxELrbwRDpY9jRENZqIf1kHTS++ZDi4Owm/0MOMNNEAPO+3We?=
 =?iso-8859-1?Q?MecF5d5ymH?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceaf0fc6-d009-429d-9fd9-08d97ea0ca47
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2021 14:45:30.1755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cCc9Dv1b8WjgIF+6svujoA7y0hmPp5AZ9rGZMXQ3zSXc1kdb3/TCAoIjHI2KXJaFTtquWqsgqZKQJP+zdPcOZdITZ9VbLsQiX3Wwy6rlIf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3583
X-Proofpoint-GUID: KuJGhAeA03nI8DtvQEhTnQ4UqD9H4E6u
X-Proofpoint-ORIG-GUID: KuJGhAeA03nI8DtvQEhTnQ4UqD9H4E6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_04,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
---
 tests/qtest/vhost-user-blk-test.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk=
-test.c
index 6f108a1b62..0e26266522 100644
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
@@ -898,6 +900,9 @@ static void start_vhost_user_blk(GString *cmd_line, int=
 vus_instances,
             " -object memory-backend-memfd,id=3Dmem,size=3D256M,share=3Don=
 "
             " -M memory-backend=3Dmem -m 256M ");
=20
+    daemon_pidfile_path =3D g_strdup_printf("/tmp/daemon-%d", getpid());
+    g_assert_cmpint((uintptr_t) daemon_pidfile_path, !=3D, (uintptr_t) NUL=
L);
+
     for (i =3D 0; i < vus_instances; i++) {
         int fd;
         char *sock_path =3D create_listen_socket(&fd);
@@ -914,6 +919,9 @@ static void start_vhost_user_blk(GString *cmd_line, int=
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
@@ -930,7 +938,24 @@ static void start_vhost_user_blk(GString *cmd_line, in=
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
+    free(daemon_pidfile_path);
=20
     qsd =3D g_new(QemuStorageDaemonState, 1);
     qsd->pid =3D pid;
--=20
2.20.1

