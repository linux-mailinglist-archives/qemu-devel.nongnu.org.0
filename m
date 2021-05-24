Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E8E38DF71
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 04:56:00 +0200 (CEST)
Received: from localhost ([::1]:38716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0l5-0000oJ-Ef
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 22:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0il-00067X-Q3
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:53:35 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:48589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0ih-0003Es-SM
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:53:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1621824810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lWYfYaBeLKoTPKygg7GlP3YGrQYWI9Ileyh4z480xTM=;
 b=Ia2U1EEuQEP91K5+GnCzhiMtr/8SBBskLGzi5d4sDcCF8P0kimPSZjTkHJbK2bGQB8cAs3
 QejsHUfb8UUy0w0pGTEqsVIvr7WywfQrN4v/6F8WiQBeXCY2AWgF2Hm2/TDbj3l4Zj/Lgr
 XH4WmUhRokKDm0m02jKmNQ6Qli6niSU=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-SGA1OXu4NIqe0k57o-wRKA-1; Mon, 24 May 2021 04:53:29 +0200
X-MC-Unique: SGA1OXu4NIqe0k57o-wRKA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0MDwp9nxTWWJPeT3yhU5X0BIHbN8MPiLJf0ohd3nYV5tgFhHWlGMBeQJihO6nGvkgbCT/2Spv1aEAQi3AcRKkswD63VltgdwVIjg4Q8CN9sJrcYEvd6CBo+pAzc5nJq87Kz/fgURMdTEMsd0LTGFZ9xb6i1r0FkfpBXUoOHpXt1tkRS9YQ9PteiWtxp5M5E2LjoxZMK4SntSBKUCuT9Lryq3ti/jl17W1U0JVkk/R0UsBMrb+UzD+Ut6Jy4Sdn5rPUyRJiWvjj3oaildFuH4Ba/GNTZIQ/wh72RP3bZ9un0hm3COYS6W40XHvuctE6XLbbQyLy13SxY39fwz2EcAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nq0qpyMJJ69Q/fNyz77BCzdupii77fc+pM9vLjT7r5k=;
 b=mhylBJbD29rIEUyCY+BaaVv2jBELFrG9D82ZfYBwWiaFzQ0BJWzeDtH8g1Ju3+0EjKD4r5iKGzVYsP8YrmSKrhWRF3/FXCnLGjJUwA04QvPMzDiB1hjvXTrMFGYxZDos1ewQjMlO+48MjxRijgjiccuaqNTJCxXFuFNRS/g5oXxdnZ46JAHoCsHBa3Dmr4SFM6wUbUjyMYIy04EarK0xvbM0otoPv+tGO33OJRZKEawPPGsyH206C0OILrGAXqmjk2dk/7Pnkyk1JnZqbNeUW73LCqtBczqpSJTsbzucPDkeUxFAX/0YkE6QHQSeJpQ0TNe51Adyk0HQqy8v7rpkSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB4126.eurprd04.prod.outlook.com
 (2603:10a6:803:47::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 02:53:28 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 02:53:28 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cohuck@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 cfontana@suse.de, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, pbonzini@redhat.com, acho@suse.com
Subject: [RFC v4 04/14] hw/s390x: tod: make explicit checks for accelerators
 when initializing
Date: Mon, 24 May 2021 10:52:46 +0800
Message-ID: <20210524025256.22252-4-acho@suse.com>
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
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 02:53:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1cc6865-95c6-4a9c-024f-08d91e5f1b57
X-MS-TrafficTypeDiagnostic: VI1PR04MB4126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4126DEF79D389C999E02A53AA0269@VI1PR04MB4126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 10PuO+dOUFnj2kNU4PtBUU9+Q3Rq/441XcqHX/SuQ0i7boxsGIdx47qAJQ8IINZM+mGBdqByxe+nDj6ID4Il5m5h7YXyvQ7Q2dv7e4MSoFNsvAjcWr2K1UxWHK7rWg5AuzOnX90MMb5gGcGnG365ZsLA4Qc0ihi5SUJsQIz4CG/Y7XeQRw0fhrzGtrU4TzojCCGq/2m1IhFdmSD5fhUdaeIzkiRRYEqkHCJAYyumIxjb2QTz6+1c1dhlTAbRMEqsteOHIFEqNPcguJA+7AWOlFteO7p1f6UwrtR8O9A6HyvQkwKuT0cLITjY0VaHs/eVUfZb1xlrFZQ42EzL9RJxTjxJqHt34Z3JK1kwirivA1iNqlxXT10R5vw25u0uIk9OxmzO0St2NlCkVIgnXDZgisZEjuIQ8U/MuauXOn0fYxOSye+pS5wm52gYB6YSSiJATCNooO8z+gVfXNuFgqsXBdb5TVLXhsvKVi9VnWgWZDnokSFYwXN/bO5g+6KYZJP1oKWtFrtgXTeRKHWZHNhWy9aYcAIBptmL7x5aEkeAL5UrWQ48x5V5y2vyH0BLKEn7qVTLQedMLiEWrf8gNSt+RiX9GdBW8o0BoMkcc2te2rddHZHq30RdSeB6ii1xwCD5iJ5RxvTt5e56Xu9g6fPaOsr40ic5gtsTfZjD8tjDzCPK0bp72Xk97DfRBJ0rpTYG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39860400002)(136003)(366004)(346002)(16526019)(6506007)(1076003)(2906002)(956004)(26005)(6512007)(7416002)(6666004)(4326008)(107886003)(66556008)(5660300002)(6486002)(2616005)(83380400001)(186003)(38100700002)(316002)(36756003)(66476007)(478600001)(52116002)(8936002)(66946007)(8676002)(38350700002)(86362001)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?tNQ6XFgNzLq4fsDfqPhoKv55JWnmD8XCBwn2PV2/ohYq4krMzqf4vB8V3ppG?=
 =?us-ascii?Q?RHPKlp8f4JslTLyp30VvwgxTT2205a8ghh5NR4G4YF0O21FFPjJ1B7oiPv0W?=
 =?us-ascii?Q?d19Xv/hFmJ7Er4jxQyM4j4by1adpezw0/nJ95RzezSr3YCtnZThdYxnqu3/0?=
 =?us-ascii?Q?YU/pLFqbzrmV+rzhctcgSUyo8ognBoPbSBHH7CJLDhMdCzSzwXibxZpWSTyN?=
 =?us-ascii?Q?osVXkFDx7bVEN7pRdFARiqpe1hSWpyj1uwM6X4vA2WhOctA7rANznm8BDWit?=
 =?us-ascii?Q?srzWh3Lr5BHSKwNg/HZfG3DdcEYr3YHDbM7kh4tbDRKYNXEB/uE8y1d9h8jH?=
 =?us-ascii?Q?41Y36ynRblCD5QllBgsxnGiZb0c9lVdBTzDOoBYYrVH5ikvJzVh7XAs+mS3m?=
 =?us-ascii?Q?LC6El6NMTPQmCuU5NhiIOzqYRR70E8Ze0TdLzEqxd2AAjH31H4Vq5kqRkSd+?=
 =?us-ascii?Q?asqFWaMHytN6ls3gl1N7GuxbqehJPbtDQZLNHZOMWwfhVrMW01vM/jIe8uI8?=
 =?us-ascii?Q?9NWDvlP4DiCFoJI7f1wrrB/hEleucQDasDAxkifzldRWnjlgdNg7WFeWfLh6?=
 =?us-ascii?Q?9QxpcBHUUguHqK26wpwaPQXb41ZaEhPZOtbL34qEvgZMQUvYIwkMgjOa30ss?=
 =?us-ascii?Q?jLbDtOfGNA/PJXnxcUI7/W0RP6mf2Epnxw702pywWcJl5synJ1velTbQnxoI?=
 =?us-ascii?Q?w1yFIE0+WinN37PgQSDb5W7XnAVQvpfksJ0bo2Q0+gJOK+6zeavxXHzY7K4c?=
 =?us-ascii?Q?0gdRJ3l/dqX6RzSTHHhk0vPgc6T+G955yG+r2f2sFYf3201aJ62LjU1fJxVi?=
 =?us-ascii?Q?NLsZ6PnPGULxOEtDNsPxUY6PKvVc3t9N/cExEe22OG+oRo4aEFIU3QuKhzLt?=
 =?us-ascii?Q?avt3B5D0saPaeiXbYyKOv/S3DO0mQ3gI1YeJhHABUWjFyQ8WkFniWkSR8E13?=
 =?us-ascii?Q?mrKV0juWK8SXHaf/Dqbnws3k8oqKm9Fhwn21X3aanVBsFCQJDcTnHCfewM63?=
 =?us-ascii?Q?J/5e/6tovqS6DkmJ0KqCQJSfbEsnoTQCA4THaL3GX3AyXAbtpOK6I+/xEeGL?=
 =?us-ascii?Q?cB6f7jYzYtqHDzsxnGoiRE+mvNcc2hvJzvwaLR8rsd0G34UuySBsdsIN9UFa?=
 =?us-ascii?Q?QSkyoeMVBOfQaCbJAVLx4lVCGOI9Y96jOutvFZo/ribx5NT3U2Rkys56th5/?=
 =?us-ascii?Q?6qk6cCdPY55rxoV/ijq+6+dGnDOugPHI1CEoaWpmZ28E3mp6/BkeQIJHvPgE?=
 =?us-ascii?Q?gDEry8D6k1p1we7u1UmP0eGrikvS8XMa7sFYyufFuduLHfTN4JAvmoEXCZaM?=
 =?us-ascii?Q?yIw1vrTkX7pAk8a/pOIWYsk1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1cc6865-95c6-4a9c-024f-08d91e5f1b57
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 02:53:28.2557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JqANtw7BlcG/Te2LBg7usz2c+7QDvOoQYXqsbe0fS1bXXQbur2h2JxS3CII42Db
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

replace general "else" with specific checks for each possible accelerator.

Handle qtest as a NOP, and error out for an unknown accelerator used in
combination with tod.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 hw/s390x/tod.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/tod.c b/hw/s390x/tod.c
index 3c2979175e..fd5a36bf24 100644
--- a/hw/s390x/tod.c
+++ b/hw/s390x/tod.c
@@ -14,6 +14,8 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
+#include "sysemu/qtest.h"
 #include "migration/qemu-file-types.h"
 #include "migration/register.h"
=20
@@ -23,8 +25,13 @@ void s390_init_tod(void)
=20
     if (kvm_enabled()) {
         obj =3D object_new(TYPE_KVM_S390_TOD);
-    } else {
+    } else if (tcg_enabled()) {
         obj =3D object_new(TYPE_QEMU_S390_TOD);
+    } else if (qtest_enabled()) {
+        return;
+    } else {
+        error_report("current accelerator not handled in s390_init_tod!");
+        abort();
     }
     object_property_add_child(qdev_get_machine(), TYPE_S390_TOD, obj);
     object_unref(obj);
--=20
2.31.1


