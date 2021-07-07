Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E003BE6B6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 12:55:28 +0200 (CEST)
Received: from localhost ([::1]:41638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15DD-0003xK-HI
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 06:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15BV-00027l-7L
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:53:41 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:59956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15BS-0001yv-6C
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:53:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625655216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGbqbFwBXc1Vl0Yw+TapPCbcOCj47SJJdT9o0Q0MNwU=;
 b=E2hBxOiB1NgtelNdm4HMK/1BqqgMNeZcVNofwX2tGjzTcVfjy3Q0jtYpPpmwOM8KOVHl2v
 bbdNrw8bvJODNqtHofD4amNqxp1+qb/dINZ7DMBU0nKCn5vD9SoPfYDK6K1zwHdgLI7jpM
 jv4tdBzgI5ZJPZ7jG7pttCv5itafGVY=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-w65J7K5ENPyzwFuMxbZKpg-1; Wed, 07 Jul 2021 12:53:35 +0200
X-MC-Unique: w65J7K5ENPyzwFuMxbZKpg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vk5qPMkan8w1xLGQSQoD4Z0YP4gQcuXf2L307I2KxckHScytxZAJsXsVVIakOWdVjJnP1cR0haYQgdY0Vm3U12yUbvJD8pIZV0pGICp9DugcyM8InF23PpwrV2WTUnRDaVpIEeqlQV83s2/tOX4Y/Y0sLnAbnZelB8a2xovflz4h5pbTPZZVQN6wdBBx39eUvk6/qOjhGwtazhTQqBzxY0S/L0Ouf6LaVHAllXlNX3IldWU1MVz+QvyaIFjdl4WpeYjinlN8l3fYyxeVjw+le9In3VATvh68EaQnRt45qVqhhCphnKOdnZ/edL0Lsl8kRun5A9RkfzRBhuVLWQU4Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqKi42TgMF1kAUsYKtBZScAleQG5X11hOlu2rlZ7980=;
 b=n7rPJA8TARUIIEdbsxrjSI/ON9pODbWOoTGT4UT5sTi9vjL/byzg9b+GxeLmOKZWGH4PZAy9FVGacKcM1RipNfrjjL1ZMeARZJyGgvoVmpticRRGWcsxQ/EMYYuozmMXOEVIJwLLgO9+90kXLV0n5gXqx9R5dkFBkOqOenUkoxIpy1np5zS1nzzB9JkjaaKfT7IkVnYiCcNjFrzr8iinLJ8QIpFYinGxlJ70OTT+f37PxLg2acKaLRcMS6jZRiqn/E8zu9WyM2BQx5p4y9CxZcw9vssDWG3le59+tj8AX/tt7HrKGvP4FRFuwy9tm8OipXqsc9plEnDbpSPeFDfMvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR0401MB2238.eurprd04.prod.outlook.com
 (2603:10a6:800:28::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 10:53:35 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 10:53:35 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 01/14] target/s390x: meson: add target_user_arch
Date: Wed,  7 Jul 2021 18:53:11 +0800
Message-ID: <20210707105324.23400-2-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707105324.23400-1-acho@suse.com>
References: <20210707105324.23400-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0072.apcprd04.prod.outlook.com
 (2603:1096:202:15::16) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.20.159) by
 HK2PR04CA0072.apcprd04.prod.outlook.com (2603:1096:202:15::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Wed, 7 Jul 2021 10:53:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d19a3482-928d-425a-0aaa-08d9413577ce
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2238:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB22382C09160AB25D00D70DC5A01A9@VI1PR0401MB2238.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s9F+zGUfIz9r5fypjODQNWlTp6QvYIbVyYHdWMAFKrvO4vXgVY1iyRSL4vPVVigo1n8OtzZeiagKjG9/kE7VmD3/2sTighbDHOOZZ3fH1H2XrywQhHFZvF5CfhV+5e14vux+YU0DIpUJHo8EqZBBj4ovMkd/NyXRqVhUf5+/+M+Dh64PfkOmlyEIxwhE2Z96lLZXO0QRTWxXuBZxlGw1BnCYp0f5n0dUzyW7NboBJZT5X/NJe9ppmu6ZKGEm8QzStEnd8UMkaiUMsp0jgTXwYPSJev3z6Ltyp0pxA8gvGnUjrf35HaeAKFcKwHB2Yu+/wV5XxwFJYcCYmE+bnWONJz9k4g4Z50+y4GXVAsn9xcWcbpicKGvoxWclVXSRdn8B9Ip8RamPVPNvwYCFZDGxKIfXVb1f7Yr8qgMKsXTfZS9ujbc21P9/16pct6PqFO2ah3VXpEUtPuQsvXfEJETW0037T+rk/jYmbjWHqKmMZNliafaqdjnl/Ykfcj+CIcRH68k7mrR6VePntWIuRBHaNmyFAASGs0Xs1gx08h4MpNCEMu3dbTfe8FX+KYokxCWW9kieham58X9T+dNwBQGwXn7eadFR6bL5y09YJZHyQNUQKsHQM5sPr6VyOqrxp6jjjbBIrcYjSoxtIzZ/y8AMVUssYdJGp4NWujU5Ri33HPQ3mFFtmVIMlq+6MEBAEFwCbhrA3VgILj4UhgBZMIV22w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39850400004)(366004)(396003)(136003)(54906003)(316002)(26005)(66946007)(66556008)(6496006)(6486002)(186003)(6666004)(86362001)(8936002)(8676002)(83380400001)(2906002)(5660300002)(66476007)(478600001)(4744005)(36756003)(4326008)(2616005)(956004)(1076003)(38100700002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?acJjvbEdhH9x1C1o+UPffuEfKTobfFd+a7jZ14k527JmmaDgZ3/KlxlRa4hn?=
 =?us-ascii?Q?lDwClNsgSom+o3zbH52Vy7Lw26k6UxcSqoItUo/eeV3ajl/n4ynLm1BKKYjB?=
 =?us-ascii?Q?FTgLKzDSudMWHhoxWi6pGYiBmnCBf/JuLTtFDq4ljx9WA5rXFdyJp+iCqTMw?=
 =?us-ascii?Q?HvpqOeKDSaR8I37DQcvHoWvo0VXzwKzwNHivaAACq4li1JJQN3Xil3U/gzRN?=
 =?us-ascii?Q?g0feWusn3ze7Y/ygblbkfrXnotxBYA+cCIAOSTJ49nRUyK/QDuUYWyDqpSMH?=
 =?us-ascii?Q?VZeEyvjpSUym7KWD5qbfuO/tH+xGD3v8umiIV/vJAngMWde8OtRljsdr8OcJ?=
 =?us-ascii?Q?YuIFfC+3JUblXX2HfJgPIWeK91P7Aoj3t9VGAOvwwivNYz2TjIbpf+oJd3NO?=
 =?us-ascii?Q?drTadJBhimAmLFdaz6mFmT8wZhjFnqATPXyqZe2BIVEJFj+G6DX7eqdwVLHr?=
 =?us-ascii?Q?z48WAu1XdpFGD/qQUWQpJ3O0v+sOm1DzK18tHcHqtaZmsjXuooSwgoaPHPaH?=
 =?us-ascii?Q?Gz9gcNKoGv+0D7nPk5zbcfi3lYYAyE7hRBiF78N7jZ2nv2ZbaV2FjPzYhjNE?=
 =?us-ascii?Q?mKAqBAmXNrKJ9BUPZNirTuUI53YG7QVM7hez+NeemJgS+67o/TxrpBUdVXVK?=
 =?us-ascii?Q?XeHGIwuxOxEPkSb8nQ5Y9WIsZiGNtIzPGWQLzM2GYYT4yvDpGpTwhl5oDlFx?=
 =?us-ascii?Q?vpuwBf9x+KuN7Ya7q9IQUmxU0xGmZj2ADDUwlLWuCtlRSbH9ZfGdMizaKK4I?=
 =?us-ascii?Q?wcFYYf9HRWFwRk2lh5Nj8DqzIIBnJqDW8WU/f30J9gtj/Z4mxQuWqcXdIIb6?=
 =?us-ascii?Q?A2VUrHKJv6EETiimua++d0nzzJ5fNk8QagSJ+wpNtxgnxCpmSLB4DDlcR6aB?=
 =?us-ascii?Q?HotQcple9gW7KsbFBOmDW/cW/ESi1ml+wAIDY1bWFBVyAGd0+AZUe7cWmS/T?=
 =?us-ascii?Q?3Dp/pgdb4WVH29GTn4iDaiD6pkWpTvz6UdgfbLjrNoVx87/EcpljsAD8tgYp?=
 =?us-ascii?Q?KOMdyT1L94kRUix2TxHHq3lSBZq33TqusuPUN+pCctscD4aHGTXESkpZDkmS?=
 =?us-ascii?Q?Ko/2RWp6kK7Tmw4ybfcbUD6l/rZE9AaF1/o+TkGVWS0wp3DOF1awIm78Scgd?=
 =?us-ascii?Q?jqSsYatyvMgvAkP2fwR3fK/GfN1dauLUIcDAMjQJMO3y+ty1Zwsp/WT4Dz77?=
 =?us-ascii?Q?yUhuElt2iIQMKMQYwLSE1xNOPruoynWxXRd1Oin8uTlUNdVNJt3fkPkkZ91k?=
 =?us-ascii?Q?ruwmFHJF1phunqk03Nzp06PXtZidkyO4KuNRTsRXav4wxuzFw1+ujzUzN6hz?=
 =?us-ascii?Q?aIOdsNktBayBDDAH42Ij5j14?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d19a3482-928d-425a-0aaa-08d9413577ce
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 10:53:34.9749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npggPSbhIGm5ezc9FqhNxpRoc7niVwPPKUKpYT5rpDKI4QvOuCQNikl7IWbZ4Nf4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2238
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

the lack of target_user_arch makes it hard to fully leverage the
build system in order to separate user code from sysemu code.

Provide it, so that we can avoid the proliferation of #ifdef
in target code.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/meson.build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index c42eadb7d2..1219f64112 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -58,5 +58,8 @@ if host_machine.cpu_family() =3D=3D 's390x' and cc.has_li=
nk_argument('-Wl,--s390-pgs
                        if_true: declare_dependency(link_args: ['-Wl,--s390=
-pgste']))
 endif
=20
+s390x_user_ss =3D ss.source_set()
+
 target_arch +=3D {'s390x': s390x_ss}
 target_softmmu_arch +=3D {'s390x': s390x_softmmu_ss}
+target_user_arch +=3D {'s390x': s390x_user_ss}
--=20
2.32.0


