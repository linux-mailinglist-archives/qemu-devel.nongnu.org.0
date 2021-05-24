Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1EF38DF72
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 04:56:02 +0200 (CEST)
Received: from localhost ([::1]:38904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0l7-0000vn-5r
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 22:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0in-0006CI-MO
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:53:37 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:47800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0il-0003HQ-Sv
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1621824814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UNalFBGc/Ht3m+gzxWylAiTO0PpEUInkVckaX9RBybA=;
 b=OoxMyZTCSt+k88ssSemtPb3xAm4eDsZ48X7Y3T3ejWRZ1DhrILd/zdJWAk5+B1ai8lTkE5
 zbGX/vdvVBlygMt1qM0vsicbPm2MC5aFPVXtx/aeWOiQEr94MYjbUdMlSyX7noxYL1Gihm
 vNFlYxuHuqG4Rb09D5NN4I+HuF+vUUk=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-QNgd2WMVPcGix6DS3VnCxg-1; Mon, 24 May 2021 04:53:33 +0200
X-MC-Unique: QNgd2WMVPcGix6DS3VnCxg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmVDP3BdZmhj8cUM5jFe6o0tD1K2ak3ZCEbFcrkxLeTKCjFuxWQgCUtHDM0q2NC/XTgk8AGqn9pd1IjC1QLbsoknqb+bJrp+w0+vWDa5AtBSVLIOWKefopuoIOLEOPzwkb/Eu3O/BOPZXnkUNSgjRmR9iNt1rXvwyqyEW6fHXrKZ3qkveJ99s4fXJGCqTOt5xgcgYByE+oThaJyXB9cMF35LeI4gDolROy9Noa7ik50HiS3H0oA2FNbQjsSuxWr6Zx5La0ulHHX9b2NKJkcBtoHM5KJdIHqw+ktlg9dV3AKIy0WxH0mjA/DGeMH2NO2iuy1AsM2oi9eKkhedGBqLsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLP5tI/BTR0VxI1/EsUoQNXvO5qiNu4tUO2V9wNzp+o=;
 b=bM1/1AxfnIokSy1xR5Xy7yzafVBV+jBTemxueaww3S/BF26IPOdVj9RR/8+ANy+Ko687YBsrgCiuSDL2yuwKkorxFdlMdbxYrB1+xIWzLfIxZhpHtI/Ly6kmeNgElWElCh5FruAZHfEkIw2KvK/Whlw0aEHp3FLZQzQJ68J2qnbFFrqLNlVJ22biiJ7suoZMNHRNqKZJh43l7R/clLww6IZbE1AMsoAHJpAAJlrAmzHd61TOVoqfTUOMyVFosOgBgo5mK2xrUVuWuVOodnnKBTpGKGN2AQTIbZbGT2tFVuTijKFNADKEEo/RBx8ARl0P4rxtXKDuuPY1q2NQKOm2lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB4126.eurprd04.prod.outlook.com
 (2603:10a6:803:47::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 02:53:32 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 02:53:32 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cohuck@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 cfontana@suse.de, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, pbonzini@redhat.com, acho@suse.com
Subject: [RFC v4 05/14] target/s390x: remove tcg-stub.c
Date: Mon, 24 May 2021 10:52:47 +0800
Message-ID: <20210524025256.22252-5-acho@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524025256.22252-1-acho@suse.com>
References: <20210524025256.22252-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [114.24.18.39]
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (114.24.18.39) by
 HK2PR04CA0057.apcprd04.prod.outlook.com (2603:1096:202:14::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 02:53:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a880322-8bb2-4b5b-82ed-08d91e5f1dce
X-MS-TrafficTypeDiagnostic: VI1PR04MB4126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4126B651A6116CDC0C4F5A65A0269@VI1PR04MB4126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EaAJn9K+bZ3d/0mRmYCUPXQ4oT7juvLI6Cn4J+Tuhrv1HOxPXTkrEWRSpixCx6aslPMykuSouorw8wK/KYnM+t4hpbwyQpERtDMq2k9O07nA4lw0ltgSoBHjCjJDC0NSPTEm3WbFJAWQTkHuWUgHTYSlxPy+OlhZ9tjW6gNdIrmpmNWVzeUS9PdE+1Gx1BkityW5AxIr6DAduuDEFUoYHGgkG3Ahz4T7DxD20Da+J3OJlyecEJiW+Ms82j9g0Eg1UQQqcgDVZWXAXTKRLon7Ki4N1B5s3YB+FsdmNxWVEAQdbH3ECj1569Jil5KNQe6E0jCFM3GbjFPIidgFFmK9ezuZiGxQFB2LUR4+krqdjP8pC+BNUZJlviXI99WyvXS6IMAgP3zCTKt+XvBGjwjaeqy6uuYE8IzFdkXysKi2MQ1qc5JqYSs2W+JRbD/l5tsP2XJQa9Id9nEIhoAg/0lj4LJHKmMJBHX1zUehL2RFCnruXOHzCpztuzQZQQkKVZxDNw4Sq7igJSRXQXVGiYYxArTW8DrPmitdpKqxo8IyJTR+9ynQMf1+QF+rS6ce+G8GLj8a2dDcsdKx5W+fmUB5yqkDB5ymuFl1hXaAfd4onAJEj/ET5cXWUKvJdzrpt/+akq8Z4O2Gj6NXPAmWuVh9U5OaPh2VmwCWZfitp2TpOI+/CR0iHgQRbQB1Mvoc3xPP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39860400002)(136003)(366004)(346002)(16526019)(6506007)(1076003)(2906002)(956004)(26005)(6512007)(7416002)(6666004)(4326008)(107886003)(66556008)(5660300002)(6486002)(2616005)(83380400001)(186003)(38100700002)(316002)(36756003)(66476007)(478600001)(52116002)(8936002)(66946007)(8676002)(38350700002)(86362001)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NKLvYDuhFb/WWX3B3GJod+8AeZJwH8CoXmuBlMxlGMboRqR9uF7nHXIk13hE?=
 =?us-ascii?Q?MaiCfLWpQK1IpbNvy+GxgYEZgIDBbJhEAPGWYPLlsXgwuNjPbH0nM/rLHFYB?=
 =?us-ascii?Q?ba3dDrPNnzqJ9Qu13Y+WkkBlo5PDmVRZE8zF3Ch5Xl0Cf5S+Uy5GE5D21H46?=
 =?us-ascii?Q?MKHMNJS06vqKRWcpj9KrVJ0HUiqxlQSqF/Emn3cMW/B4uHwxCFnwUt/HLJmE?=
 =?us-ascii?Q?HfTWx92GYLTsJKTJjiCMpmARD32GAXtc/pTpdqc10xTjacW5I4iLOfaCRb02?=
 =?us-ascii?Q?Pp8JmwTafAhZkppgaLfuZeohax33BWEXmPoGw8i5avLDnVw1hXDp0KDouazW?=
 =?us-ascii?Q?dhwKkz2sTSCtnXnQwuV5HksNk/c8M7jmX+0lpg30i9vqADSJfRgNZJLJ6gK8?=
 =?us-ascii?Q?WOBh71QumTRw1FCc8lbvzslYtb2dgua6H7TVNc8dTHMk1ozUu3xQyFHCpL6x?=
 =?us-ascii?Q?RlvgsQwhzyxZ8LvOABmRgh1NbagCtmJo5/oS7RdHzzkhG0JzrsoF9w4v0C/2?=
 =?us-ascii?Q?j8gi+e2Jmr75fV56SeGww0sirJNidJOd+1fHCI9uanIrttaXSeBFKcuVSyYl?=
 =?us-ascii?Q?diKmu6TCo2+xswgG5rxyb/Sh5zgS5i6Kq6Wx+Iu00HRxr6RGlfzdt03r5NK9?=
 =?us-ascii?Q?AP4JmM4Qmbj2b9b3U9r7YtuaWR+07mpvPd/0SnXHfrypaOaWhVjnoaXY3kuV?=
 =?us-ascii?Q?hrdsLCeG7Tc1SiUM0cgSpXNGi7vGCYlAFxAhUIQ011uo66Qak4zaMqJ3TlsI?=
 =?us-ascii?Q?l7B9Ccz+I+CG6kjKpgdsAOwjjTgz7Zn1faHP6hmiLfVf9TUutzILgwvRwm3m?=
 =?us-ascii?Q?5HMo7stEwDGsHOYaEW5sKN70wPHByE3uKNvwrhNUcCo+bRpcYnZ4p+V0jJ32?=
 =?us-ascii?Q?x3cj+hmNXHhqjkTd005OTt8qguzvXGjl4IxEmR4ZSD6P4zPA3Yuy2SBtxp9q?=
 =?us-ascii?Q?nsLqFCRfQc/HEGA6TefN7+g2FANpkXfG0+Ztb3Ap9uVNpTOcwpJUY3Im64Dh?=
 =?us-ascii?Q?9VlEyGY4+fRZcV9/pszIisBXMAO82pj1aQCjVxoE3/JLpXcqaPp6RSaoZmVF?=
 =?us-ascii?Q?lu+YYW4WuCMLinz7iQcAcnvpaKwWKmwHKQnd7snCfwdCqMemZhVWH8xQ5r2X?=
 =?us-ascii?Q?eoS2A0A7Vd4/9eC4i6+PN1fsn0nkZoPCRJ7R3u0uwcJjLfvODQGIBpF0tFOt?=
 =?us-ascii?Q?z02kCjxHCo9GdjNO+M7jXuwG16dPLiWtcWpYLOdG1wMUUcXsbqSRj8R6yZAe?=
 =?us-ascii?Q?MaVL/AVpWiQfM92njHtFpstcHBkl4KQI6qDAr1Q5IdjH+N8Rp2eY90Gt4s3V?=
 =?us-ascii?Q?O/XqG6q6XfX0kSzHXwUda8XN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a880322-8bb2-4b5b-82ed-08d91e5f1dce
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 02:53:32.3483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BXLfYzd2lcQrovJ+l0UMrnJUSkVxDU8pz6dje4dT5GbPkhmuR9xfamwDL4xsVFI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4126
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
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

now that we protect all calls to the tcg-specific functions
with if (tcg_enabled()), we do not need the TCG stub anymore.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 target/s390x/meson.build |  2 +-
 target/s390x/tcg-stub.c  | 30 ------------------------------
 2 files changed, 1 insertion(+), 31 deletions(-)
 delete mode 100644 target/s390x/tcg-stub.c

diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index 1219f64112..a5e1ded93f 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -21,7 +21,7 @@ s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
   'vec_helper.c',
   'vec_int_helper.c',
   'vec_string_helper.c',
-), if_false: files('tcg-stub.c'))
+))
=20
 s390x_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files(=
'kvm-stub.c'))
=20
diff --git a/target/s390x/tcg-stub.c b/target/s390x/tcg-stub.c
deleted file mode 100644
index d22c898802..0000000000
--- a/target/s390x/tcg-stub.c
+++ /dev/null
@@ -1,30 +0,0 @@
-/*
- * QEMU TCG support -- s390x specific function stubs.
- *
- * Copyright (C) 2018 Red Hat Inc
- *
- * Authors:
- *   David Hildenbrand <david@redhat.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
- * See the COPYING file in the top-level directory.
- */
-
-#include "qemu/osdep.h"
-#include "qemu-common.h"
-#include "cpu.h"
-#include "tcg_s390x.h"
-
-void tcg_s390_tod_updated(CPUState *cs, run_on_cpu_data opaque)
-{
-}
-void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env,
-                                              uint32_t code, uintptr_t ra)
-{
-    g_assert_not_reached();
-}
-void QEMU_NORETURN tcg_s390_data_exception(CPUS390XState *env, uint32_t dx=
c,
-                                           uintptr_t ra)
-{
-    g_assert_not_reached();
-}
--=20
2.31.1


