Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F5C6B6AC7
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 20:50:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbRhV-0001ju-NS; Sun, 12 Mar 2023 15:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pbPCd-0006ct-TF
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 13:09:48 -0400
Received: from mail-sgaapc01olkn2109.outbound.protection.outlook.com
 ([40.92.53.109] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pbPCc-0004Qg-1h
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 13:09:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/ZK68lxsVdegch31Bovi5XvsPBOJHqFDPK2qa5On7nSai6OX6gZ8p05HgzuzG2kMJiENLa4zujhDyD3SzitMpNFxtTJfJ9Pi4ZyCJTsWm4dlLkamFOm1c8g5PVKbS44/DJuXpqa1e0uuuruPAlV8YeQ8tYf9A9FvofY5ktO22Zj8FU7Jt82blCBaeUEF65FH3n2s7IlJU34ixmRKjaiLXlXr3se8LZKpMPkZqF4bh4c0bcyZ7lIOCnozPeVsFJkHsnLGxtycCPZQ90xxbwuGEV9K3BiuRXY8nWMcwAAMJLbCJzvxXKBkwqM3y2jNOE+mYxV0zJhLo/wyGvOgRALaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jv4xozC/hs6hw7hm/sDgc8byq0DHza8UjJ4WxUJx6O0=;
 b=JoWfen6zjxlKZm4htr9runbUJJP9J/LzYsuLTmkNTcUTvJHVi3EfV4YY0GfxjJ/WjI5pl3ybCD3MV9d8DWiE6MIAdLU5/Yd+kfP0TojRhYZuSmEAtZPGzu+8HdqK7IgFRgxG21ln3mJQKQuhiddDG3gQdFv9sPJ7IDZ9Meu3wDkYn9QKPIr0vTytJZ55Q8IQBQue4wniZEt246bMoWj1G5pWxj7ojVIaUd7LSnpQeJGjSuh6AfA3LBd+omiSBf0ux76t2afN0aJFJIdP04W/OPRrHoj/5DF688PQFaN8vMaTgeI9uFxxS8aEJvffZK54rteAuNpUQdE+XdMV5dlc7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by SEYPR06MB5280.apcprd06.prod.outlook.com (2603:1096:101:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.22; Sun, 12 Mar
 2023 17:04:37 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::5aac:46da:e945:95ae]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::5aac:46da:e945:95ae%9]) with mapi id 15.20.6178.019; Sun, 12 Mar 2023
 17:04:37 +0000
From: Yohei Kojima <y-koj@outlook.jp>
To: qemu-devel@nongnu.org
Cc: Yohei Kojima <y-koj@outlook.jp>
Subject: [PATCH 0/2] util: Add thread-safe qemu_strerror() function
Date: Mon, 13 Mar 2023 02:03:30 +0900
Message-ID: <TYZPR06MB5418878CE06C457DF67D78B69DB89@TYZPR06MB5418.apcprd06.prod.outlook.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [l5CjxEal072KvQBhqhOp87KqJLsHhwI4Xpx/AAN7PhrEhlrqiK2cEM4g/oR+7FRs]
X-ClientProxiedBy: TYWPR01CA0002.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::7) To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <cover.1678640194.git.y-koj@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|SEYPR06MB5280:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b969695-55d2-4785-9107-08db231bdcb8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tD6CUeyjRURu9nooD2glFUbss+szvkLaHlfGxylKtTzkOChy7PGfNcvEcFMpyw0FkAc7rsvX2/mGj8dQvVbrURIEB90JRDF1CdGcAfIlFF5rnvdjo/3BYMa3SPEvw14x1DtNEMTpkAwd6eG3LnOhiA9gVk6MGzp7psI3OuvKzSrKU5sjrBt20cJkZLh8arHDXuMDkuRRFrNFSPxa1nbFWHepctvj6Gsx9XQEj6KDWgZaODfn15T9hMgDPqqgW5sHX3k2TiYak2hH4PqhWGK01vgWX6K14GKfPwa6a4kjd8zLZEnWneAjXOemRZJWXmiiyaBtnUddtK6RCtVIBKXJ3k6LBtDWDxXPffnKOjh5ookTMbmZ3m7qhA9IE5XnsWdBHsRHs8QdCijIepo/oQSn8b1ZCV2eqXCSRX5jGS9oeVyXuFefgZqoRhZTlbVwkiZ7PwSDwKtTt4AjvCykvDp25Efvd4eLfRE1k7OJKHis2W/NulYtxLi42XLJ9/3ilnkuLt3HnDueWvdhnY9k4PICpBuDOeGK446jkmqbVVqkjuV+g6HnNY35+Yf0LhVa0HOjWFvudPNCGQh1zMystU8OOOrO9a3z605rLu5uU0LKnx9uzPoP+fp19FPfW8CLDu6lL8EzpR6dr0pTsP/cuIoA+LCSCaXzpkqb5ReHGr3wY6E=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l6wgbAw7LQP/AtH1tSnXJxYQl2fHzxSPjknMHOek0H57Mcv2FDFV8Ob6pNMj?=
 =?us-ascii?Q?zXxdw/4P3cglj9ZonDCG3Ba9TXbySNKDGneP6L+SsskMhantY/4j0QZvheq/?=
 =?us-ascii?Q?8P21pJQT/BveLakCgcv+74ghAt44gV/Iw4umaQZG8ARiesuk2maMRZksiDwa?=
 =?us-ascii?Q?lLNHlO0Bh49d9K7UJzx6MlcNxpu00fa/recRyjBAkn3yzFG+2+CJxHEQLzXp?=
 =?us-ascii?Q?epl12cV6W4rh/R/QNuAZnX4Ug+L/wkLg7vzXrA2Ej94Ox7r3AYcAXQ2IuDGk?=
 =?us-ascii?Q?Te7ocH4VLHeAcNKJwQ+Opf9JKONYAPr0kSh5cnFw8of6pnfv1uvolmKtSPst?=
 =?us-ascii?Q?YF8+sO383Wrd2xt7USGizGkeDHMVgmY0+acEgvflzs+E22QB7xpQoz7S30xn?=
 =?us-ascii?Q?vDNXWnDJb3U975IzqP73vE6TEMWzlncuwjGJlKGn3tD8K11Lx3DCUuFLfLzk?=
 =?us-ascii?Q?kZ4QeWfEnvcJRkgSu45PT3Mz1HzGBLHx0xF/4dWO8Oy8yC+zdxiox1F9A2mr?=
 =?us-ascii?Q?T6ajOlpBezzb5VMV1KdDKdjDzJHjbuuAUKPZFRnyffjdXeX1i+S7KqUATDDe?=
 =?us-ascii?Q?I4etnZKjDnNFBDLFx4CdsoRkK/SFIJfkwDoPAba4RL6RLYjFr3zvh/jGFCWx?=
 =?us-ascii?Q?s/njY85c1Gvi8TPRnie0gMUSCTu1CjNUPM0RWJ15/lMiTdhzIST6qmsWDETK?=
 =?us-ascii?Q?80HbXdRI7nKYzAiNxw/MfZEp6uW8GXuhU5icpVUA4gZKTxAvbtOGDPqVSbHi?=
 =?us-ascii?Q?XP4ZxlxaQFDigRCkG2Q/31Lg52vYQYaVBSmCf034cQLyS83/nCxFS8Cnt5C6?=
 =?us-ascii?Q?+6sJwysRXSaLCJm9y13M8hqYgNLXo2iekgbYI91zEnI2xF6IUU1vvj2lqx1E?=
 =?us-ascii?Q?c7HGkDILhCWOfRTEnUsmCiNEllvTvl6BAL5lvbO87G30uoKj/Sj2kKTdLvMy?=
 =?us-ascii?Q?Fn9s+efUPHBioAEd0vs7uO/rvoYxjY7iNA6fjz5syHeQjk3ha/ukID8xupTp?=
 =?us-ascii?Q?q8BkI9IiS0KlQn7A3EcKttQcWlrAbOcJJtso0FpHsscSzuNVE8Ll62xLg3wf?=
 =?us-ascii?Q?UH5ZTrn0i5VM1jFc8OdsGL8sjRmPwYw3SQ8OTxPM5phgNkuN1Lbvbj0jkbfy?=
 =?us-ascii?Q?Iaz4KUD2401HdZJR+aINMQWa7qg9a9kmqyqTVIMa1GmEuVzkIR8BUapm2uCW?=
 =?us-ascii?Q?b2rYQNkMcEAuCIFC/1eppjZk36HB26XM7+FPfjXiMzOjzSarsQ6tCI0ryADG?=
 =?us-ascii?Q?TH8NW4+MdTN65pnu6J49H4dmxEjUnbVdUvtmN1cdvGIFRJwGMlNV2T94OXG7?=
 =?us-ascii?Q?Bg0srmPpDEyrRM9XZkFtgNo3y9mVE/I3q5cKXQkp/ol39w=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b969695-55d2-4785-9107-08db231bdcb8
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 17:04:37.8479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5280
Received-SPF: pass client-ip=40.92.53.109; envelope-from=y-koj@outlook.jp;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 12 Mar 2023 15:49:48 -0400
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

This patch series adds qemu_strerror() function, which is thread-safe
version of the libc strerror(). The first patch adds the
qemu_strerror() funciton, and the second patch replaces strerror()
function in linux-user/* with qemu_strerror() function.

Because it involves thread-safety, and the strerror_r()
function called by qemu_strerror() has different type signatures between
architectures because of historical reason, the implementation of
qemu_strerror is a bit complicated.

All tests except for skipped ones are passed in my environment (x86_64
linux).

Yohei Kojima (2):
  util: Add thread-safe qemu_strerror() function
  linux-user: replace strerror() function to the thread safe
    qemu_strerror()

 include/qemu/cutils.h | 20 +++++++++++++++++++
 linux-user/elfload.c  |  4 ++--
 linux-user/main.c     |  4 ++--
 linux-user/syscall.c  |  2 +-
 util/cutils.c         | 45 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 70 insertions(+), 5 deletions(-)

-- 
2.39.2


