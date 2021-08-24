Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D0E3F5BE5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:20:23 +0200 (CEST)
Received: from localhost ([::1]:54770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITXa-0005fc-NC
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mITT0-0002im-Lz; Tue, 24 Aug 2021 06:15:43 -0400
Received: from mail-am6eur05on2091.outbound.protection.outlook.com
 ([40.107.22.91]:59744 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mITSy-00055n-9w; Tue, 24 Aug 2021 06:15:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRZyo17cdv4gil7KisTqT1gSFyurg4SHthRm1ZdiEOGSigvjevKuP8f2wzTpql87TUc3JnZvTKCn4g2atNzgauHmZfQPYL0eY9Z4T/JiVK2UncwN5n1PkQIgLMpFxhvGwKJqUcRpGkMXfOBYEYW4X5W4WoEfNbZNgTLcum/BGM06gHToREh2mggA2LL6JThkIn814yCgDbxyDHMW0pA/Y1Zg6ukQN/WqtbxeVexmQObiz2v7PnOf2cNk3OaUI0PnuMaDWljNtynjMKVZdB1wxUGs70R1/Oph0ApBpI5CXXR9Up/csXK7ulZVqSqGFPMLql4QzBp0MeFt8UcI0Cv+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zUfh5M59Neb5FxjufHfg/qG/aRyZtGyLciDPOSeEPc=;
 b=jo9l3lyFB5TFqdfWP9ulxw/nIAAkZfVZmFh64Z2W7DPCQzPIjWcEeGXLPgeWC+hpQ0TpeUoP/aGcg2Y6TK7it9qlYjnkqtv+1Sg0oMCo8odmSGkGyGAF90fUS6AJKdS2Ucp5EO3DQqVpFPRtBH+h+9a1LvVnIL4s1TVCliORg3HfonBSEH55s9GExdFaXMGbe9uhC7Yy4sEsa05gCmy/PExuySpJWLD2U/fDXXBCRIKKo9KeZgYDmsIboygm6ryRvYJbKh9H+efA3jU+Lvy40A/JcNmPMeIduUt/R0RT5hfiJCc4/VEP2HrwFEzFVxDhVStipwAwYggV/B7RSd030A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zUfh5M59Neb5FxjufHfg/qG/aRyZtGyLciDPOSeEPc=;
 b=BdYBVopk24qdIZAfvsDDiWfEf2JR1V5/GrwXeBsx8xIX06fwbHyXoX2ZrqypUSnYvQEWbXS7topMAIxpPvG2icMGMfDCmTyFqko7ZAL4km0pOe2hOW9CRqtL5LN7JO21vpDqltrvn+P5PEYYNcuL1JoOtyE++3lKrmWZepi5A2g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2099.eurprd08.prod.outlook.com (2603:10a6:203:4d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 10:15:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 10:15:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, eblake@redhat.com
Subject: [PATCH v2 0/3] qcow2: relax subclusters allocation dependencies
Date: Tue, 24 Aug 2021 13:15:14 +0300
Message-Id: <20210824101517.59802-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR0102CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR0102CA0058.eurprd01.prod.exchangelabs.com (2603:10a6:7:7d::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 10:15:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab74bb45-abca-4070-2762-08d966e819f7
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2099:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB20999B0EA589AF1F473B3B0AC1C59@AM5PR0801MB2099.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z8VsN6w84218s8iAUQO4ZzeIdHcAAnHFsTaRSv8azcX/rAe+IODqgSo6+WGSkwqQKZTjHKMaf6VfPNGXSo7jDhlFSXn3uCK/2PzmlH3ldvwFZLgUyRXnwUwi9M/OIL/KmB1RskP3VAr+ltzO3mIauCecjkiGaBB/YpG3VnKAQ7nMFmmASjw7Y2jGxQO/rIrJvX7QiJhy70DXI7jdURbotim2H5EaXlGO/eoAsY0umxwEGKQqxE1s2Fq2nAjdBwvOrAxhAhXs2nP+AoK5P57seSZNphA4RBtkwj87hcG4SVCUKBsA+q9fOM32WNYcOdnq52t4dQ5kExEDTBndfDh9rShiW8ucfRmBiiCn1qQlZceBWJgGJ4RPD57HjL09URTsCvgphEfv8qiTziq9snNYsu24ZySp9DCdZmOzSM/LiXyI8gXOQD3hxgJoVGDtAGs0WETnoB8e5fkusLiVzjbOCavcZIzeTaLTHuRCB+/msbm4pw6Lgisc8+r3+ZIdStyYo/qG1zUjXmdwk1sV4c5svL0LijRpqOwypTtmiNPmDeHu/Cdn6oy8PCq7tCFfX9jAPy7R5nuXISENP0YbGZuCull9xk7P9IZendfpDI5jTR0C9ieZf1f0yG5BPcL2JovKgCHg84ILTg2HRlkyDifITYkLNG/2FyavaARYAtw1KRq0FpbWqua/4ImRRKo+5vFQ27OBhoKvjfGe+fqGctCC0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39840400004)(366004)(956004)(26005)(5660300002)(8676002)(2906002)(186003)(4326008)(6916009)(1076003)(83380400001)(2616005)(478600001)(6666004)(316002)(6506007)(38350700002)(38100700002)(6512007)(86362001)(6486002)(66946007)(52116002)(66476007)(66556008)(8936002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGNHeDRYdGg4UzRqWGhmZTV0SWh3MEllY3hEUDA1K2FyT3Nnek9FTVBHUTZK?=
 =?utf-8?B?cTlGVktzQldKNXErTUlETDNEM1NHVEJZRUN0Ri9zMmx2QXFNY3haNnBkS21H?=
 =?utf-8?B?Nitwdk1PN0lXcEhnSXZEYWRUamRhMUVBRkNDZit4YzlTZEFjOStmY05EOU5P?=
 =?utf-8?B?RDVUTHZqQ0RJK2lUZ3ZTWTkzMHdqSjVWMmhNNlFzVmRtaTJKdS8xK1MrUTJY?=
 =?utf-8?B?VnFiOVB4Z2N6T09pSjhDT0ZXVEFHUzBSdi9Wa3ZPVkNPK1ZNZzU5OWE0cmNB?=
 =?utf-8?B?NU0wTHFBSlhxZDR6blhYN1NGUDNQcXFOWmZEZFBkWUFSdGdkRXhDNFdxM3RI?=
 =?utf-8?B?RVIyUldZQ1BpbElFbXArWlhNcGpnYk9LSHVIcXRVWlNzOWExbFFmZ1VFOUdq?=
 =?utf-8?B?M0NDN0d3YlJqYXNjS0YraWcxYzYxdDh1TXE2Y3VnWGxKZjE5RFgxZlRuUjhu?=
 =?utf-8?B?VkQ2NFFEdGVqYWtkWThNVG1oakljSHZOWlR2RSt2d25tK2pOOGdtYldxekN6?=
 =?utf-8?B?MWxQNjlrQTV0NW1SRG1RWUJuTmg2S1V0VVZveHB6TlhKZGdzdTFCN1hEQ2pH?=
 =?utf-8?B?aWRMdVRBRkltZFc4WkZtdDlrb2lzUFl0bytrVkZscDlTV3ZyZUNDajFyK1RK?=
 =?utf-8?B?NXo1UmlwN0JzbUFNbUh5QUFKYUZjUjVFUUxKbm9nZlpKeTY2TXByTTArT29P?=
 =?utf-8?B?U2Z3S29TdHE5RVMyUzFMcVBPcmprOEVxaXZzVEZ5ZGMxUTJlbFFFbTVxQS9R?=
 =?utf-8?B?YkZBZ1lxd2VSSG1kN0o5ZkZoNEphdjRiSm96LzVETHprcEFFL2tmVHlzdXd1?=
 =?utf-8?B?R1JuMHBVRGdwY0NBMmtPYWlWSjVTdGNNV253ekZuNHdGUkg1L2JPL0pMazYv?=
 =?utf-8?B?NlN5NmlxV2EzdkJodW02NjlhdlkzQmZSaVQ0RW9KUlRPTkgwWFNkNjNTN1g4?=
 =?utf-8?B?dkhNQm9DZ2hjTCtoZ05rUG9QeitRSWxjcWhhM1BWT1F5d3pNSW83Vnd5NTY4?=
 =?utf-8?B?N0I0K2dMMFEyaktVZGtUWnFIaWpJdGl0M2IxaVlVWjdhTmMrRXFDWC9qQW5y?=
 =?utf-8?B?b0g0ajhtRlpBL09TaTVOY1M0OFpIU2Z2NEVqVGM0UDErekpWSW95Ym1GT2hV?=
 =?utf-8?B?ckhMSzVoMkk0VVU4TGh5R0ZnUnRERkFwVmV0Ukt2WXZxVjMydFpQeWp2WTJx?=
 =?utf-8?B?S1VZbEs0QS9yZlZybWlxQ0MwTCtyYk1GaW9HclFYcWQvY05yYWsybUhTbm5L?=
 =?utf-8?B?b3d3OFhVbDFFQzJyMXhiR1lTWGxRalFIZEdlSkxLQWIxTFN6bEpzbmxjZjQ0?=
 =?utf-8?B?dm5hSnZFV0JUc2dTRHpleGYzS0tuMFZGc1JOTTVmWTFWdnhTL1BOb0hkdm9C?=
 =?utf-8?B?UklFcEc4bU9BY2Z1R1Z6WGxwOHZWK0E5RDl3RVpsdmZEcXhYclBQSklncHRv?=
 =?utf-8?B?MTlyT09QMDZ1bHJFNEYwN2M4VVByMm5wM3R6TVVsMC9yK2dIOUZxdXVYMGdl?=
 =?utf-8?B?YnRzVCtHSXZRU2wreEQydlE4NG9wYTAySGVNRU1FZWdIR2hoejJnUmRxRWVV?=
 =?utf-8?B?MjZ3WFRnUDNRU3lLK0VENzZzbE93cmxvVS9aVW0wSCt1RzFlZWJRNHhsNmJZ?=
 =?utf-8?B?Z2RpY2VKcDU4L3I1Z1hBRHVHd1cwaHdMa0pBN3BmWmpUMFFXRDBBL1RwbE0y?=
 =?utf-8?B?RVBNMWRmSjZhKy92cGhxSEVZaDlkWkFmR0IwbWRVWExGRml5bjdTL0p5eitQ?=
 =?utf-8?Q?kOArgy13XuCKu3DldeWiqZlOM9dNr27trKJw3W2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab74bb45-abca-4070-2762-08d966e819f7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 10:15:30.5322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Gne/rUy7athtve4BbW27cfiRWv/N49m3LQqEOkgrL05rW4/AufvZnXAQCOpwMNZtz3itqxJ6LWxqDZD8EGQF0QgfZqlOdm3nBpfp2vVU9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2099
Received-SPF: pass client-ip=40.107.22.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

v2:
01: improve documentation
02: add Hanna's and Eric's r-bs, add tiny grammar fix
03: fix test by filtering instead of reducing number of writes

Parallel small writes to unallocated cluster works bad when subclusters
enabled.

Look, without subclusters, one of write requests will allocate the whole
cluster, and all other writes to this cluster will be independent of
each other, they depend only on the first one that does allocation.

With subclusters, each write to unallocated subcluster will block the
whole cluster for parallel writing.

So, assume we write 8 consecutive 4k chunks in parallel:

Without subclusters, one of the chunks will block all the cluster and
write L2 entry. The remaining 7 chunks are written in parallel.

With subclusters, each of the chunks will allocate new subcluster and
block the whole cluster. All the chunks are dependent on each other and
queue depth becomes 1. That's not good.

Let's improve the situation.

Vladimir Sementsov-Ogievskiy (3):
  simplebench: add img_bench_templater.py
  qcow2: refactor handle_dependencies() loop body
  qcow2: handle_dependencies(): relax conflict detection

 block/qcow2-cluster.c                      | 60 +++++++++-----
 scripts/simplebench/img_bench_templater.py | 95 ++++++++++++++++++++++
 scripts/simplebench/table_templater.py     | 62 ++++++++++++++
 tests/qemu-iotests/271                     |  5 +-
 tests/qemu-iotests/271.out                 |  4 +-
 5 files changed, 202 insertions(+), 24 deletions(-)
 create mode 100755 scripts/simplebench/img_bench_templater.py
 create mode 100644 scripts/simplebench/table_templater.py

-- 
2.29.2


