Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD7D2F951E
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 21:27:12 +0100 (CET)
Received: from localhost ([::1]:45570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Edj-0003cL-I9
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 15:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1EcA-0002OL-8s
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 15:25:34 -0500
Received: from mail-mw2nam12on2102.outbound.protection.outlook.com
 ([40.107.244.102]:37601 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1Ec8-0008Oa-Ir
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 15:25:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAYDwQSyaqeIoVEKvEti8l4qA9jJUkQUm7BUU0dK5I25Dw3eBAoE5B2O7kHX/HMaEjGvUKVCSvvTve5E3houM+XNAcTwuicDJBkTZUB2ty4CDFQA+7s5rurFSaAspShPAVFb09ymkTaFEgJkpr6A0MBKfaVgS9faj+DMA4GJkz8mVGlok7vA1tiCMCu5zjtYcpCKBoH1BtOucz8AGkTuxq99i7cx/nutAMQj/lOxWEQ7kUcdTIEZSxvdN2IZLrtQOof1qnacQYnQCrsH7OEQgzTZxuUYXEUf0HZNdJY7hnm2VJgMUEftqrMhADL3gAqjibgSbqxfc9beFKrCgbs0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aAf7eiTKvih9VAJEE1aTm2W1plC3mVKnzwGcYMdnVI=;
 b=f02qc4GU67sbjd3T2GINdLIDoXy3er9nbWVkLYfG7o2A0a5qbBN2puntxP9cFzWb2lFkarSMH+SJfqwj/wKF8X+sVvbylelf977EPg5mIIT2PaDqrkbA1tvw9d2PX2Dlgc7GYEAnQiJBdM0ybPHDXaqmCNs7pYZ2ccopJUlVjPXAOYMBwx4IdeBdMOpSzFFHEl2upaL7+3X1WmaurWTurilF1RwkvZE2UZDY+nZ8IZ6P8rLeg7FS+9JL1TlrBS7TqBmt34w59sF/QpiMOEeI7uJb1KJGDRkZAOLs6ba6gs+NaXvxGIgQhSMeRq7QR3NPB9/pVCEXU1eII7LWoMtYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aAf7eiTKvih9VAJEE1aTm2W1plC3mVKnzwGcYMdnVI=;
 b=eajk/nw7etk26VH9c9C7P+aSzHT8F8p8GA+5WSc77MtInp/dXKvxTZOAN0+yI4ChB2tm7WOSZsNob/9GnspCx9qvOjpFS5EFiuq8SzFuE3p3UsHav+sivTIpWvcJjf72aC9YZX+BPEpLn9aBl6Ln7gDlnLa+0rzqfHDys2VHBlg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5852.namprd03.prod.outlook.com (2603:10b6:806:115::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Sun, 17 Jan
 2021 20:10:25 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3763.014; Sun, 17 Jan 2021
 20:10:25 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Small fuzzer-related changes
Date: Sun, 17 Jan 2021 15:10:12 -0500
Message-Id: <20210117201014.271610-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BLAPR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:208:32b::28) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BLAPR03CA0023.namprd03.prod.outlook.com (2603:10b6:208:32b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11 via Frontend
 Transport; Sun, 17 Jan 2021 20:10:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84125050-c903-4fb8-ac0e-08d8bb23ed0b
X-MS-TrafficTypeDiagnostic: SA2PR03MB5852:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB58524FA306553D3BB7917F52BAA50@SA2PR03MB5852.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HWFEvvklQhqEfaEQ+o+hOKmgi/DwpBOL4SGvoTADvtLfVpbNurgB+k95XC6vkQCtlh0eRHrzLaQWWGjzdy9Qwj5mU1UYxODuC1yG/+Cz/+TLCyI9sHOGimjC60i4PSK/JAnhljeW6MO8a5VFRCyZNcqpLEk/nwED7vocFpR5l7UKdGS/lEaLjpw3yX1K01m5LxE/KZbhifUWJY5NzufdIk1AzuqRR7pp0aAyEjdGfz4AK+3X+SrX8G8aiwWNA6mIywOe8H9k0WOp6E7LkicttkEKlIsH1Fx/iTemZ2BjOqjh4B8ybriKSPIW22DcbYY1BwyxuU+r/iG+TWk6TlHIOKfbBgeIgljM3350POo04HZE41WECGzgLDa/bDNB1x5wJrLVy89JdrWL0zqiLh1+GA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(396003)(39860400002)(346002)(52116002)(786003)(6506007)(6486002)(8936002)(186003)(26005)(16526019)(316002)(4744005)(1076003)(75432002)(2906002)(5660300002)(6916009)(6512007)(66476007)(66556008)(66946007)(86362001)(478600001)(36756003)(6666004)(956004)(4326008)(2616005)(8676002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QQldA62VPKX78owCeDRmeUwazfJHXyEAITV4Ywwhem5EsNpskI43dsUbOhng?=
 =?us-ascii?Q?938xVbfn5pXKoZv9GTkzKbQe4qT21wXxSzC3Utz/qPvJvR8vRcwTCWdqNFoq?=
 =?us-ascii?Q?uN4wNhiqrCMo6xHYt87khkmwz2/AU32hKWHtajXyhSq+pU1NJYah3w4gzwZi?=
 =?us-ascii?Q?yO99Vkm6Mz4t3Lw8g1eNQEJp7AX1HE7YVGxp5ZchxZt+A8tBNkeofPp+Asu0?=
 =?us-ascii?Q?InE0CytCKaLcLaVS7fDOVQsYmHC11GLV2o8Pvf9o2bsbXEjHOyohSwP3BxUN?=
 =?us-ascii?Q?s1yMfw3IB+4MOnVF+v4OHAMDgYBzS3qg2vrk5XaAaO1egrVl34Adrd5OeD6a?=
 =?us-ascii?Q?F5zF/MbpVgpZvIFlUPeAYMfoVtpYXTqrqhEn62AMuh2V5y2Ngv3GbLwiqVny?=
 =?us-ascii?Q?TptTs6Qk+kk2Eab8pcUGbtqUksQTglasA+OojE4MrnsakpsBD/hzHYmYjdVS?=
 =?us-ascii?Q?H2RLrUWOusD3Lr7KVF/0QKsiNS4ZXCp8CO07CSp0603N0I6+HZII3CQ4CJbA?=
 =?us-ascii?Q?Hqz8uIoAIl/E+21XboGHs5Bj7f9xB/TtGhJD/0WWoMAk3/ih92haE2bcyvni?=
 =?us-ascii?Q?80JNGHmvQQurjFTQDIATEpb534shcke85LVmoNyBitd3LKpNll02akN45YIo?=
 =?us-ascii?Q?kfFHTqj3L+S3Xv2kBMV0ecruw1ck/aNlJ8iL4hu6MUhfj+FSfgGgBCDMNE9d?=
 =?us-ascii?Q?k5MT3G76uBsgQEfSQN6PuaTy2DeVzgovaETOvEkdn76sumheniy9P465lcbN?=
 =?us-ascii?Q?NViDAdt7yxidLHh5WfpM2Qd6LBsQ+0da84By698lyoUIOEuMduVkx5zGq3Zc?=
 =?us-ascii?Q?CyiFKGjzwgNPMRqk/b3IO0iKcAtVHH7MlBfjecj71dJpia6Rsjwdnmf/lUAS?=
 =?us-ascii?Q?qJCf9RsMCCNHLz2aHQQwEv/cacqI54jv3Jdl9E4vgPL+5QbaZlzvy6QUhbiN?=
 =?us-ascii?Q?EVeHiWgwNvPUbQgN7Ty2fgZDy+ZgRbEXbI6jH+DSzJ2scPjBMnQP7mDa+1zH?=
 =?us-ascii?Q?TDfk?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 84125050-c903-4fb8-ac0e-08d8bb23ed0b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2021 20:10:25.1303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaruezOb7od5HpwNSpERVgwVwlCv/91GUM7USU2KdwR70/tb6GjgkWsHyF++gqs6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5852
Received-SPF: pass client-ip=40.107.244.102; envelope-from=alxndr@bu.edu;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix outdated paths in documentation and log some useful information.

Alexander Bulekov (2):
  docs/fuzz: fix pre-meson path
  fuzz: log the arguments used to initialize QEMU

 docs/devel/fuzzing.rst  |  5 ++---
 tests/qtest/fuzz/fuzz.c | 11 ++++++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.28.0


