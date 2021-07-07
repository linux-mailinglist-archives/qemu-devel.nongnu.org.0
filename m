Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2B33BE6C4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 12:59:50 +0200 (CEST)
Received: from localhost ([::1]:58614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15HR-0007RU-AI
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 06:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15Bi-0002cz-K7
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:53:54 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:32244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15Bg-00021W-TT
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625655231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y7Av/I1BwaOzSgQw7Kqno9tpyGZ2F6rDH0MuRsnUr/8=;
 b=Rju+cH07GQVT2RqwTg2a02ZBT6b7NncOSRAOYz3TCYhqmAAilqJ0c/oSUSKXkD7cjFdXpD
 2I4cm9cKWslieC5M7EYkEFEXCSmDhZUis+fPCR/cK8VyRjXQsvtKmKtNRTs8oobJQbv2lN
 8exyngHYTDEJzGuej3m2Z5TNf/+7klc=
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2057.outbound.protection.outlook.com [104.47.10.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-10u6T6OsMbifmMufiF4asw-1; Wed, 07 Jul 2021 12:53:50 +0200
X-MC-Unique: 10u6T6OsMbifmMufiF4asw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0/3mzg4y57KYoJ1U59LJreRskMwk5fEj41ObZpA8OOxFvPhrBdlnMZ9h2ZGlg2kqHwr1mdeauMJbhW1IFTO3enS5Bei22VHVJ8odABknmf1pBQCIs+yVqzFuNAp8C/UMFsXupGULUZW9/9lp5CDXIwhqv2YoM5xE/tLVaqY6e96j1WSsHIW6XkNqH2T86qpjGeaUs9DCuFTwsASU7ehJ+E2uyPQtoNd6wJCvStDfQTX0wiuh6Ft/qJsXVsyeqJPpI7m9r14cnpNLEz+hYnHTKx1V463tGHiByG1Kk8F7buSoG9WeWna4uzeFF00T0oEXiFn0bMoC8KjgMNZQ4chjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6eheZ7xYViNpq89GjhEcSKW6Mj0GqrT9UCtXkIu6k8=;
 b=D4HB43OZ3AQqqo27FDw5pMcqIEPvD9ddT1z0Fz3U3QYXkK948Wj3sBIBmfsm6HJu9KGvtQhmC58BfpKWpHflXTuM7WtBUgpTD1LDVl1B7Tq+t09bCirZK+7Rhui64tG3h02YrK9Nsq+xPoeQwsjSw4W7JhFM2iMSGXe82IIZ9LZrsM3U8hAn+1cWieAzRSgjYSFRfZejLCBm2s0k94wHjYUH92mgAZwMu0oPaBTyz2Ndz7UhSs5LH8IGFbKwBFz2+V51MehtsL5uu9nbpCf5t1sQd1/J4YDHtepDON8NFG/7xOLjRG56ibOevoO7n1O7kuRa/UoDyMJC6WdmRxz6GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR0401MB2238.eurprd04.prod.outlook.com
 (2603:10a6:800:28::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 10:53:49 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 10:53:49 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v7 03/14] hw/s390x: tod: make explicit checks for accelerators
 when initializing
Date: Wed,  7 Jul 2021 18:53:13 +0800
Message-ID: <20210707105324.23400-4-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707105324.23400-1-acho@suse.com>
References: <20210707105324.23400-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0087.apcprd04.prod.outlook.com
 (2603:1096:202:15::31) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.20.159) by
 HK2PR04CA0087.apcprd04.prod.outlook.com (2603:1096:202:15::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Wed, 7 Jul 2021 10:53:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01e19303-4867-486b-fb11-08d941358045
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2238:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2238A8622F69B67239E374ADA01A9@VI1PR0401MB2238.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4TOOFM6lCRCPMXn7zSGlPpb+jsU2W3DSf9KOLwlNX4b+j0O41dpOMz3kwOi/7kPeDZ0QeIdiMfSFrJX2QOWeb4KevAvwcdTN7CUtBD53Ad6LN1c8poAEvSISy5ynXUZKRcJecn7I5VmJzA5eLxta6cUxDrIhvXVY2YQqEIs18uM8Mry1nXfbVgUadF3RUINlz6lbOAvfNtTTh7Qre7h/4BJRo9bGVMPOsQ9lW/Cf7GCmOjySoAYwUW2cnCk+pKDQz+H5DqF9jM0+/hg8eCsG1lEKlan/2Q3xlm/AP9emfNxuYXzwEcS2mb24CPdyW5FUKLhcx320lieZn7yNUYfc9rNs74gmEMR6TdWdXGeV7+WkFy9cRhYRpVbo5G/M/a1a9UUfrOP8JruUrj0AFwK0lZWFjCeCCmO7ohj6FVDIy38RsW+/if8uQGt7H+ZaxGUBU0qplZjG+dpWjUCJYfsKkQpx1T0rndR1hxSJIqG+gCE4UtYybKYb0ny3qm76T0J+foIsTT2SMYxTgNZ7XtdW3jH3iQX315MTMhaF5wi+CK8+Hd5EfhK4okGOX389AeJXJY0K58qiGs5jvl23VtJmTRbVqS/FQGQSmboJpcdt6Ws23Z5eRgfFxDHQU32YWHg0B+ig+aP9DESsIS7Nkyni8e7oEwed6ZQAMAyKip+i1zcqlbsVV0j4AyYSd7rDAeZKMSVE4JAywZCPYCZdfZxyrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39850400004)(366004)(396003)(136003)(54906003)(316002)(26005)(66946007)(66556008)(6496006)(6486002)(186003)(6666004)(86362001)(8936002)(8676002)(83380400001)(2906002)(5660300002)(66476007)(478600001)(36756003)(4326008)(2616005)(956004)(1076003)(38100700002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y077UdvQT2x1adflHcFdiVbJ8Keinu9UXViLmX5BiwGVFGgNRXZNzaomAAPV?=
 =?us-ascii?Q?YEaehWjq5tvi/vcpJox1edbFspwEWan11Pj63Tzl/cIL2MAraWSoLaXmurZM?=
 =?us-ascii?Q?nUNCoBHgou0+TAWo/PJc/77ydExTePvuK4fz71zDigH8OAKSFMOMRITn6A3X?=
 =?us-ascii?Q?j7c1O0iI0SH6CS6yR7FGW2/dC5h/gzTmuRqaCfyr2i3wxzpXRXHBRleHH7Ch?=
 =?us-ascii?Q?SRwtpkHd4mUO9fH8+JFe1B8FGcvIQA+I5EvSAtB742RMwl6md0u6WZlLynUF?=
 =?us-ascii?Q?/x9H+AjK9azf6GTYEPRBepiCpmzEzKKN9NpWlE0lAdZCC5Yj0PQP5b4o/zQc?=
 =?us-ascii?Q?3IWlpm4j3P0fkOtDS+HChKjEL0BiJz0KUw1RZr6Q3b0sshCiGiuTjObKDEZl?=
 =?us-ascii?Q?VumSR79A8eeYBbWPzxtLXnH8MHjpNd3VF0p0qusR37xQTj5+e7dJRFalTZwj?=
 =?us-ascii?Q?rP04wXiiFOnRtRzh/W0+aznAewO9yiCvCg8Et5PK3aOjwYXWcfBHmJd7NVKK?=
 =?us-ascii?Q?ihQiX12GkaguQwK5LIsVjT77EglDNfFqsyBBuK7oOueMzTxucfNsc/7tunBp?=
 =?us-ascii?Q?yXTprDsQQiscTYijh5nruoSaiaTJLGE/yqC0iW/Iaes0be9GIFLgw7QjOUd5?=
 =?us-ascii?Q?zKsRhDMJWIHl34I/YMffeBrw4y550vDx9ldqbQpaN1TCHcflNUyWxXUqMJdl?=
 =?us-ascii?Q?sFu/JclGW9yY4VwilhRKE0e2NBP8A1bsmiilZlhpfHaQUXqorRwJ8zrItDWg?=
 =?us-ascii?Q?WQSFPmaKO3wtbU5v30gPKaL+BmVgyJb3VxORms+JwHveSEGTtcxOPPKUmzbQ?=
 =?us-ascii?Q?oYH3xNWINBqGMnwIRFUVu647AzHY6GpU/Plv4lH5hfsCOjR2V0lrlOHvP2Ow?=
 =?us-ascii?Q?4PzNwR7R/JNlk0HMkIHt7zssYULZFGLOz4yGMduCrXsNHm2Z8Zia7DvFBpEd?=
 =?us-ascii?Q?siuko5GlcQDs/XcUqw3VgHFtXh+TLptQQ9LZ+BORwe8waEZcq7DG6RN32f0P?=
 =?us-ascii?Q?xGUGbkhqbLFFtxnoGcJs1gASHgxirCcZuyNTV9yoX1EysH7EYo3YSWqZqA6T?=
 =?us-ascii?Q?oSdutUyn8O47FTeijcqGHafl5IPZ+GMVzLy6cDO6FV2CT4a5cIGc3keMHKDd?=
 =?us-ascii?Q?En0/DMWHjOttWOYaCXAFoSNHftwclhyp2rZp0DQKGyZhn7Z2zbbE7EdqNitC?=
 =?us-ascii?Q?0t4GgH5UvdUUxfHdFxG3oqxGyGbzA670rj7vZousY8+XJRUcwWGWzqZEahtx?=
 =?us-ascii?Q?pF+ixHwEoGQeYlNK4PiDxlT7mqtZCR5ItVInhfsJqMmpo0UgRTIX54ntbixN?=
 =?us-ascii?Q?gS0ejgkOakH1eMncf1c5uRkI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e19303-4867-486b-fb11-08d941358045
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 10:53:49.1577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0dAL02dVW6g1ha0pWhOF9foQ8MsAD95R+5E/nYMvAZOuW9RrhQdAI3iWhDXeLiL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2238
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

replace general "else" with specific checks for each possible accelerator.

Handle qtest as a NOP, and error out for an unknown accelerator used in
combination with tod.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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
2.32.0


