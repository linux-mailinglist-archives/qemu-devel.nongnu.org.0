Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77845A46FF
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 12:19:30 +0200 (CEST)
Received: from localhost ([::1]:59894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSbrd-0006hd-QN
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 06:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblJ-0000vb-Q6; Mon, 29 Aug 2022 06:12:57 -0400
Received: from mail-eopbgr80130.outbound.protection.outlook.com
 ([40.107.8.130]:50395 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblH-0005zs-NB; Mon, 29 Aug 2022 06:12:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9eaD1xT2HqCIoFl8EgLBvYEbRYi9roj0upHHb17Z0zEPYv7lMXW0WbaWEL26qAFOk+3QeYlmPOrQvPhEIJzte8RSrp3ollaRCIeN0XB68WZiFe5bbUEJH0jBESnp1uVtgVoPdIqN510ZwxlcbswgmQclY3r76Caqwqj7Qt4xIrsmKCkEE9zXcJoJrqYpXu7S3OgD6QAmOqiCPdg7+HW6rF+SdEnb4SLr45marH43sy47WHBi21Ozu2uYd+w76Jn2yrbNH8Oy34cZuNyjPY+jJVZrfR3qWxQU4/rOQ5Y1mSP9yL3LqOCpBemDRlvYDrvPMWhbdGGuIUIZXjeZNYU1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KSrxDFN+fa/v1QRi0jo46kMNdbIp+n6A8d+BlkNpMo=;
 b=K6R4rOpBNq52pY9Z0PSmylbTqs3Hb8/zbTPK9t1fgTqQqguG0CjmzKWlZfoqIbYXXi59KyAMXtQW8JkQw9px/J3TIpQLsyvYQSQeyOyNgt6MW/7mh3pJ67dS2PO9hOBjp7GSDElueo2PVXNfaiA8HeRGEqwwCLHxD4Eb6d2GqyjutXSGI6sUMN+lXusOLa1w1TeFmMygr2j9e+L77FMHkYxh7lCi8pPQDFW24v3r63TQD87JCGud0B09bakPun95tKx9rAfO7N1/Z1Os9/FLyQPpRNzMeb07sCARrSUl/gPT4VdI2G7E4ICuaWS0Cw3v04k/4OnWWZOHWMB/y0D8NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KSrxDFN+fa/v1QRi0jo46kMNdbIp+n6A8d+BlkNpMo=;
 b=Kdw8JJHRvLFAB7gUsXVaE5EyBNO+sXDgEhEmlooG/KL4uHpEtz+QPhfBZBog7ZiY9uyP1WVujQe/gkk6OOVuFW4kp+VVVCOuye0NFRHjjC/KrAfyNtPAsW6zoniXfh6iqJive1KIlXmzAbCnP+uXeb71KLipJcs24SUKUaZ92UrOyk50i87nRXNqEwOsFnf/nJ9cZmf5BiC5sJ1BpEQ15H8OGEf/6XL5oTa3SNf4ugtOz/n10YuVuqAd6EuI8pAyi35u/0OOPqnPgrEu+yd94v3tpiYKB58Wg9ojfgNjlwHWrMJe02o4bt50TKMvXzqU+KPhdinisIXXLqJ4sHo8Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB3023.eurprd08.prod.outlook.com (2603:10a6:803:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 10:12:53 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:12:53 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 00/10] parallels: Refactor the code of images checks and
 fix a bug
Date: Mon, 29 Aug 2022 12:12:35 +0200
Message-Id: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35db675b-9692-466c-5ad5-08da89a708ef
X-MS-TrafficTypeDiagnostic: VI1PR08MB3023:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gT9wuKhoaNCWx5tY6pGQZOuqZK0R2lOfX1LGY3M046IAWqvPKX7tAWlGpUAh+Acxd/MFEFoynri0Wo2M9tXNxp72RQK7PPq0KmV62FN67C2oz0/NY4CwkeV4j0+n4D7dwtpSkIxIji6+uYkGesnyu90dKQ7kM0HWdMoOJGYp1/CpO5dIar8uKbv2K9y249FP7T7VTMOG2rRj8SK21HubMbbP4fqZtPIyktYLywLMZsDLByllOcmCQu5/9DkvPZWl08nCEXfEXZY2yKw253zvfu1hPtowfGHfEEeC1xrKmh96LKfbgs21zjrvz0udMCX7jo0FSM34bwpg/bDYMaopPUWcQ95DH0cKXC7g3WRuEEDc7H//8vNFsbWCroVx8y9mtyCEtea+vlfY0pva9EhfEspsD8HMMtnjPeAczaQiP55q6ulK+dbt68lhb8U7/j8eKNFeinJ6IHTPCDhnfuId9Ko+npFlSj3Jm4Ba7AqGIXJmHAW8gBNHEBUWrmQo9R74a0YNCPU2H09SIVY/Sz8H0GRzLyopIjhm0/bb7qbJdolQpVKK4no3zd0iHK+uRXetzXTc4Pf81eaHYt49NIq4JtZQTW+h+tyuw8JCs7sgea2W1hqoP0CBQGQTe30YddajFn5Rnf/FSJ0eNTR8jXqUfyt9Jcj8+R9iKBNGTLc3ZBZKnnhhXoasLHCJ7aNbGpkUUkR7eyu5S68KBqJygD0Nm0jsXqZhIV0GhDWttYu8swNPg17hH8vCtRd7zV++nfMI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(39840400004)(346002)(136003)(376002)(83380400001)(86362001)(1076003)(186003)(2616005)(38350700002)(44832011)(38100700002)(5660300002)(36756003)(66946007)(4326008)(8676002)(66476007)(66556008)(8936002)(2906002)(6666004)(478600001)(41300700001)(6486002)(6512007)(6506007)(52116002)(26005)(316002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dBLs3wHfQZ22QDYqBNOACXDeiehOiTSBUEl8yQItsq6BXou90+e266QYZuPz?=
 =?us-ascii?Q?ovVmJuXB+uBA2734+v1TRDZZkqux24NQu3qwbMX+TM4i3Q6QT2Gr6RCOKKJj?=
 =?us-ascii?Q?GkpR1FBe6qt9Gk0nimEHPUP+PTIj2H2vUqfNxA7ReB8EETbEy+UXQ7hckbsN?=
 =?us-ascii?Q?KV3GKPB/vYhSWoDiBSkCLQuArxn7rxaibm94GJe/YrFM3Vt0El251WICI9yj?=
 =?us-ascii?Q?XRK37SONC0C5LzUJ3vSWOcVVh3deVaR/AZek2WvnNzQ2mJI1pcy5mx7fNHOM?=
 =?us-ascii?Q?P3mzbFy4gPiH4rrXhwIZcijfp1TfJLk3r2N8Sl5fQhhRw189sbXcPJOKDHnB?=
 =?us-ascii?Q?WEDlwU8ZLWrdDksORQAXXwGV2liz+Lq0G2y14rh/gJF0YyaPO6Wh5mLwPu1I?=
 =?us-ascii?Q?+eKRkBiIjevrpJoH/HYILZlQ/IgSBxxn/SasCyfYc3Gfaiga+IXYnH8r8xY7?=
 =?us-ascii?Q?Y/un48+mCUY4yz2KRz6+eqfRenvzKQ/9QTfyYosKK036JA2aRYlfVs/HE6nb?=
 =?us-ascii?Q?G8/eITD9rL1efgEdxjhuvdtZthiuH2pDekWFhe4G7ibp5sUN9CopOu3Eacep?=
 =?us-ascii?Q?HmaibVJ6EizC+eQEwlvX4lWveYlFQFVpmB62ND8ngCdebINbv4VEK0qHxcc+?=
 =?us-ascii?Q?KGt4kHR/5RmBr14Dv5XbfbC7boEucYezNQ2SYG452BXIEPlAc5UKehxvOyzD?=
 =?us-ascii?Q?wJiGiMG1f/r9KVCsp2VfKARBKS6mSl4u4Nr0NWmzuVmCUOHg+uBPnAF2oqu9?=
 =?us-ascii?Q?XWSvrkWm9luNbbkfR+ufQ/YH09PAIYVSH35yNW9DCHIGltLtnB2M4norgSsc?=
 =?us-ascii?Q?6CUfdaodvC83FJcJ+37ip7B2XOAg2eMya8kI3oF1eXlFG55DvI/FUWkmORis?=
 =?us-ascii?Q?cfU1CeJa/Mw3h5EaWiuVEk5vs/UJkqPa8ovRqCDXLSmVaRdNlqDR1wRnb9iz?=
 =?us-ascii?Q?RfFmr79R5MXa+pn5RmmCxkMRxuRLoilzteGmYETKBnMXn1Ibf/7MtobJwbsq?=
 =?us-ascii?Q?aD4FDL3HJgqdrsBBoDctgs9JKV3aEIVzsqUyb2Oy3Tflplx+nuVwQx9XMErY?=
 =?us-ascii?Q?5zXhJkemnJX2XG92CvQ+9aLK/wLsTsBQ8Wvy1yYXyANn4f1Z3cJHUeVWdC4c?=
 =?us-ascii?Q?8AKr01rahZRI5ebJuxW1mWcUAitLSOPrfJ4luKKRwxN1q0UXZiEeVrPfe0FS?=
 =?us-ascii?Q?MctCqUeI/w6IWNR3etE1YP3sTmmrspGLAKhHqaJnmZZvgxjSyDryOcgQvO5O?=
 =?us-ascii?Q?ITFHDGkJs2xJR8Om+pAVyw0kyzI2SNZNv9Vvt0i4t2BPMqpE0tS+r1IeFYtn?=
 =?us-ascii?Q?pr14H2CQJewqI7lQWlLrc/Jgu5ARV9weJ+N6wBxvIiA2SMJfbqcl1M+s/ZON?=
 =?us-ascii?Q?NsgE/t3/ly3zw/khPso9u1UfD1cZAlxy6aK7hqFc1F03/TrQFNLARYGk5BR/?=
 =?us-ascii?Q?V/S6ZxT4hoLkJftm6gK9dQrgY4wP+1RLbq+kefgideBv5S19zj6DjKQMhFlT?=
 =?us-ascii?Q?AAm5Q9JD5d1q4C3NI3TNCQN1T960A5Rkw8RhheLzYeo4dsJKi4OpXBOUUR5K?=
 =?us-ascii?Q?fewqzkxHMf00zOhy9xsdHBEPtPxMvRJrrlQia5ueKYeZt3b4EcQdxOS4sKjD?=
 =?us-ascii?Q?H3Ubyt+/agtnuN7z1Xqqu2E=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35db675b-9692-466c-5ad5-08da89a708ef
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 10:12:53.0043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Y5X57+jsGH8bcSX96SYa88jO1NudbUba3pUbXZ2SVYgzV1yX4buk3Dr8aolWS6GVlIplwtbPpmyHCvX6ilKLs27LZcM2nWC18ae7C6ytgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3023
Received-SPF: pass client-ip=40.107.8.130;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

v7:
1,2: Fix string lengths in the commit messages.
3: Fix a typo in the commit message.

v6:
1: Move the error check inside the loop. Move file size getting
   to the function beginning. Skip out-of-image offsets.
2: A new patch - don't let high_off be more than the end of the last cluster.
3: Set data_end without any condition.
7: Move data_end setting to parallels_check_outside_image().
8: Remove s->data_end setting from parallels_check_leak().
   Fix 'i' type.

v5:
2: Change the way of data_end fixing.
6,7: Move data_end check to parallels_check_leak().

v4:
1: Move s->data_end fix to parallels_co_check(). Split the check
   in parallels_open() and the fix in parallels_co_check() to two patches.
2: A new patch - a part of the patch 1.
   Add a fix for data_end to parallels_co_check().
3: Move offset convertation to parallels_set_bat_entry().
4: Fix 'ret' rewriting by bdrv_co_flush() results.
7: Keep 'i' as uint32_t.

v3:

1-8: Fix commit message.

v2:

2: A new patch - a part of the splitted patch 2.
3: Patch order was changed so the replacement is done in parallels_co_check.
   Now we use a helper to set BAT entry and mark the block dirty.
4: Revert the condition with s->header_unclean.
5: Move unrelated helper parallels_set_bat_entry creation to a separate patch.
7: Move fragmentation counting code to this function too.
8: Fix an incorrect usage of WITH_QEMU_LOCK_GUARD.


Alexander Ivanov (10):
  parallels: Out of image offset in BAT leads to image inflation
  parallels: Fix high_off calculation in parallels_co_check()
  parallels: Fix data_end after out-of-image check
  parallels: create parallels_set_bat_entry_helper() to assign BAT value
  parallels: Use generic infrastructure for BAT writing in
    parallels_co_check()
  parallels: Move check of unclean image to a separate function
  parallels: Move check of cluster outside image to a separate function
  parallels: Move check of leaks to a separate function
  parallels: Move statistic collection to a separate function
  parallels: Replace qemu_co_mutex_lock by WITH_QEMU_LOCK_GUARD

 block/parallels.c | 193 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 138 insertions(+), 55 deletions(-)

-- 
2.34.1


