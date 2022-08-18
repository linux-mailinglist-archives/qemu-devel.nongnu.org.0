Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5E959874A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:21:51 +0200 (CEST)
Received: from localhost ([::1]:53738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOhLC-0002e1-4w
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEn-0005na-Us; Thu, 18 Aug 2022 11:15:14 -0400
Received: from mail-vi1eur05on2109.outbound.protection.outlook.com
 ([40.107.21.109]:49772 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEl-00071E-0k; Thu, 18 Aug 2022 11:15:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VawVkkB9UCdlAYuNAv3w47rUXEaZoZkSy2W+XNqEEb8zEgYuz9aXkG0AmSHgU0OSrAgfy8WZr9MIp/4jNOurZyh1iVmAHEoH0s+oIoyxMVT7+yboKVNsghjrsCc462T8X2iOHPAG7uDs1R6ypvacgxM/3JqVx4CwAXeVxdeC8nu+IoBwCqehLBGyYd0eq3btjK03t3eh68BNkzhOwf8to9sm1o2MYEu0eymFQFnKmqrVK1kdcoQ3vcufkOYi3dt/hBQYW3cKhzwMUzpcp6oeoolh0y52oiPHh15IQsh1Ih6ZY7/Xbdw1GZjTyodJkDz+wfW9wkjRBic0Oh9xzbd4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6S1lTxN6dVF5TNRvhp0WeJi6Its5Ah+ZZ1RtNekFYCU=;
 b=KwvAo3sAObGIJJK0N6RU7XOAD2Z7GrAhQ7AlYpJErv7EIgBREYDTWRfpCPYXH5qFv1EAaNBCZA0w0VynO3gJUrdjXkGgOcv8M0hgfGcrFRBffOt9W9R87dakum+B/TnUAWyidxgWQ3YHm3DZnFatXYNnbB1mylhbTt2tt2nr7G37uGcd+5Wh5YxPZ01cxvFtCoTIB8NwH3zStC7iPDn6oLBKlVFgo6zEJ1/nthtfk/TBRk2GdQUx+503JqSFqRIlHwHrLZfhwEd0/sKjnhjV4ETkAFKlJ15cAQSZ3oKXWfDZXBnqLjwqLhVVuNPWMryCHo93fufkDMJM2IgkeckBMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S1lTxN6dVF5TNRvhp0WeJi6Its5Ah+ZZ1RtNekFYCU=;
 b=PjX89zgFnolXr/uEEwGV0tjYTogbT6iZQj9vOm3HEkxo7U5SgcSFADCm2kCIlKPYqz9WaqWi2jd9kmqWc1IvEwl3mQNSZa30KvDCS2I6P/z2uOqJxDavBLsTuq1wKnsCjKDCSsaf2nxKtk4CSXWO1VSpBCyktQFKNCFri2UxFhIe8vXs9qcH3vcjg9nUUWDrKAIfQkYkaMuMRCcuPSJ7BI93YcQUWI/kwRUrwh5d6lGOcT3aEjUvbqOUqcrNDWwsxBEXeSBh8IceAnk+AepxSCVl5q0iaFoVLipC9MGeUaB1AragjJTatlZp9hhHK+tMXw3yNEN/gFHyxnE4+5w5bA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM0PR08MB3715.eurprd08.prod.outlook.com (2603:10a6:208:10b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 15:15:05 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 15:15:05 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 0/9] parallels: Refactor the code of images checks and fix a
 bug
Date: Thu, 18 Aug 2022 17:14:47 +0200
Message-Id: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 176a18cf-acd5-4c81-580a-08da812c6e1d
X-MS-TrafficTypeDiagnostic: AM0PR08MB3715:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mObKH9azhlGefavWW7YUw4dh0ZQ6uwtZNp5qjVvT6UxxAiciLUt68KghwGQrFw7L4JoXrtkLHWeAs4iXQljdizL12AX9348A+KNX4zCdnoUQUZvBz3iByiG655YqF43ciVN1bBfE7TFWcnuBzdAeE5dame24SDnvip670D6TsdHEAhP61Km0zqH4g7Tejz1ySIXvIom1zKPXQ1FnI6f+EJYHrFMegyEvC2dcSJX7P8I6+HapBeSF2xeyh9ElPJ8PwmqGuMlCuXjH60DxinJXfr7Q1LFX7o4HjPuqQSieN8VE6hdFqDchd9yqJTIe7E3aoJUUgm9lBV14IgESIQ6/Jm363opTpRaOYJnhW/xQ1r4rCOkRnDQscYeAZMI907qVW0GQJSUTFrfvjOR2T0YhZvKuFHlsalhbxM7eyNzVF6BQNBXOSgXYGX/Segb4Z2y2yaq9asxjrgj71A3/kZ4mk5QfiZblvDUE1dvetKaiUmVj2gTnPe0twYoXUi2NIJjeDAvwIkBMM8rRInk2H4/eupyURoly98cymDH3qG//S5+eJPwYauy7Sj4QZXo36aSA8CauXIjEvBUZRRPLwTPtoOjjDH2EPhwrG/RkDfcIDOPxaWU78vLq14EmHOBJobvWZoE+pk2/MdNVw5z5xBUBKaQ9V//lo/i9ebILpKrt7EuzHqMy17j7PbGARtrYpHoTN//2a04Vos9g281HPW6gu/3eTTIUaVuRPNeDoMqYZK+6KYFLBvgRvCz5NrzL20Vv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(83380400001)(52116002)(6506007)(6512007)(26005)(2616005)(186003)(1076003)(38350700002)(38100700002)(66556008)(4326008)(8936002)(5660300002)(44832011)(8676002)(66476007)(66946007)(2906002)(6666004)(478600001)(6486002)(41300700001)(316002)(86362001)(6916009)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FYy+OqCTACU1SMG1xJoHOpBYIgEB6v8xR0S4tBFKYb6ijcEXmpNwOT2gNx9L?=
 =?us-ascii?Q?8lq79l0AGh4kA0lP2vcIEcnPqji+nlac4Le7JDpM0YroeUYfh+ECXGfNT/Fq?=
 =?us-ascii?Q?RqvSX+zuxczMZK+7zguEz9hOZHu1/2emDcKJecqtKOv1nQWtMLBBRmVPjvnX?=
 =?us-ascii?Q?2abOTey+cO+aheYOCjoQ9/fikb2PCHwqcZxmHP66/ZBqPDr9JynLTDdnN0By?=
 =?us-ascii?Q?JrvxkyQ/ljBsGGn8tySVlN0fPHqqOqEbVRfrTdW2dQaJIpt0VIExTx73XmCh?=
 =?us-ascii?Q?hvgDuyu97ThZx9u/n0WaZtyGZipsWTCzSxm8VBpvCrrb/sJNmTGDb4cnbuP+?=
 =?us-ascii?Q?FIwVG/yAYhAJcs35xzFSyo9d9CmAXONmt3qib+EU6QO9Ky4YOh1ljZ95fTRt?=
 =?us-ascii?Q?ixCStHC1V2W7ymRlb+rcLHWfjUGvz4y0PwhRdvoTqqfGdsY+orn/S6D82wPD?=
 =?us-ascii?Q?i29sEwbRWdwrSLPAxZ4aLoSdD19l2ow4ump4j93S/zIx5Tp986qY0XDMjkq0?=
 =?us-ascii?Q?0sQSHISp23f0zdRdJodBWD5hRTDF9yRbJyY/quLKLg1hvngAdms8ABUrfm6u?=
 =?us-ascii?Q?D+lW8dkhy+wbI7LEQ7y3mdPqypq6EhrSZHgVN/CplAhzIa0/s3G9J1baxnq2?=
 =?us-ascii?Q?K/Gg1S+2eN2Y8PB043d5GR/Bh2+2SRc31NoqZF5YTMh9wnVdxTZnFXE8pULd?=
 =?us-ascii?Q?5KzR8ez53ONq/TTpLKbZCLPyTqQToMcUvOSvwrTTlBI6k7zghvKhC+InD7yU?=
 =?us-ascii?Q?H1SjiQaco2YPWYIpf3BlF3+dL9SWVRT3ps9U2231mjvK4BU/42/ckPdcn+B4?=
 =?us-ascii?Q?2AAhAHd9qBBx0nGpUyFier34/5/vG65kgw4vh4gnmYySz2ngVr1HkBvdPiEE?=
 =?us-ascii?Q?CUtVcNQThHQsAg+O4fZNqdMwRWtYrK6mTGbjgnVIcKnZrDasFgjLaeQU7Gx7?=
 =?us-ascii?Q?GzsPeYb3QT5Vn2HmI1uW7E2FH+HdiBDJTaj0eJisISwDdBHBTSdigVn5JDIr?=
 =?us-ascii?Q?nO8SWJt+koYftDBOch0tYQd1tNMM4WPDMFVg40oDg2PIYGV2wcE1IeQO6czM?=
 =?us-ascii?Q?4B6P07Upmv/vgX5LQ6Ohs8bG7UnKXOtGOvOatA1Qd+Yk7hH+BZgEGibOViXN?=
 =?us-ascii?Q?6oYZBEYmUQFSk7og2Scax6VQu8N6yA0AzOZU5Nn9vQ6S/3r/9tydqxqnICzp?=
 =?us-ascii?Q?gn7iuTvBnLgzE1WTUuKFYrVo5bCZX6wjIhPv2dO/TG3b76gxTP16KcrGCrW1?=
 =?us-ascii?Q?T1MOgbXaWsx9ckNaCVLbkfhglFiACA4Ky/zOejq3DKLfVR4IQe4YK3t2ZBcp?=
 =?us-ascii?Q?GQ0F4zOEwDYHr3gKYba2LA3+EAyH6A//2mqIK9cwRx/Y2ZL+kN1CccTpumm/?=
 =?us-ascii?Q?WZ3P2Rh9nLFWn1djD3FpyuhWQ8d7Hlb820m8/tHLhP8uwhJiF5SW5nxcvF7h?=
 =?us-ascii?Q?WZCdC9wodSSRMSu0dXBz39ic4zfcxSNwGLZ/rFAuLQ3fhlmYVOn1TJwNjVeJ?=
 =?us-ascii?Q?2GclhOdWLF+URHvoIsg9ym1j2k81eCZbE0yEzqVcWgvcUSbXMtYsw1Pnc2i6?=
 =?us-ascii?Q?aPW76ZD90g4CYHeffh6APuphRX7QGq6XC5wlBOIyW9jJJOticjdaUP4/HdI/?=
 =?us-ascii?Q?GTFUDlxNReEGsV4gSmy3hi0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 176a18cf-acd5-4c81-580a-08da812c6e1d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 15:15:05.4040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJti4j9TFobud5F1XhTT+e1tXn5VoyQ/P5EIAmoI32ENQR/x/3v8B8mA8LRCFTK2copEh28otxRlQ3AXZ3e06Py87IntRELLa3axxfioWrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3715
Received-SPF: pass client-ip=40.107.21.109;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Fix image inflation when offset in BAT is out of image.

Replace whole BAT syncing by flushing only dirty blocks.

Move all the checks outside the main check function in
separate functions

Use WITH_QEMU_LOCK_GUARD for simplier code.

v4 changes:

  Move s->data_end fixing to parallels_co_check(). Split the check
  in parallels_open() and the fix in parallels_co_check() to two patches.

  Move offset convertation to parallels_set_bat_entry().

  Fix 'ret' rewriting by bdrv_co_flush() results.

  Keep 'i' as uint32_t.

Alexander Ivanov (9):
  parallels: Out of image offset in BAT leads to image inflation
  parallels: Fix data_end field value in parallels_co_check()
  parallels: create parallels_set_bat_entry_helper() to assign BAT value
  parallels: Use generic infrastructure for BAT writing in
    parallels_co_check()
  parallels: Move check of unclean image to a separate function
  parallels: Move check of cluster outside image to a separate function
  parallels: Move check of leaks to a separate function
  parallels: Move statistic collection to a separate function
  parallels: Replace qemu_co_mutex_lock by WITH_QEMU_LOCK_GUARD

 block/parallels.c | 197 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 141 insertions(+), 56 deletions(-)

-- 
2.34.1


