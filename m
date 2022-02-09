Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCFD4AF41B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 15:30:16 +0100 (CET)
Received: from localhost ([::1]:36850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHnz5-0004q4-BX
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 09:30:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHnZE-0001Gx-PQ; Wed, 09 Feb 2022 09:03:33 -0500
Received: from [2a01:111:f400:7d00::715] (port=53856
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHnZB-0000MG-19; Wed, 09 Feb 2022 09:03:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxedCkW+ORLKyKXFi0AlJl9JHJgWMUFTAXbL1/kTJhjQYGOMJz+8HJ96sXROiYTXG8sCPRtdl3NahOAC+7b/+HWFxFu1VjAyXn8MgC2LcLQFUOuiaKodxSMvf1ZaosX8r1piveA60zgEQVLHO4/tqDn9+QcpAVh4pXo4usEOLk+wP3fJT1ppoX8Jm1aDAmCLr5XXUVM/4VA/Nv8gLSaDXHcTcu1OWFkAu8YA1ZAuBDctncqH6VUxC/u3SY3UmaqY+xtb/mhj59eryIOQj802DLzaAEhRnhJJm3efcKaU+bA+hIWmqXjT85KeElOa8SLDeHT3Qar/BknL5ISxuPuB2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P12LQb9jGsMmg00WQJi76iuYrjvnuO7LGuStrhvOVU0=;
 b=Hl0veHdynVMeGt1jK7PdZOLvyR8P4S03pjx5IH/6n06exhbKRKPxFGJWxTv94LWyigJ5yxtWFGOIcunSTrj8DXIWdZz5cVlfXQxMDznon/euqL4rjTVOGxKsexS7+/HLimTlpFCWS1tLflfxTCmaysn+uIBEk6jZW/GyC6+5s65E/lbsBOClI5eyEugXiWd8NN5rUYdbZp9X3g8rrmVPD+oxhUW5AU3SZzD0X5k53GJqFEBiy0lsHuvUxeKhaU8whibaW5dToPzYUti7nR+IkcjT2jUECAn2iNPdF//sEoy6a+3y2i8e8BK0jHetdP3olSMHBMacu+/nhBaG/ailxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P12LQb9jGsMmg00WQJi76iuYrjvnuO7LGuStrhvOVU0=;
 b=LCTg0iEGaweIubGxTVZk9gavPIdpUX0jjd7QfSTiGPKfJXQ3uykRPXJV4IhOMB4VOTt854K6+adzgesCzULxZxKLaUn23lrQDVqcCsEryDmgTzG0zlOd9XTWEtMqhVRJA37PXbfA/jgCaNW33SwM8ZX0qU1HVE+TuJatGY1ntRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5698.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 14:03:11 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 14:03:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 1/7] block/nbd: Delete reconnect delay timer when done
Date: Wed,  9 Feb 2022 15:02:52 +0100
Message-Id: <20220209140258.364649-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220209140258.364649-1-vsementsov@virtuozzo.com>
References: <20220209140258.364649-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0192.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4aa1f47c-f3f0-4ca7-45a6-08d9ebd4e84a
X-MS-TrafficTypeDiagnostic: AM8PR08MB5698:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB5698F2A041A4A0BC1CABD54DC12E9@AM8PR08MB5698.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xEylZpPQw9N1b1Ms/gcqbD6XxOnhS1FJFNmPNJBjZBT79Zy+2IU1tdyD+d1Pi9LHCWMj48rApAXWQ5nkBq754uQW8cLGaKRdnJl+gUUcohP5PYLRZUllSmyJBVcXOBcw+N5we9iPDTMTvvxsGPtT80Y5wCufDheU/Z82BMF+6aq5l07mZLjRXfu+zIuGuBSNFXi4SXsQYm6CfvvAXT3vV0OGzU8hkU2XhNC1w82yDada1dI0B3EFrhzqQDSeLaJwFDL62xyRG+wtCmqU6c1R8+P6X4D4A9QauQOeWTUz881WTzWyh42Y3i7E9rsvAgL7sk9rNBh8V9CiH3r7rI+QJfa2p4rqsy8AgZTIFtaHZHAv2yItqV+sDeGw1nI072Z+9nQE/qE7FxkdEQ4gmP3xtMdRKqLx7+ynXUZju8j0LQmAnBhvHl5CL4lCQA22TWa0Of0f1PHCUvuSu/z7KiabKC/5IkLSRYVnkncnetUyb2dwRKmcLiC0e4klRiNFwGUQzcT7bQ1Kd1k3FkKjN3eHgwp0VW3zQNKM9UfuVBNDL1yFTVaxOOkHSt7tA8NH2Gmr0w2gJpFGdQS1WmYeWTSYH9sEkb/qR+hBavhlr+cZzQYOJdz/KQUciSNApCLVDSmHIp6Q3ZXveDW4DNaKy1aFle80Asweb/0v5RqC3S4ZqKMel6s5c1k/uEKaKT+U66/h/Oi0hHNCHIU3wLkCnhfB1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(36756003)(316002)(6512007)(83380400001)(2906002)(5660300002)(6666004)(8936002)(1076003)(38350700002)(66476007)(66556008)(6506007)(8676002)(86362001)(66946007)(38100700002)(4326008)(508600001)(6486002)(26005)(186003)(6916009)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i5yS0WNWc1HLlgLK89aSwR81p4WTR2X4xbQlDpHj3ap0olmWdQVFM3MjSJIA?=
 =?us-ascii?Q?4uJeZmKLmMsRMaZ7gIQ15l39zzdxPMPIafJqTQaBqQHMNuzzxplDxp2PnR74?=
 =?us-ascii?Q?TCw5Zd0rzwckkt0K3OFlb56NLU9E7clG9EmpY200mI1sho93ZW7uCUafXQTZ?=
 =?us-ascii?Q?8DRFmBp7Wgwtf08oEzOxye4HjqtV7+lCReGZuXm8n98k+PJHb5I/qF7EbUq1?=
 =?us-ascii?Q?isNMKY/REhrp4wNhNTRZ+kgJhfotEQv489oTT8n8CRqSbd82fmVMYCCnSv4y?=
 =?us-ascii?Q?OLuerVYfscd7Ep2+3MqwBoeFxlh/N8vsorOZ48tJfH0T22B0eGabtw+kX09X?=
 =?us-ascii?Q?Pbs2gInX91iFfCA9I7OsrHtibwvJpksiwkY1LVhLfNsgUqiWogXicBWdaPXh?=
 =?us-ascii?Q?xHTf5GXMcPOstRxo6gpDcahXUjTPUsQM9IeYgEi/Srd1/Yt2jUulddYG3NAP?=
 =?us-ascii?Q?yxoneZ4cwcPI8HwT8zboNaxUEyTvEcVByWZBFMy4Cs8MCQehB70l0b1Pvyey?=
 =?us-ascii?Q?Tto8ctgh1WXQlikhZRCaqI94PoNgx76aPl5QqIh/5adVDoybSQ8wgSdp0t9h?=
 =?us-ascii?Q?rCQjdTO8p4NT655BdCkco94rmVchglPr79lYcTBU4/gzGPDjCvVWJSDBpnPX?=
 =?us-ascii?Q?mLgpy3mRq6GvwnsRy7bYrRIwZx4Wzy8R+uktJfBhbGCCg0dkNsaVDdhPNHfp?=
 =?us-ascii?Q?NmQcfZ2h5P3PDDzGjeMWf9Qar4NJ2ocAkCPyrY35SVndUQvKILHAJpqM453z?=
 =?us-ascii?Q?xRDmCURMt4+ZEp5GQYAch2BL3UgwWQ9D2UzIa8yhrjlcJVZEMmqciuwPqa4y?=
 =?us-ascii?Q?aDLLGsooJWwX14rK+RKI9decEDzxKR/zrUpQXGkgK7iL4WSpdWU06/pY7OTI?=
 =?us-ascii?Q?gP759EoLzCoZIJUW40Xl/hrl6qZ61TF5mmv5iE+1mKVFhJw+mwx4Q22dSzrs?=
 =?us-ascii?Q?oUrv6hV81FOuOBF0ermzr/txl1i3gw10p9g9ZsYRm7U3VuhhYs2XICoiGh4m?=
 =?us-ascii?Q?KnfN+8mSiJGfpvFY5ddq/7BDziW2Uxb0RMEtKxCaykUnwCohx1+z6VN3Eolp?=
 =?us-ascii?Q?Rgi0OZIbiTMytrwn1hs2mWSZP8pQTbueHh0AuIFSBspAE++RNVne3TPVq8uc?=
 =?us-ascii?Q?xBRXe+x77I4ecozv6ZT+QzwqyJFl9zJCNRyTVzBXr8y7lZfnif+7Sy6K8g+5?=
 =?us-ascii?Q?0LxqwWb3tZjx8KxbPsmk0xqxWAC8l+DeVgc6KzEQfZmf+5EuUV0ojiaFPoUB?=
 =?us-ascii?Q?klPGj+gjS8eNRj80BZX4ROBwJM8mmXfwRCiVmPVrYeTIDOfGRnBM2uzZhWHO?=
 =?us-ascii?Q?7HLaEiJZdbJb+sVMYT8qiQm0n24xNNpRLkavWugF/1DQulNBRuuxdJPN0IQP?=
 =?us-ascii?Q?7a3rmLrKkCccekTYc0+At36tS5J6ZM4TdPjLE7j6t0OVMPU74Bo/CzlVDF8K?=
 =?us-ascii?Q?UvXPfQpOxpYuvcEQr3/gEnrnwtdgjD/YPumr/I5bSN9CNG2z1d8T8wB1syV4?=
 =?us-ascii?Q?5hEMBf/y7vy+1gKkZJAH900j0D9OtSKsxdPP5ZUSsheJvNhR55qmXkCPdb35?=
 =?us-ascii?Q?MeeNsntDy5+gt6VC+oI+hvTwMuzRIqtpLSVS8dPdhBbTOo1fpQYvQAHMdSq7?=
 =?us-ascii?Q?1Rr7NG1OY6fc/d6qG3Zt3nbYdBsqj1uS5QjEdsUTmWLEVfQv01ryYrOaUdJO?=
 =?us-ascii?Q?m5aM7Q=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa1f47c-f3f0-4ca7-45a6-08d9ebd4e84a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 14:03:11.3505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2sDSljL0ktZ5o1QsMMOaBgqm5/QhF4IsL5v8vC+fALfVFEiosIt4gtirsZ/HnKYW0N52WatjLVsru4lJHN/OQxieNkFCwWwfiaVTVXHlf6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5698
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::715
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::715;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Hanna Reitz <hreitz@redhat.com>

We start the reconnect delay timer to cancel the reconnection attempt
after a while.  Once nbd_co_do_establish_connection() has returned, this
attempt is over, and we no longer need the timer.

Delete it before returning from nbd_reconnect_attempt(), so that it does
not persist beyond the I/O request that was paused for reconnecting; we
do not want it to fire in a drained section, because all sort of things
can happen in such a section (e.g. the AioContext might be changed, and
we do not want the timer to fire in the wrong context; or the BDS might
even be deleted, and so the timer CB would access already-freed data).

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/nbd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index 63dbfa807d..16cd7fef77 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -381,6 +381,13 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
     }
 
     nbd_co_do_establish_connection(s->bs, NULL);
+
+    /*
+     * The reconnect attempt is done (maybe successfully, maybe not), so
+     * we no longer need this timer.  Delete it so it will not outlive
+     * this I/O request (so draining removes all timers).
+     */
+    reconnect_delay_timer_del(s);
 }
 
 static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
-- 
2.31.1


