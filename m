Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A83E57D478
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 21:59:18 +0200 (CEST)
Received: from localhost ([::1]:34432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEcKL-0002Al-Du
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 15:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oEcI1-0005BW-2u
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:56:53 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:58670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oEcHz-0006bV-4M
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:56:52 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LILQ1B000706;
 Thu, 21 Jul 2022 12:56:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=sZTXp567vcy7/0uIP/3KWo0eV+kVn7bZBPPSysGJoj0=;
 b=KpnBRrANioPVTW7pLX+ZPp+6Yn82G3vBda3Q7BLzK40iMzVVN8YkIlwux4/CJ9qyJ8Cy
 k/d7vPfU2XyRtcVsCvxV5oedTs49ims3DJVsKyT0Pa0fkrtxaeA+MnB2rbTtzFrlLsva
 HG1uFbfy1+wfWwfK1w9bwyTJCGsKqdc7KzysusxfA9zu6ThiowtBDsOe7StZR9UNv0cM
 uArRNsS0SiUb5WJ4xBlYiJ8wJAiGfy4aG+RagLzbPiDvdOunMiVv9NJkzBInuqa/6OqE
 chO854gpMneyDaXoFWv+Gqm5UiGwc4URsdJ33wDazeWXkcr3BqSJFM6svLPSq49q8swT DA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3hbsnv4901-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 12:56:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAoVleewxj/2V+zjf/Hr0CBJ7N5/2coSubGlBRrf4Y0MZafKdNwePEGFnccVQ8qobBDKuiJ9xSHbQ2wQrBSpM7/TeVP6xyL8D3v8wA85dDdzh4MUdTXEHYxoluge7EIarCnXpVLxunlk/Kt6maeIlZIKnCXGQNzaSfND377YrHgzLdrkTRIRdhv9Q5DhFEk5P4KfKb6pu6O74bYRvN67E4M+xz1o6KVFTRPmhmxeFhLREJdVsI0Y5jF6R6i4jzAmWqFzVZH/nGPnae7xBtoPHdmB/jk4UzxHLYEF93etqMnAPEFkcafDD642jna6OwpIukq0IFS814+ohLcV5ZdkXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZTXp567vcy7/0uIP/3KWo0eV+kVn7bZBPPSysGJoj0=;
 b=VfXBfkiSQJGZQSejfCsaaZF+Q7+BcTenAAuIfqywaaEpDGJLFeVw4W0c3aRT3rUgoMQOhPRtBLF/jg7izcpRR6rPKo1EdCscUpGU3TJNtu41JMMS3TJMW2TcbO/ek5oG40AW2U12R4hTly7V1EXdVAv3ZZtfG4IJp6HMLy4kTun1QygmBf/1Fn85Uo6+/HZQ/u6py/t9aqrFL/s1prOofefp6qHy1hSSYBQn5yd0iadR5enpGIKQsuJxcnZgbYbIdgpulp9V3Yu07+6f6pTw1PmNuyEWh6i1VDHN/vjyo0gUJWtWvSnzRPuNLgFSYjmsYAvKSLPQWYzE0l+zGSFaWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DM5PR02MB2825.namprd02.prod.outlook.com (2603:10b6:3:108::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 21 Jul
 2022 19:56:46 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 19:56:46 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 prerna.saxena@nutanix.com, Het Gala <het.gala@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 7/7] multifd: adding support for multifd connections
 dynamically
Date: Thu, 21 Jul 2022 19:56:20 +0000
Message-Id: <20220721195620.123837-8-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220721195620.123837-1-het.gala@nutanix.com>
References: <20220721195620.123837-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0035.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::48) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db5de992-6718-47d9-d6ee-08da6b53240b
X-MS-TrafficTypeDiagnostic: DM5PR02MB2825:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A/Jv7H9Ws9um0SjZpH2ZOPS781LHaSNcqYLH3ZUGvWjqX69G2FCHIDJYkAclAMh+SI9pCWWxYrHPaKO2AzGRkrZ7VYX1kjhjdD8JnXmC81oEQm1NtLQOzY9ugo1FYYRva8AM81zHsWyPwZpO7sJ709E3qFnu1p1oT6tljiACTgvdeStgrqsNg56GfKInDEdJRy2ldmqbXZFfeVYYzbDrC9rYw+NA9Wx3m/oVT1zs5n2k2Dqs3v98JwNyFirfMqJ1nmUHVU9UoCMWa2NXsFQcN+rMde394gmKLxmZOHnH5EV7nDyzIdPHedMUSZN6GDEBms22IwtAQ8L05/eU7ppByy19HzxAy0GONvp+xLH0sf275iZl8pji6vN0bAjYadxdiqfbrxbRgpnpT0xrom0jeuP14OfIl5rtgy2MkTUblEv/yKAbMbxCT7AcF5lMf31oeC0Le/OByHTJL230zkiB6d2r/WSCJCssZ6aEAtk83Wor9MWKsDkP87b4wP4abZpbOYG2xS8y2VoF07U1/gCrju971ypuDtxSzP2mKINch6kf0XW/XoZhylyEWe87bK9g8R+ZgOQPvsHtscUoaTUDQXDUPFwn1YnchjYr7T6Kx9gCVHwMM96rZhqKIED662pEVUV5gl1Of+wQDVZStD800fdA5Grc7815qCKtd0CjGP8GQEL3qV6hQ88PovLejrGaVN/DdSY3ThWxpxqxuaH6naUgBPQhd+j7i2TGJnv4qvqurk9lUJulicA5hGUIactLTP2rHacfhIGkb8gN7fqqyE8c4SGhDrkeryFSuJcvulU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(346002)(376002)(396003)(366004)(38350700002)(38100700002)(1076003)(83380400001)(36756003)(186003)(2616005)(26005)(86362001)(107886003)(6512007)(316002)(54906003)(478600001)(66946007)(6916009)(66556008)(52116002)(6506007)(41300700001)(5660300002)(4326008)(8676002)(8936002)(44832011)(6486002)(6666004)(66476007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w2UA6IN4Diz+o+VNcRdJrqI0NOnuyGo0KcwGfHqUmIJsj3enUzf94bqlVmuV?=
 =?us-ascii?Q?0oTILhJhIJuxVtCFim3GghR3dL8w1JmufdKor+Fut8tY2ryIQJh2TKtYzf7R?=
 =?us-ascii?Q?h2vXggKWoY9sGqXkn/uzy3MfkrRs9mXqGJtZrhP8+Vow1Nurc5DFQXj9x1U8?=
 =?us-ascii?Q?RLBAwAKrdH7jCPIf+DZsI9v2CS+wjhSjpQpEbnrYBMR675ek1ZUJclzglzjD?=
 =?us-ascii?Q?kytvaRG8AhhSbNBzrnxQABm6/MVJnoJS+SzwD5lvv+3/qz9XMTLY6imiRmV1?=
 =?us-ascii?Q?5zKakYNJhTISc4dkMW/YgyZRcMXGjDKFFXZ/MnSUjw8GCYjNUaWJUEuuR7/s?=
 =?us-ascii?Q?uftUEIlk29pM+TuH5dKc27XIGXUMAUi3R9KSsFp4OXXVI4gIH9075hVa5dc/?=
 =?us-ascii?Q?+ihY+pLALZdHGD5CJORIyqJFAwckBKK03i/OkvAVcgXZA1j2IcaxboL3plY2?=
 =?us-ascii?Q?+63/jPh0lhmq3xtN79XMABwd3Tg2Fd16ctB+PUJE2gNXNSYqS6/2QuEOhN2O?=
 =?us-ascii?Q?Ky66Dtd62Y0DBxtS6rS8XVvuXoBOZPGIdWpxjpay8T/YNzJxOMsr3SNEyaBt?=
 =?us-ascii?Q?t/IwfmqZx89vnfOdnpM2AKyuVRKCaSN9/rPlU69NqG5wMmYDP7rjtr7mNUC9?=
 =?us-ascii?Q?gp3WjJRUaLjcq15FGAf0ItlcZCldVyT2WcnNbmwSEaJ6+2NY9Gqrn+J1QUxZ?=
 =?us-ascii?Q?k0Sapc3ICD8njWbTFFogs1HZ8XwV8I9OD5mO+M73S4tlwlq5PWDfI3iSJGYe?=
 =?us-ascii?Q?zVtvDOYUp1IJ3T3/FO+EOPBda3seiUcRjVVCXopKfJ/+Iya0Ac4TPeKbv5Sk?=
 =?us-ascii?Q?T7kCH/VXskQQUGkF0qGzsny2eKqM5KSwQFttFd5RT6e8syMDKXXLWn6HqQm2?=
 =?us-ascii?Q?C6dMf978xpPokauZVOI8bE6z0Pnt5ms7s7+jxANwlqgsxtc9MJoBpzS+srlJ?=
 =?us-ascii?Q?imgYtkkgRrndWpIyOMYEaJ5W7vtV2I2RHlctDX43wvsSZ4rC7/AOCNgmBQBQ?=
 =?us-ascii?Q?L4JjtJ4A1tTxnvlw/R8usnCDR8VLHgPxwDVcP/SyPbPHtZhKoM9SyGUWcfNy?=
 =?us-ascii?Q?Qwe7su6Nq7+A4nmGi4gpjUybwxN41FnH9X0bfqpOk2I54bNLXWuHvFOPAoG8?=
 =?us-ascii?Q?8ivhGyt+1QvJql3l+inSyDq4GrgRkpF1aDatGdbFYq4zIQMW9JUvdYFaZikE?=
 =?us-ascii?Q?IOuX7j0lMgnjUa4WxXX8MrxwKXj5fT1iWNWnZnA3vty4tcXCLxyLCVdM/F4i?=
 =?us-ascii?Q?IHQZkYeqlUUemII87ZVaCmMe8kz8/5UQSl92UHFtVduwOLqHh3lAdDH5vTPr?=
 =?us-ascii?Q?RU120AS61/wBvVZdxLGjc1yzxH6Efk+DPF1JypvlW2zm/lH+pSs7TvCfvtUe?=
 =?us-ascii?Q?fZ0MhXjL3gL4ZUGwvpZygL8zGISOP62yPP/NPaSpuqAQICBzIy27lHErkH5L?=
 =?us-ascii?Q?5VN/gaVKsGEXhybl1HxHXjObCGbE811CBXNAIGzHmI37BM2/axOrwOXbw30/?=
 =?us-ascii?Q?esooW4oua8dNzpknlrcP2XUdIuQW4wkIQNUT7SrG4zrtVIv5dIVc0MV54Lsr?=
 =?us-ascii?Q?rZsEA8esOFcDjSfxdD6JR3sihye2JSN1j/WOxv75?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db5de992-6718-47d9-d6ee-08da6b53240b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 19:56:45.9278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csbI6hCRGbWD0h2blYqpO69lK55o/AtcClWUNjhiCqRUj94j2ROm8Q/yCGBbEkoVcyjGwMpii+RtZuUZhObrDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2825
X-Proofpoint-GUID: rwTbE4B69u0v8PjHOff8JDdb2oqI9MvZ
X-Proofpoint-ORIG-GUID: rwTbE4B69u0v8PjHOff8JDdb2oqI9MvZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_27,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

i) Dynamically decide appropriate source and destination ip pairs for the
   corresponding multifd channel to be connected.

Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/multifd.c |  6 +++---
 migration/socket.c  | 37 ++++++++++++++++++++++---------------
 migration/socket.h  |  3 ++-
 3 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 586ddc9d65..2d9d50239a 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -903,7 +903,7 @@ int multifd_save_setup(Error **errp)
     int thread_count;
     uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     uint8_t i;
-
+    int idx;
     if (!migrate_use_multifd()) {
         return 0;
     }
@@ -945,8 +945,8 @@ int multifd_save_setup(Error **errp)
         } else {
             p->write_flags = 0;
         }
-
-        socket_send_channel_create(multifd_new_send_channel_async, p);
+        idx = multifd_index(i);
+        socket_send_channel_create(multifd_new_send_channel_async, p, idx);
     }
 
     for (i = 0; i < thread_count; i++) {
diff --git a/migration/socket.c b/migration/socket.c
index 69fda774ba..b81b819584 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -28,10 +28,6 @@
 #include "trace.h"
 #include "postcopy-ram.h"
 
-struct SocketOutgoingArgs {
-    SocketAddress *saddr;
-} outgoing_args;
-
 struct SocketArgs {
     struct SrcDestAddr address;
     uint8_t multifd_channels;
@@ -54,11 +50,30 @@ int outgoing_param_total_multifds(void)
     return total_multifd_channels;
 }
 
-void socket_send_channel_create(QIOTaskFunc f, void *data)
+
+int multifd_index(int i)
+{
+    int length = outgoing_migrate_params.socket_args_arr_len;
+    int j = 0;
+    int runn_sum = 0;
+    while (j < length) {
+        runn_sum += outgoing_migrate_params.socket_args[j].multifd_channels;
+        if (i >= runn_sum) {
+            j++;
+        } else {
+            break;
+        }
+    }
+    return j;
+}
+
+ void socket_send_channel_create(QIOTaskFunc f, void *data, int idx)
 {
     QIOChannelSocket *sioc = qio_channel_socket_new();
-    qio_channel_socket_connect_all_async(sioc, outgoing_args.saddr,
-                                     f, data, NULL, NULL, NULL);
+    qio_channel_socket_connect_all_async(sioc,
+                    outgoing_migrate_params.socket_args[idx].address.dst_addr,
+                    f, data, NULL, NULL,
+                    outgoing_migrate_params.socket_args[idx].address.src_addr);
 }
 
 QIOChannel *socket_send_channel_create_sync(Error **errp)
@@ -83,10 +98,6 @@ int socket_send_channel_destroy(QIOChannel *send)
 {
     /* Remove channel */
     object_unref(OBJECT(send));
-    if (outgoing_args.saddr) {
-        qapi_free_SocketAddress(outgoing_args.saddr);
-        outgoing_args.saddr = NULL;
-    }
     g_free(outgoing_migrate_params.socket_args);
     outgoing_migrate_params.socket_args = NULL;
     outgoing_migrate_params.socket_args_arr_len = 0;
@@ -142,10 +153,6 @@ socket_start_outgoing_migration_internal(MigrationState *s,
 
     data->s = s;
 
-    /* in case previous migration leaked it */
-    qapi_free_SocketAddress(outgoing_args.saddr);
-    outgoing_args.saddr = saddr;
-
     if (saddr->type == SOCKET_ADDRESS_TYPE_INET) {
         data->hostname = g_strdup(saddr->u.inet.host);
     }
diff --git a/migration/socket.h b/migration/socket.h
index 7c82278d33..80d03fc7d6 100644
--- a/migration/socket.h
+++ b/migration/socket.h
@@ -29,7 +29,8 @@ typedef struct SrcDestAddr {
 
 
 int outgoing_param_total_multifds(void);
-void socket_send_channel_create(QIOTaskFunc f, void *data);
+int multifd_index(int i);
+void socket_send_channel_create(QIOTaskFunc f, void *data, int idx);
 QIOChannel *socket_send_channel_create_sync(Error **errp);
 int socket_send_channel_destroy(QIOChannel *send);
 
-- 
2.22.3


