Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849E05E6628
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 16:50:10 +0200 (CEST)
Received: from localhost ([::1]:37374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obNWj-0001jT-G8
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 10:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1obMCh-0003pH-ER
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:25:26 -0400
Received: from mail-db3eur04on071d.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::71d]:10827
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1obMCb-0007zf-8m
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:25:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nk4YVk+b7deDKLsZUUhWefws89zzm8MuayCbQAVMP3E17DTa+oovaSzsyM+gUyp0eTtpaV/eJ3sQ6xl4yiI0BfnwAwxhX/yO4IwGD2/7DKydFJ6XnvXNVd4Y2/3qJIe44a9jXcDvStgl62FYfgzlWugN/QcWxoV4acoGRAa4MARxNKSnpPpagEMV7wa8QULKOQ7sJNMzP6bOKhm2cDjm6mkpuW2wv7CtW9JVd62wb6wBR/nn0q2hD/QaLfdupREPGpHzOGG9PR/Fz3P6KIndQMbki9uo9V9qRdUitOfZNrHzrkmTN3Zljnz1BYFFTQlmGYajZpsjtay5W0Aqu1o2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94GIL/qfBlAjidWqy/36Q6o1sx77qIRdw4S5CJDAL08=;
 b=R3VEhWPMAwLVAav5ek7cFPRbQfzTm5jkadf4t3U/hkAQBCnuD4kufYYD6xC0229zbsAOX6T/uqGnLS0HJDkhRIMea+4fd0jXxqVtUOTUZvoIeOobL/fCsdkx4buZbJ2Q6EcvKNgG0GCrLyZ1z99HHPIJe/lFHIikBmLQJreBWZGDK+gffwFHdMPXA8sRBxQ7DiqpfNeZgz+qg+NoP8pj0yJOY8Z0n1dUMcMMztBX2rA/QpUDEHyKg2C0VW7cWLThFsG85W9bG8FF34Npz/yGhSoaaKmKmoGl9YdqqJNib0cH03N3o05hnVBjD/Xutzb1e57XaikQMFAUQAUD8GsepA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94GIL/qfBlAjidWqy/36Q6o1sx77qIRdw4S5CJDAL08=;
 b=c9ZTGMxURRKIF5TfS23/B/JzVHSnERjd0Mmmzae/YD/XOQsOX7P8kULbU6jbYkYL/VDkAADlLyRw4Xsz1MjzTTULsg/t/eFwdiwZbKHXK37dRaw//61SrXV7Ut74Zp936ir49QQigkujW/1sHPr1U9dma0eImRLkBJ7VjdaIOdHvXdjgAgodxWSAERDFXVBVdXbGHYUTRSQZsCp1ullf9FtSCHdmBpr5XH1ptrCdHHQyNRFGnRPXWmOWPOc1dqeDVvMgR0a+LsqyErwySTFp6bgbw4lRqsiZd8+s2RK2TX0opNXEVoWjbC1QFze6lZn36BUL0wN417n6/gGYqUtq7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6480.eurprd08.prod.outlook.com (2603:10a6:102:155::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Thu, 22 Sep
 2022 13:20:10 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 13:20:10 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com,
	michael.roth@amd.com,
	kkostiuk@redhat.com
Subject: [PATCH 0/5] qga: Add FreeBSD support
Date: Thu, 22 Sep 2022 15:19:56 +0200
Message-Id: <20220922132001.940334-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PAXPR08MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: d1d01c6a-70b2-462b-1aae-08da9c9d2c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 16xYOAe7UanEs0k8elpB+/5bdWljmbNyv8NeQ4toquLVnqu+o9skYcvjyEFoybVQ28AgOMVULRFm0wwI7Avz9g/qyFM0D9hDejcnjSQXszMQ7fN/24MMBFMTPLzzFu24QoL/tpO9M8USpkjQhsi4V5b/BprEDBLho51EeaNJt+ZMWaA+Uqv1YS7v5XoYbaINirtUtus+4gapu5Pd27NdGSCpBZaoH7qit2r5vT8twTyEoHOeXawrYxK/ERlTZjaZH0AA+FteZkenP2cNB6dGX+HH6VW//koVkxuC1XP53z4pg52O/3MuV0csHUdECUSkhfxhR/ejJo7svqG8Wg0WhILG8D6sGZtPAOejECBDMqV5ZJ4p7xJlg5qrQpEfi9opcByNL+F7Za15M+liR1k2LTtWXGVr8sNHp+BEc2BX44qehI/g77thlpsAEs7/BO7SsbUs10AsX9encOtRIgiKSnECYsJZb8ebtEKt2LR6K4ucaXtElDMk8uVAeTFjTD2cqSC9sT8/QX1U4t9XDpJmit2UKL+uDKD4JPLek7ID1NSYyBWTnN7EiARit5RBEV0bnO86TrxuaFinRpxDcFEjmz6c43lKqy4A/4hxA8SvisslHqnFf+YK/kJVlE6u/rhURBE6j697pj1XsG5pDeIBEjPA7RiOsMw4aBJAm9JRjgOGp0DNgs6K5/jW0524MuO/JwcWhyv6T1jNqMmVfyS9CviXUkskQooyiIsOO93EoimQNReTThXCHr65W0bkVxfYQoFAIuGqNr7OO9GTujuIHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(451199015)(41300700001)(6486002)(478600001)(6666004)(52116002)(36756003)(66476007)(66556008)(316002)(186003)(66946007)(83380400001)(1076003)(5660300002)(2616005)(8936002)(26005)(6506007)(6916009)(86362001)(8676002)(44832011)(4744005)(4326008)(2906002)(6512007)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rq+lior5rfJX9Jd/Voz/hBaAdEzPAQz8MHIBm6PPSZGPMggjPZOaPNEXO3pI?=
 =?us-ascii?Q?EmwdmF646u1iNwh1EGUrAc8OZFTSeVd7Hh3hCob9M4+H6MvnlmeR5F5y8CHR?=
 =?us-ascii?Q?WYsYHGs3beqQa6tJe9GG3RGnjwm/1AEMm7ka5BdjwejGn1AJkRsaSsuiUgHY?=
 =?us-ascii?Q?CWSZQj3Qfk/CDo0pPU5sxofKWDt04w/xjCRUhGOb65/FuGXIKMYvOWD7ZaOb?=
 =?us-ascii?Q?riwDT9bAQBrAR4gdLUaTQWJ/3IJqErcYIeCLHwavklh9kQdvJ8VUsSrismAW?=
 =?us-ascii?Q?/7PWGcd42qs115O/G/8A+avNndyc+N1pTr2PNTq/WHEjSB0+aQH3l81KKSCi?=
 =?us-ascii?Q?0plpcFcPOOhUB1yc02i2Xcu0BvOY+nSKVf1VRdgixZbuup72isKgrX19RxQ6?=
 =?us-ascii?Q?NzQxMrsTqZne9XL1mP/sALcyTxhissqEi5n21XNj8Lv+HZH5C/a40VzDDbZo?=
 =?us-ascii?Q?7en6ECUDCzIehCNjhcbCjUlbDe+EjvaJo/hpolnoNVEbGJkxtabxxWE59z5h?=
 =?us-ascii?Q?lYny/arIJjEXBMHL9jg6b4cn6lFJ6IBsGjA3cEOfYpv/qfJRhwvS2yFJO/ij?=
 =?us-ascii?Q?V4ldmTtTlFWNNr+upyOLeXKxWp1ld8jY85R3+5w7D/ZHajPeopGE8EZPu4A4?=
 =?us-ascii?Q?K3WppOWaS2W+B/SFRXle6xnT7l7oxHIKrko8rZroBqICCxq5WDmhon/Ehs+e?=
 =?us-ascii?Q?dZc24AQzj6NkgVEgVrO7ANGv8Z8bElmuRgOtnL8Bi+FMDo0akGdfZtKMl7P0?=
 =?us-ascii?Q?WRBCeB/9w1Y/88qpjTUKRYvoLgho0iJAQRbvO15+e8oItYtQcfZUWXn7tHnu?=
 =?us-ascii?Q?atj4kBjGKZnZD0mbVQVmrMnoXQERffSbrr3r5IAnGikJ4i4gGZkuQUs/OtNq?=
 =?us-ascii?Q?2VEwCekn3/Q1f0Fc/hOoBnmGdD4NkqS/LOnOzJ3U0EoipKQe2iRB13gR5hig?=
 =?us-ascii?Q?8hfkJ9IeHwa/f4eamuSvdkX2p/w3eW5FYuOhCj+s0PkqIQoEVKJfk0XmsjQR?=
 =?us-ascii?Q?yXyiLXKjujCPxIGci9K27PFuMkGYr6fCgzlktC6PzyUhOiODw3fNaXq56Lrs?=
 =?us-ascii?Q?hiFQbl/LInAJZai+wLuWRgptv+kLJbU5zAwaOrMjgGlsGtjiT9rah2sVxD8U?=
 =?us-ascii?Q?DS96NL6hKFekt+DWYt5UlAlCZliCm9J2MOmVzV8kOFeQFXJ2hp5w5DJxsPKn?=
 =?us-ascii?Q?aC+LpQIE93DHgdGBJc0NTt0+mZnsgC7CUkE6mEBPftoQ4BNcZUL7WOTq15Ow?=
 =?us-ascii?Q?DwYP+/YAifX7WwxafQnqhJ9+RLIYbz9A+ybCWJCPeMkXSbkl5r85C8dUVck2?=
 =?us-ascii?Q?OYMkw47XSctIBaFECbgwhmwU2BNeX0lYyLyoH4wgf3PBF8C3JPRQ31f4QFBK?=
 =?us-ascii?Q?PQD+69vYvM5/UBVnI3w0QL8DYAspkBQfxsNkrSDzVSoqCftwHDrDYXqCxXWK?=
 =?us-ascii?Q?dENZZeiB77WXgCtpnNjP3Uvt9ZBFtPwBnwug0jlcgOU5qgHo99nHRqRyFRME?=
 =?us-ascii?Q?itnZrJY2y7gqFKMeMB2ZpyVHwCpzQlKR17WIaG59nFTkFUG6SiwoTdhATOzU?=
 =?us-ascii?Q?Di5fBODyY6iERvxD6FPaA6trtvauwCDkdme8bmZo7jd9xcNOsTmMIS49Tnqt?=
 =?us-ascii?Q?MF6w9gbSCdnQL3RR+2tn7+4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d01c6a-70b2-462b-1aae-08da9c9d2c06
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 13:20:10.4978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DUbWq8JbTKxOgheqbpuNQekAfxmPvNijZyUIVHXeoo3zQpyWJHWGUAXAc6KS2XtiP3CpnPEM1wKmcUKQIU0TSP2yMXUSrEu3EeZnLb5hFlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6480
Received-SPF: pass client-ip=2a01:111:f400:fe0c::71d;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Add freeze/thaw, shutdown/halt/reboot and password setting support for
FreeBSD.

Alexander Ivanov (5):
  qga: Move Linux-specific commands code to separate file
  qga: Add initial FreeBSD support
  qga: Add UFS freeze/thaw support for FreeBSD
  qga: Add shutdown/halt/reboot support for FreeBSD
  qga: Add support for user password settinng in FreeeBSD

 meson.build           |    2 +-
 qga/commands-bsd.c    |  210 ++++
 qga/commands-common.h |   45 +
 qga/commands-linux.c  | 2138 +++++++++++++++++++++++++++++++++++
 qga/commands-posix.c  | 2476 ++++-------------------------------------
 qga/main.c            |   17 +-
 qga/meson.build       |    6 +
 7 files changed, 2606 insertions(+), 2288 deletions(-)
 create mode 100644 qga/commands-bsd.c
 create mode 100644 qga/commands-linux.c

-- 
2.34.1


