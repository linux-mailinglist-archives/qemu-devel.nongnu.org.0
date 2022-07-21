Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F6E57D4A1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 22:06:56 +0200 (CEST)
Received: from localhost ([::1]:44672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEcRj-00014g-Sw
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 16:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oEcHx-00053F-BV
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:56:49 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:22786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oEcHt-0006aw-HH
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:56:49 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LIKoY4019486;
 Thu, 21 Jul 2022 12:56:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=sOyP9siBVjbvFR0Z5mhQ5bDp7hvEyxgWNv718nT/dcY=;
 b=n0hN2AnB0bbXXy8N7tO8NkKF+imITJa/+moiNUDuHJ9rIyxZdhIv2Qoih7gU4mOkAnB1
 gze/0MvnMcEr3FmKn7I20ALSVW62fTxzy/wxDanbozyKVy4y8n4pbD3Iq9mMFpC9WOXC
 kuGhyrDQNCrTOADgJQkmJHy8zVVNCrEB1bMryVfbQup13BZKcuFK+nuviRCxLZltv84J
 ohdXmz8j1cHbJjq3QoT2Zwn4fgTzuIuqo2qCnT/uLYB3he7N9LJIjuAob/STOwgq7lWe
 mAmHuUxjFrEXxFQ+GssSSLjHe2aMIy+e+Mjf4bMHd+iEk42vb73QnkKHHb+a3zTCvdv/ 8g== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3hbtv9v9ya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 12:56:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3ItxjxFx7kk9N6JRhkxpfeGJsH5ZG7mKfTK4+TVMGXuPixw3dUSACFPZ2xUwaCC/tBrMLrIb+nWoCqff4mgj/INEeRy6jP5ttb1MI0ugDJ/wwN+Yhrphp70Vh/YHbtXhjyAgSmyy6U6/rs7Q6W6khO9bEK/eYAhLDZQXjYbgg4SroqXnwZmXDOfUjZxKpUHUVE8aERhWsENK0oawGzfGrYtRZ5I4IKDyznzBsQgrxvh0KG16KKjpoifP4ahNPhgVMV86utF+bfyRKk51RNTK+wVovaq1plDnPr6nbRvXvZ85evuNDnZAZLhEu0vmh9YITA4kA3Nj72fuC3Lskeo+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOyP9siBVjbvFR0Z5mhQ5bDp7hvEyxgWNv718nT/dcY=;
 b=P+1hVgbrus9Ho5M0wlfmZb+2bE5nn9npupgRvg0w6E8slzPQUeoio+vDCrRY+x5HvlGexhTlZSiFJXyaGHKS6f3EyROMGidh/8O/2EWlXsjGRbslcW45wV0tbkH6MMrlRcYeq1yLIxNBxoXuYhLI0qAsoKHPJ92gv71dQXeiRcX472FupKuHVKciisAoEzkL09iEOsU1pTaTpkBkIndJ8l+J8BHC2LTJlc21+XKj5/AwkggkC45t1J//RLng+8WSuShgXBewaXuV5o3kbeXU8LCrDSki1Bi+mqT0HDuImX0WRUm3+6URin0ys/YC3Z9B9fovgEUjyvDimb2UEFEhSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DM5PR02MB2825.namprd02.prod.outlook.com (2603:10b6:3:108::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 21 Jul
 2022 19:56:42 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 19:56:42 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 prerna.saxena@nutanix.com, Het Gala <het.gala@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 5/7] multifd: establishing connection between any
 non-default src and dest pair
Date: Thu, 21 Jul 2022 19:56:18 +0000
Message-Id: <20220721195620.123837-6-het.gala@nutanix.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0ad3c59a-d520-4d7c-d02a-08da6b532214
X-MS-TrafficTypeDiagnostic: DM5PR02MB2825:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wwQm18WWqTKKeiWq30BEOmm56CUZuU80HmmJOwr6TpPBcj/r19ZARz/1d+RB2hKl1/cm2l6f0WVXsNwGC8oQ1if+OGJ7Rr44ipiObA9X8PULC7pb4k7TrrNPXZoJxqRS6MxbNbms0i94u6+cF/6X7ntN6c9xDuvXQ2zW6KmCR/ux7Ao7EWqHtWJX2Rno87vQmBksqDaOeCWjk/MgeMk25gOaRO9hfDuDgvJzOVteg0J8+zci/wxwTAZzVpXdYFHaB65jk2bv0h4do/hm+lAbZ7PTszPyrpR8xz8WvI8UyBMFelEvHO/FHWH2IlRTJ35N9XOonIlUTlraa5Wl1ApAu0Pg87BG723V3zNTWo36hlaGB4ySprV8cPwOiv7AV8fitfYd68iO+yiMr//ufsssTZx/2wObjkYmQjhThbxAQkq3be9RuAN6Qtnf4KikO3TWWIDdhuuj+KJ48kju8aUQ4qkIl0feW1pfdHs3BE8pXRfRmU41IUpQSHnFH/dPDqqmBt94heLc+dPKY5o1xy+0P+0OyV8jm/nn0tJFAD9G7C1dnb4KYGSdUSCY6P305otfxdM6KIqie6L8XsCMZUD3990tgyi9zC6fV1Sc2QVY3iG3ZMqd2lh5MWgJ1WD4MtiyEjkBC5x3fdq6RO1iCBTfo1mF+iEM7wxcUSZuCBfzalh6c+1/cvROyRrwexSlb8bBWPAcVmhDOTcbUwicKtSaWiVD2izydzIqnvq8gZaRNiiMiVZs3FIWZiM6PhdrFQCA0QQUzo7kNRckLC+levdU7g01Mry2HYiOEhpryu100mY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(346002)(376002)(396003)(366004)(38350700002)(66574015)(38100700002)(1076003)(83380400001)(36756003)(186003)(2616005)(26005)(86362001)(107886003)(6512007)(316002)(54906003)(478600001)(66946007)(6916009)(66556008)(52116002)(6506007)(41300700001)(5660300002)(30864003)(4326008)(8676002)(8936002)(44832011)(6486002)(6666004)(66476007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RqQDHmGWHhIgHk4cDWLIr950jqSMRai1doGIYfj5dkSxEOjm2bkhyw02iDZP?=
 =?us-ascii?Q?quhaHijU/JwRmFlHu1JWFsJyqTbPW1VPWRmfxzWNzSlEo42Yz8K0DQmub5Wf?=
 =?us-ascii?Q?uwi7hhOFFQXSawhNk3nmsagTy+OPifsBU7qdoIwtVAHG/8dvVJ2B6lfkWbdv?=
 =?us-ascii?Q?VJAl+YZjvm9kxInKMyHUncwJ668X5XSIvGJARpW5fujbHRbBfTdCjdjTAUNi?=
 =?us-ascii?Q?BiJ+6xobmzhTILSnhPS1nZ8VBL2iOFS3QBE8nX/FhsyC6RQvyC/aOpIAUH9I?=
 =?us-ascii?Q?KhOgXIBST97lJtGUYPRMYuzfacyloe8PcfHK6Opj3vW8ckeAIZyv3DDI2Umm?=
 =?us-ascii?Q?G/1xTzySzvUeVNrXPlIWDLeFOAZYJ0Sl7V8UYZatHi+IW9sxb+q0MRxJB2JE?=
 =?us-ascii?Q?Egf+qXz9eLheNv7yMTykotGKDbRTB0vZIi/AkJt4t5zqpp6MIgwI74s+aXjN?=
 =?us-ascii?Q?JwmKzzGIiXPN6MhVStJ/sAHPuOexqIDVLQ7UC2VwyqAshZmaqK6v41g7Voh6?=
 =?us-ascii?Q?tdSWRp/EbVb5j6JzNEogWJ6Z3r1b7oE7JNF2Xn+7wlgaH09EcbytkVp+jywi?=
 =?us-ascii?Q?8RFFpzmlVTSZ+9rcEMxaer9je/sBhwtGFSH08vHZgwfK37zdPNJCDmDqjR58?=
 =?us-ascii?Q?eDRroJVP6368HSQCO5D2ec440dgDMhmuc0Wj/XjUpUTYJ2kzKi61/b7GrNtF?=
 =?us-ascii?Q?FJI8iIEfKWTMwkdavGOux+cfjOZlMWi3rJrAAupYVkNb8G8shVRl2D4+D4jP?=
 =?us-ascii?Q?Gv9PQSF2unJpioXmaECSo0Cis5FgnHRBxb/Ll/7GxGaTxCV7nqlSV/y5q4G5?=
 =?us-ascii?Q?FlpJCkmrZCIomL5d6C9iguqIFT8R6t9QIX2u7O02SNjZ6rOQYSUdpRSGerXH?=
 =?us-ascii?Q?Rw7VcE+YfhFnTDV7eEynLGgUmUIThGmOl8BDyYCZjxUidIJkvYzh19aRW4Nl?=
 =?us-ascii?Q?1ZNd4Coixs7iqMkSL81ZD5cauNK6UEx3ckHgSVmD4QMT9Dx6wSWNkSRvaYin?=
 =?us-ascii?Q?zXkJvgFPve9NbIcHmEAskNmgx6bu5rvmuncOKm9zh3pqdSmeXJ4G4aWEZ9ts?=
 =?us-ascii?Q?XWj0Jr5nZLi2d9vl6PTGyU3w5bZ0CZrasbhm+lpfJhOKk0l1qra7dgb9+5BV?=
 =?us-ascii?Q?78MNM9dzGtS9OjGr2ebzGJ3tAiw8RQW0vI7L/prFG8s7n/NFjE2FrgEdFciP?=
 =?us-ascii?Q?G1b1gdFeO1sl63DKbcBQmwghDrvQO4dhpcVLKuJTyRMQPzcEhdnsSN0iNWef?=
 =?us-ascii?Q?rjFdEENc6Xk8cWS7kOzgcLYYAjb67CWsN+X/XEHmb6TAKp9oA3/Bxt4cBho+?=
 =?us-ascii?Q?wwRi/U8Z61/D1PRioN2lJlnv07rNY8lHyoqX9b+OMEJFq+PX7Nc6DJourQaU?=
 =?us-ascii?Q?50j8LjmRPB2LicE7lhdUpgKBC94nCLG6ZMpjjeWWEZiNmY9TRY0yLTbr3xCU?=
 =?us-ascii?Q?HODU6zPDXuPAc+6E1PW75uPTjAM1M74VE3sOGr514ra4bXAF+BsGNw+G1QFR?=
 =?us-ascii?Q?azvazWr4XPDHMoooimb2fgrKZLv/wZzAE25vZeMdHcedGtfSfc3kOSBB5jLB?=
 =?us-ascii?Q?JNcfRbohUZBJ0JpGa5d2rPVMoXPuO4WpUj36duHX?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad3c59a-d520-4d7c-d02a-08da6b532214
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 19:56:42.6155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+fdF/4vaz9ArI0PFOa+sQ8O4p36COX+wRIVX/HQOYpDkMGCZ7IIr1eN8HgRIdo63HVvAI9b4LirYRIFAZiSIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2825
X-Proofpoint-ORIG-GUID: 7tIMceh-LFBU9p8pnoO8DjJiqVeR46VH
X-Proofpoint-GUID: 7tIMceh-LFBU9p8pnoO8DjJiqVeR46VH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_27,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
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

i) Binding of the socket to source ip address and port on the non-default
   interface has been implemented for multi-FD connection, which was not
   necessary earlier because the binding was on the default interface itself.

ii) Created an end to end connection between all multi-FD source and
    destination pairs.

Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 include/io/channel-socket.h    | 44 ++++++++++++++++
 include/qemu/sockets.h         |  6 ++-
 io/channel-socket.c            | 93 ++++++++++++++++++++++++++--------
 migration/socket.c             |  4 +-
 tests/unit/test-util-sockets.c | 16 +++---
 util/qemu-sockets.c            | 90 +++++++++++++++++++++++---------
 6 files changed, 196 insertions(+), 57 deletions(-)

diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
index 513c428fe4..8168866b06 100644
--- a/include/io/channel-socket.h
+++ b/include/io/channel-socket.h
@@ -211,6 +211,50 @@ void qio_channel_socket_dgram_async(QIOChannelSocket *ioc,
                                     GMainContext *context);
 
 
+/**
+ * qio_channel_socket_connect_all_sync:
+ * @ioc: the socket channel object
+ * @dst_addr: the destination address to connect to
+ * @src_addr: the source address to be connected
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Attempt to connect to the address @dst_addr with @src_addr.
+ * This method will run in the foreground so the caller will not
+ * regain execution control until the connection is established or
+ * an error occurs.
+ */
+int qio_channel_socket_connect_all_sync(QIOChannelSocket *ioc,
+                                    SocketAddress *dst_addr,
+                                    SocketAddress *src_addr,
+                                    Error **errp);
+
+/**
+ * qio_channel_socket_connect_all_async:
+ * @ioc: the socket channel object
+ * @dst_addr: the destination address to connect to
+ * @callback: the function to invoke on completion
+ * @opaque: user data to pass to @callback
+ * @destroy: the function to free @opaque
+ * @context: the context to run the async task. If %NULL, the default
+ *           context will be used.
+ * @src_addr: the source address to be connected
+ *
+ * Attempt to connect to the address @dst_addr with the @src_addr.
+ * This method will run in the background so the caller will regain
+ * execution control immediately. The function @callback
+ * will be invoked on completion or failure. The @dst_addr
+ * parameter will be copied, so may be freed as soon
+ * as this function returns without waiting for completion.
+ */
+void qio_channel_socket_connect_all_async(QIOChannelSocket *ioc,
+                                          SocketAddress *dst_addr,
+                                          QIOTaskFunc callback,
+                                          gpointer opaque,
+                                          GDestroyNotify destroy,
+                                          GMainContext *context,
+                                          SocketAddress *src_addr);
+
+
 /**
  * qio_channel_socket_get_local_address:
  * @ioc: the socket channel object
diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 038faa157f..dc863c3df8 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -33,7 +33,8 @@ int inet_ai_family_from_address(InetSocketAddress *addr,
                                 Error **errp);
 int inet_parse(InetSocketAddress *addr, const char *str, Error **errp);
 int inet_connect(const char *str, Error **errp);
-int inet_connect_saddr(InetSocketAddress *saddr, Error **errp);
+int inet_connect_saddr(InetSocketAddress *dst_addr,
+                       InetSocketAddress *src_addr, Error **errp);
 
 NetworkAddressFamily inet_netfamily(int family);
 
@@ -41,7 +42,8 @@ int unix_listen(const char *path, Error **errp);
 int unix_connect(const char *path, Error **errp);
 
 SocketAddress *socket_parse(const char *str, Error **errp);
-int socket_connect(SocketAddress *addr, Error **errp);
+int socket_connect(SocketAddress *dst_addr, SocketAddress *src_addr,
+                   Error **errp);
 int socket_listen(SocketAddress *addr, int num, Error **errp);
 void socket_listen_cleanup(int fd, Error **errp);
 int socket_dgram(SocketAddress *remote, SocketAddress *local, Error **errp);
diff --git a/io/channel-socket.c b/io/channel-socket.c
index 74a936cc1f..142298469b 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -144,14 +144,15 @@ qio_channel_socket_new_fd(int fd,
 }
 
 
-int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
-                                    SocketAddress *addr,
-                                    Error **errp)
+int qio_channel_socket_connect_all_sync(QIOChannelSocket *ioc,
+                                        SocketAddress *dst_addr,
+                                        SocketAddress *src_addr,
+                                        Error **errp)
 {
     int fd;
 
-    trace_qio_channel_socket_connect_sync(ioc, addr);
-    fd = socket_connect(addr, errp);
+    trace_qio_channel_socket_connect_sync(ioc, dst_addr);
+    fd = socket_connect(dst_addr, src_addr, errp);
     if (fd < 0) {
         trace_qio_channel_socket_connect_fail(ioc);
         return -1;
@@ -177,19 +178,78 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
 }
 
 
-static void qio_channel_socket_connect_worker(QIOTask *task,
-                                              gpointer opaque)
+struct ConnectData {
+    SocketAddress *dst_addr;
+    SocketAddress *src_addr;
+};
+
+
+static void qio_channel_socket_all_worker_free(gpointer opaque)
+{
+    struct ConnectData *data = opaque;
+    if (!data) {
+        return;
+    }
+    qapi_free_SocketAddress(data->dst_addr);
+    qapi_free_SocketAddress(data->src_addr);
+    g_free(data);
+}
+
+static void qio_channel_socket_connect_all_worker(QIOTask *task,
+                                                  gpointer opaque)
 {
     QIOChannelSocket *ioc = QIO_CHANNEL_SOCKET(qio_task_get_source(task));
-    SocketAddress *addr = opaque;
+    struct ConnectData *data = opaque;
     Error *err = NULL;
 
-    qio_channel_socket_connect_sync(ioc, addr, &err);
+    qio_channel_socket_connect_all_sync(ioc, data->dst_addr,
+                                        data->src_addr, &err);
 
     qio_task_set_error(task, err);
 }
 
 
+void qio_channel_socket_connect_all_async(QIOChannelSocket *ioc,
+                                          SocketAddress *dst_addr,
+                                          QIOTaskFunc callback,
+                                          gpointer opaque,
+                                          GDestroyNotify destroy,
+                                          GMainContext *context,
+                                          SocketAddress *src_addr)
+{
+    QIOTask *task = qio_task_new(
+        OBJECT(ioc), callback, opaque, destroy);
+    struct ConnectData *data = g_new0(struct ConnectData, 1);
+
+    data->dst_addr = QAPI_CLONE(SocketAddress, dst_addr);
+    if (src_addr) {
+        data->src_addr = QAPI_CLONE(SocketAddress, src_addr);
+    } else {
+        data->src_addr = NULL;
+    }
+    /*
+     * socket_connect() does a non-blocking connect(), but it
+     * still blocks in DNS lookups, so we must use a thread
+     */
+    trace_qio_channel_socket_connect_async(ioc, dst_addr);
+    qio_task_run_in_thread(task,
+                           qio_channel_socket_connect_all_worker,
+                           data,
+                           qio_channel_socket_all_worker_free,
+                           context);
+}
+
+
+int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
+                                    SocketAddress *addr,
+                                    Error **errp)
+{
+    qio_channel_socket_connect_all_sync(ioc, addr, NULL, errp);
+
+    return 0;
+}
+
+
 void qio_channel_socket_connect_async(QIOChannelSocket *ioc,
                                       SocketAddress *addr,
                                       QIOTaskFunc callback,
@@ -197,20 +257,9 @@ void qio_channel_socket_connect_async(QIOChannelSocket *ioc,
                                       GDestroyNotify destroy,
                                       GMainContext *context)
 {
-    QIOTask *task = qio_task_new(
-        OBJECT(ioc), callback, opaque, destroy);
-    SocketAddress *addrCopy;
-
-    addrCopy = QAPI_CLONE(SocketAddress, addr);
+    qio_channel_socket_connect_all_async(ioc, addr, callback, opaque,
+                                         destroy, context, NULL);
 
-    /* socket_connect() does a non-blocking connect(), but it
-     * still blocks in DNS lookups, so we must use a thread */
-    trace_qio_channel_socket_connect_async(ioc, addr);
-    qio_task_run_in_thread(task,
-                           qio_channel_socket_connect_worker,
-                           addrCopy,
-                           (GDestroyNotify)qapi_free_SocketAddress,
-                           context);
 }
 
 
diff --git a/migration/socket.c b/migration/socket.c
index dab872a0fe..69fda774ba 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -57,8 +57,8 @@ int outgoing_param_total_multifds(void)
 void socket_send_channel_create(QIOTaskFunc f, void *data)
 {
     QIOChannelSocket *sioc = qio_channel_socket_new();
-    qio_channel_socket_connect_async(sioc, outgoing_args.saddr,
-                                     f, data, NULL, NULL);
+    qio_channel_socket_connect_all_async(sioc, outgoing_args.saddr,
+                                     f, data, NULL, NULL, NULL);
 }
 
 QIOChannel *socket_send_channel_create_sync(Error **errp)
diff --git a/tests/unit/test-util-sockets.c b/tests/unit/test-util-sockets.c
index 63909ccb2b..aa26630045 100644
--- a/tests/unit/test-util-sockets.c
+++ b/tests/unit/test-util-sockets.c
@@ -89,7 +89,7 @@ static void test_socket_fd_pass_name_good(void)
     addr.type = SOCKET_ADDRESS_TYPE_FD;
     addr.u.fd.str = g_strdup(mon_fdname);
 
-    fd = socket_connect(&addr, &error_abort);
+    fd = socket_connect(&addr, NULL, &error_abort);
     g_assert_cmpint(fd, !=, -1);
     g_assert_cmpint(fd, !=, mon_fd);
     close(fd);
@@ -121,7 +121,7 @@ static void test_socket_fd_pass_name_bad(void)
     addr.type = SOCKET_ADDRESS_TYPE_FD;
     addr.u.fd.str = g_strdup(mon_fdname);
 
-    fd = socket_connect(&addr, &err);
+    fd = socket_connect(&addr, NULL, &err);
     g_assert_cmpint(fd, ==, -1);
     error_free_or_abort(&err);
 
@@ -148,7 +148,7 @@ static void test_socket_fd_pass_name_nomon(void)
     addr.type = SOCKET_ADDRESS_TYPE_FD;
     addr.u.fd.str = g_strdup("myfd");
 
-    fd = socket_connect(&addr, &err);
+    fd = socket_connect(&addr, NULL, &err);
     g_assert_cmpint(fd, ==, -1);
     error_free_or_abort(&err);
 
@@ -172,7 +172,7 @@ static void test_socket_fd_pass_num_good(void)
     addr.type = SOCKET_ADDRESS_TYPE_FD;
     addr.u.fd.str = g_strdup_printf("%d", sfd);
 
-    fd = socket_connect(&addr, &error_abort);
+    fd = socket_connect(&addr, NULL, &error_abort);
     g_assert_cmpint(fd, ==, sfd);
 
     fd = socket_listen(&addr, 1, &error_abort);
@@ -194,7 +194,7 @@ static void test_socket_fd_pass_num_bad(void)
     addr.type = SOCKET_ADDRESS_TYPE_FD;
     addr.u.fd.str = g_strdup_printf("%d", sfd);
 
-    fd = socket_connect(&addr, &err);
+    fd = socket_connect(&addr, NULL, &err);
     g_assert_cmpint(fd, ==, -1);
     error_free_or_abort(&err);
 
@@ -217,7 +217,7 @@ static void test_socket_fd_pass_num_nocli(void)
     addr.type = SOCKET_ADDRESS_TYPE_FD;
     addr.u.fd.str = g_strdup_printf("%d", STDOUT_FILENO);
 
-    fd = socket_connect(&addr, &err);
+    fd = socket_connect(&addr, NULL, &err);
     g_assert_cmpint(fd, ==, -1);
     error_free_or_abort(&err);
 
@@ -246,10 +246,10 @@ static gpointer unix_client_thread_func(gpointer user_data)
 
     for (i = 0; i < ABSTRACT_SOCKET_VARIANTS; i++) {
         if (row->expect_connect[i]) {
-            fd = socket_connect(row->client[i], &error_abort);
+            fd = socket_connect(row->client[i], NULL, &error_abort);
             g_assert_cmpint(fd, >=, 0);
         } else {
-            fd = socket_connect(row->client[i], &err);
+            fd = socket_connect(row->client[i], NULL, &err);
             g_assert_cmpint(fd, ==, -1);
             error_free_or_abort(&err);
         }
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 13b5b197f9..491e2f2bc9 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -358,8 +358,10 @@ listen_ok:
     ((rc) == -EINPROGRESS)
 #endif
 
-static int inet_connect_addr(const InetSocketAddress *saddr,
-                             struct addrinfo *addr, Error **errp)
+static int inet_connect_addr(const InetSocketAddress *dst_addr,
+                             const InetSocketAddress *src_addr,
+                             struct addrinfo *addr, struct addrinfo *saddr,
+                             Error **errp)
 {
     int sock, rc;
 
@@ -371,8 +373,28 @@ static int inet_connect_addr(const InetSocketAddress *saddr,
     }
     socket_set_fast_reuse(sock);
 
+    /* to bind the socket if src_addr is available */
+
+    if (src_addr) {
+        struct sockaddr_in servaddr;
+
+        /* bind to a specific interface in the internet domain */
+        /* to make sure the sin_zero filed is cleared */
+        memset(&servaddr, 0, sizeof(servaddr));
+
+        servaddr.sin_family = AF_INET;
+        servaddr.sin_addr.s_addr = inet_addr(src_addr->host);
+        servaddr.sin_port = 0;
+
+        if (bind(sock, (struct sockaddr *)&servaddr, sizeof(servaddr)) < 0) {
+            error_setg_errno(errp, errno, "Failed to bind socket");
+            return -1;
+        }
+    }
+
     /* connect to peer */
     do {
+
         rc = 0;
         if (connect(sock, addr->ai_addr, addr->ai_addrlen) < 0) {
             rc = -errno;
@@ -380,8 +402,14 @@ static int inet_connect_addr(const InetSocketAddress *saddr,
     } while (rc == -EINTR);
 
     if (rc < 0) {
-        error_setg_errno(errp, errno, "Failed to connect to '%s:%s'",
-                         saddr->host, saddr->port);
+        if (src_addr) {
+            error_setg_errno(errp, errno, "Failed to connect '%s:%s' to "
+                             "'%s:%s'", dst_addr->host, dst_addr->port,
+                             src_addr->host, src_addr->port);
+        } else {
+            error_setg_errno(errp, errno, "Failed to connect '%s:%s'",
+                             dst_addr->host, dst_addr->port);
+        }
         closesocket(sock);
         return -1;
     }
@@ -446,41 +474,55 @@ static struct addrinfo *inet_parse_connect_saddr(InetSocketAddress *saddr,
  *
  * Returns: -1 on error, file descriptor on success.
  */
-int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
+int inet_connect_saddr(InetSocketAddress *dst_addr,
+                       InetSocketAddress *src_addr, Error **errp)
 {
     Error *local_err = NULL;
-    struct addrinfo *res, *e;
+    struct addrinfo *res_d, *res_s, *e, *x;
     int sock = -1;
 
-    res = inet_parse_connect_saddr(saddr, errp);
-    if (!res) {
+    res_d = inet_parse_connect_saddr(dst_addr, errp);
+    if (!res_d) {
         return -1;
     }
 
-    for (e = res; e != NULL; e = e->ai_next) {
+    if (src_addr) {
+        res_s = inet_parse_connect_saddr(src_addr, errp);
+        if (!res_s) {
+            return -1;
+        }
+    }
+
+    for (e = res_d; e != NULL; e = e->ai_next) {
         error_free(local_err);
         local_err = NULL;
 
 #ifdef HAVE_IPPROTO_MPTCP
-        if (saddr->has_mptcp && saddr->mptcp) {
+        if (dst_addr->has_mptcp && dst_addr->mptcp) {
             e->ai_protocol = IPPROTO_MPTCP;
         }
 #endif
+        for (x = res_s; x != NULL; x = x->ai_next) {
+            if (!src_addr || e->ai_family == x->ai_family) {
 
-        sock = inet_connect_addr(saddr, e, &local_err);
-        if (sock >= 0) {
-            break;
+                sock = inet_connect_addr(dst_addr, src_addr,
+                                         e, x, &local_err);
+                if (sock >= 0) {
+                    break;
+                }
+            }
         }
     }
 
-    freeaddrinfo(res);
+    freeaddrinfo(res_d);
+    freeaddrinfo(res_s);
 
     if (sock < 0) {
         error_propagate(errp, local_err);
         return sock;
     }
 
-    if (saddr->keep_alive) {
+    if (dst_addr->keep_alive) {
         int val = 1;
         int ret = setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE,
                              &val, sizeof(val));
@@ -506,7 +548,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
     Error *err = NULL;
 
     /* lookup peer addr */
-    memset(&ai,0, sizeof(ai));
+    memset(&ai,0,sizeof(ai));
     ai.ai_flags = AI_CANONNAME | AI_V4MAPPED | AI_ADDRCONFIG;
     ai.ai_family = inet_ai_family_from_address(sraddr, &err);
     ai.ai_socktype = SOCK_DGRAM;
@@ -727,7 +769,7 @@ int inet_connect(const char *str, Error **errp)
     InetSocketAddress *addr = g_new(InetSocketAddress, 1);
 
     if (!inet_parse(addr, str, errp)) {
-        sock = inet_connect_saddr(addr, errp);
+        sock = inet_connect_saddr(addr, NULL, errp);
     }
     qapi_free_InetSocketAddress(addr);
     return sock;
@@ -1182,25 +1224,27 @@ int socket_address_parse_named_fd(SocketAddress *addr, Error **errp)
     return 0;
 }
 
-int socket_connect(SocketAddress *addr, Error **errp)
+int socket_connect(SocketAddress *dst_addr,
+                   SocketAddress *src_addr, Error **errp)
 {
     int fd;
 
-    switch (addr->type) {
+    switch (dst_addr->type) {
     case SOCKET_ADDRESS_TYPE_INET:
-        fd = inet_connect_saddr(&addr->u.inet, errp);
+        fd = inet_connect_saddr(&dst_addr->u.inet, src_addr ?
+                                &src_addr->u.inet : NULL, errp);
         break;
 
     case SOCKET_ADDRESS_TYPE_UNIX:
-        fd = unix_connect_saddr(&addr->u.q_unix, errp);
+        fd = unix_connect_saddr(&dst_addr->u.q_unix, errp);
         break;
 
     case SOCKET_ADDRESS_TYPE_FD:
-        fd = socket_get_fd(addr->u.fd.str, errp);
+        fd = socket_get_fd(dst_addr->u.fd.str, errp);
         break;
 
     case SOCKET_ADDRESS_TYPE_VSOCK:
-        fd = vsock_connect_saddr(&addr->u.vsock, errp);
+        fd = vsock_connect_saddr(&dst_addr->u.vsock, errp);
         break;
 
     default:
-- 
2.22.3


