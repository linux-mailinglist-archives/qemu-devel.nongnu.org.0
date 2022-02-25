Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEFE4C5240
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 00:47:30 +0100 (CET)
Received: from localhost ([::1]:56390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNkJ7-00011w-4I
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 18:47:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFO-0006e4-On; Fri, 25 Feb 2022 18:43:39 -0500
Received: from [2a01:111:f400:fe0e::72e] (port=3086
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFL-0005gS-Mi; Fri, 25 Feb 2022 18:43:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PC8Ufl/bGkDsaiIxALaL3+UsSF2aKNW9kOl0/AaVnuvPLnyNA0m9kYp3cAW9ru2DIbMBD+oiakCu+nTIwqBGTPx8iKQGSI32oyWF0+Sv7S23jhFNXN5Cun1hvLNCVvfWgHS1vKNYRKjJ93pMZdP5RYZ66fY1USjdqwFL5TOP08HK0zGlNVbI4J7xSA5Z3UMknJ7Xw0UgfPnElazosPk3uYKS1mFEEEDh6vDUAUh7IRQcq2l/4q6QSHZorAFU1eaJNxdJN/uujO05IylsW6bwmmgVnfkzlNWVi7N9IpgIy30SIB2+26Hup+yNsKAAmeGZDbDGHDbza9zxJLu+yKfchQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIq6smhBLV8TvvdhMg8SK33Iof++5Ez5QacipaOu5kg=;
 b=BRzOlRerc0J3KcNCy9mAltTVwbbBFiBrtb6VUyhto8Hbca56/JZTCfI9+Pco5aRPIztnNpltEqIVVjRB3beXXJakcmGun68P7NwCBawg6R/Hya91lPAs7siQzxf7PTo/cx5aV3SB/QIassxXBNU21ohLZeBzDl9xNP3l0rsmF1WERk3DqDjiXsBT6YR6HehhKEDfEeITB+KGs8aDKtNtJ7lPbTFEWbfSd5Wl9BAR7BFGTWQn2ter3wTb6EVGUlP9kE42hyeTpbqtT+OFlwrMP5I2iTgMZOqSppkRfy3mzW6JGzNVwVgSeO8uWElBi+j5Mm0VoTXWaLDuRwaQh2eXYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIq6smhBLV8TvvdhMg8SK33Iof++5Ez5QacipaOu5kg=;
 b=YFKTD/bZnQs2nvvjcU+xhhYH9R7q6+01uhf8ZG75IUCckxHWvXv8H4uOpbjCST5ny7Qt6hoT3cUR22KPMO4AiEkIMTsvhDv6TgqHiYgbD2YAdE37l1NnOdaTtcbn4KIf2Im1zn2LP6v3eLqzp5Glv3invxSm3EBlAs38x3HH5AM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB8PR08MB4172.eurprd08.prod.outlook.com (2603:10a6:10:af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 23:43:30 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Fri, 25 Feb 2022
 23:43:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nshirokovskiy@virtuozzo.com,
 yur@virtuozzo.com, dim@virtuozzo.com, igor@virtuozzo.com,
 pkrempa@redhat.com, libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH v3 00/11] blockdev-replace
Date: Sat, 26 Feb 2022 00:42:57 +0100
Message-Id: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::18) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 435d6eaa-9f93-4524-6746-08d9f8b89f9b
X-MS-TrafficTypeDiagnostic: DB8PR08MB4172:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB41726C25A522A76B555AAA6FC13E9@DB8PR08MB4172.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D3HYVim9Wb+DCjBKHDY1K9evWVIfr44NxXFz2aZdYdIZK35axAX3KrFE5cvmZMBovFStd9ClHBDnDJgk48PXKeL2LQyiHkiCdX/udfmyWIqrUifYah3vCSP+OF+mZm19Z8GKHQu4IrT0Qi/4F13K6Q4LiK0TvRq7ifAEDA3RQCOd8+8kvelc2aiucg0gYct7YUz6lcz7OToUtdFv/KJb3bNyVA5Z2QVdFl3YbrVPpoqA1xdQe9gQT0izi9FRnCIbY5ayUttZyLHLBM/wb+VvWC2SMi6Omiaks6l7Bw/Eansmyo8XDOUzRiwAAWd8aCnbx14Oetdw6TecxUeN6873CZScvpug9eG4aYcJIZClGU+EhJe84JoF8Yao+iI/HFl4U1LSp1h23EaMIFPYXrEqBCoKHcwlm0JgnOZ1RTWbCmCDjGEGYnoOSUGwgX4KfeFmzYIMbUrCa1K4t3co2V6R1QCLCSnE7LlcQQMK6B9vHar+Nn6xwdQ1fgbwjyRDxpDjnMBUApvjV0bfJPsWFYDBTSuPCTKLc7tuW3FZBzoL/0a8j4mbSXl628e2Cev0/Gn0MP1Ti+v402MiUPEGcZ3JHyzlB8lUyEi3O1J9hTVshCZemleFAlae52ujJ/jyMivU/BkUToGbif0uFPsPxkYuJXjLd7tlW0i3cCzWPTEyqkMpbpsdOQa3nbvw+btIkILDFXj9MAPIoSSJs64E6K+Dqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(6506007)(8676002)(66556008)(5660300002)(83380400001)(6666004)(7416002)(8936002)(52116002)(508600001)(6486002)(6512007)(2616005)(26005)(316002)(36756003)(38350700002)(1076003)(38100700002)(2906002)(86362001)(4326008)(186003)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M6bFibnzMqkrEPHyNd7nVIXvZDdtHYSr9MX7y7zkXio8durzkcH04/+FEs3t?=
 =?us-ascii?Q?N1H5xmzSfuADS7R1LvbziRWkkpqvpRwl2jfo9VufH1y7XhD5o2j3hNDoQUmu?=
 =?us-ascii?Q?aBBdvQOVhxl2uM98orhPZ1ZlZmu/LB2D385wbNUWvFvJ0vOlC+wh4MR/SyyZ?=
 =?us-ascii?Q?CE0p9cUs2iMTQYMjWu+QLB3TfiahcuXRz+W8V5TrSqQL1ZxeYyEdVQdS5nv+?=
 =?us-ascii?Q?luyNvGLczM8UekgGDxcpgsNuTrZ8WmrMh9IJT6GEL9KMZPvagev/xQH3HqEy?=
 =?us-ascii?Q?W+aqFfEDyao0sGGMmYhVMIK20deHFquyBEDOiX8Yk7mTlyih4tl1XZEKWl7i?=
 =?us-ascii?Q?jj8SBXh3zMrYRfo4kifh0yeZzAICE+GurDYkTS1dOrQMF4MIijaKRQ+2ZdfZ?=
 =?us-ascii?Q?JquqygqYwTcmFlYp3EoZgw3kWOVL6XpZWrS/pvenUTnO17YDBg3otM2KboV8?=
 =?us-ascii?Q?kedMuTRIZpOuhpcMmjqU/3up8EOKbUGmkM6nhXdDSrWKXjb7Eh+mzLkLCyhp?=
 =?us-ascii?Q?Y5JUduN09fZayH5w18d2GgPvwIttXw5ACXy5lyeXxgV0W2Lv6MMOKKfEUKvQ?=
 =?us-ascii?Q?QIh37bn5mvkswA9nc4bfkAmlhhk10b39AnhsjFB9pcHFCrQbaTEfxMWJExGz?=
 =?us-ascii?Q?ubBjrfZodTrIt7JPvr2DRtn2RbrjsnmegcRlM3tPkSUb9LjwPAjwyloG2S/I?=
 =?us-ascii?Q?b9yruCjPJ7VSqXKy2+Zf5jHyzoB5L7mQ4gkfsagXDfNgI8A1+PkSNhhWEA+P?=
 =?us-ascii?Q?1XcBKyKzcHO72LUYltH2ssl1yDzemYO2FF57/83a/kiOZCy1KRKlnON/0970?=
 =?us-ascii?Q?I2hogjJMVUyY9+3MKBXOLBeU299xuYJrwdW8uezguAjknrx3s46PYcrWAqgW?=
 =?us-ascii?Q?1vz9xjhlhLOD05yTHh+eZwig5gD81Y38BEQyMPxItVzl5oYOl69Y0WJVw0IC?=
 =?us-ascii?Q?VxJXJpGdDGkSF4RUYvOAd0RAzor2O8ab8mh5wd25fjIM6qTju8ARXJt69p+8?=
 =?us-ascii?Q?/b8LnM9EJpEVw/KtCcyMI8pdnnQ1U4vz4M24M4HxHhed6S48+AF4OjRMCuKI?=
 =?us-ascii?Q?X3XOX76skA1bqP9G11B2nyBwXyHKK4aiUY5Q2G46KqZc8eVTj4HYV9cWqO9F?=
 =?us-ascii?Q?8EOcL7XuZ+7h0UYl4KGuczWu9VrZq9YI6phcswymxAxOcr5eSf9/LdbAnIm3?=
 =?us-ascii?Q?jGKONhYDg5hWE+apJZxa5QnugONWfnv8GSWsVSimEdBTIVReVImER4lJyBxj?=
 =?us-ascii?Q?OHExdJd+K1LWL7DvzBVqKDTnJLL8egnUW1aFx7wRNLUm8aMwFc8rM/2cOPm3?=
 =?us-ascii?Q?pys4a1vQLXtNzPByppYkyqkx64GmWyW7mvOIWHG9hEBYSUwBaKuF90bwV5Q1?=
 =?us-ascii?Q?iYKf3qqEXZpLI5EEEmeUp7WVj/FzuE9dB0X/iPWBrW+cOxFHL34pymB+Mqte?=
 =?us-ascii?Q?AaPXDCh3FIMY/4aIicGQamLWzs5zTg9L+qY94Sg6Vh1o/Flrdkk0dhqLs1Lm?=
 =?us-ascii?Q?jtOoT/IsIqcLa+lkSDBXP59jtI59z3tjhGZG+mDmKPyf+prYRG2BZVdQAd21?=
 =?us-ascii?Q?rXOuJSj2kJfoWJ6a5aezf9ivQwCo/Nb6WNc/J5o4IuKfc4ZoaDKUu0jZwY1P?=
 =?us-ascii?Q?Ec5a6gSZ8WBmMHLBVgPyCTOeHToDKCOVH7xJQ6QhgKk45FjGlkQhDeZzirvS?=
 =?us-ascii?Q?xy1ONw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 435d6eaa-9f93-4524-6746-08d9f8b89f9b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 23:43:30.2422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdWja6jM6JzqitplVgMMxLzCXaM5CS5wuDDUZO/ugkr3dMIAgkw7zwr6MgMkOvP+HQWLRKDy6F5BI0BNi4yMMKcFBedt0pCYLns8OB9F8VQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4172
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::72e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::72e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Finally, that's a proposal for new interface for filter insertion, which
provides generic way for inserting between different block graph nodes,
like BDS nodes, block exports and block devices.

v3: - add transaction support
    - add test, that shows transactional filter insertion in different
      cases
    - drop RFC mark. I think it's now close to be a good solution. And
      anyway, no comments on "RFC v2" version :) Still, I want to keep
      x- prefix for now, just because there were too many different
      ideas on this topic.

Vladimir Sementsov-Ogievskiy (11):
  block-backend: blk_root(): drop const specifier on return type
  block/export: add blk_by_export_id()
  block: make bdrv_find_child() function public
  block: bdrv_replace_child_bs(): move to external transaction
  qapi: add x-blockdev-replace command
  qapi: add x-blockdev-replace transaction action
  block: bdrv_get_xdbg_block_graph(): report export ids
  iotests.py: qemu_img_create: use imgfmt by default
  iotests.py: introduce VM.assert_edges_list() method
  iotests.py: add VM.qmp_check() helper
  iotests: add filter-insertion

 qapi/block-core.json                          |  62 +++++
 qapi/transaction.json                         |  14 +-
 include/block/block.h                         |   2 +-
 include/block/block_int.h                     |   1 +
 include/block/export.h                        |   1 +
 include/sysemu/block-backend.h                |   3 +-
 block.c                                       |  59 ++--
 block/block-backend.c                         |  10 +-
 block/export/export.c                         |  31 +++
 blockdev.c                                    | 113 +++++++-
 stubs/blk-by-qdev-id.c                        |   9 +
 stubs/blk-exp-find-by-blk.c                   |   9 +
 stubs/meson.build                             |   2 +
 tests/qemu-iotests/iotests.py                 |  23 ++
 tests/qemu-iotests/tests/filter-insertion     | 253 ++++++++++++++++++
 tests/qemu-iotests/tests/filter-insertion.out |   5 +
 16 files changed, 563 insertions(+), 34 deletions(-)
 create mode 100644 stubs/blk-by-qdev-id.c
 create mode 100644 stubs/blk-exp-find-by-blk.c
 create mode 100755 tests/qemu-iotests/tests/filter-insertion
 create mode 100644 tests/qemu-iotests/tests/filter-insertion.out

-- 
2.31.1


