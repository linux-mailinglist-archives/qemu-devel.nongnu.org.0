Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FEC652699
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 19:51:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7hbm-00045n-NY; Tue, 20 Dec 2022 13:45:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1p7hbS-00042P-RG
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 13:44:39 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1p7hbQ-0002Xd-9f
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 13:44:38 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BKGVblO032385; Tue, 20 Dec 2022 10:44:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=dtdmOoCjOmXxO0ZROITXnDBBYlOMEGvxsaA5KE2Vbic=;
 b=muyBkVTB4NIIkKv279ri/VkZ4Y2ShEHqHzA5X/ShvCYb3pCW0HuMRNKc1C+CVfXUxJLz
 4k21/uYP7k1LpG7HTI4vh3ahIDscJfRQD5eLkiaSoW0sRdLsvthgldjj+FAgkmOU5g9f
 VaQHRAYwkz1EDjcNfYiLeUZQVBnD3qUQUAvyHS3lnCp26TSTllsQyrsc4sr4y4w35XAI
 MZ8jKgNtBJFUMUSTfTtwBLXAvvcb0I2bAkG8+SMWjuS2VldZidG1laN+/CCcyWFnpeky
 uyrfyTf+lsQ96X5ezZUBf88IAV9vm8ze/K+GMhOtYUVFDnbC+v3rThJDQZNFeJPse8l6 Zg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3mhdqmrbug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Dec 2022 10:44:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hzs60ksQXKGK9hgTHcH3g1Qh4mL7lOAcIc9VGV1VGedF5ZvkOwRf43OzYsU92RxsYKVcPEf1NQ6EYweNI/FWfi6dtDbcGqNnUpOLfR+e6c6ujcNuSVxrxE94d7t3TP9UNeqqOyeIsrUVZv9V5Zva3yaDes0y8P3CnluSwb8NmsbjYLULJNFOyoPOAibeaisjJlO6NNGyH1nzAwuf+kfuiPOn0T/22DvQUUFamNaAAxAYj1r6tzoj/+69/k04gI71Scvt2AqRTXPGiU0VGVS3SuFaFwDeZMx4RSRgDbYOmZbuPb2XyjWJaIeQTYo3eWGpH7TtHeKr4GRa1o1SNmUcaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtdmOoCjOmXxO0ZROITXnDBBYlOMEGvxsaA5KE2Vbic=;
 b=X8q6CVPG08Tzk8twfD/0ckG+Ijg/E7KGCKfMM2rPeLAGTZXuoBSXjYl34lMYo13e/lJY6sYci9BsTAJKnlZFt+80BHMAPeA98QRLa/dg5Ped9CnoozN+0hXfsrNWwTh3xsQ3Uc/sdGv7VaUn1RdyfX4KplLUJgHla2N3QxaJht8FZkOAbe9YNrT9Mk3amck2gXa6Nlhh2V0yqzaBZh1sVD/xix86kQORALBTj03D/oIA0/pxEkWxfpXVlL4eU6CbntrJMFjbgqn+4MNEKdaN7H0x1XONvTMNHWWd4Zt2PXwYH6S6EfkO9uY7dL3mOzpSoig/KJZwBkx5gqAU2tLQrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtdmOoCjOmXxO0ZROITXnDBBYlOMEGvxsaA5KE2Vbic=;
 b=aoGVSgc+n9u0hn8d9jY+IWxlfwdyS54s6JtbRe4ws51K4nUPKSPQJ0Zn2zZqVK6XsuZEWNUaled6aYckZjA506Tulxx7VnQsOiEcG1C9gdWWZzzTwkHG89h9xO29jXwAZgjrWlULM4nTLNWmiAtuSExpyvQogyTtlhw38+ORylIeb8k46ESITkK/8T7xWDYFo9UqtPBfU6HrZ9qizwi/CdV4YH0dAeZbOkc3iJfbpdBJzP4FPkFpOzTW/7QsOUXFUXFztrYLc3rdEyjyBT1ultfRdA6ROrfRLyW+MLwmT7mt1uGDHNDFIMyR3iiXaJ5PKJHabYQsDgJ3D3QUdBldsQ==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by CO6PR02MB7763.namprd02.prod.outlook.com (2603:10b6:303:a2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 18:44:31 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 18:44:31 +0000
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com,
 "manish.mishra" <manish.mishra@nutanix.com>
Subject: [PATCH v6 0/2] check magic value for deciding the mapping of channels
Date: Tue, 20 Dec 2022 18:44:16 +0000
Message-Id: <20221220184418.228834-1-manish.mishra@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::34) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|CO6PR02MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 715fadb7-3e8e-40a6-1d5f-08dae2ba3b04
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZF5QBj5DBVrsVfpfP+ZUGe9AKw1zfGkTP/27zBh28P5J8GocXvglGNCFrZZrCDPni8Aqre/9FgotlRkmNSYnasIjt++snzzWLiCz/A+jmpN02Ksed2hceGVoacdQzxvRkFWQRuccBgIvEwcIsQzXG+7AfkeQBcrU0pCMGpMT1R+7X+nTQn5VT5v08GWyZaoWtTXVKehDpC85U9FmycJASlDBZpAfOWmtbQ/GEGPkBUJfJ7IBQNpy9aXg8FPnj6Jw5yo7a38CPdHpxl5R0kTrxBhSjsScPVl+WRaa2kxP3e9PRAgRYnzwReePvX3VXmVQ/SK+86ca67aufcNzO4pQZqF8wApEXtceF1Sn+sPHhlDJ2XvDSurfItBfOCtpI8DyE1k5pekSVq2BZEE9bHoFZt6/D7BWpGpIVJm43v7MjOA++IIdTCDMy4FFeri3oyjpdCIC1KGPVO9mpHg4LQcuG+Q0o6JZXRvgcYMg8o7Zr0irGBhIoso3mZtOA/fze9N/n+1uxlD6o6ZMIHfqx/9mbRmHFMKaWcvfC8unkIn1BIndTnr7F60Kduy0j0PSw1vw4Nv5aol2CNCtI2P9s6HttNRRt9p374OuvHYtFc8jsu4CCXAduStBK+IHW7Kujlaruksy2x1wks6U431DzmmwIWKbXfNyGgRcuKCafDLov5ZTCn0LgEC16jxTx6OpTpEePFYfiMqlZunQmeDQAHh/eA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199015)(38350700002)(38100700002)(83380400001)(86362001)(4326008)(5660300002)(66556008)(8676002)(2906002)(66476007)(66946007)(41300700001)(26005)(52116002)(6506007)(107886003)(6512007)(1076003)(186003)(6666004)(316002)(478600001)(6486002)(6916009)(2616005)(8936002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LadcR0rNndcOkM39O8xZS/MHuDIh+IQlNgSDIKM6HTmsIczik1hvigh4vWuS?=
 =?us-ascii?Q?zR0JTxzZqRkhLsaqn9qZ0ks9Jervp/eQDHTqYoYGmusrSyvAK3KLMhfRpZAG?=
 =?us-ascii?Q?3ct2p+Swe/4Ck9fP7cAWjTMXfIj/6LDPhpHWzryO/vL6L4dO9nRgNh7+sBlN?=
 =?us-ascii?Q?QkG96X67iXPtt/mwIWAQzWxQXnxrHpMCa6ZyQDXTpA/vxC61KU9BSRLOUrXP?=
 =?us-ascii?Q?h1NVuPqLesc65z6MYjUoue02Y1ow7YGhifQ0ZvCQ9GvZJ8GwpSySVbJsgWaL?=
 =?us-ascii?Q?lGWMFtxCLXhDfJPvSekr8zn7CM5sHE0e6F2TROlMRD7mXPKMCk4JIjaX5unl?=
 =?us-ascii?Q?cxkeKKQ23XvHqBD/YHviN1HFeyTp3NWA4EwSX/mZx9vxDyaEtaUo3+9dawVy?=
 =?us-ascii?Q?3dVJfPsG7rM7sAC5Y5E3fH/5IbujTImVbTjbYaA7YzRJPzH3VvubCJX+Syl0?=
 =?us-ascii?Q?O2YcKGRIrKJiH3TLXPEM4c2Dz9In2EkToVCJmpgVleLtj9a/KH64KO3epe9n?=
 =?us-ascii?Q?1RLrLmUBOyBbXuc+nt5Qv+VZRVYXimjFY2equbsMKP5m70wqCCt7eXsANaTi?=
 =?us-ascii?Q?GqHlF80MketeSXSn7OnjWggbC4RMnepYCn5OH/xeNlYWRSJW3WIguoyDybB7?=
 =?us-ascii?Q?WvC2sYyaufOt6VQg0Zk1UtBgGPEfltZToVBJOmmF+z2cRudET+yyLEJ3pcXm?=
 =?us-ascii?Q?DnGkDNktRxJZxFcgh4B30tUAuCWYASxwIXspaoXm0EU5E+zZDBy4BolOQLue?=
 =?us-ascii?Q?PFZYF4TEuviZaGGX/2eUGNqzD2greX6tSjyvqCiJ49amC+xg2QqIL4lAR1/s?=
 =?us-ascii?Q?QDReY6eYQAbuwEiCC0MJ7Ejfiefkd9PIIjyV44hJZ/R3hjnwB73PduL6CxX5?=
 =?us-ascii?Q?Ab25pxrJzPHx/Cv4gPd4pBmYwKVBRKeWSC0qb/MNa8AHKLtfequHA3i/Owhj?=
 =?us-ascii?Q?n7i8Wg1aT1otDsmEHkQ87jb/7aYjUlijNHPOqiqT4jCpznIWPqyo8lqfCQ7K?=
 =?us-ascii?Q?v/+wH0qoquCxfEa84vj5sBjbsMS4qcZngahS75E7qu24gO44LHyCLLnmjnpI?=
 =?us-ascii?Q?EH1j1LEb7lX5GAs1Z6ksy0e5XUvOXFVVm5nnolqaLNyn5Kh4Qc6Xydbvz2U+?=
 =?us-ascii?Q?bJtQ3B7xkbHreDyj9SBgksJKDM7TZdYLrc0tDp5XNa8JsnuywANnvnD87gDX?=
 =?us-ascii?Q?Kw/JI+VQTIVyHgIAKlYSTIHc+bUyVun3xPAtRZFDExsiU60MzOR3L3ve3jhx?=
 =?us-ascii?Q?c1B/+dnr0idys/0c1yfoL9G/u+NhYZ4dXdpgswcrYvKjjzr7jPVFIc3Ts6pp?=
 =?us-ascii?Q?KUOqOgxVvP3poTESSilsYNWyx/LUK+grl7ZRjACPn5lFQA0ZyQhCsmLEoDMo?=
 =?us-ascii?Q?lIzWonXFAM0iWpQHhecPzVVWCy8yNYvsJmKwX8y4l4/3HyslV4inm3MHFEp0?=
 =?us-ascii?Q?YFOcLCmzlFZaGaVkrnj3qE2tbh0WOtIPfk1lmwh30yu94FiNQj22GYAFbCtw?=
 =?us-ascii?Q?vClSUqPenJetd87auDRUBMM3EX4I4hKLw2k3G9rpGe9wl79FgxEcqW/9pEkc?=
 =?us-ascii?Q?QKS5w5AxjJGbYrYatpTCVOgz2jEW/IHV5kQ8MIy6UKsPu7EGMMzvIFYjgFID?=
 =?us-ascii?Q?Hg=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 715fadb7-3e8e-40a6-1d5f-08dae2ba3b04
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 18:44:30.9672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3tOIf9bpG7FXchOD7IBLiG4cXUOX1lpScAy3vWrDL8FwZ1gml8j/UJe+IjjGM7Lqw4+xbfkKjWmve34sgs3liTMVd9q7m6bm7N1degik0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7763
X-Proofpoint-GUID: eAll0egyKfTKaYHGs1zqbPTUZHl01tic
X-Proofpoint-ORIG-GUID: eAll0egyKfTKaYHGs1zqbPTUZHl01tic
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-20_06,2022-12-20_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Current logic assumes that channel connections on the destination side are
always established in the same order as the source and the first one will
always be the main channel followed by the multifid or post-copy
preemption channel. This may not be always true, as even if a channel has a
connection established on the source side it can be in the pending state on
the destination side and a newer connection can be established first.
Basically causing out of order mapping of channels on the destination side.
Currently, all channels except post-copy preempt send a magic number, this
patch uses that magic number to decide the type of channel. This logic is
applicable only for precopy(multifd) live migration, as mentioned, the
post-copy preempt channel does not send any magic number. Also, tls live
migrations already does tls handshake before creating other channels, so
this issue is not possible with tls, hence this logic is avoided for tls
live migrations. This patch uses MSG_PEEK to check the magic number of
channels so that current data/control stream management remains
un-effected.

v2:
  TLS does not support MSG_PEEK, so V1 was broken for tls live
  migrations. For tls live migration, while initializing main channel
  tls handshake is done before we can create other channels, so this
  issue is not possible for tls live migrations. In V2 added a check
  to avoid checking magic number for tls live migration and fallback
  to older method to decide mapping of channels on destination side.

v3:
  1. Split change in two patches, io patch for read_peek routines,
     migration patch for migration related changes.
  2. Add flags to io_readv calls to get extra read flags like
     MSG_PEEK.
  3. Some other minor fixes.

v4:
  1. Removed common *all_eof routines for read peek and added one
     specific to live migration.
  2. Updated to use qemu_co_sleep_ns instead of qio_channel_yield.
  3. Some other minor fixes.

v5:
  1. Handle busy-wait in migration_channel_read_peek due partial reads.

v6:
  With earlier patch, multifd_load_setup was done only in
  migration_incoming_setup but if multifd channel is received before
  default channel, multifd channels will be uninitialized. Moved
  multifd_load_setup to migration_ioc_process_incoming.
  

manish.mishra (2):
  io: Add support for MSG_PEEK for socket channel
  migration: check magic value for deciding the mapping of channels

 chardev/char-socket.c               |  4 +--
 include/io/channel.h                |  6 ++++
 io/channel-buffer.c                 |  1 +
 io/channel-command.c                |  1 +
 io/channel-file.c                   |  1 +
 io/channel-null.c                   |  1 +
 io/channel-socket.c                 | 17 ++++++++-
 io/channel-tls.c                    |  1 +
 io/channel-websock.c                |  1 +
 io/channel.c                        | 16 ++++++---
 migration/channel-block.c           |  1 +
 migration/channel.c                 | 45 ++++++++++++++++++++++++
 migration/channel.h                 |  5 +++
 migration/migration.c               | 54 ++++++++++++++++++++---------
 migration/multifd.c                 | 19 +++++-----
 migration/multifd.h                 |  2 +-
 migration/postcopy-ram.c            |  5 +--
 migration/postcopy-ram.h            |  2 +-
 scsi/qemu-pr-helper.c               |  2 +-
 tests/qtest/tpm-emu.c               |  2 +-
 tests/unit/test-io-channel-socket.c |  1 +
 util/vhost-user-server.c            |  2 +-
 22 files changed, 148 insertions(+), 41 deletions(-)

-- 
2.22.3


