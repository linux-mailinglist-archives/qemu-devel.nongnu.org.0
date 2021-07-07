Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753CA3BE6D7
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 13:04:13 +0200 (CEST)
Received: from localhost ([::1]:46482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15Lg-00016q-Hk
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 07:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15CW-0004Ev-Ha
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:44 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:28232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15CU-00025w-92
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625655280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5DjbauwFNgxOCXyXac18fRIUZBg8nTx+f+wOEDgZLhU=;
 b=G4mVFOIgItIlrkOb2uBQN4aE+rgzfuTZE/dwBU0K8KNUS+RGoUfoegLgff9UnM+3g+Xsi2
 9maZ2qlMk+DfXAisSZrDEq7MqJ1pTxlYnttTQUquz5aq4yEQgcbP7Dn+Sp417xjEVWDTV9
 hQKy13/sT2aCafZHFx9VcP9IYUoovfE=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-3-s5AjYVIGM0-n8Ex2nRrK7Q-1; Wed, 07 Jul 2021 12:54:40 +0200
X-MC-Unique: s5AjYVIGM0-n8Ex2nRrK7Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJMBms5v8wdZHimZrmUUTv0ipVfipXaileMOi6HpGuykKzE9Zk9lJUrv4NbV6J1vzVGALPtJ2NvrALWQ7xLQeHmMHQHbezqDkAVk7akQG6vkY4ENmP2f8J+MGcqzB+oReZY+yH5u5N+s5CrRvwtG8VtYVLe+/OXXgu782GFnclPImhZtm4/jZnmh5akA9djBnf4BkPGmpQRPi7V7499KIk136Kd4srrFHtTN23OuVUk/bWDrxbMkdmDv6I2Ypo/MpbX64hxRdSS3poAeMgvlku7LhP+3PSK+T5JMP8rpEPS48G2kK6P1pHbw8WJDp3Cf5OqQIHrqnD12bO4h3dvotw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yno4gp86gLBIzeeGhLIbh3UbTT6R9mUb31hYYBaQYE=;
 b=j/r8/Cy6SZw+AIQRzCk/rD6sIX4RfyOeEXUyHgbVpzDZyz3r1zkRbZFdQ8epXAh5RKLQ8F25GAVrXl8DsX6MREr3QYtmyjt4E39hyIEJVO/+27sTxGCMZZbiaSqht1Kd1sTJfjvR2UdG7qpkeLbWVNOgm5oVFHoy0VAAkAC/q9QomRjuiPPfMT+0IYAg8UE0lP8isKZh5zu/kvZyhALpIaCD/sI8/yvUTPYS3qUVALOqHaP/lUWCRByTPG+xt+Ii4B1awUdnyDdDGY5nMsr0vZHPyqPab39s2RztBFVmH2I5aEoZfRs9zWOZGqdJk3pvl0OA9F3+k3H63fnxqce2Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB7007.eurprd04.prod.outlook.com
 (2603:10a6:803:13e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 7 Jul
 2021 10:54:39 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 10:54:39 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v7 11/14] target/s390x: use kvm_enabled() to wrap call to
 kvm_s390_get_hpage_1m
Date: Wed,  7 Jul 2021 18:53:21 +0800
Message-ID: <20210707105324.23400-12-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707105324.23400-1-acho@suse.com>
References: <20210707105324.23400-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0076.apcprd04.prod.outlook.com
 (2603:1096:202:15::20) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.20.159) by
 HK2PR04CA0076.apcprd04.prod.outlook.com (2603:1096:202:15::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Wed, 7 Jul 2021 10:54:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75626a71-72f4-4145-ee2c-08d941359e02
X-MS-TrafficTypeDiagnostic: VI1PR04MB7007:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB70072F2D3FDA521C4D232783A01A9@VI1PR04MB7007.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UiamfU1qHsWvGU5fHNQ5nKhxV9wwTqVw/gdEQVVR1XVEWAsa//AWzrgoXOmtu57wpX3U59kkhdrqG+IvBhMX/HEm1jCBuB1JNNZEIxngPjxRNEZaHAdz1V0vhiiII4dlYES6QfM6ieCWPivuWex1aiWizJiBsirSbegh47C7LynZZaTE3LFTeZoCFIF8fZJwT+5zYkvMWP7Ap9pbEut5mQ6s0UnVS/XtGYc2Zt7uSSNztAT/02Zxgz7kd82hkw8T+ckOs1tfat4h3WParvXDJrsiu04wdcbS8donBtlxa4O0RzFHPrflPGMZKPFJwaMKfdbNxGueYVN9bsF77wcxUyjG8taNdMm++UrrwLKfUobdvBilTVxiEfOOCFEYIYzM56SBVful6sWS05LG1nMMl4hmI/wYv4/dX+LRY/KpUsbZ6xhppiX4zoQkSuzvuocv9YYQesRyf8leTCsW1vjTr0Qv69MV0dmjWwo2PMzxGAK0wgdHVJGnfU4RK7/YibuS3LBE9WCfdmfYSM4oFwK9olBB1OGjwbOtR4FNB5oQYKitg6u0Z+ih0OtMZu3DqOvIpahCwfhllNG2ix+9sMlmF6e/pMZgA2OcyjDrRxU6OUL7n/pFuL8Fy9QvUPf4QbVcPpz6SnVDJUiRoyC3naPeuH8xGmqmcSIxgSbLah62I92j+TQwe4GaUjT0hhntEYOwv8Hlo/ySkUb/rzNhYMaJNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39850400004)(396003)(136003)(366004)(5660300002)(478600001)(2906002)(1076003)(36756003)(4326008)(316002)(4744005)(86362001)(26005)(66946007)(6486002)(83380400001)(6666004)(38100700002)(2616005)(186003)(66556008)(956004)(8676002)(54906003)(8936002)(66476007)(6496006)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EwFIAnO5I4svr5I88NRTG4VDv72SgMTKKe0dFmkGMw5ng+Teoj5XRAE6epeV?=
 =?us-ascii?Q?SLjqlQgEF2hNByAKmmelPTnnC2ZiM+GDC5OLKJwW6nhrIgGVdcnUQIURqnTr?=
 =?us-ascii?Q?6IcRrzUZCjuab+iCeBsUlnmT82f0sDw5TX4qJHcV3KsX5eFCNWsJTZWaZgNL?=
 =?us-ascii?Q?4uftj9xit6Vh1GRgcZ7PacbBwnVwsAwhxikcaXQtwwDgDeCyMSTzJUSeKnh0?=
 =?us-ascii?Q?xLOT78y3sazv1G9wCPeMKldjxS2E2W69qqh7ogdpy/gDd8pu6xkvX2L3HaCt?=
 =?us-ascii?Q?woBAjDFdMZeqTRLi8s0wC+VkZ2jdMQ5vQFncDKpPfT/W9zszGW/cjwyc9YqC?=
 =?us-ascii?Q?UBTBTdKScDkk4C9YAxeWSeDtl6pALwjLvM93gLy6ugmnf7/TB7m5G62bebp2?=
 =?us-ascii?Q?wa1uv4G1myXvKIDUX3Wgd8sQ2Pcw+gE4OjnrfYFnUFfcsM8HSnvxadT2t1Oo?=
 =?us-ascii?Q?AqNCeWKtB3Vxn/zychXxGpyKVsiXIjvAHlzMOeB6mir5rOGbLkKphn3r7gmB?=
 =?us-ascii?Q?MjGYXDL7M2FMGREWSTXUMGb2skzu5Gn+93WeB8Pt3axg2yvG1tXHq9ECtL3+?=
 =?us-ascii?Q?zTuHGRWw2pNZjCcBJpqcFiwlQEjgvg2YwD0DsOtVgZbmwxw6DHe6m3U4Lsed?=
 =?us-ascii?Q?VMjZtpdT82v/33PKY+ofC8nzN4+jjQj5t8SiDaUWCpAWJp1aSKIWLsmCdoI/?=
 =?us-ascii?Q?TbNIjbGziOYEGBi8Qxz7VWazj9qZz9wSi8+iDd7Dv5ZoW2QfTuGgYcuadOzy?=
 =?us-ascii?Q?OqvltMjNC2KYwfLNLwZmGTA5ifZ900X17VlL6EnK+1fb4uEph2wDMTdPfLjv?=
 =?us-ascii?Q?bDV6mSif1oGEQV0YGa0oUkXOz2Sm+Y4JwM/BtMF3l4AI0a/EiKq/e+xBeWcg?=
 =?us-ascii?Q?ZY/gSAlvAka83Vz77WmmPQeznWN3VWd80zqbzvQgEeXeid+crP+L7vYxsfzZ?=
 =?us-ascii?Q?eAVGVJZG6ORoV3tr9NbqNk020zLZEg0wGjjlURZGQ9Rp6mMcNizIMKx+Pc8/?=
 =?us-ascii?Q?kBGrTNbaX1+75Q4xSqfDXmLlpX9MJYCfxygElgJEh7+F3fDCaFl+zZjJALPV?=
 =?us-ascii?Q?DxduA4SeZBTZFLN8LSx23KVx204xgFz8R0OHVgDnP8y1Hsq3sl8JBywg47Nf?=
 =?us-ascii?Q?STkBfYcXu9ar9apn/Ly1tGJCnwG4LdLUjHLcInuhR1mb2oR4sg4iPcwoe6dW?=
 =?us-ascii?Q?7cQXA8MpM9nRQZu3FO9IQRZ0lGvgTQWziNmc64BpsK7wYtpuXxf9fMb8rPNb?=
 =?us-ascii?Q?51cu829bfYxAHddpXmnx7hj4aYqgX7Byd/FdgNJj06rxqfWn6CcsM0FdCEa4?=
 =?us-ascii?Q?AIGjBEmoovlTXY0z+9tyV1Hp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75626a71-72f4-4145-ee2c-08d941359e02
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 10:54:39.0479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXQBo6buhXUvqUqk4H5WYDPCtguHWcD8TcqCduoZfrk/RdXamdxkMjOD2pdkefub
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

this will allow to remove the kvm stubs.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/diag.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index c17a2498a7..8405f69df0 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -20,6 +20,7 @@
 #include "hw/s390x/ipl.h"
 #include "hw/s390x/s390-virtio-ccw.h"
 #include "hw/s390x/pv.h"
+#include "sysemu/kvm.h"
 #include "kvm_s390x.h"
=20
 int handle_diag_288(CPUS390XState *env, uint64_t r1, uint64_t r3)
@@ -168,7 +169,7 @@ out:
             return;
         }
=20
-        if (kvm_s390_get_hpage_1m()) {
+        if (kvm_enabled() && kvm_s390_get_hpage_1m()) {
             error_report("Protected VMs can currently not be backed with "
                          "huge pages");
             env->regs[r1 + 1] =3D DIAG_308_RC_INVAL_FOR_PV;
--=20
2.32.0


