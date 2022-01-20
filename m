Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB22649561F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 22:51:34 +0100 (CET)
Received: from localhost ([::1]:54076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAfL8-0007MP-CT
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 16:51:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nAaBc-0002fI-L0; Thu, 20 Jan 2022 11:21:21 -0500
Received: from mail-eopbgr50102.outbound.protection.outlook.com
 ([40.107.5.102]:22990 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nAaBa-0005rq-3K; Thu, 20 Jan 2022 11:21:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtTxRazdiaSktyiA0RL/mEnDUi4Vci0jP6aic/JGkI5RlbEywrkvHD0ouRJmI/+m0eR1mMMV9nH1YaFvqRKuGp/hHy6g8vmUoiNTXKNq9sPNSJdASoj2NL//t5fjf3toI7em/N3JSKo0tcRL1fXjKm1kvkl4XIB1VLpTcKb2KBiMo99WuvMEOa5q31fDemene6eOMfKqCKhsYwGbZl2zEe+9mWt+vFAfbW+2ZZKuxdmOEPD/hlQGQRb39fcdyBsOZibIAIqliaGHuSfVIxZogUr4ZV1gHBQP70W8Fxxl38JjYxpv3QO2mKZmOHb7sGFFsXU/Hb7srm4289JJCiNvlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAdsCqleVK66W45EOqnkr4mRZzForsTyJenM0UsyBLA=;
 b=ZEcjlZmZEGYrDMT3xxu2rzgHWVd1yZNLFw6Wyxef8ci7zFfa75hVJOwXfUKpPQeTBCn6kM4SG8swFgMPH7byBp9dEZbsMgoczvJ5zBZLnzXDoVaNFuAKe6HGpAwBfkvqj4OIrWUtCOahoh1wndKQK+W60g+VBmUy9k/qkLipNDgCQkKzsxzNNyMDqhpYaRSH0iGUrkI9y6QmZTOMhzeY0vQRfxscETtMB0AKSySxPQBYEIO3YZtD+6FqiiaeeZQdpMBDPnp5YuscVZKt9X5+SRbQrmVZh/0HBrxnPUgJ3YS5s5/ugMiEIUyGElOLx1iTUwwCha8Tvj9+qeABllQ1bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAdsCqleVK66W45EOqnkr4mRZzForsTyJenM0UsyBLA=;
 b=scY/iUNo/jzhagmFnb51tOk8gZxnnzlE41EMm694+lT3A7fDU5qasS360Fv7ImahbP2WjE8+U0NHrG5jjK+DYZqxptlme+aYiyzvyT32Wsy/LIBzHDCPR1wkv16f+wcDmQwG3v0c8P4zeimz9a56UBjp1flvcNeiGYBGo20yAa8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by VE1PR08MB4942.eurprd08.prod.outlook.com (2603:10a6:803:10f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Thu, 20 Jan
 2022 16:21:00 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::f043:6356:ee64:6cc6]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::f043:6356:ee64:6cc6%6]) with mapi id 15.20.4888.013; Thu, 20 Jan 2022
 16:21:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH 0/2] qcow2: add keep-dirty open option
Date: Thu, 20 Jan 2022 17:20:41 +0100
Message-Id: <20220120162043.2693196-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0118.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::23) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3eb77dae-5397-4c4f-b9cc-08d9dc30d83c
X-MS-TrafficTypeDiagnostic: VE1PR08MB4942:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB4942399B3CC1C560B6B7A719C15A9@VE1PR08MB4942.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:170;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jshIjm1fpJplIJFpm/xuKUt0jwjR5Di4JoTz6oP30/Vi+FD0NYjaF1VOQAZIoycIUrWgLxSETvlDSFCRi9gLeM7Jv/UuAsvJK86tDq6CMqZnlynMf8lcctc578ZZVSmB4yclD3E3lyWtxR8IQC+NRxekrzhdKpO43cxvVhHcjBJRpRE/evJVk5Ekicf2G2DlWYUbbRQ7WJia3o7ECe4xMZ7qPb5Qd22/uUjHUI+5T70sqe/ReUv0SAOeave09ffnJMNLK9ls9Ujutkwl/cDU1E8c0Wv0IRnZZJ4bZ4UBrQoD6qxYJBobszexS3WgF2QCgO8TyHEXvuHiV//Oy681xEECKnK3ZQXvacyIR6f1nE+h3tvja+nTA3NxqpXPwg6vd6kxLIGuJQOQL3tQlhKCMGnI15cRcxHbuer88kudC7Qb9kb6vWMQK8fNkG8v3epyeKrMlZcLqwmV8JktbhaR/hHrop9sSJVy5S7CrPj9G8MsSiOhuTeijHjSfPznJYGjspSMr2bgIgJyTdHipFw0TEUUXrCC144uxzU+so5UKyPVgsjTI2WSUT7vAo9OQsM8qzZ/eOQF5KXGDWIcTQYobDe798Ww1BUjRTcUp0efLzgBHSA0q03vam4s/FxegCt+tiY8Lx4SP2opBsEW5u05IQuigPJqL9ZNhgfhMobnG0JRjTvkmGQduM5VThd7XT0mNndgbh/kXB9xTlnQiscmJLCNuvsUrxf9hF1poovCUXE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4744005)(2616005)(38100700002)(508600001)(8936002)(6506007)(1076003)(5660300002)(86362001)(6666004)(83380400001)(26005)(66946007)(2906002)(186003)(66476007)(66556008)(107886003)(6512007)(8676002)(38350700002)(4326008)(6916009)(52116002)(36756003)(6486002)(316002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GJ0q/WqwDXSKWz13U7gsNe+bTlxfQvGzRnCNzQvhhkbSAcjRaajHtCqqmDSX?=
 =?us-ascii?Q?TfpajGxmGcs0Di0oPYxALeatO9kXQoqQBd9pA+Qk8pgUHHv54QfBU6y4hw4i?=
 =?us-ascii?Q?Bgo97IhN0ByeeGxzKQZHlWqi998mcgIM4P1cyPNgOhtPqGhoQ2Yudu3VVv/n?=
 =?us-ascii?Q?US40EYrX+/n2fId698u2ZafRVX7sPAraGhdBLEBBSclOHu6touCR2HWBL6ti?=
 =?us-ascii?Q?Cd/searOPV7hjHSspWv/XM8X0vVT5QxfK3Vy8QC1pEoDvEV+XK6Jq9MNsshq?=
 =?us-ascii?Q?GQBo/L7HakkwpNHR3HTt3ZwviyMw60qQ7WLFY8gW7rzhhHy0NVJJiyEWOiMC?=
 =?us-ascii?Q?/3FUrYQbF8lfVAe8aKAKqdKiVFwqUg7nCC5B736ZPbrtoNmfwFXxAjmlAPFB?=
 =?us-ascii?Q?U0D2gz2Cpw0PPPz8gFg5nds+Nn/1V8UvSOes5gLAt0rbHk4aQ22mdD/sbnWX?=
 =?us-ascii?Q?kEUOireUSD8Q1hYF96PI2UYOqyoZCzoFP+ZObw8Y5dV8i2zhYEfbVdVkorBU?=
 =?us-ascii?Q?fb93rRPtTAqfEBKzhm5dZr7FN4BgY5WOILsuHcAm25qeP0F2m0qDRqJgfzvC?=
 =?us-ascii?Q?9Mh/dU2wdbUeRM3M9z0d2ATog+K+BnZpj2BrIVmpgNJCszBtPZsc6H3spghr?=
 =?us-ascii?Q?TdKb9Jz9Ia3/tf76QYMO6vAuUwO5CxhsxEq8KnFnPB/Un15oT797c0R9jScJ?=
 =?us-ascii?Q?mEkbyiM0YT0ZcALggrpYdtNAWE891Rk74sJPCmv46JZzRcZ34o9/nU5g8zmn?=
 =?us-ascii?Q?bVMSRlKR8osOH0JUnV1U9JFFcrgH1XHixCVx94CH1tTeBXz4n1b2ApDDzpSP?=
 =?us-ascii?Q?zk6Los0hKMCZ3GPEmnH0Iq8i1gmqAZ0Qi3olgM1KI+E8i8x6wvYTy12s5iuY?=
 =?us-ascii?Q?ptq9fbpEcXCGlTOupu0IaTmbZIWMT4ij05vFSby8nv5CqYqMQw8DXmFDiFVx?=
 =?us-ascii?Q?NWQGhefywpr1z4ZFqsC9RTFKKn8R6yztbgrTYiChZCxz/0NqgUZDSbyOO8qW?=
 =?us-ascii?Q?LZ0U3eYfx6jkbG4QvFNIBmNb4CYxNv+gYWKFmwZ77mESH1FKEbFEqex/ICYv?=
 =?us-ascii?Q?FyUo58csTvB7S4AGxr/wCfKBiCZtxOZzF1NFenRrcNcUay8fBIKsD/WHB5CR?=
 =?us-ascii?Q?xGDXk8sPjn3F/RVUDBJKlBB+hsFHLmHe3XmVbk3q0cTefNRVKXHyh9Ptv7aH?=
 =?us-ascii?Q?T7qopHGFDQqio/PzgpM+NW/0EsdT5vKmvCb84h91ClM2ucObx9gBMNGS+XjW?=
 =?us-ascii?Q?/CCb3uoi7/QZ/5nS8bqwjr+KXzL1+fGpw+GebpPcMYbbwPTbPEjbby+NIwfZ?=
 =?us-ascii?Q?lsu8EUndm96UgSxaAz0N9H2Op9ZpUC2kVINV3I3//vbNX8iJaz+EIFVuWFcK?=
 =?us-ascii?Q?jRJ2nR66o9JI8rjbsnwNdu0guipH+tfkOZK09J8JAyJVyrsutBoWlHYSmO10?=
 =?us-ascii?Q?TxMgkmIR8c8mNHb4wTmMPQDSq+EuVqMhO0PgEV50lCteaUOZqKPHTGJHyulb?=
 =?us-ascii?Q?aHtm1EiGY8VwDW/gxx2a96xZeLxPGnUrXEReD164GcmxizIlkMOtskfR3WbE?=
 =?us-ascii?Q?6TFsj2H0uKJjJoRuPe54r3Mt95FDW5SVUqeHncRRacTJbore6CR1DbcTb8Hx?=
 =?us-ascii?Q?DRv7ovs2vcnD2j7sw5qX2f4/Vy7GlAaybxX0x33W/FCGyx78SbUkTRfED1uu?=
 =?us-ascii?Q?XPt0GA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb77dae-5397-4c4f-b9cc-08d9dc30d83c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 16:21:00.0140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJe3bJVsgXAw0ZQdmQ7zi4wrD3ASi5mXKYorc944Rf9kQH6au4tVUIZf7SUwuk8gDmi9/1j0jmu6JoDrddpE0M1/7YeQuWYXcI2Mdzq+TGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4942
Received-SPF: pass client-ip=40.107.5.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

Hi all! Here is suggestion of a new option which we need for our
developments in Virtuozzo.

For details look at patch 01.

Vladimir Sementsov-Ogievskiy (2):
  qcow2: add keep-dirty open option
  iotests: add qcow2-keep-dirty

 qapi/block-core.json                          |   5 +
 block/qcow2.h                                 |   2 +
 block/qcow2.c                                 |  66 +++++++++--
 tests/qemu-iotests/tests/qcow2-keep-dirty     | 104 ++++++++++++++++++
 tests/qemu-iotests/tests/qcow2-keep-dirty.out |  34 ++++++
 5 files changed, 199 insertions(+), 12 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/qcow2-keep-dirty
 create mode 100644 tests/qemu-iotests/tests/qcow2-keep-dirty.out

-- 
2.31.1


