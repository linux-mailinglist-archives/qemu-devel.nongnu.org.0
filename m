Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F19E4730AA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:35:04 +0100 (CET)
Received: from localhost ([::1]:38126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwnLz-0007Nq-65
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:35:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mwnK0-0003nf-BR; Mon, 13 Dec 2021 10:33:00 -0500
Received: from mail-vi1eur05on2102.outbound.protection.outlook.com
 ([40.107.21.102]:39009 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mwnJv-0000jv-4J; Mon, 13 Dec 2021 10:32:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMue8+wEKO7I1/fdHcZN6oMpysKHyYv/3gqlfjo9kOFqsKd3hvzb868e+0EAUFCiVfjw5v88RspMjaFZ1J7NktbiDgP8MZ8YSelhL+7N51JHHXj8c9tSz0Xbar3XRNJ5wofdCeKwmeEf/k+TO5KxqEgEFbNf9x5s9/DV6BhRC1JU2hvqm/bfrhmEOg6o20Ofgbautf4MsYVL3v0GViWhUGLTiTLZb2GsmoRZIoHGqlv1/xVJs8P3Nps2wWGCYAZZ7vTEmwczwvQXR6Y/g5y0sIb/ILhMQjFzzYw4T96bqM5uPD2sN2EpBGCU9FFWad5fH44mV5/NY4MsTRW5Mk1ojw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJ5kK5aN5zr0cIoRdZJ0CO830Onx0Wft4jrnIxKyML8=;
 b=QSAsMxx4lHlbQGoQXoIW0G/J8fUR3rMhCdcCwoXqfnn9rRnWYZg3SJ09JSjYGU9x83UAVdy4dImD8MkCoQU7qz6hwqtINqkHju1RJKyqUo+p78HXWP3Y8PC5qW8pz4ugL/3XuETHPyE32x08FNySvuPJeea/5HCn60lWBKPa8FB4En2fCY2t1nPtIucECOy/csuH+3gb3cN9YT6h8xOhWdRPDHllHQbZC24SVqvUyDq6QzwZJmV9d6K1a/SCiu+ARFtRYVQHqQcnkaWyCVFnYuI9SDcwev2HGNQCUIM/M57lYHSsNgY1Bpr5E7vNYAJYrc0EB8reOPHNvhK+wZYNgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJ5kK5aN5zr0cIoRdZJ0CO830Onx0Wft4jrnIxKyML8=;
 b=OlAhqb/U0BIwksTpjrAUO0xxzToORVhg/prXvEFNeINo9eakP6qurCD1jsyvBk2DhkGpRWL0msiRzgPHNKDotrh124yMwwfRwOSuFtKtA36COoymbovEQp5Z1pSupTZUWFqJM1DRieUWdA6Ea2DX6kgkmVHXlsX5dqY6Qro6Qp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com (2603:10a6:20b:353::8)
 by AM6PR08MB4455.eurprd08.prod.outlook.com (2603:10a6:20b:70::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 15:32:50 +0000
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5]) by AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5%4]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 15:32:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v4 0/7] nbd reconnect on open
Date: Mon, 13 Dec 2021 16:32:33 +0100
Message-Id: <20211213153240.480103-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0402CA0023.eurprd04.prod.outlook.com
 (2603:10a6:203:90::33) To AS8PR08MB6741.eurprd08.prod.outlook.com
 (2603:10a6:20b:353::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8432ce1a-3a3f-40c0-dd92-08d9be4dd24f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4455:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB4455BD5C23CF3A133FF06368C1749@AM6PR08MB4455.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YsgeArSVjMR7ERXLKT0Eh8PxMo5vumXcX64gmQuL8fzonFA4LtYqQc5orOIl4dlIsk1RD46eQp4dwcCAOyQC1DK8VYATnjzzFBtBMUSgBSGJ9de3750I+gLtw1mYZNV8tfoQ63Fh+LxkVQNc4Bs8ZVmpSmi/kGX9CdQwe0ooYDuNFfwvRQ00vE8F3tY4Ezs0aW3Na2jhTuES1OLnSOnim5RiyINJBngQgKZL0yzCsDCutrx4RdQU3gFEdyOxKqmvbrnqhRbPpNgqRCo1TTgJ4zYq6TMcDXe2lxZN5YdRRGsoBO55/cZuiAI72SiwlbYQP6ejoKyY8/WrJxA/uuBr8AhUHrxsVKRME2jfRjGAwgyeI6WutBfHfTDbnd8nquCzZxHIcHb9cN0BcRj/U0VGoHbwCTsN+NDsJ3HaXV4Cd64qBID9AHPFQZ3/DxwacTfDcfNqqC6xwbfhdqo32V2vlfHTXcpFCyFnLiiHUyjsZA6vY/LHuJk7CtR5BHjg2qTG916vVury3Y4L70APJLIvahnux7wJQduep4r7852z+kharwlnxiD6w5JAJVVtJjil7fNTeYhkGY1TTsyQS9Ne6iNNkhfjzY7a1e1pQrcwiRH1Arwv5ixf0TIRWr2zgOYIMkRxbQfk61EA6woWJmhwbT26j01MkSi76Ddb8pdu/U1DV85glaUYRh4lA9kpqsor6n+l8gWlVudKMIi/HHo99Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6741.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(4326008)(66476007)(66556008)(66946007)(6666004)(8936002)(5660300002)(26005)(6506007)(186003)(6486002)(38100700002)(6916009)(36756003)(38350700002)(6512007)(83380400001)(86362001)(1076003)(508600001)(316002)(2906002)(52116002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zOUnbZpN9KOyL8mvEl9Vff8En8tmplB36WyrgVUxRp9j7lhjAGpghKx1XOzz?=
 =?us-ascii?Q?Dmky2gss6P3BynAaiaK5TeycrkgjXXjjTIp3vBPhg5TSk7J72QpZiGvYgMnC?=
 =?us-ascii?Q?EtqFlchnmsHsO8ZaL3d4sYmTlbaTd8ghLnaDU9DkOjDFIMG1JqhwmAFe5Civ?=
 =?us-ascii?Q?mTg6cK/P/lgI3khglOlG8NPeq38HeOp/bbdapGiCXMQ1oaHH7IDzJSZKlmv4?=
 =?us-ascii?Q?FaZlEOSTmBy8XZ4LlIbDwhkPOqWjZ/pFMEWMYbHF3sQ/Vl+FIuaeVYquu12r?=
 =?us-ascii?Q?sSeUI3w2k7E4Oip6zE38XxfTnvJ+2Ulz2Q9N+HtZgDQgtBu4sgDU2F3B76Ig?=
 =?us-ascii?Q?uX9u/92qoIOX6B7oT463yrbKLRhWPSSbMwmRdAY9hzFFsArNqzdsylBSf6ej?=
 =?us-ascii?Q?bUgZY78H4276U8ipUfas2Z0YrXN/LNaui+EkL3Z+Q/DyBEYUdMO7gEpH4bWo?=
 =?us-ascii?Q?C2JKBZ85yIBt+TNKeMCWsLtAgo17tY95gboo1iN+UoG/Sa6+u4mWOKquFIxB?=
 =?us-ascii?Q?DKtspydUCg0gy9oewk2J8la92oQD3+8JYYfZRqO4C9QuBhz7oYjYALtcYqv0?=
 =?us-ascii?Q?LgOzth0LKqTnRazNerHOQgXK1LfG6dX9sUWrXyKAx9Iy19K9jOlEGer3Z3xk?=
 =?us-ascii?Q?ETrN+pTILwJyANzqKFuqFXtJA+vENSOkrdscsBBWS2Le3u8BlbtTjlzV7m+f?=
 =?us-ascii?Q?pRzTpHMQzwrk7fL9uJ/RR+dizzFbwGvKH6EoX3czpHow578cZ/AqCqmG9sr6?=
 =?us-ascii?Q?7JGVjtSx3ot/Dh1+H7oGKzoyLqlq61WXoAtyJWd/5adBnzezNQ+4NQibCJHi?=
 =?us-ascii?Q?xvLhp+WCDHzRuLzohp7Yz69YNlfSdzwlx51c9YZM+mUBQTo0Uwoyx0zaOz5d?=
 =?us-ascii?Q?iz1F4FwW3Y8lIw2eIGxlSNev7SbewrNUL3NNOqBe8KIolOpq2KEJVT2OZ4hf?=
 =?us-ascii?Q?Abfi4TxqdOZAsc5xxF8OOxQ/E9CfXo/wmj+yV5HHBG7Cx4xCsx9SXVYBR30P?=
 =?us-ascii?Q?trxixO+2p1267h2oX82J2c6kBPVirhKMHWSJ9sXdp8ho9tX2s5h6hKuYCQ7v?=
 =?us-ascii?Q?HzgEf1Oq8WTSWSG6/Pu7uC0Gm2PPBTnRLTcggpQyL2deLpc06A5QUXTE8ciZ?=
 =?us-ascii?Q?L+A1az3d1JkURkQ4Zk4IaqYwa3d+V/HTqfHImTzvMQnNVq5JvMTKmcoZh34N?=
 =?us-ascii?Q?nnRc2zAND17VKyZYwPNfc4ev1O/CWH7JKKSoXAUFx6/LjQkfWEY63FWP/vm3?=
 =?us-ascii?Q?7evjVdyOG7kl8SwVRy/V5iSpJis7k+JpUQOeMGslDfDgFu5BtnWykGEMbMqv?=
 =?us-ascii?Q?06X4D9dyInMWyk2hB8m3pDzQq2fKFpuPR5v/7+0lTeF9WGzCNlZ/HPy/fKiP?=
 =?us-ascii?Q?nvVortlrgLF+tz/0358fjarc4oMyt2i0XE25nYTVkLbtEps03zD2h8IV0WWr?=
 =?us-ascii?Q?n3neVcWhc5Tj7/aD0ckYghM+uuEm/guVG6Bzu64W0Zd4zYzi8Aj5zb14wzPK?=
 =?us-ascii?Q?6EhEA5DlUsu8wtXQ4gcBbNCRljANAcWB9vAJ+/BEoRZNRfA938R/Gcc72IMY?=
 =?us-ascii?Q?X8BxQIEOhbp8vGtDg6OAvjMYEyOj2FVm6sK7n5pybMFa9MHfO4pLQodCa6rG?=
 =?us-ascii?Q?4XOgNy9EmPaUU8gFPylfUGpi5eUrm2thfBRWh8/rIIneUmXMaaSnmO6lGZ++?=
 =?us-ascii?Q?92G92g=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8432ce1a-3a3f-40c0-dd92-08d9be4dd24f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6741.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 15:32:50.2642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Z67lkZG6vtmSKYpOaK7aqCxLV5LUw4DK5iIw8iG+k/7zXGz2GWoXhzDSObFekRP0o9wH1/gz0ZwlRxkDmxYaK49xpeiCKvd0N0zR4m1urI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4455
Received-SPF: pass client-ip=40.107.21.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Hi all!

The functionality is reviewed, python testing part is not.

I've dropped the patch "qapi: make blockdev-add a coroutine command":
it's optional, I don't want to slow down the whole series because of it.

v4:
01-03: wording,  add Eric's r-b
others: small changes, never had an r-b

Vladimir Sementsov-Ogievskiy (7):
  nbd: allow reconnect on open, with corresponding new options
  nbd/client-connection: nbd_co_establish_connection(): return real
    error
  nbd/client-connection: improve error message of cancelled attempt
  iotests.py: add qemu_tool_popen()
  For qemu_io* functions support --image-opts argument, which conflicts
    with -f argument from qemu_io_args.
  Add qemu-io Popen constructor wrapper. To be used in the following new
    test commit.
  iotests: add nbd-reconnect-on-open test

 qapi/block-core.json                          |  9 ++-
 block/nbd.c                                   | 45 +++++++++++-
 nbd/client-connection.c                       | 59 ++++++++++-----
 tests/qemu-iotests/iotests.py                 | 36 ++++++----
 .../qemu-iotests/tests/nbd-reconnect-on-open  | 71 +++++++++++++++++++
 .../tests/nbd-reconnect-on-open.out           | 11 +++
 6 files changed, 199 insertions(+), 32 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/nbd-reconnect-on-open
 create mode 100644 tests/qemu-iotests/tests/nbd-reconnect-on-open.out

-- 
2.31.1


