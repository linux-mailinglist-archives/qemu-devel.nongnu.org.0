Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81615328ED1
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 20:39:14 +0100 (CET)
Received: from localhost ([::1]:50728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGoNt-00062l-Ia
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 14:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lGoKZ-0003jf-6l; Mon, 01 Mar 2021 14:35:47 -0500
Received: from mail-eopbgr750105.outbound.protection.outlook.com
 ([40.107.75.105]:25407 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lGoKX-0002cD-BP; Mon, 01 Mar 2021 14:35:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H48ooM+lrK7fMzYI5toumL/ePjqM1po9A8/8OaVJCZBIHvJGhiJym1VbXaAFKPT+BpwOGaYfhzu7jwnE2PAhzQ/z8gxv4fmlzr5cutRonfQJnzpCNp9/lmekrOijL6ODyceNAwUjr729ZA6MtCROBCX8KD6Enbf8L6qr6tNKmvBlb2HRz/qqqGI4mnMm9qx9z10699ghQNgIg3lnEb0SnioL02DpyMnbQ+lYwsXIQmUMu8EGGpMq6ZAZeT0LQ0c7Elq57O7jzwgWG4tAvQ/PNdYYiUdyXFgq95ii/m2ufFTdT1d9XwQOLEbjwbZDclkfz7mE+UiTFPbe/XqsjzS/2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2J9w3+17cAmKqVMO/V4wBo7eYVa3LhtniaKe/FP0SbI=;
 b=jQQuF7yoY8fq5PG+NdKJpBLKB/72pslCxJM8bkG69lnctBXFwVAtAP7VgyR0JmWxdlyuO+rAZc/XFPUVVfJTiVsRijim97YZdKscifMdQyV2IFDZlRl1HdiDIW4cQAiPLbJnjRrP/Sc2J/pMGFBjrkYSuIeM/Tc/QBl3bNYxKfpKOoJnCCUF2VMZHt+Blrioi7bs76gJWl8aSXxsW0fxYB4ho8dMbDVMo8+wL5haJh4bKbJzx0QIzeci+0yeyGdH2u6fTgeztReADCoZrkjb0m8Cj57IQg6ICtc3ENEN3gph4JMn5NwU5/o3Fvm6DJIxp8ABEwJV6CsITKD+SkFm7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2J9w3+17cAmKqVMO/V4wBo7eYVa3LhtniaKe/FP0SbI=;
 b=p9CVmaI945gZVyUe4DABYoFOqInkkOrJJ7lFX5dpvDhcJsjjg47hMuR19n9BOTl21eOCl8IjJ4wOkZVHbDBB25xBOJsiAP5sZs4T5mjORQQ/kdfjiQ28eYfROsinkJjWg1My2WujdSlgKceWcSTkS16J1iib6dWKDV3ZyWf4vas=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from DM6PR03MB3865.namprd03.prod.outlook.com (2603:10b6:5:47::31) by
 DS7PR03MB5494.namprd03.prod.outlook.com (2603:10b6:5:2ce::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19; Mon, 1 Mar 2021 19:35:43 +0000
Received: from DM6PR03MB3865.namprd03.prod.outlook.com
 ([fe80::3d08:f80f:7252:a948]) by DM6PR03MB3865.namprd03.prod.outlook.com
 ([fe80::3d08:f80f:7252:a948%4]) with mapi id 15.20.3868.036; Mon, 1 Mar 2021
 19:35:43 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] lan9118: switch to use qemu_receive_packet() for loopback
Date: Mon,  1 Mar 2021 14:35:30 -0500
Message-Id: <20210301193530.326799-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210301073947.39451-1-jasowang@redhat.com>
References: <20210301073947.39451-1-jasowang@redhat.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR06CA0004.namprd06.prod.outlook.com
 (2603:10b6:208:23d::9) To DM6PR03MB3865.namprd03.prod.outlook.com
 (2603:10b6:5:47::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR06CA0004.namprd06.prod.outlook.com (2603:10b6:208:23d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 19:35:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05fd5425-19ee-40e6-e073-08d8dce933dd
X-MS-TrafficTypeDiagnostic: DS7PR03MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB549481026B27AFEDCCD5B3D7BA9A9@DS7PR03MB5494.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:311;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xhjynIkpS3g2Ei/dOC6Mbj8jrYz/jEhqAKwWWn5Z/sCjehAc3eG/TS7+HmcvnPOft/BqdNHs3NughARTTZgpftucZohXzjvVtgNQt5Og5jnpaMeyAWgLbBCEkUBaRLaYj9tWJHjIzXMxaEi/s3Nl6DG9cm78xaV6g+aBMbwJ8B62NEW6EXKG2xlbTtKQESihvsmK4F5m+T0rya/Srh25j6LuTN5IxNn3NWV3J7M00L6X+LHBVia+FVkAc6kTFY6heshGLbDhwcsWOH8XiZoNNsi0hiGzxQ68XMxF00x5FbQBYRKjpmDjC0+u4zkK2wQji+Aw/eirbMM8eajqoSqE69SQ31zBuVa+mRW60zrC4bTV3rVHfq338UulRGpQGsJlryQmFo4J1eQmSj7K3GYilMyiwJkHoqWQ1VdNw7FZcjxYXsLjMRx5JcgrnGWAmYtYxVpfNac2jM1XLjGblxb+sdAHkPcRPJYqoCaPYbJdta49NrK3j2YaCm/qYeaESvB4cTB4R9OqLsX5sbBSGtCvnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB3865.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(786003)(2906002)(478600001)(4744005)(8676002)(6506007)(83380400001)(8936002)(52116002)(6916009)(5660300002)(316002)(1076003)(75432002)(66556008)(186003)(36756003)(2616005)(956004)(66946007)(6512007)(4326008)(6486002)(26005)(86362001)(66476007)(16526019)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Zm6QjF2VNHSfSdGKgXeO0rGYg4V6LGoeQiXyoRRFxGjgZRn8+uSVMqtGlWRg?=
 =?us-ascii?Q?68zEjHKFxPEHHq14KrAq3Vl7jYRDdeY2w71ushC+F4qqlfYRCpryss/6OCAs?=
 =?us-ascii?Q?H9ymJOtsXvl5+e6I3gCJImOhxsN3rx1bw2upv/UdHXwVitdKOXfTgiAv4wv1?=
 =?us-ascii?Q?qphzI0louU9jKPhPxBv8bx+WMibWH9l/wnz/5yED0gzHtKtb015xgDcdyKv6?=
 =?us-ascii?Q?wwTTjlB5P1zgz5i05RQZN+HPB2s2/+y53wz9MD6FmYDNKsDC/gxdmU4klVxD?=
 =?us-ascii?Q?e714BIZ/afQevQe3cJXPgR4fIEizDOm/AgwZ4CvuuLDT4UEeuvCUlwokb1eL?=
 =?us-ascii?Q?ixeiEjopd1S1J58zizIoCnV9t5LfkBIz9VQJIj2GZESz1yz2/7qJ0cjr7j7T?=
 =?us-ascii?Q?Eh0W9mcvOhMvdZwGzd2uugal9NOFJ5OvyV57jLPU0ZAyGcWBsyJoB+UCqQOo?=
 =?us-ascii?Q?+I34FOyUwMZgxU9LOuQK+YKD6QlwUU7XW9gZnARB1SNLWVo7s2wMFl+VtmQS?=
 =?us-ascii?Q?uV/8oC+1TjQZRTioahbTIYcEpNtFyqfLd0+QFeVhhQKH5ATRsTCPZapRTjdx?=
 =?us-ascii?Q?VQI5KcSjpz7RC1CYOIr7Omy2hkS/yb0gc6VYw+LztLLFFYsn5VYFZhwq4ZJS?=
 =?us-ascii?Q?F6pQEkukIZ32xv6/r7Lr1rAVuS7unX2/m74MY92AfmyPknZDX70zwerYUrGo?=
 =?us-ascii?Q?jnNkHeMG45bfpPaKkhtIq+n/DtRlQm6YV01DDysLqHMWQ4qgVwS6L10b/W5i?=
 =?us-ascii?Q?i2sNedLGlCHPCz8yzU9exg6rrcRiNdGHor6qFbm4TIa/JP9WYLMlfibyQtfC?=
 =?us-ascii?Q?TCvFEUFVk1FNFuQQV87B828/2HJ87nr9u4fXuC4o+iALneRDQG0fSZzXN4Qd?=
 =?us-ascii?Q?m3+9YrWjZkNmpalnYK1rtQ1XCAISUBkBYjOCL5p0vsz1XxEPz3l+jnTTEgUZ?=
 =?us-ascii?Q?GyP74ZbAxe+pUoXO9gLxTdWiEzf5pZidmM3XYGMSDOzfDsO5TCc4pkKdMWMq?=
 =?us-ascii?Q?mrNjgGhNOF8jXLrPkwPC3xB0GntYMSTo8/7hkmUJIogG6jqfxy46shccdRXw?=
 =?us-ascii?Q?COYYR02x2C8HDgF+pV/AIhvAjwQN+Z8FFrC02Yq0MbuyHyBKi7ENf7ESuIB2?=
 =?us-ascii?Q?hxdDXLGG4hwlXSpA7XPVtroJ04Pyt1hHNu7BECAaAkHAJivasgp+HURo0mmy?=
 =?us-ascii?Q?n62lWtZUrNZXNFY89jqldSZmVBtGNYU2J7KNCvq/rdXyZFmT2NMUmi6ckbp1?=
 =?us-ascii?Q?MhGdAzmcE2p+LEZey0JtZWb+OmF8GQ6MA+JcIu952YdW0x2Yw+8xBEu9S5v2?=
 =?us-ascii?Q?QnZcIN92jtQVWLjQQyM60Ln1?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 05fd5425-19ee-40e6-e073-08d8dce933dd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB3865.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 19:35:43.2072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fprx/5dCEkx6zSGB0Idr0m6rOQIMyF1yg/W+4xE/4U9BABy1yO4KJOaeoQYhxc7O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5494
Received-SPF: pass client-ip=40.107.75.105; envelope-from=alxndr@bu.edu;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
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
Cc: alxndr@bu.edu, Jason Wang <jasowang@redhat.com>, philmd@redhat.com,
 qemu-security@nongnu.org, ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch switches to use qemu_receive_packet() which can detect
reentrancy and return early.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---

I think this is the last one that directly calls its own receive
function to do loopback (or the last one within my grepping
capapbilities).
-Alex

 hw/net/lan9118.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index abc796285a..6aff424cbe 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -680,7 +680,7 @@ static void do_tx_packet(lan9118_state *s)
     /* FIXME: Honor TX disable, and allow queueing of packets.  */
     if (s->phy_control & 0x4000)  {
         /* This assumes the receive routine doesn't touch the VLANClient.  */
-        lan9118_receive(qemu_get_queue(s->nic), s->txp->data, s->txp->len);
+        qemu_receive_packet(qemu_get_queue(s->nic), s->txp->data, s->txp->len);
     } else {
         qemu_send_packet(qemu_get_queue(s->nic), s->txp->data, s->txp->len);
     }
-- 
2.28.0


