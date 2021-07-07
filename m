Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981B53BE6D4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 13:03:26 +0200 (CEST)
Received: from localhost ([::1]:42230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15Kv-0006m8-KK
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 07:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15D0-0005f6-9C
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:55:17 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:46188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15Cw-00027Z-FU
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625655299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RlYLHVIn7k8D3uwqV8ThdngdgojUCi8CvGltGa2Bh1g=;
 b=Usr1KSyatpFfrI/1gsyQcRzJpH8pK3O40gMMp2bPjxmPk8u+ZTi9yUkBRCkkyJ9pazb618
 epd+ssNIXV16rXzSwa2uZU6EpxnL0pc9Sm5pFBWnshuLvGNxz2ba3N91aXlZhRWd0KhIVi
 +8EkOFbsYrrEoNkkpSDZh71SF46Sw9w=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-fwfdgbOePdK0-Y0jWKWLhQ-1; Wed, 07 Jul 2021 12:54:58 +0200
X-MC-Unique: fwfdgbOePdK0-Y0jWKWLhQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c90vO0b+cS91eMmluw59WL1RtlwkHtXGFvL3S7fuLwXB8l1QDte3piyE2nZ7k2dkUi+M9DpheqRiJv+WH8k9raTuUT8HBn7iQcNs3G4aJIdaCsUJs4tEjch2C+u2U8uxR4oKRXTYLVku5f2vhAbzPKQQfw1TEgSxZxbQDR9ZqEqAsyjLS+2FqHpFTPhvUK223xtlHIF90xHc8JzbyZWZXv9oyTLREunby+1yGr9msWyZW5gN57TyU6jqd1EpBOIwI4MO8/7lWj3otySQuCyFeZb8srZDLAbIouIAZLpSBo3J95J6snVx1sK4kd529C414JxXmK1dR1mtEoqvpoTlIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MR8kY0wnnUv9cuJCLg5JE02lvp+hFs1uRDHPlNuvn3s=;
 b=cl8Vsm8WmYO5e9qqitoT4AmLdBUB+wm+XAeaHJOfKe7cljbJr08N+HyHXTP120tSBt+4YOFqZi5Op/b+JxFSn0hPvKnCiBDK7H8EnhWcaWPyOfo/rnJgo+hTiaMMcNFZBNxcYQihws3Gv96b409WP5AL6huTYLhy7oBGqZH31BLMsiElll4CORqmJS20fREqwowsAnWJ9Sae+gjoRSv+JSdmKZ2mJbFx46QyD92W6SkuMDUbDFmZcK0DzSVNBK1efFCxop/MhhNy6JU0gcOSVNs+xNxuC8nTdLyomNcBChWEmBaB5ppe6A0tVu/F4x5BjvEgX2C2bmiGPRKbIj11AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB7007.eurprd04.prod.outlook.com
 (2603:10a6:803:13e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 7 Jul
 2021 10:54:56 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 10:54:56 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v7 14/14] target/s390x: split sysemu part of cpu models
Date: Wed,  7 Jul 2021 18:53:24 +0800
Message-ID: <20210707105324.23400-15-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707105324.23400-1-acho@suse.com>
References: <20210707105324.23400-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HK2P15301CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::18) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.20.159) by
 HK2P15301CA0008.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.2 via Frontend Transport; Wed, 7 Jul 2021 10:54:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2daaaf0d-c12e-4dce-3f3a-08d94135a852
X-MS-TrafficTypeDiagnostic: VI1PR04MB7007:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB70074A105E6E2B930AC2740BA01A9@VI1PR04MB7007.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AKrwttPKoXI+v2ND64yh4pq6N9j9PZ5WICxHyBKKZ3iSHdD/Fya6he3ju+gXjPVoXkwgkzYfr0dtbfZi5lplUaZcfe8iiwBg/gtC47BQHTfWhOgyNycRg9bFsJuhEjg2mdNrfJscsWTvqzwdkK1QCKBF+jPg5TLKIYxw7lF/a2GRmx88SlOzYQcp3AjVboukQSZrM9nQiYJGLZjwOUFtqNWqXEq0N1jznzNvaHj9VPHIem++0O5zcCez9LBF6QjlMWojc6kbGTILtwlYW2zZZfzKN+STSn4qNrLFammuBNc32p+a5yY40f8Z3U/oZGdaJSEeFQX0U6JXVQQg3VAbNHYuL0NUoE4wfz0numLERx8uDJQ8lGOYi7Ya0NSp3PHeMIC1ejgePP/9QY+IOFa1Zuv3k8FcLHJypaPzvJWLlPKZsQhQOAiyTcrf7/3DWtxZLHZvsnWIjwFB4qptQsdeuIu0Iin2iLyNo9Sb/tcPPD5McSijUAhnNOUCLLVxp4bFgpGbEGpsaXCnyk1mwWDp1pctdlZqO0nTJMD6xG3DZrRk4OQyhATn+PN0rXc6OLIE4JlQRaJZa1+EejDGfSqr3N5cEAQ57fQ/oulCgaWltMm0+NS0QeLChAWn62ETB1VtZwgmWznTq6h5UYzSwERfC8Rk9nHo/KUlxsjkQXQwf89T5DKMOFRvv48cqCqyyb3mQPufqD0m7WyvE/IpuSmMaNshgKVwYJhUsTNxKh6a4FU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39850400004)(396003)(136003)(366004)(30864003)(5660300002)(478600001)(2906002)(1076003)(36756003)(4326008)(316002)(86362001)(26005)(66946007)(6486002)(83380400001)(6666004)(38100700002)(2616005)(186003)(66556008)(956004)(8676002)(54906003)(8936002)(66476007)(6496006)(170073001)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qkMy1F6WXy4Jt+fYdRViy+22hUkVWTGqPjTjvi0UNjwS3CuNx8imZiKDQdBv?=
 =?us-ascii?Q?0nKL2LKqsXPUazkIsWzLYT7pOSYr/auK6ll7AG8r4t7fs6ekon8HK6zPkEbD?=
 =?us-ascii?Q?6Ph4D6MrumgXa0pUamk1s6G+N2UuOLU+YV95WPuShA6MDaC6gBvBxKMye1NG?=
 =?us-ascii?Q?aNU5fBEzGMgOygw8HFRDenq2VMWoO2GXnGOlkAiuqalSOoANhhWIGvhg7jr+?=
 =?us-ascii?Q?rPPHJ/7aRZsrW9zXHj7eDoPtdlaRIE7YJCkACXsJW1o3DE5Zx9dtrsbGAEBW?=
 =?us-ascii?Q?P+3lDPGSblPcZ7NkMCz+dOLdY4Ht5EzcEQzLoyuifJydD4p4O3qsQBTE7cjC?=
 =?us-ascii?Q?NJp3ScY1+QbpN+fh/9ZivIihpiLqCSuS+tzQiw9c2M0dxLgt2hBjcjWuHlI+?=
 =?us-ascii?Q?Zaqo6DOAfUtkuTQAugJiFLvZhDJCTe9UtcW/YbtWS/VDczJzxIUgpqVaHwi1?=
 =?us-ascii?Q?kO9A6rdvvbTjQLF9BUwqx65dBGoTrbSanaAsoRGO4sq5YnRiXTSgiYfiaqcN?=
 =?us-ascii?Q?VqmjdSR6UDYOagiWjWEQ2i98K9wPqQFc7v1XgXOWbqrKN0Y3NG5KGd8k1b3S?=
 =?us-ascii?Q?F54LrP6Zb6ju1jORn7NMSrUf/cla6LV3lvMNjmoELqtjmIFeLn6eNYhjuT2g?=
 =?us-ascii?Q?itZKdovTFhL3QILkRtsxQl4d/Xl8p0Kvc/c5HGbvFPh1qKO8f3Y99zGJjKMu?=
 =?us-ascii?Q?epUiWmEkXxBND4cTnQsa3nMevZj5TODhAztH8pCdgAq9aX3IY6wOMgaIp8Hp?=
 =?us-ascii?Q?NQvYaXlEx6F+z7JcPXEKSi/rwFF5revJrkQ7p1G4OPFfpB+XJrE4z5zYIlla?=
 =?us-ascii?Q?RPGNV94SsvvfjpBfzFuan/TYq7kohIOqHwz3ATdl8IW12dSQsJkupR7qb3oO?=
 =?us-ascii?Q?1MHRxKz37aqdrDTY6iP0DVGFZ6Z7Lz4wjqkpJNZa4Xczfe9Z7cV4vcQae9u6?=
 =?us-ascii?Q?AOyoHFPmvw4BBlXsjgTiD5+F+prQLaC1EHMyMoISzEJh3PF3dfrR/fUUyjQE?=
 =?us-ascii?Q?70GQzXvW8EiguwpIsjlBmwa3taDhiVI3fOxByxKjXTMTAKAwiK/bTbfuphfa?=
 =?us-ascii?Q?ko7mCm//g+0LT0qf6zoLqR9NSsEBtOWRZOy7UADgCr9al4jTWz3Ly5F7GpQj?=
 =?us-ascii?Q?skYvXNZXrLlYbrpGQiBcnXeRUrvXLhf98oEn0Vf/oDhGpOk9RQEyWYC/cYxn?=
 =?us-ascii?Q?lrbvijFQMf0zXaZMF/xONNQsfasXNmQOesa7O7Q5pB9r6yr3TKAX0xtU/sFp?=
 =?us-ascii?Q?whNOLKCTfvP6r/vRKz/We5wr2k3co0x1jK1s/ai4HNT4mVSB/LoUqsh7fnc/?=
 =?us-ascii?Q?I2N+BbJCFFmJCsH1OTJgVSip?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2daaaf0d-c12e-4dce-3f3a-08d94135a852
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 10:54:56.5358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rhUAi5DOPIhrp6MkXC3OHYDmlnQ87LWVD/LQk37t+u19zTjJIwAcSejaIw+7SS4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7007
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

split sysemu part of cpu models,
also create a tiny _user.c with just the (at least for now),
empty implementation of apply_cpu_model.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                      |   1 +
 target/s390x/cpu_models.c        | 417 +-----------------------------
 target/s390x/cpu_models_sysemu.c | 426 +++++++++++++++++++++++++++++++
 target/s390x/cpu_models_user.c   |  20 ++
 target/s390x/meson.build         |   4 +
 target/s390x/s390x-internal.h    |   2 +
 6 files changed, 454 insertions(+), 416 deletions(-)
 create mode 100644 target/s390x/cpu_models_sysemu.c
 create mode 100644 target/s390x/cpu_models_user.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 11d9ce72aa..af1edb3e6e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -298,6 +298,7 @@ M: David Hildenbrand <david@redhat.com>
 S: Maintained
 F: target/s390x/
 F: target/s390x/tcg
+F: target/s390x/cpu_models_*.[ch]
 F: hw/s390x/
 F: disas/s390.c
 F: tests/tcg/s390x/
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index ba8f6a55ac..ef82e833b5 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -18,18 +18,11 @@
 #include "sysemu/tcg.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
-#include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/qemu-print.h"
-#include "qapi/qmp/qerror.h"
-#include "qapi/qobject-input-visitor.h"
-#include "qapi/qmp/qdict.h"
 #ifndef CONFIG_USER_ONLY
-#include "sysemu/arch_init.h"
 #include "sysemu/sysemu.h"
-#include "hw/pci/pci.h"
 #endif
-#include "qapi/qapi-commands-machine-target.h"
 #include "hw/s390x/pv.h"
=20
 #define CPUDEF_INIT(_type, _gen, _ec_ga, _mha_pow, _hmfai, _name, _desc) \
@@ -414,381 +407,6 @@ void s390_cpu_list(void)
     }
 }
=20
-static S390CPUModel *get_max_cpu_model(Error **errp);
-
-#ifndef CONFIG_USER_ONLY
-static void list_add_feat(const char *name, void *opaque);
-
-static void check_unavailable_features(const S390CPUModel *max_model,
-                                       const S390CPUModel *model,
-                                       strList **unavailable)
-{
-    S390FeatBitmap missing;
-
-    /* check general model compatibility */
-    if (max_model->def->gen < model->def->gen ||
-        (max_model->def->gen =3D=3D model->def->gen &&
-         max_model->def->ec_ga < model->def->ec_ga)) {
-        list_add_feat("type", unavailable);
-    }
-
-    /* detect missing features if any to properly report them */
-    bitmap_andnot(missing, model->features, max_model->features,
-                  S390_FEAT_MAX);
-    if (!bitmap_empty(missing, S390_FEAT_MAX)) {
-        s390_feat_bitmap_to_ascii(missing, unavailable, list_add_feat);
-    }
-}
-
-struct CpuDefinitionInfoListData {
-    CpuDefinitionInfoList *list;
-    S390CPUModel *model;
-};
-
-static void create_cpu_model_list(ObjectClass *klass, void *opaque)
-{
-    struct CpuDefinitionInfoListData *cpu_list_data =3D opaque;
-    CpuDefinitionInfoList **cpu_list =3D &cpu_list_data->list;
-    CpuDefinitionInfo *info;
-    char *name =3D g_strdup(object_class_get_name(klass));
-    S390CPUClass *scc =3D S390_CPU_CLASS(klass);
-
-    /* strip off the -s390x-cpu */
-    g_strrstr(name, "-" TYPE_S390_CPU)[0] =3D 0;
-    info =3D g_new0(CpuDefinitionInfo, 1);
-    info->name =3D name;
-    info->has_migration_safe =3D true;
-    info->migration_safe =3D scc->is_migration_safe;
-    info->q_static =3D scc->is_static;
-    info->q_typename =3D g_strdup(object_class_get_name(klass));
-    /* check for unavailable features */
-    if (cpu_list_data->model) {
-        Object *obj;
-        S390CPU *sc;
-        obj =3D object_new_with_class(klass);
-        sc =3D S390_CPU(obj);
-        if (sc->model) {
-            info->has_unavailable_features =3D true;
-            check_unavailable_features(cpu_list_data->model, sc->model,
-                                       &info->unavailable_features);
-        }
-        object_unref(obj);
-    }
-
-    QAPI_LIST_PREPEND(*cpu_list, info);
-}
-
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
-{
-    struct CpuDefinitionInfoListData list_data =3D {
-        .list =3D NULL,
-    };
-
-    list_data.model =3D get_max_cpu_model(NULL);
-
-    object_class_foreach(create_cpu_model_list, TYPE_S390_CPU, false,
-                         &list_data);
-
-    return list_data.list;
-}
-
-static void cpu_model_from_info(S390CPUModel *model, const CpuModelInfo *i=
nfo,
-                                Error **errp)
-{
-    Error *err =3D NULL;
-    const QDict *qdict =3D NULL;
-    const QDictEntry *e;
-    Visitor *visitor;
-    ObjectClass *oc;
-    S390CPU *cpu;
-    Object *obj;
-
-    if (info->props) {
-        qdict =3D qobject_to(QDict, info->props);
-        if (!qdict) {
-            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict")=
;
-            return;
-        }
-    }
-
-    oc =3D cpu_class_by_name(TYPE_S390_CPU, info->name);
-    if (!oc) {
-        error_setg(errp, "The CPU definition \'%s\' is unknown.", info->na=
me);
-        return;
-    }
-    if (S390_CPU_CLASS(oc)->kvm_required && !kvm_enabled()) {
-        error_setg(errp, "The CPU definition '%s' requires KVM", info->nam=
e);
-        return;
-    }
-    obj =3D object_new_with_class(oc);
-    cpu =3D S390_CPU(obj);
-
-    if (!cpu->model) {
-        error_setg(errp, "Details about the host CPU model are not availab=
le, "
-                         "it cannot be used.");
-        object_unref(obj);
-        return;
-    }
-
-    if (qdict) {
-        visitor =3D qobject_input_visitor_new(info->props);
-        if (!visit_start_struct(visitor, NULL, NULL, 0, errp)) {
-            visit_free(visitor);
-            object_unref(obj);
-            return;
-        }
-        for (e =3D qdict_first(qdict); e; e =3D qdict_next(qdict, e)) {
-            if (!object_property_set(obj, e->key, visitor, &err)) {
-                break;
-            }
-        }
-        if (!err) {
-            visit_check_struct(visitor, &err);
-        }
-        visit_end_struct(visitor, NULL);
-        visit_free(visitor);
-        if (err) {
-            error_propagate(errp, err);
-            object_unref(obj);
-            return;
-        }
-    }
-
-    /* copy the model and throw the cpu away */
-    memcpy(model, cpu->model, sizeof(*model));
-    object_unref(obj);
-}
-
-static void qdict_add_disabled_feat(const char *name, void *opaque)
-{
-    qdict_put_bool(opaque, name, false);
-}
-
-static void qdict_add_enabled_feat(const char *name, void *opaque)
-{
-    qdict_put_bool(opaque, name, true);
-}
-
-/* convert S390CPUDef into a static CpuModelInfo */
-static void cpu_info_from_model(CpuModelInfo *info, const S390CPUModel *mo=
del,
-                                bool delta_changes)
-{
-    QDict *qdict =3D qdict_new();
-    S390FeatBitmap bitmap;
-
-    /* always fallback to the static base model */
-    info->name =3D g_strdup_printf("%s-base", model->def->name);
-
-    if (delta_changes) {
-        /* features deleted from the base feature set */
-        bitmap_andnot(bitmap, model->def->base_feat, model->features,
-                      S390_FEAT_MAX);
-        if (!bitmap_empty(bitmap, S390_FEAT_MAX)) {
-            s390_feat_bitmap_to_ascii(bitmap, qdict, qdict_add_disabled_fe=
at);
-        }
-
-        /* features added to the base feature set */
-        bitmap_andnot(bitmap, model->features, model->def->base_feat,
-                      S390_FEAT_MAX);
-        if (!bitmap_empty(bitmap, S390_FEAT_MAX)) {
-            s390_feat_bitmap_to_ascii(bitmap, qdict, qdict_add_enabled_fea=
t);
-        }
-    } else {
-        /* expand all features */
-        s390_feat_bitmap_to_ascii(model->features, qdict,
-                                  qdict_add_enabled_feat);
-        bitmap_complement(bitmap, model->features, S390_FEAT_MAX);
-        s390_feat_bitmap_to_ascii(bitmap, qdict, qdict_add_disabled_feat);
-    }
-
-    if (!qdict_size(qdict)) {
-        qobject_unref(qdict);
-    } else {
-        info->props =3D QOBJECT(qdict);
-        info->has_props =3D true;
-    }
-}
-
-CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType=
 type,
-                                                      CpuModelInfo *model,
-                                                      Error **errp)
-{
-    Error *err =3D NULL;
-    CpuModelExpansionInfo *expansion_info =3D NULL;
-    S390CPUModel s390_model;
-    bool delta_changes =3D false;
-
-    /* convert it to our internal representation */
-    cpu_model_from_info(&s390_model, model, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return NULL;
-    }
-
-    if (type =3D=3D CPU_MODEL_EXPANSION_TYPE_STATIC) {
-        delta_changes =3D true;
-    } else if (type !=3D CPU_MODEL_EXPANSION_TYPE_FULL) {
-        error_setg(errp, "The requested expansion type is not supported.")=
;
-        return NULL;
-    }
-
-    /* convert it back to a static representation */
-    expansion_info =3D g_new0(CpuModelExpansionInfo, 1);
-    expansion_info->model =3D g_malloc0(sizeof(*expansion_info->model));
-    cpu_info_from_model(expansion_info->model, &s390_model, delta_changes)=
;
-    return expansion_info;
-}
-
-static void list_add_feat(const char *name, void *opaque)
-{
-    strList **last =3D (strList **) opaque;
-
-    QAPI_LIST_PREPEND(*last, g_strdup(name));
-}
-
-CpuModelCompareInfo *qmp_query_cpu_model_comparison(CpuModelInfo *infoa,
-                                                     CpuModelInfo *infob,
-                                                     Error **errp)
-{
-    Error *err =3D NULL;
-    CpuModelCompareResult feat_result, gen_result;
-    CpuModelCompareInfo *compare_info;
-    S390FeatBitmap missing, added;
-    S390CPUModel modela, modelb;
-
-    /* convert both models to our internal representation */
-    cpu_model_from_info(&modela, infoa, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return NULL;
-    }
-    cpu_model_from_info(&modelb, infob, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return NULL;
-    }
-    compare_info =3D g_new0(CpuModelCompareInfo, 1);
-
-    /* check the cpu generation and ga level */
-    if (modela.def->gen =3D=3D modelb.def->gen) {
-        if (modela.def->ec_ga =3D=3D modelb.def->ec_ga) {
-            /* ec and corresponding bc are identical */
-            gen_result =3D CPU_MODEL_COMPARE_RESULT_IDENTICAL;
-        } else if (modela.def->ec_ga < modelb.def->ec_ga) {
-            gen_result =3D CPU_MODEL_COMPARE_RESULT_SUBSET;
-        } else {
-            gen_result =3D CPU_MODEL_COMPARE_RESULT_SUPERSET;
-        }
-    } else if (modela.def->gen < modelb.def->gen) {
-        gen_result =3D CPU_MODEL_COMPARE_RESULT_SUBSET;
-    } else {
-        gen_result =3D CPU_MODEL_COMPARE_RESULT_SUPERSET;
-    }
-    if (gen_result !=3D CPU_MODEL_COMPARE_RESULT_IDENTICAL) {
-        /* both models cannot be made identical */
-        list_add_feat("type", &compare_info->responsible_properties);
-    }
-
-    /* check the feature set */
-    if (bitmap_equal(modela.features, modelb.features, S390_FEAT_MAX)) {
-        feat_result =3D CPU_MODEL_COMPARE_RESULT_IDENTICAL;
-    } else {
-        bitmap_andnot(missing, modela.features, modelb.features, S390_FEAT=
_MAX);
-        s390_feat_bitmap_to_ascii(missing,
-                                  &compare_info->responsible_properties,
-                                  list_add_feat);
-        bitmap_andnot(added, modelb.features, modela.features, S390_FEAT_M=
AX);
-        s390_feat_bitmap_to_ascii(added, &compare_info->responsible_proper=
ties,
-                                  list_add_feat);
-        if (bitmap_empty(missing, S390_FEAT_MAX)) {
-            feat_result =3D CPU_MODEL_COMPARE_RESULT_SUBSET;
-        } else if (bitmap_empty(added, S390_FEAT_MAX)) {
-            feat_result =3D CPU_MODEL_COMPARE_RESULT_SUPERSET;
-        } else {
-            feat_result =3D CPU_MODEL_COMPARE_RESULT_INCOMPATIBLE;
-        }
-    }
-
-    /* combine the results */
-    if (gen_result =3D=3D feat_result) {
-        compare_info->result =3D gen_result;
-    } else if (feat_result =3D=3D CPU_MODEL_COMPARE_RESULT_IDENTICAL) {
-        compare_info->result =3D gen_result;
-    } else if (gen_result =3D=3D CPU_MODEL_COMPARE_RESULT_IDENTICAL) {
-        compare_info->result =3D feat_result;
-    } else {
-        compare_info->result =3D CPU_MODEL_COMPARE_RESULT_INCOMPATIBLE;
-    }
-    return compare_info;
-}
-
-CpuModelBaselineInfo *qmp_query_cpu_model_baseline(CpuModelInfo *infoa,
-                                                    CpuModelInfo *infob,
-                                                    Error **errp)
-{
-    Error *err =3D NULL;
-    CpuModelBaselineInfo *baseline_info;
-    S390CPUModel modela, modelb, model;
-    uint16_t cpu_type;
-    uint8_t max_gen_ga;
-    uint8_t max_gen;
-
-    /* convert both models to our internal representation */
-    cpu_model_from_info(&modela, infoa, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return NULL;
-    }
-
-    cpu_model_from_info(&modelb, infob, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return NULL;
-    }
-
-    /* features both models support */
-    bitmap_and(model.features, modela.features, modelb.features, S390_FEAT=
_MAX);
-
-    /* detect the maximum model not regarding features */
-    if (modela.def->gen =3D=3D modelb.def->gen) {
-        if (modela.def->type =3D=3D modelb.def->type) {
-            cpu_type =3D modela.def->type;
-        } else {
-            cpu_type =3D 0;
-        }
-        max_gen =3D modela.def->gen;
-        max_gen_ga =3D MIN(modela.def->ec_ga, modelb.def->ec_ga);
-    } else if (modela.def->gen > modelb.def->gen) {
-        cpu_type =3D modelb.def->type;
-        max_gen =3D modelb.def->gen;
-        max_gen_ga =3D modelb.def->ec_ga;
-    } else {
-        cpu_type =3D modela.def->type;
-        max_gen =3D modela.def->gen;
-        max_gen_ga =3D modela.def->ec_ga;
-    }
-
-    model.def =3D s390_find_cpu_def(cpu_type, max_gen, max_gen_ga,
-                                  model.features);
-
-    /* models without early base features (esan3) are bad */
-    if (!model.def) {
-        error_setg(errp, "No compatible CPU model could be created as"
-                   " important base features are disabled");
-        return NULL;
-    }
-
-    /* strip off features not part of the max model */
-    bitmap_and(model.features, model.features, model.def->full_feat,
-               S390_FEAT_MAX);
-
-    baseline_info =3D g_new0(CpuModelBaselineInfo, 1);
-    baseline_info->model =3D g_malloc0(sizeof(*baseline_info->model));
-    cpu_info_from_model(baseline_info->model, &model, true);
-    return baseline_info;
-}
-#endif
-
 static void check_consistency(const S390CPUModel *model)
 {
     static int dep[][2] =3D {
@@ -900,7 +518,7 @@ static void check_compatibility(const S390CPUModel *max=
_model,
                   "available in the configuration: ");
 }
=20
-static S390CPUModel *get_max_cpu_model(Error **errp)
+S390CPUModel *get_max_cpu_model(Error **errp)
 {
     Error *err =3D NULL;
     static S390CPUModel max_model;
@@ -925,39 +543,6 @@ static S390CPUModel *get_max_cpu_model(Error **errp)
     return &max_model;
 }
=20
-static inline void apply_cpu_model(const S390CPUModel *model, Error **errp=
)
-{
-#ifndef CONFIG_USER_ONLY
-    Error *err =3D NULL;
-    static S390CPUModel applied_model;
-    static bool applied;
-
-    /*
-     * We have the same model for all VCPUs. KVM can only be configured be=
fore
-     * any VCPUs are defined in KVM.
-     */
-    if (applied) {
-        if (model && memcmp(&applied_model, model, sizeof(S390CPUModel))) =
{
-            error_setg(errp, "Mixed CPU models are not supported on s390x.=
");
-        }
-        return;
-    }
-
-    if (kvm_enabled()) {
-        kvm_s390_apply_cpu_model(model, &err);
-        if (err) {
-            error_propagate(errp, err);
-            return;
-        }
-    }
-
-    applied =3D true;
-    if (model) {
-        applied_model =3D *model;
-    }
-#endif
-}
-
 void s390_realize_cpu_model(CPUState *cs, Error **errp)
 {
     Error *err =3D NULL;
diff --git a/target/s390x/cpu_models_sysemu.c b/target/s390x/cpu_models_sys=
emu.c
new file mode 100644
index 0000000000..05c3ccaaff
--- /dev/null
+++ b/target/s390x/cpu_models_sysemu.c
@@ -0,0 +1,426 @@
+/*
+ * CPU models for s390x - System Emulation-only
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * Author(s): David Hildenbrand <dahi@linux.vnet.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at
+ * your option) any later version. See the COPYING file in the top-level
+ * directory.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "s390x-internal.h"
+#include "kvm/kvm_s390x.h"
+#include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qapi/qmp/qerror.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qapi-commands-machine-target.h"
+
+static void list_add_feat(const char *name, void *opaque);
+
+static void check_unavailable_features(const S390CPUModel *max_model,
+                                       const S390CPUModel *model,
+                                       strList **unavailable)
+{
+    S390FeatBitmap missing;
+
+    /* check general model compatibility */
+    if (max_model->def->gen < model->def->gen ||
+        (max_model->def->gen =3D=3D model->def->gen &&
+         max_model->def->ec_ga < model->def->ec_ga)) {
+        list_add_feat("type", unavailable);
+    }
+
+    /* detect missing features if any to properly report them */
+    bitmap_andnot(missing, model->features, max_model->features,
+                  S390_FEAT_MAX);
+    if (!bitmap_empty(missing, S390_FEAT_MAX)) {
+        s390_feat_bitmap_to_ascii(missing, unavailable, list_add_feat);
+    }
+}
+
+struct CpuDefinitionInfoListData {
+    CpuDefinitionInfoList *list;
+    S390CPUModel *model;
+};
+
+static void create_cpu_model_list(ObjectClass *klass, void *opaque)
+{
+    struct CpuDefinitionInfoListData *cpu_list_data =3D opaque;
+    CpuDefinitionInfoList **cpu_list =3D &cpu_list_data->list;
+    CpuDefinitionInfo *info;
+    char *name =3D g_strdup(object_class_get_name(klass));
+    S390CPUClass *scc =3D S390_CPU_CLASS(klass);
+
+    /* strip off the -s390x-cpu */
+    g_strrstr(name, "-" TYPE_S390_CPU)[0] =3D 0;
+    info =3D g_new0(CpuDefinitionInfo, 1);
+    info->name =3D name;
+    info->has_migration_safe =3D true;
+    info->migration_safe =3D scc->is_migration_safe;
+    info->q_static =3D scc->is_static;
+    info->q_typename =3D g_strdup(object_class_get_name(klass));
+    /* check for unavailable features */
+    if (cpu_list_data->model) {
+        Object *obj;
+        S390CPU *sc;
+        obj =3D object_new_with_class(klass);
+        sc =3D S390_CPU(obj);
+        if (sc->model) {
+            info->has_unavailable_features =3D true;
+            check_unavailable_features(cpu_list_data->model, sc->model,
+                                       &info->unavailable_features);
+        }
+        object_unref(obj);
+    }
+
+    QAPI_LIST_PREPEND(*cpu_list, info);
+}
+
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+{
+    struct CpuDefinitionInfoListData list_data =3D {
+        .list =3D NULL,
+    };
+
+    list_data.model =3D get_max_cpu_model(NULL);
+
+    object_class_foreach(create_cpu_model_list, TYPE_S390_CPU, false,
+                         &list_data);
+
+    return list_data.list;
+}
+
+static void cpu_model_from_info(S390CPUModel *model, const CpuModelInfo *i=
nfo,
+                                Error **errp)
+{
+    Error *err =3D NULL;
+    const QDict *qdict =3D NULL;
+    const QDictEntry *e;
+    Visitor *visitor;
+    ObjectClass *oc;
+    S390CPU *cpu;
+    Object *obj;
+
+    if (info->props) {
+        qdict =3D qobject_to(QDict, info->props);
+        if (!qdict) {
+            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict")=
;
+            return;
+        }
+    }
+
+    oc =3D cpu_class_by_name(TYPE_S390_CPU, info->name);
+    if (!oc) {
+        error_setg(errp, "The CPU definition \'%s\' is unknown.", info->na=
me);
+        return;
+    }
+    if (S390_CPU_CLASS(oc)->kvm_required && !kvm_enabled()) {
+        error_setg(errp, "The CPU definition '%s' requires KVM", info->nam=
e);
+        return;
+    }
+    obj =3D object_new_with_class(oc);
+    cpu =3D S390_CPU(obj);
+
+    if (!cpu->model) {
+        error_setg(errp, "Details about the host CPU model are not availab=
le, "
+                         "it cannot be used.");
+        object_unref(obj);
+        return;
+    }
+
+    if (qdict) {
+        visitor =3D qobject_input_visitor_new(info->props);
+        if (!visit_start_struct(visitor, NULL, NULL, 0, errp)) {
+            visit_free(visitor);
+            object_unref(obj);
+            return;
+        }
+        for (e =3D qdict_first(qdict); e; e =3D qdict_next(qdict, e)) {
+            if (!object_property_set(obj, e->key, visitor, &err)) {
+                break;
+            }
+        }
+        if (!err) {
+            visit_check_struct(visitor, &err);
+        }
+        visit_end_struct(visitor, NULL);
+        visit_free(visitor);
+        if (err) {
+            error_propagate(errp, err);
+            object_unref(obj);
+            return;
+        }
+    }
+
+    /* copy the model and throw the cpu away */
+    memcpy(model, cpu->model, sizeof(*model));
+    object_unref(obj);
+}
+
+static void qdict_add_disabled_feat(const char *name, void *opaque)
+{
+    qdict_put_bool(opaque, name, false);
+}
+
+static void qdict_add_enabled_feat(const char *name, void *opaque)
+{
+    qdict_put_bool(opaque, name, true);
+}
+
+/* convert S390CPUDef into a static CpuModelInfo */
+static void cpu_info_from_model(CpuModelInfo *info, const S390CPUModel *mo=
del,
+                                bool delta_changes)
+{
+    QDict *qdict =3D qdict_new();
+    S390FeatBitmap bitmap;
+
+    /* always fallback to the static base model */
+    info->name =3D g_strdup_printf("%s-base", model->def->name);
+
+    if (delta_changes) {
+        /* features deleted from the base feature set */
+        bitmap_andnot(bitmap, model->def->base_feat, model->features,
+                      S390_FEAT_MAX);
+        if (!bitmap_empty(bitmap, S390_FEAT_MAX)) {
+            s390_feat_bitmap_to_ascii(bitmap, qdict, qdict_add_disabled_fe=
at);
+        }
+
+        /* features added to the base feature set */
+        bitmap_andnot(bitmap, model->features, model->def->base_feat,
+                      S390_FEAT_MAX);
+        if (!bitmap_empty(bitmap, S390_FEAT_MAX)) {
+            s390_feat_bitmap_to_ascii(bitmap, qdict, qdict_add_enabled_fea=
t);
+        }
+    } else {
+        /* expand all features */
+        s390_feat_bitmap_to_ascii(model->features, qdict,
+                                  qdict_add_enabled_feat);
+        bitmap_complement(bitmap, model->features, S390_FEAT_MAX);
+        s390_feat_bitmap_to_ascii(bitmap, qdict, qdict_add_disabled_feat);
+    }
+
+    if (!qdict_size(qdict)) {
+        qobject_unref(qdict);
+    } else {
+        info->props =3D QOBJECT(qdict);
+        info->has_props =3D true;
+    }
+}
+
+CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType=
 type,
+                                                      CpuModelInfo *model,
+                                                      Error **errp)
+{
+    Error *err =3D NULL;
+    CpuModelExpansionInfo *expansion_info =3D NULL;
+    S390CPUModel s390_model;
+    bool delta_changes =3D false;
+
+    /* convert it to our internal representation */
+    cpu_model_from_info(&s390_model, model, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return NULL;
+    }
+
+    if (type =3D=3D CPU_MODEL_EXPANSION_TYPE_STATIC) {
+        delta_changes =3D true;
+    } else if (type !=3D CPU_MODEL_EXPANSION_TYPE_FULL) {
+        error_setg(errp, "The requested expansion type is not supported.")=
;
+        return NULL;
+    }
+
+    /* convert it back to a static representation */
+    expansion_info =3D g_new0(CpuModelExpansionInfo, 1);
+    expansion_info->model =3D g_malloc0(sizeof(*expansion_info->model));
+    cpu_info_from_model(expansion_info->model, &s390_model, delta_changes)=
;
+    return expansion_info;
+}
+
+static void list_add_feat(const char *name, void *opaque)
+{
+    strList **last =3D (strList **) opaque;
+
+    QAPI_LIST_PREPEND(*last, g_strdup(name));
+}
+
+CpuModelCompareInfo *qmp_query_cpu_model_comparison(CpuModelInfo *infoa,
+                                                     CpuModelInfo *infob,
+                                                     Error **errp)
+{
+    Error *err =3D NULL;
+    CpuModelCompareResult feat_result, gen_result;
+    CpuModelCompareInfo *compare_info;
+    S390FeatBitmap missing, added;
+    S390CPUModel modela, modelb;
+
+    /* convert both models to our internal representation */
+    cpu_model_from_info(&modela, infoa, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return NULL;
+    }
+    cpu_model_from_info(&modelb, infob, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return NULL;
+    }
+    compare_info =3D g_new0(CpuModelCompareInfo, 1);
+
+    /* check the cpu generation and ga level */
+    if (modela.def->gen =3D=3D modelb.def->gen) {
+        if (modela.def->ec_ga =3D=3D modelb.def->ec_ga) {
+            /* ec and corresponding bc are identical */
+            gen_result =3D CPU_MODEL_COMPARE_RESULT_IDENTICAL;
+        } else if (modela.def->ec_ga < modelb.def->ec_ga) {
+            gen_result =3D CPU_MODEL_COMPARE_RESULT_SUBSET;
+        } else {
+            gen_result =3D CPU_MODEL_COMPARE_RESULT_SUPERSET;
+        }
+    } else if (modela.def->gen < modelb.def->gen) {
+        gen_result =3D CPU_MODEL_COMPARE_RESULT_SUBSET;
+    } else {
+        gen_result =3D CPU_MODEL_COMPARE_RESULT_SUPERSET;
+    }
+    if (gen_result !=3D CPU_MODEL_COMPARE_RESULT_IDENTICAL) {
+        /* both models cannot be made identical */
+        list_add_feat("type", &compare_info->responsible_properties);
+    }
+
+    /* check the feature set */
+    if (bitmap_equal(modela.features, modelb.features, S390_FEAT_MAX)) {
+        feat_result =3D CPU_MODEL_COMPARE_RESULT_IDENTICAL;
+    } else {
+        bitmap_andnot(missing, modela.features, modelb.features, S390_FEAT=
_MAX);
+        s390_feat_bitmap_to_ascii(missing,
+                                  &compare_info->responsible_properties,
+                                  list_add_feat);
+        bitmap_andnot(added, modelb.features, modela.features, S390_FEAT_M=
AX);
+        s390_feat_bitmap_to_ascii(added, &compare_info->responsible_proper=
ties,
+                                  list_add_feat);
+        if (bitmap_empty(missing, S390_FEAT_MAX)) {
+            feat_result =3D CPU_MODEL_COMPARE_RESULT_SUBSET;
+        } else if (bitmap_empty(added, S390_FEAT_MAX)) {
+            feat_result =3D CPU_MODEL_COMPARE_RESULT_SUPERSET;
+        } else {
+            feat_result =3D CPU_MODEL_COMPARE_RESULT_INCOMPATIBLE;
+        }
+    }
+
+    /* combine the results */
+    if (gen_result =3D=3D feat_result) {
+        compare_info->result =3D gen_result;
+    } else if (feat_result =3D=3D CPU_MODEL_COMPARE_RESULT_IDENTICAL) {
+        compare_info->result =3D gen_result;
+    } else if (gen_result =3D=3D CPU_MODEL_COMPARE_RESULT_IDENTICAL) {
+        compare_info->result =3D feat_result;
+    } else {
+        compare_info->result =3D CPU_MODEL_COMPARE_RESULT_INCOMPATIBLE;
+    }
+    return compare_info;
+}
+
+CpuModelBaselineInfo *qmp_query_cpu_model_baseline(CpuModelInfo *infoa,
+                                                    CpuModelInfo *infob,
+                                                    Error **errp)
+{
+    Error *err =3D NULL;
+    CpuModelBaselineInfo *baseline_info;
+    S390CPUModel modela, modelb, model;
+    uint16_t cpu_type;
+    uint8_t max_gen_ga;
+    uint8_t max_gen;
+
+    /* convert both models to our internal representation */
+    cpu_model_from_info(&modela, infoa, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return NULL;
+    }
+
+    cpu_model_from_info(&modelb, infob, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return NULL;
+    }
+
+    /* features both models support */
+    bitmap_and(model.features, modela.features, modelb.features, S390_FEAT=
_MAX);
+
+    /* detect the maximum model not regarding features */
+    if (modela.def->gen =3D=3D modelb.def->gen) {
+        if (modela.def->type =3D=3D modelb.def->type) {
+            cpu_type =3D modela.def->type;
+        } else {
+            cpu_type =3D 0;
+        }
+        max_gen =3D modela.def->gen;
+        max_gen_ga =3D MIN(modela.def->ec_ga, modelb.def->ec_ga);
+    } else if (modela.def->gen > modelb.def->gen) {
+        cpu_type =3D modelb.def->type;
+        max_gen =3D modelb.def->gen;
+        max_gen_ga =3D modelb.def->ec_ga;
+    } else {
+        cpu_type =3D modela.def->type;
+        max_gen =3D modela.def->gen;
+        max_gen_ga =3D modela.def->ec_ga;
+    }
+
+    model.def =3D s390_find_cpu_def(cpu_type, max_gen, max_gen_ga,
+                                  model.features);
+
+    /* models without early base features (esan3) are bad */
+    if (!model.def) {
+        error_setg(errp, "No compatible CPU model could be created as"
+                   " important base features are disabled");
+        return NULL;
+    }
+
+    /* strip off features not part of the max model */
+    bitmap_and(model.features, model.features, model.def->full_feat,
+               S390_FEAT_MAX);
+
+    baseline_info =3D g_new0(CpuModelBaselineInfo, 1);
+    baseline_info->model =3D g_malloc0(sizeof(*baseline_info->model));
+    cpu_info_from_model(baseline_info->model, &model, true);
+    return baseline_info;
+}
+
+void apply_cpu_model(const S390CPUModel *model, Error **errp)
+{
+    Error *err =3D NULL;
+    static S390CPUModel applied_model;
+    static bool applied;
+
+    /*
+     * We have the same model for all VCPUs. KVM can only be configured be=
fore
+     * any VCPUs are defined in KVM.
+     */
+    if (applied) {
+        if (model && memcmp(&applied_model, model, sizeof(S390CPUModel))) =
{
+            error_setg(errp, "Mixed CPU models are not supported on s390x.=
");
+        }
+        return;
+    }
+
+    if (kvm_enabled()) {
+        kvm_s390_apply_cpu_model(model, &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+    }
+
+    applied =3D true;
+    if (model) {
+        applied_model =3D *model;
+    }
+}
diff --git a/target/s390x/cpu_models_user.c b/target/s390x/cpu_models_user.=
c
new file mode 100644
index 0000000000..df24d12d9e
--- /dev/null
+++ b/target/s390x/cpu_models_user.c
@@ -0,0 +1,20 @@
+/*
+ * CPU models for s390x - User-mode
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * Author(s): David Hildenbrand <dahi@linux.vnet.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at
+ * your option) any later version. See the COPYING file in the top-level
+ * directory.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "s390x-internal.h"
+#include "qapi/error.h"
+
+void apply_cpu_model(const S390CPUModel *model, Error **errp)
+{
+}
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index ec73bed524..84c1402a6a 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -28,9 +28,13 @@ s390x_softmmu_ss.add(files(
   'mmu_helper.c',
   'sigp.c',
   'cpu-sysemu.c',
+  'cpu_models_sysemu.c',
 ))
=20
 s390x_user_ss =3D ss.source_set()
+s390x_user_ss.add(files(
+  'cpu_models_user.c',
+))
=20
 subdir('tcg')
 subdir('kvm')
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 17edd4d13b..5506f185e8 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -261,6 +261,8 @@ static inline void s390_cpu_unhalt(S390CPU *cpu)
 /* cpu_models.c */
 void s390_cpu_model_class_register_props(ObjectClass *oc);
 void s390_realize_cpu_model(CPUState *cs, Error **errp);
+S390CPUModel *get_max_cpu_model(Error **errp);
+void apply_cpu_model(const S390CPUModel *model, Error **errp);
 ObjectClass *s390_cpu_class_by_name(const char *name);
=20
=20
--=20
2.32.0


