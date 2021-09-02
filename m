Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9BE3FEC53
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:42:17 +0200 (CEST)
Received: from localhost ([::1]:33512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLkAi-00028z-OG
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLk74-0004Cw-W1; Thu, 02 Sep 2021 06:38:31 -0400
Received: from mail-eopbgr30115.outbound.protection.outlook.com
 ([40.107.3.115]:38273 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLk72-0005xI-G9; Thu, 02 Sep 2021 06:38:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgmBfjJFbp+2NGZys87eQ9FU1ee+74V2jwElj63HyzLCF1zZfjL/nyVgVRblmKqWANkgH01s1Z1hgWO5o0wCk8DInWE+0pygERWDdqn4np3HR9aS1Wkyj/aoRl2FzFV284FZ3ijg4iEzlX+PFZEqwLTVz0u/8sL/wuD2GHNl3gV7q4+upBFHslAcxrOIy02cNERbzRNYX85bGt1NTeW9TOFleQgdAp0IcXZ0PDTVWzwun0A7IoybOuMosVm0DMS+/YzO3qQp9LZ4YeDOcuAAmFya3KPky3AI4vjesm2YAdH2zvkmlcx0gL5kO1kqDFc0CNWzXjoaquemzfgd6/qNag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=rZymh/Mn2y2PEqQKhaEyjBjDdoi1qVit12CS1hn4lGk=;
 b=fcK1pMmAsFBT9O/iSZyDdIeWgi87UP/qTlInNMhZ0Ok0u9l5BacByDmeFXsJ0BRbUtVwthBSUNysQ/GjeDTDG2eyN4lq3uDJUdwQAbnYmk0LksTAtRsF0yCUoCxw65KNka47D4jbo0YbPf1Tz9+FF4aFGtsm2BW+t4lVOcjmH5CDcPMLLI8pDnDQeAd72MvqOGi0hMimZJJxNTIRaZ3NBcDyqG84q0qbzxNL+decbuzM/unrcPfI/Q75FZ9MF6KYq+QPKWoTgHBbp4q0tu1vSmON2xeemRxqwmPIbq5wD+OMDKrByJvVrB/QMcL4wmftp3qqFAIwYHieCiEZYOgQ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZymh/Mn2y2PEqQKhaEyjBjDdoi1qVit12CS1hn4lGk=;
 b=c1qtetXsqtCEyw8wep7YUz3dAf/hocX8DchaITcyNnd/rml6qJ0uKSyJuGm9v2oWBrfBoqVyX6BJNI7bMkvLZDqDfFp50v0gNtGOshLW/l/7ueQgPeZauB0b1qQRPLky3liyO6d9ZauXIJzjeT/CRp/6YhVDJtAjS6IOZQKeCHI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4472.eurprd08.prod.outlook.com (2603:10a6:20b:bf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Thu, 2 Sep
 2021 10:38:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 10:38:23 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rkagan@virtuozzo.com
Subject: [PATCH v6 1/5] block/nbd: nbd_channel_error() shutdown channel
 unconditionally
Date: Thu,  2 Sep 2021 13:38:01 +0300
Message-Id: <20210902103805.25686-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210902103805.25686-1-vsementsov@virtuozzo.com>
References: <20210902103805.25686-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0037.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR0402CA0037.eurprd04.prod.outlook.com (2603:10a6:7:7c::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 10:38:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbc3e794-039f-4643-a256-08d96dfdca1c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4472:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB447277A43A135F5EA16EF0C0C1CE9@AM6PR08MB4472.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:366;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WOMAABLwjtDEkJRrx6qlxRxZXcdV8N5vWuq5LILvNyC/ECoR2F3U0YBsFXeFdNLBO18mu/n85iwmIj0JCnZfBixyjquwGI/PSStPM04s3pId4dXsig9Vf0PtsQeSHmdbvg5kex34YkMpm0GxmbCjqJAXfYyLRSFK75ZzqsO3cMw0+R9/G46GKAkEfThgxCBbfJSrsktwEppC/AvUF8R5rdNOqU9UNarSsjpjF/V8Tbxl93v+knyoRLcFabp6dS9t2MzsRapyahLunmtbKOgKu+UWuXqz/QXB7nywGezCpK4jRYSEJfhW1VzFKp37t3mEoKA2aCvXONXeivNs7/NenN9rlfH4HUAkjWas8hzIHz0wwntxS5Wug0hornnHhFMUm2DnkIfg54Gv1vlBj3WcDKS3jNzW4NRtxMxHyWjCcV/tzQK6vcQPZQ99YYyVh0/iBbWZzWV7MuK0K0VHNpoD4R9lkgvgl2PEdUNXpvdHDhgvsj9JE/V4UuHSA0fc0nC8vxH1FablpqxDN0omccJUlqf2c1vEuiJ49bQtrLKivk1+ordvmUZAqNw3Zk05nlgbTWIckpPC9jEWBggWS95TlvvVO7rNKOI2GcS/FsN1AlVpZ3YU8YFUYwqHnhwUk54juR7c21jDlPgVM4aVOWwId9AGDhf1Nb/JZmHjW2UOF2oex6epk20whBxr79EZZqX9Na5e245P2UMefEO2NWtjpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39840400004)(66476007)(4326008)(26005)(6506007)(66946007)(6666004)(8936002)(1076003)(5660300002)(316002)(83380400001)(186003)(8676002)(6512007)(38100700002)(38350700002)(4744005)(2906002)(107886003)(66556008)(36756003)(6916009)(52116002)(956004)(2616005)(86362001)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C6TFzY5NxSQATtQGtMEd7ZA/6vKQbvAnKsmAbgIKIJ3f2dAs7UJ/s3BDU5/Z?=
 =?us-ascii?Q?wYmtxmaIlmq48oXz1HgBUKCEKHVf9hU4EndGgf09vlu+UwBzTvdG6hS3d9Wy?=
 =?us-ascii?Q?CEDllWghXGXIaCO84Qu6aJT/1E4ZYSQizslcQVSc8E3DzVm3w6KpAi0kpcO2?=
 =?us-ascii?Q?6TtNZ8kVLbkTDEpY2RLEoatmHjJyHFzP/9yNjU9I6KjxPNxFvuDuTN26W9no?=
 =?us-ascii?Q?i8BGoyucLQ34JmENX83DWyRKWrBGEEJ6zENKQp1mOj0Mk6Xyo++h4B8EsMnG?=
 =?us-ascii?Q?G4Tl3tFUH+WLcPCtbh3xjMJIRTFVLpPtSqL/7N3CL+kMogOHQ9kKk+q+u6cW?=
 =?us-ascii?Q?dRF4yLOgigyQmGBET5oKwFjL+MrVBC16rHcVbN5EtjlY+4kdA2wrCgIBesOB?=
 =?us-ascii?Q?2uZeP47oA2qxetBZ0mxwAU3gsvmeftwlsdKeE1Gz+h8qzeEwxLXaCzKQvhBT?=
 =?us-ascii?Q?40huIdMhmZXerIHMpSKrxjrZ0rpnDnsuVAV67TGxL7KYZWg6c2IYE9ECcfPO?=
 =?us-ascii?Q?Y2ZABR9S2Kd0AKsYkY6GSVTpVmoz+Xb3tUe7i+U6RERoSS9e3ZhSHtxb1Oeh?=
 =?us-ascii?Q?z3oflQPRxAVf9kpnFso7M2TL644HwTewReuJq9rMWNkdEoG+L9Z23pKo04nx?=
 =?us-ascii?Q?9wNoz+2A6ywXdVLsZCw0d5cqhJ9K3oYA4KZ+JKt39EQFgNuSadaECVhyvBeO?=
 =?us-ascii?Q?Kbqg/LIp4hCPeXJtaKx8bL9HMaH86Ag9pcX7wJgY9uYa2gYzK9C9cTMgrFpk?=
 =?us-ascii?Q?uOTysyKSeenpY16mbX3AcZrZuhF8Oq1nzddB6TCwO5e1Gz3N5UKbREg/v6XF?=
 =?us-ascii?Q?j0LvKsdTvcRqGZhdqm2yiSV4+3brVKVlfPPX0a/+7eq2oz/IOOq1vO/fR9C6?=
 =?us-ascii?Q?/tf1v8O3gP8eRDB9si9YVRz8coHR5b24SkDjEgVFph8mQQeaJf/DKIAesT3V?=
 =?us-ascii?Q?HBTGeEhOshNSAJlvUniI+PjMWW7R9Byekx6iExhBjnw30+trFcg/W/FkoAc/?=
 =?us-ascii?Q?ql8pdjmuf59ikehOLyZXRfCI3aZQEIH4mDpi97N0CRDSJMI0fT/uSkFGxLmp?=
 =?us-ascii?Q?/JXtH6sg1ziLVw3z4MCW5dTlMkSRQmUvlX7z785RHilyuJCGhKMBEBD2nDAK?=
 =?us-ascii?Q?XH1hoEFM/3wBm04PCLSWR6UtpTNZ7TzSq4FThKCWlJirXnhnxv/I5IP2gzRP?=
 =?us-ascii?Q?ZtC2iVXEWxM8lv6ejzDGqW2c88QpiwNpaE6rvEz85S9rzMBmQQxdgYGZk0Ju?=
 =?us-ascii?Q?iLPtWqyR4OBubdy0VUVOTW/RNPvnT+ojSFH33Bkbjs7GvtNxKpdjEh4RuP1L?=
 =?us-ascii?Q?3uXQ3NWZs/xHWXe0sloQ5g2X?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc3e794-039f-4643-a256-08d96dfdca1c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 10:38:23.6037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzgvxNrbnd0d5LYeEo7mxbjVvkbq4fVYqvSWBO0yr9oqNySUXfoG76JRxagpsF4pRrpE9tmho+bWgjZT+KDGYPCtB6DD0yK3qeznCCd/q5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4472
Received-SPF: pass client-ip=40.107.3.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Don't rely on connection being totally broken in case of -EIO. More
safe and correct just shutdown the channel anyway, as we change the
state and going to reconnect.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index f6ff1c4fb4..d88f4b954c 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -129,15 +129,16 @@ static bool nbd_client_connected(BDRVNBDState *s)
 
 static void nbd_channel_error(BDRVNBDState *s, int ret)
 {
+    if (nbd_client_connected(s)) {
+        qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+    }
+
     if (ret == -EIO) {
         if (nbd_client_connected(s)) {
             s->state = s->reconnect_delay ? NBD_CLIENT_CONNECTING_WAIT :
                                             NBD_CLIENT_CONNECTING_NOWAIT;
         }
     } else {
-        if (nbd_client_connected(s)) {
-            qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
-        }
         s->state = NBD_CLIENT_QUIT;
     }
 }
-- 
2.29.2


