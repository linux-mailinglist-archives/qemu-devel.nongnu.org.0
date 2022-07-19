Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9A8579FDA
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:40:38 +0200 (CEST)
Received: from localhost ([::1]:34296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDnSm-0005Bl-UR
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=41997b3f26=bin.meng@windriver.com>)
 id 1oDiZd-00027K-HM
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:27:21 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238]:56070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=41997b3f26=bin.meng@windriver.com>)
 id 1oDiZX-0007QO-Mz
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:27:21 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26J8CDaD020009;
 Tue, 19 Jul 2022 01:27:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=7j3Evg/z0rtXmsoMQC9/vxHpJWZTW5sWyTBKazf/I1s=;
 b=V19ZrD2UqOSUpLinsd5ajpuCYPCAMcxCsxPfLgVRF/zsAJJynCNIcqL5dAMv9B15ZDOc
 2k6QCyzkJouisdS4WoirI/8VPy3sJP84/oPvwwCihSm0ZRAveOED6lzt/6WgcOfoSnuR
 /PKmtu+lQp7XX+HMpvvFVl03s+cKdMbi6too3xGoCiCwmK1SXLUfDZQe8AyJ54AZT4jJ
 FNe2sZZoEvE0NN23EzL1Mi7kWfiur4mTpFFL/y4azQIiIPXVCpq4FrPLTVCKcfdXfoX+
 Kh0NuKFcLetxopNGS/bC1MGPTVrloJkxS81z4e5D7i1iOAyTQZgV8lrRJxexHuf9qjAm 9g== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hbvuksvmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jul 2022 01:27:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FsgkZddEz4JzSMgbrm/2CmN7RqdN1N2WxOwtLAw1WMbnd3PAdHFSA7Ic1TiiCQsLBVSzeftut2uSWrFvteaAEuJXnophKDKsOOoB8pk99YWhcB/SimGJFIIOrZ8WcF6HIZSD6ZyrwueUiJiBd2XBIiFBdOG3FwZ12rIL0dlikExC9Rcp1Lo9tvdYwHxDQo1qE9EQthSlMFTNf0AxYBZ2oQYYMUrqp1NpFjN3wu5jmZEH2MdrA/ZVekq46nU6qH8oqfBIp7gHHYod8EfmBMZbq28NswMyO9+koKxQBvWerEdP1yzY9ozuu7MPJD7A2D1fpmTi2dwlj312BDs7hbrrtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7j3Evg/z0rtXmsoMQC9/vxHpJWZTW5sWyTBKazf/I1s=;
 b=P3TXJCVHiJ715jhZsp3RHhGeKZh++U/xRWtSPNJGHc/VLnbGQzjARFEEjMn8/CxzH9zXCWhGnLPmiRkV/Wu1/W8lYrpXYtfXRzkHnAZTH0d0os3M/zvtUWgb0eqGdmdBXffJMwSuaR2uNNtxWMrYVUczdck7V4RMUiM9tChLfx3sohdAj+BjBPTvt25uB5ITvIgpAWhlNmvoHffymOgWfBhTmxAljsmO3HDpBFRk/tVaIeZPkUBcFpLuq8sIdaHAFj53xp0c3VonqSKcQpA/VJI1DUnyK82Vn9MtZ6afDKkhmQZQOa40xGpwDh0LaXdWjTJE7U55H9bSCevguYOCrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 CY4PR11MB1336.namprd11.prod.outlook.com (2603:10b6:903:2f::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.20; Tue, 19 Jul 2022 08:26:58 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::ad2d:b8e3:d53f:6359]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::ad2d:b8e3:d53f:6359%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 08:26:58 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH] docs: List kvm as a supported accelerator on RISC-V
Date: Tue, 19 Jul 2022 16:26:35 +0800
Message-Id: <20220719082635.3741878-1-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0189.apcprd04.prod.outlook.com
 (2603:1096:4:14::27) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d47e4ae4-66fa-45ac-097c-08da69607260
X-MS-TrafficTypeDiagnostic: CY4PR11MB1336:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NPcHryfgmwf6fQ7dAHRqFmST4Ne/1KuHVFoplkgJa4k1xWJ01lpy4ZNnJg6rnDoF0oh95TgExlLvbhPrH13zm/XBDWyKJRxHnYLo1L/apohG6FIlNcZA0NuAJKO6fFNkxjWp2wXUXjaHH4Mez7PSntjw1/YDFbgiMxb/DiOHRu8NqkQoVEFtJoa0O1tkZ9pP9zx8gM0J+/S/PHElayrjYTmXZD+P9b5AuTolOR7SPGi/e6aGt0WLfQusrEuPI8SuMwxcIVEEJKVy8e9OfVAG+2vImVk0AoTfM+3SQ+xuVglOSzQUfnICHRJpAXT6o1HQr5Mv/pbVrooC4v/JF6l/kccb7x6/52haMUUn4U3hw67p9yG+i15j/VSLLt0BsSO8wv9K0LUK3pEIzNhRun5zN9uZYVa+z3fNJ0h5GhEzhB9ThJiNgUCQiocwInttfIlfskBv2PFA4g4ADeyS2AQiTjc+fynZg3vEkkRQTtqtvJz3A0pTz67shj3s2Qz7ibc5nwc5nHP3Wzr+u02xnNIrpFgL5zh0odZcTqIBgvIGhzs8RC8PaOQBH2jOAfriQPsA2g4fZhDeb85xnOMGBk0cP7AEjlAOfsjHtJwuLC5UMfMCi0z4C0M6tDXLAAyahlDaMZs7FD/HFtI92i+qqjHoxdIz09UI74NVthk/+qfaPxKJ5uo0FZFicH7NwA0oTEAN8O9vuo1LYXO2YsPX0mOjMdtI6DbXuZN/5REJJ4UeuEz+C6WwaFdOYaW9z2qTbHoIYKB8+1qZtEMQDZmg6QbjSIXiyFX7MJ/u4fnSwwcySbo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(396003)(346002)(39850400004)(136003)(8936002)(38100700002)(8676002)(66476007)(66556008)(66946007)(6506007)(38350700002)(36756003)(316002)(110136005)(52116002)(6666004)(186003)(4744005)(41300700001)(83380400001)(2616005)(1076003)(44832011)(2906002)(26005)(6486002)(86362001)(478600001)(6512007)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DNf0mXUPSGt3lQ/gYFWcGjToDlIwdLJ1ZKoyEAfLN5Yeh/w83yDxNlYJpzOd?=
 =?us-ascii?Q?+0UYYzmiiPR5CP6GHHw0L4TPhU72rObDVggUBJzFyEA9HG2tsaGcWFniFCDZ?=
 =?us-ascii?Q?5/nENwUGLWPFPTecY8Tfy0tqnJx97Rrl7I5v+177EwPpZlTjk84Rm0Pd+Pwd?=
 =?us-ascii?Q?SH3THfSsjoyQgVKkjO0Qh0WbYzzlqXtpo3p20uQ32S3/DwUwp/bPL4xGmfkw?=
 =?us-ascii?Q?tQXNCqaOff+H8XrmVKsQb9wgN5V1RrhjgzbKSAGfpNMFj5P8vi+PEu2MsrwY?=
 =?us-ascii?Q?IQIPE3QYthQ7fo5Friol4vbkCOEwbKqFQIMURNhx8PtvOiV0uemvR0G7nqrN?=
 =?us-ascii?Q?lipUeU0KF2LMd/VrJSY6p+Zu/nfUkDdwQNEmZ84vh6EXaL6Jxm3dt2Ps4ULh?=
 =?us-ascii?Q?bdnRuRPRC/dlbgNvqSqNbeQckeyLaQYOcJkietzYE48w/PRM+Y7BUPLJgvOi?=
 =?us-ascii?Q?AAmS1WDWffgnNr//PY93NUUhJkuLYFNTwAKZlpSOa/P+LiyOaE2tAxJhbvA+?=
 =?us-ascii?Q?CPXyU9+hmT8M8gPgnUM7ns7wRI8Fa4uhk+qrJZ5IW0JK9WB4Y3DazQoWFoM5?=
 =?us-ascii?Q?jh19JsXNuVnFJ437bMG1YC4P9oXoBQ6hs/hJUPgRfi/LCzrNdCcRCLSJZU3r?=
 =?us-ascii?Q?+C0wg3Nuw4f/62UPLE8AUoVv3ccJznslAGMC7ME5LZ7+6sJl3XRQ9NzEeP1L?=
 =?us-ascii?Q?J35aJni79TCn8txRmxADvtTUW1ZIh7iJGqN+XJGRTlC+VIfRrgWUlD6wFVg4?=
 =?us-ascii?Q?jQcDfgEXv0Et4x7YZeAyJs2Fl9xzurb3jnKBOw74L3O5hkYDj6/vCdrVeXte?=
 =?us-ascii?Q?UPFqY2KXvFOGN8CT0G3RnBZob2X2JtKIP0C/8m5S9vmB6Bnz1ajIvo2bS4D7?=
 =?us-ascii?Q?p4rJRG+bz0sd48ggn9FiVTh7zt914j/SCbkcSqmUKE+tn+KZXQd6hV9eZqnM?=
 =?us-ascii?Q?J2bAXTUhvlAd1dcvwlQCt8oAo0gGdZzeeJ4APoWy3RSS6KaaJRSi+88M3tVF?=
 =?us-ascii?Q?0tctjWUBkNxepBAN9/lm3H7CpgT6P1RamKCsdGcaOClYaIVdETfI/VrX74xC?=
 =?us-ascii?Q?WobYDxecUl4yUNN42b15bJ/dhK7PnQNMUtNeykEhNz4FjbamahWv84ru7Rvt?=
 =?us-ascii?Q?Ud41gLqMmHHBw7CRn3jDwgt0DxNCqXgyhxTSHjYDjJy/pV0CeeJ3nO36Hrza?=
 =?us-ascii?Q?qg1aH+jEEhUMLwKHjTZzQsrbpwP7MR/4FFoVOi/Cj14Ro8SvSkvhVn+iQMB4?=
 =?us-ascii?Q?VJqjN9kmuSSXoVRt4la3MHKuhHKrMPWzU1frMbnwD5Ly/NJfM81qmmeKBQGT?=
 =?us-ascii?Q?N8eg2RoCRNIaIlWr2JWc1S4HD/UEdTUEoDAC5BGi9Rp9BGI/R6xCS73meprb?=
 =?us-ascii?Q?XntLP1+X4ZIgewy6gRWN5wW18GFjtBQqgzd2O0C8dZv7+mX9nRotVSc3idOu?=
 =?us-ascii?Q?RDZo2bnPDc1O5GtPpMwdX09nKyoJ0v4AS8S4NyoMsw1TYPHmQVaMsTMCeBHm?=
 =?us-ascii?Q?U/NeacDXRiUgUsStUNS1kJWJX7FSdMnrdLDgHxwla40yOJX4oNQ59eC21gmI?=
 =?us-ascii?Q?FfcsYweO2yTj40aWEhVDgUnW7YquutpDbhPLpzJDlZ2IcIDITLByNdmnDgBw?=
 =?us-ascii?Q?sw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d47e4ae4-66fa-45ac-097c-08da69607260
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 08:26:58.6144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r8b0h62o2IlYac0p2QdH+NzxK17EUZqcg+b84YgsVsmur0jpWy8u8En1Z7a7/XIGVwJDzgPPRrY9xd6R/9ypjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1336
X-Proofpoint-GUID: kwJjZYC_gIE2x0HYxW05JpUSVlPJ2DoV
X-Proofpoint-ORIG-GUID: kwJjZYC_gIE2x0HYxW05JpUSVlPJ2DoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_22,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=973 suspectscore=0 clxscore=1011 malwarescore=0 mlxscore=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207190036
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=41997b3f26=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 19 Jul 2022 09:21:28 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Since commit fbf43c7dbf18 ("target/riscv: enable riscv kvm accel"),
KVM accelerator is supported on RISC-V. Let's document it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 docs/about/build-platforms.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index ebde20f981..118a4c64dc 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -46,7 +46,7 @@ Those hosts are officially supported, with various accelerators:
    * - PPC
      - kvm, tcg
    * - RISC-V
-     - tcg
+     - kvm, tcg
    * - s390x
      - kvm, tcg
    * - SPARC
-- 
2.25.1


