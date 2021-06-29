Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7E03B742E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:22:40 +0200 (CEST)
Received: from localhost ([::1]:59882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEdJ-0002Jr-OW
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEag-000869-2S
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:19:54 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:21182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEae-0003YP-A2
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:19:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624976390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ejnA0XeLS8mP5uKqVtQafxU3Oq3hXVKd93VxdEgF05A=;
 b=mlESrapBZdKQ8zyQA4wgSv4kKokfOwPCVJGgkqnlEveVb8pptlIp8ZSgY0JeHF4Q2PU1c6
 EzIrE6GdYe/gCFEpu2kaqjenKOsDiG1lWx6zHPrBgZ08XQa1nVzqVoPiRkL4HPo12gjjpG
 YQaTmcDaGSYCuEw9IMUDpsGh6pK5D3c=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-6aHBbskJPNecvegVthr06g-1; Tue, 29 Jun 2021 16:19:49 +0200
X-MC-Unique: 6aHBbskJPNecvegVthr06g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duO7POqHt+o2Pn0tnwjxhE7MJ/FU1edUsAFIP7VS1De3YM8XgioqGgKhw453os95pmjVK18aJmBaMgdNBU5qOhPU4DUNE3t4BCoJFptshus++LDEEcEYdsbaavD9G0Xi63WiQ0Kqw9EnjPhyQ6n97pZuOVQF20e5R+ojbcI6uo39y/c87ccdhSznNdeYOwFoO5DXFJjgksSTuD1hr6RhgtR7Hq9rxe10c7Bz4eEBg63FLuMXF1xegUcQ4+Mc0gMrT5ar1Wa1QQM4/e6pZkzl9sFtwYElKkG34PiYUsNsGZr4rNmWzzvGLaxlDZu0J9w2bZW3BGDSpAB53dK8kgwIrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zc+NdAtMX+OVdXw+G6Nf9o3ckvzhqYycZb1Wm6H0L5g=;
 b=g7dm/hZqhTP+aO9/CJNdwtfxe4kVNn+pxyrDHGD9Md3hnCW7eb4uTcAdyrRR+1CFcw/CMLiHMQep30+79ugXQTJ7Uo3yjSE2pLFzh1HHzti9ks//VUDfRIGGAQW580uy1iA4kGsRWZxcVI014fSCeB0+kiJ9YHTZAdMe04IzYZzWxgeI31bAi/Es4a+7MdJy6ZwoxpKNFuxpCML7166TwjNRgSxG0lyAstyDDN0jQSS4haPMbTzPuQ+/peR80pFk8H4u9ILZkiS2js31YPBKRNHyC37rjc2qDdMInP9DB3BaMbYCN7CteoJDEqtCpez1Vt4iPFHvqTorgkP/5S8Q8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VE1PR04MB7295.eurprd04.prod.outlook.com
 (2603:10a6:800:1ac::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 29 Jun
 2021 14:19:48 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 14:19:48 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [RFC v6 02/13] hw/s390x: rename tod-qemu.c to tod-tcg.c
Date: Tue, 29 Jun 2021 22:19:20 +0800
Message-ID: <20210629141931.4489-3-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629141931.4489-1-acho@suse.com>
References: <20210629141931.4489-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.28.175]
X-ClientProxiedBy: HKAPR03CA0022.apcprd03.prod.outlook.com
 (2603:1096:203:c9::9) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.28.175) by
 HKAPR03CA0022.apcprd03.prod.outlook.com (2603:1096:203:c9::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.12 via Frontend Transport; Tue, 29 Jun 2021 14:19:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5db6df9e-efde-4550-4011-08d93b08f3ec
X-MS-TrafficTypeDiagnostic: VE1PR04MB7295:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7295ECDD0E68958FC33A61BEA0029@VE1PR04MB7295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ere/bwLmkebZpme5Dp9rTAwjtZpoU0Z/AE4+hlYBVhP0UZ0I/pBN9RFlObXcOoL3fRIQHu/R8zxo59Ct5K1uZjOK2uy8bZQOsVMNVHM//whMy21p0VORrk8ra+b0D4oIK0+n8SuboZY7tUNcyUUUBQYZJtaTpO/dxOYoySKOT4TfOq0Kikfqw+dcVI9Wtg31/rmVKsHWSH9Q59fEsna+PplsQXXM9AZaOI5TYYo88T7lGSjExXp+Mv4QUmlTpLb0Jj2vFCHYxnB2tdziEL7dpbmGfP/coIQjAY26KqBKwT17+Q2rvtneWuihrcNIh5FSaPzCpQN0/WG1eP9YFKkeqafbTowDHcvmaaT2c68u8vHREkbgukEDsPqLYeDWFlBgBN0LP7gUkjWTbgBJFgeQdI7O4XpO1iPGNw+bfcnvv2hO4rAPeMBdlwxY34Dp/4H8Js8JHDe94YYGgXXkh3iN4nWsAk8bFyJNvIfk8OAeoH+epC+FLDbxj6s9bnMHCqgNs/bSAzL8VpHlPENbmDGpy6z0Ykf5qnU++StG3Ba2qKhFuo1JtG523nsc7btw3KLdHWz28+oEVNJRPZDYsnMh5dJ9ztm7D2aqYNKeTUTLtEMr97DgEulREcCgtJS1/z3UH6Amy9WW0g+f9lw7FVRwmafFCGPxkl+q5OAk+z29MaxAy2EKu1IIcUir0XV/uA63J5vvpbue3aA2S/OYA4zyoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(346002)(376002)(396003)(39850400004)(2906002)(316002)(4744005)(4326008)(8676002)(36756003)(66946007)(6496006)(54906003)(8936002)(66476007)(83380400001)(66556008)(1076003)(16526019)(86362001)(6666004)(2616005)(38100700002)(186003)(956004)(6486002)(478600001)(5660300002)(26005)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u54OmKvrU0pDJwsVDVJ5BOVJNk25nX23N7uyENYOveF4E65o9++cLfv8sH8Y?=
 =?us-ascii?Q?Hy9s8jZkyaS3Ttr7Hyc/L8SNS9+0MvZv4i/Iw0pN+lq/sQe+fe0p4WPP/zcB?=
 =?us-ascii?Q?TQHA8LEtJGHHb2vJMZy9ziInoIv2VUi9KQy4qxCM9+/gArXyL/IG3d3Xei4m?=
 =?us-ascii?Q?kpEvYdbXlXAuo3vWs+pASAFbpHzRcLurZltc3SLRzyFCS9ViCuEMMKgAPlpl?=
 =?us-ascii?Q?HZ2L9BvjKNnACuO/9kE6PtIZU97agqwOGuBQnc07OfDi4NTphfGBYYmf3D3e?=
 =?us-ascii?Q?VWBLlXO433fetG0Ay/3lQM7dI3m6WLvhhpGs75Sqi0+fSTv+aheoyNYKi+yT?=
 =?us-ascii?Q?1790f8DsYCeSvjLkmoUB4EkeVq+rnTcF7XgEfN2o4PTRPmVlEHd92oQpklny?=
 =?us-ascii?Q?mgL0jmNuzfFq9pKps/7HcYM8EX2DIfEfvgZEtf1n1VLoSYh5ivUZ4T91iYcl?=
 =?us-ascii?Q?Yyep94T2vjzTAjHq0sEpOh489+DOLP/Yy4cbPq9BnOOQLH10HOOxMkMRT9hZ?=
 =?us-ascii?Q?6VTsPOI29W0HiTZW9fdGHgITi40Xbg6CdyGwkbTdpTPzBEhno1TPiJvIQ715?=
 =?us-ascii?Q?FvaCBPLrUmj7fcR1nAieDgye7ATE+IG19qxwUmWOpXjQtaLUzV34NMD82rNl?=
 =?us-ascii?Q?alGvSwdku7VKMo8Y6Y8eAUEQJh4Ci8DSDzqN4MHSUB6Gcbg9/1OTkUF8TB55?=
 =?us-ascii?Q?iuajFL5+JEBltPpyqldV5EQ4Ed3TPE5GOOobuvLeesORKsL20i7ZdVTFMG4W?=
 =?us-ascii?Q?He0dgfkAx00IFXv2QY3s/gxtfGJmsGaUnkL+fjDk63qSX61ZEa+4WBYNZZLb?=
 =?us-ascii?Q?pct5eENZhaj1IIxT9xBHRpLAdvaYVpI73YVurrfZ4+RXQWSafQ50JXN//jTt?=
 =?us-ascii?Q?cOdmSZkqXADSM3scIeYF36fJhlaR69NfKARxN0VdJ9hUWl4arENZnsrksN3H?=
 =?us-ascii?Q?o+r/E0NyXuXuhnUXemGBzNknhSQghwCGYqo1MKf+U1rHJGGsLcECGqOKih0m?=
 =?us-ascii?Q?3hhvykFlFLeAr5OWoqVY+hp/NeUggpJqvM2J777M7p2A3ya12VqzEhkkn5ZA?=
 =?us-ascii?Q?lLALPbYdcBJ3Bz0jMBPAIZ/zQpjfNLTsFT6aV4dgU015i9R/GEcLWeoPOWHv?=
 =?us-ascii?Q?ycAml/RiwfG2XMHoBwvVi51s6vS+AmwqxxGSIrF4y13GbF5NuxTwubvIx6I1?=
 =?us-ascii?Q?jkLtJgOhZWet1JT2JC8UnhvicLIKw98BqiTeEbtXAnQBcYYAXPDR1Z4d80ay?=
 =?us-ascii?Q?/16YT87E4sW8pT/cG/d/ue3mQAxkl8wr3oihwoeBnDmPfl4DVxFaf6cdLSsI?=
 =?us-ascii?Q?FZ7obV27PZYNPLBHmJf0Eo+C?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db6df9e-efde-4550-4011-08d93b08f3ec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 14:19:48.9098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbv/zVBMDEIWNUyW2nAXjrY1nT+z5HA3j4EJn9VzK9nnH/usWh1vhf75AhJA4ezH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7295
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

we stop short of renaming the actual qom object though,
so type remains TYPE_QEMU_S390_TOD, ie "s390-tod-qemu".

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 hw/s390x/meson.build               | 2 +-
 hw/s390x/{tod-qemu.c =3D> tod-tcg.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/s390x/{tod-qemu.c =3D> tod-tcg.c} (100%)

diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index 327e9c93af..02e81a9467 100644
--- a/hw/s390x/meson.build
+++ b/hw/s390x/meson.build
@@ -16,7 +16,7 @@ s390x_ss.add(files(
   'sclp.c',
   'sclpcpu.c',
   'sclpquiesce.c',
-  'tod-qemu.c',
+  'tod-tcg.c',
   'tod.c',
 ))
 s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
diff --git a/hw/s390x/tod-qemu.c b/hw/s390x/tod-tcg.c
similarity index 100%
rename from hw/s390x/tod-qemu.c
rename to hw/s390x/tod-tcg.c
--=20
2.32.0


