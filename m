Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AA7600832
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 09:58:12 +0200 (CEST)
Received: from localhost ([::1]:43522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okL0m-0004S5-2G
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 03:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1okKd9-00086T-S4
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:33:53 -0400
Received: from mail-vi1eur03on20712.outbound.protection.outlook.com
 ([2a01:111:f400:fe1b::712]:45774
 helo=EUR03-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1okKd6-00029o-KY
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:33:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/435xY4cQzD8asLbZX06jxFy9qLvxThv1z5VZCh/mcXXq5jNiQStDol7tDmV0KWV2QiXk0vf27soKfsw1yeos+Rkk39TM33R7WGheYjttnl2xwBgzDbDOluFdLZU8UIVYGMi/Dnvg42u9YIrFIZ4AhcByVO3girRS5zIv15hjYWA+wpqaWsFgHOPNaSYCZkaOu79kj0N6JpXFpWm6D2GnYH+jHARSHkFcfVExSwdT9QJPnLmd9/4jztIhHVw/ayN+Z6RprZEEY8PTLxSq0zWbywzcnf2Hm8ewigDVBihm+kUqZg/p3R9ZZGlMYYoLdvnvKlb9Qz2fMxXBqX87OMsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDgFxlHu3tTZq1W0DmzXFYX+CvAiLxpvQeQbsn/Ns8Y=;
 b=cZX0RBKEyuBQ3dsw2/qF7+OyZR5Dceg3oUNpbrNTN1Hrm0eD4aKIlqUnpIHanO1WxhKhsi7Kgd70U4ILLwszawVHmY/9/54QOB8qH4NpBdvgE8NrgN6T7hUOw4gu0CiYouQGTW+VP4S88K6U1gZrwmhNnkCNApQMywGGSg/uAP4Kp356yU6YUGcjb2d7hQN5y1XAh2idBoVJn3LJto+Fmf+6wnXCfrfgT2Cvzl/D6D/KgBWmkq1l9C6j166QNlqL0NfRW+GIQuHPGZ0gA6jVskVq1iy4s7uKxkKTjxKr66nrh9xNL85vgdlTXomPK2pZ24eCwdpat0UhD6lpReoggQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDgFxlHu3tTZq1W0DmzXFYX+CvAiLxpvQeQbsn/Ns8Y=;
 b=mDeOxTG8+gbUEHL+XUfWttJ5cbyATu4e2NeiftDyaOOQal7Qnp75s+X8bowbWCTwBV9onuImJFykDR0IoOR1JUGqvXVBs/KPQvZt5mn8Lo99S4L8PTLI9jJRbYpCxaORPEI3Tpdm3wF2WyYUgGw6V393jqF64uKbhkdU5vtxern/ykIDhsflzR531GV6nrl5vcma/gyfsx56h6bH22PWIW4PHdCde1LLxFVb5tEyHC+YEu7zHa4kf1aA0AC5IwL+uHU0VqGU/KMKC/4ZXF4XlUMFZ66y/pVcBpLrYV5IXKpl140FLrdu3ejOOwxjyD/qNGFVANL6uZh1SKJyqjhQTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS2PR08MB8286.eurprd08.prod.outlook.com (2603:10a6:20b:555::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 07:28:37 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.040; Mon, 17 Oct 2022
 07:28:36 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v5 0/7] qga: Add FreeBSD support
Date: Mon, 17 Oct 2022 09:28:18 +0200
Message-Id: <20221017072825.72867-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::12) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AS2PR08MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: a21a9870-c9d1-40ce-42bb-08dab0113465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rgprKjv3uEDwnyrqxqjb+FhO5ImyVwQgSGl+FKcW0qEzSBDeYfFyE1Dgup73SKp2SXiPZiHE8Ort44UHtF3Zy0fV2XnrdRIbZ2F2I4WB0EDfFhhGsD/3MKSWJiDsUqzJYrqkzGEA5MmQ/WKRBybDr8U5jYmZcLeGMzEIw4Ry/U+eX/5WELQSvGMCzSkDsyCC43b8lhHeq3oGdvf8UWg3ch+rTiYgwok0hGJmm/U52lADORYnZXor4VjLK9Ktwke2PIEKTF3jj6R6w2Tx1cP/EMsKUJdwy86BaQgeXIuFxQC4wYzXyJNzj72u0Fh/ViLTHQuW7JJOk5lp4y4g0LsTezBYMWFvqNy8/oc+OZyfSgXpDEJPNok/RTpI3IKEkqjb3Acj1HQUrT2b2MZ7w2tP/UCk32jEnKecVARNIRAiCrOnP55cg8o+Kn3ZtasmRdqDV/fdEK2mWsr5YDdpuMCWe0/Ao7HyEnPktsUGHYqoJpp0W1J7hHYzLEedocPlsDd70tR0yUsFb65MEu58WRIg+VfXbIextytP1HD1E/1cqogiYTyZk4EYaztHl8FuEk2Ls5EPY/GC8W0RYIep6iEdUJlhEus0aNpyywW3Gmo1llUd6KFTA3pdCBEEwHGai967Fu6BZMM1JLF9CGToehFy2LWmvmd1CDfhSBWxU1vAWCpGOznT45jeCLv9MINZJsSL1CBgbNGcDMVRMErZD3AFd54gLr646lEWgqQrGMMnOlNluNBFkD/S/uG7Dhgd82At
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39850400004)(396003)(366004)(451199015)(6916009)(66946007)(8676002)(66476007)(6666004)(66556008)(36756003)(6506007)(41300700001)(4326008)(5660300002)(316002)(26005)(6512007)(86362001)(8936002)(83380400001)(2906002)(2616005)(38100700002)(52116002)(186003)(1076003)(38350700002)(478600001)(6486002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFROVUVCb2l3Q0lBZGpGNExBd2I2b2xzaEdjNitDU3AwM0V3Z2xDMWtyM2xH?=
 =?utf-8?B?VDNuNDliSmFQclRaSnJsSW5KUTBMVDdUQXdtUG1NZkdMeUVhalBIYjF2bWlX?=
 =?utf-8?B?QUFLSW91ZU1RelRCMGxoNFBTZkZhZ0hPaEdVL3FkZWE4ZzM2WlBzZEx1K3ls?=
 =?utf-8?B?YXJvd2R2SzVGL2U4MjdGMmRHTVR2NVNHdGw0VjNDSCtBSk02dWQwMUpJV0Fx?=
 =?utf-8?B?YW1iZjVKdE0vWStheTZkb2xOZitYYmtUNmJaSlpJK3ZjM2FkWlRwRFBPUndp?=
 =?utf-8?B?OU12UDBNMHdVWW14SWJaMC9hNkt5anI5QUVuT2NQTDUydlVHMlNCbnlGRlFL?=
 =?utf-8?B?RlQ2ZldqVCtzSDJjNHNMQmpmNjJJb0lGUXBqT3ZoTFRqTlZGOEE4cHZhYm9Y?=
 =?utf-8?B?dzFkazZ1SEdQbFQxTnpVV3NySWk3NXlGc203K1duNFBTTWsxS2tNVGxZQWpI?=
 =?utf-8?B?TVI5VDJDQTdDZW1FUjlRN0ZERUpuUThKVm5lTnVySUhkbStCWUlveDQ5Q1VS?=
 =?utf-8?B?bGw0V2VuVXZhem1RZ3RyMnVBRG85V2ZZMXBSTzEwQ2FOcDN2T0FzTU81VHho?=
 =?utf-8?B?NWQvSEZmNnJXY21GN1N4RWFTT0xwNUM4Z0lkbFdOTTljRmZ3UTdJdlNNTGFS?=
 =?utf-8?B?Mzd0akN6U2lrMG9Vb3FYamN4M2VGU3VwNVZJdUdGaXFVVGh2Q1kvQ3Q2QnU4?=
 =?utf-8?B?aTBndmV2Mnl0RjFvS2FiT0FlY1hWaFdkMk5WM0VQQVVpeFpqSzB1N2E2c0Vz?=
 =?utf-8?B?aURWbTJHbDlhTjYzQ1dQT0hteXpjbGZKQ1R6SjVTckh6TjhMK3E0ak1MeXdX?=
 =?utf-8?B?R1NhazJydVFEUDBKOTdId05BcHpIcWZ5V2FDWGhJRWpiWk1IM1hNd3VGbWhp?=
 =?utf-8?B?b1dFRTBEenF0TllhdFdjU25NK2gxaGtMd25ZcVJ5d3E2cEs2QmRXUWNUd1dv?=
 =?utf-8?B?d24yQUV0dk5ZZFdkYWR4K0xKSGQybGZONlNRd2JSSVFCYzFBK3B1SXBJbU9t?=
 =?utf-8?B?cG5KdFlwbW1EdGszZVZNSXdmV2QrM1MzTCtxRk4wVzFHeklHWCswNTc4K0lH?=
 =?utf-8?B?a2Z2UUR5aUVOQ2daV09SODRaWU5iWTc2UFZnZnNMQ3c2WGFxWkQxYStBaS9R?=
 =?utf-8?B?U1ZyVks2VlJ4d0h0WldYOVliZU03bnp1dXkxbUZHRjljY0Z6UTU3ekU4ZWRD?=
 =?utf-8?B?MjRlWFZSOFl3WHlhcjIyKzlRYjNKNEpybitKWnFhSEdKNkxIdzFXSmo5b2NG?=
 =?utf-8?B?MWpZOEpIelRGREVqdXRyb2NVdURUWnBCcFhucXhFMnNoZHgxT05aeE14VGlT?=
 =?utf-8?B?enBxRVltYTRCV01IS2x1eVpnOGY0dEZKNVVBRVl4TnN1dys5QzBGZjI0ZXZj?=
 =?utf-8?B?MHdIcXZJb1UzNUlwY1V6YnZlT0s1R2g2aFpEM2tKRGp1cEhVenAwMnVaaTFF?=
 =?utf-8?B?VUdGMWNJM0tuL0w2QTcwM0UzUkswb3NjbGplbUU2NGZGaG9WQmhLZDNVR0Zm?=
 =?utf-8?B?RThaa2dkcGF3NmR5QmhYUDg4L1IrSlVyVnlZNGxocUQwcEVwNURHc3VaQW9s?=
 =?utf-8?B?R2dWWGY0MUg0aWlpeEt5UW1aWlA3L3FHOEdIYXNrOGdBbFI1OTI3V2l3UXd3?=
 =?utf-8?B?UUFYVHAyS1ZTZFNwLzYrU0E4MmdqSXhwem9WWHF6VVc0ZzJzQ1QrZTdTZXRp?=
 =?utf-8?B?M3V5TUROMmhWdVVtdnNlSks1aXZCQ1lPdWZhUVdsTkl6WGxyU2kra2o5bTV5?=
 =?utf-8?B?NU1ZWDhXZjNuVnBzRmhaeG12REFXUTZHcE5USVBZenExMjhndVUxemxucisv?=
 =?utf-8?B?ZSs1SDFQS3BaZlBiRXpFV0JnSkduNzliTzlzSnBsRDdlL212MEt0UHhWZGVo?=
 =?utf-8?B?dm5JM0FiVUMyRGpaZTViaERVdWdZeEt5d3hmOUFuVEJiV3UxUWZSRDNVbDFa?=
 =?utf-8?B?ZWMzQ09wWGJOYkxNeHlNbmowM3k3dHNYZSt5VlVYWGx1aXdQNDE0RGl2Zm1F?=
 =?utf-8?B?djFQL1lYNDJKL29TUElxRXJUK2RJU0VyYTJHem1NSTFuOGdIQTl0aXl6T3lE?=
 =?utf-8?B?M1NpS3lRTGlsRUNKclZocFJQQ2VvVDlWcmhUcjNqcjFoK2xqSWtzUjVydWdO?=
 =?utf-8?B?TGhMSkRJbSs5Sm9IeTN3VGNhaWNzNGlPMkVMMnU4bW1nSGNNbFprSXFtc2Y1?=
 =?utf-8?B?QVE9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a21a9870-c9d1-40ce-42bb-08dab0113465
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 07:28:36.8205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5AVmTUlLDh+DJf1ZtvVqnh7J8lDFmWOCwiHE10/t/7WMMp0YNmVtUuWFoRER+E+Zx2o4r9em8vzJkLSP/3Yi5z1A3zxpibclALLQPI4l2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8286
Received-SPF: pass client-ip=2a01:111:f400:fe1b::712;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-VI1-obe.outbound.protection.outlook.com
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

v5:
2: Left ga_wait_child() static in commands-posix.c.

v4:
6,7: Return bool instead int in guest_get_hw_addr().

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
 qga/commands-bsd.c    | 200 +++++++++++++
 qga/commands-common.h |  51 ++++
 qga/commands-linux.c  | 286 +++++++++++++++++++
 qga/commands-posix.c  | 639 ++++++++++++++----------------------------
 qga/main.c            |  13 +-
 qga/meson.build       |   6 +
 8 files changed, 778 insertions(+), 438 deletions(-)
 create mode 100644 qga/commands-bsd.c
 create mode 100644 qga/commands-linux.c

-- 
2.34.1


