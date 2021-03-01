Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7384C328E90
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 20:37:05 +0100 (CET)
Received: from localhost ([::1]:46124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGoLo-0003ip-E8
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 14:37:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lGoJ0-0002CJ-PM; Mon, 01 Mar 2021 14:34:11 -0500
Received: from mail-bn8nam12on2116.outbound.protection.outlook.com
 ([40.107.237.116]:34430 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lGoIu-0001ft-Fa; Mon, 01 Mar 2021 14:34:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yth/VAGk1phGatty9SD5chHshxNJOP3PvBTUhEmdRBhPPEHdjBlSGXK27BLhxP/PUYY02AazPghVvxVRhHRWrFX9+R60uIBgaEWQ/48GihOJ4nv0iBbrFfipcWKreAne4wHfQrVp2UuLmovmmsy1ecM4eMGxrXP8o1+WAyD7vC0Vr2yU9TVklGcT/w2tR+vuUAXnFSflvg+FlAqEkUlrVjdiizdMOCfwwBh+0VBzT2S8QhCu6U4QED48lo0+zcPbCtcOb4K9KJVkq0+F8fcpSx3iC7pgfDbo1gE1zzKk9kiYya8sL9X/I4VYaqkmT/wRhLi/KQBbjPav9PzourB2FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yc4t+Hn+uo8JyDU3+FlcRQk9ZrLDs4rK/Tb7VP5sV48=;
 b=Xz010J1KvVbpBNI4RUjPZxSRLlej1WnS2Q+dG1dzgeiBNyybik9opKoycXOAdZptFjpSsulcnK1xUAB/3s1TBvFmzEGqF2UQSGbxily+hl81OZm3gWbHZXOYm6RE8pJTf9TcZKE+0OX5siaW+A57LW7j5oyc2Pj+Z07Cn2YHuFTvEcxLPwIv1M1rbYkj+0p0yNxKY1eHgmck87fzGKi3OG4ZVvCWEqP2YClnEbRETcwo0/re/xsLnz8/sJ7L/IAJCEJbSLU6L+ZJi3ifMzX+iaVnUxasC2JA2djPPHuVd86/1h5QzsBObb8fPSGwLYo629Ujet1RdNitYW/BGT4ilQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yc4t+Hn+uo8JyDU3+FlcRQk9ZrLDs4rK/Tb7VP5sV48=;
 b=DPNA6CrANtz7CFtyUl3VzjW7zZPxpkZtLWKbNg+2gfW6xmGKtv+BtCT5EA7lbIGEzlBHKwh4KkmZ8YP/kiE+L2Evn0ImT5Chl1r+TPTCX/7Znzyl8eATyjRkkzgmZpU2EtJKJT4MfQ08bcjcxRCMB3yAgMo7j5LwYEUQRgSFV/I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from DM6PR03MB3865.namprd03.prod.outlook.com (2603:10b6:5:47::31) by
 DM6PR03MB5193.namprd03.prod.outlook.com (2603:10b6:5:241::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.23; Mon, 1 Mar 2021 19:34:01 +0000
Received: from DM6PR03MB3865.namprd03.prod.outlook.com
 ([fe80::3d08:f80f:7252:a948]) by DM6PR03MB3865.namprd03.prod.outlook.com
 ([fe80::3d08:f80f:7252:a948%4]) with mapi id 15.20.3868.036; Mon, 1 Mar 2021
 19:34:01 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] cadence_gem: switch to use qemu_receive_packet() for loopback
Date: Mon,  1 Mar 2021 14:33:43 -0500
Message-Id: <20210301193343.324840-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210301073947.39451-1-jasowang@redhat.com>
References: <20210301073947.39451-1-jasowang@redhat.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL0PR02CA0085.namprd02.prod.outlook.com
 (2603:10b6:208:51::26) To DM6PR03MB3865.namprd03.prod.outlook.com
 (2603:10b6:5:47::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL0PR02CA0085.namprd02.prod.outlook.com (2603:10b6:208:51::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20 via Frontend Transport; Mon, 1 Mar 2021 19:34:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c3019c4-2bb5-4eac-f386-08d8dce8f711
X-MS-TrafficTypeDiagnostic: DM6PR03MB5193:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB519380112D7755C06E600A56BA9A9@DM6PR03MB5193.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:172;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lpe3tFU7oZOegdbe0gxYuaFZPeueGAZCaezHFCSutm/yt3eK+jMPEuxRf+Unqgsa7tXjaHfJ0cCUyJ376Iylcx47fQtT0zgW5p3rnNLfu4W1UXUhcUCl2ctUByHa+AzsqdfWhIQv8UPb4r+ilbQkTRSgI5auu45vpJjYK9tF+hH/+i4J7jn9R0sspIOsHvi2TY1Vy+wCAmxY+tgeNYCV0VavY06slKEmgtV8NL78jQd8jEISqhlH6I/tfEFp6C3zceictu5SIvDO8t9UN+jiijzmSffawmbQPz54D0yi3kKl1drZl4lSFIaWGrszXdb+LhUAC+574TefohZ15mdGFm6z4mU1GLVNzE/20SrXedk4EEX4azhrO5eB641qqbGk+jO3PQ9QaUkLx16DH2D/ajVz0qCO01EDUt3XYgx5ffNsuzt58jueSKyFnwI/bGs3Gcd9iKnQ6d4kiIP/wQutz+RdKgBKHq+Vq6FZVRAkx51d2nd4U8ix0tIjPG5cuXlJtzBfj832u//lssmLCMoQ0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB3865.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(786003)(6506007)(8676002)(26005)(2616005)(16526019)(316002)(4744005)(956004)(54906003)(186003)(478600001)(6666004)(2906002)(83380400001)(66946007)(1076003)(5660300002)(6916009)(66556008)(86362001)(66476007)(36756003)(6486002)(52116002)(6512007)(75432002)(4326008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wY5bRjMmYOmPYhrTLgRyfmT+Cq5zqENjjiHRcrK4tLAdjQffSQ6dsZPgOBBJ?=
 =?us-ascii?Q?+Ldk7JM2Zm0AQbki/kL3kNl7PMDKWFdYn89VPEwcSAc+n5lxsjY1HFpvPJ0x?=
 =?us-ascii?Q?KRflm5mMI3voKWmw/0tFq0H3ShQR+EVUB1ZGqMLbxvgIc7p0o8u2TNyFOu42?=
 =?us-ascii?Q?b7MbZOkYtk4F4GtjZQnYgFltKZY8CkQTw2PS+DmahnKF5A7A+JXGThh/VAuU?=
 =?us-ascii?Q?HszTHF6aWKMlqVkmAwL4uJ+cgLNFr/zV694a07IMACLOUi7jNH7WjPC/8o0j?=
 =?us-ascii?Q?EgU/J5enVivGX0V9T3q1p8jjdooH9ZzxOr6fIRv3mCIjRiPexLa/Buu6hz4K?=
 =?us-ascii?Q?+qKxDYJAlfsdn54eBNE3Uc5QSBNfnLWIAwSpetwMfAeq8BaXdPdO+muwmThl?=
 =?us-ascii?Q?coAlKO32+UCbiTEPp6t8I/xNlweXisF5aGy8xh2D9HB4HUVt+WoEu7mTShKd?=
 =?us-ascii?Q?GMyo3YfUGv+Sq64QaBoxIYVK6FZTZW6vAE23gA4AjcLsMujy3BEChCFL1yWN?=
 =?us-ascii?Q?ZaPqHa9vu4S1E1/l+VJQtfARcdi9FL9w/YvcOSaEaEQQabD08A9jJGCji/J7?=
 =?us-ascii?Q?PF531TfEDwGlbYR/Rzd6OTNBzfPeG7gk4iQv2xC/OvmIofXm69FrNNuX2A1m?=
 =?us-ascii?Q?4CBQfRem/S+MPAyV9uqtgwqtQ4LuBya4W6eTQFIVtnIZSlHoCDzVUJ1Qm6U2?=
 =?us-ascii?Q?4+8XtsarrYwY180XfhOpnKB75hAvQQxpUZebLKRILUzN5Sjbg9hmFdbAGDGo?=
 =?us-ascii?Q?U2X6xzbJ1Dd7mJ5jesZD6t2ypLEkcty2jnvgFKuRvF6INADiI8YaSDjAOxn4?=
 =?us-ascii?Q?m2jcCAGvQwnSD8IR1nxgSmFOG2WC+t9iWveKLkzTUL6BpPvl2UMBTJ52sepb?=
 =?us-ascii?Q?W3vMvdwOU1w8VSh+zJOkxerz2CT2WWHZHzIjW0x2vJEZ1s1YwQAok3dEaMS1?=
 =?us-ascii?Q?P027BrgK/2G8BWFbOI9HIXEJLsxK1AE7oZIqOimnrJowm0KV8Ieu1T8rexq0?=
 =?us-ascii?Q?6IJbII/S85PeLa3t4JnPXvy277xEKqYmEnQxX2AkaKWyTUwjVJW+YWeYO0Ei?=
 =?us-ascii?Q?xP4OM6+vIzisHOz2QosEaUoVPtMkGGjiM6mQOzGf8Y5wFRqbiSCtbf+MxQph?=
 =?us-ascii?Q?UWMdCkqqwOUKUOJcL8kIQnYJQCo6yq9GYMhDyUTJc9aUKgxhXVxuACWOxJzm?=
 =?us-ascii?Q?Iq6tBoBpdOvv3Tt416xIXN+dRfsKRHRmj4KiCJUoCwEFE46ZD53IJ/5KzR/Y?=
 =?us-ascii?Q?m96krQrOIInRJDuM4A+F9zeSMmpPc15IbRGkSIi1jAPXMR4XXj9dfKj8+u9r?=
 =?us-ascii?Q?vtOXFXjlvDsNULk824OtzGKD?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3019c4-2bb5-4eac-f386-08d8dce8f711
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB3865.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 19:34:01.6412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqi8xuQbgVg+tYQybtk3WgqV0pEszNBwtHzSYkFN2WARF0Uuxdyn8bdeUQkZmzoI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5193
Received-SPF: pass client-ip=40.107.237.116; envelope-from=alxndr@bu.edu;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-security@nongnu.org,
 ppandit@redhat.com, alxndr@bu.edu,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch switches to use qemu_receive_packet() which can detect
reentrancy and return early.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/net/cadence_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 9a4474a084..1c576a130c 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1275,7 +1275,7 @@ static void gem_transmit(CadenceGEMState *s)
                 /* Send the packet somewhere */
                 if (s->phy_loop || (s->regs[GEM_NWCTRL] &
                                     GEM_NWCTRL_LOCALLOOP)) {
-                    gem_receive(qemu_get_queue(s->nic), s->tx_packet,
+                    qemu_receive_packet(qemu_get_queue(s->nic), s->tx_packet,
                                 total_bytes);
                 } else {
                     qemu_send_packet(qemu_get_queue(s->nic), s->tx_packet,
-- 
2.28.0


