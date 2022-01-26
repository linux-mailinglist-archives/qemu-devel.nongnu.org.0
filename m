Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB8049CF56
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:16:34 +0100 (CET)
Received: from localhost ([::1]:35436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCkyF-0005Cy-Nw
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:16:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCkts-0001wf-NX
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:12:00 -0500
Received: from [2a01:111:f400:7d00::70c] (port=30528
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCktp-0000NL-3h
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:12:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CR4S35KY+rKMDUNqKNAXenJLpfi12K0HqfWFRWZnVWEzUxW7Mn0UwiBYdNjcsBiQpSlmESaczzJWq485GbytNr9LxRHSGmkb0KAKshqVvvg4+CFJFCnMCyQP5WSpr3Uyt6fPb6bdKZLju3nV4GIbHHprsGx7XORDU0HyuEBf6F2/ZUhrpGoE/zx52+3jvMJN7dLeX9Dz3kN2hi98KpWpyvaPWlLuMs09t9NTDgZ14ArkfPdNCWpuc3OwJrX95TfoNM14UK5ohH1p4OIphPqsFVHbaDSK0DhkCsZ0jK9nAWSaRj7qluPQFSPOZMCBRLcHSqfVtFUbCAyiCbYEG8qk2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvlbzGtLIknpHlF6daVof3YKgJke2rlghWtzP+Fx8ls=;
 b=kDuM4MCNO1Bilc3+wVbQR8udz9O5ic85pqvAjPPeYuBof3ftjxQFWb5+RloytJut7XnKVx6JsCfwmj1bZsgYlRKQXvZBRNS+WO8D8xl1IAmgfnjcRhKz41CYVhQUujPU3YiUcmaaGePzAN2oKRU4Uy98E5f8O1gjG5GbydIrTRCOCOPNMjzOHjkRNQt2Qy/Bm8ltmWAAkh618np8Y/WfRa2H3utUAn3eGejKTRyfa/ru9UAKwzEmQFvtg8jDzWkm+rBnpx1KIHts8V/BB9TqL5BLo1FYP2D7m9h+kIbXe3CrOPCHQMUhhcjx59NQsyS/j2oSIQfDy1Tc8gi7k1Rjaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvlbzGtLIknpHlF6daVof3YKgJke2rlghWtzP+Fx8ls=;
 b=AQGPXRP1RLuvOgdLfSAJNzozjaEmKiFjw2rkQ/eEssnPPD4kKGzndEA0kY7DpbCVa943H6chVy9Kvk4wBtQGI6qkri0pzR044+iV/gOBP6KRNMjX59cRJDWVqKKvPYO/X1CNcdpMofmQLpnrh1kXFE1/FBE26YS/GNsuRW7btQs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:11:39 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Wed, 26 Jan 2022
 16:11:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v6 0/7] trace qmp commands
Date: Wed, 26 Jan 2022 17:11:23 +0100
Message-Id: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2e805a7-80dc-44f0-8c05-08d9e0e688ce
X-MS-TrafficTypeDiagnostic: PR3PR08MB5868:EE_
X-Microsoft-Antispam-PRVS: <PR3PR08MB58683CAAE9BFC83192F0428AC1209@PR3PR08MB5868.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:309;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wt+ikIa05+lju/YjNpM+Ul+aljoMIuOIjWkRkl663SsutdN+y5TXFVDcIFSlZBospAhsd9jUJ6HlfBRPseB5a0AnI2OPkCeCPSzcvmmynJkm1sV/hyodO4PuzBAk1gUu9eZjd8QmwT6Jl4O/q0xW+A2OpRahz/IGBAiUH9m/+DYlP0o0JsZwyk+7GhkCxR2TMoodoqgmpqJdbcV1B4yyYQVNCG1ZtGyVm4H8QJdSafjDcvTROg8r2CFb9qmyj9W//hCirlLc2Jwsi39dZjTXsZNs6QuVo9SIuKO/PhC3ntbrUyy8dER14KpeRc9hJO/dCpeglxZY1KLUd95MYgqvY8MRJ0/6VAdzM2JtfDuRcGjuwxd3+/iw/9l/XEvmTUxQk+cPAzlGjaopXLN5ggTIeSnvwfo68vclzdAjK4PupTOeJCSvMl1JCRex7svvMiQqEncy7xjQJT+n41NhTVM9SqpVaEoTU3TNfqIxL/P79XQhOHQX/Kevt8/DPAitVl2G7sowQGtEjxU0mVYY8BmwTrWQ8arCuO84hyvVK/waFunhMgJsS7j2nS4tvOZ63YxRKgLzn1uprdNuM4I3I4aVsE0kPUZuKwY69yc4gfHWB7cNZ8l/ph47M3LoBymUKjRxUinMEMjbELhB6B8Ohh66pD3NzmZ68ovoXjnHGQI4UoC/q4ofvaJBGbWHPQAwUBIHKAeTj8bfkF0fINUWHqzRmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(66476007)(83380400001)(8936002)(6916009)(4326008)(8676002)(26005)(38350700002)(86362001)(186003)(38100700002)(1076003)(36756003)(2616005)(6486002)(2906002)(66946007)(6512007)(66556008)(508600001)(6506007)(52116002)(6666004)(5660300002)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yMgV34nE2sdbVM4qO2XM5C2c/bz9ubFSnWUDlU4fcvSTvS5XicUAv9kgriO+?=
 =?us-ascii?Q?m1V6KIszGOXR42bNDnIM10gNctyau1CvXBb6/2iDR7JjHNuN1dMzInp/Joa+?=
 =?us-ascii?Q?3SBnYZNQ9zxmVpdh3IqaPyAAFsVvGP0t/OKoYowl5LldJJu+1URPN54YDEJ1?=
 =?us-ascii?Q?KSv9QahzAZLCKoY6Bjr33fc5OBW+HPuRyPuAmZS1f3RRlaJJFahzfEsH/6l7?=
 =?us-ascii?Q?4FTPIdxEpbBIZysSvwqbhIiOiWdFfilLOejmle0UzVxp5xtsVgvTDxtAPvt/?=
 =?us-ascii?Q?SwZZVo3BYM4aph98YzIisLeBz2mhJmctrL+2Mq5b1g2K5pQxSXYKrqK8jtcN?=
 =?us-ascii?Q?yjE7/nFgHGgrTau7VBEhkvO0BqCbcWUGUUa6yIQeClrheIvOuVUfB91jnEis?=
 =?us-ascii?Q?zwBllPwINXdGfAZhlGq1+n7s5LHx2s/dR5wvcZKSWXdZf8uNGVIxISRu+bMT?=
 =?us-ascii?Q?TXxG7kU4e4dGM0Z9HITC0fCA4B7zAjAfDrg+UPxzHxpFapRzaCpgu6OFdDmk?=
 =?us-ascii?Q?yi9zCWB8KKYO0g+6R6a9JTqRGUy+8diYUBZ/lbu4rdhUdc2y7h0jedHJVXa0?=
 =?us-ascii?Q?YyUMktwRG3b4UXa66vg8LYJK5K1r0yM63ntuRCFbkzs9e7TOKmzBHLb2/ImX?=
 =?us-ascii?Q?7t87nlRWvgPPUXvM8pu6YN769t5v2VdJJqaOgR3i2GxWZqecgSV+bv2Jiv6T?=
 =?us-ascii?Q?KaNxjjIulrGiTqsfNg7KnO0ndJY5HqKAA3aSA5alM8w+PN8fZ4uwagpFiPx5?=
 =?us-ascii?Q?Wx5HeNPnckjQk13wwFxYm0Wk670fZgndHGVle+85pgWt6jvewBQecPNC2PyN?=
 =?us-ascii?Q?PChjTCmd1qnFb7kQlJbKe6TsCCAShLwQgy+YmmfKj2VCPj48pQWVv3pi/imL?=
 =?us-ascii?Q?oQ7BWlInbtfj3wytVUiDqH3AEyvc2T1JvWK51aRR1lOEA65QC2Ku+g0fi2kO?=
 =?us-ascii?Q?pnYPqQ1dX9d/Sfr8LFEbZ8tbvC2zJiRp0pgV6wejt4oThFxglaxHzWxWh4Sc?=
 =?us-ascii?Q?PhbaiHrIjMfrZXWAEo91mKQmqyIPrgjZaGYqXhukgYfVKQgkvLGfS9i7DyBf?=
 =?us-ascii?Q?EqKw7A4Rr6kyzf9YeS4eBzzrFA3MvYxd/gS55aLUMnqmUb4Ru1YyolaGbve2?=
 =?us-ascii?Q?rsw4zfvYkaG1tHIuDiGnyrpCVClbT4XvGHX0qc4ng+UjI4e0TLdvWu0osOA0?=
 =?us-ascii?Q?Z3pjh1yVeJOA+jWzqQSCUQWFtmO19H7768xN6zfNMNOZ9ay62WaehiTXyew5?=
 =?us-ascii?Q?8QxI2oomtKrkdR3x2NxdO4uNgDMUqJu2JKzIz3rQH1A3KdHDcX2tdlkXJQaJ?=
 =?us-ascii?Q?pUwjgeVq+GS0wMsZmfbineLUEIiNOceWPZYMrmnHXF5NLR5tUtk7OJhSL6QY?=
 =?us-ascii?Q?Ch+MkaHqVR9q5Ibu/KGvWNVlszUZtrm0tXsMTONElG5cDqNVl5oEDeZPgz8E?=
 =?us-ascii?Q?YJYehVuW/J2YNI4ThB5KD6o1kJlkpebFLS8TIVP5Ally5ZTJqAsU/6JRUzti?=
 =?us-ascii?Q?i09D6RlLbWkog8Co8QOX5wMT/ky9D4V+4s99bjZbWmpMCAm9eYZapWGxu61O?=
 =?us-ascii?Q?7JVRi+4/I8u3rN8K2NccGct69KSotELgJSEe4nEP51F+PU9xF9CpQpmmHLkV?=
 =?us-ascii?Q?hJm+3jZRwGr4nho/K/s3s3plx4/YHZWSyfo/glTU2WlZEDfDklZeshd71PBB?=
 =?us-ascii?Q?O13ACA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e805a7-80dc-44f0-8c05-08d9e0e688ce
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:11:39.4785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rC0kfknC902aOhSM3g4nzjx5RHqD6IEsKwXB2ZylUgSdOzMwDrd8sqX1y7bqkJuBO0T5hFY/BFvqqF3gg6CdZk6++xd3vXeAJtb9lWUrmFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::70c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::70c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This series aims to add trace points for each qmp command with help of
qapi code generator.

v6:
01-04,07: add Stefan's r-b
01: - subject changed
    - rename:
       gen_trace_events --> gen_tracing
       _gen_trace_events --> _gen_tracing
       _gent() --> _gen_trace_events()
    - a bit more compact code for gent initializing
03: - rename:
       gen_trace_events --> gen_tracing
       _gen_trace_events --> _gen_tracing
04: fix --add-trace-events -> --gen-trace in commit message
05: - drop extra two sentences
    - reword
    - add example .trace-events file
06: reword
07: rename option to --suppress-tracing

Vladimir Sementsov-Ogievskiy (7):
  qapi/gen: Add FOO.trace-events output module
  qapi/commands: refactor error handling code
  qapi/commands: Optionally generate trace for QMP commands
  meson: generate trace events for qmp commands
  docs/qapi-code-gen: update to cover trace events code generation
  meson: document, why we don't generate trace events for tests/ and
    qga/
  qapi: generate trace events by default

 docs/devel/qapi-code-gen.rst |  25 ++++++++-
 meson.build                  |   3 ++
 qapi/meson.build             |   7 +++
 qga/meson.build              |  10 +++-
 scripts/qapi/commands.py     | 101 ++++++++++++++++++++++++++++++-----
 scripts/qapi/gen.py          |  31 +++++++++--
 scripts/qapi/main.py         |  14 +++--
 tests/meson.build            |  10 +++-
 trace/meson.build            |  11 ++--
 9 files changed, 185 insertions(+), 27 deletions(-)

-- 
2.31.1


