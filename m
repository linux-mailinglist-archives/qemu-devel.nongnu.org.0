Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E13E2E00D2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 20:16:06 +0100 (CET)
Received: from localhost ([::1]:60832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krQf7-00005u-DV
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 14:16:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krQWN-0003HJ-4T
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 14:07:03 -0500
Received: from mail-eopbgr20090.outbound.protection.outlook.com
 ([40.107.2.90]:62614 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krQWL-0006a3-8Y
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 14:07:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkgi5qFXJemof1+PJFWHUWxISPfY+YBYskeY9qLeakKeSy1YLzqh3rfF76pvucacl3Z8hcCkT1pxMHCrNwooPfuweM99GGqQR9Hih5pF12t5SxtX/q8zl+w07AyJFEuAWetTJNwCuPgWzS8R2Uhyg+z3lpk/J8+HL5UhbBalCku1R8c3hZDTcrX/rQxV59oMp9JE/b0wIb6NUgKcSO1p+jj4mK23wG3gCa5BP9dHeJiWbB9SrFTGw8lv38NGYcn7dAjZMPi0NM7LiUTySwDzVCCQCCSESbHa13M9SamzOv1tUmmfSAtucU2/8DNC9g0bC7AAixfXq0fihWir0byP7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6Ys16+rUATdMCkvcsVfLfDueH9SncsVGYNMU3VmDr0=;
 b=BOjaNyYPOxtEJZosXPtf6Iueu4w40GRf7+4Lez9YCxHXmjskhDxotjyGzDAxmyiiBUNH+h73Yku6lD0X5Vwidwtvn6y2dXJpI7V4XU5OXnd2nmPMKgEOyMqxqH4mFHHeVA70AsOZ9z+QHTKjnihOiEn1k6VHt4lhCJdOU0E9p5sDvAFVNFPnff7MyarnaWIJKCeL6T0sk9Y7N7Mzrn87kL6sNJ4wNeRXTZXrO/Lkhf3p05I3qxGEDIqakbunf1OVDVZRifXE6ZjME0P/SDtF8GG+icBN3KE8PKwfpibYSq88E9wBFlpiJG7V1atUTSoqzc+x2WRYA0pDRHMIeqEtKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6Ys16+rUATdMCkvcsVfLfDueH9SncsVGYNMU3VmDr0=;
 b=hPnLQ57IDK4loDLBhLedgD8veK2opuXmBLxQom55D3fE4cN405CYC/18mG0caCQlpLCIUN0zmgLfpFNEqOrHvQ1cmy0yQABm5x9Dr7UiZ5pcMAEqh3o2VhnrmO86HHHF+ajtRbDJSns2QD7G/kdA4bBwX9HKxMOIv22QvgpQ0ko=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.30; Mon, 21 Dec
 2020 19:06:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 19:06:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] net/tap: tap_set_sndbuf(): return status
Date: Mon, 21 Dec 2020 22:06:07 +0300
Message-Id: <20201221190609.93768-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201221190609.93768-1-vsementsov@virtuozzo.com>
References: <20201221190609.93768-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR02CA0173.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM0PR02CA0173.eurprd02.prod.outlook.com (2603:10a6:20b:28e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend
 Transport; Mon, 21 Dec 2020 19:06:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd00952c-6adb-42d2-389f-08d8a5e3889c
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652E886EB4CD2B1127FF318C1C00@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:220;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p2yAOjmaobO7OpohaA3IAC5BJyDSdUuNtuSAjFYJXIiMDlW0ODinvk+nmYZ7el4UU5r7tDwT5lNAdow/agjJiqUqdb2M3lo6ifgA/ynTWzXeNw7mJ1WiwK535cuk61MfJ/tG8/CKfxvx/6Tes+3AcgHbT/tO2sD/i/BTjcN2h+AMQLs5Ko2Zme94cwLXzQH7JsYy6fjsTDxgEay76DjAgS1P0m9WIDefiEiMS4vDIYce29RA3NhP9RBBnfngam/V5qYDVeWG81e/t2gLBNNqO5IFsv6ZCvoa5C1yvVMT11z9w90qPIPWkI6/HzWxo46vzt8SyENisMTYTSlKgbfYECLdGzscMf6JgRGoLMIJy1gm4SYfdgKLDnawE281x1yHsjHA4q147kmdYBVFzGrjEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(136003)(366004)(376002)(478600001)(186003)(16526019)(6506007)(6486002)(8936002)(8676002)(26005)(2616005)(956004)(1076003)(86362001)(5660300002)(4326008)(66476007)(66556008)(66946007)(107886003)(6512007)(52116002)(2906002)(6916009)(6666004)(83380400001)(36756003)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?sSm3XXbFbh1cXOspHh0+kBREZKXdp+fAqAq4m6HWrPUIEEBE1kjV5yet8uTe?=
 =?us-ascii?Q?qjhdjDQSHovFJ44JbGZamQN5AZ+O3GfWFilKjSrJfOOvs+HK9GpQhx0u005r?=
 =?us-ascii?Q?g/iCjRIFejxKkJpWFOw696aETUZsBM4JeeDlQhS8dh00X4NDAquSxuWbII/C?=
 =?us-ascii?Q?xU3NOOck2XqgbIvZBLmqpVbdPjWx2shYKYC303l+k2QCznOw0aRR6W4IMu+u?=
 =?us-ascii?Q?K/BadV4CoDa9zbIfvX/uPWK57uD7MsDslRtyx2IZbVH8cAtHxKf6ULjWBdmV?=
 =?us-ascii?Q?a7OJm9+tRTDITI/mLC7A3HlJdcLR9ljwuBVOzU7mv2S7QchYxoApss8OTXoY?=
 =?us-ascii?Q?qmU2zE2zQWQJ3IWs1YYqxng9qlAaaWC2q22lyZiOMgAxKx+2w0uL3k8pz36g?=
 =?us-ascii?Q?G32qY4/IFzxBs0JAP8WkZgUhDkRBiefTZnBYcg3wFijKv2U71w7jtspfqe7l?=
 =?us-ascii?Q?Jvkp1JVsix1TZHr+yeZFP0+QgH+mN8YaLv9oeZnHzFgx++RHYlarBBBIe12U?=
 =?us-ascii?Q?uDL8L66oS2nQwm3hGSO7Pozzg2fBltRmVDCgaWl5g6xg8ko+lpOOR6i58NKp?=
 =?us-ascii?Q?WmURss1h7Wm/fzukrOxx1h+9NwCfqXGk9vHVYHh2mu9rx1pfv6fGP/7cHiuq?=
 =?us-ascii?Q?SdC9rDndcm3jN+jgzMMtYOLiBqULSJzgC9bfyPrw7nPDlr3mKMGiCMqPsuDo?=
 =?us-ascii?Q?kdoNCepNKPpMn/MgOOqnkbh+hHgfuP1HT3E50Rk7DzpirvRKmlJQB/oGYLw1?=
 =?us-ascii?Q?4q9NmCbnHh22DE9w9eAfRS0FkLSYtPmc1wugcjdgN/oWyjUU0xhOlaiH3V/8?=
 =?us-ascii?Q?wCdAKuCurX2Jf2kJeqTyahjInh29Mff+mGuVkeeYg5daqb4iG1oc1kjNkirZ?=
 =?us-ascii?Q?chgKtD+GB3iT2WyW4tFz0i/jx+Hr17yIip9kEOimQI5ybidTIJJFuwCkbHYu?=
 =?us-ascii?Q?NVUMsN46l6kkTufPP7L38FIK46BVa+ODZ4bWK0Lci5KrGQmuEjbF8Bw+aoCc?=
 =?us-ascii?Q?eDX7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 19:06:34.0197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: fd00952c-6adb-42d2-389f-08d8a5e3889c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVn1PQ5voQgU5MDJJq31LVO+v8mA/6zas7hqRIhGd4rp60eb6l158MX8uSHLwFulLsxuI8ahHu29PcwbZAK0FQfhMzokCbktjwHX5Bm1QQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.2.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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
Cc: den@openvz.org, jasowang@redhat.com, vsementsov@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's recommended to return a value indicating success / failure for
functions with errp parameter (see include/qapi/error.h). Let's update
tap_set_sndbuf().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 net/tap_int.h   | 2 +-
 net/tap-linux.c | 5 ++++-
 net/tap-stub.c  | 2 +-
 net/tap.c       | 6 +++---
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/net/tap_int.h b/net/tap_int.h
index 225a49ea48..57567b9f24 100644
--- a/net/tap_int.h
+++ b/net/tap_int.h
@@ -33,7 +33,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
 
 ssize_t tap_read_packet(int tapfd, uint8_t *buf, int maxlen);
 
-void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp);
+int tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp);
 int tap_probe_vnet_hdr(int fd, Error **errp);
 int tap_probe_vnet_hdr_len(int fd, int len);
 int tap_probe_has_ufo(int fd);
diff --git a/net/tap-linux.c b/net/tap-linux.c
index b0635e9e32..c51bcdc2a3 100644
--- a/net/tap-linux.c
+++ b/net/tap-linux.c
@@ -130,7 +130,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
  */
 #define TAP_DEFAULT_SNDBUF 0
 
-void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
+int tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
 {
     int sndbuf;
 
@@ -144,7 +144,10 @@ void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
 
     if (ioctl(fd, TUNSETSNDBUF, &sndbuf) == -1 && tap->has_sndbuf) {
         error_setg_errno(errp, errno, "TUNSETSNDBUF ioctl failed");
+        return -1;
     }
+
+    return 0;
 }
 
 int tap_probe_vnet_hdr(int fd, Error **errp)
diff --git a/net/tap-stub.c b/net/tap-stub.c
index 6fa130758b..473d5e4afe 100644
--- a/net/tap-stub.c
+++ b/net/tap-stub.c
@@ -26,7 +26,7 @@
 #include "qapi/error.h"
 #include "tap_int.h"
 
-void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
+int tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
 {
 }
 
diff --git a/net/tap.c b/net/tap.c
index 75b01d54ee..33d749c7b6 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -661,10 +661,10 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
     Error *err = NULL;
     TAPState *s = net_tap_fd_init(peer, model, name, fd, vnet_hdr);
     int vhostfd;
+    int ret;
 
-    tap_set_sndbuf(s->fd, tap, &err);
-    if (err) {
-        error_propagate(errp, err);
+    ret = tap_set_sndbuf(s->fd, tap, errp);
+    if (ret < 0) {
         return;
     }
 
-- 
2.28.0


