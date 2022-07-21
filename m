Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A289857D4A0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 22:06:39 +0200 (CEST)
Received: from localhost ([::1]:44040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEcRS-0000fN-Ez
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 16:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oEcHw-00052M-Jv
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:56:48 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:3018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oEcHu-0006b4-M8
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:56:48 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LIKtfn027882;
 Thu, 21 Jul 2022 12:56:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=Jf+Mn09f0Jt3Jmxo4/DD0fulIHWMmHuh/55weR3xCew=;
 b=p+9f/1wVx+znVBKAGSVbP0uQ1MHdWqfdy5D5T7u8vBTNNXsjvA1PH09nB+PW+e9RhTpI
 vCqyYHtGIR+2vZy4yOuNCwWA6W4Y5lkS5HQzuiUy1Ufgg2k/cE4zM1LdFV1aSj1WYPd9
 e7EMPRfpOrJ5jpoHD+lQ2CDBza/Xz+MW0Qbg4XCcLqCb3fXtBjtxPcgEnZ+9tuBsd/g9
 YEVFJFqFsumIAiiHVy2+lla6eb4WIpvGvSPyzOhtwPw2LgwMOc6TyhZwg+Iv39cXiEvY
 ghfhzPTdSpepQToYEdWTIpJPOWIe3yqWRAA0QCqxviCkasw0pApw7r+P10epae11S8IU rw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3hbvv244dh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 12:56:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FS5mQ3CKPGBpfTazdSGG0Jzq+oRU16pIjaZgGMMRZw5g0vXuijqnaxo3rqRoRKjaVF7XhoMkoEM2qHNksUNZDyAs/rKBHGn/dSj3KKgEb4hB6dItU7s7ZzgUZQNTXectfOAMxBqCOCbKwPIvXlIJgF7AOOJmAoYCkkpHHqy9OrJRZhWrRK0N6nwVMc/UCS8PEmQ4ySvnPBupRgeSJbishav2Z5V3UJMFywJmdOqBr9uXdzC+W1WOenCq212UlVUozUJYNtPCU3kwmYdZJCM4S1oAKxeY3Tq3u+svlFzwnIk3drPf/MzaQ7PYdDAy0Vl1HJNC2+n10xyL3gDoZ3ClxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jf+Mn09f0Jt3Jmxo4/DD0fulIHWMmHuh/55weR3xCew=;
 b=XQugevJVj0JXMslklk68ONzZF6WAvyKmWyw9/gyhbXhgVjFQsPNMJU1WmMdyRO8fqNIK1qaeJqIIH2eE5QGPjng4bKKK9HaM+WajgnEWlR/vqSJXhps8rP8o9ayZUHSOL0iMDgyBYn+l1CdFcXbEmPrCKYk80do3hf8H2WQXRQsTRVG7N01XfWAh/6AGaWT3I2fnMaGaVUMq/yTvFePxkOPkJpQ4izTdu67AB7ET+A6B3ebxZJmu+wXyEw4Q9oLQ9M5+fTpofrmRBzInpCZtoFKGVjtp26Nm1RaHziMx8fHJcDrG9fKqAkMM7Hn1522IBJ7Q+GjxBBcgbnrQfBHDsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DM5PR02MB2825.namprd02.prod.outlook.com (2603:10b6:3:108::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 21 Jul
 2022 19:56:44 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 19:56:44 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 prerna.saxena@nutanix.com, Het Gala <het.gala@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 6/7] muitlfd: Correcting nit : whitespace error changes in
 qemu-sockets.c file
Date: Thu, 21 Jul 2022 19:56:19 +0000
Message-Id: <20220721195620.123837-7-het.gala@nutanix.com>
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
X-MS-Office365-Filtering-Correlation-Id: de1cee82-971a-488e-0fea-08da6b5322fc
X-MS-TrafficTypeDiagnostic: DM5PR02MB2825:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G1+pNYITKdXtpCi7TZ01HMFbDNGn7B/13AjFV/I9btKNYsBLr1i41meJ74bd+cHp6FsXT9FOaKSyPCrJxRyMZUfQ8Laq/dXP9xLUicfpG8OYH05vMGBMPla2YvXxcuAAYgNcGo4/jf8HN95NYu0qwIPpTECrUqXcNN6dAW4ir1K/+nDul+p+swTDFEwH5YWdwo7tIutBEsdLZFmXZVaI282hebq/4Fsppv/SL4f+TCMpDe/lo6G2pDbzGmxs3+gA+XCnl7Jris3dAEtu29lkkwk4KLymbTc79drNhB0grr9wvDKnddzSk/mxfXXIVlR6I5jTRrlgSn8sHm6KtJn7HA2wXZS9p4cdspqA+wKbbUCpMgVC6MIYF6nOxb+K1Bb3No6R+nNu3sVLXVCg6jGnMogLzIM+wz7IHS2h4X25lmfa/GUdhOvgp2gWhdGluRcsAdXgGHpdnquQdo9RcquUbAcx5sXWTUCBKJeKgLJ1yb2BIDYG+OVsDM1U/vcNzRrZbNZPAMrPr584/n14NssKaLr95T9g3inE3qw4g4GM16H6NMqFHGL/YjlTw9BlGrddrWdFkL/nnhqG07oO5uGvpiAhmhMXHyqjz6V6cQMVPXdgCPOxbF3EYy+rAmviyt0cR6Hos5JQUH3TSLHRgdEsnWuRAlDct3hups5mE3XakseHp4IkBcsKFhgvzcl520Y1JNBsHNbVRFyLRFBa0yk1+77Y+9QiFuirQ+G/6k/+1u1MEWSF5xsxTfsD3j7bTUKY0Xu0cbDRYWBS49LbGBI3mQaLdm7p8PcJKWe68+qNhqA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(346002)(376002)(396003)(366004)(38350700002)(38100700002)(1076003)(83380400001)(36756003)(186003)(2616005)(26005)(86362001)(107886003)(6512007)(316002)(54906003)(478600001)(66946007)(6916009)(66556008)(52116002)(6506007)(41300700001)(5660300002)(4326008)(8676002)(8936002)(44832011)(6486002)(6666004)(66476007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pGJo+FDcUFpAt88y5T5289t92gbCdSmVnKRbPnqqqFiyjfJRGdo0/CI6GzGn?=
 =?us-ascii?Q?55S3dD/MhAIKp8wiLJ9S0E3Ahw9xY/wRQTFU0MR7DaUSjFYbfsgZn02nOJXc?=
 =?us-ascii?Q?sFuJkpmGV7OH0RODpJri8wU5Zn8YZ/0c676lbncOTk6kT41gz27pq386Ytim?=
 =?us-ascii?Q?aWw5Wnmpv0V6aANAaexvVmRIzvTtsLD5VsVGDGEGjzEVjTSBoVhVCe5Aaz4x?=
 =?us-ascii?Q?kvNgP6LHnSpddZOSJnlpc5zYZcBL+IHYS2ZfjCYKO2m1/AjKO9FSZ+2Fldbk?=
 =?us-ascii?Q?279WUXdkTOC10Gz2o+uxaH72Jh+9cWHcPPHfpfta8E0J1v9/QXJnbv2vV4SE?=
 =?us-ascii?Q?o2UEe+40b9MxvDlmyoPQdTcLQWD8hWIuUP7d0SwmGhiudmeArHmdKIP23REc?=
 =?us-ascii?Q?KPueUR9dzfbSs1Jx57NrX967B0gdYZp3ODMslL+6YImahIYOEH0ntMCYuDb3?=
 =?us-ascii?Q?QolLzqYxIMXa3LBY0eb+5zWSZMqolwxGNJ/+yjT/3IXMVIJXyEnYzc69htn5?=
 =?us-ascii?Q?heYrycwndBtdmXB//nFkI8IiYGQ1TXFLUKHVTY+11U0uyoM2/wvfV8yMiNqq?=
 =?us-ascii?Q?SDN8bNbVaZJ2rXTMIJTDGYtRdxAzqwScUK/5GC2UYC+aDYp8hMrD+pvvB3yR?=
 =?us-ascii?Q?n5WmwwBL+U1sE68QXz30jMQk7aHaemkb4xmzJbbvSOyVJex3/NQ5GIdg7GCF?=
 =?us-ascii?Q?Gw3iWY3OCnA/fWIH9MrkNWPdAjQhpg1lNGYFWAIQ6lsCdVMiiHQVMKFpo28W?=
 =?us-ascii?Q?tLy7xTOR51376YqFQIetgW0LZytIVdFqqweEGtdP+o7poDNOVJjNFs4Hwo2Z?=
 =?us-ascii?Q?UZ5+0hXTuKnrMXXo80Nf7gtom0SIiXUOq+CjRU2+7evS9LymQVaSNK7QuKyh?=
 =?us-ascii?Q?X2BL889qJm8YerhJxCZkc1dTMN8wj8/zDEzvSgNLk9MGQQBnTfLsZuaUKX0E?=
 =?us-ascii?Q?dm4bFUeOUrFrPwG8yyNIkBxf4uf5s9PGf4abYDEUmexq/WqVCbIX8H9DCyEu?=
 =?us-ascii?Q?pRgi7khKFwJ4eCspxjzfmUgVhAJifQ0vLUDsc0NJsgZu0rGRRAF5DN6aBwxh?=
 =?us-ascii?Q?4LHtvBZBciFCNOvSTOJne8L1km/lW72/shwm8oBtPA1g/2edskET/RfkH+bK?=
 =?us-ascii?Q?t8D6ENYgyY1h2WsAbA0XJexJoKr7wUK88bOb9UoQ5f7e+bHLrDquboO3lK+D?=
 =?us-ascii?Q?dn+UZfXcOThjqoljJWkBsnPlzbOAH/dbaF8sv0ymW1TFgQPek1UTZw1HRGWE?=
 =?us-ascii?Q?yowEv0xYPTJl2TmiG/Tku2Cl6F50h1W+SMGCC02k/OJEOEBOiS6jVwgjf4yE?=
 =?us-ascii?Q?GIaEzmr4bmYGykjQ8oNo7s3swbRNXpZefKmw3z9VBSADNL3EkdygoFX98Br0?=
 =?us-ascii?Q?mb1Ner3P5AXw2Xm4GYbFNTGz4jYfN1UXe6GhdobwowSrdenbq3wDOUwWLa86?=
 =?us-ascii?Q?WQ2Gw8DTOW800NnxypsSapHOoIvtEkcPkBnkmvXRS5xmW+IGP4lVYs6MtGnL?=
 =?us-ascii?Q?YqVERlj0pLSpJucspk70pa53fSSFt4q7w8x4LUGiWRB9obD8zdMV+EAQzDHM?=
 =?us-ascii?Q?1QaXVS/KUjB8YxRQLO8cDOj6ovsFSLqhL6YyAX4B?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de1cee82-971a-488e-0fea-08da6b5322fc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 19:56:44.1623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ud4H+T8moOeLTzcRAWTUKqiTWokqMof3mitF0kzMJlbSPGD8BbYt2fD27+6SBx9GzdR4fYsdJZ37Ui+rVCPZdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2825
X-Proofpoint-ORIG-GUID: mAd_fflclkwPmjy2oonnBJAqiyYWUWKv
X-Proofpoint-GUID: mAd_fflclkwPmjy2oonnBJAqiyYWUWKv
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

Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 util/qemu-sockets.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 491e2f2bc9..724c081e6c 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -52,10 +52,10 @@ static int inet_getport(struct addrinfo *e)
 
     switch (e->ai_family) {
     case PF_INET6:
-        i6 = (void*)e->ai_addr;
+        i6 = (void *)e->ai_addr;
         return ntohs(i6->sin6_port);
     case PF_INET:
-        i4 = (void*)e->ai_addr;
+        i4 = (void *)e->ai_addr;
         return ntohs(i4->sin_port);
     default:
         return 0;
@@ -69,11 +69,11 @@ static void inet_setport(struct addrinfo *e, int port)
 
     switch (e->ai_family) {
     case PF_INET6:
-        i6 = (void*)e->ai_addr;
+        i6 = (void *)e->ai_addr;
         i6->sin6_port = htons(port);
         break;
     case PF_INET:
-        i4 = (void*)e->ai_addr;
+        i4 = (void *)e->ai_addr;
         i4->sin_port = htons(port);
         break;
     }
@@ -210,9 +210,9 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
                              int num,
                              Error **errp)
 {
-    struct addrinfo ai,*res,*e;
+    struct addrinfo ai, *res, *e;
     char port[33];
-    char uaddr[INET6_ADDRSTRLEN+1];
+    char uaddr[INET6_ADDRSTRLEN + 1];
     char uport[33];
     int rc, port_min, port_max, p;
     int slisten = -1;
@@ -226,7 +226,7 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
         return -1;
     }
 
-    memset(&ai,0, sizeof(ai));
+    memset(&ai, 0, sizeof(ai));
     ai.ai_flags = AI_PASSIVE;
     if (saddr->has_numeric && saddr->numeric) {
         ai.ai_flags |= AI_NUMERICHOST | AI_NUMERICSERV;
@@ -282,8 +282,8 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
             e->ai_protocol = IPPROTO_MPTCP;
         }
 #endif
-        getnameinfo((struct sockaddr*)e->ai_addr,e->ai_addrlen,
-                        uaddr,INET6_ADDRSTRLEN,uport,32,
+        getnameinfo((struct sockaddr *)e->ai_addr, e->ai_addrlen,
+                        uaddr, INET6_ADDRSTRLEN, uport, 32,
                         NI_NUMERICHOST | NI_NUMERICSERV);
 
         port_min = inet_getport(e);
@@ -548,7 +548,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
     Error *err = NULL;
 
     /* lookup peer addr */
-    memset(&ai,0,sizeof(ai));
+    memset(&ai, 0, sizeof(ai));
     ai.ai_flags = AI_CANONNAME | AI_V4MAPPED | AI_ADDRCONFIG;
     ai.ai_family = inet_ai_family_from_address(sraddr, &err);
     ai.ai_socktype = SOCK_DGRAM;
@@ -575,7 +575,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
     }
 
     /* lookup local addr */
-    memset(&ai,0, sizeof(ai));
+    memset(&ai, 0, sizeof(ai));
     ai.ai_flags = AI_PASSIVE;
     ai.ai_family = peer->ai_family;
     ai.ai_socktype = SOCK_DGRAM;
@@ -616,7 +616,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
     }
 
     /* connect to peer */
-    if (connect(sock,peer->ai_addr,peer->ai_addrlen) < 0) {
+    if (connect(sock, peer->ai_addr, peer->ai_addrlen) < 0) {
         error_setg_errno(errp, errno, "Failed to connect to '%s:%s'",
                          addr, port);
         goto err;
-- 
2.22.3


