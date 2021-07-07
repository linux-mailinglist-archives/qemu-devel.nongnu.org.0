Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D523BE6BD
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 12:57:17 +0200 (CEST)
Received: from localhost ([::1]:49988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15Ey-00010Y-0w
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 06:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15Bv-000300-Sp
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:07 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:35001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15Bt-00022t-Kx
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625655244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=US8mWO90E1lMT3HjFqg08pXRI580s1mZe/qw62m737k=;
 b=aoF/HkYrcXVj/7aNM8yJ/MwWTAoixYf9yXdbbePquVbfnL8BHGwMizMczFZzlzPtzvFMs6
 jdjmaFDUs/k60Fua70y5ef3MsRw0JPthmuQ+OfIS1tqPn/IIjl+GZQYIBn8W6LC3ConPYE
 1lVV+pv/KRTCgF791SFbDVs/eGakm/c=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-zzQUiAq_OkGm98zLBE5_7Q-1; Wed, 07 Jul 2021 12:54:03 +0200
X-MC-Unique: zzQUiAq_OkGm98zLBE5_7Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6cflDr81kFztkQy59/6oXLvHhDYnwnPDJJeOZziBYvNhtKntw2qaqKh9MzTNW2nT5BY4t5y+B8zYTOf4OXUjJwSuy0+C9LU1eUiufqbsZ1OXDbwMMSC+2hKbOzwpBA7k3D5fi7NrWFfRRolDAy3s+pcTPBiVVAlUJpsMwdjZOOK44ckrfnkSuC2QHtfTMV4KAVIULjq6pmuceLQpbhFjCrxoMTsCz99A/FAI5gOhrtIBJbN6IAOW+ua8oCycDCpURqZ01U0Wk4ExwzTcc9DXsEGiE2g0WG9zfkUkwfl9OsOaDHQwimCTmUx2bbmOvQVCwVFkvjUF4/N8XqQUcaFBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKod7ZoEn0lFKTKRPUhDRWaHAZwtsN/hsBo0gmgurSw=;
 b=bLXJVZ3VAWskWBiB45zh2dA/xsY35iTVRAMGCc+Kq5bc836JGYwzorRmGkh7yLt8HVUStDK7OcE2fjtm4shjMZh81QjaNJRm+LjDlRFeQveowl3HMQuIfAovrKab2CtWJDf5v4nvYswGRoa/MlwkHXEFUm8Samrdj9DnCIWQD5CYfV4KPenUUMOnlpFlCNBsMsgEUktLJDWq0BkqW0U9eti3T5FL8fDYicC+bPWFtWq/zMEX3EbhO+TbvY/Sc/5GcoaBtE11RqY/XKTQltNl2W4CdUCBnzSTBcpIEiPQh4fMQdFRhWYlmbXUP/6Q+pb0D8n08pQ6t05jHioC/yFQJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR0401MB2238.eurprd04.prod.outlook.com
 (2603:10a6:800:28::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 10:54:02 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 10:54:02 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v7 05/14] target/s390x: remove tcg-stub.c
Date: Wed,  7 Jul 2021 18:53:15 +0800
Message-ID: <20210707105324.23400-6-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707105324.23400-1-acho@suse.com>
References: <20210707105324.23400-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0068.apcprd04.prod.outlook.com
 (2603:1096:202:15::12) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.20.159) by
 HK2PR04CA0068.apcprd04.prod.outlook.com (2603:1096:202:15::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Wed, 7 Jul 2021 10:54:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b7c196d-2bd5-42e6-badc-08d941358813
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2238:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2238C65A374642601F24CB06A01A9@VI1PR0401MB2238.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XpUh2GTKulzNVHCEjGANdKWHglZ9Zx1gxA1yGQdmNXB93eYJ1mbXxKt6o1/PJtLKpjPNpz2wGhVLRcVyva92jjBp0y+4bNO6sYPiBGgynoxGLh+jEQtRPUxFdYiSENPgV6umYp8GC0XZatRfNwU1ZJ6XFo4IK3yoHYbEpc0vzOYOx0O2wFaExcYtaztEFlwX+Qi6rCRtaXYOUF4TdKd3xTQBI4EfckniILLLoBC2jwA4vJB5DurbLNuFrxZvQRdbh7NRtp24UlflcIAFI8tjwm5KSZF7gzqBMgC25XzBiBJBlIVA38PjkmvDdIM3XXJSNyPhqeU9XXAXbWpAqi+hQzLf/T9v2gRXaO/u1a4i7w61xHgClzcb9XLsdRnZYC/30kf2EUu9OfOwQ6p3ceE9q/aAts/Vxoq3iaLiV/CO8nSFfCPa1m2/uypKc9H6Idq7H9HKGnNTZlmidooU2RrUUskg6EvY07z6tjMEsBoRqkYyDTNEwuzFlu5XZH9DYmuZu0HAOyTuu89pImVH7NuPC8jePeebVpxdXjG+9fewO7m93UlqcIhVl8alBhtCw101Gj3c1YhoVIUZh4b3YNM4Xw1qFaHW1rz+TZ65GvBHc31ZhWZkxUYV3hSsP2Ukfhi4jrIzs0JcC866EPDdaMneVRgJYsPXydU08FTcWUiVMJRLNBQaSljnGy5Gr2puLCfzd7oE6YkXV0JEU/3b7xqxtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39850400004)(366004)(396003)(136003)(54906003)(316002)(26005)(66946007)(66556008)(6496006)(6486002)(186003)(6666004)(86362001)(8936002)(8676002)(83380400001)(2906002)(5660300002)(66476007)(478600001)(36756003)(4326008)(2616005)(956004)(1076003)(38100700002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FdjcipbrTHEOJ8EKp6CJ0VlfOsBeFQd+idyE1y0UyAiSrGbCjiwlBj7ltwHe?=
 =?us-ascii?Q?nACqFSoAbD+Kv92Mu8Kvdg6PbRTn4MAbdVApFgxBOMKESjpohDsR2ePVKmfH?=
 =?us-ascii?Q?L6cbiXDNwRV4/VkJPDVxxh3t7+6OUvl1Q0KwDDdEs11koPXP4PqIpOSCHric?=
 =?us-ascii?Q?6wqn8oxdfnYCfVKsnlv3/mufjLG741DOrDwPUiR1B8xvXGy1HgxcNIzVFj3U?=
 =?us-ascii?Q?aocSIPSdokHZ5zd6HrJEhyoRnn762LvutWkKiZ9T0GX+BTJNjHTlPb/SBkpk?=
 =?us-ascii?Q?N7RKuIHFX0ry6MeQ2p2InPpsT/j4BPyKdTlEnu9juKkT2EvPIn8rVbO6yEx6?=
 =?us-ascii?Q?T2vZVUrbaoOUZv8nmLVRgDYHN8STLVXXqKpoDUDE+UTpzF2oH210+cw/1nY3?=
 =?us-ascii?Q?Vxj3F5PwsvMQPQp3MxzIVfm5gQ29PyKSVIHZN/0jepP2sTqIExjsCj/OLGKV?=
 =?us-ascii?Q?Jq0szD7E3aLEs23iE8ol/SPgrCIR/85djkeCporWAVOfPZ5FyatnixBMT9dl?=
 =?us-ascii?Q?lA2hfg1JzwpPSfQ8oSjs+QqUmQg+n5fceuGNfr9HI5hD+yrQUbrwWDlfOBa4?=
 =?us-ascii?Q?OwJu5VzTdDeezrRV67ycQpk/Aa3i2RuwdAQaCrIWWWx0U4UOS7Ldn/C1kENG?=
 =?us-ascii?Q?oTf0fGgC3hg/uIfFnjs0+pUU10oA6e6u98HU6xt9ypy4DBK3TF3cl6JlfIST?=
 =?us-ascii?Q?OwJ7ycmUyCdZfOo/ouGF6WI3967pbL0aHzNzqav6t2x73jd2wYy9bXq42vcT?=
 =?us-ascii?Q?klVDQiwvPm74sazZgI28OqvoEmeTg6HN8WdyH2sT9a/8dhU6k6/a71Pou8xs?=
 =?us-ascii?Q?5JSNvvopdjyULy5GSXbK6yQoyu6I9i14oqAPlDICa52a+jinxexSCVcikF2e?=
 =?us-ascii?Q?J6j9LokGrquTwBJ32LB5H341e69VZfCBtE/Vg/tVuNVsvRF8aDV6YrOSSH6/?=
 =?us-ascii?Q?Mg3xxF4yEtoKVVFVgjm1BM2gja/rBHiq4sEaeodFPs1XwHRd6tucSmCQmLvX?=
 =?us-ascii?Q?2JJRCj2wwo1D245GZEtnYoRTlmVJLzO9bzNOlFB/f6W9nMICZaoTMbeUQH9p?=
 =?us-ascii?Q?c2TtoEn26YZtRYCv2EKhs+PrsYAaVayxySBxfeWFDC0AnVY/UXIOfoiOgLCm?=
 =?us-ascii?Q?ziO8Q5oyNTNqllWGipoTsVGK+81hRdHxM8xj0q9m7wyswq5lbFi74jf3fPrL?=
 =?us-ascii?Q?5GiAGMfTBCpiye+AVSgmmFXHmp8iytjogkcqYDe7yi1kF7eFxJ2XiYxf00d9?=
 =?us-ascii?Q?OkmVwMjJ0VCZrLvtBsg3qRC0a7XaBHCzHCIy72qJNO9YfavtEArlBFy7FBwk?=
 =?us-ascii?Q?O1FaydKTr1FR/P8caZ8f4Isc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b7c196d-2bd5-42e6-badc-08d941358813
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 10:54:02.2981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Gzg2ynDhpjSccHSjmcKWGGR5dmqgchd28fpVu8BWrQfjfwlS7S+tVDzkIBEz8aa
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

now that we protect all calls to the tcg-specific functions
with if (tcg_enabled()), we do not need the TCG stub anymore.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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


