Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8C5401C97
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:47:10 +0200 (CEST)
Received: from localhost ([::1]:54576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNExp-0008QU-S9
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mNEcr-0005GE-9j
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:25:29 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:52122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mNEco-000235-Ih
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:25:28 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1867g9R3025550;
 Mon, 6 Sep 2021 06:25:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=+3WYhuyKVj3clAwyKn7KDUfxLW1Lz2S8+v5i0SIxpBA=;
 b=0epU/LJJ+tUVmBIPc5+RAVm9N0JJtgikInb49fnfw7E55AAsBQw+Qq/zA/JHMt0zRUoH
 hiNIwd6F8t5jXvvgG5Vddvu80pKdC2AQhzY2FNSummk5xM/LcLX1uehPpe7Dx61rT/Cb
 gNf3KVnHmOvja8d9KIJ/M3N+kBWg8Z8vc3EbsTmebxiBuEH9wYluP46BCJ7gTu4MokV3
 jyZzrLnYlpYrCoSdYMajncPZs2s5m+KBXV3zrIo0uvVQInLbz/J+b5VrMTaZtDRgNu61
 rK7vkIQnfVUrKcOEoCans95oABRNODiwpgPMghB8hHgxlt5CyhKfHxhk09f2z1nBNj3y Ag== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 by mx0b-002c1b01.pphosted.com with ESMTP id 3avxdx1pnq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 06:25:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncRbhHqAoMNrMIWP57zxd7+P7IogFWGavW0asgWyYnPvKS/zmV+y+HV+8Pd5+GsHLtP1TE3dCtPWAldkLuGdd4ypp81t7IkGRamd2mXgVc8rSbI09c2OWoDr3LfPZzWICX/yOnaoa10+LkOVU0VhTaNHlLxzn4QrghNTdn4mbeUrMP0StmZFmKXr3cQRGWXC4wV1jAV6z/poPbyAox6+DRH91NrTPINynhU6WJtNGouSmQk4p1LrWaLS6Bm/THHfjAAPOD5srqkG1dz4hafPAwgLPRMVrIrOzFQMYc392ASxE3Tve7lxa+KoADZAUbO6N+piUUqR1r6nKo/9Gyn2vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3WYhuyKVj3clAwyKn7KDUfxLW1Lz2S8+v5i0SIxpBA=;
 b=NTQD2uqX2A15xWWTGxjUiivZq3c1Y9NzLdKJh83M8uMIQtyCMqyOIUc+S9Rn6/lbYlV6fsHnd0wnbN+aqi0vwWDdFdqG2FXLXhfPIYbpf2zRi0ZmrA+SHHWG+8zOUpSTaZ//IQIpyehDp5DB3ANudGKZUDwjZllhcXf4deviAdakL3/pdeg5Drg7eqHySL012+7A3ATNVx05Tmn7jDZl7LmMcmwZv4JQQeDSJ4p+kN2ZnykrvipWuG/5QU83izz3xTewcQRs1KgEPx8FGd4hmc5uAe2QeOKsLCsd7u1LGVx1JBB40gYf9tLZo18Nmj9rAeQsPhg3vAqlxCcV1v7f2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SN1PR02MB3823.namprd02.prod.outlook.com (2603:10b6:802:2e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 6 Sep
 2021 13:25:20 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::992f:b2c5:6a7c:3cfd]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::992f:b2c5:6a7c:3cfd%3]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 13:25:20 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "mst@redhat.com" <mst@redhat.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "eblake@redhat.com" <eblake@redhat.com>
Subject: [PATCH v2] Prevent vhost-user-blk-test hang
Thread-Topic: [PATCH v2] Prevent vhost-user-blk-test hang
Thread-Index: AQHXoyKjk0StOk5CZE2d61DDJwYnBA==
Date: Mon, 6 Sep 2021 13:25:20 +0000
Message-ID: <20210906132508.15180-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bebabd8d-a5df-4cee-5180-08d97139c666
x-ms-traffictypediagnostic: SN1PR02MB3823:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR02MB3823FB609036F74935512565EAD29@SN1PR02MB3823.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:773;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8t84dIw71I30cy0qKY5HZKJJGG0CjuXLUzz2iK7oHHQjLoZJdvN6gOnYE/KshUAOHoOZ5WQLF6ATLSbKj65aLJCpUhYecdG9oFSJDZTRbuZLCV4y0XPeMuQIdXY28H6MHtF1x5ap7TmYqmKzUOL/17BuYYczjd2U8GIYujhdLc+UqYZ8vMbVRQS9TWjnUaI/EfFL8I/ufzYm9eQcD5l4X1jva62MQajCFTZXc3rQ+GrVgjtqWd0XbE4ssXmTiHouCcNrE7OCAgqW/NMbyRlDofCCfKz4tXvvxTUt+sWtE3a3hTwegAnz6A2guRlVIUqPG+3b7DKmvNLDCxx0CveDupPEuBBQFtr5bipMGhWpusjbWguJ0rzT72S0mBIO+bmncGISZFfhF/U8BZ/C4RwUwc4M7p1B8Bg46lOtmlM5E0kzkghkQP7fYfn9Ti3+plVXbOvwjskxySkKz/JrkBOiLC8oK0wi7VvmlAoZPdzKZaOpRqANmR1U+gX1KAj85tI00xDFMe/WFf9Axy5OuWwnLPV2ihWS8wmV9VWY8QDlOv/UiYRvkM4vz0pKTGC5jQUkkq34xFAUqenpVwvSKYq/FSWkV0ZzKs2ndMJODkWsF063sx3XYRGMJEDQw66Mg6dVwlWEZwNlFX7ZnAewyauOuwWDWN4XeQOGqoSIBe9KnHtvlI5fjyf4ACHastu5qQteRYwq4I9rks/HYdgml6kayZnicFC5RWxsLVMpm7y6tBfOBAkMRaLdBNVJIFtpR263hw9pclMTgUtxR/qzjTYTTANi8NBOdPIPFar3NpiTG3g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(4326008)(66556008)(2906002)(316002)(71200400001)(44832011)(64756008)(508600001)(5660300002)(1076003)(2616005)(66446008)(966005)(66476007)(36756003)(54906003)(107886003)(8936002)(6506007)(83380400001)(76116006)(38070700005)(91956017)(186003)(122000001)(8676002)(6486002)(6512007)(110136005)(26005)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MKiVWihFSJ5wlzifzD0Y1I0gBPxsAHH0GiC5iPyYde6QCByZEyM+G0eLE4?=
 =?iso-8859-1?Q?NpYhXk/UqXZigx9xDYSCRg546ro1QzlN32pMbkCnEh7Ua6LfSMTJtWBWNR?=
 =?iso-8859-1?Q?1v8HTpazgW+jBEF9lfbZxjOGAu+wWXdemF/TdPbOhY8cRDahFclTkozo1B?=
 =?iso-8859-1?Q?XAd/X2QGpmDyWzE2fBa7cTFuuvpJpnL2sg0dVPv1mQS286NL3JJB14unzD?=
 =?iso-8859-1?Q?UillQP/AUaGvQUswZna+kFd0hXCRQi24IZIbPOb/LA1szItXvEC/S1256v?=
 =?iso-8859-1?Q?ZAYF+zfyNjVE8YcDGxPG6jZVnWUXcRj27EukHVXWNagwTv7yfOZ/Yy00Gw?=
 =?iso-8859-1?Q?cslhjYJExUwvvVxX+Nr3acVxGfQeaDb/8cJ8Qu0xVtBInQdIvN63MREKOr?=
 =?iso-8859-1?Q?jGoK4d+oWwqJ1jv2j3QZX6MXolb3hj7LcLMEQ8BK94IE7hYTguVs800tYI?=
 =?iso-8859-1?Q?2Lg3tO5vnVgKZKSUE6RY4ZmRjIAUA2S4sNZ//UUT6dFXmzv7KeEVqpHtBY?=
 =?iso-8859-1?Q?zSC65pkUh5Gb1iumyfacZgZdY21VhQVhHbBUtEQlBnddXrvU1jEP8patZI?=
 =?iso-8859-1?Q?9bl02Jxw0Q7/haWJQ21FiGW7Kggj7S8LErCQwPZOCx5KHtjcqjxgcFDQup?=
 =?iso-8859-1?Q?JFYAPqKIhsxs/8zAPsFEDhE8rhlOQzT+Q8YCWQ8bDCkJp79y8anJM0cqk6?=
 =?iso-8859-1?Q?P4USol5mGb7I6MysSoN+Z5whNFOIBQRg8Aql9dq3xDUSAJ0nMztTyYW+g5?=
 =?iso-8859-1?Q?12BLP6vjjq13CKgQLIkeDMeKKy9NrFMQEtljPtAg1SquspxlflHfevRj6G?=
 =?iso-8859-1?Q?8kyl5Hvf9V3y/1af74VUZriPnKbAfToLiSy2irOAbyOC1sEmr7FvVRBLw7?=
 =?iso-8859-1?Q?r3nrvoetEsOIl6JYmAWuxir36NZusCpNP7uYWQDIteGUZoTTP+XWWeefzs?=
 =?iso-8859-1?Q?IQAk/EibR7mNOR8B2GxQg2k9NVrebyQkxVYdNABB/PgTA7k+thqIv6lcCi?=
 =?iso-8859-1?Q?D5YjLo8SrS8VI7ofsLciBDrSB/BC8Hz3jlvxkUaC/7FKNpiWt3cWyNVgKs?=
 =?iso-8859-1?Q?hugnW/wF2lFE8oUT0UsA+mUZ+Z4hCQ0PMtOqItHoiD3rfRuDQFyaVUor78?=
 =?iso-8859-1?Q?LtXc23veh07naNW28yh1qRLFyQMHnU8UowIqucbCLyYqYizDqhhiP+JGEy?=
 =?iso-8859-1?Q?paxXBq2YVNCgtqTTRbAgzINDjHVf/vihDc6kAwPwDJhs/hivQTTwyGwXD4?=
 =?iso-8859-1?Q?qTDusTSGWvvZvEH3ziP/zfML/1oacJbJKr+oB9yy1tt0oiIVzm6lRKelA5?=
 =?iso-8859-1?Q?4CIJB+sekz/Y+cEIW39OWYI3EC+rwHEjwFbUE/13UQeMdS2uk0mqdJqtpK?=
 =?iso-8859-1?Q?bbel3vs9F11aLHI1xzcMtHXU4sVUXuzw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bebabd8d-a5df-4cee-5180-08d97139c666
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2021 13:25:20.4575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rGRoxRf0nZj2gHiCtkyxp7t7jAyyXP/XGsynPas745LZI7tb9dc5RYx8/J38gD8J9BkybB9deYkTb5HdjoAd7MHEUypPYt4RGbl79j2PaA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3823
X-Proofpoint-GUID: oj0hHN4metDzh8lE9_qWgrbKnW_jvTGE
X-Proofpoint-ORIG-GUID: oj0hHN4metDzh8lE9_qWgrbKnW_jvTGE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-06_05,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
 tests/qtest/vhost-user-blk-test.c | 33 ++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk=
-test.c
index 6f108a1b62..78140e6f28 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -24,6 +24,9 @@
 #define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
 #define QVIRTIO_BLK_TIMEOUT_US  (30 * 1000 * 1000)
 #define PCI_SLOT_HP             0x06
+#define PIDFILE_RETRIES         5
+
+const char *pidfile_format =3D "/tmp/daemon-%d";
=20
 typedef struct {
     pid_t pid;
@@ -885,7 +888,8 @@ static void start_vhost_user_blk(GString *cmd_line, int=
 vus_instances,
                                  int num_queues)
 {
     const char *vhost_user_blk_bin =3D qtest_qemu_storage_daemon_binary();
-    int i;
+    int i, err, retries;
+    char *daemon_pidfile_path;
     gchar *img_path;
     GString *storage_daemon_command =3D g_string_new(NULL);
     QemuStorageDaemonState *qsd;
@@ -898,6 +902,12 @@ static void start_vhost_user_blk(GString *cmd_line, in=
t vus_instances,
             " -object memory-backend-memfd,id=3Dmem,size=3D256M,share=3Don=
 "
             " -M memory-backend=3Dmem -m 256M ");
=20
+    err =3D asprintf(&daemon_pidfile_path, pidfile_format, getpid());
+    if (err =3D=3D -1) {
+        fprintf(stderr, "Failed to format storage-daemon pidfile name %m")=
;
+        abort();
+    }
+
     for (i =3D 0; i < vus_instances; i++) {
         int fd;
         char *sock_path =3D create_listen_socket(&fd);
@@ -914,6 +924,9 @@ static void start_vhost_user_blk(GString *cmd_line, int=
 vus_instances,
                                i + 1, sock_path);
     }
=20
+    g_string_append_printf(storage_daemon_command, "--pidfile %s",
+                           daemon_pidfile_path);
+
     g_test_message("starting vhost-user backend: %s",
                    storage_daemon_command->str);
     pid_t pid =3D fork();
@@ -930,7 +943,25 @@ static void start_vhost_user_blk(GString *cmd_line, in=
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
+        if (retries > PIDFILE_RETRIES) {
+            fprintf(stderr, "The storage-daemon failed to come up after %d=
 "
+                    "seconds - killing the test", PIDFILE_RETRIES);
+            abort();
+        }
+
+        retries++;
+        usleep(1000);
+    }
+
     g_string_free(storage_daemon_command, true);
+    free(daemon_pidfile_path);
=20
     qsd =3D g_new(QemuStorageDaemonState, 1);
     qsd->pid =3D pid;
--=20
2.20.1

