Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BF968766D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 08:36:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNU8R-0008Vv-Bo; Thu, 02 Feb 2023 02:35:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNU8K-0008TD-R7
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:35:50 -0500
Received: from mail-he1eur01on0702.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::702]
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNU8J-0001fz-5c
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:35:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=goSefqYidNJXhxBT0Bnz/8B0pQBYIDmBlNzaxgQigAOZblsfAyQ6tNPiUA1CcZHpGZCrGJCkKq8W7zX/PRrRnv7BkiMhpZQeV+SV18t/TWZbY8YuoNSXyu6CrKkmW6lwcY6ZnC170SZIZMkZTnBmSxIb/uy4rPU7vbNJnTyPvXH9lUb+naxWqyUMHNvPruGxL7WsIqvtw7aJj2gUTkLGjonPSyLzSPaqJrStYOgUUNOuavUHGIVV/f2QVR3ya6umMlxLZWW3yCuWSNJaem5dnzFEH9WoVK7eT4ABlxWQ5duM0ZxuUmjR3VoXtf+zpBklWn6dt77pxmIyjtr/f3KxHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsposjjG58DmTCdF7QISx+BLlIycubOFohMHp2N1dVY=;
 b=R99oUziUTtQhox3HxJ3JFk7e9Qo62Qez8Kouy9kq0UWSfHp842GQT/xIqStbhEirv6SO4umyDpsc19RQPXnLjUaYYeq5upE+2gIQZT0M8UWjrlcx8XIMM4E1sz/ehaOM518zYoA6+2zAESCFw1KOmt7LNq161pZDccniIFn1c688QPvFy5vFn9dCAyCs3AjZ/oxYzSDOQWb2OW0VK96T21canAqtNbBp0VFpGiBFG25AgQaVaqkeuQ/dLZkDN28lKPrwTUPKdGv1VYeU9wcuyMEEwHExQZygyh3tpjIwdHjI3nlLDWlbtWqHWbCgFtSQJW16sfeE74SjjaV+uaNfRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsposjjG58DmTCdF7QISx+BLlIycubOFohMHp2N1dVY=;
 b=PN+d8sqYhHUUqr0f7ZFsmIruA8b4/Mygw92In6f755c/MwnfUmXn+48JYM/vlz5xUHBImEFG+U0LxsDGZKqgf7jpLf0os5yaqjH5Lv8tFGhp/T2IBrfqFvTr9Uo7nP16xFrTVkSpGY7l0nEUnyzBMXreCX2Sq49iJl4WWht2ijM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PAXP189MB1877.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:276::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 07:35:41 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 07:35:41 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v5 0/8] igb: merge changes from
 <20221229190817.25500-1-sriram.yagnaraman@est.tech>
Date: Thu,  2 Feb 2023 08:26:40 +0100
Message-Id: <20230202072648.4743-1-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0067.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::32) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PAXP189MB1877:EE_
X-MS-Office365-Filtering-Correlation-Id: fc91982c-3cc3-43c5-61d5-08db04f015f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +9s/OEJ9b8CQ/EjvUadrH/Kar5FAyLErQO60Wgyf6CqffQyUsZK+kFPYGwiW952qZ36ufY7n7F60PNmBm/OvZGmUtn2sg1rHUerH6iuDb+qTdYXIbxZ9wdeeH3tsfMY2EG/3YzdBd3g/6iX88IlaxCYZPIsqIOrmfvs3Kjwq8ViqYUrqDNyGeb3mufpqmuTYT6VpRk20NE7vtoQ4qr5TFyKoTjvZFBqCM0nyu8v/rczGoo9aJXKfUYrfgIwc2IIivJIOZ+itr9xwXmiFnX6ja6d+RIL0HXcGZKUrm3HUEbRoo0nbRB/0+h4HacoYkevXGnYW4mqY7uU0pyu4r8saa+00vnsJ3zWYm3CtBjBRLMmJKnQzo0Iw/HDpPoL5VpPb5nEBlJ8y/H83zKq0ALeXhIRc4p9JO+9YMw0Ogwrz+EQM6nJ8cYFyjxe+Rp1CqeDf+w00YWLvdRc4gbVLVbLuN4HpvzomRmTfJjs6BUZV3+boNlI+31r1yAosIGCkJVg30y0samMAaQA7mJhbZaM31MjOes5lK7ORsRF6gAsUqyD9j+R1uD0RriXqCciVWvk9pU/YnCGjvTfkUH4iBlzTP9r8ycdia1ltbUfmK1+CxZ9yJNMEaTGdywqGbdjVmN6NL2Z/6RRs0oYv7t9dWu3mVN2QJq2TgDAgvpj9rYrmrsVoK/RUCd7S84r52q4PV1BX5TzTrHpbGeHnPRojf7G54gW03FSk1t8ppQEFhNNLydPRCmt8SveBe+zxYBqJ1Nn5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(396003)(346002)(39840400004)(376002)(109986016)(451199018)(44832011)(36756003)(2906002)(83380400001)(6512007)(186003)(26005)(38100700002)(6506007)(1076003)(2616005)(70586007)(86362001)(316002)(66946007)(5660300002)(54906003)(8936002)(8676002)(66476007)(4326008)(66556008)(41300700001)(966005)(6486002)(478600001)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cHedCUNFTA6GvKz5CsjJiVLWrp0Cd/SwuSMelJtP91dqD/oAC6OBOGBEaZIy?=
 =?us-ascii?Q?Wbt3XzsfmI/8R3h8PDw6UKOG+iAHtoKCbxxAhGWChLf3FqknZMdx0h08vgRx?=
 =?us-ascii?Q?BSiJwwpLOjSdIIn/CaIMfMkSp7IXafMGobUEwM30+93WFK0wXiLzYeDLgUTL?=
 =?us-ascii?Q?irFIkcD8l9ibEHzH05yoG3WP3UWffypCH0rob1WpHf9L8Xd/7uugJ7jNDKqt?=
 =?us-ascii?Q?OqrGavJTs1Mt5eDNIBeZr1yIcJKNuQjZEXnNVPRvBbPlQ+dKB6xOkWCPXDR9?=
 =?us-ascii?Q?IJcditft/UXhBiHEbuYtHoHtVhZG6UxlXprkK81BuHGKy0MDC2iTYfQk5rKg?=
 =?us-ascii?Q?4Xnaj14NHiChbKIK5Fwe1b+xiqpsd79Eom0U/cXtVfTsa6Tdaowg1Rw2zubZ?=
 =?us-ascii?Q?OMmUQtcKBdqGRxQmWXb992FL2I39JhoAp3UYRZ7t65YJpnygZY8tsKwMRf6B?=
 =?us-ascii?Q?ReuV5CuPdppsx3X4/cC6s1sZrfqAE3sOw1iXDl2bhp/167Qgk7Mt2RO6Xnvh?=
 =?us-ascii?Q?L/r1RU0Lym7R1PHHokTlXZkjk9cos9FbSnUsnYo4K/2/TrGGJvtDcIv+oqVP?=
 =?us-ascii?Q?1xmbdlC3U6m+cCyiKcbyAzuHiO4k7yNJPJ9XoVONmh3sNE82ayzNdV4DwdgF?=
 =?us-ascii?Q?RjBTUSVI/rp9KRLsSrXkFD+DYDHBRWH1JEAkj2VevtJ9P5jTMzUcQXLGHr31?=
 =?us-ascii?Q?iLB3LQliEhNI8AyKlT11tBGD7+H2DsLdd0qrIlquo8eicdu3xXaKAhJtgZuH?=
 =?us-ascii?Q?Z9nritj+l2c4l82Vs54RXx8Cw69ICQmWObMYItLUoDEPby3Euyy2Yuv8XHq4?=
 =?us-ascii?Q?IvUTOGGvnMUqpM3W58If9Ozs/FbIX5k7lfqH1ILpP/il5df6xfQZRmDO52ce?=
 =?us-ascii?Q?F7qbbSAumFJdbty1YWT1UKADYsykABq+IoizzK2jo9yme1dsnauJpcE7pvBC?=
 =?us-ascii?Q?fBeuyxaKFZC2fl4N3TjYq2Few49CJ6Q7rVTI0Hyg0p0RQwqxwptRM/VbOaRL?=
 =?us-ascii?Q?4621MYL6tCBzweqb+z6mp5rgyALz+fieK9TG8jWDrHB8PZjnNFLCJn1DepLu?=
 =?us-ascii?Q?DGBHyCrZNNEqF3Be0PLpJbb6t0e9a8JGFpL76TesJvfzI/BHAmeaWmaJY6QQ?=
 =?us-ascii?Q?qsrCkxQqzhm/laIxB5BaDXR78z7hwk6OXZLdrLRXLfkTe3awzdPxgOdXve6U?=
 =?us-ascii?Q?HnTJmkZb5FQYPck+zSLWB2HMXk/misTATaGTRQ1CETwX4L5gUe6uH6huau4/?=
 =?us-ascii?Q?oflhNNd48AXEHSLT0Jxd7ukxJQ+dwVrEcbEBNv4jW7Z0Db4GMUAH3nwUrUIZ?=
 =?us-ascii?Q?UbW4e0z6ZDE7+f1rA6lbQcAWXnpUt8O4rwfqBO+27Mm9EF5Ql/IpnKi0A5zG?=
 =?us-ascii?Q?MBlgPMeX/X61fl0nxasVP5cjMY4KXB2e06mS+tt3apNP9xS94K2amp2A6lZn?=
 =?us-ascii?Q?sndfCGfNt6zy9qd0+SWOzJJcaWNSx9YcuEebeAkEAoezKmobs3oQrULLVJOD?=
 =?us-ascii?Q?jOWwb8Gd78pxi8/+RHvb+g6e+xTBoBdka1IEbQYMGvQn3sybKwQO2dgDFAmb?=
 =?us-ascii?Q?kDJ+2/v7U8wLfEymt/SvzdLePFi157/fWotfIomk2pxIi5cZD6Ip2n+wpiuU?=
 =?us-ascii?Q?AA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fc91982c-3cc3-43c5-61d5-08db04f015f4
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 07:35:41.1306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehDBCjokDykeH2mn/pv04CWwGjIR599XVfsSD7o/WS5oSLWwBkv1x+s6954y04HhyC31a41SP/iDz6tONqonwQQGyd5GyQQST5gUyqXkUKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1877
Received-SPF: pass client-ip=2a01:111:f400:fe1e::702;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Based-on: <20230201042615.34706-1-akihiko.odaki@daynix.com>
([PATCH v7 0/9] Introduce igb)

Rebased on latest changes from Akihiko, and merged changes from my
original patchset:
https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html

Changes since v4:
- Removed the change implementing VTCTL.IGMAC, it needs more thought
  and implementation of DTXSWC.LLE and VLVF.LVLAN first

Changes since v3:
- Fix comments
- Rebased on latest patchset from Akihiko
- Remove Rx loop improvements that Akihiko has pulled into his patchset

Changes since v2:
- Fixed more comments from Akhiko
- Reordered the patches to make changes easier to understand

Changes since v1:
- Fix review comments from Akihiko

Sriram Yagnaraman (8):
  MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
  igb: handle PF/VF reset properly
  igb: add ICR_RXDW
  igb: implement VFRE and VFTE registers
  igb: check oversized packets for VMDq
  igb: respect E1000_VMOLR_RSSE
  igb: implement VF Tx and Rx stats
  igb: respect VMVIR and VMOLR for VLAN

 MAINTAINERS          |   1 +
 hw/net/e1000x_regs.h |   4 +
 hw/net/igb_core.c    | 198 ++++++++++++++++++++++++++++++++++---------
 hw/net/igb_core.h    |   1 +
 hw/net/igb_regs.h    |   6 ++
 hw/net/trace-events  |   2 +
 6 files changed, 174 insertions(+), 38 deletions(-)

-- 
2.34.1


