Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683E43ABD32
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 21:57:01 +0200 (CEST)
Received: from localhost ([::1]:53560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lty8K-00033R-F5
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 15:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lty66-0000v7-3M
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 15:54:44 -0400
Received: from mail-dm6nam11on2110.outbound.protection.outlook.com
 ([40.107.223.110]:19734 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lty63-0005so-TN
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 15:54:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctk3aRuWM9pIOaTWi3fsw9JjQfVMyEEzNaT8oZGUQAuICPqvFlAZ55NutaT01YzwZ/R1ys1zcNXM8ogS5P5CKn2EnwtKYl0Qrl7vIo2uncRgEraJHbCRTWXxfwo2umAFg7udUyZWWM2rfDK0+9GbLuuFuCux7JkFFN4w6Fdn+NeXVJiptFnLRnLGf20/OmROIBGqIAbgJYO52Vlk9oiiMc/4nRV9IcQBfyjDhBnUxf9TV1zVyVvVwXIOliTdrtQDLt0MtBFKKEkbuWiwL/s6uqe2RS8id1wmUfwdtedQeUmMLzct2OmwLm2IS+feOmxCpxj86F6hTdSkTFV6dB5T1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzQLEnTCFz7Up7iyNH0+6NQ8IZJKqqmoFM+vU5+by9I=;
 b=C4WaIVccP0vtTEQwRh8tp5V6rz4U3kMV+0KPzM8JrPT0SgGc0OcoDDuF9T5yu3PRR1+kwW3fDHuSpU1Z6IsLMxc8tbzBbCeAYQ/cLFRvdK+8LSIL50jrjNtcXSxz/Xb76J4xJLWIaOHHVNIqqEm6s68wxUAZsq/x6bax2rzZycrs61vUGtjcMQEErrU9sYddqhRbbk52lWZWX+SNPzItcJ4W6budybtiMsW/6cVpMagzNIdHcbdSZyRv0sf7xQpqxOshaereLLW0NAKWzUdTYh9Cm7VX4fsMtJBjUXBByaSBBfWXxxFDUE3+n79mo34G2eU4ebAUdJvNDCtYqD4lSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzQLEnTCFz7Up7iyNH0+6NQ8IZJKqqmoFM+vU5+by9I=;
 b=AFEw0rhp/41U6ZS6nkI1qn2YvF4SIcLo3if/7sPtTbPrE/jx7GX+9sot/znhVMHLex9L3oGYmjPmHEuBCMYu6Ql4nxtCftrDq0GB2wmmlxe2BawKAogGGMcjqRGW9OvIRKCY/3B/DxItvH+gthhY6FPeNgCF9ImoJIdYVnvYjWw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3677.namprd03.prod.outlook.com (2603:10b6:805:41::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 19:54:05 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 19:54:05 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] fuzz: add an instrumentation filter
Date: Thu, 17 Jun 2021 15:53:51 -0400
Message-Id: <20210617195353.284082-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210617195353.284082-1-alxndr@bu.edu>
References: <20210617195353.284082-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR18CA0030.namprd18.prod.outlook.com
 (2603:10b6:208:23c::35) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR18CA0030.namprd18.prod.outlook.com (2603:10b6:208:23c::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21 via Frontend
 Transport; Thu, 17 Jun 2021 19:54:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ed95ed0-5a58-417e-ff5a-08d931c9a9ba
X-MS-TrafficTypeDiagnostic: SN6PR03MB3677:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB36770B9DC49427498253EE80BA0E9@SN6PR03MB3677.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WQ6C5c/IVfUXgEmpI0aG+NEooMxBRGNJa4rvbt/6Ir+HcmPCH48H+n/d4v64j23IpMagpK7vQ8kIVBdb1TBvYfc9dACmSSs+BVxyNUqZf3m74B2N1A10G3aDa1Ox0y7NOf5hbF7NsSmzoETAfn2QKxrQkWLJGhPiwomq0n3T9CbvUfH6t6uX7+HqK+8EGntV+nsj6zIWRfLVZwPOSW19C5fr/yjUMFWS6zIkDP5Wi0dcvAOGsTyFJHE2m+47wD3Ad71IuHu/t8dOD3oTMJyJGO0WfHkPzyOpB3NoZ//Wq8Jii5avflKE/5e1pH+r4QJ/jCbLwjqU3xKqNS2TQHcnRWUO9RYN7GnhwoxL8sVaeivJHwSfEZVTOg+FXiKuqTUGjzHrF4a4PfnWrpH5kAxGOt7LYESID9F+2PmNigbF5o3xtKMwzQyVgN9GY8QZiODoyanBI4mApUdkeG/TfMOjtmUnJ8fx6+hhVLZatTk4BZZOb48+nUtMwSfCv3ZwyOh3cf5kw6+SG+mCmCnnQOP/GGNe95rCqnOLEpSb2k1Or/tyulehmkD0uQwdVPk8utbXqXiihKI/Bo/NvUdl356rarVRVFBLr7VRaEOdyeY65Fnw/yc90EbTgHcwCFCpDc2WCazcUFrmHXe3TIeIjb+CZjWSqcznbr/ctW5zKvgFK4T6DpPytX8wwuIearmGfvo/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(16526019)(186003)(786003)(316002)(2906002)(6486002)(52116002)(36756003)(956004)(66946007)(75432002)(26005)(5660300002)(86362001)(6512007)(66476007)(66556008)(8936002)(6916009)(38350700002)(6666004)(8676002)(6506007)(4326008)(1076003)(2616005)(38100700002)(478600001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gNoilaohcHmy8RtzfovW4L/J1J7EcMcZOftzWNvqb+iRdg/PEprAKdsqNShC?=
 =?us-ascii?Q?K28VXsBD5DOI38ZVm5q16Y10Awc8sEn8dl6Bl47d9Xq8YMeD31y/JqmpRBA3?=
 =?us-ascii?Q?CdIPrFMsZ7/X3ev2LdvmxLrsj4vIjK1inUYdgSrdu1rS42H4S6pfdD9qm8T3?=
 =?us-ascii?Q?RuBa9MvA51eVhBiwIXLJGxoVPRZ11+Jd0on92SM8e39k8foU/TczfxIolAAv?=
 =?us-ascii?Q?9jhaNz9TLia1PK+6ovha4Xnx5HFcdVeDH+bMUVDv8Qab33hp/ciG/brp62S6?=
 =?us-ascii?Q?vCMmjgQw0CR4yylEttjYaCoFvRF8fUjHPca+21dYqQpMkYQEuIbl4f5XYlbU?=
 =?us-ascii?Q?KFmI441jv+uKBJ2L+3GU2XGxpmCuWBBlS3tnCvYQDWpWYbKPdwDoyfm0BgkZ?=
 =?us-ascii?Q?lm3o9B6pr8teBJMrpxtoA32zJSbp+v9zwdAVUKryP6mYaqG6aHn694a97heW?=
 =?us-ascii?Q?jeKn34HDL8xuOLX/7myhlwLFWmIWCme2JvTXu2w/XadPFMvCpQ04XJWuOs+g?=
 =?us-ascii?Q?wBh9zWLZOcUj4B2L8LCxwkKzjOC80fafFFMoStWT5RamtHFuv94lYNRfno3F?=
 =?us-ascii?Q?kkPH+d9x5txTZT47Y2LkQFzWUvnisGbiOC5AqwaSYQYMCoag8K1ap8ntm8Iu?=
 =?us-ascii?Q?lPp+sUVOjyZzK/58OlAZuqjDQWza3OI1XWSNvZ4ttZUjYUX9GtuePVVCG2/R?=
 =?us-ascii?Q?N+CpS0MtWSEFiWYxL0UzWkxnuRcOf8H7ua4Yn6oUK1hiFYWBvr51iCPO9QUq?=
 =?us-ascii?Q?NuWpW5JEKEbEOYpoVYmQ5P9yGqYp7nJ0yeBWKUH6Yz4dBpqKutqnl9z/W9b0?=
 =?us-ascii?Q?2bG7xvGTYGR6q00FbpoIJr94YNzdRmHK+H36boAqBTtbzPGNYk/osrDcaifj?=
 =?us-ascii?Q?Sz9P2abLRWXlqpsznd8E8c16w4ej3U1JkilPCAB1fAKpv0i5muSlugMSsNwB?=
 =?us-ascii?Q?Q2xLt9zyDXYEIiAsWhVnSIWLUKmIskjlCf/i2tBlsWSu9cN9apKTV8h+kqZV?=
 =?us-ascii?Q?E/06FW7ini8Nr41oXrUwxahRSlvyEcdLpgCWrjkTVfbWYzBAxBt3RbBwxaz5?=
 =?us-ascii?Q?OQTIxLTaN8Ay+R0GsjvkH9NyLNwZd9Iu6EOvjy+3yJJRuuwEzzhcnHxGz9Lr?=
 =?us-ascii?Q?uFjvUBS4ApIcWkLUHFTU7wsgpYhrzI9Is6KXly4MIaxJzRyVLeG1ckteWmud?=
 =?us-ascii?Q?oG86n2oBIGtLWV8ywKP8mndzj2X9uJpkOnZUA5SefqqfSkYajaJNTgqBANJG?=
 =?us-ascii?Q?HZHZc6dSD8aQ3J4hRkc1GGMD8Ku78QBUOOnOg3Bw/zHXfeByz3IHUNcL8aV6?=
 =?us-ascii?Q?1t3w4DjMOe9MYfgDL5yBR4YW?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed95ed0-5a58-417e-ff5a-08d931c9a9ba
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 19:54:05.7586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8Jgd9UFLZIRyCTa7/5V+DNEz7Sng3KfbHiNwsHKcUw0lBqam3gKhgW1ooUyh8b4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3677
Received-SPF: pass client-ip=40.107.223.110; envelope-from=alxndr@bu.edu;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By default, -fsanitize=fuzzer instruments all code with coverage
information. However, this means that libfuzzer will track coverage over
hundreds of source files that are unrelated to virtual-devices. This
means that libfuzzer will optimize inputs for coverage observed in timer
code, memory APIs etc. This slows down the fuzzer and stores many inputs
that are not relevant to the actual virtual-devices.

With this change, clang will only instrument a subset of the compiled
code, that is directly related to virtual-devices.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 configure | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index debd50c085..40412bcfcf 100755
--- a/configure
+++ b/configure
@@ -6089,6 +6089,10 @@ if test "$fuzzing" = "yes" ; then
   # If LIB_FUZZING_ENGINE is set, assume we are running on OSS-Fuzz, and the
   # needed CFLAGS have already been provided
   if test -z "${LIB_FUZZING_ENGINE+xxx}" ; then
+    # Specify a filter to only instrument code that is directly related to
+    # virtual-devices.
+	QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize-coverage-allowlist=$source_path/scripts/oss-fuzz/instrumentation-filter"
+
     # Add CFLAGS to tell clang to add fuzzer-related instrumentation to all the
     # compiled code.
     QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize=fuzzer-no-link"
-- 
2.28.0


