Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FC2652698
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 19:51:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7hbv-0004HD-B8; Tue, 20 Dec 2022 13:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1p7hbl-00048D-3G
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 13:44:57 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1p7hbf-0002Z6-4l
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 13:44:54 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BKEcG7I006602; Tue, 20 Dec 2022 10:44:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=8LQGzVrJyAMNA1bUU6nW4oA0kAwtmAykqN2VCfk2JG8=;
 b=cnnXTB+Weao1F/+nPSOloqNeWXas3tXlFuegS4VY2MlSbq1TrmLi8fhL+q+UnhBB3PgH
 nNm7yfRzZeMM+Ceb43mztNTnk8XF8aOXfnpI9z7AFpEyOVPrMvKo3re/rxjLma7BnIYK
 +KfLMtCYbggEM24TAQuZKDLPxbTvRsJ2YM31tosxWzvvHWTaTtCh+soN4w0QToT8r5+X
 Wc3io3yK8P2eAz1x7zmlJsFmoLCisVgv36YKzOVgjCgrvaERnQToV+JJ65Vtu6/vosXm
 rVdD8IkKVnQESoLFOkCORJfbzjxEmhN8BkRd/JRKR1cLvY9DSLRsY38chk9GtBDyy4dD Vg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3mhajdgq2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Dec 2022 10:44:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxyHJMMs/zwV1nngENzyzXiTB1KXLobpD8E1Karqz39o/4HUc0jGUeW2EJj4Zezp7vEv8RyrAV87eaYe0uSC/1DghHvT63SNLOM1jlSQiyDWLoR4zg8mwl+VSn+H3TxzHsBzV4GCx7UC9mztiJQypWpV4+29BhC1RNuEWwdRGruWSvqjV00F11iFXgzDvXScgn6RXhjwguGWX8SgrvylfhKj8xGn0oDz4UvJA1WFRdafUl07oRtHn8KDDKTAGVTfuEJG5FLC4Kd1wDfO9k4yokPo3lGzMD7AjZGkI8Sds4Rjcwc4kjhPi+VNrTCLNOlEhT+tYBpZxGg8bYvQo+0Fig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LQGzVrJyAMNA1bUU6nW4oA0kAwtmAykqN2VCfk2JG8=;
 b=gdjIcDk9Vd1uE973blVZiTKRfgWciXBwIhIJJa9bUjH/PimEaDmqM2AMPmNsQjfE61n2AxlhVWWvJ23jJanZRBJGJE0nsKbQdLyAlkGqTC1pSBCzFNCrC0ggrbHhJpegcKbd++qqEApzACicdVQAQlwjDG4nuU2iliddt7G8JR9+Z9I1I2ULzxhouRbf/LIReFtWbMHp9I9cyyPjbmEEpHowpztqscJ5rvGo3U6xZbR+GpyWnftizsJ1/eQt0R9qJTupTPOQDWe9kOsRChQeh0RR0l9FtbOqdVjCUDpE3WWiLpqnuu8s/f/QqHKMBjI/ZDKQbTxZXMZ+h3PYh48ehQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LQGzVrJyAMNA1bUU6nW4oA0kAwtmAykqN2VCfk2JG8=;
 b=mFIlEcT2i6YfRxYQJfqSFuJ6X516InYsqkmRfFLimK7iISmCG54HhXT4q1TJkzNkQx3x4jmyvAXNKpclpd5EIXPPSVzePiclDjlIB+DlJpHnJGS0tyfwqyBdtFQnNRDZ3djxMjpMUXOWdMAFPm0kpCVSHat8BjxYKqKaPnNTGNvLNNjUoc821h0uCZEk/1la406wygTwu8h0FO3jHQ0dmuGfDxQs6wcCmDB2vjtOJviSYRmPMWov0O64VqrOzgfcq2bpVZPBin/k40i/bB2novT2wCfyMSLz1/WgfNUqbaDl+Jp58cZu0ZfzW26+8RSxnvkRIWRMu1g2R7mZnch2/g==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by CO6PR02MB7763.namprd02.prod.outlook.com (2603:10b6:303:a2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 18:44:46 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 18:44:46 +0000
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com,
 "manish.mishra" <manish.mishra@nutanix.com>, Peter Xu <peterx@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v6 2/2] migration: check magic value for deciding the mapping
 of channels
Date: Tue, 20 Dec 2022 18:44:18 +0000
Message-Id: <20221220184418.228834-3-manish.mishra@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20221220184418.228834-1-manish.mishra@nutanix.com>
References: <20221220184418.228834-1-manish.mishra@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::34) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|CO6PR02MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: ed102759-9bf8-49c0-6039-08dae2ba43f5
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fMA37FK1v5AoZuKAQFuUYRSzPktuP6IiHp+zeEaVtjgizG7Erv/3x5Bz4Af7zvUdVBZ4lb6qTASY2NShR49O9bLmFLshLhGVp0KzDCzQdvvFOEluBNTpa+O4Jq0Wgc0iRrfUepKsZlxboOPESQXHS2iAn2glBFsq+6nmIWhOuyv8PYoKmqilHjOCTLwCdGvgmRiT8UVAJ5WxDWxQhOeb42UStTfirRPV5fkycqIkBuoQ9t1bvzaJJKEFvm+6rqWYjiP3h0qxW+XV98heXcLXNChqF8ucI0LXhQhZJ/K0rMWuozYHh5Kav14+e8NhjCKy3AjTODYdeEa45zX77tEHTevzlSXr0xZe6tmXvhnFjeqkgldwMjI8TLJbnm+UjUUfInzAhFYiiS4QqvnK8CT/15ak+JLZ8cDUDN7oZCsMt9EVEvpPoBUbvnK63uufFKjCpH2l3tQag06PJs3afXidRiDCiT1qGS4+aLM80fUhq4rY5uOY1RjuOy6cCIlOjwSDK6wSkmkRMu8FyRrJc+iHwWJ1mwz+soFxZOvXtAY1KiWhu5cHWKnQzRMdtcd/LzHTkrHLjU8jmVSEzKRoTNZW4br3itADkd22R+UFCvLnKbzafQGgo/zFeEciph345UEFgvzS4J7OiSll3q0SQTKZLB0IMFQF/QdGx4mPLXmd4R2coEN46icWtxnzaF2XgpYKz5LaC55JaV/gSEv5Sxo+ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199015)(38350700002)(38100700002)(83380400001)(86362001)(4326008)(5660300002)(66556008)(30864003)(8676002)(2906002)(66476007)(66946007)(41300700001)(26005)(52116002)(6506007)(6512007)(1076003)(186003)(6666004)(54906003)(316002)(478600001)(6486002)(6916009)(2616005)(8936002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ip8c+jSlLuecsGwauGyAb/q1ewZbWGatje4kEy1YaPmc4l3Evo2X9tqOA6ON?=
 =?us-ascii?Q?XqH8bkZkc7+ZQQbPH0j12B7Y5n7EMhTbI1TtOi4gqaUaoASeY2cR34cb4zUP?=
 =?us-ascii?Q?+rbhHUWNj3h5zLq17SnyqrB5KsR9M7LMjn92CzgwMqfux7E3sj5LFPJzzwJz?=
 =?us-ascii?Q?t4aTkEgYCKJW3A76YpLWRbC1LFFHiBkk4vmH8IK6DN5uLPZht0e751Iae5EW?=
 =?us-ascii?Q?Q3RWBSg+jQOX2PPC9VBxDAB/cwR1q47LQii7C3mdDrTnMsWM8ypwVifrPIe2?=
 =?us-ascii?Q?3pNvtZXCmkeyK4C/1TLeN90/Nu/oa3PlazdZbqvyunGExxhS71X77LeL21bH?=
 =?us-ascii?Q?k0CxpBvghU07ikdOgFsMntT9ZOyp0cySGmVYE+8dcLr92dYZ96zllyCR+hie?=
 =?us-ascii?Q?ZN1XgcRNVJYXcF8OQw7BJAmQ+Jvb9VuQwrhd7nqpZePOpN11C9WaayFLmgPO?=
 =?us-ascii?Q?5ZC8i7vqqFuWYyIJtP4Zn7WlqhONPDMdAMx86tyVLrHwl3k+Iv2hvCAdfwYq?=
 =?us-ascii?Q?rna834U7r8oDbd5piIOqYQdR6Rv1dmTNd1wT5exc0Cg9iZ3GrytrGhhj3set?=
 =?us-ascii?Q?Hkzrs/TaxphRvPfm1nu3H0u1LyEVxpwgv84IFpYuFxSu0TT/okP4SwOtGjJr?=
 =?us-ascii?Q?ODh7cfZOfEhUy1ENnd8soLnD/8C2RrvYfgssSGy4UtV6GYXfM9k98NZ012E/?=
 =?us-ascii?Q?A2+ZcxnGEiE2YWLJjCwBzT7IO1uURvZeL0g6A0lTp7T7/DSrxKb1nq91L/y2?=
 =?us-ascii?Q?ME+Hbcpdp41apXFofv2u2kcWrR7ibtIEtHlNFS/JegWsxOt3RBppdT7WBnPY?=
 =?us-ascii?Q?5LeHu8+jo6zXB8cOBK7DOda7NZTgnNC1K6U4Xff/ulf/Q+HprIGb3JGmu7Pf?=
 =?us-ascii?Q?5K7ggH4n1Bd5V6ytgNCO2JgL4EyvyPL9k+cTD0FITLWZrD+n5rqdpb9erMvz?=
 =?us-ascii?Q?Vbg5MVWvs1pB2gGECMhsaol99fgAGYo6vsHU80qox07MqEPnReTMR025s/h3?=
 =?us-ascii?Q?6sQpAMy/9Yjrin7p031EhBJaqArF/jFp5m3kxgbTr3pEIqQ4wIN1+zOhLq85?=
 =?us-ascii?Q?y3iHgydbMqhZwRDPEmHowx3M/ZkU+LcS13erE7eLnGkErpYTAnwcsVDJQuat?=
 =?us-ascii?Q?zVlz/bnAizxde9q5RnTAmZQHmR7OAVrgNG3b3aRML9CcJ9DuRU5CYM1VsSMH?=
 =?us-ascii?Q?5TFHXLm8MhbzyzEOzHqrc4Faky2+TAz/JqBqbbazfJRa2UEp5LGBk74i64uV?=
 =?us-ascii?Q?MOhB/wF8RZt9fIuANLRkpHOxYIFRys4VaegOJIS6LXI3YnIAV690I0DtoPaf?=
 =?us-ascii?Q?gYr1nM/cKl3vP54Sv8DTw4TVNYCsXN6+XQgRC0yCAgGEpSVigFMmXClKwW8s?=
 =?us-ascii?Q?g4GHgKn6niqkS41ssz0Bht0U0LQk7ZWlRaK77Vk24vZB3bqAR7q4W/9uzGRH?=
 =?us-ascii?Q?wdmSDztIWqLsoYXXSD+zMtVrAAfLi/NsE8unLv+GSUw5ZhQ5lBVvZAwsnfON?=
 =?us-ascii?Q?+s6m1h0h4SdLI68b1dJzjFNoGk8BTAS6RP1JiFwJ2Fs4aOznxzXC+NL6co9H?=
 =?us-ascii?Q?gRMmq+9XHUwsuSLo53uY54Hwb3pwtiXybr9XBmj4Mn5OiEPdWK6XMj/nzjpt?=
 =?us-ascii?Q?Kg=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed102759-9bf8-49c0-6039-08dae2ba43f5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 18:44:46.0013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fyu269BNYAe3Nv25my74VOhqu1thdupQ0+JQr4kBK6rFBDYGDrNaqGf5db9Jn80i+2k9+uZqmUuVcncCEOJw+F9a5ei5J4w/nFRWo3VsYrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7763
X-Proofpoint-GUID: cDpXIRprMI1HbMsX33Z9WTddcD643Lhe
X-Proofpoint-ORIG-GUID: cDpXIRprMI1HbMsX33Z9WTddcD643Lhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-20_06,2022-12-20_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Current logic assumes that channel connections on the destination side are
always established in the same order as the source and the first one will
always be the main channel followed by the multifid or post-copy
preemption channel. This may not be always true, as even if a channel has a
connection established on the source side it can be in the pending state on
the destination side and a newer connection can be established first.
Basically causing out of order mapping of channels on the destination side.
Currently, all channels except post-copy preempt send a magic number, this
patch uses that magic number to decide the type of channel. This logic is
applicable only for precopy(multifd) live migration, as mentioned, the
post-copy preempt channel does not send any magic number. Also, tls live
migrations already does tls handshake before creating other channels, so
this issue is not possible with tls, hence this logic is avoided for tls
live migrations. This patch uses read peek to check the magic number of
channels so that current data/control stream management remains
un-effected.

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
---
 migration/channel.c      | 45 +++++++++++++++++++++++++++++++++
 migration/channel.h      |  5 ++++
 migration/migration.c    | 54 ++++++++++++++++++++++++++++------------
 migration/multifd.c      | 19 +++++++-------
 migration/multifd.h      |  2 +-
 migration/postcopy-ram.c |  5 +---
 migration/postcopy-ram.h |  2 +-
 7 files changed, 101 insertions(+), 31 deletions(-)

diff --git a/migration/channel.c b/migration/channel.c
index 1b0815039f..fc0228a198 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -92,3 +92,48 @@ void migration_channel_connect(MigrationState *s,
     migrate_fd_connect(s, error);
     error_free(error);
 }
+
+
+/**
+ * @migration_channel_read_peek - Peek at migration channel, without
+ *     actually removing it from channel buffer.
+ *
+ * @ioc: the channel object
+ * @buf: the memory region to read data into
+ * @buflen: the number of bytes to read in @buf
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Returns 0 if successful, returns -1 and sets @errp if fails.
+ */
+int migration_channel_read_peek(QIOChannel *ioc,
+                                const char *buf,
+                                const size_t buflen,
+                                Error **errp)
+{
+    ssize_t len = 0;
+    struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
+
+    while (true) {
+        len = qio_channel_readv_full(ioc, &iov, 1, NULL,
+                                     NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
+
+        if (len <= 0 && len != QIO_CHANNEL_ERR_BLOCK) {
+            error_setg(errp,
+                       "Failed to peek at channel");
+            return -1;
+        }
+
+        if (len == buflen) {
+            break;
+        }
+
+        /* 1ms sleep. */
+        if (qemu_in_coroutine()) {
+            qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 1000000);
+        } else {
+            g_usleep(1000);
+        }
+    }
+
+    return 0;
+}
diff --git a/migration/channel.h b/migration/channel.h
index 67a461c28a..5bdb8208a7 100644
--- a/migration/channel.h
+++ b/migration/channel.h
@@ -24,4 +24,9 @@ void migration_channel_connect(MigrationState *s,
                                QIOChannel *ioc,
                                const char *hostname,
                                Error *error_in);
+
+int migration_channel_read_peek(QIOChannel *ioc,
+                                const char *buf,
+                                const size_t buflen,
+                                Error **errp);
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index 52b5d39244..bbc9ce3ca6 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -31,6 +31,7 @@
 #include "migration.h"
 #include "savevm.h"
 #include "qemu-file.h"
+#include "channel.h"
 #include "migration/vmstate.h"
 #include "block/block.h"
 #include "qapi/error.h"
@@ -663,10 +664,6 @@ static bool migration_incoming_setup(QEMUFile *f, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
 
-    if (multifd_load_setup(errp) != 0) {
-        return false;
-    }
-
     if (!mis->from_src_file) {
         mis->from_src_file = f;
     }
@@ -733,31 +730,56 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     Error *local_err = NULL;
-    bool start_migration;
     QEMUFile *f;
+    bool default_channel = true;
+    uint32_t channel_magic = 0;
+    int ret = 0;
 
-    if (!mis->from_src_file) {
-        /* The first connection (multifd may have multiple) */
+    if (migrate_use_multifd() && !migrate_postcopy_ram() &&
+        qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_PEEK)) {
+        /*
+         * With multiple channels, it is possible that we receive channels
+         * out of order on destination side, causing incorrect mapping of
+         * source channels on destination side. Check channel MAGIC to
+         * decide type of channel. Please note this is best effort, postcopy
+         * preempt channel does not send any magic number so avoid it for
+         * postcopy live migration. Also tls live migration already does
+         * tls handshake while initializing main channel so with tls this
+         * issue is not possible.
+         */
+        ret = migration_channel_read_peek(ioc, (void *)&channel_magic,
+                                          sizeof(channel_magic), &local_err);
+
+        if (ret != 0) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        default_channel = (channel_magic == cpu_to_be32(QEMU_VM_FILE_MAGIC));
+    } else {
+        default_channel = !mis->from_src_file;
+    }
+
+    if (multifd_load_setup(errp) != 0) {
+        error_setg(errp, "Failed to setup multifd channels");
+        return;
+    }
+
+    if (default_channel) {
         f = qemu_file_new_input(ioc);
 
         if (!migration_incoming_setup(f, errp)) {
             return;
         }
-
-        /*
-         * Common migration only needs one channel, so we can start
-         * right now.  Some features need more than one channel, we wait.
-         */
-        start_migration = !migration_needs_multiple_sockets();
     } else {
         /* Multiple connections */
         assert(migration_needs_multiple_sockets());
         if (migrate_use_multifd()) {
-            start_migration = multifd_recv_new_channel(ioc, &local_err);
+            multifd_recv_new_channel(ioc, &local_err);
         } else {
             assert(migrate_postcopy_preempt());
             f = qemu_file_new_input(ioc);
-            start_migration = postcopy_preempt_new_channel(mis, f);
+            postcopy_preempt_new_channel(mis, f);
         }
         if (local_err) {
             error_propagate(errp, local_err);
@@ -765,7 +787,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
         }
     }
 
-    if (start_migration) {
+    if (migration_has_all_channels()) {
         /* If it's a recovery, we're done */
         if (postcopy_try_recover()) {
             return;
diff --git a/migration/multifd.c b/migration/multifd.c
index 000ca4d4ec..eeb4fb87ee 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1164,9 +1164,14 @@ int multifd_load_setup(Error **errp)
     uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     uint8_t i;
 
-    if (!migrate_use_multifd()) {
+    /*
+     * Return successfully if multiFD recv state is already initialised
+     * or multiFD is not enabled.
+     */
+    if (multifd_recv_state || !migrate_use_multifd()) {
         return 0;
     }
+
     if (!migrate_multi_channels_is_allowed()) {
         error_setg(errp, "multifd is not supported by current protocol");
         return -1;
@@ -1227,11 +1232,9 @@ bool multifd_recv_all_channels_created(void)
 
 /*
  * Try to receive all multifd channels to get ready for the migration.
- * - Return true and do not set @errp when correctly receiving all channels;
- * - Return false and do not set @errp when correctly receiving the current one;
- * - Return false and set @errp when failing to receive the current channel.
+ * Sets @errp when failing to receive the current channel.
  */
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
 {
     MultiFDRecvParams *p;
     Error *local_err = NULL;
@@ -1244,7 +1247,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                                 "failed to receive packet"
                                 " via multifd channel %d: ",
                                 qatomic_read(&multifd_recv_state->count));
-        return false;
+        return;
     }
     trace_multifd_recv_new_channel(id);
 
@@ -1254,7 +1257,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                    id);
         multifd_recv_terminate_threads(local_err);
         error_propagate(errp, local_err);
-        return false;
+        return;
     }
     p->c = ioc;
     object_ref(OBJECT(ioc));
@@ -1265,6 +1268,4 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
     qemu_thread_create(&p->thread, p->name, multifd_recv_thread, p,
                        QEMU_THREAD_JOINABLE);
     qatomic_inc(&multifd_recv_state->count);
-    return qatomic_read(&multifd_recv_state->count) ==
-           migrate_multifd_channels();
 }
diff --git a/migration/multifd.h b/migration/multifd.h
index e2802a9ce2..ff3aa2e2e9 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -18,7 +18,7 @@ void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
 int multifd_load_cleanup(Error **errp);
 bool multifd_recv_all_channels_created(void);
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
 int multifd_send_sync_main(QEMUFile *f);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index b9a37ef255..f84f783ab4 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1539,7 +1539,7 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
     }
 }
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
 {
     /*
      * The new loading channel has its own threads, so it needs to be
@@ -1548,9 +1548,6 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
     qemu_file_set_blocking(file, true);
     mis->postcopy_qemufile_dst = file;
     trace_postcopy_preempt_new_channel();
-
-    /* Start the migration immediately */
-    return true;
 }
 
 /*
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 6147bf7d1d..25881c4127 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -190,7 +190,7 @@ enum PostcopyChannels {
     RAM_CHANNEL_MAX,
 };
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
 int postcopy_preempt_setup(MigrationState *s, Error **errp);
 int postcopy_preempt_wait_channel(MigrationState *s);
 
-- 
2.22.3


