Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE352B8DE5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 09:50:52 +0100 (CET)
Received: from localhost ([::1]:35860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kffeV-00026s-Ny
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 03:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1kffaS-0007X9-T0
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:46:40 -0500
Received: from de-smtp-delivery-52.mimecast.com ([51.163.158.52]:31968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1kffaQ-0002xW-6s
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1605775596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9Pa41EvQVgj2EEnGgjvmsBVpaXQ9RGvfaal8sJUz9D0=;
 b=gyd4OGWqoXdW3FJ4qMOJTFtc6p8tmEdysJ3tL7ZP3nQp+T8n8zsQNRd14+AkYjNc5GUKI7
 EW/Uxm4Vf1M/DlH8GSaXeRWPDGcpaj+yTG2Tn4qIv4bUu9havM+mDn2WVaB0fk4LUSsnro
 BBd552YKykA7GYWM+yHPXJZ+USaGE7M=
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-onkXMuEAM--8LI2ED5tAEg-2; Thu, 19 Nov 2020 09:46:34 +0100
X-MC-Unique: onkXMuEAM--8LI2ED5tAEg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oY8MBUmaTecjtdOSZ319DutYk/YaFawcG74q5EUC9yJ/hNZmnk9sRUsltYCIkONXN+sTkztGdr2Y6XHk1yAB5bopqEkRBuwLlMlpUEw0rzAE26GHMYnIRo3X3bk2GLaMv7XUsX/+qf3mUxIX7g+VYwovXwudJhpVr36AN4HG9YK13s2d1t2VsuWFTzLHUIyCoYcrZN+nB3vih9WpamWUn7eO7XoLURmz9E4zCsjdkAFg3U3BzGuxvWRfCsNAKCdNqxIvZ8UxPZ4YqI+P+iTnX9h5J6HmXnFSEtUHRXPgopO0f9Vul0uuwcPCjU5bD/Kp0+64IdiY6MSC8k2sHTLZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBnNx8q/P6oLZRHd7SftLIZcXiVNz03cb0gKY2rRoWQ=;
 b=bzLAM4ubHPhB1ugZaL4CISmsqwOR0sBnk7WuFe1e+dFWLAVIJkTMqbZbYsidiNWaXa5K2Jk1kIn6dZ/VtocsI0hBlZTUxH0vMpW1Abs2sQozcW8rv+5BhfvYtEJfFXYv9tZJ4fD64e+TeyCEZWiMYyuj6T8p0/P03lNM6xOF8KAl8BoTOw1pUSnGHz3qJKmG0e88ck5BVv43tU+Li+xO91DmWk8ZDApXIv/mH87vy6agg1lxM5CMIXW78hCFzGMF+/+n1gZrwpwkN4eE73zBJX/O3py08PKSJ/iLki5rZxshnH4O26y1Po4JMaOkGZF2Qt0Z8HENMfU8C0M3CvlAiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from AM6PR04MB5782.eurprd04.prod.outlook.com (2603:10a6:20b:aa::17)
 by AM5PR0401MB2580.eurprd04.prod.outlook.com (2603:10a6:203:38::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 08:46:32 +0000
Received: from AM6PR04MB5782.eurprd04.prod.outlook.com
 ([fe80::8945:92d8:e72a:6245]) by AM6PR04MB5782.eurprd04.prod.outlook.com
 ([fe80::8945:92d8:e72a:6245%6]) with mapi id 15.20.3589.022; Thu, 19 Nov 2020
 08:46:32 +0000
From: Lin Ma <lma@suse.com>
To: qemu-devel@nongnu.org
CC: mdroth@linux.vnet.ibm.com,
	Lin Ma <lma@suse.com>
Subject: [PATCH] qga: Correct loop count in qmp_guest_get_vcpus()
Date: Thu, 19 Nov 2020 16:45:57 +0800
Message-ID: <20201119084557.27870-1-lma@suse.com>
X-Mailer: git-send-email 2.26.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [60.251.47.115]
X-ClientProxiedBy: HKAPR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:203:c8::12) To AM6PR04MB5782.eurprd04.prod.outlook.com
 (2603:10a6:20b:aa::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from t440p.suse.asia (60.251.47.115) by
 HKAPR03CA0007.apcprd03.prod.outlook.com (2603:1096:203:c8::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.9 via Frontend Transport; Thu, 19 Nov 2020 08:46:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58508341-f3cf-4b4f-df96-08d88c679d19
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2580:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0401MB2580467FFE4F75B60BA58D88C5E00@AM5PR0401MB2580.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R5h+ei29JBz+AVMANCq/65mXq7V1/8R4ODzPc4oqGAsJLZEjgKLNBW7qIdBz1h/9PvUIeeapr2UX9UN1rYfGrjVGM+ZybK5VBKw89juXuq3Na2VEEO+vJ/aMFMmOZT1l8oH6qN+2f045WGKmuoDIJECTzpMrE2qxMx+Oiod0EPEiVf/KrPHS09kFw2gweXPQAbxNMWIV4VJgly+EkpB7CXWXHBCVMQsLIPjwy6MaX2RxBc7EICenGqRoCf5CDHWU+Z79+IiU9Dd6qFY2ZS3S4FxpZXo8xNMc+PQffYux2HM90VybUNxxyY41r8HlDWF2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5782.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(136003)(396003)(39860400002)(346002)(16526019)(186003)(5660300002)(66476007)(66946007)(26005)(6666004)(36756003)(86362001)(4326008)(1076003)(6512007)(316002)(6916009)(2616005)(6486002)(2906002)(956004)(66556008)(52116002)(478600001)(8936002)(8676002)(6506007)(107886003)(55236004)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: TQbqvb9pAOFb090W+ZMeK9o/ahe4pwzxQqu5LQe4L/mBgkVZsC4z5jmSFAxhWCcdChp7/ugDVUm83cZGhHsmcv9syjFa6hFN25TaiA8TYG+Of6DSiXOCCSGzkHGWft80MoTwWhgizA2jZWkqcCot9dfswFEUtI7COwEnTLC12K6NQnt2UGfYMcHW9lAPkQerVGSrDMpmgxuysHinaMNjSTR8rbtfu6tHP0QVFcH7oj7pNKh/98UVAUqYCBKtxJV8PuPyGsoflQKS8NWxGyaIdTIMSjOsMoKc/wUzqJ9OKzDyDCAuvPOd3D1tFvZKMYciAxKmgMAMCZocbKW2Bgro6Y7ltCPPG9adCIGh+Ym7Sjtpj8VESsTKYoQrQibn+3es9nRxehoBlOrBa62QL3Y9d8lbdAvuECGYM0Vuy4rUk4kPm2YnAsaJjaOLQelINkAg/x6JqNTLZ2woYb0pYTpHhqmTGo/mR5fDNZp0lBSKhb6Lj1OBlt+aao5I2XYHqsnbHixyRgqxVCypGmqtoQuy/IFDddyHY9S4U0tgwMj7czHQvHsktjujQvcJa7ICWqCiTpZwSvJDvEYA1TVxWXyYfs3KQyRQdv7T4DDbqLGxJEYIdcjvt4wsf9I746/NfXl8whpXSPxOCxbAGowQEd8SyykTOW84Rs68JM8u6smvNn3FvIGsyPosXL99Nt72mwol9MNN7/mtP1hi2tEa1BOKm47LBHE/DhK4/knppLspvZx0S5DxxPmsjvsuSnSAKDbrs/IFNYy17qhJKEbDJsNQVFsLb0xXRnhM7+AozDeoiYfdiqo5mZfZyS2cqRY2Eb8dsqabFAEAWUtbQUIbg9JQVp3+ILHTAmvuR9Cad+IVlDwZlldUEFBDH5Vfhr29Bcwm+Y4Riu9xmOzSsLR/M+LHWQ==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58508341-f3cf-4b4f-df96-08d88c679d19
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5782.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 08:46:32.0322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Iv/u4faITSq4iczP4SPBXe+KIpolWzjXcW3PQDaKqdtblsyxm6nrjU41t3xls4a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2580
Received-SPF: pass client-ip=51.163.158.52; envelope-from=lma@suse.com;
 helo=de-smtp-delivery-52.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 01:09:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The guest-get-vcpus returns incorrect vcpu info in case we hotunplug vcpus(=
not
the last one).
e.g.:
A VM has 4 VCPUs: cpu0 + 3 hotunpluggable online vcpus(cpu1, cpu2 and cpu3)=
.
Hotunplug cpu2,  Now only cpu0, cpu1 and cpu3 are present & online.

./qmp-shell /tmp/qmp-monitor.sock
(QEMU) query-hotpluggable-cpus
{"return": [
{"props": {"core-id": 0, "thread-id": 0, "socket-id": 3}, "vcpus-count": 1,
 "qom-path": "/machine/peripheral/cpu3", "type": "host-x86_64-cpu"},
{"props": {"core-id": 0, "thread-id": 0, "socket-id": 2}, "vcpus-count": 1,
 "qom-path": "/machine/peripheral/cpu2", "type": "host-x86_64-cpu"},
{"props": {"core-id": 0, "thread-id": 0, "socket-id": 1}, "vcpus-count": 1,
 "qom-path": "/machine/peripheral/cpu1", "type": "host-x86_64-cpu"},
{"props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, "vcpus-count": 1,
 "qom-path": "/machine/unattached/device[0]", "type": "host-x86_64-cpu"}
]}

(QEMU) device_del id=3Dcpu2
{"return": {}}

(QEMU) query-hotpluggable-cpus
{"return": [
{"props": {"core-id": 0, "thread-id": 0, "socket-id": 3}, "vcpus-count": 1,
 "qom-path": "/machine/peripheral/cpu3", "type": "host-x86_64-cpu"},
{"props": {"core-id": 0, "thread-id": 0, "socket-id": 2}, "vcpus-count": 1,
 "type": "host-x86_64-cpu"},
{"props": {"core-id": 0, "thread-id": 0, "socket-id": 1}, "vcpus-count": 1,
 "qom-path": "/machine/peripheral/cpu1", "type": "host-x86_64-cpu"},
{"props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, "vcpus-count": 1,
 "qom-path": "/machine/unattached/device[0]", "type": "host-x86_64-cpu"}
]}

Before:
./qmp-shell -N /tmp/qmp-ga.sock
Welcome to the QMP low-level shell!
Connected
(QEMU) guest-get-vcpus
{"return": [
{"online": true, "can-offline": false, "logical-id": 0},
{"online": true, "can-offline": true, "logical-id": 1}]}

After:
./qmp-shell -N /tmp/qmp-ga.sock
Welcome to the QMP low-level shell!
Connected
(QEMU) guest-get-vcpus
{"execute":"guest-get-vcpus"}
{"return": [
{"online": true, "can-offline": false, "logical-id": 0},
{"online": true, "can-offline": true, "logical-id": 1},
{"online": true, "can-offline": true, "logical-id": 3}]}

Signed-off-by: Lin Ma <lma@suse.com>
---
 qga/commands-posix.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 3bffee99d4..accc893373 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2182,15 +2182,15 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Erro=
r **errp)
 {
     int64_t current;
     GuestLogicalProcessorList *head, **link;
-    long sc_max;
+    long max_loop_count;
     Error *local_err =3D NULL;
=20
     current =3D 0;
     head =3D NULL;
     link =3D &head;
-    sc_max =3D SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &local_err);
+    max_loop_count =3D SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &local_err);
=20
-    while (local_err =3D=3D NULL && current < sc_max) {
+    while (local_err =3D=3D NULL && current < max_loop_count) {
         GuestLogicalProcessor *vcpu;
         GuestLogicalProcessorList *entry;
         int64_t id =3D current++;
@@ -2206,6 +2206,8 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Error =
**errp)
             entry->value =3D vcpu;
             *link =3D entry;
             link =3D &entry->next;
+        } else {
+            max_loop_count +=3D 1;
         }
         g_free(path);
     }
--=20
2.26.0


