Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B490162ADF3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 23:12:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov49L-0007pm-BX; Tue, 15 Nov 2022 17:11:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1ov49H-0007pd-UU
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 17:11:20 -0500
Received: from mail-dm6nam11on2115.outbound.protection.outlook.com
 ([40.107.223.115] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1ov49G-0002xe-6y
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 17:11:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGh+y5PrpCjnGz9Ui+GgwHUQfbrrYnwQjK3GImNCfhS4kQfUHzw0UY3nAWv2UVSdvU7h6TK+SHHKQEW7RAVad5KS1dLmMeja0WNUkHUqqrk8WwdkD0G8KQ1b0BQfam/NMDFJUunqDiBo3VfPlKknNKXyRCdiBkaWYb0sEzGyytHm36sxaijwCiRGaFr2V2RwmytPRuJ8D1eSnTPKI77LebYurCGICBDRc038pIzAaQB5JYEEqQNq/c4u+BEJVKCfsxs6eQ98/4kVCZ23L0KIibTSWhE61Dba1UhuNwLR89zgMLl/SOuvmshWknElNYxINR2AHTuqBJzdK8ev/teUZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIz7+Q2Vi3Tasf3FhiiK7tAcUBwSimWYWHftNfd8lao=;
 b=gIJ/cJeaRgrW6oIXofFFJq9VkElM8pZoHLzPl29l++krc60ieQmPOdUUUHUMdkt2B8HgJRvKfaKqlLOZdMEGEL18NbGAbVgW1eMILR5Ee/Kt407XtK9VH8vQ/5SqQ+18kVOw3OBrkQmJDU9XyhPiSO92/l1mnhHtA39yywAN0vyulR4RV98nsvcr20J6v8mWlqhbSIk0UzxaUVfi1sq2J6sisFRrQyimNYR373VKRxpavLbKWa7GHbt6eHzH3wt/BkalNBGrzujiVBWF9PQO2GOfGsO5UwnkWcNKMFod31/A8ASMcZxbnoau1Vb/PQ+M+B78iHq2YEBn1Q9NAZ16iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIz7+Q2Vi3Tasf3FhiiK7tAcUBwSimWYWHftNfd8lao=;
 b=QHECPRrFhm5DWaEmU4eWyxml7oMojLPVWIWnzUBdWq/WLIjibyyeuyOJX3E9oG4ogcDG1BEcPICGr5zSiyYZYQeKLm7H107rS4yF+E2uuIrHW2/TInQap80+YEnq/TfRh4tCKBiKL2HAb2YvdpsDHsI/sxUv8+ZxSMzirSzGAzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SA1PR01MB6749.prod.exchangelabs.com (2603:10b6:806:1a1::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.14; Tue, 15 Nov 2022 22:06:11 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::24c2:adf2:5b97:f9a8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::24c2:adf2:5b97:f9a8%9]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 22:06:11 +0000
Date: Tue, 15 Nov 2022 17:05:57 -0500
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Plugin Memory Callback Debugging
Message-ID: <Y3QNRWUK8BLRQlaQ@strawberry.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: CH0PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:610:76::13) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|SA1PR01MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a0fbcb-8516-4e91-9fda-08dac7559a6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nk1083Z2yw9iSyD0IHmAgVhGKUpdjDT+ehJzXG/uxWnv+oT8PqS75HmVJ0k403P/W7Ygkbrtip/7xLOnSwvASBAAFVe62rkq3CgUtWrI3XftR+/OoVfNkTyUV74GyYL+qBQg8Cm/k2mikQFYzszk3MfsTehS8lNX+5BYFXKpZZllZSRN2cYqJ3EEaSMqKdbpvdEke3zmsITvSc3DuemLvTyKMNcnh+bN1dkwj5LmSvtXNzhXoShQwha8y9pHccykbOMTISo9AJLrFnE5HOCd/2ZDFEaHicF25MfHevGFyf1GYHVq5jDzKzVYGyceo7TFzsDRon1WqJ5jMgCZP9QHnLdbpHH+fgS4Dh9G6Fa6VStxl+UQmY7UYaRuiab7UC3YK/+8PLfogHC4wQwicJVpub/l8sHFe8uIOxNBarqpNKo5c++kRH4l0WETJoIHfCxmIq7jMqQXDNEy4wwYuo7JZdYTQfArAjHe/DTU68vdodIkb4bzVF1jZ0tPI+yqC25rAS/wB1HKk9hWs8QJujvoMSjdEpd7bW9WSLSdsGBs2Sw1z5qg2NhOIRujNhy3jk6+vwiCae8fzJqEvGaMcKwd5SIDA96hxY5QIwiSUMMIg/FbuCBHFMqlJd/rj1m/B85iwZ1TQ/bFgsMBXlGOg95+JN8JFw8tv6vG8S3dg5mH6hQtcYLXy96OUOWjF6X3QkP4fJMGweqmR/6nvn5jOu7PtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39850400004)(366004)(346002)(376002)(396003)(451199015)(83380400001)(186003)(38100700002)(2906002)(3480700007)(8936002)(6506007)(6512007)(478600001)(66946007)(26005)(9686003)(41300700001)(4326008)(6486002)(66556008)(8676002)(5660300002)(6666004)(66476007)(54906003)(6916009)(316002)(66899015)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pm9D/2ZwdZ6CDrRIQQsoDeq5kVNVRRRzKET5t00U2u2jauDeEceCJxw2prs6?=
 =?us-ascii?Q?TQbaG9PKuOEAeHcR81s2Uk/lJ+qe+Z8bMli088OFkjRaMpU6UwR9pSrMdqS0?=
 =?us-ascii?Q?P2yQA+vE9SAXCtiqHSB0Oq26d/NC+3mli/F3yTXSdYAEyeFaEC2D79QBnPLL?=
 =?us-ascii?Q?pLttaBTwzzgkj4IEzUZpWNaFrs9GvjhnPyCh1Nq9KMQZ9vZSUo3ch7/S+Bhl?=
 =?us-ascii?Q?HX99uBU6foslBC384EgRGud4uNEZBfkplBfvUDSYRAgxDopsMuVBCjOsTV0O?=
 =?us-ascii?Q?vOJDBWf/f8MbSsvFcpfyp0jfxp3mNlxgSdFYGQpPBhpmW7ExIjtDz+W2hbhT?=
 =?us-ascii?Q?VA7RZb/wwJpqQ21+y6mvHb80nbWQVWOLiL/sN0T/Z4AYYasC80YK9ASTL4Hs?=
 =?us-ascii?Q?/4kdkJfyx8PQ86Ezmg24MPoyCWrXzJb3/d7I60TKKmMrMcKz2rrsfJXQ6U2L?=
 =?us-ascii?Q?pmsAjoIfLSo8QhJTkZHvD9yxqw/9uSAX7C/jbv0FtMa5CebJNEUESrnFrjuY?=
 =?us-ascii?Q?qEHcbk8p87GhCU678UvhTXhE/K4aQWwduFZHI4KAExrslUPfc/AvCng1oynt?=
 =?us-ascii?Q?Rt0E5pLkz/lVUrt1YfdjVVahMn7mG/SAzG6Scrn2nC476qU1yn7K6llucxL9?=
 =?us-ascii?Q?ztKpbMA2UmizMh7Jh+YdXyFTDU0ZQWR6HDN/SjQoeLzQiM7suOiDtHuZsFcF?=
 =?us-ascii?Q?qwdrLOxR0WQmpP0HJKKTSsQnau7usp4xf2uhketRn8Dc8s/P+55LD/XukJMd?=
 =?us-ascii?Q?jF2zeR8J6NzBKkRsZu+9ma8zSJKRmxepyf6KqZNjgvh2YTIdd4P+qFN6oVpX?=
 =?us-ascii?Q?KQWS2v9GrpzLsgKUtV0h3n/4J2AvoTxM9sIDTtkDy7WbI9VjEwmjLM4M47bG?=
 =?us-ascii?Q?AyR0Q/nwSsacpdRhq6X9Y+i4l6d6DIL8UqTSoeFy1t5Dk7/PjYud2uVl+nPR?=
 =?us-ascii?Q?47pu800Nt/MEvsVms1ey1B+1Q2/CGG06OuvJ1DSzJpopFEVBT5URviPAHf+f?=
 =?us-ascii?Q?o41gOIHmoijBd5QcNp20yEvHogFljtcqzM9p3KS9h95rNTFjikCkw7Cyim9I?=
 =?us-ascii?Q?EipK8vPYGRD7g46rfge4X9JkVDyLcRCwOEZfX/aC+gs57v+oqceUlAfemu49?=
 =?us-ascii?Q?rpISUgx0WPVxCPfaH/b2vJIMjBE6vp4MXT+ehCmtz+xTeeHRxMA8cmqWtP5I?=
 =?us-ascii?Q?wdG8USVGa83WGerGNNuk0O0eHkUKG4vS89x8ZeJfVK2LBpesHKKggIlH9Fhf?=
 =?us-ascii?Q?sasjkng2Kg0CaL+AYUgxfdIg6hGCa0SDtqVQ10XajWxZChyXykpace7XhtzT?=
 =?us-ascii?Q?6mcVUYXG/P9dkBltYda7fNBMYfYoWuPFr14xxAnxA1ukl0+ymgog9lQdYqcl?=
 =?us-ascii?Q?yLJtncsFo33kjc21zqPE/BmbjwLkzhpesOqI4KxVaji+Ba+mUu/wCWKLNZ4r?=
 =?us-ascii?Q?f3JvwMBff/odZB+kfFoR9EowMzF3r1m0dCYSYfcE+jUZpYe5KaesidL18pcX?=
 =?us-ascii?Q?vAE83oyN2JOXldZnbmNdcaVqyg62Cti1UOYCLUsoqLSncgnAGI/yvYGxcgZo?=
 =?us-ascii?Q?2J8OEL5o6zGHPXou7emjsKwEE3pIVhWmDw+6sazPK3CpcOfMhpDoPZEFpeJA?=
 =?us-ascii?Q?M0D4EOAbB1kZJdnL4wQqPi8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a0fbcb-8516-4e91-9fda-08dac7559a6f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 22:06:11.7248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NsfiseHWiycHxXsJANACh7WYUo4zD1rAc55nZOIYT90ux0OQnkYVAK/wJAczE2rsEObq7UfzZZyDtgkdWMgVkX4P/7EsX3N2cDo+FcxrsSP0IVOxAUZ9saYvx1Wtz/1c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6749
Received-SPF: pass client-ip=40.107.223.115;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Hello,

I have been wrestling with what might be a bug in the plugin memory
callbacks. The immediate error is that I hit the
`g_assert_not_reached()` in the 'default:' case in
qemu_plugin_vcpu_mem_cb, indicating the callback type was invalid. When
breaking on this assertion in gdb, the contents of cpu->plugin_mem_cbs
are obviously bogus (`len` was absurdly high, for example).  After doing
some further digging/instrumenting, I eventually found that
`free_dyn_cb_arr(void *p, ...)` is being called shortly before the
assertion is hit with `p` pointing to the same address as
`cpu->plugin_mem_cbs` will later hold at assertion-time. We are freeing
the memory still pointed to by `cpu->plugin_mem_cbs`.

I believe the code *should* always reset `cpu->plugin_mem_cbs` to NULL at the
end of an instruction/TB's execution, so its not exactly clear to me how this
is occurring. However, I suspect it may be relevant that we are calling
`free_dyn_cb_arr()` because my plugin called `qemu_plugin_reset()`. 

I have additionally found that the below addition allows me to run successfully
without hitting the assert:

diff --git a/plugins/core.c b/plugins/core.c
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -427,9 +427,14 @@ static bool free_dyn_cb_arr(void *p, uint32_t h, void *userp)

 void qemu_plugin_flush_cb(void)
 {
+    CPUState *cpu;
     qht_iter_remove(&plugin.dyn_cb_arr_ht, free_dyn_cb_arr, NULL);
     qht_reset(&plugin.dyn_cb_arr_ht);

+    CPU_FOREACH(cpu) {
+        cpu->plugin_mem_cbs = NULL;
+    }
+
     plugin_cb__simple(QEMU_PLUGIN_EV_FLUSH);
 }

Unfortunately, the workload/setup I have encountered this bug with are
difficult to reproduce in a way suitable for sharing upstream (admittedly
potentially because I do not fully understand the conditions necessary to
trigger it). It is also deep into a run, and I haven't found a good way
to break in gdb immediately prior to it happening in order to inspect
it, without perturbing it enough such that it doesn't happen... 

I welcome any feedback or insights on how to further nail down the
failure case and/or help in working towards an appropriate solution.

Thanks!

-Aaron

