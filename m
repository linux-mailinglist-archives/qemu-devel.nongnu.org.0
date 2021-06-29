Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0812D3B7454
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:28:50 +0200 (CEST)
Received: from localhost ([::1]:50306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEjH-0007PY-I1
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEat-0000JB-Kp
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:20:07 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:60793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEar-0003gD-Gg
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624976403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ffHu05ns0a4PVzRntMRhGeR7DMvg0pTAyQfKBKaZz4=;
 b=QzV9LrXLhA0zN1ZgAHxk9qxAhQ5sBCfI7PHCY/2EodX2A8hui/HUf9EE+KgCzxmpzK9e56
 hvp5bsizjCYYMz7g2LX0Bam23yg2Yl9902pS2jsn8pO3ksUv0AihAPHLrAE/BGWL7Lo1oy
 T1y36tnE7J27ZXxqSTaUac+FLZB5RyA=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-odSOvGG-MdKZRHTJ7vcmXQ-1; Tue, 29 Jun 2021 16:20:02 +0200
X-MC-Unique: odSOvGG-MdKZRHTJ7vcmXQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddXYNudVK3Ef5HBBKXYY1OWetLAzUF6F1UoBP+A3t9Fil9OaMFBrWL7XcaiOi/y9tlbOU73ZszDs/XaTu25MWKuo2DVoTFX3IdP8Gc++ttypuV4SNY8Qpa0OmYhI3j6c3F+c1EDRkkRm8VbOH9cN9dPIh+3XMBlT3wGAMNhbgHDnSfKIdi5DN6eNTu2t/8Cg06XDEdfVBMmfwy+rV1Opa81ifciifz6580rmF/Exz793dT+WgCbVMU6LHIwvOO3TrHd/5H+SSA+VS0U0lBEED+F4aW94aQ93F8F+hJ9NiCg4RXz38cYzNU4hIjRJf1rQek28rfk0bYJVI7xRVqhGfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cr9a3tWzY9nE2P88NC50Jvm5gSYST+el4uIWz6Llkeo=;
 b=Vvl5GOL/+UaGSjTAPNXVtdKGJJkWoSvT+L8IKjssOfJq/dkSSogw+ZTBGp50RyA0MwfTGF/CME7skhPoVFTZqNdks+LT7DnfZdC1Z1YTeuizJo58WQ3Llk+Yh0cKaQt1JrjWtQ3BWdFNKb1unLjjEiOLF9zHcJ9d/r81OHmmjnHPN9PW2XfkSh94WwbsIuq9LwYY9DMPoUpUq2sx1m72+tUg8zqSzhe0tdeGTvecXOsxo6niZ2g8OEuj1w0dV+zx+TB9XbOrSwEvVaIqZiXZu8gSBZy6BOOJHHyc9y4lnQT1IEWeg3avrfklMuVb1Y2zno3uhb8GQNN6GcF2K7JsSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VE1PR04MB6445.eurprd04.prod.outlook.com
 (2603:10a6:803:11c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Tue, 29 Jun
 2021 14:20:01 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 14:20:01 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [RFC v6 04/13] hw/s390x: tod: make explicit checks for accelerators
 when initializing
Date: Tue, 29 Jun 2021 22:19:22 +0800
Message-ID: <20210629141931.4489-5-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629141931.4489-1-acho@suse.com>
References: <20210629141931.4489-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.28.175]
X-ClientProxiedBy: HKAPR03CA0036.apcprd03.prod.outlook.com
 (2603:1096:203:c9::23) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.28.175) by
 HKAPR03CA0036.apcprd03.prod.outlook.com (2603:1096:203:c9::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.8 via Frontend Transport; Tue, 29 Jun 2021 14:20:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37228138-6957-4d94-aa04-08d93b08fb31
X-MS-TrafficTypeDiagnostic: VE1PR04MB6445:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB64454F0987F7C867579259B0A0029@VE1PR04MB6445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cAobbe89FKP4Q9yEuRJGOrJfxVSRddGtE1mu1fxM9tXzGHSBMn1j2z0iqpddarqi6N4tkj9sY4nzcpecFv2W3n7guKPIlWeS5DT4V2cQ/j4b3BF0/xrydNtExURN/JvTXvZe9G70zCYO+qSn0owfonGX7gMjKV7HBkAoct/oh+OhayMZdSkO/QxTwT6PHf1yZjDjeo4Vpwo93j0s1MM7PlmvQ/PA7vmTaB9Z3K0Y80bLbHR0a7d5UOFyEeL4qTwfQejlspi/LctH4RsNjbgUTUTYe1Z/u2b/UdLjhQ8ZuaIBhdxJUKW26KHR5HxxIrBAIzhvNn2l43XhJqClRRPooaVj0I0dcm9LyJp9nnwDhMOgFccJNE9XDyAFevJBqUSjtx4frUR4S+zql+ixRJVa9Qm1bNqoukKOx/o7l+mS68fzBaQ0a7LMWMpA7xZWeeBwLnKpesLG2hBQbZXtKzsPPREKgkO5FqW/VtZSX34CxH7mIQxUqLgXf8JdP2PGeS3BrmZXOYAcKAHKV0zdtahZBn+mXEtwZo2NuFDkQHrQ6xASothFMDq6fk7givsM1cucyad5TGeL/V9o7UyHX7E5VXFHJ2zjG0KnGATC6QmN6Fvs9Buc85X2HUsR1apPjuzbyiFV/HiYLDQXRKWqZ189Wp+PigCBe7Ge4UHMARCF9pM0d+SVRPBiEkUu5X74WeGSLLRtYyAGh4qQ4iqShtiXJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(136003)(396003)(376002)(39850400004)(38100700002)(6496006)(86362001)(186003)(4326008)(2616005)(6666004)(956004)(16526019)(8936002)(54906003)(8676002)(66946007)(26005)(36756003)(6486002)(1076003)(66556008)(66476007)(5660300002)(83380400001)(2906002)(316002)(478600001)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7E0ba0/UsBfyGMfgLAuZStyEa7nFS8gTwrp6rrhJ8/0OoaU5Vkeoudu9iy3V?=
 =?us-ascii?Q?QzhZMwHLsPmELl7700XKAYnkwfRsB9DDvQmBZtuqjf2LbXsbHzO65KNxEz7c?=
 =?us-ascii?Q?VOur0UzUQcPT4eTC7R4w04RcIx0qt1TGXihOTEqHUCoAX0eMrK0qY1lbxUJo?=
 =?us-ascii?Q?DhGx+RygNds2ZYEO0pxfozj82Ge6pjm4eHqTo2hd7MD+jnFsGpZDJYvXfP11?=
 =?us-ascii?Q?zAcUBq+Q/EbQLHSjmbKDpOedJgtAYdbQBi8A7ODSbMjzu8qk3omrU6iSdzcA?=
 =?us-ascii?Q?DQtWGpJHIfebQ9o9v/gjIc/fUzcq/DX9nKBLWdAr4y8d4HzB3IEZVSOtwHeK?=
 =?us-ascii?Q?LSQI31fgQpRjTxGn968r7NxHJneiDFHFn6rRICHucCUtPbEBHELJJQfAHhV0?=
 =?us-ascii?Q?bYrpU7iCBWYuizxe3AYklV2TOTDLJ74BCuiItIDC4rNihms8qx+zNClDPZZP?=
 =?us-ascii?Q?1mn320R2whqa7JokKm5ogP5qhTySQhRDdkm6IE3CqKGKE8Rr9uWT0phMf+pp?=
 =?us-ascii?Q?vi0m98PlPHJ91Dmmpo8wg/n6dWQx68rtSwZSWnCepxhVj9aWlmHTZ5+jlr1h?=
 =?us-ascii?Q?EbaDdnadg3u3gBEEykzaUbcQPhnLa7ZMBk8+vsL5HBGD1Cp4I5TcrFhcnNH7?=
 =?us-ascii?Q?khcbm60kfU3tMMGUj0q1ZdWro6MPjTmBOPh0L4+H14wlUtNq06HMnKLnciKd?=
 =?us-ascii?Q?JkNiskFh82PvlR+/AG8NQjPF2I2XcHFuJVVNZrm0pbJPlA2D3ZHvPxMPiVXU?=
 =?us-ascii?Q?7IN2Pk2keYWJ6f9qPMOL3yLLkwg2szSlo2HG5hrehJJMRtceWNDQXN7Pj67G?=
 =?us-ascii?Q?FdUwBUSvpptRrEamDzh2Rm1ipiuEBnTuwwOIqMl7VYUGIosYYXU6J3GSDel7?=
 =?us-ascii?Q?4dvf+JmjruIEQrJlXS9K/rYIHoLdsIVfjYSqqAubWiuH9V0pLLyCFxlXkQvU?=
 =?us-ascii?Q?6VLVrcU0H8RV+22PLifAC/WQmn4qQMH9UrN3f6z19wq+la1gdSWlOFIzVxUF?=
 =?us-ascii?Q?lixifFC4jO5GQe+tq8MmRsE23j/gQdhQHlYrp+PInHgjSjYmCYFCyNqGMP2e?=
 =?us-ascii?Q?s7xJrtxU8+gp4FSLhox02fABcDaF2I1I4AUI8HmoHN+Zasg3+UEiKyB2UWZ6?=
 =?us-ascii?Q?LiH5D1SegFpKFY7czCz8m0uFM9DHiMNA1XmKZQUvDbO6kv1P5VFyLuYZLYkV?=
 =?us-ascii?Q?7n23GRHjn0AczYrv2WDO3inGtPeOUFWb8qcsJrjp+fSSZ0q152cOo1MS5QbA?=
 =?us-ascii?Q?ckruLjSa/B3UFUXRJwxKGu30I4stRmaxW9XNoU22lOWfOsa8OEj4LCfsbh4o?=
 =?us-ascii?Q?kLGB4Lecc+pxa23Cy7CMLNoM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37228138-6957-4d94-aa04-08d93b08fb31
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 14:20:01.0898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/F8x0g8AOfeV22b3nik7syvhoNVAVFYp18iIVx4t/pQSn9SVPWFjnfaTELC3vnd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6445
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
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
2.32.0


