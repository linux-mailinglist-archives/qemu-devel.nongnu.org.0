Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835CA38DF7D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:01:20 +0200 (CEST)
Received: from localhost ([::1]:55860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0qF-0003qr-I9
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0jH-0007B0-7s
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:54:07 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:54414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0jD-0003R1-EF
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1621824831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ojl4L+neJju8F31zLKjE734m6XCGtWoKO97CeXlhHkk=;
 b=ERC0IYJUvG2KoxgyDdjsFUudHp1koQ3J2mm56zsXbrVvOoykUK6cVeWWle8MgFuY7OZ0Jy
 uT0F9ElHBNQoqLjOGDniOfrpGe/4BVVVM9WM45/LjPpZnNLTAj9p/H5L2EljYMHikHwgkn
 95Nqed/+ph0BbRI+kEuMLr7YejZKW00=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-IaLGb6pCPh6L_Gieomrkbw-1; Mon, 24 May 2021 04:53:50 +0200
X-MC-Unique: IaLGb6pCPh6L_Gieomrkbw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6L4LibyEflcs3tXocFMBNvCgGjzEyos6mKxq1xjjNiDcG7rE/jtgwskm7dD2wpdewmAFiWdojWdUiRDLlMaxCn+h5+tX2uYI2rg/+7zNu+7+iiPAQMN2aXegYf5ZrQq0J/1CMvMuFXMQqNtL8bczGh2X5lVNfaJnd3DIsT1APOmQQsTNDN6d/+PiA9ztw4HTvdmwO//1uqiOUqfBiII/LOqI2juIT4Gm3Y/N9rrAMgedX9Wj0OT8dcW+VpWJVQ9dIIyT3J7SSmb3VvK4JOm2pZX4KD/Fqc8PTDnqqvQP3un2on6e+AZNC25vMwrRIy15k4ORuC7/qI5oN3QTintsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsXs6Mn9krNLEBDhHvAyQjyXRaPYRa5Ic+7+KVu6TK0=;
 b=KqTzWb1SRsSuYl8KMCPR7iFZnoYgNvlbA7FzcjdKVpj1raaZYTMDWGX5AHHNhytoXyO54DSyTjD0OiJqAhBjUiIfYWcxn2J/SR9eqt/xMf1WzrvWff5yjWQCsKrTsnRRTMD5CysQSTt0/KKjCKIvGyCgXTTDMBAhE8r/zJPhuGwzm8VWcymRpt4Itic9suN+Z837m/WKfAqZHkTNLCQvq3/STe7wFMtnUfkkat0tcCvqPkI+0ZWUlqHvgqiXnWu9pu3++eVopNnhUQS5jACcLeU+ceCVFHbT6ZbzfVD8zOXU6cqsfsh17RUq+0iTSee9HghurqE2GWc0hEZAu9BwVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB4126.eurprd04.prod.outlook.com
 (2603:10a6:803:47::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 02:53:49 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 02:53:49 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cohuck@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 cfontana@suse.de, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, pbonzini@redhat.com, acho@suse.com
Subject: [RFC v4 09/14] target/s390x: make helper.c sysemu-only
Date: Mon, 24 May 2021 10:52:51 +0800
Message-ID: <20210524025256.22252-9-acho@suse.com>
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
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 02:53:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c3e4a3a-1302-40db-d362-08d91e5f27e9
X-MS-TrafficTypeDiagnostic: VI1PR04MB4126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4126ABD3D4377F10192D8144A0269@VI1PR04MB4126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RmHDJ5h1kjqLFOMfsz3n5SiWsR21foz4D5XjbPA23Hf/NYeRGUCt9JKhVeG4Af9uwmbbugfdTG+V8cDrj8Y6Hix0691mr7kSc+j12NEHsEEcSdBAdHqP+hklEB9nxHlw9AdsTw4DWL/yRZ4LzZ3mBHK5IJro0z2bGIdIsfC2iHyoR8SxPJBUqd6ewFUYdPxX5eizt6HWqm/R8AiqbiREEclX/XvGp0aOJltTpJN8Y1mQXdSpCiZQa1GCHlOFW1jnRiRUbAdab1J2scbrJgKyzEjYXsHWkvdz0YTiz4BgFkSawOVKLKIzRpQ3pBiE0J1H4geO+J/CNrzrOzApqB9K70fqnTh8ebwHUjUt/F0TgNHtfiZatmg3mKTL7Dty1vx0ZZA4epNvoHaeeKJjpPoAxgXkWCBL9rlwbWSjoScicg5hTRPrt0/xQdss4B7FrQMwRYXRUBjKfVn1DOAPtc0u1UBZP5PWqkyUahBOxzB3GunUyhIC5tgLcssUXDYWOJMsyj7qiwR+UJ9cSUPBrKDDbDWEqJ8DBU60dFtOt8LEFkJZG5pJ8m7yPE5GEf/EeS0ez3KBTvvb4HzPKHHKiTTkbf9M7sPvCvRh6T0f4SwOOcmjTdEreM0QOVQiwGXE/HHmypq0qKOr4EqHeOUDeIg7JCdlIGKh9huuXY0uT//FjM+cxl1RRdyh0Anrh0oA1+K4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(136003)(376002)(396003)(39860400002)(36756003)(316002)(66476007)(38100700002)(8676002)(38350700002)(86362001)(52116002)(478600001)(66946007)(8936002)(1076003)(2906002)(956004)(26005)(6512007)(16526019)(6506007)(186003)(83380400001)(2616005)(6666004)(4326008)(7416002)(5660300002)(6486002)(107886003)(66556008)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FvqeVnztWKCj15Nv3+ka+VFQ9F9Ys+Odde1oGI0WMuYsESwA6pfG0V13ZsSt?=
 =?us-ascii?Q?5HQog6JWm0VkpXeug1YV1L+vwhP8jUGBa+sLtAB1Z20gVqVNTXxCmvZwJF6/?=
 =?us-ascii?Q?41J3fZGM6O62jGNaznYDfvkweKVh/ZPCvBEQAJpa2M60clxtodJtm+zkNM33?=
 =?us-ascii?Q?mjdaXPdYcLWXwn8qaoorsgy0TOsgNnJH+WxZ/ui0+ydN+oGil00GCDVgS80k?=
 =?us-ascii?Q?3PodApju/uZDcbmqkjFZReY0lgK++sP9INPw3AhVQ0BmvuUbQnJbp6B/+zt1?=
 =?us-ascii?Q?inVrwCqizAhfA7YIyfgJN/Sp9jQJHdw9T0gQ3EN0tvKqfRx7bphaR++w7xUu?=
 =?us-ascii?Q?6GuWbeLlihLHYSZFRZNovYE9tRDB2ngGJPI6aFoiKq0mKk+ZZhsTjjrytVaz?=
 =?us-ascii?Q?dy5SwXPfOWwmFf9mGHDETg9oj2KdROL9yFBh/zdTaj1A4H4CV4gNFMMkh8/c?=
 =?us-ascii?Q?3mPBYkdnp2ycCTvzE8ijdYsKiZ6MizSmfJFeDXT6RZ9TvK3CIlYJcUoJReaF?=
 =?us-ascii?Q?VqC/PSB5fk6thv4MIQSTxhCfZNlDBfRCuzEdfg+mLW5bpdLmrBpO7j4p9H5P?=
 =?us-ascii?Q?SSAgp9O5mxLH9Z7JkwCIKZPERWS3bIMwaawYwH6mebpx/jCKb+X9s6hr1vGY?=
 =?us-ascii?Q?E2affABVseMiROpfutmQBEKNhEt3+toiChZilgXMmQHeiUUG2CP6diGZSYbA?=
 =?us-ascii?Q?xmDnC+4EzvmJ0N1WtJFiWlA7LaQzjDGjzyD3oHxx9HHT8j/lYMUcaxznxes9?=
 =?us-ascii?Q?qzbh89ih5xkmQserWgGewWIRRfEvmv3bfduqqRdaP9aFMTHWDEtx86gAmDAU?=
 =?us-ascii?Q?ICVUFfrePldcJZP8mvjBTqK6Du/P6ZRM6350xcbf1AFrS95KjNMpgJxWygXm?=
 =?us-ascii?Q?teJYJ+AtlnPbB6yC1CZiczBnM9XjXaZiiOQz+tpi71TBJmX+KBdweoT5JuZN?=
 =?us-ascii?Q?2eyfI+pwXPspkVnwFWuSVkjedWzfnLEMvf4FhSSbH3oA1tDULFfXiCjLgwgV?=
 =?us-ascii?Q?/V/kIrzzzNB8seirilbved28S8tzSFy0az1nD6JuL/nNF2YTH/Y9HMuuuVwo?=
 =?us-ascii?Q?HRRiZmawiwaQlN13435BUQ0lQdp3T8I7Ih63CGFILZCVzHMbgnSwqAbiSm7j?=
 =?us-ascii?Q?xQ2cWmmgp82OOHmHIKI26lJT9oOa233JxiegsJjXNcNnUqO+FqAYnnqOFAg0?=
 =?us-ascii?Q?8wiMwAF+DFX1ytqvx5uXrxaD66cI2R8jyaAXsr/qSi7btiiOFKENcyfkpDt7?=
 =?us-ascii?Q?+dSwmuRRb4bw78KDmEMCAxDebEP+HktzkTGnLepI1RrFyKO1yWi4wIegrQXr?=
 =?us-ascii?Q?rTsiPSymWMQ3DsqtOCN3TwPn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3e4a3a-1302-40db-d362-08d91e5f27e9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 02:53:49.1676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdObPAYyTgy/l5667bo0MCdbONRyBwltECdFwC2de6gk3qriLjES5vCH3RvLvuxR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4126
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Now that we have moved cpu-dump functionality out of helper.c,
we can make the module sysemu-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 target/s390x/helper.c    | 4 ----
 target/s390x/meson.build | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 41ccc83d11..f246bec353 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -27,11 +27,8 @@
 #include "hw/s390x/pv.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
-#ifndef CONFIG_USER_ONLY
 #include "sysemu/tcg.h"
-#endif
=20
-#ifndef CONFIG_USER_ONLY
 void s390x_tod_timer(void *opaque)
 {
     cpu_inject_clock_comparator((S390CPU *) opaque);
@@ -322,4 +319,3 @@ int s390_store_adtl_status(S390CPU *cpu, hwaddr addr, h=
waddr len)
     cpu_physical_memory_unmap(sa, len, 1, len);
     return 0;
 }
-#endif /* CONFIG_USER_ONLY */
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index 6e1aa3b0cd..bbcaede384 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -4,7 +4,6 @@ s390x_ss.add(files(
   'cpu_features.c',
   'cpu_models.c',
   'gdbstub.c',
-  'helper.c',
   'interrupt.c',
   'cpu-dump.c',
 ))
@@ -23,6 +22,7 @@ s390x_ss.add(gen_features_h)
=20
 s390x_softmmu_ss =3D ss.source_set()
 s390x_softmmu_ss.add(files(
+  'helper.c',
   'arch_dump.c',
   'diag.c',
   'ioinst.c',
--=20
2.31.1


