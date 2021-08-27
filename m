Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8618D3F9D0F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 18:54:30 +0200 (CEST)
Received: from localhost ([::1]:56666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJf7d-0004cp-KP
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 12:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mJf48-0002Lk-Jb
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 12:50:54 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:51854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mJf46-0006Vc-Kw
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 12:50:52 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17RDbrJB020321;
 Fri, 27 Aug 2021 09:50:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=gIC5/Sme10wkVhhuKv8RHZSy/zwxuOzmHPXu3LkdX4Y=;
 b=t0+DD2Te6qf635qqFI1DRvAaEIlSpOkvIc4PbAea6Eb28oyBZqtHRr5P0fCeMWA3ue64
 lYjl6AGQ1d1h5feQ+axdeapGwdHnI7zQHRdW6qM/bmC5ONIdm+VpZZKgBf8XvXdSPXIl
 anVFKvgXEgTrpf6OCuxPvZOrcm6Sdv5wRJDaD5KWueSQeph7OugNlFas8/83LPrxk6G3
 nATGDB2IzNUq2jX5morPCpg1+euSAynSyPaUNVjxb2vqYxuQ/EjkP0aqZP1hnUo2e5G4
 OnEsYqnIF8LYRxU+Cd+CnhrWHob3vpGHrQj5cc9GjfJ/hRVTyYTgC+dlxJxsDbg7zN6E OA== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2046.outbound.protection.outlook.com [104.47.74.46])
 by mx0b-002c1b01.pphosted.com with ESMTP id 3apsqds78b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 09:50:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ie0t3giAyjUrSd8g7pw7IBVl2Bvg/zVB44Lqbp3QjHN3VVkcgWLFpIwu0vsJUOqWgLTbUZzWKhsrltR2ynHcmp9xc19DThSBML4HLTPC9O4PMzEb8EnoND4APc4QhgKX5fvwDm+fC/YzHjzkB5o8lyPxj4egKdnPM/DTnsAaEmCpxQUUIZM97yJepjxxUJXvJ8o5QEO68aZx2jRqGYxfVsVZyStAmCGLsAUmPFfd/ugUUXV/8Di/lJY6YO1zVB9M3YM1UEb/BgXqFv9Hcxit3qkVMlGoLM2ihCHozRB6yWELdXRMIftTtrORB03xYHo+H024d9YqM8CeSBEV5UzlAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIC5/Sme10wkVhhuKv8RHZSy/zwxuOzmHPXu3LkdX4Y=;
 b=VDE9pI9AqjPuI+Q8ednKZS5orDUEwq+vRFZOVLS/43MdB3IGckTffdNHr6xKheh5oAu50kqrB1puyJoXLijFBwHFWUjEboxqZXvexlqKB0dIyJ0jmIAkQYXM1nNv+rK5eYCmYqLncyk8ykKKYC9MglzGzSrhWFj7hHpeCcH7ENTWYyIo3fN77Zam5vEmR2je3V7PBiZxtRgxx1PjBPrEc5AzB6fzzDCxKvvPm7GMiMmX4IauEbGlIhno0EQt67rdjI84gRUog395u5t0bVxuSXaG2lM5tXwGQ733z7wL4ZNM2uNf8KpavBjSGnvVFg5Bl2Y+hn4Rt7DY7RUADqI+8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from DM6PR02MB4539.namprd02.prod.outlook.com (2603:10b6:5:2d::12) by
 DM5PR02MB3717.namprd02.prod.outlook.com (2603:10b6:4:af::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Fri, 27 Aug 2021 16:50:47 +0000
Received: from DM6PR02MB4539.namprd02.prod.outlook.com
 ([fe80::84d9:8819:4e4d:e73d]) by DM6PR02MB4539.namprd02.prod.outlook.com
 ([fe80::84d9:8819:4e4d:e73d%5]) with mapi id 15.20.4457.020; Fri, 27 Aug 2021
 16:50:47 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "mst@redhat.com" <mst@redhat.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>
Subject: [PATCH 2/2] Prevent vhost-user-blk-test hang
Thread-Topic: [PATCH 2/2] Prevent vhost-user-blk-test hang
Thread-Index: AQHXm2OvqZ0e2ZotrEG7pS+9OWEqGA==
Date: Fri, 27 Aug 2021 16:50:47 +0000
Message-ID: <20210827164954.13951-2-raphael.norwitz@nutanix.com>
References: <20210827164954.13951-1-raphael.norwitz@nutanix.com>
In-Reply-To: <20210827164954.13951-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a40da87f-0b01-4d97-31b7-08d9697ad1b5
x-ms-traffictypediagnostic: DM5PR02MB3717:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR02MB371785A471E709C806ED0C36EAC89@DM5PR02MB3717.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ux/PhW0F1ofTYAXTYvI4+aGz//je5PT1d31ClEOyprKrMdN+DOZCI3qZZmWdFLY8nKmeLDwWe5Kx1IbxL0Uiyy3ARnedYBlxIBtxonC7KOGyLFRjgvnOIra2gPT0l6mdGJ8mkcN9O6zWkKS4PymX0N7Qw8CmiyGXIX1hTTxQDSPH0N7Nr6lY7U04tGwctSm+0h25ow/PEPv6Trmlcl7TL9H0Uueohoh9WTSfiAnOHgRoHGTK1uL2tVWictO68Nhj/U7G/zpJGgLTIvotNW+mtzxah0XeLCNSG6k/R+Q7KgpRqWWCjb4GF9oSSrc42hTkfhrLCj+5UR9UGsPNPpxwSTV47JWKOWgTPCGQoK7NKYV4cOGWIrpZgi+QHITLMU7k/akQyhrZkyjc322D46t05x+X+O1X7QPvsALUM0lJ5oxePgrByDAGwQ36QjVxe1O/OHxxfrehCiMQF3icj+Hoqx26cxXLIhKNAVkig0PYZ2vtHH0N9eV8m9La9vHGUjqtCQteyr0dwjp96GKPXi01gIAUXSiDS35I8D+5PItOCGc3yUdK8e35tUaO2k4QxLRHrHr7Hb9Uqdd7JhxpmMvkOIUTJEnmwVNgv4U3j39aFLfFSedQfkmYH0C8deVvWarBH/T65uwJtc6ntjYL+6bs3A+33q0PJN+RznddVDHLDuRaCZBkE51U3A+QxTii1a90WON8Bd53BlL4sYpiGvmmep5yG2iz7gPz8BSQDXCw1vwlI+gbWHfGY5dNKRGYudHkJ5Cmytz+SkYZPtUwNn3+y68VZa1AaZfiLWfBBr8922k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR02MB4539.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(136003)(39860400002)(366004)(346002)(122000001)(71200400001)(110136005)(64756008)(36756003)(6512007)(66476007)(4326008)(38100700002)(66556008)(26005)(8676002)(107886003)(83380400001)(44832011)(316002)(91956017)(2616005)(478600001)(6506007)(66446008)(38070700005)(66946007)(8936002)(6486002)(86362001)(966005)(5660300002)(76116006)(2906002)(186003)(1076003)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?J5zUNXUM0zmrDnji25b4ndVPz0LKyHRMzAgKE8IoXNZ6ReyoMdokUBLIYB?=
 =?iso-8859-1?Q?goR2dIb2MLsUtKTGYmS+QH5NFJB0OHIVPEA7zkBx5IGS6zja2s001hW54e?=
 =?iso-8859-1?Q?yCOTygDK9kuOBbtElIe+g/LraEX6OJHfgAnZ5dvxNtyQl8M1FIxsF2fvoE?=
 =?iso-8859-1?Q?2rCgr+3hsoWIEnH61m13SNojTEczKyXJDYdgyIr1NXenf8ss8NCR9IKfO/?=
 =?iso-8859-1?Q?CNOCU1qZj/Bo8JB102N0rVj29e9Ti0YTe+GJjp+Z1jONTtPnjfcQjH1Ind?=
 =?iso-8859-1?Q?LN8nRCzTdWCOgoTNS49UfmwnosvvHQsxtIDO+o+YSS1Bm3qNtEHAZsSJap?=
 =?iso-8859-1?Q?irGJBTDsE1w4oe0Gs/rcYJbaY6KMoK6++25235NAHVwpVr4mtsM128XyOL?=
 =?iso-8859-1?Q?LvAag5SPp6P1sQMlFuwiGHJ6/gGvLzlmDCSVYa++1VVckPlWVs/6jgcJEa?=
 =?iso-8859-1?Q?h/0l+E3yR00jDg/CjSzbioucPmKKiTSznl1n2sMEBbFcMBdKMKkzm7BUKb?=
 =?iso-8859-1?Q?qN1jLI6hyuhgFRkYNTJ3KHAoPzlBTgW2GNZtxUIf/1Fyv2qn1wXmdMPOd5?=
 =?iso-8859-1?Q?x9axb/DRLkZrd0CMVoOYyISlerWj+QxG7Vu7eewZjaYfNL4t0s46NzkeJX?=
 =?iso-8859-1?Q?UUWAS9t+jR4MDCYId84bd86TkI+soXuqiwu6aUggcjPGxpqJBgBA5moFvQ?=
 =?iso-8859-1?Q?0hkdoduF93cej7r9x9R+pz0nxi6cIIfATROqN8K7RaMXh00tsEJILbb7qf?=
 =?iso-8859-1?Q?5oAxUZnQI6ryY05TkcwiSZlKRsHLAo3X/gvSrpWd3DDbcnE8bhBGTImR6h?=
 =?iso-8859-1?Q?T1/DFgTsXNvTjZ4lx+308oEWWNySZW8eHwH7L5EArcj46daRNAbpSbJGgh?=
 =?iso-8859-1?Q?Y2xBVOF8ht0PPw/JnuIKnGqnnkAINPUFPBoEYzHTLIFCdcZQnVuvpAey/Y?=
 =?iso-8859-1?Q?ODolSoOY/X/NJVBGEnPv7yJXc+x2duFmoJHVoz/n7Cs2+Hxk2LFh3slr57?=
 =?iso-8859-1?Q?iX/qTc+4Py/lakemsPx4lVEqLdcoVeiacqfeDR7luAfxBPdiLxyUVwJcCq?=
 =?iso-8859-1?Q?3IRO5dRg6i4vPK6OdYILDMNR3zfAR97XweTVzJt5ePfioM8TU8NKKOUgr8?=
 =?iso-8859-1?Q?lV7arTaynA8YQQfv9OOHgprbPsupy7ApihaOk+gFl9VKBDyD6aSK5mUDUL?=
 =?iso-8859-1?Q?eGAxsBTdy4kX24NeVV3Mcqp452LKDIvFqsrby2NDKWzd3eJsDu+7MVOLrK?=
 =?iso-8859-1?Q?cHYw+Vc1pz3PvC/YgcmKy4ck2DMVbQf2siJl4DywEKHI3hPoIBMenLcQqx?=
 =?iso-8859-1?Q?R+uAH/O0E5DaE/q5n3g9y13Dw9XNERjd5NgK+YCFeXUEnoGIs3l1FA5HZw?=
 =?iso-8859-1?Q?W1lEDfzOUE?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB4539.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a40da87f-0b01-4d97-31b7-08d9697ad1b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2021 16:50:47.3686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EEn3TPak5tUTg29ZAHzodWwCWVR+UaDbQhoLGNaMybITcBHrKQmX0qojlw6UN6MOq/P2SMoOvmg0AMv583oi4sIRA/HAMcqZg9mYPfYsFe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3717
X-Proofpoint-ORIG-GUID: xTtkJGAeIh-cf1-GY_jUQkBSEpuHbhgm
X-Proofpoint-GUID: xTtkJGAeIh-cf1-GY_jUQkBSEpuHbhgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-27_05,2021-08-26_02,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the vhost-user-blk-test, as of now there is nothing stoping
vhost-user-blk in QEMU writing to the socket right after forking off the
storage daemon before it has a chance to come up properly, leaving the
test hanging forever. This intermittently hanging test has caused QEMU
automation failures reported multiple times on the mailing list [1].

This change makes the storage-daemon notify the vhost-user-blk-test
that it is fully initialized and ready to handle client connections via
a pipefd before allowing the test to proceed. This ensures that the
storage-daemon backend won't miss vhost-user messages and thereby
resolves the hang.

[1] https://lore.kernel.org/qemu-devel/CAFEAcA8kYpz9LiPNxnWJAPSjc=3Dnv532bE=
dyfynaBeMeohqBp3A@mail.gmail.com/

Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 tests/qtest/vhost-user-blk-test.c | 33 ++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk=
-test.c
index 6f108a1b62..b62af449df 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -21,6 +21,8 @@
 #include "libqos/vhost-user-blk.h"
 #include "libqos/libqos-pc.h"
=20
+const char *daemon_msg =3D "Block exports setup\n";
+
 #define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
 #define QVIRTIO_BLK_TIMEOUT_US  (30 * 1000 * 1000)
 #define PCI_SLOT_HP             0x06
@@ -885,7 +887,8 @@ static void start_vhost_user_blk(GString *cmd_line, int=
 vus_instances,
                                  int num_queues)
 {
     const char *vhost_user_blk_bin =3D qtest_qemu_storage_daemon_binary();
-    int i;
+    int i, err, pipe_fds[2];
+    char buf[32] =3D {0};
     gchar *img_path;
     GString *storage_daemon_command =3D g_string_new(NULL);
     QemuStorageDaemonState *qsd;
@@ -898,6 +901,12 @@ static void start_vhost_user_blk(GString *cmd_line, in=
t vus_instances,
             " -object memory-backend-memfd,id=3Dmem,size=3D256M,share=3Don=
 "
             " -M memory-backend=3Dmem -m 256M ");
=20
+    err =3D pipe(pipe_fds);
+    if (err !=3D 0) {
+        fprintf(stderr, "start_vhost_user_blk: pipe() failed %m\n");
+        abort();
+    }
+
     for (i =3D 0; i < vus_instances; i++) {
         int fd;
         char *sock_path =3D create_listen_socket(&fd);
@@ -914,22 +923,40 @@ static void start_vhost_user_blk(GString *cmd_line, i=
nt vus_instances,
                                i + 1, sock_path);
     }
=20
+    g_string_append_printf(storage_daemon_command, "--printset");
+
     g_test_message("starting vhost-user backend: %s",
                    storage_daemon_command->str);
+
     pid_t pid =3D fork();
     if (pid =3D=3D 0) {
+        close(pipe_fds[0]);
+
         /*
          * Close standard file descriptors so tap-driver.pl pipe detects w=
hen
          * our parent terminates.
          */
         close(0);
-        close(1);
         open("/dev/null", O_RDONLY);
-        open("/dev/null", O_WRONLY);
+        close(1);
+        dup2(pipe_fds[1], 1);
=20
         execlp("/bin/sh", "sh", "-c", storage_daemon_command->str, NULL);
         exit(1);
     }
+
+    close(pipe_fds[1]);
+
+    err =3D read(pipe_fds[0], buf, 20);
+    if (err < 0) {
+        fprintf(stderr, "Failed to read from storage-daemon pipe %m\n");
+        abort();
+    } else if (strcmp(buf, daemon_msg) !=3D 0) {
+        fprintf(stderr, "qemu-storage-daemon did not write expected messaa=
ge "
+                "to the pipe. Total bytes read: %d. Got: %s\n", err, buf);
+        abort();
+    }
+
     g_string_free(storage_daemon_command, true);
=20
     qsd =3D g_new(QemuStorageDaemonState, 1);
--=20
2.20.1

