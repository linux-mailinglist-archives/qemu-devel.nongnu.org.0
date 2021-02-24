Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D00A3236A3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 06:16:37 +0100 (CET)
Received: from localhost ([::1]:58088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEmXM-0000Jk-2v
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 00:16:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1lEmVs-0008Dn-Kf
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 00:15:04 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:34365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1lEmVp-00049O-7M
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 00:15:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1614143697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LMtEWh4dzUcrT3gODTG3EFpwqybs26UccTqI5ZHwCvA=;
 b=CxyoJ7Y4nssjWk6ct4yNtnT3ZBvoGGnHlcqHh+JfU5bMePRorzbAp8m5iNwbEDeRy4muOp
 i/ZR+7ed0nAqdIwPgVBsVdGOUCsA7Hi6vLfgvKgN4BjsOw3614/l/W6WwciUoUJgOgtGzL
 izIo4MbDhzDM8ea/gmzBLIr7+mK0xLs=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-BG3a16SaMH65VxhWLLdPgA-2; Wed, 24 Feb 2021 06:14:56 +0100
X-MC-Unique: BG3a16SaMH65VxhWLLdPgA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6bvnrovcPM7BIdjnv4ssrMbmPXME/kix19FQ/+TdfwD63atJTCbRI6Sk+vyQGOk2ZQDNECKjRP9ibKSTzyhFDoo91JEVVwRLhosGG+M7Ak9e89Eagb3yENw9kBxawaD1S8ndQIVP+xFPGRfCUSCr98T/wZHc/c2P21HMGu28HmdUjRVKn6nCC/cr92lNV25HqDoa2zRMksNQYtv2/FUCLbpCo1aYX7cN5PidWictk5zdtp3orcZCD1dOi+bZ/ymDYqw/LXYRXoTwspdmNkLkHELLIPozzYkrF5emom/nwW2b5hlPNLGeqXP4KtcydP6h/P+Avu+0oSGgp1NJb8Sfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqot7wCOyTTPvYQdJ/DiSWzrtCDo8yZCjFn0+lR+ibA=;
 b=X9tyQf/+7SBqhnqTZlY/HMhr4Gu5Xb7CX6dILIeAOAV6xcV5aETGph60m6M0fWTjRL56c1uLp6mt/stpaJYyRqc12062mpUAjvUCtsiGwE13VsZjuxEp86h6M23DI5lKWQcQW/SC5dDAqXOQ7FggcCBOVm9nQtI6trl0I2Mbn3pPasYWzgBwubncnb9a+2+aLfo2mhYiduH4sCZhgldFpTJbJPeUAOGFpc7j2SovE08qRVcxaxH5IEI7Y6V1+WfH4XAYd8Pi3/Pj32pVadNQ908S7EPv78FT4+CV5uh8khUeTWzXXQmpyWRelQKhAkROLUXJFIFcOwe3+GLePL3Zgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from AM6PR04MB5782.eurprd04.prod.outlook.com (2603:10a6:20b:aa::17)
 by AS8PR04MB7541.eurprd04.prod.outlook.com (2603:10a6:20b:29a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Wed, 24 Feb
 2021 05:14:53 +0000
Received: from AM6PR04MB5782.eurprd04.prod.outlook.com
 ([fe80::1938:fe10:6659:cb1a]) by AM6PR04MB5782.eurprd04.prod.outlook.com
 ([fe80::1938:fe10:6659:cb1a%7]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 05:14:53 +0000
From: Lin Ma <lma@suse.com>
To: qemu-devel@nongnu.org
CC: michael.roth@amd.com, philmd@redhat.com, peter.maydell@linaro.org,
 marcandre.lureau@redhat.com, Lin Ma <lma@suse.com>
Subject: [REBASE] [PATCH v5] qga: Correct loop count in qmp_guest_get_vcpus()
Date: Wed, 24 Feb 2021 13:14:28 +0800
Message-ID: <20210224051428.28037-1-lma@suse.com>
X-Mailer: git-send-email 2.26.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [60.251.47.115]
X-ClientProxiedBy: FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::7) To AM6PR04MB5782.eurprd04.prod.outlook.com
 (2603:10a6:20b:aa::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from p15.suse.asia (60.251.47.115) by
 FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.10 via Frontend Transport; Wed, 24 Feb 2021 05:14:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce4559bc-9d6a-4876-28cb-08d8d8831e0c
X-MS-TrafficTypeDiagnostic: AS8PR04MB7541:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB75414AD78C0D7A7D2DFEAC3EC59F9@AS8PR04MB7541.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wRmj/1j/Fx74VUx8P+3trN6r5gyULNHBvUFovMT9SBDeBKehHt34qsRaKPKFf6NTW7s7/PIX/1x7w1ibMYGfnZo4tmJXdT9TRmeu6LQnPbGqFZYIFkWBpXWcH2a/msm8il+M8GOofcnNBYdXBcnRk724DtgavKKPG3Wz7V0jJokyWK45LvP/nrSNg+hy98rrvE+d2ca9rIiVqltgxCFySz/QPBDwDRGqaIbg1kzLcnZbblRgHXKCIDY+yB3NNZ6B74CZW01K9Vmax7FAzuXZxGmLKVlWlvuFLgDohr665m+8U6XVGXR/wGC6EaNUJQ1gQ2xJsaORXwXpwW2QtyvsNZqJQVibabvkS+37Gyo+0wk3WACTbYnoOLhRRKAUT2kOf4LWPWJx6a6QmvKRmH4jRzrbOVdrKH2Il03vg3QjQ0gsgKlcR6IYtNXQD+sGVUDGURYCapmJc2+XYIdmXgg6tUF3zOW1vZA4c2Si/WTppG0ynf95Z30IQKGC3Af4lOBTyqK7DDtMAGsmh1asBWtxgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5782.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(366004)(346002)(396003)(136003)(107886003)(52116002)(6666004)(8676002)(5660300002)(2906002)(36756003)(956004)(316002)(83380400001)(6916009)(6486002)(6506007)(55236004)(2616005)(8936002)(66476007)(66946007)(16526019)(478600001)(1076003)(4326008)(186003)(6512007)(86362001)(26005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KOyzZJFcwLrEAaqHRGGmHUCLgdVftVrsTKwgRH8wY9rtesldU/7RoR5lhRkv?=
 =?us-ascii?Q?Uj4QpW9c3K7bjDj/pYO4PxKqASuZ40Ubo2exxJsc2jF7W1q8zhZgpr3Ovnxd?=
 =?us-ascii?Q?YenjQRR52Dfa6Q/h8vxGIiCzoF9ep2lRnhdD2HgTYqChohSA/PMoiAznVKeK?=
 =?us-ascii?Q?EA+C9gb5gtoO8DEuyialJ6R9MCRpd1g/idvs4pv1g8+wOZT0Ly0X8ghjRLMa?=
 =?us-ascii?Q?q6Qc0SUUCL5RV7GyPXrHYZbyxAzhxv4URhvXcX9zUZPoA/AUEWw+N4MNaQo+?=
 =?us-ascii?Q?qgGniGE2FQxoViQ70V7v8K1CrIRBg63YjwYCgnqvzZQgAm1W7xG60SmJbR5O?=
 =?us-ascii?Q?NGHHFcIPzl/zR+KpnyhMw2/zqGSW44U64ak4gwd8i1Hy6eK+qd0AsOb/+ea9?=
 =?us-ascii?Q?LQT6/e1L31kFgqAY3C38rFMy1bs/IzWcG85fWaG5wduDEJkTswIxhwYuGaKs?=
 =?us-ascii?Q?Nn7G0UkUOuYLzSbtcziyEt7wKkOLZGAjEipWlj2DwpZRc/o6tVOHBSBXBy+K?=
 =?us-ascii?Q?jD9+a5JOq8wzPNkZ9wFLiLj5TWqFrSUamt9wRGB4ERAdiZHPJPCrIVbKBfHt?=
 =?us-ascii?Q?nuE8ipNME8d+h9DtNI1+WnVZv4Zx8LOVvK5Za4Z4wpVBXE52Dr7oAwjO4I7t?=
 =?us-ascii?Q?hy0FlBKE9qli26sqhVap7f0YZbOh1ndmFX2LxMkb/6RNUXtBio0z4rJ2HIQK?=
 =?us-ascii?Q?tx2cLq5inthuz4QywUPhOP+WnP7RWTfRsJG5hSTgGCic5K1sZ0ijk42z49Wi?=
 =?us-ascii?Q?Mv8YL2/8skikGkGbLbaabdvKCa0DUkISRxDwoYSLrmaFRkiSJLmr/TkEdQBf?=
 =?us-ascii?Q?rKe5q4ZfgQYXqehrRQ38ZCeT1pazlUXbP2+TYNX/G0j3fBkbmcBScxxB/moY?=
 =?us-ascii?Q?7d3mHzY/hPACiYRKK+X6In2K18zptiSLfRBwtfgM9oftRJ/dx0e8maL0aQ4q?=
 =?us-ascii?Q?2LeLoifV4xad05qUKAC/MadWb42D3eQ+amEaWXqueE0UOfvS1/okpfw4Ya+F?=
 =?us-ascii?Q?YigkS+Wx9FLQh0YuSs1YCdCfudH7Ye9L1HiTVHGrkfFJj3K6BmBCJa6ojWkb?=
 =?us-ascii?Q?wipi83brDrcwnwePhrJVx8Uqu+n1B+4NacMEq0q7gxs2eAdQ9GucyxUrpKKS?=
 =?us-ascii?Q?FcfIGUx9GOedqjji8qufbkjE3fQ3xWOMUNTBelaT41cukF1JibuKSkSL16zH?=
 =?us-ascii?Q?16RRuVHaqCGgSma1gRXKtS0mn7XB7ZMJwqu4pXCcx1apx3WAVtRxlbxRCqaG?=
 =?us-ascii?Q?ETj2ay8ixArhwm4DqZCOzskoFIbKKsiK2Ap5UoBWxHjUCKLDBHjyoPcS/LSr?=
 =?us-ascii?Q?f2w3w15f9oFYh89Z+kWve8qe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4559bc-9d6a-4876-28cb-08d8d8831e0c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5782.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 05:14:53.2921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBz3YWzoDsGFOLmWCLen0oW8U8BcpjfQniIIYZBGWvI3MaiQPQio/s6T3Y5tmbqo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7541
Received-SPF: pass client-ip=194.104.109.102; envelope-from=lma@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
{"return": [
{"online": true, "can-offline": false, "logical-id": 0},
{"online": true, "can-offline": true, "logical-id": 1},
{"online": true, "can-offline": true, "logical-id": 3}]}

Signed-off-by: Lin Ma <lma@suse.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 qga/commands-posix.c | 43 ++++++++++++++-----------------------------
 1 file changed, 14 insertions(+), 29 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 8dd94a3314..530c98344c 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2385,24 +2385,6 @@ error:
     return NULL;
 }
=20
-#define SYSCONF_EXACT(name, errp) sysconf_exact((name), #name, (errp))
-
-static long sysconf_exact(int name, const char *name_str, Error **errp)
-{
-    long ret;
-
-    errno =3D 0;
-    ret =3D sysconf(name);
-    if (ret =3D=3D -1) {
-        if (errno =3D=3D 0) {
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
@@ -2473,30 +2455,33 @@ static void transfer_vcpu(GuestLogicalProcessor *vc=
pu, bool sys2vcpu,
=20
 GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
 {
-    int64_t current;
     GuestLogicalProcessorList *head, **tail;
-    long sc_max;
+    const char *cpu_dir =3D "/sys/devices/system/cpu";
+    const gchar *line;
+    g_autoptr(GDir) cpu_gdir =3D NULL;
     Error *local_err =3D NULL;
=20
-    current =3D 0;
     head =3D NULL;
     tail =3D &head;
-    sc_max =3D SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &local_err);
+    cpu_gdir =3D g_dir_open(cpu_dir, 0, NULL);
=20
-    while (local_err =3D=3D NULL && current < sc_max) {
-        GuestLogicalProcessor *vcpu;
-        int64_t id =3D current++;
-        char *path =3D g_strdup_printf("/sys/devices/system/cpu/cpu%" PRId=
64 "/",
-                                     id);
+    if (cpu_gdir =3D=3D NULL) {
+        error_setg_errno(errp, errno, "failed to list entries: %s", cpu_di=
r);
+        return NULL;
+    }
=20
-        if (g_file_test(path, G_FILE_TEST_EXISTS)) {
+    while (local_err =3D=3D NULL && (line =3D g_dir_read_name(cpu_gdir)) !=
=3D NULL) {
+        GuestLogicalProcessor *vcpu;
+        int64_t id;
+        if (sscanf(line, "cpu%ld", &id)) {
+            g_autofree char *path =3D g_strdup_printf("/sys/devices/system=
/cpu/"
+                                                    "cpu%" PRId64 "/", id)=
;
             vcpu =3D g_malloc0(sizeof *vcpu);
             vcpu->logical_id =3D id;
             vcpu->has_can_offline =3D true; /* lolspeak ftw */
             transfer_vcpu(vcpu, true, path, &local_err);
             QAPI_LIST_APPEND(tail, vcpu);
         }
-        g_free(path);
     }
=20
     if (local_err =3D=3D NULL) {
--=20
2.26.2


