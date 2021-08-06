Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A5A3E31CB
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:31:23 +0200 (CEST)
Received: from localhost ([::1]:50278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8N8-0006lR-GP
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC86G-0000QP-Cf
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:56 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:3170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC86D-0004Vo-W0
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:56 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MBWWq018324; Fri, 6 Aug 2021 22:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=L+oepirhFKnW2hA5F+wQIflOnajOhhxOYl14RZdUlJY=;
 b=HofGySrqSuu9qS+p3UFH3z3fV/J/RYDg4LV2ZTgVIiMdtZ8nryIdeYpsx7RTbc1EU1ld
 z6j6siE8TY5FD1zfMP8TBYp31fzyjLfaF7Yn1jHPMIgHfECM6MHFs8+7yJnztqdriavE
 woWUx4Dcq0KGb93DxUSQAeKnHr0nWWXegVcPL/x+1i/KoL9QWXeNDHxkwS2aGzSdClwI
 ZMcYxgakqVPJDVZyD3p+uSOIHLQS6Iq+pWjFSlK8AvHXIBsZ44vw04qG+DwWOIIjW/eL
 rcYmKMs1awbFiymguaOKQRo6Hnt3ICkeApk+HKvRnnRTRf748iRD3FtXyyBekQbYbUrG Mg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=L+oepirhFKnW2hA5F+wQIflOnajOhhxOYl14RZdUlJY=;
 b=EIfhiJT3EzJMaeDpwO0hhDk1rmKw2JLaToozgVKDjSfbnOfLU2cgfErs2NsBA9pwIbj5
 5lLEHMUGtMKrdAYcfU8z+Bq0foSqkq75IRu7P2cEBxhXhUbithVHH0w14EvPdocJmivx
 3rIT7eggc4m8fzBmP/1pFJT3bja5JLlsOLsDOdBYogc4F+jbq0UdRooakPLmV/4/l4B2
 TWlkvh5rvSBAvI1xWzBP13hJ5vuSf6M3A8dPBlAfGMLV/Q7pQVriWsHd4j3uQZdnB1wJ
 PA1iwbcsCYiUr8LvjTGlmYOyD5sZyDyoaLMLm3epY6uMEWCDsGnYfCs54DCJuKvM8z3h HA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a9645s135-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:46 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MACfm083094;
 Fri, 6 Aug 2021 22:13:45 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by aserp3020.oracle.com with ESMTP id 3a7r4cayc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBxTrXLJHHUiPLfoqVMnLpq6WNFTkp8hk3kwt+Zx10blMK5WucZHh4YW6tNoZdvuGxojw/OH40eForfBROher1zz9cu9clgQ+yRGodT8j4LVRYT51yIqN3x53lWX18HmaW8t3zOHYU3lOB1eM/Fvqdc0m968JfwfG7n3cnCS4VkHmtFIUDFR4JllIH6kJKXZm+gWAxiaf/LNYDHbsfdgHDU/g5ncmiHjnmj3k2cfoqxV8gK0SVfziugq7+E6WPG4wwfuAri58Y92s4Hrve4lAZMcFu+9rHMwGBLv6x3eVfQYW5H6U6Tf49hY0vAax4s1bFNWaxgTWSIi182DZaqAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+oepirhFKnW2hA5F+wQIflOnajOhhxOYl14RZdUlJY=;
 b=UPk91/eX1iGxIKqfSF7pr3Ad4xKDINpQUVOEbyPUxm7WE0WEW5vFsZPY1PCeFMFGv0VjqLzpCwJaLvRN+3I0a5XJa7WEvT0Kiji00FlN1GnpJziHIR9iXJSt7ySVa6Be9XQ4uIXGWrd1clrRORwHxD8iS6MPiLBV/ZI3JaWOq2y/EKSqemFZ6s0oNzInN3CwKcP7jVXqIfpG4hTawkdoGIiNlPToaFake7JdODJDr96YtFENAw/pQ0gLYcju34Y7JCgiltEOMbwDjuxMGXaBz2jEY214CHVJV+K1T/MecJtMcGvkC3w/o1/QYU2noSH4gamJcG5HguU7HYMwFQKGUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+oepirhFKnW2hA5F+wQIflOnajOhhxOYl14RZdUlJY=;
 b=tGobPU01m508cU0qRQ2Sw0O7/ynm7DWZUKrZJq1I2tS6meytL/zLxsNVksmhaS8QP3O03yjjWRJXWsoocKVeZdrBhPx65j2ylOBWwa1XW9dK+IboJOoGCuldUYGTQ0c0tFbd+ha4kTwevSyyS03iws+F7/Y9ItQz/EX0Vn/QJ+s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:13:43 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:43 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 27/27] cpr: only-cpr-capable option
Date: Fri,  6 Aug 2021 14:44:01 -0700
Message-Id: <1628286241-217457-28-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:20::7) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.7) by
 SA9PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:20::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71f93dc7-a7d9-40f6-d058-08d959277408
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB473445AF2F19EF8A52A343FFF9F39@SJ0PR10MB4734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SZO1V5QMiQP/bSO425lxZVU74jxy60Zld/JgfJ9VX6T2g5U9zZ48SdKM0s2geMusVWgjvOUAvSlQX+J/Uk0YL/ZceZDKGUq5Ro8syA9tB7TYl0kayREZFukOM7gURgUr47G+esxZa6b8rAgCiHYOpeIf0xzmPf3IdHMTJm/KU912sN4FiPCzo8O8bjX1ovqJchCyE1GlQ0eKyG85KBOWueYiEJZIpTXmuedde1Ll9NDqwLrHf22+Ib/rTD4zMVw3p8KXgMfgqVe7gwmC3GEjZc7XHY4X35EStDe3VoWJQkF5ApzV555bmzTa5+sgNZFXCBrl5uXV2C4zRsY50a6iCSCiw9QwpxN2anIdDe8BMq+YVy2kyVj89/cI+00zCvuNQq+1G8fDzvgPVRdR8T9sC5zRqFh4TPOFz86q77Xx/EriHjWlPKp6lmnTo4pgbnOo6utw1mI2ihRxsq+5q5uWMR0K57jElAHGfeIbLnjbuh3oaneGzYd6CECtFnSdAh5nu7Q5CG8ZPx2bb3UGsNXoGT1FpAxXics83RKeWmvBNnIhADRPdy0QwDN65BOcubJYxRi9bWbX6vkBFwcdbvzCEQPKqLWB/94Klgi8/uQU/59SHR3Pfy89kSnSDiqNW0Q7dheKgmVMXLnze1rdNZia4MG/rCCRThBiuhl4Vkdm72fi81tczz+3T7TDS6C0dIEGXElVOcE7pR9e7p/RUS+Hug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(136003)(366004)(346002)(66946007)(107886003)(66476007)(8936002)(86362001)(316002)(83380400001)(54906003)(8676002)(66556008)(4326008)(36756003)(956004)(6666004)(26005)(186003)(2616005)(478600001)(7416002)(6916009)(5660300002)(2906002)(52116002)(7696005)(38100700002)(38350700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JNdIIzSW64kLJqZ6AGTj9L2dQs+EUJjYZXnQoP6stnG+Uh/JrZ1k/Z8IfROx?=
 =?us-ascii?Q?a0E0bhRS/AsUO6dMdSa5VRCn16zjOMPJko3EofEmBd/oYgFYkDCyC7SGxjIH?=
 =?us-ascii?Q?Lgbj0eiwVaezScBmvEH9jZbc4sPHtXM8+hE9mGZKgYgITYoNXiFJwV1dUNHm?=
 =?us-ascii?Q?NSJJSZTxv/txbTKcg/E7DJe4ETOD6aBjEeGSdvSwOerRS6fUAViMi4UfPZGR?=
 =?us-ascii?Q?9H9jRW3LaIJs7t5ThJj7ju8+BJ184L5EQCOeJa83sk9r6RnswaySFp5BuVUo?=
 =?us-ascii?Q?3j+jkRmE8BONX4vXFeYzhAZkPi60TvkbyK98w/rkn9p4s+cQzwvVRTIMsedS?=
 =?us-ascii?Q?xfBrDlgj+87CETeo7Fmat8KBcirM9MheHY1FIf3lMOPgEHRJ5lxZxzyi1G5B?=
 =?us-ascii?Q?c4IUGSH6a61+Tcfjrv54/eIA82gZ2R3hcveSFWX4JvdlME4PyqnEdr1SBsw+?=
 =?us-ascii?Q?AQcT820b4GyO+MEnQeoeqgEgJgE4XuXrxsEa0ID+A5ICkSFSYcK81OfMMMn0?=
 =?us-ascii?Q?ibc2XfZi2Nqhs4f0Fzdi0hoPgYB55fgQh0Lxpc3SdQm4SgYqQUsqBr8zsN+K?=
 =?us-ascii?Q?2eJV6KME44a1QFUQJWBrpxvci94aX9v9TYHjnSA6bv+xrMPBYf8LyMNf3mJr?=
 =?us-ascii?Q?7mO0ys/lZtkxxIaO5m9yql5hoxKVfa8CyZR1j6D90XTXpcEJdD35hxIbBsEs?=
 =?us-ascii?Q?wsuxdPik7pTLKovqbOzrTXX5BNM2QG46WzPBQlslzhNEMAMSCTaYo7nY2gRD?=
 =?us-ascii?Q?0LxZfEjo9mK51FUiUAat/HNpOsrEAmPQWONnNaCDPnyxWyeKguS7/h2Aclfb?=
 =?us-ascii?Q?ZMx5xYoGjHbyayV+b15eV0ExXd4QaidjIfcGdVRCXuhHPrUk+byH4UC+Ng2p?=
 =?us-ascii?Q?5qpxPp4Qezfj9mtX3N9HRlV5Bo1C9Wd1yCkAJ4P45yvy7bRjKN36oP2OYQGX?=
 =?us-ascii?Q?bzc0+b78Hm9crFiH797Pu58krLhDjtM57pL9s2T64N/o9WcSEIB90nc6qtoE?=
 =?us-ascii?Q?I7UYa6S5iD1y3dFrRCAXDupNbzjmmFaDQLZh4N/y+H6sqjPgZ4TFqQPQLWwh?=
 =?us-ascii?Q?Ybi7s6tRRVNYCyWFe1bPN5nnyWU3ioe8mQBfiYDnK3OW6Sr/SqluImySH0Eo?=
 =?us-ascii?Q?Oxu42nbI45CNIPYda2xj7XO5gcAbGqUanZgRUGvYc5KKOIvs6J4jNQOAWQPx?=
 =?us-ascii?Q?gezlQc3vpJQ37XhI1qOf9ChBIS1oNMmmqLxvD16qVgq5qOcrzkjQU7x9k5ve?=
 =?us-ascii?Q?tWNs8kB0BQ9iEDTUydFj4p/mmTziPjUr0nl5Dj1nfIkilnYoDaYVtkUZpSjD?=
 =?us-ascii?Q?Zu+dmH1IRD6jHWPbvHvwoScN?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f93dc7-a7d9-40f6-d058-08d959277408
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:43.6506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ErPOUPJokgoE8cyCaUXMoO0HQdzOmfluHhMmfyEdCQUCXR83BdLT2ZKx3GIveNoXg6a8sjh5SPQkKkM3HRS8NAhwgPY6Z1wBKEPbqZyTJJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-ORIG-GUID: GQTL-wbgAfAqh99xJ86Mr1s6a49bxVO7
X-Proofpoint-GUID: GQTL-wbgAfAqh99xJ86Mr1s6a49bxVO7
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the only-cpr-capable option, which causes qemu to exit with an error
if any devices that are not capable of cpr are added.  This guarantees that
a cpr-exec operation will not fail with an unsupported device error.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS             |  1 +
 chardev/char-socket.c   |  4 ++++
 hw/vfio/common.c        |  6 ++++++
 include/sysemu/sysemu.h |  1 +
 migration/migration.c   |  5 +++++
 qemu-options.hx         |  8 ++++++++
 softmmu/globals.c       |  1 +
 softmmu/physmem.c       |  5 +++++
 softmmu/vl.c            | 14 +++++++++++++-
 stubs/cpr.c             |  3 +++
 stubs/meson.build       |  1 +
 11 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 stubs/cpr.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3132965..1cc0f73 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2910,6 +2910,7 @@ F: migration/cpr.c
 F: qapi/cpr.json
 F: migration/cpr-state.c
 F: stubs/cpr-state.c
+F: stubs/cpr.c
 
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index f6d00d8..a6ffb93 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -39,6 +39,7 @@
 
 #include "chardev/char-io.h"
 #include "qom/object.h"
+#include "sysemu/sysemu.h"
 
 /***********************************************************/
 /* TCP Net console */
@@ -1463,6 +1464,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
 
     if (!s->tls_creds && !s->is_websock) {
         qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
+    } else if (only_cpr_capable) {
+        error_setg(errp, "error: socket %s is not cpr capable due to %s option",
+                   chr->label, (s->tls_creds ? "TLS" : "websocket"));
     }
 
     /* be isn't opened until we get a connection */
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 872a1ac..2f8f982 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -38,6 +38,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
+#include "sysemu/sysemu.h"
 #include "trace.h"
 #include "qapi/error.h"
 #include "migration/migration.h"
@@ -1859,12 +1860,17 @@ static void vfio_put_address_space(VFIOAddressSpace *space)
 static int vfio_get_iommu_type(VFIOContainer *container,
                                Error **errp)
 {
+    ERRP_GUARD();
     int iommu_types[] = { VFIO_TYPE1v2_IOMMU, VFIO_TYPE1_IOMMU,
                           VFIO_SPAPR_TCE_v2_IOMMU, VFIO_SPAPR_TCE_IOMMU };
     int i;
 
     for (i = 0; i < ARRAY_SIZE(iommu_types); i++) {
         if (ioctl(container->fd, VFIO_CHECK_EXTENSION, iommu_types[i])) {
+            if (only_cpr_capable && !vfio_is_cpr_capable(container, errp)) {
+                error_prepend(errp, "only-cpr-capable is specified: ");
+                return -EINVAL;
+            }
             return iommu_types[i];
         }
     }
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 8fae667..6241c20 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -9,6 +9,7 @@
 /* vl.c */
 
 extern int only_migratable;
+extern bool only_cpr_capable;
 extern const char *qemu_name;
 extern QemuUUID qemu_uuid;
 extern bool qemu_uuid_set;
diff --git a/migration/migration.c b/migration/migration.c
index 041b845..3556f01 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1249,6 +1249,11 @@ static bool migrate_caps_check(bool *cap_list,
         }
     }
 
+    if (cap_list[MIGRATION_CAPABILITY_X_COLO] && only_cpr_capable) {
+        error_setg(errp, "x-colo is not compatible with -only-cpr-capable");
+        return false;
+    }
+
     return true;
 }
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 3f0c974..c47af4c 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4374,6 +4374,14 @@ SRST
     an unmigratable state.
 ERST
 
+DEF("only-cpr-capable", 0, QEMU_OPTION_only_cpr_capable, \
+    "-only-cpr-capable    allow only cpr capable devices\n", QEMU_ARCH_ALL)
+SRST
+``-only-cpr-capable``
+    Only allow cpr capable devices, which guarantees that cpr-save and
+    cpr-exec will not fail with an unsupported device error.
+ERST
+
 DEF("nodefaults", 0, QEMU_OPTION_nodefaults, \
     "-nodefaults     don't create default devices\n", QEMU_ARCH_ALL)
 SRST
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 7d0fc81..a18fd8d 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -59,6 +59,7 @@ int boot_menu;
 bool boot_strict;
 uint8_t *boot_splash_filedata;
 int only_migratable; /* turn it off unless user states otherwise */
+bool only_cpr_capable;
 int icount_align_option;
 
 /* The bytes in qemu_uuid are in the order specified by RFC4122, _not_ in the
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 2e14314..8db8a6d 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -47,6 +47,7 @@
 #include "sysemu/dma.h"
 #include "sysemu/hostmem.h"
 #include "sysemu/hw_accel.h"
+#include "sysemu/sysemu.h"
 #include "sysemu/xen-mapcache.h"
 #include "trace/trace-root.h"
 
@@ -2006,6 +2007,10 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
                 addr = file_ram_alloc(new_block, maxlen, mfd,
                                       false, false, 0, errp);
                 trace_anon_memfd_alloc(name, maxlen, addr, mfd);
+            } else if (only_cpr_capable) {
+                error_setg(errp,
+                    "only-cpr-capable requires -machine memfd-alloc=on");
+                return;
             } else {
                 addr = qemu_anon_ram_alloc(maxlen, &mr->align,
                                            shared, noreserve);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 924e8f9..7c638d8 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2695,6 +2695,10 @@ void qmp_x_exit_preconfig(Error **errp)
     qemu_create_cli_devices();
     qemu_machine_creation_done();
 
+    if (only_cpr_capable && !qemu_chr_is_cpr_capable(errp)) {
+        ;    /* not reached due to error_fatal */
+    }
+
     if (loadvm) {
         Error *local_err = NULL;
         if (!load_snapshot(loadvm, NULL, false, NULL, &local_err)) {
@@ -2704,7 +2708,12 @@ void qmp_x_exit_preconfig(Error **errp)
         }
     }
     if (replay_mode != REPLAY_MODE_NONE) {
-        replay_vmstate_init();
+        if (only_cpr_capable) {
+            error_setg(errp, "replay is not compatible with -only-cpr-capable");
+            /* not reached due to error_fatal */
+        } else {
+            replay_vmstate_init();
+        }
     }
 
     if (incoming) {
@@ -3446,6 +3455,9 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_only_migratable:
                 only_migratable = 1;
                 break;
+            case QEMU_OPTION_only_cpr_capable:
+                only_cpr_capable = true;
+                break;
             case QEMU_OPTION_nodefaults:
                 has_defaults = 0;
                 break;
diff --git a/stubs/cpr.c b/stubs/cpr.c
new file mode 100644
index 0000000..aaa189e
--- /dev/null
+++ b/stubs/cpr.c
@@ -0,0 +1,3 @@
+#include "qemu/osdep.h"
+
+bool only_cpr_capable;
diff --git a/stubs/meson.build b/stubs/meson.build
index 2748508..dd9e51f 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -5,6 +5,7 @@ stub_ss.add(files('blk-exp-close-all.c'))
 stub_ss.add(files('blockdev-close-all-bdrv-states.c'))
 stub_ss.add(files('change-state-handler.c'))
 stub_ss.add(files('cmos.c'))
+stub_ss.add(files('cpr.c'))
 stub_ss.add(files('cpr-state.c'))
 stub_ss.add(files('cpu-get-clock.c'))
 stub_ss.add(files('cpus-get-virtual-clock.c'))
-- 
1.8.3.1


