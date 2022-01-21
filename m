Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085174962DC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 17:34:33 +0100 (CET)
Received: from localhost ([::1]:50638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwrv-00026D-Ea
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 11:34:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nAwmt-0007k5-M3
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:29:19 -0500
Received: from mail-eopbgr50099.outbound.protection.outlook.com
 ([40.107.5.99]:41392 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nAwms-0000K1-1R
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:29:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgtvHV1ccF3RncvvnammwlykKgQ56VlEEzThSnNpC7uINMiRO0e5RIt5fzj13juLDzrAeBSusr1v8UsIQRFHQ3zPWANYqMiBlpJgjrKdHkdDZTqlhVw6PCzbNPVBrjf4cYdB0ZtXLBvyzJOKEDUMSvb5fvEkAhr8vLdPSpVleInmLQAzgRDh69pxc+i44cYRlGotG+pVHA0hiGIVDVuHCTspHZOnd7D670NRONW0o2sY6Vi60wBMnp8JwmSGViNURmdDvNMdhoH84PREgVVDAqJda1iij2/NkZ0sJy9QXvk2mUjPIqFru3fAENhWn7yyFT0iBSTYPafJwXLkIavgHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVmOjqjGeIEn6B0TpU0M/qpcdKpK/CNW86EF0pnAixc=;
 b=lywAZJmBPFSpzzrEgrTIMiVujnXYgGT300UeqlMdiZ4UyYx4TVjLc0q0YOGUYs30T3YOu3rbzOIprN1lleDrsjQ99VZnh/AOGzwgW14fsJJ/yC2awdtdKG+RvMbikMx5d6UtASRM5uTARkB7ciXgzW1fy14RpxyR9oJaRd2Bla2E4z88jXzTBVnEXgRSsNmOr+ZJuCG/e/tjdRNcRckAoHCx7WuDox9OWDnz7EPTJDtFBMjKnOw/AYRHxnd21XQ6V14S/OGjlXN1g6dapxXB/dAikXWOzBQtgQ/MYGz0UnTg1pG+HCCuXMCxnshozOGp5mbTYs+orJUb1XNH2JMDEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVmOjqjGeIEn6B0TpU0M/qpcdKpK/CNW86EF0pnAixc=;
 b=YDEuXi42lqze20oRJA3XfOPlzm84jvifvHsqKXC0xJ5boMLKI/a3+j9eegAUQ5hjUpbMOPuwQy+7icHWgh3r1LWAITGxv3FcKHWQIKGPwAwPq7WFO22yf8UfC87F7dYBizmRCFbUl2/McbKWAjqW/aMvFspnPmgGxm42SIh+gVI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM6PR08MB4006.eurprd08.prod.outlook.com (2603:10a6:20b:a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 16:22:46 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.012; Fri, 21 Jan 2022
 16:22:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 0/3] trace qmp commands
Date: Fri, 21 Jan 2022 17:22:31 +0100
Message-Id: <20220121162234.2707906-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0402CA0016.eurprd04.prod.outlook.com
 (2603:10a6:203:90::26) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e321aba6-9029-42e6-8be4-08d9dcfa420b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4006:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB40066928290320ECA470949CC15B9@AM6PR08MB4006.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U/fGBNr3eURpPeWRdn+5qzh1xE3ajKZrUUqA9LIJYiCIa2Br8j66ZD0cmQHMEVq1aUGMDGZybdtEeCDqIs+2FlWA9pMmTQlf7/QpJ2+WYc7C8tBO2nGE6rSWPAJuG7PY/vga8aMso0obM27EDfK0wFmCUkXhXDZPeLukK1MA3CsuaUqtIbB5YBEjuqggw27q8WeC/oTEPV3dpQKdpgyLeGHk0la2owZEsPnCg5XErFSjTP8dP8iPVx3GzMMk+/PL3mu/1yPlOQjpHR2daB3g8wPzAR3/Ywk77kATBBVxiEm95mOdgQoh7SmFFGttLj9Y2W6df5rszagaJZhs6PNoh53amXHAqee9L6+m8xh/JqCM5Rf9OvdnNJN9k/iC/zdB04gng5QT7wyk556ih0pMwaCcKgsiyY9oh672flfQy3wnFR0mlCwZJvkDDfrgT8dblUUa7hXoIbK9lVbuxuw4Qa8RWXJGrDRbFt97ErXnDjdwMNThb8KD1ngQVjvlEtPpHAt4SMzRkT6lJGscIARcEohRVWzSvBSlqfOU7BP4QDnec1tfX+S9rdgYRMF/lu1T4VB8B5j4xueDWYCZ1Y9EhH3PIczhAg4P42L1nwkx8exQT3TQjIFouoxtKh4HeTWCjZXQOfDd3AY9bCusoz+sZ642PwU8Kv75ShcyrATw9uFmdKhcFx2fxmBHKEP70Lhtf7MFJN5GJW8tbLDzYczzqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(6916009)(2616005)(2906002)(6486002)(6512007)(316002)(8676002)(186003)(8936002)(26005)(508600001)(66946007)(66556008)(66476007)(4326008)(83380400001)(6666004)(5660300002)(38100700002)(38350700002)(86362001)(6506007)(1076003)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2uXTTnKz5/GPUeOFey23jYw75+lOulVByRPZu4eKHH6tQF6tOP5ExoeyuigY?=
 =?us-ascii?Q?nkBpH5VqfVp/MoutbtATWPOYNESkWcwm8xjf2pgchT82McEWYlLrpuQnwsAa?=
 =?us-ascii?Q?f2OJqkipGRQSxighGPvgLiK606KQuhiF92Z9A6cvG9LP+Id8kg4SXzZyhkFH?=
 =?us-ascii?Q?VfztwSL+TWYhUXoe/0oB7WNiJpLzFVGVEfguvohKtaSdjy4A8lHGayfxJvLK?=
 =?us-ascii?Q?lFbK823tmJh3Gr0RRzaoxKuJ7zhvQYMCE/O93gaT07VncHfy/hMyqmwFVBO+?=
 =?us-ascii?Q?MKo/SjWdBzZc+nMxccKQuiRRuAekR27marmWkZN5AuCUXwkgdbwIqbVULbhU?=
 =?us-ascii?Q?1/a5b+CtSp7M5zV44dicYL/OQ9IBb+dqYZsJLji205iGBg8ShyKUzAabhRuH?=
 =?us-ascii?Q?saAk3RwSr9gVDrcE7V4jl7DL2QVioVW/IbZ+WnW5/DHziCtrZm6aOb5o2rYj?=
 =?us-ascii?Q?RvL+lSNRpm1iZ3/A8lbszLaPwMoZDkkLyxcCu2+hgWjn/VkSDwzRBtEuCkcy?=
 =?us-ascii?Q?8T1jybh2Oolfod+jPlIe68y7GSN/pkOWBnwfWwB0STPYYIvthCem2SDcykd0?=
 =?us-ascii?Q?5OXUgZp18bF3jF/uOvu3yuJtRnIAR2l3Ib0taX7TO3zaChgCP/i8SGyRSOu0?=
 =?us-ascii?Q?btwZPAvQRw8nEsmWr4AwjixeWSYLSPYQhYUvzubf4oMrHQ6bwRONK7Amt3sq?=
 =?us-ascii?Q?0ZSnrnIJmi3dHEkYtP5ziQzSUEJhXVUPgSCHsl7HLYY90PLXj0FAlm8pqvot?=
 =?us-ascii?Q?cZjBwH0MGh2HtnVVe3iHDiWJs2qOp5TrV+yHhvVfcxz4ppCOsd0YS57P0ABS?=
 =?us-ascii?Q?k+38ngDOJK4PljJ+VlJRovot1F1f6bgDbkTuoPFlhfiHTN9kMAauDHuBoTaa?=
 =?us-ascii?Q?kMgEq2GLD9BUTmG4PjKF0o1bhD87xwFwbzQasmI5MAIB00iBsKiJSLKJ4jh+?=
 =?us-ascii?Q?vpD32mPR6iZ4A8c/sv1CBoClZpyp9I/+WdgZcsmh6oan2FRxqmT30EtZgF8J?=
 =?us-ascii?Q?LZaqBbN9cuxaLyt5xphUT5dz88KmEvGTldUGIjfuMm6QsXYLJRohf2iKUklh?=
 =?us-ascii?Q?64uO3d72Zaz3XljYIsvvZ98Cw0C7/FAtLCowEghjelEsVgna1QA4pvETHovK?=
 =?us-ascii?Q?T811SEOVxJuqpbc8MT4fvivTZhXnsIe+4bKsoX/MQNKTLIjhGCJ2OZG50IxD?=
 =?us-ascii?Q?gBZfUQx9LWgYiqE1ZMsxWPO4+II/W0hUX+b9l7Ay8gnCUAEUHGu58fBGQoy0?=
 =?us-ascii?Q?VRw3/WyVrMH8a+GP4UN1qttUhU53PPmbLqkeSJTYnrAbUR8sI09ynbb9uQRO?=
 =?us-ascii?Q?QPzaintCopCndRlFt1ooUJwBTyRDli8gLjCLtcE1eHJpa3P3xhxV9N2IQkAl?=
 =?us-ascii?Q?ZhaY+0+XV7vb8sPLELemEOcQ/cgZ/6ORJ9D1ohGk0vtpMZTtqJSMnpvwWixw?=
 =?us-ascii?Q?+kDBX3sO24+3fCjhq4j3GHacc5VzaI++lKq3CfIJxjPrvmplnJtlqpZetCWP?=
 =?us-ascii?Q?7vHRuWcGWzKq6dV23cIidTT70qyUB7ZUS3uKkue1GO3SirHuf7u0pcKDjxSK?=
 =?us-ascii?Q?qCmJPtgsZdnsqw9pIEe6uESUCWwq2tQrI1F7m9scG3kYV+7NJRsI36jpNv2j?=
 =?us-ascii?Q?AIeWYkvOd+tkrYwefGxOGkK2LO1+r1KEjoTHN29cnk5g8CWZ5zJl6uyEbtse?=
 =?us-ascii?Q?Vh9pQg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e321aba6-9029-42e6-8be4-08d9dcfa420b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 16:22:45.9654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxhwdveA6L/sDtKHbliPYlMLxD39AfYWgQtsWY/be3CW2GBCFE0tqBXnDPpLihaC/yAQxNnnQwWKtdT+j/7y+pYIRP6l0M0uP7/csibP/NM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4006
Received-SPF: pass client-ip=40.107.5.99;
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

Hi all!

This series aims to add trace points for each qmp command with help of
qapi code generator.

v4:

01: - better commit message
    - add QAPIGenTrace subclass of QAPIGen with _top()
    - make trace module optional: we need it only for commands, not for
      other QAPI targets (like events). Avoid creating a lot of extera
      .trace-events files.

02: - As we want to generate traces by default, in this patch we only
      update gen_commands() function.
    - fix style
    - add comment about c_name usage, add protect=False

03: - Now option disables trace generation, so option is added in this
      patch
    - Update documentation
    - Update comment on qapi / trace sequence


Vladimir Sementsov-Ogievskiy (3):
  scripts/qapi/gen.py: add FOO.trace-events output module
  scripts/qapi/commands: gen_commands(): add add_trace_events arg
  meson: generate trace events for qmp commands

 docs/devel/qapi-code-gen.rst |  23 +++++++-
 meson.build                  |   3 ++
 qapi/meson.build             |   7 +++
 qga/meson.build              |  11 +++-
 scripts/qapi/commands.py     | 101 ++++++++++++++++++++++++++++++-----
 scripts/qapi/gen.py          |  31 +++++++++--
 scripts/qapi/main.py         |  10 ++--
 tests/meson.build            |  11 +++-
 trace/meson.build            |  11 ++--
 9 files changed, 180 insertions(+), 28 deletions(-)

-- 
2.31.1


