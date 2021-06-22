Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269B93B0147
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:23:05 +0200 (CEST)
Received: from localhost ([::1]:33120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdYe-00033x-5v
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdUC-0003Uq-2G
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:18:28 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:36163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdU9-0006VS-B6
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:18:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624357103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NZ8IVP+/zApoEh+BqT+JPVGDDLxpay6YbMz/EFtjrqw=;
 b=N4UpJlEukoSschgCX0RA9W++drPxbVYB2zcurG08uD0TZOJWIF68Ja40MG835E/geB2/dr
 SyNzx0DoCIgDFqNb1h7lb+y8sTsmfasHL9SIndJHceZOihSQ3wS17oc0JyF/oo0EWyCRjt
 hR1hmaYcwpTTzTATMQHJ/WGGeJhE5KM=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-vpOIyUW4OX6YlJ2uG-SpFw-1; Tue, 22 Jun 2021 12:18:23 +0200
X-MC-Unique: vpOIyUW4OX6YlJ2uG-SpFw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpQlND5jMbPpjXLpb1oEoxfyO5NMTQo3uA1WPcK51g16S24B9J77/mFjkt9kOOisr+DmCTWLG5xCEfcRZVTTTWJCyphg5DCXLioBBsPOtncB6WZBRR5VM4orCI4+Di+wESSkg7D7LaoHRng6IJr4QQsQ6DGfoayijcISSetzwZ41ZwhV3T8zkJzHhZJ9Y8LQ/+XVmsakGuunCXoiGxT+u9qJ77PZl7gdovijfEvKK0ekoovyZEQ1ho8pbMEnPVb+kad3E+yCuuYIxWBq1M4Cs/9Am7Zm5c8vk45Ckxpgr/9QfVZLtP8JdC2PUMcNbK7x5YJlzzubQ8DarGW3qMhs2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytOf7LW+TZaAePb2wsSPx9rQQg7/l+IzunlUfKZET34=;
 b=RbvRFs14bSFbCqqSVWW9VbJxZd+m1XMCWeAumaVj6Y7TJPfJYcX/Q/KySp+YnOF9iXILJiCKCbTdoylV1UT2sQ+ZOhWy8ageIWq+CpbRu1TL6D6MBHGldjbkqHrYnm/4r7kPSfi/yOGs+eUmJZUoyW00W0sQgSnFas3w+lzluHnHbsHHlJggG/mURa9QwNwr4VN5t5aEgir4Ml7EhJUdWUsXnB3NvXngzUeNp4HiRI4y/V4BIlDvBS/mDirl1xo/sn/0JoUPG76Cz9CGRJGgp2P187LaDi8eD0T06HK551DnBLB+bzYFxPXJtm95RszUhOFMw7bFM9P3R4FxgMOhog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB5405.eurprd04.prod.outlook.com
 (2603:10a6:803:d6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 10:18:21 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:18:21 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, Claudio Fontana <cfontana@suse.de>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [RFC v5 05/13] target/s390x: remove tcg-stub.c
Date: Tue, 22 Jun 2021 18:17:18 +0800
Message-ID: <20210622101726.20860-6-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622101726.20860-1-acho@suse.com>
References: <20210622101726.20860-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.30.211]
X-ClientProxiedBy: TY2PR0101CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::25) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.30.211) by
 TY2PR0101CA0039.apcprd01.prod.exchangelabs.com (2603:1096:404:8000::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Tue, 22 Jun 2021 10:18:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5eb4a4c7-61ce-44f6-6f3e-08d935670fd9
X-MS-TrafficTypeDiagnostic: VI1PR04MB5405:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5405B5BD2AD73DC4EE1AF688A0099@VI1PR04MB5405.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FS1lxkuBZh4EYTLTc/kpW6cuvQ+owXJh3JJdOi3TGz10DQYzS3y1+inegyTnHRXGuL56dKhrwwLYdgB+o6UD5gee1hGLzqWav2MCKURUE5x+M7CA5FIm5tg9VdWsR5ToiL2wAtlh6T9tj7AVSj7qzvKZKINtx1Jp8KsmSByGqveidpf/N13i0p/FpW/cHWNft8XsfatGxSv7cBfhDe6O5jEnv0XJNqL2BBF/Ijj74t8SUgqZMDRt9DCMcJNyR2IF5jIFVg114i2FPknhldrnUHw0cfpMU8x5N02YK4ZQNqElnzZFtHJ6Q+ekHSwhVRX10tWHjRbrfkIPHHZjugrVr1A3sTJNf2NloLzAcSsL595uxJoPytbKYyU6e8JwkVt0Cj03B0ScRlJkqCKciox9bLo0YHvSycEomximS8bSVaolwxPztXqxjUvTehl1vHYuurF8o/LGAdHzQoQUcQqubrCKhTMI5MZ5by9nZa1/kxeqGDulylRgBjZh1PVVOdNsoRv9sDQsX1kR6I09qWJwOixq33ypwOvpHI9tE2jZcW7yXVW5qoA/4kpbFS9IzCRxp+IHkWZi6B5MTsLwI0Xy0YiDLobQ1wEwseooXiPsrnVcO55oSm86pswL9w2eTiVUWvvYMrMWQ3prSypp8ITq4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(376002)(136003)(39850400004)(346002)(4326008)(316002)(956004)(86362001)(2906002)(66946007)(6496006)(2616005)(66556008)(66476007)(8676002)(186003)(16526019)(26005)(8936002)(36756003)(478600001)(38100700002)(5660300002)(83380400001)(54906003)(1076003)(6486002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bXN1M8vSUqoaQtxNUGp+U6CJJ32Tx2XTKT3wD2Py0Wz2jTj5Ny8/JsJ6ygu/?=
 =?us-ascii?Q?8Imt1UIV7LduGDsVM9tXyJO1V86ONyrMQ4J3CuZQHU3jMbFxlm+yXqjKBTgz?=
 =?us-ascii?Q?vtvrjPKwO4Bl2DJV1M4ajv1x5/p5WRcC7/4fkn4zayHJMvZEEp1rHgWzrJN2?=
 =?us-ascii?Q?yc5V/bVn4eRC13iFSwWqzlU3u+tJ6LBqBkghwgqxd5plGmKmf9jFEhu6uz1H?=
 =?us-ascii?Q?AbqzORxCmoyKGi/Yoe9sjLGX/D2/XZcxgfuBt4E8KY3nTXdc9ZZGIY/RENmG?=
 =?us-ascii?Q?fnNWFkBJ3GI8Mg0eCeXD3TnZMjnBOvay0sI+ctFJ/RQUy0thrn/7egJORBCS?=
 =?us-ascii?Q?rta/3crFqeNMYeQxqYFIKBgm7l2OfhIHuCBNIfeMQUOmBChcF7oas8dQgjlL?=
 =?us-ascii?Q?QfJQHYkb8O5Req+kg2BOBlP+AF144j6LfwYTt+RH24h/5klOpLug9u6ClQbh?=
 =?us-ascii?Q?iWsVliVEsAnn/+8MyObcoHUJgYgjLEPwDGZIPE6JBAb+trhKUIsxVWb2k53W?=
 =?us-ascii?Q?DC5lJjFxV1Tyc++mSlA8xWicyTn1NZ+e/Z9MXgdAMXyakC+JhnjAzG6UVSTN?=
 =?us-ascii?Q?VOn8oYNF9WHVqVMkkt7xPe7NYlfKyvGri1bJ/cUBtK4FVsmNR45hPURP/6JG?=
 =?us-ascii?Q?VbcPP5XZ0LTt7gUSxbhZgum4aJLVQ+ekfxql0vT5hRUUGsAnUWq6CkM8x0A0?=
 =?us-ascii?Q?sNacSiet/MteTw5w2NHfTDrXO6O3KHI0IuXMr//lJOKCzDLASjkRHOtfjjGV?=
 =?us-ascii?Q?Zvp84oGq8zr0MSzKFYVF7C5UcHHRb9JEmIwVU8opS4jjhM04zlWos5/Sam4i?=
 =?us-ascii?Q?96UHs9c5XuwQTmNkLkFZmvn54bT6BW1BJ2NFrgAs4uXCHYlN58U1tgJ7YAtO?=
 =?us-ascii?Q?LvxKvXwLs9BwiejKk+3JTiIeb9GnqGKHOomtNsz9P1aliElfWqFmhQ6YNEjg?=
 =?us-ascii?Q?ER67fhDTPxQ5IEkjDiVXk+UjEcS4tj6u70ciJdDovXCj5enTRXPPwVYl0/2N?=
 =?us-ascii?Q?EuUYNLkKYKkXsJGMr1k2QzPOS4c+FG6abawUoxaP8/SFzFlNoiItaw68hFtM?=
 =?us-ascii?Q?AVzUxE1aLKqyYUWmhtB0QqEStEP0bneEEL4AnQND41w4yahXRnArpDCS/Gjs?=
 =?us-ascii?Q?GeEI08+ZNAZt8Tv/FDhIitaT6BiNs+1LQRSge7NV5hX2seyqnI6nj0YZQaw/?=
 =?us-ascii?Q?aFtE8kPHgCk7Pu0zN8vOSwMYG8QFCLeY1Xpn3iUYLFwIVxBQuS0JsVTh92jF?=
 =?us-ascii?Q?Fa41AR7Mrf4B6WwwQH4lMFqmlg/WZQTcYKXR8Pxhp5YxYKoXThO58sGq8YiE?=
 =?us-ascii?Q?pXnO5owSjV5zKb5CSbT+Wr76?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb4a4c7-61ce-44f6-6f3e-08d935670fd9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 10:18:21.4666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5iXWT4kBK9i+DzHcf4xAP6BdikKlO+JWNSzzaBvL6uWFLxRlkaZ++/6aJHnjOH7b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5405
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
2.32.0


