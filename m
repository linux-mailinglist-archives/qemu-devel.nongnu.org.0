Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A22324DAF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:13:47 +0100 (CET)
Received: from localhost ([::1]:34436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDeU-00019C-9H
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFDc8-0006jk-27; Thu, 25 Feb 2021 05:11:20 -0500
Received: from mail-eopbgr10128.outbound.protection.outlook.com
 ([40.107.1.128]:44612 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFDc6-0006il-Bg; Thu, 25 Feb 2021 05:11:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/fMqWVx/EapTTfWWAyiI6I43vun87n4h3EqGwIjs6sICAtYG3dfkKRz3aCSOJc5FSTVr+VBbtMtrHp8YFz3BXyvwzZMJ6t6F1jTHMTdgAUnESGax4mr/RGFif3jSp9s/288osVz0oifhzZJuG3jP1r8oitJoNSBZAagmbJ+XirZ2FwFaTnsXGQ+Uo8KHz1zi+m4YrdkZO9wM8ufjV90cjZk3IOQ7gNVsjEYB72UcYJWVMtFccB1mTd1VFbRIiPr0ZhwPNwgFdCp0InaSBvy5LvV35Bustpc/5iQqOw/9OI9bGDoTecK6i9fAC7rwBKNctg8+Dt3KTw5Wn4/h0nSkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPO2wPxvAslmGAsrw/vRtLntiJ3NY6+IxFeMbn0c+Dg=;
 b=dSTMh0O8GK5KKXiKM54HQClh3j2rOQxygaoM+QpfvHFjXWFT3WV6PdYHB9g7LIzIEkfOMEhj4ZZJevl2mjbXKt4ep7c6iSdbrIu+/mAANyWjgvy5sO5gXKx/etBimprY0RHjBiEWg4c30AHjY/LXSzHK9C9GkZThFUkiDsWtKgx6QuTOo8527XV8hsQhHLhATp4p5n8Yt+Dy+OI8BtTxMok9lU4CqNm4MfVY6qXtE1h8ccffDahWd4YtlZ7fC7PdKMSfaCCJd/BOOJ5Ob1CgSKsjzc+OjCh4VMyMfgrnYpUNBZ0FR+inIewXawYLJ6odlv0aG4CiSMFhVKZVLQFBXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPO2wPxvAslmGAsrw/vRtLntiJ3NY6+IxFeMbn0c+Dg=;
 b=C6XbOLDjMHCYZrLg8I7YYnOVAb9nC74uYQ8sgLETK1R91ePfVSgraz5mprZsE0HY/q0UP5tORWqedW8CFZxABJspyR6zmndbht+80pq5iiaISv1qJp0D4Vng7XLVyyG2BpJoj9n6bxAykLfSxOagoQAQzZtWcTH4SA+vKX2OTRo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5381.eurprd08.prod.outlook.com (2603:10a6:20b:105::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 25 Feb
 2021 10:11:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 10:11:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: [PATCH v1 0/2] qcow2: fix parallel rewrite and discard
Date: Thu, 25 Feb 2021 13:10:37 +0300
Message-Id: <20210225101039.165730-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1PR0301CA0004.eurprd03.prod.outlook.com
 (2603:10a6:3:76::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.253) by
 HE1PR0301CA0004.eurprd03.prod.outlook.com (2603:10a6:3:76::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 10:11:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c76ee0a-dd57-4c53-edbd-08d8d975a9ef
X-MS-TrafficTypeDiagnostic: AM7PR08MB5381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5381845CF26B2B7908BD9672C19E9@AM7PR08MB5381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B5tUMYJKaIiyUTNPxe9u63xSTUs4FXye8RGXDB6rZnwT6RtfAnuqEaw/KdXQwck2DGiGnbhEyG12Nk3AfV3EP9KUEsTY1WdmkvrOPns6sOYkD4/qh0RsN2kvuQ+gq2xCiW7XrfuDJ3+DlEDOG5iJG57n6sMDiM/z8ukaExt31VH5DBVT98baEnXpNJ8EBsU4E7SqOjL+MkQyc6ovBqmzeq4YikNjdjOUswyV2Tu3DaJxARbLaMA28M2wDaEHlxMOGXZ98cNML4uXICyK8T0tNuUgUuDOJdeuxZZR6AsL48KTdttVAjuluv9mBNDP8eeYe/les231LsgtaR/9A8MY7uXfTA+CiGksUQfrE1iuFSKTbhYFx0W3a604PfJK4ekW7HneFTNB7+YO6kByIO3IY1/V/xxDptM61/x0MDIbqis+2ANqhIEg0G+fU3zTdbYsnuNkm89fIZBZckjTyAU/kzFe3pvk8pM0b769sVgHj7bh5QUBqCFXnnxXnXlfem/vTF9LgZKeV96e6ncjtSsCbkIda2UtR6kfmBdrDv+FXun6/ttfYN0fofAvxnUp5oDfF9Hac6/K0QtFHGHABrNyNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39830400003)(376002)(136003)(8936002)(186003)(86362001)(107886003)(956004)(52116002)(8676002)(6486002)(5660300002)(1076003)(83380400001)(478600001)(2616005)(16526019)(66946007)(316002)(66476007)(26005)(6916009)(66556008)(6666004)(6506007)(69590400012)(2906002)(36756003)(6512007)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?n5Y/eTlqhaj0xGZOUSlVc3iw+WRP93CUhSrjwQ5KNrqEWjos+CE5DuUXPtmS?=
 =?us-ascii?Q?/s9BwZ4ZANQmAb34eKPiB836K8KwT9truIGOyLvvYm5lW+8QfyU3X1o1vl8e?=
 =?us-ascii?Q?k6vQ9E5WtmilgHo3p9WoPiwXRJkC2jIPxuaH9QKS/0nVGHps7X5djNZa+B2s?=
 =?us-ascii?Q?U74XNUobxzqVRwmaovJHI8DL7KEdC+JXwcKC1rujU3hpge3cuty9wRiyxDli?=
 =?us-ascii?Q?AT7dcsf1BdE50CTqQCU1EiCafAo7mHJHNiQoly8af2sk2oU6BRrl8tC9etoK?=
 =?us-ascii?Q?sdOilQ3bbJCQWCrMUErjXXfoRW+7mqmgnOaTkUGF0EY/ObYEVlc4Ux2GmsOR?=
 =?us-ascii?Q?z6DDfwwmjp2kNGX1++hu+xQRpqgcjf7YM8naWMCsqe4MYKRVK6Q1+o7L8MrW?=
 =?us-ascii?Q?gvmpvzwbwXqaqvl0kZJF+gXclboHZqbMfDoqkdXy8zF5ZxraMduYbvRN95GE?=
 =?us-ascii?Q?5cxP/WEy77hM/qPaGjLPzNlDWMcMi0Eec/JhNpMAQh1fbb8DK7GgSbTyytS4?=
 =?us-ascii?Q?ZM6PiOLy4brid5VJ/1lznQQkP5G3Un4wGASYls6heQvxkrpd1lVX42Bbcuuz?=
 =?us-ascii?Q?n/3TqMKzq9v4u8x4MuRL6O6wOdxX2JC7B3rq/GdGxgZF4tCOUcouhw3iMavX?=
 =?us-ascii?Q?LYjPYIfbzKVFGN2IyKOc8FRb3SPBck/5HB3GvZZY070qDVtRWTDaSX3qnzJY?=
 =?us-ascii?Q?nSTX9o1AZXhMqzPtUTrV56eUfb9kkLce0Bnl1RD3LvFKrZ7hLdcqw3GaC27f?=
 =?us-ascii?Q?4kZj0hHgYWn7SqFlaVHYJXds5ObrHNfGKxDHj8usB8+3Mer+YAZb6Uv98S0T?=
 =?us-ascii?Q?Mg1Vh+SM5W7oQS/9o7IB8R0FvFDA80GaoXRGUEXJjR5Mi5RXqcz9WzxiV07F?=
 =?us-ascii?Q?F2uPwxsArWJaNuvWBYhz64zJC9lgNCZR3ufxFfabjpGzcDogMFtmspwPCu0y?=
 =?us-ascii?Q?2n/ZFc/fecAGlQfh6LonAwEYB+OZdsVap8puJdx6hkOTp+H6lx6tXwkX3mjl?=
 =?us-ascii?Q?gFFbWOb17WAS3yPxZhsWLyhHmRtYDDfh7hlH0trBelqgpG/4IaMIpxawp7Tw?=
 =?us-ascii?Q?pn3L3dSY27jwvsFitw7Gd09Ge+lcjjEKwDUuLKkk0av/Ufbf96HRH5PrmnGK?=
 =?us-ascii?Q?/75oUJk3Vy1cPcnYcn3lrUwR687dvBZI5KRLTYN9dVK+EjZgU0jyfKxZ5h07?=
 =?us-ascii?Q?3+rehwD/vrbXNEdXCVIk4QJjLKSQ0+2JcUmllZdxL/pObmQHu9NZNo39dE1Z?=
 =?us-ascii?Q?9yuysMs4XK1oNbYRTT/e7fBTF6gmkZDkv1tkAkXQ71CXDICt9lzKvOdz8hAH?=
 =?us-ascii?Q?i6NJ3r7N2TiEeOyhUiLH8qHQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c76ee0a-dd57-4c53-edbd-08d8d975a9ef
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 10:11:06.1585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PF2SdBwBJMxvdEsK9wg0ppDvVrJC+Hz40nN9O3z4LRr61WHC0KWTTMnoB80zYU5rsUtG/e8P4ODMTYHSuciVorn8ew89et2r2ZiYGtLbcMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5381
Received-SPF: pass client-ip=40.107.1.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all! It occurs that nothing prevents discarding and reallocating host
cluster during data writing. This way data writing will pollute another
flash allocated cluster of data or metadata.

Here is my suggestion to fix it basing on improved refcounts model. Look
at 02 for details.

I don't insist on this version, and will soon send a v2, based on
CoRwLock, as Kevin suggested, which should look simpler. Still, with v1
we keep possibility of relatively async discard.. Doesn't seem worth the
complexity.. But I'd like to share my idea of additional "runtime"
reference counters for clusters, as it may be needed later if we face
problems with more restrictive CoRwLock or may be for some other task.
So here is it.

Vladimir Sementsov-Ogievskiy (2):
  iotests: add qcow2-discard-during-rewrite
  block/qcow2: introduce inflight writes counters: fix discard

 block/qcow2.h                                 |   9 +
 block/qcow2-refcount.c                        | 154 +++++++++++++++++-
 block/qcow2.c                                 |  26 ++-
 .../tests/qcow2-discard-during-rewrite        |  72 ++++++++
 .../tests/qcow2-discard-during-rewrite.out    |  21 +++
 5 files changed, 278 insertions(+), 4 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/qcow2-discard-during-rewrite
 create mode 100644 tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out

-- 
2.29.2


