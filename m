Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A0C3BE6D1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 13:03:17 +0200 (CEST)
Received: from localhost ([::1]:41642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15Km-0006Np-Sd
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 07:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15CR-0003wK-1k
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:39 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:50577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15CO-00025X-K9
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625655275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D3BWz9VzXx5w7bO9208w3gunRgKRwzIf2U9/SGCvZ0A=;
 b=faeJTksBnaJ8sJ51u/AN8tit2VsLL0UmOVbcA2fcpRooxV0CmHxc9OGyJagktjVbARgHUw
 kIEQpiyfbpP+3FidH4QZoI9C8KWZAErM/aGTYDIu5IdaML0IqyMO/esGaz4MS7G4jawaa4
 I4c13yOTRLe/EhGhZ85/ZzLeSH9Da04=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-534oSSbjPBG0TBbUK8DC4w-1; Wed, 07 Jul 2021 12:54:34 +0200
X-MC-Unique: 534oSSbjPBG0TBbUK8DC4w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hH01cq7TnqrLB5oGkmxw70vi0RfHDEtyQe0u7Ll5vMSD1KgrSARGWR5zEKRjQpncXgG+ztTFeaYMni8WULbia/dFlUTziyjbHqtDZdaRMHXDy4wkHjUsWEnDlTkME60+iP28L3MIi7ch/BSz8gd/XOWrmlM5dQfJPTNC14lsctryUfrCXiLOR1ceLzO+fsHpVv0R6Gy9JRmZEvDWy+hzyimwTIqSEeSAwzIleRNfFS1yCZvMmMQPx1FbAtAjitkJWyaLeOjIULXLFDHwKs1L2pnIhWlrFf1lXY+08/Wbvk8pwSb832BW9dgWm4vveKIx8lkLDM5uEKK6010PYn5k0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssWHjoC+n0rU3io4I6kyxCUg6KqIAGTYtNxLjo/m1HM=;
 b=VWlh7iy4tF15BCLK6YwPyrTJ1omNIdJOBq11ilO/IFqy6o4Let3CMidFkXPEFxEyQC3hqYO5JjRI9goLN6TjoeVH/Q8DVoTKTgsYCDcCb21gPb9Bfqh8qd/b8iciKLlLK6WFPKdk4g8kMhgORF8UQ2baPDuC9SKxHwEsCKgUYQMj35Zq44J7GuuvL3uP2JwpaM65Xx8QxNZaZ9xz7S67nHIFDUkYGPpW6tjuTFr5K8QPxyzzXxAJvMq48drXTZVj2/+pn5gwlPfl9rU96JvTWzGaBZ+BwEfV39IOCVPiArOHihqFtgfsjBU2MCT7doJSmwZ+42bQ5yN+B77KZwQowg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB7007.eurprd04.prod.outlook.com
 (2603:10a6:803:13e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 7 Jul
 2021 10:54:33 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 10:54:33 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v7 10/14] target/s390x: make helper.c sysemu-only
Date: Wed,  7 Jul 2021 18:53:20 +0800
Message-ID: <20210707105324.23400-11-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707105324.23400-1-acho@suse.com>
References: <20210707105324.23400-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0084.apcprd04.prod.outlook.com
 (2603:1096:202:15::28) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.20.159) by
 HK2PR04CA0084.apcprd04.prod.outlook.com (2603:1096:202:15::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 10:54:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ca35039-a08d-41db-57d3-08d941359a98
X-MS-TrafficTypeDiagnostic: VI1PR04MB7007:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB7007187247451EDABC658347A01A9@VI1PR04MB7007.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p4Fkw0Lqx6TE6ib4/rIZ3mopCRRnPyrrLjFT8yK3HRx4P0Kdfh3VwgB068GGgMlLhJGntBYhjEZ5d2adk4T/e2X6B/eG4ebV8QSjEKhReEYyWs1gH1nEiRGPKK0w7vkya30hxgjeyua+5NG93fnpQvWoU4n1a4wPMlYPUcn5BDqO6LogpY2ybaRKCzr+9TJKHgUd08SWldPQ7rubotVqWQRCJj0Qw5LAidxkvD3+sGJv6S11ie8RcpxaDzvLcp1nKdb6H/rf7VV5Eo4OTEalRK2tddWP4ei2mgzPXnG0lj3b0ZzPswUO/ol7MfETyJ5v5ugZbINggM3oSt6ZIRtUCNSVag06vOhwoMOIMuddG4gOwFOtPGRvA+aSOAOOQTOez3t7dErvQW+tccSnrLz7EzldA1B1FKAtuy1263Ud8ibEdy0UL/zYTpxKOo+hIWLIyFO3/KyA3H1WMfpjEhGOdGdX94c3WInktxKQyL2adHmDNdnECpMU1bbLI7jWDQyxTsPEik3p3uGZPlnfFs6jMvZNqU9VlQnCwVMYtrSbPAfYC1wnWBOBGM1LJvLGtvk5CSSH1kZhNwjbYM+bNVrUY19zyuMG50gWtJnDvNkWVNY0E9wEwWU2zig2iPNZliBY4nZApxFmyFGdZeoFOumUaDbbWuK4BEKMc4wFUhhkgxSUgIpKzzdvaVGDIFaP/ThuEtHaO//nFqsG5XsZcChf2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39850400004)(396003)(136003)(366004)(5660300002)(478600001)(2906002)(1076003)(36756003)(4326008)(316002)(86362001)(26005)(66946007)(6486002)(83380400001)(6666004)(38100700002)(2616005)(186003)(66556008)(956004)(8676002)(54906003)(8936002)(66476007)(6496006)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?63ChQ9jWOoAuQdRvVfWHoT27Xv92gxoJqeknMd3qz0J7lSJKhyjcRSzwNKmK?=
 =?us-ascii?Q?NQy+8sqVswIGVmAVD0IjxePPlfyoGNupCCLPEE5fCf/6mIklBDDF+RMfrGbJ?=
 =?us-ascii?Q?sOslT6Wv6tUsjgn99YjG8RCqBrnztVsOBoORc3MsITRFj7X70kdeCmedLuuD?=
 =?us-ascii?Q?r4FPar7/oo/s68pZHt1a2MAoueGYpU7Ay0bRP/hLUBvSJ2LnF4BEsS4nFXjQ?=
 =?us-ascii?Q?yd5yUThwxNKpEA+Z4OIGb+WM4YYh83zl0LLcQUP2GW2ewVzS9HHJM8KlIES6?=
 =?us-ascii?Q?nf33kW1Fn7hfJOwF4HmbJI5rMU6i1a4bH6WXPbw55+Hw4o4HUoECXEWFvTCT?=
 =?us-ascii?Q?Xs6GbXI8oahpkwAUPgCY+Z4SRb6SrNXzdnx3LkfFGduJpv1lUHTGlbqfgoth?=
 =?us-ascii?Q?woBGynTwObrRa3zcAamDaZCoKL+6DBNBnrJ/Kjb9+AV74Bnrw09wh1FYNbNp?=
 =?us-ascii?Q?w9lbihRwXWN8MIC2COxqpmn6i9cjoS3KHuekjKaEe0WHzt9fQ1phWg//1dHa?=
 =?us-ascii?Q?jgXedGvgvS/vjsN2E30mwVe9mlF4HaVbZexJtiQdCMEJRzjasiuCRvy737Kl?=
 =?us-ascii?Q?dP4BI7tY49UgsSCUO69xP2eHswaTldi8nJhf27lQNPQURSwNmwaedWtCON3E?=
 =?us-ascii?Q?qmz9DsLpJBk2CzuWqTZOV4eOP6r4ZmTfLfgDQ6AZ63+9J/v91saTy7H19g4R?=
 =?us-ascii?Q?8BHX0Cz0sfPED2o5j5jrG3jZwRvjkX6h2kEJQAYIhPrVIwEWOhm5XoelhuNU?=
 =?us-ascii?Q?BoTvv6HCI0hUi2u60Go213Ij93hT2aUmg+KnXoYJz2Pg16Oe+68Jco4ApKPi?=
 =?us-ascii?Q?GQSmMk0/P/iF7VJkxDhgWRu/AoM/UgpdvtfSSTvN1hS+gaDio05WDcMGCdj9?=
 =?us-ascii?Q?XgQJUi+bv4wFSfFTIczCS/sTIByAlKLITBzPkDos7AWRK5K5H5n9evknLtmt?=
 =?us-ascii?Q?fkJPZGh2D+aV/4V4ZRKJe1UJC9v+FQ42vuJlAbxOMb5pwHuieJlp3bq6NL5G?=
 =?us-ascii?Q?3bfmugJa0i8GmAUH4gd5ESDHPQyVrtK/DRBbAGx8jkEOz/0b5UCgG0VBVqtq?=
 =?us-ascii?Q?YYYfGq7nDUPSpNjYXT7FBP5GSU07/szM6BWmT8XbOQw9pTVZSHl12ehGJ7zv?=
 =?us-ascii?Q?IsIwnqm2mq2uXY8idU5NGiiRCkzdYqur89UqLDgn9jNV70Avno2QnuAkUajC?=
 =?us-ascii?Q?3JFcBL98oJOJBbcL0ds+kXowyyWpBVz9ZKzg45s6Vx7AUwuw9p+uA7e7wlyy?=
 =?us-ascii?Q?m053mx6nnt5gAbuDqfIomDUQT6Y/bbhCu+TsJT43YUwZrnXHa2JUecdNZ2RL?=
 =?us-ascii?Q?1U2JGQe4OFa3YiGqXWucIynr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca35039-a08d-41db-57d3-08d941359a98
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 10:54:33.3132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfG4ul6kGHRSDvngB4M3znPpVMtjGHt+W64SJk1SgchvWxUrHlqqCTMsCfzJh2uy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7007
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Now that we have moved cpu-dump functionality out of helper.c,
we can make the module sysemu-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/helper.c    | 9 +--------
 target/s390x/meson.build | 2 +-
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index c72e990f4d..6e35473c7f 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -1,5 +1,5 @@
 /*
- *  S/390 helpers
+ *  S/390 helpers - sysemu only
  *
  *  Copyright (c) 2009 Ulrich Hecht
  *  Copyright (c) 2011 Alexander Graf
@@ -27,11 +27,8 @@
 #include "hw/s390x/pv.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
-#ifndef CONFIG_USER_ONLY
 #include "sysemu/tcg.h"
-#endif
=20
-#ifndef CONFIG_USER_ONLY
 void s390x_tod_timer(void *opaque)
 {
     cpu_inject_clock_comparator((S390CPU *) opaque);
@@ -284,7 +281,3 @@ int s390_store_adtl_status(S390CPU *cpu, hwaddr addr, h=
waddr len)
     cpu_physical_memory_unmap(sa, len, 1, len);
     return 0;
 }
-#else
-/* For user-only, tcg is always enabled. */
-#define tcg_enabled() true
-#endif /* CONFIG_USER_ONLY */
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index 6e1aa3b0cd..bbcaede384 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -4,7 +4,6 @@ s390x_ss.add(files(
   'cpu_features.c',
   'cpu_models.c',
   'gdbstub.c',
-  'helper.c',
   'interrupt.c',
   'cpu-dump.c',
 ))
@@ -23,6 +22,7 @@ s390x_ss.add(gen_features_h)
=20
 s390x_softmmu_ss =3D ss.source_set()
 s390x_softmmu_ss.add(files(
+  'helper.c',
   'arch_dump.c',
   'diag.c',
   'ioinst.c',
--=20
2.32.0


