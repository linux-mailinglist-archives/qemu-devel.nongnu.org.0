Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB83C5F2E85
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 11:53:21 +0200 (CEST)
Received: from localhost ([::1]:43740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofI8W-0000FI-PD
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 05:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ofI0C-0002jV-S2
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:44:44 -0400
Received: from mail-vi1eur04on0720.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::720]:39936
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ofHzx-00037S-So
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:44:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXjufbWktJrQlIzQXEDrCBDqlWQTB/iF1y38P6TJ6PkXkA2tlDVaQ3kDWXZignU6qmTTzc3g/kr5tt7jCJPXC2IuOZeEQWXXTlYHjV/jnO7itYC+IAhv7KzeRaVSlNlQRtNOuoEOf3cnrxL2uKFGLJnvMNj3P2dZereWiw+zH2ujqlhEzSsqHTTG9Ra5Anr6IVNECnEiGLWXhb4XxZzDA0LhS8UV2vtS17EO9CGSaMXzQKT1a54T+Z2z6CjRCujgJWT4Gq7bPhmjzuRTL3M3125s29hApcW0ep1iz5nAtSmMnYgXR1aZ1XuLkB3O1rixL3w901UdeaDiUVNjhTioWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wbQv9yT1R98RJKvjbCzDkzZTeysbvBj08a5ZMEBRyQ=;
 b=cFmyUsKpAgkLWTdTWm8H1ioaSNhC4BDV7GgHaVRfA62qJ5xnuhKBqsJFoMO/3PiRw5WOd1GAL3ZXOPp7a2Ee/pEXFEJdolq1MWWbXaW4SRwMYJ3LFiSJD94tzCcFxKxORQAgEb8WmDFZ4Sxs8yKEEpTqrW1FwVBZdLLIaAla/VP5Ahk3Ea+MMrg+/xj8awLK/TP4uI6O6bG+POvcsiW80UlIAMIGcX2Zxxc9sySlR/ICyHeDVOkqbgsd9+nPlT9xovR3Za0mbKo/mrsvhMZ7SxlGos1LRp7f3+OxvN9dZKbz4Bsg+reUAECdiUGHIEXbyPznZozZutqGTpdRg8Vucw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wbQv9yT1R98RJKvjbCzDkzZTeysbvBj08a5ZMEBRyQ=;
 b=m351HJ5vJZq7pkG5uyL4vHpVyl06lCejNFhFGAIb8PH+qUBszV1fzODDajevY3PCxqCF2OsCbBvM+Xbd4KlqR/BwjeMNEkzlL2VBasDVMRAkXzpw3ZbWskMBzrSecgGtM+99+FDSY5M+JEChFNl95WXxBw3q491XU4tvqkvYSS10wgN102hvru5Ef8G0IJ+gxICTlrPUQG9fFelUkzEOEbPPB6Yo11z+BkUma6Zw1osPmfA86gs6CreNzsuq8pktcDqgbd2kJfMReY2pC/JFho2WzbzSnlDGzPLl80ANkeI97djZ2qCJ+Eoxp2NJ2qc71ddlW1OuHvmMzfEXcz3qmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB8203.eurprd08.prod.outlook.com (2603:10a6:10:39e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Mon, 3 Oct
 2022 09:39:20 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 09:39:20 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v3 0/7] qga: Add FreeBSD support
Date: Mon,  3 Oct 2022 11:39:04 +0200
Message-Id: <20221003093911.1844031-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB9PR08MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 0821718a-d7a4-4ad8-0d5f-08daa52325b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ajTyUZkGFp+0JzbgjbUSCSmhZ3EEIbwEbcI4+f9ztAZDClLA4iZJjmjCO6giMZbeWBvvAY/8+KZvUab4tXMGXZeD+7+hun/c+DXZbq/Vaz6TO84Wys8Z3JFP4qy/bQrJx359PYeLA2Kw0m0QGAlS0VMQyTKItiw1xg7JD6/e09ZF+89WTcgKXuGgNbsOuTpMWRr4NdWE62f0t2KyWbV53UBtifVbRf4j8qT4g7tg1L3qRjcwIztL/G95WVU7/PPzend4w3YzpHcdUVP08ZLUyshiVvcvFQAbV/4oigQ0HPpIgmf8OCcUHpWEdetTUl2wSqympBHF2tr2LvcfknounpCTKvroZldg2p41GZYYz05Rv/33vV6wfEV3omkiK4uRb/eiqWH0smhsAwHrk1UUjnekwahkxnrm6Bpra2ddSf711+Y7UI5kV9EPoEOU9Ddu2Oc6CpsOUitwTyA7DyIt1Yy5LJydVfe1KycYEoUmef/AHx6mmf1WOti53GWOB73bOmwktsIYGGAkAQpFkaZR8sNyP2ikZwmmiz+so3ttWmEq3+OLlrozjyXeo/AESdveOJhc1lvYGMJZ0o2xI+qMuXztKESoHhIg1XQXstQ9OrShdAKrp3j9VPFkk+42N7Fj4cpnZILINwXTgWmylArizA0F26seIYgadI08Y1wD4v0cG68PI2FVbVivf82C6OfS3BAspGt6mI5aoDm6P0yLZ9nMWbNhjk+ko0N6XV9Tc0yXS9GocMcjFQLZ09Yy6j008XOvu90Ri5ZGFb1G3HAfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(346002)(39850400004)(376002)(396003)(451199015)(6666004)(316002)(66476007)(66556008)(26005)(4326008)(8676002)(6512007)(6506007)(52116002)(2616005)(6916009)(478600001)(6486002)(66946007)(36756003)(38350700002)(38100700002)(86362001)(186003)(83380400001)(1076003)(44832011)(41300700001)(8936002)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWNEMVJBK3pkUFNnNkE5SndZbGltV0RUQzBxV3BPSmV6d2pRZVFtbEdmZXRi?=
 =?utf-8?B?RjBaNlZSLzFwNzBVcDNrcE1qMVpFZmZ2SnRLTURTSjFLVmh5ckJWN1oycnYx?=
 =?utf-8?B?ZGRHSU82Tkg1WjlabytrRkJxVm1QSmZDdmlJbXJaNitJOS9nQmNURmUwVXFR?=
 =?utf-8?B?eDZoTWwycVFnYitIb1Vob3ZGZWlhRjRBaUNtZHFaL0xHWlU0OW9nc1VxUnVM?=
 =?utf-8?B?VHJMQndERlhESmYwbkpHV1NURjJUNHN6TlJ3M29EZ1ZyMFpUdnFuVWVBZEJ0?=
 =?utf-8?B?ZkxRUXZzdFNnZnR6azdjVmg2OXJHUllMWU1LL1R3Q1BJbVZyQXNNdU9WMW1U?=
 =?utf-8?B?MnJEVkxvQm1pYjZVNE0xbVMvMk96Q0dMZkxVWmFUcmkrY1FFU0Zpd3d6dkxz?=
 =?utf-8?B?VjhwMzQ1QmE5S0UrRURGOXFWbVRMYUdObVgzQUlRYTNrSUc1bThkQWVaUlg3?=
 =?utf-8?B?REJad1RlMFdMTEtUOU1qcTF0QU4vaUtFRHlieVNKN3FmOG5uS1NWekNQL3pt?=
 =?utf-8?B?cE1VQzJHYkNHWk5Va01vQkxYSmtjTUNTZERXY2V6My8zcEFJWUJYd0RJL1lU?=
 =?utf-8?B?bzE5NFUrcDh4NXAwNEhLdzF1QWZxOC9DU0I4SU1ZTzIvSGFMMktGd0toQUVY?=
 =?utf-8?B?QjNLK1c4dUhqUjI3UEhpY2dyZjJxSkpCcGk1WjdxVVBrQlR4OWxyRmlEdzIw?=
 =?utf-8?B?dkxnVDdmeUJHQjh1R0xvNFJKd1JHUDZWQWNBeE9acHdUK2RqNnhDYVZXUWUz?=
 =?utf-8?B?dDgwcTJEKzBqd0dCTStQUU82N0t6bG1CUzhmS1JUQVlOcW1mb1JpN2gwUFA4?=
 =?utf-8?B?ZVBtdzQwOGJsZnJnNi9uWjJLd2VvNXNtNVZFU0J3N0dwVFU1Y2tSZ1A0emRC?=
 =?utf-8?B?RzFRNWZxUER6ZXpPYnNIRWo2dFdTME5hZHlhY256clZtQWxwcDNhNUJNTVNt?=
 =?utf-8?B?dWhRSFlkM1Zkam9Fa3Y3MHBXQTFHL1lRNjNoclZ2aUwzeXY2WGc4QlBoR2w4?=
 =?utf-8?B?MHBaUUh0M0REQ2lscUFWbGJTaFVVZTNLcWxabWdkSHNvbDJ6RVdGYkhUTzRS?=
 =?utf-8?B?UzkxSENSUXBQN3FvaWUzYUxhdGJqNklRQnBkYS9KQ09WNjMrMHoxaFRCSFh1?=
 =?utf-8?B?ZnJtMkt2M0RpalR4ak8wMkdHQlhaSmFPTU5OaGExek5FbTQxRTJKaldKSVVl?=
 =?utf-8?B?dlVNWkxRdFJsdm80VFdaR2VNWmlFUXVMQU1RelBIcVJwS3RZOWVSWGZyT2pI?=
 =?utf-8?B?UWIyM1djcllNWkwvejhnWS9rTDd0ZlZRTmlLOXFpUGpXMWVvV3FMd3A5SUFH?=
 =?utf-8?B?WnNBQU9RMUpZZGY2eVdjMEJCcmE1RXhPdHFXak1lOENwUnQ5clhnd1dwS1Rm?=
 =?utf-8?B?M0JlNjN1a01qdlBvR2FQWHU0OExyWDdMMjlPeTBOYktabmh5MnUxUUxBWjVD?=
 =?utf-8?B?SWUzZHNHWkhZTTgxbXNpdyt3a2k5L0Voa3l6UjB2bTNJblZjcWEwd0dHVW1k?=
 =?utf-8?B?cjFaYkRkdHBFMUxtN0lIampvclpWZEl2MU8vOXNDZ2tFemdNK1NMSnlaYmls?=
 =?utf-8?B?cm91RG5icXVtU0lGUElCZjhUOUQvV2hMeDVHa01oZ01DTHRPc1lsSFpsK0xL?=
 =?utf-8?B?N0kvTTNEYUQ3cEcxb1Z3ZmV1WnFSQU9TRHZhUFFjVTIxd0hLSTErZTFOVE9i?=
 =?utf-8?B?UWxKeWVEb1lQOVRkbnpNdnFCSnhZN2d1RVZGYXZUaWVJSnNmSnlTZldXdWNL?=
 =?utf-8?B?dVc4U3JVTm9zTGRNOGc3aHhodzVBdUNYZGEwWjZQTUNFeWpma3IzcjNNTzFp?=
 =?utf-8?B?cUJ0R3ppN2RSRVo0cGl1eVp6SWlKT2NkdUEyd0lLS1VrK2cra0c1dThRaHMw?=
 =?utf-8?B?VW8xY3IxMy9zY2NlLzZ0aGhGZ29UQ0xrTVNiUTFEajZrNEVjQ2JzZFNBZ3R1?=
 =?utf-8?B?SG5tSGRBREJGMkJZR3FGeGRXaDZHV1pENFpTNkROaUYvR3ZoaEdZMjROV2lW?=
 =?utf-8?B?KzlLY1VJZ1BTTGJNeVhhSzY1K1RpRi85U1lOTGQxTGNGcnlmeFREWWIvengz?=
 =?utf-8?B?V0ZhbVByUUdkMlY5L1lBZ2xEVTlFSmdVTm9LSXEyZVRySSsvb0sycysxcFJ4?=
 =?utf-8?B?ZHhadSt1bmNaWVFtYWhpZ3dVMVdSRWZCcHlMNU9XVmpaYVZoM01qTytRNDlu?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0821718a-d7a4-4ad8-0d5f-08daa52325b6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 09:39:20.2878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nHySP3/tbp/QruZ5uesBXhRjlu+42FPiWI1hTn3XLtocqHldPmxGn0ykrNmdkFghdOXE22AQmwBkTGqdkFKIfJh+ImBGxwyua1N6lQbDsLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8203
Received-SPF: pass client-ip=2a01:111:f400:fe0e::720;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

Add freeze/thaw, shutdown/halt/reboot, password setting and
guest-network-get-interfaces command support for FreeBSD.

v3:
1: Add a comment about echo suppressing.
5: Replace code moving by splitting the code into a few blocks under
   architecture conditions.
5,6: Move actions with dumb qmp_guest_set_user_password() to
     the appropriate patch.
6: Fix error/obtained return.

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
 qga/channel-posix.c   |  19 ++
 qga/commands-bsd.c    | 199 +++++++++++++
 qga/commands-common.h |  52 ++++
 qga/commands-linux.c  | 286 +++++++++++++++++++
 qga/commands-posix.c  | 643 ++++++++++++++----------------------------
 qga/main.c            |  13 +-
 qga/meson.build       |   6 +
 8 files changed, 781 insertions(+), 439 deletions(-)
 create mode 100644 qga/commands-bsd.c
 create mode 100644 qga/commands-linux.c

-- 
2.34.1


