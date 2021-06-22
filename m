Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477B83B013C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:20:40 +0200 (CEST)
Received: from localhost ([::1]:52424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdWJ-0005Uh-Av
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdTb-0002ZA-Em
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:17:51 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:44494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdTZ-00063g-JZ
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:17:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624357068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ejnA0XeLS8mP5uKqVtQafxU3Oq3hXVKd93VxdEgF05A=;
 b=ShI/J52utsHh45jVZlcATxSY3I4mqgMHdTXBbq9EUwEPSqs693sRsYile/7at+fWfstcY3
 /R/SiCusEflF/P5Aqv6Xnxx0ZYvfaVPK/X4ucq/QWhC5SZs3rUMcvS/ZlzXL3+pCQ/gEPg
 e+P2dPNnf5WLqBDIkPe4yYvOKrLNsEM=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-GnmJW7oAMjOvqUSfhyJ_Iw-1;
 Tue, 22 Jun 2021 12:17:47 +0200
X-MC-Unique: GnmJW7oAMjOvqUSfhyJ_Iw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMupMOENrkj9LcpWiTLpwoR7l5m7/qDPqc19Rmz9gLcQXjbn9DyOB5l9U5Er4donm8+c0YXhCb3wz2WuBa+eIU7eFTPlBVGm+0UbOytcBQogUfs6Ito+EqA3TyUrmcoaEYnwop43nQwqdy5YGa00cIlTDlu1rxjr1xnlJus1A3pFFmJO2ob0b5tu7nawkd2XO4oza2YGDpohdo4HoiQ+bPH+RdiIID7gYlSYchBekB13Qd1wOCZu8UEi6TiV0X5d3K6q/rpIMCh3N8W1OA1C1v6ZBI9tzYQRQVut2z1He+9I5EtlC2sxfi5EJSxJ6h2/UFEqr3Z+Y2W5XOVN5aQ2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zc+NdAtMX+OVdXw+G6Nf9o3ckvzhqYycZb1Wm6H0L5g=;
 b=IUMjBS9i0md5sgOcN4zZRkBKD7MTts7ziCT2brnl0ZYUYpGCISKnO9X8JvOOn7Tm10S+M9fjA0BSEQpshnsP9Ow57OA8RqIAXMo+XMeoCqYFFI/biOkKZ2Sb865uLi1CMthxbDpIgHii+F814wfl1ffsABEp27d0XBchMIv+a7XXklJ+UgLZDA1afE4qNlSEwlF6Ol2oZjT0m2jvpz6V0RVqDnk9omqrOaxDnA0VUntH9wuuVMHi8+2+kbGJlyAr8mMbjgInSD5G5WnTF5Nix75B6UEAyLgr8S/8oxe90vDLIPK2KjTy7n4VFwq1zK2d+nyk3zLd9D2uwDLUw9wo9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB5405.eurprd04.prod.outlook.com
 (2603:10a6:803:d6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 10:17:45 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:17:45 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, Claudio Fontana <cfontana@suse.de>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [RFC v5 02/13] hw/s390x: rename tod-qemu.c to tod-tcg.c
Date: Tue, 22 Jun 2021 18:17:15 +0800
Message-ID: <20210622101726.20860-3-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622101726.20860-1-acho@suse.com>
References: <20210622101726.20860-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.30.211]
X-ClientProxiedBy: HK2PR04CA0060.apcprd04.prod.outlook.com
 (2603:1096:202:14::28) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.30.211) by
 HK2PR04CA0060.apcprd04.prod.outlook.com (2603:1096:202:14::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Tue, 22 Jun 2021 10:17:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 974d49da-f0a3-4906-f0fb-08d93566fa85
X-MS-TrafficTypeDiagnostic: VI1PR04MB5405:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB540508FF8C47C9FCD61ECE87A0099@VI1PR04MB5405.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oDnl91tP9Z8tKNzOlDN7ZmI6P4FniU1UXmlTFoIJoL20NyWxuEDBEJoVRB0ze5W5RZ96f0jeaR1uojSTw/SU1mVR4ou+U9oEoyi2fnSciqAWEKoiKGPs29U5FMzjohvUCDX5V8ty+MD4kcB31+HTx/Dchb3NFIJS8zpmQZESEgnRHTVG1QpfxrAxQmAOhlSJkWY2KwrdKZ1+YGn3peV1q/NPUyvzdeMGsTcX1CukuwvJoixumb8d8oTwlVTuXBywDNT3qY9NC8dMuhY0jdBCCgXP4g1S4S+NOmleOmyXTL8chS5RQABvZF1jLumxGD5q0hI11gXH9quNfA3ALka2Lm87WGNA4lCq6ZXNur+8W5apJ071Ijbq1FKjh/J5057VhwPoc2U6GuZx5ZCIC5UTt8KM/WfGOUcLVsjyct0xLuZukXpRsXUn8lUIkEvDlUn5mu6cLAX5b+C8vNNxMX4NTsgSvQiZ3V6VyzMVn7rI4UP8PSctcE1mnrq3VQoV5WWgsMH900iZOgyhOs8A2O1QXISOoTwRFjMaWfWlSasYLU/fg8JMJb6BdEcMTkl9UrkOEe8Avc8Z615A1gzU/zrqHK+gPUiu0sQXMqdu89XQEL5jHP6iYxBTYQVzjOqh1i1lCclrGJ1iNdf+rD/0zTBJbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(376002)(136003)(39850400004)(346002)(4326008)(316002)(956004)(86362001)(2906002)(66946007)(6666004)(6496006)(2616005)(66556008)(66476007)(8676002)(186003)(16526019)(26005)(8936002)(36756003)(478600001)(38100700002)(4744005)(5660300002)(83380400001)(54906003)(1076003)(6486002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pzuplKMCVwZOTZYm7vN3iYHC6yJuzoch/PZndip4hFizJ+UfoeyPvtCcflU7?=
 =?us-ascii?Q?8QjmrZ4yDwEdZP6JigAd0Ny1ucuddV/c22hd42DTU9rV9RtZn5+e0UWYR2Hb?=
 =?us-ascii?Q?OwEFk722y2/mttElzTktkcy1cp7e7u+xQPfvMpyP68bIwRc4RUsJpRPpDNg8?=
 =?us-ascii?Q?Nooh9WYhVk6k/fUYYheunBwhpO5er2dLC0skQbHviEA8ReOXq9wzcno8QJF6?=
 =?us-ascii?Q?6/gXYvgfOTRwDs3xNzIMhjMzQLHiOfSbH1k9S9952+ACvwCVpwbRyjLUYF/S?=
 =?us-ascii?Q?bYy+DYbZzUIpOCraS/IOfu2Na/W/UWqs7gIem1Qgnyj3z0uKLHZsSndsSvY8?=
 =?us-ascii?Q?wydWry7VBSpiit0KOQx/czJoH+1HqBAXKh+5jRgt93tOV4AJfK2p1OcZN+4j?=
 =?us-ascii?Q?C4JgOoazG3fwx1o6SHn0HlxZePbG1tX2UoY0yYTUIHgdlGzl5ss4cQ2JWVxK?=
 =?us-ascii?Q?U3PqUjicoRKLYtXxhf+P5jQ8S8e/6Ch9xCd6I9YbjFWurXTcc4MoIB14CeK7?=
 =?us-ascii?Q?2EjssLzzJn2lf29mQPOhL+eQu8KnA0UKsGJ4PnrX0gJwyvFy3v7Ifdthg/Hc?=
 =?us-ascii?Q?XWSW51BVznr6QdhKpOIxLEU9E9KjTe0u/y+QhRZZ9QPZFWvxfqP+e3e7G/Bs?=
 =?us-ascii?Q?yl6yL313UGfn6rTlBnIZOC6WYtTEx6uKjOcokh/1+TXIChS+0/xo4XwQFhET?=
 =?us-ascii?Q?ekRHGIHRLU5C0k5TtQF1dVTGw2bui4/ofbaQL8uGubQ8ZxSdO8UjzDxIUgj3?=
 =?us-ascii?Q?XBWtJOL9u64CuB/B0m0rpGXbgwoRHKgCj7wXMrHXq7ayKERc+2ik7gOSnt5l?=
 =?us-ascii?Q?ewnwbCUME8KgFKmg7OQOUl1QHdtCGzLrvnTgY0cOZHQW7QRWjHMj8hpsPk42?=
 =?us-ascii?Q?gGUn+feJZyLSmLgTfq4Q+o1KCqDfib0Fdh23PoSWYmNAYWt9ZZEGjgkugPR8?=
 =?us-ascii?Q?8m71KeoO9876zb5i+IAf63gYWoTki7cGgbg1nvrNjFXlWg30HtgmFMdnBUu/?=
 =?us-ascii?Q?Ik+oLqFw+tEqCTqdhHen/KPvQ2V48ZOFqoALJaGP1XrTy5XsMO2tDYBT6nRo?=
 =?us-ascii?Q?tXtgAlGbvE/UFWszgeAonYbY8orlqDJCLn0IKIucVI5MfCX2vQcccujPkNiC?=
 =?us-ascii?Q?mYv3UHz+ksPLlsqR7SUMmOKGX1wBSW1XjNEB1HyqVrLCfIUUk6RqbVkaUzeF?=
 =?us-ascii?Q?F/3kLTZ3zKsiOqZTcF8w7ccQnsppKdpZSkLg/IreDZwZP4Al6pQL5l98sVYf?=
 =?us-ascii?Q?f3wIYkLibfzaJeUYr6zdEcy7WmpJ7vZ27Rj8khaYUkYQIlT7bI6LbmlzHYnN?=
 =?us-ascii?Q?ZzJRt47X7gVrFub6A46Tdz5d?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 974d49da-f0a3-4906-f0fb-08d93566fa85
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 10:17:45.6713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPCcTluCwSLbsMcJ6z2jlDG6BvQkseAbh7sqTwksFNJOj/XjjiPHo+gh5raRgHOM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5405
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
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


