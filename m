Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79006678E4
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:18:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFz5h-0003om-NT; Thu, 12 Jan 2023 10:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pFz5f-0003nV-PM; Thu, 12 Jan 2023 10:02:03 -0500
Received: from mail-dbaeur03on2097.outbound.protection.outlook.com
 ([40.107.104.97] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pFz5d-0007HH-PO; Thu, 12 Jan 2023 10:02:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TI0ghQr7rvDkG2pZ5zzGXgPI34ZbPBWN29onAybGbTSkAMcvHVudxfNF4/VvHwxlz3L9LIwftdFeQZAAQL5lp3iLtT2QO939HnBJ6IxbO9D/sxFYkXvxKx7NLR2du0UgsrQWeYBMI7lC/BawLdj1Jv2394yKv54SCoFZodfr8cD8ZoNevdigKW1qc3EQHZVUgWu9V5BMrSAcm+wLqwke2jF6pV2GajX4mZMPmEDb9csPRSxhf1DD1qX04N6cBgKBDzrUa9P8dzkCkUlgc8auSZLe+tt4sn3sARe7mw9UPXdwdai6kXEcWT5lyWY9PkSyYXLfH/ttMMaXkmJkKoD3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y73y9wil9zVvUyNwIV85LbqkOYp7As8UabNRGrr6M9o=;
 b=P6vDT4vPQITr/lgpsVdsHBIwuRV1spE/+aqeboUWrXT2e48JxlzOBofYynr2g3RQ8AIOROfAXrVJVafa2JOm7ek0LI9vqWuCPmEhylJH5Y6a3GZip0qefINagGw2Iuathl6DxcT/JDNLanpmMeg7l+Mcno5osMPYu1NpXC8yzjdRNIV2XEVSqPpXnsFbr2qcDxL7f9/G5aHkX3VLInJnYmVZkmpLe0ku1w90JabhAIGRO/fuAUU15n/9X8FYc2jKHTFhDuolKwzGSV7+Xrlgh8i+6PWFx1zcpO4/nz9vQ6Er2KF2TJT7SAsz7X4Uw+HfoGSXAzRRMQQxm/6crPspig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y73y9wil9zVvUyNwIV85LbqkOYp7As8UabNRGrr6M9o=;
 b=TeVG4L+7C01DwfdlQ2OJa5nZ1oQyxARzPBFf5MnGixT3JbbzSutKDnHb9clKwJbUNlEyLkp2eCcYV6g8Zy6cEHVWKi8/qNdFLxkOebJF934vCWOLRJoRf/rfc/I/Eee5AbVI57EX4ADPxtB1RWR92lcFzXRg0TShcfPL8Bmd0yENu3H34SW9eruqCsmc3W5aXXn2p9q8prkweiaNjGxdPRbiu6MuMHyeOAURY90VdI4g81ZtBAb/EnO3LLo2/gQBNDswxQ9IcBeC7PXE4d4qQvWaJzio+FBXtsepDo2W4RMmf1WH02rv4KQlPSu3hCqjAEn8++YtZgu7LWcKrAyuHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9250.eurprd08.prod.outlook.com (2603:10a6:10:419::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 15:01:56 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 15:01:56 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v2 0/5] parallels: Add duplication check, repair at open,
 fix bugs
Date: Thu, 12 Jan 2023 16:01:44 +0100
Message-Id: <20230112150149.1452033-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0701CA0035.eurprd07.prod.outlook.com
 (2603:10a6:800:90::21) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: ca600be7-0faf-4f29-9277-08daf4adf26a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c0KK4O6kWSfwjQq00dynTUFeYzQVXufKC8cyh0CPbTjqPZJBFRTG5DyFAeUaSF7LIEr2wMK3sFH6BUr4KHIgR8Lj/YKNmq1zcYVbIwpyFyA7/yhOt4ZsnuhbGn/z3PKMfF2xWEMigiawOQ4JbMMDxXZuthe9dGx4BsoWgpEnc9Aj7ToAjTMU/OG/AFpVVHte86V+bRe7x4MCM9mtX5UuC+lnweH0IgAqhuVR6hEvrxgI63gFuJJm5moBAyO+nzoAeozhw7t6FtVK9OjmAXD0BgDpzq765f9G11cYF2HBwDI/IqJC1S513pJhvlK8VngoG9/K+3Fw2Bd3J/p5Q920VgdGP4Y34JMQepS9dsCsr3PqJ/nt5E5PMpWuQFh0gOegHevq4dOirat4wa+yBd/8HeuKhlrigzM2fHlI1zr2sMcqNwgAB9sjYVTLp9TbTYMyaFeZxxqUQHzZz4MpQbaZDSAhXBwB/Ph0z3shiu6VHgmkKNap6AmYQIWz1193LrExlUJsHDAZJpueX1NeZ3qVBtV4oFyFMZKjoTWVu+vMBb5twXOPjLrHS6higy18IRpNwjX/aq9/Be6qc8SD/7pbVtgiy8YN5CCFEUgOh0mfTqwO05E2PxvCixmOXYG5bq8hICZQKpGb6ye53Ie/kY5h+yFGCRYaPFutDz090m5fdeqrd2CXhU8yIZCnPdp6a0uLXdkxxW9LMpCuYxb61l/X4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(366004)(346002)(136003)(376002)(396003)(451199015)(36756003)(5660300002)(86362001)(6486002)(316002)(6506007)(52116002)(6916009)(44832011)(2906002)(6666004)(478600001)(66946007)(66476007)(66556008)(8676002)(41300700001)(4326008)(8936002)(38100700002)(6512007)(38350700002)(2616005)(1076003)(26005)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7wVbVg9dDB9ISe1Al9XqtyZBjx/ayW7tEktaZkfNf6b86Zki4DlgbNncCiks?=
 =?us-ascii?Q?j/RI9d/7/snARJwZVvCv2dEFCkd4lBFL9mMb5z681+LKclZD16ieOpKot7aN?=
 =?us-ascii?Q?ShNaS8N6J/8r9yJKIy+OtzKTYy0Px1Y/iFjOA/YuJf+DyEiNXxvOgjl/pgEG?=
 =?us-ascii?Q?YuIx1R4eQ1dTmUvbZvndw8FE4ZeXWysdyADeD5cevsT16fweXnaDtFDE3UJS?=
 =?us-ascii?Q?bhM9pYB7Xd3Bi73SEOQVPJGKT2QIA+8wtnt52HDVNNWEzkBWQJnAqL88Ue7v?=
 =?us-ascii?Q?RSSddj48H5WeSwf+P0/1t/SHMjx0qiZkGpveopv5RrMmzjpCbWYhFYBh25PV?=
 =?us-ascii?Q?AktIQioW9nRjRYMFf8VF7MsHpxPUAGGgyx05lmD+K8VezleHe4qym4lgFlTm?=
 =?us-ascii?Q?8nJXE0anGioPrAFu2lP4+Kr+1KI4b5gVNuM4fP6VwFXuUYwreTfnnX1w5Q22?=
 =?us-ascii?Q?nDpors7Z31gfSdp1tmnnw3QJ8BFeQdOX+CHYat4kFhNLT5YqrdsOcM6AgN4+?=
 =?us-ascii?Q?snHY0dRfxZsmMAm6q9CXixa0+NfnTC2HmwFBxLf77ktTv3JsGnxV+XtsqCEf?=
 =?us-ascii?Q?XtaILxMENO2j9fNwRihTDLwg+OK9EHm68F2ft7aWgMusdsE8FEzayxNNZF32?=
 =?us-ascii?Q?nV5cTXsZ5mNAtEczyew225hW1ZIWZbkYvwYnli1/PUNIrTUKXk1C7uzQAnCd?=
 =?us-ascii?Q?V770qwqU21gXxPBk3OV0kbQ2yaeYVGWDDtdbXIQ6eTnlM87CHa9LZUeKC7eh?=
 =?us-ascii?Q?HUVYWncCbgM9pqDEo2H1V3+TLJ2AUMbmIf9rb3JUaA/ojaU6McWbbO30qtGm?=
 =?us-ascii?Q?FHdxLakpc7G2bAtfM8dPJYlF2jsC3yqndu7eoT0Q5CgzQAaxoFqxBSpijKtw?=
 =?us-ascii?Q?i7/Hss9REZ0zOw3TWHm5J7AgNp2VRJWuBCFwQ03Dc0Gm6oVVaOfNNL7ZpCBr?=
 =?us-ascii?Q?+PQmJzii/6Rsh8kjR401B7xSUAgsTE7OZvlxnIAd4p2wm5Dns4avxquKGOFT?=
 =?us-ascii?Q?zLdMSA8FRRP+YtUVn6/3LOtEnko1vrwZASgpBC9+6/OWa+hBfUDW8D7DuRjd?=
 =?us-ascii?Q?Ugsf6iHi9yvxyX4xGb8l4SSoE7AdwyZNxMZ7WfxHIqfIQNUs3lfYhBIMIM4+?=
 =?us-ascii?Q?Q0Z6eKYtKWMzHE5RIgDdFzGcj+Y1TxwWpQHztnBQcoisQeGdWhx46zzdcydI?=
 =?us-ascii?Q?3PTjDvE7IhbaAahxSY3vu0I6EC7veAUqZ6o+tyZZRz7wnqvz62D7EUB6KMVx?=
 =?us-ascii?Q?c6B7xm+lDEnuEq2jbCTUvjr1hl4T/kC9AGM7r+Xj09DXx9w5nj0KTUnJMinU?=
 =?us-ascii?Q?aunjMjtOYrDyZRP6bB9lMkxH+PRVtRmvgABts72MyUPKL5adEIZjui8gR9Mf?=
 =?us-ascii?Q?68rDEiDE865qx/xpRGpQZxJR7bOA0xO0CRAyuCk6PCZRoVbXeKFbka0sMZU8?=
 =?us-ascii?Q?a28vUTtBdshRpEc4cTJ7QqUXWPX79Hne+VVEYrVW5WP/eYoZLAfSRleIQjjf?=
 =?us-ascii?Q?6WghT/hGk3vxuSkEdjaMShyaTqyhtkCSuuC9POVN193GZRRCm9Om1wpuXdr6?=
 =?us-ascii?Q?+QnePCkOia+0rQNe9+ObyztHg5uZSzj/O0GJkc/LnCRurf8wZs+HFczHqhsz?=
 =?us-ascii?Q?OffLb1iM0eKrUGA0ttwvOiY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca600be7-0faf-4f29-9277-08daf4adf26a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 15:01:56.1342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QggkE63/O8OX0RxsZ0wznOREcUkzgz+ZubvFs55Q3QiFcCjf8GUbqCItAakJGrb6WwI1snW1sXpdSHh7ZercsAGT8gi/Z/aNW1mnz9WTp9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9250
Received-SPF: pass client-ip=40.107.104.97;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix incorrect data end calculation in parallels_open().

Split image leak handling to separate check and fix helpers.

Add checking and repairing duplicate offsets in BAT

Replace fprintf() by qemu_log().

Image repairing in parallels_open().

v2:
2: Moved outsude parallels_check_leak() 2 helpers:
   parallels_get_leak_size() and parallels_fix_leak().
   
3: Used highest_offset() helper in parallels_check_leak(). Fixed a typo.
   Added comments. Replaced g_malloc() call by qemu_memalign(). Replaced
   bdrv_pread() call by bdrv_co_pread(). Got rid of keeping bytes and
   sectors in the same variable. Added setting the bitmap of the used
   clusters for a new allocated cluster if it isn't out of the bitmap.
   Moved the leak fix to the end of all the checks. Removed a dependence
   on image format for the duplicate check.
   
4 (old): Merged this patch to the previous.
4 (former 5): Fixed formatting.
5 (former 6): Fixed comments. Added O_INACTIVE check in the condition.
              Replaced inuse detection by header_unclean checking.
              Replaced playing with corutines by bdrv_check() usage.

Alexander Ivanov (5):
  parallels: Incorrect data end calculation in parallels_open()
  parallels: Split image leak handling to separate check and fix helpers
  parallels: Add checking and repairing duplicate offsets in BAT
  parallels: Replace fprintf by qemu_log in check
  parallels: Image repairing in parallels_open()

 block/parallels.c | 321 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 247 insertions(+), 74 deletions(-)

-- 
2.34.1


