Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9099E65269A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 19:52:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7hbs-0004Bw-Sy; Tue, 20 Dec 2022 13:45:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1p7hbg-00046f-Hd
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 13:44:55 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1p7hbY-0002Yh-6N
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 13:44:48 -0500
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BKFVdSH011031; Tue, 20 Dec 2022 10:44:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=T+UQS1alBNd/DgGaRheG1P/jnPqIy7UMgCH9EEOF3aM=;
 b=QzS5MF+16AnxNIWBAOXfeKfUI0YD9gqqMQyk7xWk+gYwfl7pX7rlcRJXpgwFvktXmm0+
 vX1+zSz+pKJ/h5e5NPsuiaNR2zDwX7+pkcnazRfytayZ9iQn3SfAFwrs8SWsOfxrGaVn
 1SWFMtAXygrSHNH3T7R/iuhFfhvNDKfi4w/j45TssecDHsmCiuTz+7Z3VgQ+TSTGlMoe
 YGYFHfvcFjaCKugMlz3lx04z2Ym+uyR82xhoA5GgaH6/xL1LoYFp8tvShD4PnQzkw+jH
 BQx/stkaD6fhiaxqgT6pMAOGSU4ij6vA7EJrbgwtYwJ8VYJxdklXBgut+xo0sa//vX89 MQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3mhe748at9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Dec 2022 10:44:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hA+C0U7MSCALCgbV7bkYvGNz7159z401FpV20sLp4JeDVpS1qBNYk7mpI/RiStuMuB33FZh+U34Fk8t9z/yXOhCyTi3CKmyluFZB8Bh5Ko2YEnqoTOvzgB4oyPBHkPjVvUZslTP9mqxkbyajjRZHzAwALULHxDtfJz1a90wR4QYzl9bpG5BFJjj7ZQt6RFePEOtYGtPCx5qIvos8HVyDalSIVD7RPdu2+gJV6xDLkeZX7ZzYKOfe834d9wIPbfyrEqKTEFvWbiRittUJSLYomB/S4DCaFr3ssh3E6CctL0hlq9xjr1oYearlBNOLeheJFpePmqBlIDyV/et/xty/ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+UQS1alBNd/DgGaRheG1P/jnPqIy7UMgCH9EEOF3aM=;
 b=Tt4cCfo7yILqtEmlxBaWD6cjTLqo8dmOYaU4IaYXG9ZQRbFsQWq7ZYqu9k1ew3jPoREYzZe1Y+QEKSWjLxZtEOppIe9ps3ytIL8J7LRcD9kCX5wVwfpETO3HZpFAW9tzeWSpIkaS01YHf7Mq7qEQxFYWbv4MRCqUcdBWVAlukfSrv7PF9Yj3SiNBcIPq0MJA9rsEJHppkIGgNZeVECssR8zHn3lbBQXfLSkYzUNR0KJ+zqSTuZrI3gUSsw2T5LrGWLB5FEgKpPfe2CkNUOkrEJo8wTxW2hf1sOt3xn1xT0u82QcctKc+JSY5yrbF8iVnsMUTaYSRov589QW458PRbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+UQS1alBNd/DgGaRheG1P/jnPqIy7UMgCH9EEOF3aM=;
 b=VGQAvmvzBvH9SPbvTbs9NeAB4NSu6TNMlVnMVx+AVkI+7168IXAp+s9W3rL7wVR6kbUFcBXUlYJcq/QNhy4ZgJ9f/fxRDnsetZOOkRe9JJWzI4aAyHLXO3NZ5J1i/ypAjt1BhY7PSKh1mktE3WeI1+IwK0AfIzVMythmLVyQVCPnHShGNh4MSvDTdB6NqEKZI2YX3TR4ztXIr0vSfW4SZpUvVHvaDzIttxK5dHc+3oLmlD9oVeRWFL04gHhC8Nqjy3G1/ornwiJdBkEzYiT2Myk141fwY6yPinuq2qXu01bhcmjFK6W+MhVw1+i++dxmzZTGdVTcjvNw57P2+AHNBg==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by CO6PR02MB7763.namprd02.prod.outlook.com (2603:10b6:303:a2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 18:44:40 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 18:44:40 +0000
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com,
 "manish.mishra" <manish.mishra@nutanix.com>, Peter Xu <peterx@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v6 1/2] io: Add support for MSG_PEEK for socket channel
Date: Tue, 20 Dec 2022 18:44:17 +0000
Message-Id: <20221220184418.228834-2-manish.mishra@nutanix.com>
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
X-MS-Office365-Filtering-Correlation-Id: ad8054ec-e8c2-4f84-6ecb-08dae2ba4091
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: scE3001lByiZGiiSakBSKbAZ0hWYKXDHLRhmJvpvL2Pq+QelzR8rb11ugDIO0TR/7wOEUfqANOTOfPFakEn7BfnJ7ekFzvFUl1xrS9lsaztUgkZqVsH5zF6KDWQL8VPYlycUauAJleBw3RJeac8+yFMm/qreSj86WTETPbaksugwpM+/24XrDZQH3L6GADnlO4585QvZUzBreQy2EdvYudNY0hc3VXu2vCEtMhvmQNirQZT0CdVdNbrGFkBWTcR5xLlNIGM7uDcscz+H33hVS/1BRwsKzrk3dJ2N7JkaIqvs5DP1WqgztztIdqJP2XGGYlhYbh1nKEB3y1j0mqnsargfDIpuauW3sJgKxohaQs1kv8JRUkVE4mMntje8E3aVZx9pAW99G+j0unDJpyXCQTVnmPaMa+65ZUYXX+N19vx6pi7R+arw0q/vHA0K4SUpHL+82jH5kNt0x6fUdkMvaku4iz8RTk8H4SX2mXJ93ffe11fsn17SoCvGW6taqo6ScmeJ2TJtAbPAm4pTuO92pVX5NPN2M7e7ydUJf9KdJhKKSRy3q13/tyvkAd2pl7mIAoZQJJd9s484VnuhvRQXdPYCofmnP5DY4lyXfaJ5Jvvw5ZraMuAiVHIjNNWtMZY9Edw+7OCG09BDuT1t/EBbqhhPrDIAjfvYqN8JCGDGCT2NRnO24+WRYW9YT31/YYsWNzhZSttlgDy1somDB5C4XA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199015)(38350700002)(38100700002)(83380400001)(86362001)(4326008)(5660300002)(66556008)(30864003)(8676002)(2906002)(66476007)(66946007)(41300700001)(26005)(52116002)(6506007)(6512007)(1076003)(186003)(6666004)(54906003)(316002)(478600001)(6486002)(6916009)(2616005)(8936002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CJZ2Vg7ZRch4EAgePFE2opi+19eOUQCffl+S0O0weduxPhlK4J+JQ5Jl1dE9?=
 =?us-ascii?Q?iUv/9k6QP8XcVPy+r2+CwyAs5E+89rCZmKOEkClCNkT/AVEelyysz1qKeFA7?=
 =?us-ascii?Q?LQKqIG2rynxLIN6IWEI7+Hf28p4MINb7HbDhjUYQCGvLIosdRYZmbPSZ9grD?=
 =?us-ascii?Q?PsxvV1bxRVPcbYHkkhIyl4TQr5jjGMD4kqRtzAJxFQ9EONu+2zCftOAFWdbc?=
 =?us-ascii?Q?2Wjvo6ejG652nIahjunfoR04D4j+Vo/Bwfnoqh312giDxOjIpduYe+exx6vU?=
 =?us-ascii?Q?KjC/PdvlW5+wogNjXfH4IMsso+m1SuPiAaCD1dhuy4xw+vLZJg3QVSp1I00Q?=
 =?us-ascii?Q?T5nlD+etdUKdbwws88DDRKNOdMkDSwqSsDOb7G+wzdWKRFhTy4CNPbCA2RZs?=
 =?us-ascii?Q?Rehkpo8AJ1QSV2owNg79rM8Our7f5X61y0864KvwqN6VxNkVoAxOOlBiQTd1?=
 =?us-ascii?Q?QEtdQVH7X4hZeyK72tmDb9QfT2ylKsFPMDcIBa/lh2FA1S+FCbU6rg+08F4N?=
 =?us-ascii?Q?Hzy5IITQ6WV9vkM+JxDw8MiL60unF19GvlQOh19LtT85mkapC7G4f/At4ZGI?=
 =?us-ascii?Q?mzYsQ0F5RCnFY2FKRGSxwHvtHlbt59Q7GYmbxn3IJSrtWBBsK1AwT8MQFx0p?=
 =?us-ascii?Q?jm8BDpAJJhKMFRDd5DTaQqDPxWtCJkfVA+ne19/UAQht/5pMVviLbf7dUKzL?=
 =?us-ascii?Q?a8ZXMy3heHvdmbBTO5rOJnKhXCZYGJCgB2kv91KG4uC8gu3oA3yyXFWRo6dn?=
 =?us-ascii?Q?MKWkoUL4IMb1Q4H5yA5w1Mub1NWGHeJKrb7hu98DQpzhB/aLXew47DAULwj+?=
 =?us-ascii?Q?wFHGwq+Fzb9N95NBQeAjwWizxGCrAYFJM+enPXr01a8bc02yXsie43fI6fKP?=
 =?us-ascii?Q?Ix6x+/uN52q94GSUzrvELPB4Smmn6TC3uQ3Mh/UdaR2F030gBA7v75lGgCA/?=
 =?us-ascii?Q?fA6zEW95GFjEM+3RcKCL2dGPXcYxnq4zH9dwEzR4lpjcJaao9QC6TNImhkih?=
 =?us-ascii?Q?RHTuRkrn2EUP+7OY767j5nEIbeixhM4DaEVR9hn412n3/Ee28T2PEA0XCQmL?=
 =?us-ascii?Q?RaMuIuX7/Ub9etE3RfvBJCBOYVlRbP2EzaDFBgvn6XaHlJnKAH04JSkLFH1w?=
 =?us-ascii?Q?VwctdyG387WO0LhdRC15ztPIKCkb8is60V6L4x/yPsC1Ycdt93VfG+zgg5FJ?=
 =?us-ascii?Q?N5Ha36Bz/utxa6JqPjDiYRNEQXRA7JTSgCmb/hmnjSru9sh32E17a+o9I0BY?=
 =?us-ascii?Q?7oLNwNiSU5e6nq+xyPUynLBMv7U24DFg+ytL790cww50zWMJ9ReH7igbaYqv?=
 =?us-ascii?Q?Eh49yLhfmUSpTbyDh1Z8bfic+JWV0T74GiH1CYgfvDKTfQrnWQ4v5XroOZ7J?=
 =?us-ascii?Q?ry5y+ylWA0sZKY59isU/9lFDp1TvghDvKjj0QGoPCqxOJuQEQGPoLD5J8tja?=
 =?us-ascii?Q?DzqoBYni6F9RBo6KItbEMdMvySDgybIjukbISVUf/I7EtBSsLmHC/pEQEuE0?=
 =?us-ascii?Q?IgRMDQVz6r2Gc8D2zySVD5qfIZopiPZDJGuXkFKhRP77bdfNiD0nIQrfDFg5?=
 =?us-ascii?Q?V66K1161YonEv+78dtWIjg/k8RIcmiV3KXhJUW+GpMyxMob2Fm0h4K0bMhdY?=
 =?us-ascii?Q?Gg=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8054ec-e8c2-4f84-6ecb-08dae2ba4091
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 18:44:40.2976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SARCdzvQMo89BBpcY5xiiENwN1BSZ/ZzXtU7AENw1HDFkyslPgjgjARcG31CjJkSRRjygKnmwVnZUd4lDAyfZrKv4QXnBG990WtiXpl18vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7763
X-Proofpoint-ORIG-GUID: KpXkx7La0KHFdfiDR8PKrA0M4SbeM9aL
X-Proofpoint-GUID: KpXkx7La0KHFdfiDR8PKrA0M4SbeM9aL
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

MSG_PEEK peeks at the channel, The data is treated as unread and
the next read shall still return this data. This support is
currently added only for socket class. Extra parameter 'flags'
is added to io_readv calls to pass extra read flags like MSG_PEEK.

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
---
 chardev/char-socket.c               |  4 ++--
 include/io/channel.h                |  6 ++++++
 io/channel-buffer.c                 |  1 +
 io/channel-command.c                |  1 +
 io/channel-file.c                   |  1 +
 io/channel-null.c                   |  1 +
 io/channel-socket.c                 | 17 ++++++++++++++++-
 io/channel-tls.c                    |  1 +
 io/channel-websock.c                |  1 +
 io/channel.c                        | 16 ++++++++++++----
 migration/channel-block.c           |  1 +
 scsi/qemu-pr-helper.c               |  2 +-
 tests/qtest/tpm-emu.c               |  2 +-
 tests/unit/test-io-channel-socket.c |  1 +
 util/vhost-user-server.c            |  2 +-
 15 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 29ffe5075e..c2265436ac 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -283,11 +283,11 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, size_t len)
     if (qio_channel_has_feature(s->ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
         ret = qio_channel_readv_full(s->ioc, &iov, 1,
                                      &msgfds, &msgfds_num,
-                                     NULL);
+                                     0, NULL);
     } else {
         ret = qio_channel_readv_full(s->ioc, &iov, 1,
                                      NULL, NULL,
-                                     NULL);
+                                     0, NULL);
     }
 
     if (msgfds_num) {
diff --git a/include/io/channel.h b/include/io/channel.h
index f1b7e05f81..5b41d02b2b 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -34,6 +34,8 @@ OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
 
 #define QIO_CHANNEL_WRITE_FLAG_ZERO_COPY 0x1
 
+#define QIO_CHANNEL_READ_FLAG_MSG_PEEK 0x1
+
 typedef enum QIOChannelFeature QIOChannelFeature;
 
 enum QIOChannelFeature {
@@ -41,6 +43,7 @@ enum QIOChannelFeature {
     QIO_CHANNEL_FEATURE_SHUTDOWN,
     QIO_CHANNEL_FEATURE_LISTEN,
     QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY,
+    QIO_CHANNEL_FEATURE_READ_MSG_PEEK,
 };
 
 
@@ -114,6 +117,7 @@ struct QIOChannelClass {
                         size_t niov,
                         int **fds,
                         size_t *nfds,
+                        int flags,
                         Error **errp);
     int (*io_close)(QIOChannel *ioc,
                     Error **errp);
@@ -188,6 +192,7 @@ void qio_channel_set_name(QIOChannel *ioc,
  * @niov: the length of the @iov array
  * @fds: pointer to an array that will received file handles
  * @nfds: pointer filled with number of elements in @fds on return
+ * @flags: read flags (QIO_CHANNEL_READ_FLAG_*)
  * @errp: pointer to a NULL-initialized error object
  *
  * Read data from the IO channel, storing it in the
@@ -224,6 +229,7 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
                                size_t niov,
                                int **fds,
                                size_t *nfds,
+                               int flags,
                                Error **errp);
 
 
diff --git a/io/channel-buffer.c b/io/channel-buffer.c
index bf52011be2..8096180f85 100644
--- a/io/channel-buffer.c
+++ b/io/channel-buffer.c
@@ -54,6 +54,7 @@ static ssize_t qio_channel_buffer_readv(QIOChannel *ioc,
                                         size_t niov,
                                         int **fds,
                                         size_t *nfds,
+                                        int flags,
                                         Error **errp)
 {
     QIOChannelBuffer *bioc = QIO_CHANNEL_BUFFER(ioc);
diff --git a/io/channel-command.c b/io/channel-command.c
index 74516252ba..e7edd091af 100644
--- a/io/channel-command.c
+++ b/io/channel-command.c
@@ -203,6 +203,7 @@ static ssize_t qio_channel_command_readv(QIOChannel *ioc,
                                          size_t niov,
                                          int **fds,
                                          size_t *nfds,
+                                         int flags,
                                          Error **errp)
 {
     QIOChannelCommand *cioc = QIO_CHANNEL_COMMAND(ioc);
diff --git a/io/channel-file.c b/io/channel-file.c
index b67687c2aa..d76663e6ae 100644
--- a/io/channel-file.c
+++ b/io/channel-file.c
@@ -86,6 +86,7 @@ static ssize_t qio_channel_file_readv(QIOChannel *ioc,
                                       size_t niov,
                                       int **fds,
                                       size_t *nfds,
+                                      int flags,
                                       Error **errp)
 {
     QIOChannelFile *fioc = QIO_CHANNEL_FILE(ioc);
diff --git a/io/channel-null.c b/io/channel-null.c
index 75e3781507..4fafdb770d 100644
--- a/io/channel-null.c
+++ b/io/channel-null.c
@@ -60,6 +60,7 @@ qio_channel_null_readv(QIOChannel *ioc,
                        size_t niov,
                        int **fds G_GNUC_UNUSED,
                        size_t *nfds G_GNUC_UNUSED,
+                       int flags,
                        Error **errp)
 {
     QIOChannelNull *nioc = QIO_CHANNEL_NULL(ioc);
diff --git a/io/channel-socket.c b/io/channel-socket.c
index b76dca9cc1..dfb8cb6c40 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -173,6 +173,8 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
     }
 #endif
 
+    qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
+
     return 0;
 }
 
@@ -406,6 +408,8 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
     }
 #endif /* WIN32 */
 
+    qio_channel_set_feature(QIO_CHANNEL(cioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
+
     trace_qio_channel_socket_accept_complete(ioc, cioc, cioc->fd);
     return cioc;
 
@@ -496,6 +500,7 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
                                         size_t niov,
                                         int **fds,
                                         size_t *nfds,
+                                        int flags,
                                         Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
@@ -517,6 +522,10 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
 
     }
 
+    if (flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) {
+        sflags |= MSG_PEEK;
+    }
+
  retry:
     ret = recvmsg(sioc->fd, &msg, sflags);
     if (ret < 0) {
@@ -624,11 +633,17 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
                                         size_t niov,
                                         int **fds,
                                         size_t *nfds,
+                                        int flags,
                                         Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
     ssize_t done = 0;
     ssize_t i;
+    int sflags = 0;
+
+    if (flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) {
+        sflags |= MSG_PEEK;
+    }
 
     for (i = 0; i < niov; i++) {
         ssize_t ret;
@@ -636,7 +651,7 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
         ret = recv(sioc->fd,
                    iov[i].iov_base,
                    iov[i].iov_len,
-                   0);
+                   sflags);
         if (ret < 0) {
             if (errno == EAGAIN) {
                 if (done) {
diff --git a/io/channel-tls.c b/io/channel-tls.c
index 4ce890a538..c730cb8ec5 100644
--- a/io/channel-tls.c
+++ b/io/channel-tls.c
@@ -260,6 +260,7 @@ static ssize_t qio_channel_tls_readv(QIOChannel *ioc,
                                      size_t niov,
                                      int **fds,
                                      size_t *nfds,
+                                     int flags,
                                      Error **errp)
 {
     QIOChannelTLS *tioc = QIO_CHANNEL_TLS(ioc);
diff --git a/io/channel-websock.c b/io/channel-websock.c
index fb4932ade7..a12acc27cf 100644
--- a/io/channel-websock.c
+++ b/io/channel-websock.c
@@ -1081,6 +1081,7 @@ static ssize_t qio_channel_websock_readv(QIOChannel *ioc,
                                          size_t niov,
                                          int **fds,
                                          size_t *nfds,
+                                         int flags,
                                          Error **errp)
 {
     QIOChannelWebsock *wioc = QIO_CHANNEL_WEBSOCK(ioc);
diff --git a/io/channel.c b/io/channel.c
index 0640941ac5..a8c7f11649 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -52,6 +52,7 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
                                size_t niov,
                                int **fds,
                                size_t *nfds,
+                               int flags,
                                Error **errp)
 {
     QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
@@ -63,7 +64,14 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
         return -1;
     }
 
-    return klass->io_readv(ioc, iov, niov, fds, nfds, errp);
+    if ((flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) &&
+        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_PEEK)) {
+        error_setg_errno(errp, EINVAL,
+                         "Channel does not support peek read");
+        return -1;
+    }
+
+    return klass->io_readv(ioc, iov, niov, fds, nfds, flags, errp);
 }
 
 
@@ -146,7 +154,7 @@ int qio_channel_readv_full_all_eof(QIOChannel *ioc,
     while ((nlocal_iov > 0) || local_fds) {
         ssize_t len;
         len = qio_channel_readv_full(ioc, local_iov, nlocal_iov, local_fds,
-                                     local_nfds, errp);
+                                     local_nfds, 0, errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_IN);
@@ -284,7 +292,7 @@ ssize_t qio_channel_readv(QIOChannel *ioc,
                           size_t niov,
                           Error **errp)
 {
-    return qio_channel_readv_full(ioc, iov, niov, NULL, NULL, errp);
+    return qio_channel_readv_full(ioc, iov, niov, NULL, NULL, 0, errp);
 }
 
 
@@ -303,7 +311,7 @@ ssize_t qio_channel_read(QIOChannel *ioc,
                          Error **errp)
 {
     struct iovec iov = { .iov_base = buf, .iov_len = buflen };
-    return qio_channel_readv_full(ioc, &iov, 1, NULL, NULL, errp);
+    return qio_channel_readv_full(ioc, &iov, 1, NULL, NULL, 0, errp);
 }
 
 
diff --git a/migration/channel-block.c b/migration/channel-block.c
index f4ab53acdb..b7374363c3 100644
--- a/migration/channel-block.c
+++ b/migration/channel-block.c
@@ -53,6 +53,7 @@ qio_channel_block_readv(QIOChannel *ioc,
                         size_t niov,
                         int **fds,
                         size_t *nfds,
+                        int flags,
                         Error **errp)
 {
     QIOChannelBlock *bioc = QIO_CHANNEL_BLOCK(ioc);
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index 196b78c00d..199227a556 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -614,7 +614,7 @@ static int coroutine_fn prh_read(PRHelperClient *client, void *buf, int sz,
         iov.iov_base = buf;
         iov.iov_len = sz;
         n_read = qio_channel_readv_full(QIO_CHANNEL(client->ioc), &iov, 1,
-                                        &fds, &nfds, errp);
+                                        &fds, &nfds, 0, errp);
 
         if (n_read == QIO_CHANNEL_ERR_BLOCK) {
             qio_channel_yield(QIO_CHANNEL(client->ioc), G_IO_IN);
diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
index 2994d1cf42..3cf1acaf7d 100644
--- a/tests/qtest/tpm-emu.c
+++ b/tests/qtest/tpm-emu.c
@@ -106,7 +106,7 @@ void *tpm_emu_ctrl_thread(void *data)
         int *pfd = NULL;
         size_t nfd = 0;
 
-        qio_channel_readv_full(ioc, &iov, 1, &pfd, &nfd, &error_abort);
+        qio_channel_readv_full(ioc, &iov, 1, &pfd, &nfd, 0, &error_abort);
         cmd = be32_to_cpu(cmd);
         g_assert_cmpint(cmd, ==, CMD_SET_DATAFD);
         g_assert_cmpint(nfd, ==, 1);
diff --git a/tests/unit/test-io-channel-socket.c b/tests/unit/test-io-channel-socket.c
index b36a5d972a..b964bb202d 100644
--- a/tests/unit/test-io-channel-socket.c
+++ b/tests/unit/test-io-channel-socket.c
@@ -460,6 +460,7 @@ static void test_io_channel_unix_fd_pass(void)
                            G_N_ELEMENTS(iorecv),
                            &fdrecv,
                            &nfdrecv,
+                           0,
                            &error_abort);
 
     g_assert(nfdrecv == G_N_ELEMENTS(fdsend));
diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index 232984ace6..145eb17c08 100644
--- a/util/vhost-user-server.c
+++ b/util/vhost-user-server.c
@@ -116,7 +116,7 @@ vu_message_read(VuDev *vu_dev, int conn_fd, VhostUserMsg *vmsg)
          * qio_channel_readv_full may have short reads, keeping calling it
          * until getting VHOST_USER_HDR_SIZE or 0 bytes in total
          */
-        rc = qio_channel_readv_full(ioc, &iov, 1, &fds, &nfds, &local_err);
+        rc = qio_channel_readv_full(ioc, &iov, 1, &fds, &nfds, 0, &local_err);
         if (rc < 0) {
             if (rc == QIO_CHANNEL_ERR_BLOCK) {
                 assert(local_err == NULL);
-- 
2.22.3


