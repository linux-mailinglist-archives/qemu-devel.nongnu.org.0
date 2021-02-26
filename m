Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8D432672D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 20:04:48 +0100 (CET)
Received: from localhost ([::1]:58980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFiPv-0005bn-3H
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 14:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lFiOY-0004rZ-DN
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 14:03:22 -0500
Received: from mail-co1nam11on2108.outbound.protection.outlook.com
 ([40.107.220.108]:62816 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lFiOW-0007iu-8m
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 14:03:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEqwxzwCjfJzCuxjDtiERAqb3C8B9ilyFyLjUEplmeKEJut/BrFxnGp1O2orX/0dVfo3c/wnMClOlT2ygDP+B2KpgoiRk4JunCVSO+PofciycoybzV/vqeHA4gZ8TvNSTxZXPBVoF+THUg1NGUJr5RVbAOqdmmiOA9EO+6iZ9rJkJP1FOL0bPPRIj8B1OVD/QuN4VYSOHzaigvkAc4crRQpR9s3GcH9K+VU21k0lriQDo9q91CaTvJDgrp8cPRexC/GQdyI+3V3WCIT3Of1PUQaELHCwApRU0X0dwe+p95rzfvS6X/PG3rirJYkUQcWDnAM8VM0/QmYB2IkOQELl2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fffgq5EkJEzx7wyq7nAE4Nb3vpKkX6pCFFo2RUcYPr8=;
 b=UPuf4/VBQaVe0tmgLJAIc5Qj3bh/rq2GwMgDSTYg4QvrqCzQTCn9MLDhpvGtI2XJ34/09Odh/0ddmiv7Y/Auv0hYSTGCIQZPuaVTRa6vZduX4gRUxJ1foFbZLcOtkqIycaqgu1FPjUPPKmCm3ffumCDVIW0WIUJTLe46HWUQZjB68cspaCrsazJlGhbjtDE2zrft3ckW+1Z5tehEnoGZ+86XAGTQM7nw+YZ0s4aLExG51dnfL0AVLUnW6B+zRDEwMmWkE0a7hBi243IytkDM0SnBrJp9X9KoK5Tw7cSMhad5IS8RWltZGBjsbjcarEDSyZJ2T/D84qOz7sTucRtGmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fffgq5EkJEzx7wyq7nAE4Nb3vpKkX6pCFFo2RUcYPr8=;
 b=HRnJB3gyoinuwdmO2QJk7MeUvzwEvRlml+9s4WIR0nRrzhHU/cCLM9nyctS9kFeGqP/js7KwxIyZUEUUUNfj+NgcPZcVSp9ppzp4c+FPdrP9K8CA2O5CGU/eSkuvp8rrR7CXkqqaKdWEeb1fIviuX4IueRPqNNQ0oukGd1MZdqA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3485.namprd03.prod.outlook.com (2603:10b6:805:49::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Fri, 26 Feb
 2021 18:48:13 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::1ed:b27e:19a1:5bfc]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::1ed:b27e:19a1:5bfc%4]) with mapi id 15.20.3868.034; Fri, 26 Feb 2021
 18:48:13 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: jasowang@redhat.com
Subject: [PATCH] rtl8193: switch to use qemu_receive_packet() for loopback
Date: Fri, 26 Feb 2021 13:47:53 -0500
Message-Id: <20210226184753.230037-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210224055401.492407-1-jasowang@redhat.com>
References: <20210224055401.492407-1-jasowang@redhat.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR16CA0036.namprd16.prod.outlook.com
 (2603:10b6:208:134::49) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR16CA0036.namprd16.prod.outlook.com (2603:10b6:208:134::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Fri, 26 Feb 2021 18:48:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4607fe66-16da-489e-f446-08d8da8711e0
X-MS-TrafficTypeDiagnostic: SN6PR03MB3485:
X-MS-Exchange-MinimumUrlDomainAge: launchpad.net#6241
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB348528CEFED9CA66C28A53DABA9D9@SN6PR03MB3485.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:268;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bk1Mg9vxhsfgjVLLL4s4zmVIkewH5aeE1HXYzzUiv1hfT8J8i6S3inMqQfgR/AkJiWD9s2fsmVy/RJA+nyxNxQx/+1udVyV87MDMfRcrSCTCeFw2ikf+0KmEmQFXYoWDHc2brEsHaSzex36OSYy7cpW7xyIorlsjGihGWgX84N4tw/4gqmyXPL4LC/mTOo+onCRv/p+y97Lb/BKrEoxrN1vx4caw5h6JJA/J21bQcFkm+bylnIQR7+WfBiXx1zx9sWDt91cBKQVSvk5kynmoA8f9s+xZx4ger/NG2hatS/2IGhm7Td7A6uxXw4arEl3RgdU8YvNGcM2DLhEYshnEqLfSJLYSiLfx4lPHg4INfvrf8O9UuGpFqLbyBYI5LL7/AoV+3/H+vOX62BtivRCG19jsWuRQB92TzbKvlyFbuNKKRDrXNpGlP5B3N6+X3t9LzK55s1JdxZtqYF4dmgE1G9uEtx1qGCNRjoZ69AFydweCsQIl4p6LKmqQKHdxHVzyrKigB4N661J6zo31G1nX2fYvg8UfXbFB/KoSojn4Vc8bBXtG3hW215iVdMxuJ6PWNpvufNCs0zSDoqzNR2fN2/jBBSyW02dEUTVFqGLD1Gs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(966005)(4744005)(186003)(316002)(6486002)(8936002)(1076003)(786003)(6512007)(26005)(2906002)(16526019)(478600001)(6916009)(5660300002)(75432002)(956004)(52116002)(86362001)(6666004)(6506007)(66476007)(66946007)(36756003)(8676002)(66556008)(4326008)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yH86jwksz/IKmdHhd/LtKJcNDlf2KcH2vGG1rbweupYLDJk80/yPtscKpdKz?=
 =?us-ascii?Q?Jw7mHlpQ6o2Erq+EudvK4ekN2VUAGFUrQ4U/ch6M6Hldo7SC8pYAuaYn289r?=
 =?us-ascii?Q?prjZgy8YmHQNlVCxcHIFYkZKrfc0k0/F2+wACecvrY6KbCYsd7DLhzCShInF?=
 =?us-ascii?Q?+ZeDHQAfBV8i9CTema7l7XQuj3i0tdXF9N4EYEJt0U+aU+MVKfqv5UTIF3fu?=
 =?us-ascii?Q?K3HZydieu3Wglg1MvgMDiDLo1W/7aDHatHRhYEQFoxhNO/2YAp0G3Q0vN9/e?=
 =?us-ascii?Q?MSYTo5D6KTCodHDEcBmWLUDiz6uLxLSbAiB8eZ1u0hpSqdZHHU4p4rTm+4tc?=
 =?us-ascii?Q?hf+EgsNbyyGaY2ZNJFLob3X0SwHhYY7gGlpchWT+vxyJyLgDEtJXYoGpOkDe?=
 =?us-ascii?Q?HDhn0aLVKs9LiNAAkGciIO0kX1BXbKD2jMggPFtYft6H4gWFc9LA5I2HOTQ1?=
 =?us-ascii?Q?jUWHWFSjbfVMUQXxocBXJ8i6IHDiLpv90gTxgsNFWE8X38654q/+wds8KY3T?=
 =?us-ascii?Q?NuXIAcuuz1OyL2IObDAKbjeQt8rno+9iNPkmkl1Zelwi4afkQQiUt08Ggvt3?=
 =?us-ascii?Q?2g/uAndHCSe2K7HVLAeITDWNqF5LDGLeU6QeKV85PjOI3A25PChPJrBtLt3e?=
 =?us-ascii?Q?8eI1ITRwxr7TAoX7SDZMQ2+1I6FWLxxUptFAl9ISphtFZybp8MPortFoeaQ+?=
 =?us-ascii?Q?BzA4aDiENTxDAnz4jCRcRoADud87T3ansgVb7De63P2/joIuSaC3KUmotfLl?=
 =?us-ascii?Q?YttTpNou1jO8eczj4BEVKG+yNbe1HOFBPITPXkaWfyBYfJc9U7cNzN9lyk7n?=
 =?us-ascii?Q?qfGIrPWYvq+HD6um6ollnHNlrYcmmILspt0J1r7cO7A+n0Rxv4LJ7eXct5Qs?=
 =?us-ascii?Q?wisDlAo7wskvihEUDC41uVBvBssQgUKBo8O5STvaw80Pt/TjP0fpdWVk/Hpy?=
 =?us-ascii?Q?BLjjJ6HwjtgSsQ06q6LyErxykemFe/2dcryrgilJ7ub1dVv6oxax2NjP9cg4?=
 =?us-ascii?Q?XEBl4rb1LoNmyoh7JCkaDFCCe1o864AiepQA57mTedEDcTJSm/Sn7Vwx8VBa?=
 =?us-ascii?Q?pdy+ffO/qhLc3BAzdRAQZ1HE2BxtBnZlOrsxecIG+ojh2b4mB2IW/Ylmk4aC?=
 =?us-ascii?Q?oVCouhhTI8mqsNFNTqGYftx/zJNBMWR1hGNkBr2tDSXdg/Co8DPu6eQgm1Pu?=
 =?us-ascii?Q?5V1lsZwISKAD20H8pIe3sKbKgeKjDRBZ2FR/sBS26cJR+FYoGPsI59iPduDj?=
 =?us-ascii?Q?LapKQcxEER8eWkwbzMKY58QwzAWzzY1C0Jm5lCNGBSKWR/+J1IvGRo5qD3cz?=
 =?us-ascii?Q?tGvpBzZpnIyp/qienHs1HvsR?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4607fe66-16da-489e-f446-08d8da8711e0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 18:48:13.6685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5ttuWOOYl25yuroYH6Aa31nhhwuWQz2GKDTiYXP9KWpuRBU6+y7JA2kpO5OUUzz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3485
Received-SPF: pass client-ip=40.107.220.108; envelope-from=alxndr@bu.edu;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>, ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch switches to use qemu_receive_packet() which can detect
reentrancy and return early.

Buglink: https://bugs.launchpad.net/qemu/+bug/1910826
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---

Although it's not a nc->info->receive() call, maybe this can also go in
this series?

-Alex

 hw/net/rtl8139.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 4675ac878e..90b4fc63ce 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -1795,7 +1795,7 @@ static void rtl8139_transfer_frame(RTL8139State *s, uint8_t *buf, int size,
         }
 
         DPRINTF("+++ transmit loopback mode\n");
-        rtl8139_do_receive(qemu_get_queue(s->nic), buf, size, do_interrupt);
+        qemu_receive_packet(qemu_get_queue(s->nic), buf, size);
 
         if (iov) {
             g_free(buf2);
-- 
2.28.0


