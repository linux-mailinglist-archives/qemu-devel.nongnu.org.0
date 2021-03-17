Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C876E33E798
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 04:24:15 +0100 (CET)
Received: from localhost ([::1]:38404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMMn8-0006cL-RU
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 23:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lMMlj-0005K5-Le
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:22:47 -0400
Received: from mail-eopbgr750053.outbound.protection.outlook.com
 ([40.107.75.53]:4470 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lMMlh-00011A-Dz
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:22:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEAXonHL1CjxVVgkNr2Q/ZzdEJj0Hd1MK/ZSMxOo0Nv1NIrNo1hFop5jtw4jvdf+nX814bhbLLMaYriYSq0PSzBPm3sZEYoWP4ilieq/Q6UTgyksXGrm15+jlqwe7scx55pc4QGcIglyAuvyQcxfcBIgyXhUXMNseRwoTHFLvQoLYC2mTVUJ4GyEGf8fZ/Ji4RBUOuyM0MxrJeSMvmbVdn70aeFwg7oDrL1do+kGwJ4pn7kDIGk0v0mdnsrTgylaXEBA4rPeVLMHyOP1mLkKXYMne85ywT5CHWNGniM5oe48H7fTLscFn0E9b7bm28MwTPC0jlQzdRPrTBUfvDyQCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLVHNmWfKpS5wSleofmGWUNZKm7XvJTuwf1TL5fCeJQ=;
 b=PQMX4alW4OFh/6G96q/GnrJdt0cbkM1sS79CLU4KFp3qvJ9wgxx8zOQpG0ZAYClwum0QHfB8VCQKMWwiaNuOEMZ+nGFIRYApcATQppO//lFV2FdVJnviOWl4tpQbC4ngrYrUTYe2ZSk6O4R63qjvm2MK/BXXEDKeNUFZrTHlGiwytqV4hqBXcAAtMwpgrK+F1HgOdY2pesdkNguuyMzQVOAnFhlRfTd7uWR39FyZB06xKaosEDCcYQN/aHSz9NiywlpR1Sy+qtaI7CEO0gAiEu21kMmhMRJ8oiIwxGW16nXvl7WGiENgbeLaVvrqBM6vitXxE8vaXZYgRuASnWnB2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLVHNmWfKpS5wSleofmGWUNZKm7XvJTuwf1TL5fCeJQ=;
 b=H0MIYfEd41WYdXHOb0/Od1nL6dGDht2qm+BZ3JvLeRPm8t6i16/czh/m/StZafZFj4HOHdO95EMNs24YG9Lbrov3zPkIBoWNozZeOwE1Yrp28o0Dkv6BUW0wjDYckdXxO6fwMpD4mSKJlpCZw+JnZP7Ce8jl16pOQ63C7IsiIWM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4954.namprd12.prod.outlook.com (2603:10b6:610:63::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 03:22:37 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::81f6:605c:f345:b99f]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::81f6:605c:f345:b99f%3]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 03:22:36 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 1/6] qga: Correct loop count in qmp_guest_get_vcpus()
Date: Tue, 16 Mar 2021 22:22:12 -0500
Message-Id: <20210317032217.1460684-2-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317032217.1460684-1-michael.roth@amd.com>
References: <20210317032217.1460684-1-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN9PR03CA0304.namprd03.prod.outlook.com
 (2603:10b6:408:112::9) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.84.11) by
 BN9PR03CA0304.namprd03.prod.outlook.com (2603:10b6:408:112::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Wed, 17 Mar 2021 03:22:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 12d4e74f-0cbf-468d-309a-08d8e8f3e986
X-MS-TrafficTypeDiagnostic: CH2PR12MB4954:
X-Microsoft-Antispam-PRVS: <CH2PR12MB49543B770A220F5CD785D685956A9@CH2PR12MB4954.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:651;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eyCuQ07y2TDcYd7RCOmAyrVekbgDCPIH2NpOVByLL06OTVw7gp4PjKHIUe6U2Gwmi+YbJhXoExoM2s04DIxH+4H+dQ3JLwjUK+EvgO2TRMHCBE3KM/oMq73yuz3DT5K74Ij5cfuyFd/x/3l5Cv2c3HFyxRoB/Wk7YCmVGwBpaaTLxwaBITUFIGIXovKSlUiP8h59XAcm572pNlGruUuZuJIt2+d+19qOWIMnX7MzlsIVoNME1laDZkVGLUfWFuzYuBoLetzx83tf0aADA+K2gKHJLo4SXwQf5cdEFzDgvLV4DL2PA6PkH2mxM89BTBCQbPuNwDuI8/Fihz+vN1MuL/5uRTGwfzRECs82yY6ldj9drBpwZve+mOcRMWdxWdSJ7nY03p+KT4qiRzoXoIRrJQALqDUcGyRUJOGwddtLuCSjGM4BHZE+u7lN2h6T9PKzn43IJQxZZ2yqtsU18nsJAwU51iljwFAQkbTQngAw4L9QaJpUHxzQsskLbLfVxKIyARLVljkc1cGjSjwQI3sFqIBVNohUrn7zJtCjouWxAa4m1JBoICE4g5KdwslhKhgH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(186003)(8676002)(8936002)(4326008)(478600001)(316002)(26005)(66946007)(54906003)(83380400001)(1076003)(2616005)(66476007)(956004)(66556008)(86362001)(6916009)(36756003)(44832011)(6666004)(6486002)(52116002)(16526019)(6496006)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UFppTkF3NGZNS0NCUlFkUDk1ZWJ0ZlpLN0t1RXB3emFvTDF0K01qNWZkZmhs?=
 =?utf-8?B?K0ViMlN0VlhQR2kySHJ6QVhqRkZuOGhRVUtlTEJHNnltSXNZOFhYWkUwbkRZ?=
 =?utf-8?B?am5UZmJCaHhHTlQrTEhGQmE5d0NYSWMrbGlQQ3dWc3l0aUdsdGg2MGYrNlRS?=
 =?utf-8?B?NndqK1lKT0N3VjExa3J5REF5MEtyMUZNV1YrWlltNVRhamVKT2FUbGpqYlN3?=
 =?utf-8?B?RmZpL0hYM1NieDhYT3hKMVpNY2ZFNVo4Z3NIYlNQYm0yN1VEbWZpMmtSaFZu?=
 =?utf-8?B?b2dBTi8zQVQ1UzVncXFPMWx1RW05MTdua2t2aFpPSUh5ejJhOWQyU0FTckox?=
 =?utf-8?B?MEwzTm9kcGRVT2dDUFdBVUZoRUl2TTcwV1dkT0RtWXo4dlZwUDJCOFRiTW1I?=
 =?utf-8?B?b2JUTU1wcEsvcTRCa2pNTmZ4Vy91NkxvbXdyT3dFd0JGejhxZDdsVzFuTHM4?=
 =?utf-8?B?RVNmUjhoamJUb2pCcXNPOHlrUXM3dmpPNEdyREFwT016SDkvSTl3ZFpaVW5J?=
 =?utf-8?B?U2dUUDZubzYzZFBWOEJkR0xhSWVkQStuVVVmNUdYOFJjampWdlNOcHFLUXI5?=
 =?utf-8?B?MGhDZVBJdU1EaE8yeFlYL1ZNTFhDSWhMQ0w5U2tpTzhoczhWaytqSHNkOGJH?=
 =?utf-8?B?RXRPTGF6NWJuRjZESjJGMDJBYVNUNk9lZlo0dnQveVFUcCttMm5nRy84aFg3?=
 =?utf-8?B?YThRRHZITHIwT1B2aEduQy9Tb0hScDNudHd1ZHlGUGNlaWlLY2tJMkEvZEg4?=
 =?utf-8?B?MXkvR2t5SGZiREpIT2VBRHhFVUJsUzh5TElNdlhUZUFDWkF2aVl0cEQyNGcy?=
 =?utf-8?B?YU5zWll3TnUwZDlOSkJWWlhnYVdRNitXZmxXZlh2N2hFWEd3RkducnF3clY0?=
 =?utf-8?B?L3pUd0xPMitINHlTb2FKQ0UvVzVFZzhGV3BWMjNJdDFDMGwvc3JxdmN3OFlz?=
 =?utf-8?B?YVNPTzgwSmROQUhtL2JRcFhvZkxOeDVES21CNGtYTkJ4Szl3bXF0MDNFeVRQ?=
 =?utf-8?B?Y2FGV1hSbnhLWlU0alhJRTl2M2NuSVlDZ0xtNVBWcFlGaEU0Q0FTRUxNTlFK?=
 =?utf-8?B?ekk5ZHQrMXhqMUxWbFUyeXhoM2tzRDhCY3dlUll6M3hpMFlJSis3VWdCblM3?=
 =?utf-8?B?dFpzcTUzVmNzR1VrcGNwekVxMkswSnhmZC9nUmZMcjhUc1d2emw2TGFaVk8z?=
 =?utf-8?B?eCtSQ0IwUFcrTEVCOEI3RUU4SUdaeVlna3R0bGorc2RhZSthS3VTRzhWai9X?=
 =?utf-8?B?YjZHUW5tRmV3cWNqV0tZSE1Cb043RWduNWxJOXRlQjVxaVNXcnhqdkVUMXh0?=
 =?utf-8?B?R1EyTmNIQmxOdDNBQWpITEd2Wnc4UHJxSUlRbERPTnpPdkR6TE1KM3l2VDdH?=
 =?utf-8?B?bnRRNmRQTnVJWXBvb3YrMGF3TUJUR2o3Rjc3R3U4UnRwbWRqK29WVnh1cFo1?=
 =?utf-8?B?ZVMrN1RQSGtYbU95cjdNS2ZaNVBlWm1UUXFZaksxRlE4KythN0Jvdjg4R2hN?=
 =?utf-8?B?K3ZlS2hrSDREaHorUjd0ZGZCWlVhV0Z5NDNDdjNWbXB5dUNkRjAwaCtrR3pX?=
 =?utf-8?B?cTBHU1E2VlhzeW1BcUVGaHhzclUweERabkh2QUY2dDFJSVduMTF3NFVpM3FV?=
 =?utf-8?B?Nzc2ZFJCbVd5TGZqRkx2eWtkMzF5L25Dc0lEaVBmY2lUYUJlVndNbjVZek1v?=
 =?utf-8?B?QWZtRGNrUG12a1lQSTdkdGZ3WldNZXRpWE44ZzE2OTA0M05rSHlCODlOSUFl?=
 =?utf-8?Q?iQDIy1Bh8dTXsevjtzx/7KTPwVeeLY4QaAkBXe9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d4e74f-0cbf-468d-309a-08d8e8f3e986
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:22:36.8096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/PykS3gHDxI+ADeLJ+4ucV1zMw56+JLKSPBNqix4csvXBP2hgt4kHKmKZGz9vYc1MNdy0UMQklkhnSBO5cM/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4954
Received-SPF: softfail client-ip=40.107.75.53;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Lin Ma <lma@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lin Ma <lma@suse.com>

The guest-get-vcpus returns incorrect vcpu info in case we hotunplug vcpus(not
the last one).
e.g.:
A VM has 4 VCPUs: cpu0 + 3 hotunpluggable online vcpus(cpu1, cpu2 and cpu3).
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

(QEMU) device_del id=cpu2
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
{"return": [
{"online": true, "can-offline": false, "logical-id": 0},
{"online": true, "can-offline": true, "logical-id": 1},
{"online": true, "can-offline": true, "logical-id": 3}]}

Signed-off-by: Lin Ma <lma@suse.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
*fix build breakage by using PRId64 for sscanf
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 qga/commands-posix.c | 43 ++++++++++++++-----------------------------
 1 file changed, 14 insertions(+), 29 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 3f18df1bb6..665735fd09 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2370,24 +2370,6 @@ error:
     return NULL;
 }
 
-#define SYSCONF_EXACT(name, errp) sysconf_exact((name), #name, (errp))
-
-static long sysconf_exact(int name, const char *name_str, Error **errp)
-{
-    long ret;
-
-    errno = 0;
-    ret = sysconf(name);
-    if (ret == -1) {
-        if (errno == 0) {
-            error_setg(errp, "sysconf(%s): value indefinite", name_str);
-        } else {
-            error_setg_errno(errp, errno, "sysconf(%s)", name_str);
-        }
-    }
-    return ret;
-}
-
 /* Transfer online/offline status between @vcpu and the guest system.
  *
  * On input either @errp or *@errp must be NULL.
@@ -2458,30 +2440,33 @@ static void transfer_vcpu(GuestLogicalProcessor *vcpu, bool sys2vcpu,
 
 GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
 {
-    int64_t current;
     GuestLogicalProcessorList *head, **tail;
-    long sc_max;
+    const char *cpu_dir = "/sys/devices/system/cpu";
+    const gchar *line;
+    g_autoptr(GDir) cpu_gdir = NULL;
     Error *local_err = NULL;
 
-    current = 0;
     head = NULL;
     tail = &head;
-    sc_max = SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &local_err);
+    cpu_gdir = g_dir_open(cpu_dir, 0, NULL);
 
-    while (local_err == NULL && current < sc_max) {
-        GuestLogicalProcessor *vcpu;
-        int64_t id = current++;
-        char *path = g_strdup_printf("/sys/devices/system/cpu/cpu%" PRId64 "/",
-                                     id);
+    if (cpu_gdir == NULL) {
+        error_setg_errno(errp, errno, "failed to list entries: %s", cpu_dir);
+        return NULL;
+    }
 
-        if (g_file_test(path, G_FILE_TEST_EXISTS)) {
+    while (local_err == NULL && (line = g_dir_read_name(cpu_gdir)) != NULL) {
+        GuestLogicalProcessor *vcpu;
+        int64_t id;
+        if (sscanf(line, "cpu%" PRId64, &id)) {
+            g_autofree char *path = g_strdup_printf("/sys/devices/system/cpu/"
+                                                    "cpu%" PRId64 "/", id);
             vcpu = g_malloc0(sizeof *vcpu);
             vcpu->logical_id = id;
             vcpu->has_can_offline = true; /* lolspeak ftw */
             transfer_vcpu(vcpu, true, path, &local_err);
             QAPI_LIST_APPEND(tail, vcpu);
         }
-        g_free(path);
     }
 
     if (local_err == NULL) {
-- 
2.25.1


