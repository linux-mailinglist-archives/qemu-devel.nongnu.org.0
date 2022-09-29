Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622DA5EF05B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 10:26:16 +0200 (CEST)
Received: from localhost ([::1]:49608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odos3-00015I-FW
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 04:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1odoQc-0002Du-SJ
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:57:55 -0400
Received: from mail-db3eur04on071f.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::71f]:35200
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1odoQb-0001ZM-1s
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:57:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqL3o8NBQmtgWykEdPtx9nIXsfNiQSurTw1/7lC+oCv5FWOGpbDNk5gQldj1n6MKgjbMd2M5Scu+XubX3SbGSw4HzSBTaRq0n93RLWXhi+IlTOSdHzCXKAvEaosGRb97xKaueo5ukmqrV8Q4hA9kpl7Wruoi6qUEia/fqE8G8W9+yAh+I2H76z4xKR8zZqGNg8VJRLqvc1lgHg7zMCYDHnr4dihKLaWdVpw5x/USunqw+wDGM8ybUnC9DapjQ/6EbrZLeupyZBlHHIDMI/atkuaS/W6HMNqju7db2FC/7Pv/UQSC4n9pv0d1qXrFoCTUQavebkC8tYc71X9hk0b4/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VL954Wj266dXjSItYIjXHJCDlAk62V3IAgRYyRi19qI=;
 b=MIlA+08c5RkcFHbliUFY77OHZaBmt8GCmY4NMFVaOLoRrzKgn/+jmpT40T6NPDb+7DMmjEjilnnBhjtZuznzpiBxMpJSZFueKjqSAOWI62SA/CAPJJodFjp2AO7Nt57eenbxJCH14Z2z/vu1op/fS44CoA0qaBNmjmnhtwjFuS0d+KjXLdycJUcEkfx6XQrGDjfJ+SYt/lebgn5oHkoKWmzfv9gNMMSKFRKQROAmT+AoxzYxs+40u+GSTmF2OZHLZYWNbQGRJ3/uEnhkeuFHpDwGjz+S80tWD5NhB2+lrnYXV3oXD73mGLx36mFWTGj8O64EolrnzGAM3uhwBK00mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VL954Wj266dXjSItYIjXHJCDlAk62V3IAgRYyRi19qI=;
 b=og9t9PcQ3pYMPS6DjK9n3WOwgKD2g2NOm8SvJ2ofeA1qRMOtGV9gKDlWpSNUFw/l4UOzYaRDVJu+Enz4GNKDReaPEh8Uy77kNB1RqiOLs9fLLmFjCmhAM6yoVj4usYmrizYOFMa4IhVYT0C51Jf+bFpZ4NF5pelic+eySvwZ0h5o/m2G6f86VF105yaDReckJH30Jnc+/bZGYLUskXVZK+UKjnZ6kwLm5MiwfdatH9XAkMxHyeICqQREfcC8/xobpEB+HOWa5qzIiEN1uDYtF8tk7ohaObdO7QIjAauLQGOX2J818yhRt2t3K+2aJY/xfyI+YI7p4nDFFyyzxkKFlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9509.eurprd08.prod.outlook.com (2603:10a6:10:44f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Thu, 29 Sep
 2022 07:52:46 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 07:52:46 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com,
	michael.roth@amd.com,
	kkostiuk@redhat.com
Subject: [PATCH v2 0/7] qga: Add FreeBSD support
Date: Thu, 29 Sep 2022 09:52:32 +0200
Message-Id: <20220929075239.1675374-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0039.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB9509:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb8e49d-0e09-443a-c895-08daa1ef98da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vc3G+hTgEnaTmGS2yEOOe4cq+CYr7IH7URLNza6EvWnJqjDlYqsInie+FREU5tXzPtc7V8uuk7cG/EQxpTXYJPJjT/23q5trt8e5KvsbGmAV+a6KG5YNOMwhmswO6iX8t1qvr1+i+8Dg+USV6wtIKyN8+SgX55u+RduOz67tiABXNVNCPiJt81p+RTW7pFv1LPyqEHjMDx7e4M4/CgBCC1GdomOTISIQbXhfsorUAIpfYLcHks3b92wqItTzE1gKC+1ItAcglrvx7zamMUaU1N9K3sEpp1t8V0N/o7VvHe56+hKfncXgUOx7Aul3FixJEoC+pcVPNldGGJJQwQeuqY/w62DqvC4YfBrndpaTG5gxPHFsnvRhriBVFvuI1kkCF4GxVSXWA5izz796khnSvzrJ2SQ694PzbR2UFFsXAOhsJ/g9V9JtqyhyCcgsf5dccXjmDPvrmE69MZfwD7rw/sBEPVclCjOjxafxPGR/jLzqUwSvunGl9Lnti7qaLHxZvzJ8HkqJ/enLI3mBRB9KrXhe3yDHbD8sP7qEEiF0j4RKBwtXayYz7QENyULW7FvYsTEiLmO67uCoYLNJuHjyS4nDhbhNb4B3TbLqXfQC/gkKJkqlNd/cPkZP81RGhanHS06zJorUfu+TrN/6X1PDeTAOVeTnatEmLnLsGmqopv9YnsAvBEDoeydzyTfVQ2bhYozL+/w/lDpR7jwik82fWjTCD2MX85qotGUglYNH6VArtQSRtPCmlU79aDUuybV6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(39850400004)(376002)(396003)(346002)(451199015)(2616005)(38100700002)(38350700002)(86362001)(6486002)(478600001)(8936002)(83380400001)(5660300002)(6506007)(26005)(6512007)(316002)(6666004)(2906002)(6916009)(41300700001)(8676002)(36756003)(52116002)(44832011)(186003)(66476007)(66556008)(66946007)(4326008)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CJe6rgTVxnLoU0oHbcT/uMWfgxeUsf5UHpH5dRHePTEIOa4bWR/qduHh5i+a?=
 =?us-ascii?Q?HqEaSqtse86pg/UAMfcM1By60lVx8/LDZohk1jo5Ss7I1YJPojg9xyYcQrUF?=
 =?us-ascii?Q?RxQTLFuXZzdqXQBOgQ0HTPKpIqn67p4/VMTqclpKYbqWmfZf7Z5+mNDLDiwR?=
 =?us-ascii?Q?p4Ck+G4UvEjk9yYuXmuHx88mIPz/3RpX2HHKGyqFb6Xe3b+ZSC9MjU4voEvc?=
 =?us-ascii?Q?S6R0VJbCVySnIp7xovj4uvGRlHjw6vbUlj9kWrRJ7+l1joJiILHn4H97/by3?=
 =?us-ascii?Q?GFr1IMUurwkK29pHtxTiE2F7I9GjuLZLK7x6RAt7y1gHIQeQVhSlNReUFprE?=
 =?us-ascii?Q?2kWCHwJU43zhvI3/kj+VpxWioilOEdSbuCsctYhYK+4fCy3dHDpuvAlHHU/F?=
 =?us-ascii?Q?B1lbgb78tWpbmC8kO8rkVhTzwQl46z6jdoHQ4Y6U35vCncpBSSJj1bzqi0k8?=
 =?us-ascii?Q?JrJmPqgdZ+3HHYgJ6iHvksIscPtwjpNTitVTaTLuucdhlfB4Ff00c1wpdVWX?=
 =?us-ascii?Q?ZtH+to+oe3w+Nlwnkb5GGx/0Wl7XvsRR/tWmvVucnFIUqeooNqtEzL1XOHu3?=
 =?us-ascii?Q?g+UtYqab1PEm6I6B3QRHHPG78gCF0LxdWlkTRjV1ZmU+rsbAn4fEJJCMZgK9?=
 =?us-ascii?Q?+9tXUIiGUNU1XC+F/D4XNJaWNP3tZ5/B5CVWhzmmZ+cSlzZ920+1EvD44FCW?=
 =?us-ascii?Q?/xw2IAZS3/6B72wAz/aMER4GjXNFHe9DKS01OAIHa2BeTd7NkS7+YOcRJYld?=
 =?us-ascii?Q?059x8BA+ykWbV/IcVyx0M2YS2ugc0o8VZLidhtY3UnM3Uj/vEFvCMczgHfjz?=
 =?us-ascii?Q?ZiuHFLjqU+vOeeFB8zzh6yMTsng4aWsU6psc9fxwptU+K2shs7/LPnrr2Kpu?=
 =?us-ascii?Q?SdlRe977fOWwJSebNYOovhSdh4p0QKucErZ5igamGVgAa57hb/GfxNOuuTBd?=
 =?us-ascii?Q?q2MNHQ4gIoJZ4g5hF9CXMjqenm09bjjlqZ7EQ9sHdNsIEqkEt3PTjVZLl1up?=
 =?us-ascii?Q?V4dWplSQghRbvqIuGHBcRtg9f+yBA8hwuOSqkIZqEOrzlxYpHJm7S2gR1i9J?=
 =?us-ascii?Q?vySyX6LmIJBwOpUxR3MX8LpNVS0x5m9TlL3kQtpdQwK3Egpxr6ZojuL7dB6N?=
 =?us-ascii?Q?yjJskgRfKjzg8eFlnMnoHDZ82wkrbjELldyq+Thgt26iGfFwHQ9Yn2w5T3MG?=
 =?us-ascii?Q?lhRaq8oHlvfd0+CB442ZOvXsryGoWhQ/XK/7p9sT8r/TdLzsare3VK15GYNd?=
 =?us-ascii?Q?xdIBnqg917RCh7tpimLgbW7DJj7IpjtGnnUhaFioFWVBV9Xn/HyfjcbJnv9R?=
 =?us-ascii?Q?56T/kY7scdzyNcI+PpWaUdkl40kIxr5e/t7VK7Shctcl62p5s+4nKETcW835?=
 =?us-ascii?Q?2+E95StslEXZlN5CpeW013eGJJCQVq4plctMHhXC+KOP+L7arfmyvwwOyri3?=
 =?us-ascii?Q?nYpn+urqOc21DRoP/+zPenJNkp/XuV9jL2PCTSqK3Sx2U89TvQhla2KsulEP?=
 =?us-ascii?Q?BNMa9sU0DkXK4W7C6SPGTmsaZ/EHuuP4Z0uZ6O0JLOp+MFbOQOn+wkGUdCfE?=
 =?us-ascii?Q?2oTm4bhNZcw54rg9vPBGxF1VVubcaiNcESrUQ26Tc+CBPGwJcucLXm20ZjQw?=
 =?us-ascii?Q?mQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb8e49d-0e09-443a-c895-08daa1ef98da
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 07:52:46.1501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43nlE6rw90AB2G7DYA9+H1fm4DENw7dVhKBseXmjDXxccYS+P1uYHWacR5ow5t5fVnfwtFoUDn5xmL2OBCiHCT4ipf+JGDrSN3XBknNub2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9509
Received-SPF: pass client-ip=2a01:111:f400:fe0c::71f;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add freeze/thaw, shutdown/halt/reboot and password setting support for
FreeBSD.

v2:
1: Reject the idea to move all the Linux-specific code to a separate file.
   First commit now adds initial support of FreeBSD. Fixed device paths
   and fixed virtio device initialization (disable echo). Add comment why
   we should disable the code under HAVE_GETIFADDRS in FreeBSD.
2: Replace the second commit (which now is the first) by moving
   Linux-specific freeze/thaw code to a separate file commands-linux.c.
3: Add error raising if stat() returns error. Replaced strcmp() calls by
   g_str_equal(). Add a comment explaining why UFSRESUME isn't necessary.
4: Replace #elifdef by #elif defined().
5: Now the code doesn't move from one file to aanother but still is
   moving inside file so the patch doesn't become easier to review. =(
   Fixed typos.
6,7: New patches. Add guest-network-get-interfaces command support.

Alexander Ivanov (7):
  qga: Add initial FreeBSD support
  qga: Move Linux-specific FS freeze/thaw code to a separate file
  qga: Add UFS freeze/thaw support for FreeBSD
  qga: Add shutdown/halt/reboot support for FreeBSD
  qga: Add support for user password setting in FreeBSD
  qga: Move HW address getting to a separate function
  qga: Add HW address getting for FreeBSD

 meson.build           |   2 +-
 qga/channel-posix.c   |  14 +
 qga/commands-bsd.c    | 193 ++++++++++
 qga/commands-common.h |  52 +++
 qga/commands-linux.c  | 286 ++++++++++++++
 qga/commands-posix.c  | 843 ++++++++++++++++--------------------------
 qga/main.c            |  13 +-
 qga/meson.build       |   6 +
 8 files changed, 867 insertions(+), 542 deletions(-)
 create mode 100644 qga/commands-bsd.c
 create mode 100644 qga/commands-linux.c

-- 
2.34.1


