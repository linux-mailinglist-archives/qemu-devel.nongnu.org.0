Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B49FE609AC2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:52:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompYi-0004t3-CY; Mon, 24 Oct 2022 00:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompYF-0004JI-BN
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:59:03 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompYC-0006D5-D0
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:59:02 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29O4rWf1025182; Sun, 23 Oct 2022 21:58:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=A8rMuHBIpTw3noUrUHbCRcArxsTXdLFPt4FCt/dN2gY=;
 b=MAEI4HPlkRmp9zL0Nk3RHDNpSWhogxRh4ud7ZWEJiuPvqshwmVb9wSB3BkjpPey73Irg
 XZ3eFvgFrQPxLa/4mfICinuOFDF5ebFLiMjsNfk+u85ao0vffdNfwN98Wf6eY5v3doNu
 YxKrjp7+hei7FThZl9E8a5vt0pqNeUfzeSHpmvTC/5ZZklZmaJLzZ5F5s45596oF9z8+
 fAVIoPwx65kufoqQjg9k9VKwrNZITOD/aKgujRyJLdc7r/v3Ot9MaI23pJEn75xzSM89
 bW8N0KgoNbbZn4xdB18MmH2sAhusOOrHtfgvlpbelxC4l73ZbzA7qCs9o/h0qcO5kCi0 2Q== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kcg1ksmag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Oct 2022 21:58:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3y0e72Kunnll6vdj5/OL3iWfezH/UQxwJ7hKmDYUa5T9OOPao2y7r7UfRGxftiQKqrX4Hpw24Qy6qa5x2H8ZeQJWrn7RpX6CLJQavxPQbxmYC7+PsifPWqwmj7wGIr29F9weT79ty1JMg/A/kz5Vp478L2ArskCOignhW502s1luo4GD0uaQK5Tdit79LQmLsC14NEtkO6BYTzbm/iMf4alpathPa06vQna3X5naX6ghk2gn6gVRUteq23vo/eaHNBnIL4TCbganxjnzAJR45pGd+A0MuZTSYzhBMahjuFkHmW2SU/X72BDJk7P20d86nohxtI7Ff8cCwqXMbVb5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8rMuHBIpTw3noUrUHbCRcArxsTXdLFPt4FCt/dN2gY=;
 b=J/bwD1x0LNVkJIYNk6vudND2tD283e+UC6BHFe1c/T8gXAchnqzBbHX6jAjTngHo87fgLA7mdCZ/Qfg6n036bgPBWW+ah/t+M+Rq6/AoqL81sc4OAQAz4BFUDhjdr9QcNW5b/SXEGFV6vrhdOyWvGfQiv7ol3vj13zjvM2hH5wuJEXN6qlMZzP61MW3FKs0S3zuBrDXcxzDC7b+iJibWuokkkgAwaPLaD5TnMN3sChCf1MuT8fReLmxvmAM1+BoYb7/K33gxjqQPiWH5LdYU/GuBnJ/b5jBlwabYs7Goqt5omOuWMNYKNIZE57wH6rk98e63waNZ8r3/YjNKrHT+lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 04:58:45 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9%4]) with mapi id 15.20.5746.025; Mon, 24 Oct 2022
 04:58:44 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 14/16] hw/9pfs: Update synth fs driver for Windows
Date: Mon, 24 Oct 2022 12:57:57 +0800
Message-Id: <20221024045759.448014-15-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024045759.448014-1-bin.meng@windriver.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 778a3ab2-dd91-4cae-0d4f-08dab57c6d9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IjSgZTi80sQzL6KVwD9/7M9lVmB7jmnzTMSlfVTC3gglC8Iv2DUHaoHrDNNJkvUgKMpGsdCVkaEik7MYNspLVl/vuZway/ETeZmjd9Tm9Oc9xKIzaXEDoSKQjzDnPhTAJXpUAOxLFgkbqIhR24e5uTKPlQJP9WNK9FidLlrpYYRSreZ9r0y7Jo5sX7tLz4bBVFAUzZ8MXoKwzBphrhlRlKI0GHcM48FNl2iVqeEKWC/XU/sM3qvOcFfS258h0dcicuDsENo8D6TbbEmjEWoHHnpxx3GqIBTHF3IJE/q5V6EX8lxiYQk1Mmn5OObILd2OKmKGCB4j+/cy7orUQxbCNt3QgGnvrOYFibsFLXR6yA/hsqY8e6M5wh0Y3WnZF75GAVWvahCLr1I/boEtcyGVnuoonH36b6mfHgsBCsd5+97jnvjUeiRBMPec73k6Mf2P+hjdVFPz9kqOz6mVgpg/DbbyLWJD1unf1S9A1CZ8T0rcJps7b+xuzvcInuMEyHh8cH39iBA5eb5VNWlcH3k/jW+28Lx6fn27ULqlTIYlPyENok+gxF9MNAwFptzHdy+r0h5qZABMRAtg1Uhm1zRzwAp5zA190KUalVxVGCZT5FUsDb92ncahUAK8KWfB9R/z7AummcZz5gnFNKTXfWOkxnvZk5BngewMsGOGtQmK3KrEbHn1P5ZKICa2sFL2q2ibkQAnqpVhaqqeT7Umtbd4/sCRt3tRkP4IpPFg+wx1Pt7+AUUFzsk4FH981VZ0BEy7t/a6J9fGMPdmAWML+KBEJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(451199015)(6666004)(6506007)(2616005)(52116002)(6512007)(26005)(1076003)(186003)(83380400001)(44832011)(2906002)(4744005)(6916009)(54906003)(316002)(478600001)(6486002)(5660300002)(8936002)(41300700001)(66946007)(66556008)(4326008)(8676002)(66476007)(86362001)(36756003)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2i6ZwS58Uwv6+iXzx+iTx4uQuxIUQpEq6oWQipNv2ccELstQtpKNfVYdl9Sb?=
 =?us-ascii?Q?2Box+us5kqeKgsKYjfgOcAjXcwG3XjK4mF8P3zWce4YSq8163TPxxJOs0BhD?=
 =?us-ascii?Q?0DxTagYWbpsuwZ+PSnU0KYWa3ON13th6Duyt3wliI0OVJIgmLfeoxa4KKUMe?=
 =?us-ascii?Q?gbI9bU0XaTx7vp2yW8ehruZ2A7V96sTbLmiPWXVIwHPYCVqznRdcCT1d+yKc?=
 =?us-ascii?Q?GepRvgxXsPODVZf9anwDhU67tdWYLURuhIWsDSBdA/udEwaeiKbY+a+pRiSD?=
 =?us-ascii?Q?f/og4KylZvfC1EcMCWxCp+mu83o7QHEa3ysz/tBssBqMkz0Ibars/4szrLcb?=
 =?us-ascii?Q?+6uD79JAexPzLvGn9U4jDnlgpxbcS/0UD+fveOEd2Hd3PHHYkOCiYMnabvg3?=
 =?us-ascii?Q?/jSXDGVeujMNPHfwM+pNo1uLtUeXvw0tAb8pM3rRU5P2Hh05gsdb1snX9Xiw?=
 =?us-ascii?Q?Ut5DF82jJO5Z3x1QFQoPYAg0ZDJgQDrHS0A1KXYjaYi0x1Vuqe7fHJNnIS3c?=
 =?us-ascii?Q?Pi/7PkSLcI0djBf5LRmjqI6jInNXE3kEAK9zk5WlulrQVmt7vyLLrSs82kys?=
 =?us-ascii?Q?AODHvt56NNLqQ3MLFaXxbyWYO4QQDUwfsSfGIGmgBETS/ynTKUH7PbeoFDh9?=
 =?us-ascii?Q?0BvV0h9Rq4UxoCGtSRUvhw/DcnP1ya46DHBTiWBsjj6gwvdDt9xOEIrni558?=
 =?us-ascii?Q?IRhczG5Sg5yUyEQLl7/c66JT/4zO0NTF+M+q8j6/qoHZQ+6XQ8dsrVjospnv?=
 =?us-ascii?Q?SEeGVyqoHkYyPW5nAB+c0EOEnaFeP7ZYbxPHEg+kEatQjMjLMp+IIzETnKWp?=
 =?us-ascii?Q?U7vRZfiwsr3OI8Hzh+/HcPYDCvzosSk/iuiRSPTJoF4Q/o+GNf1wMqRbjnj6?=
 =?us-ascii?Q?gB00F3KdlMx1leQq1jOk8WBNDb/Gq4RI0aCmVEFFPixHtyxudL6pX8BHBrMd?=
 =?us-ascii?Q?vFfatci4C2Oy/E/uCSR1/fCU/26vuah7CJ7kFU3iaKXgsfuURlM/2tUnhEUA?=
 =?us-ascii?Q?BQJngdKgOstmOUFcgtmGMzgYMXt6wHoESHM1yZi6YNT0+ZTYoSuJE+mRkHGi?=
 =?us-ascii?Q?xR35GF1/c/J8FwQUwHT66o5HWFuIHtLT93gdRvu7PY6ckyKTsNadNibkCzSZ?=
 =?us-ascii?Q?f3oZS6LLpLLNzdFpGuSuSEX2k8xEt/iP3+0wXH8hmHrgKY9jDRhQgFRkMavw?=
 =?us-ascii?Q?R1cHzv/mlThlvmbdaZSYB+BYCROfuQDcneDZEiFsJiMN1RqPQGqb+/arOhhL?=
 =?us-ascii?Q?DmziCStsPyKK4zjsPe6DuP7WeWx+WJ0Veei+HLgrB+7hk/UclEWxSYubyg3y?=
 =?us-ascii?Q?Tn6/OcJY0XBXgy9C5bwVTL8CpUlBFLAtxZIzSuJvSCfflyymf3KahvOsvf4x?=
 =?us-ascii?Q?PcAEauJ+DeEiz6cVVPrOMkVsZ7hkJG+vhJ2PZGaV0GAkutPLHS9A+5+AqFer?=
 =?us-ascii?Q?D3AVs8pY/VAGFtNLFs+7rTSvsjf6xQndAX/XjhhUz5uHbT7YaDID+PoQ8DOp?=
 =?us-ascii?Q?rVsKM47BRkjkldseP4/BvBg2+6U2zhMHYSiT8xJhjnmLWHgnvmNu4rW4niCD?=
 =?us-ascii?Q?thXCpAZihrTZ3q7tsUkYLeWeTXFpwRA8rv0r0/zBSZm3caD8w09vlVii++Zi?=
 =?us-ascii?Q?7A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 778a3ab2-dd91-4cae-0d4f-08dab57c6d9a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 04:58:44.7917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: va7RaoL97J6s/s4dsbf+qPgVZdJvp2YCMoYqB0JbzfNUtDLhip1hYUUHbJc2HJzDwl+LdAKWu+UoT2sDSbKcFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-Proofpoint-ORIG-GUID: eBdzmNnwJBQKX--60CcaWf9oJUBoWObS
X-Proofpoint-GUID: eBdzmNnwJBQKX--60CcaWf9oJUBoWObS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-23_02,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=942 mlxscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210240031
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=72963f20b2=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Guohuai Shi <guohuai.shi@windriver.com>

Adapt synth fs driver for Windows in preparation to running qtest
9p testing on Windows.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-synth.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index 1c5813e4dd..6d33eb1cf3 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -152,8 +152,10 @@ static void synth_fill_statbuf(V9fsSynthNode *node, struct stat *stbuf)
     stbuf->st_gid = 0;
     stbuf->st_rdev = 0;
     stbuf->st_size = 0;
+#ifndef CONFIG_WIN32
     stbuf->st_blksize = 0;
     stbuf->st_blocks = 0;
+#endif
     stbuf->st_atime = 0;
     stbuf->st_mtime = 0;
     stbuf->st_ctime = 0;
@@ -236,7 +238,8 @@ static void synth_direntry(V9fsSynthNode *node,
     entry->d_ino = node->attr->inode;
 #ifdef CONFIG_DARWIN
     entry->d_seekoff = off + 1;
-#else
+#endif
+#ifdef CONFIG_LINUX
     entry->d_off = off + 1;
 #endif
 }
-- 
2.25.1


