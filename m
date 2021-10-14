Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC1742D5DC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 11:19:14 +0200 (CEST)
Received: from localhost ([::1]:40104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mawtN-00088j-QZ
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 05:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1mawqY-0004Ye-2U
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:16:18 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:60726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1mawqW-0004x1-GK
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1634202975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2S9iL41NSqbJfl5zDDMPdK5n1EtXnrbKBBSa6/jZEN0=;
 b=P6clHcaq3P/cXoAJHd2dWXJJKvcAxP/kt6jLFXHF7sn9f5prCimjew/uiVRPFGKyiV1tKC
 aCBzPmPhR0UNu005Iw8mwPixfFJfP89T90h7oujCwtYxj6VFsHI9zcaaRH/jEnaOAv01z4
 xdKEblPqXuQOyLI4uklkbcjpB+KaCCY=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-_pGwaUnrOTKsm-ltP6dYVw-1; Thu, 14 Oct 2021 11:16:14 +0200
X-MC-Unique: _pGwaUnrOTKsm-ltP6dYVw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NB2GQfXnMMQhi3pqW/PZRhUfLOPU9bi8TccTr2NZKSAehmbiqSkYeuDfOf/t82dFaoUBoVPDxtM1922ghYQS9eDXsa0Veii5av8Gu9KRfawRuRtVn/Pw3FtoYocTazgTsY/V2b0OvQM8aq1UZDHLzivMkbnOk5skLtbdKvXpjiXk2+k2lPJ16Qzfqu9NkDTtihz7quiJkfO8WUUOpZzi9Ts+MRqXet/jZIyqhcR+XHGxaKuyyCCXeTFyWQa7ammHdCM20y6QoIIt646UXt0XyWp9EZrdNhDEQYjQoyw1kzheAc7ZqoarI/0HhEMxeeZ83VAZjo+fShooZ8qzTkl6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdQaJMn/T2harU81bZZbQwjknYRtew8ZCIfFGn180es=;
 b=d0GRLPumBTxlQeXC1wUpCivG6h3UW2JzGyed+9E6sXmVJ+VqNjvnRUtxmipIDkKO+VPsp0iI7N0/bwsXgDGsAUui4OJswsaBeG1g31di7NfA0KYGB1H/zg7vwTOxipQDUDOJB11kEkhKCWl3MWu5pm82OhXe9GdLEKIinGn0Sqna9DS7Z7mopraGWZZr+B51vkVMJKs5tQAc8QgeCTrAHQwpEHF2OgM227CkM3ie8fOoCECROEXehQODKfjsPilO3GAzVnubLGo7xRB2FCqxninaiyyZ2XWGsIbHEhBFoUGSugZKjPkeEuuTszGPNnUFNdamW6ZNiRAisMSpyNDEww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from AM9PR04MB8602.eurprd04.prod.outlook.com (2603:10a6:20b:439::12)
 by AM9PR04MB8955.eurprd04.prod.outlook.com (2603:10a6:20b:40a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Thu, 14 Oct
 2021 09:16:13 +0000
Received: from AM9PR04MB8602.eurprd04.prod.outlook.com
 ([fe80::5499:6698:e99f:cf7f]) by AM9PR04MB8602.eurprd04.prod.outlook.com
 ([fe80::5499:6698:e99f:cf7f%8]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 09:16:13 +0000
From: Lin Ma <lma@suse.com>
To: qemu-devel@nongnu.org
CC: quintela@redhat.com,
	dgilbert@redhat.com,
	Lin Ma <lma@suse.com>
Subject: [PATCH 2/3] migration: postcopy-uffd-usermode-only documentation
Date: Thu, 14 Oct 2021 17:15:50 +0800
Message-ID: <20211014091551.15201-3-lma@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211014091551.15201-1-lma@suse.com>
References: <20211014091551.15201-1-lma@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0173.apcprd02.prod.outlook.com
 (2603:1096:201:1f::33) To AM9PR04MB8602.eurprd04.prod.outlook.com
 (2603:10a6:20b:439::12)
MIME-Version: 1.0
Received: from localhost (60.251.47.115) by
 HK2PR02CA0173.apcprd02.prod.outlook.com (2603:1096:201:1f::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Thu, 14 Oct 2021 09:16:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e0d3b6f-9818-4abe-d5cc-08d98ef344c3
X-MS-TrafficTypeDiagnostic: AM9PR04MB8955:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR04MB8955453ED76810C298A2380BC5B89@AM9PR04MB8955.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3XMiB170nW9+9waQ6W7PPT5hQ1kocqVRt8C49aQaGMHatchhGDgkdd1PfjnJNRKBR5qW4T4uHKajNnvsd9mDetynAPEfmRYsPn08dyvJULLuBUIQdjfdvJIS0Weoakc3zBkY5tweqwynov2fbvItSJ0UWLEiFp3id4KtUY1TxV/GYFyLXSysiqUmWY9LtyG353O0HEZnUsVZZ05qTvhYE85opGunvPYEv1nSETnff2X5OczVMGtChxYcazCpXpK4TNs/3Cjg2JLs5CQdZhdwmjAJxWYA3VnAPCHEWdYlFp024pHUa7QzXpEtVNweDD114MISmS+RKnZQujC4owVolW+WUSC3yb80HbxcmBO1Jwqf7g71XkGWcCaHjdTck/XYESgXPDRBJj4MNv0hiK7DrBeUpjcEtpeFdM+8Z5lxqgOI2n4lnjmFpQK+kjmsCLYhA9ohy/42IQuTUJMpPy+c9p6ZImkX8ABLLWqFES9eBT/DatIAvOPdOnBBVBXU81ACYSnZEFiovre4yTtClpLYNmIDRzqbSVxvcVXdDfXM9uwQG4YOZhZRxzFYiX0p0jhAduR+IQevxIxr65L8nVejLSTNppvZCcgRKkP0js1naoOb85GWI4o2ckH2rukfdt9aa1tKR15Lw0BE6SFWBKVT9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8602.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(66476007)(6496006)(55236004)(2906002)(38100700002)(86362001)(26005)(36756003)(66946007)(316002)(4744005)(186003)(6486002)(107886003)(6666004)(83380400001)(2616005)(5660300002)(508600001)(8936002)(1076003)(956004)(6916009)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ree38xHsvPvavUaUEup60JGLxIuHsB3017iLWb/BwB0wK2KgUp+4VKwdv/YI?=
 =?us-ascii?Q?8hLm56wGw69/1+TVNxfvozkldciiQnh3tz2hFIkixOItxbGQtIpjzOI5ukD3?=
 =?us-ascii?Q?b9bnVayKbXORuYyRztgYZZu198FT57loz6Aq1DajwZIWkPhjYGbJkU0qzyE4?=
 =?us-ascii?Q?9Jsekph9v1lZY7MFqQ+6DRA+r0lLgb9jkZgaRtZUnxSKhQvBmomIpFZbM/mz?=
 =?us-ascii?Q?3WRQvD0LtOoRNzylwq7ReEoxLCDRrpsordDvdzJGtvUOIZIsNd2aZS5BsY1w?=
 =?us-ascii?Q?EjsP/k6Nxxgawcce5+dwgOtA9kvnYw6gDRzb0dGGYvM8yt8FMTgK4k/dL5RO?=
 =?us-ascii?Q?ChTVRh1EnnKjTo7X9fjJl+bCELoxPE7HlV5wdbuFcaGaUXxZ5AmDrfRJhdQd?=
 =?us-ascii?Q?eScd+rRK8qPFQ14MkPCZ8LI7fxgYsxun0WYFQG1LGXGOqAbgowIXDHwYlTwx?=
 =?us-ascii?Q?AIvnuD54aoNhLDeXOWoPGf46g3uiejZ8EjjMH8/gyftF2ZhSYVHE/1q/Y100?=
 =?us-ascii?Q?+yBF9CC3bO0EmMMFSuBbsnc2GtPSAgguiYbrPEN92u5n42C11KIo+ojpGAU4?=
 =?us-ascii?Q?kaLqMPFcZ6NN243FvUQ2C5N1cmoYV9GZYy6dA4OZMU/Uo1q4fc4baQW8goMx?=
 =?us-ascii?Q?pvMvUMhCKx0LYGTO81/+y6FPnM5CF7ieAmrx1f6G4AhXgKM9j0E5jo5N2oao?=
 =?us-ascii?Q?PkmTYVZIC+/rQ7g+ioflaPG4+xYEjwVNxRaMDQgQrfj1E1GI0hJiHlORrNnY?=
 =?us-ascii?Q?NxwFEZZA/qjK2AW9gkUQHtpe2HfkqYP5jy5YNxNdTWjOIhR6sRQpANUEwVpm?=
 =?us-ascii?Q?yQcSyG005YkTjXPi66+//EtxvK4dXem0rMfUwW7ODsdojkLb3pumzgdTEesN?=
 =?us-ascii?Q?5fm+ml/OMFRQOA4umMSpcBXRx8b845A7nrmwABhSw5ujeUNenTqU/6oEOcHT?=
 =?us-ascii?Q?+pBJqupUw7olJz0lmDqV6EnyZJMB0w4MHgA2bNL73Xi6pwOw+zQYNFuyo+BC?=
 =?us-ascii?Q?Qavozbp3djC4NIvdrY4vZkSAxZAqqrsgTjA5jHZjaBUVlJa0Q2GwMMKY6WfO?=
 =?us-ascii?Q?xeJEfDh8xpg1NXMYTPC/wfiZfLXeFyIfk2iYm2xGaQPenhIIGLb9YPWGhaJT?=
 =?us-ascii?Q?WDr3Zxc848zyzQfB1FAkDm2pl3jmfu8I/B/QiMFnT2I7SNDrhux8RgBrqW0+?=
 =?us-ascii?Q?7O+Z/ZPK3S3v1orgOE5quqjgruN7Qeu0Pd6tGw8VeJ6/0F41C6+2m0ZAzx1p?=
 =?us-ascii?Q?qfkmvjsgpufHrBOGE+B2L/o4eIF++KxgyYpUvGefWQ5cbG/rDqzeP3vVqFUp?=
 =?us-ascii?Q?G3QAQQyaUk3ia86GKRveDW1o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0d3b6f-9818-4abe-d5cc-08d98ef344c3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8602.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 09:16:13.2642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cfhbodhqn6WW5bTDiq8KyCu6dtANOqve3lNaGo9gcyx27Sp29Aa4hrrVM6msLhi7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8955
Received-SPF: pass client-ip=194.104.109.102; envelope-from=lma@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Lin Ma <lma@suse.com>
---
 docs/devel/migration.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
index 2401253482..dfdd3f20b4 100644
--- a/docs/devel/migration.rst
+++ b/docs/devel/migration.rst
@@ -639,6 +639,15 @@ postcopy-blocktime value of qmp command will show over=
lapped blocking
 time for all vCPU, postcopy-vcpu-blocktime will show list of blocking
 time per vCPU.
=20
+Since kernel v5.11, Unprivileged user (without SYS_CAP_PTRACE capability)
+must pass UFFD_USER_MODE_ONLY to userfaultd if the unprivileged_userfaultf=
d
+sysctl knob is 0.
+
+To allow unprivileged user postcopy, Issue this command on destination
+monitor prior to turning on postcopy-ram:
+
+``migrate_set_capability postcopy-uffd-usermode-only on``
+
 .. note::
   During the postcopy phase, the bandwidth limits set using
   ``migrate_set_parameter`` is ignored (to avoid delaying requested pages =
that
--=20
2.26.2


