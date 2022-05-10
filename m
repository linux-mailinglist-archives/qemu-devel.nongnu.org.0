Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EAA522115
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 18:22:33 +0200 (CEST)
Received: from localhost ([::1]:38310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noSd6-0004tT-6j
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 12:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1noSaR-0003Zm-9h
 for qemu-devel@nongnu.org; Tue, 10 May 2022 12:19:47 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:48658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1noSaO-0008V3-Q2
 for qemu-devel@nongnu.org; Tue, 10 May 2022 12:19:46 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24AGIR8N007669;
 Tue, 10 May 2022 09:19:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=s36HYYcMQe4vckXWT0rcbMtTs+vwhBgPs9S67lJir78=;
 b=Gbvj5oFNq/MW6i2Zd/dTxnwBK6NO4JcAzzi4JjCyf6s5iLQ4V0pNK1UDafcBCtsNXva2
 /lWv++La06WZ2ryYkWam7hzcB4xYa+rpsYmv3ZkkYYj0He59K+IIbniJ2vLaar8V7Pc2
 W/2+eoBV7OPKVITaGrO+qYbvpj65StUc6tj2PZHgfxL+FIwtwUb+2UwqBnptQ4eT0hqN
 N6hCV7NkBlK7MiYezWjtfzV/HLh4sJnVWTaKUlP3DcYTC4QRlWIkM+0/nK96+mzo/q8X
 uiv+mLtA9uZ1AHE3pyfWNUNW+RRml+O4y/qkac8/4p2YdBb7bnQUaHo577vG5Q9CglIO mg== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2049.outbound.protection.outlook.com [104.47.57.49])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3fwrdp676a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 09:19:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDvZ/3H5/QW/RBuzfUUFDOOP1ertLuSUxKF3nsZK8eMXVV/PZrPmJDS6tgQNtj+MetEz2bmbpJt8R2HCFPFr7BYfyzNQ0WXNbInGSA+YA8//ze7sYWKM1oFq5inrEsnCFDjlpdDdDcNnafriowGpr/VEbJN3GwpGaTnTbW48u0/K27oxu8RTFWvSE33pqiLcNCsz0Twn4wHPTLtmFXulKYSGpRMCSc4zBHs/HbpG4irBgqE2CPfDFhbZa07U1qJo0iXo1tMi5uLlKIDDi+dm1NugMCbV137I6ETfH70FZxm7xflktKDULbiseL3ybeSuhwbpRNW8kEisQy5/CpH7ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s36HYYcMQe4vckXWT0rcbMtTs+vwhBgPs9S67lJir78=;
 b=kmsTe+gmyYpDLTpk+QlAjDfkBWFkrH8FMrDhzDmCSY85tBAejR8w7mn50om+75JYgGZlqzWIwB1lgmI9x7tEtRUedhifUK2K0s1FMlhNFKs/wMyXuL2dwEBUoH2A4rSUYet3kakd4pkKp54kjt244yUl0nJkqGB6WaXI2SNjQpKIT90JJoZpXrGkr/SE/1SD3a9kOdeio9p78IuNwxbiw1AJaPtu/VEsSX7rzg8JGlbipq7Z/n8BPDSuIXLqFiE3h7aCHB3SVxToJow/V7SGh3PBKm59SanwNC+CHsn02PkhHyaYRl3ziJT8Kk4JydUbbigR6emIfWpecD32wlA4JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by MWHPR02MB2222.namprd02.prod.outlook.com (2603:10b6:300:62::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Tue, 10 May
 2022 16:19:37 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::852a:4c2d:6243:8c37]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::852a:4c2d:6243:8c37%4]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 16:19:37 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Cc: eblake@redhat.com, dgilbert@redhat.com, armbru@redhat.com,
 kraxel@redhat.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 soham.ghosh@nutanix.com, prachatos.mitra@nutanix.com,
 berrange@redhat.com, philippe.mathieu.daude@gmail.com,
 peter.maydell@linaro.org, pbonzini@redhat.com,
 Kshitij Suri <kshitij.suri@nutanix.com>
Subject: [PATCH v1] Make png parameter to ui/meson.build independent of vnc
Date: Tue, 10 May 2022 16:19:32 +0000
Message-Id: <20220510161932.228481-1-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0045.namprd08.prod.outlook.com
 (2603:10b6:a03:117::22) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c11fc7d8-56e6-4d36-2fc8-08da32a0e051
X-MS-TrafficTypeDiagnostic: MWHPR02MB2222:EE_
X-Microsoft-Antispam-PRVS: <MWHPR02MB2222333960C451E25D290EC599C99@MWHPR02MB2222.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 26LX3/Ts8vKddFbgD0hMeHMJlXssRb946Cmzn/ZPDQH5hmNAcy2XlbEPWdj3QsmuKQNG3mKerGZZ7gZjDSHlRKRnjykkGssMV8sgTjipBhY0z3/x9JIcZ213AxqB3koBlQN+RRhsXovYvKBTRbmyuX2KGNl9FXVFHvwqq4rO+Ct9UVXDviFuVjugGGfZaRrsIswoTfM3F+OZYdM1NI9DqDLkeCp03jcFkV8SHG+6LzmaqlQGRgqRtDvsZocfJH3vr4Jgb5z3rRG/sl+Lft76X/b7kcby14vyxxlmdVNZPqu07NkBx3jLZEXvgIryyajEMuioPKx0gucyFY24VMyVh9xbkTZjDGRY4RcVBoI89SxaTgp2rB5zxtXOUtD4AWuK2PVAToMX67jBDTC8P0SozzlYsvMe6GC5fEVmXBMjNlCwSgH9cpX2rQi3dGZ8vx/vcPq4xUyl7w1Eos7pa557gHxciNsgb8+x3DlThKSM4KaTdlWO3vttkfBuVx9WKkc00rxfZdlisGOSBvbLV96X+nShfmTgvgdQxiv8WZzIOuItT5ApST0oC6JD3XOnGk5YO2JnK/CSj5YvupvhSxkcqdpo67N+wJWkcUjPF72EeEx/zqAL8bhCwVS7E7X2swMJNy9RH04usz+3JuWU2qvZBYZ/C8tBrX2IDTVDrV1HhvUBM9avUJnddDvilHO7BZ3mVzWjqDVKH7nPj+BEMq2yaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(38100700002)(8936002)(316002)(6916009)(7416002)(1076003)(508600001)(38350700002)(107886003)(66476007)(66556008)(186003)(36756003)(66946007)(86362001)(6512007)(2616005)(26005)(4744005)(8676002)(4326008)(6666004)(2906002)(83380400001)(6486002)(6506007)(44832011)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QUQwAUk4+ZsGAy/NeuJ0uZ8o0AS+EHNaqZugbNgraZt7aGqtqJEHBmoODYWr?=
 =?us-ascii?Q?Oi3wjL7Rwo+h8HK1nxNDsHy6ia/ngBksZtWJuBx18JkZG1HOOxPIPWw/j3fr?=
 =?us-ascii?Q?N4EgZR3ZL9S9kELwVjjeP9eScW/n4DXtOskgnyZjwuSZn3gjao/cO+nyPgUt?=
 =?us-ascii?Q?bIVg9EkqlRWFuRRd4QqcIzdgJCUGBk6PzeL/t8av+8V5xUWTj/2EOd7drjKR?=
 =?us-ascii?Q?e7DCtC3/ACecccRvVer/LLPz3iycit/peiN68UPLvfnp8fKqXNAumxrp2wcM?=
 =?us-ascii?Q?2ljFsaQqx53BXTwTLYMwCKycpI/z7bOcBPVBQcN2gxGbj3R6/UFOO6LEE28C?=
 =?us-ascii?Q?cfChQLy5pSIkzu92mlPH49X7IE84N+ba9vYT//nXrQF4IBtdga1S85D8RxBk?=
 =?us-ascii?Q?uvh7hDBSOZ671oZDR2Zvp0TuyoOnhxnp5SnKRr3w4VYDxEQEaD4cf3B9rQHW?=
 =?us-ascii?Q?VpxQm8hRWYVVOVA4PjDHcaDuQH+yL37d1220Qw1kuSlwXTd4oS3dR2H3xyEn?=
 =?us-ascii?Q?P3T8sdfafDeyZ/zRn0zTyuIUbNKqrYQhIDyYCqlZCB6bgjddOenYm1n22rG1?=
 =?us-ascii?Q?FDjKh/b2Kvk58oSDRTkjdPjD9A1pKtBP0Ii+g8tA+BXl6F9TAzVIuKkj7rx9?=
 =?us-ascii?Q?N0Za8eA4a0odvlPMcwrY/jz2KTkKJh9N6wZ1gQ6FUZmqM7rz3MUcvKZTM+sw?=
 =?us-ascii?Q?6elhY1VtPSz+oImTFU/YmsKcKmOs+ieQBO7pV2Y9P8FjAxraX15eybnJBxa4?=
 =?us-ascii?Q?jHLsrYvrfGfDkULWDf8naoHrxZXb1aIC9RwcTrrRHUA8sBYGjCnymgxveobt?=
 =?us-ascii?Q?jmfLqDKeAxVHNWugQSKt7DfkSjHoXOskaXQO+jNVDVu/Bs6iEGSzUzA35o+E?=
 =?us-ascii?Q?h7MrFPspakZNQKRXxzq3uw37vRlitkYUljB6mriHvfUVGV4kDIMEXxXh5JIk?=
 =?us-ascii?Q?xaJFM/X6w3ESvFgTN3qsa9TFE5I9VxkLWBe5Wjh1e4H5axqyiZikuQBPj7Br?=
 =?us-ascii?Q?j9KyAj+VLeS1nyJIp2b1z1v7gn9IVjq+15FXbNw8/Xi53V/0KpZ6xDe0Ukxr?=
 =?us-ascii?Q?J5dI8Q/ldYsjgAUBt5/fA1RNpV8QL89qYf7PuOt+p/dJ18Udi8G8ZpszTgTG?=
 =?us-ascii?Q?HGKQhjEBDZuNe/WuzEJ/v/DggcYxavMzLweLO9sANft/9YX3ovHN+SNBQKBH?=
 =?us-ascii?Q?lZLo87htgUCdoVSgy1SaEWDjQCY5hdup1hfK+KOnz3fo7K02zMDupsYvPGWz?=
 =?us-ascii?Q?rxX0/s1DUq2QT43zIM86nrBjr6OGq5dn2gBYjQzqAPoV9eoFx8X5TeEqTMfO?=
 =?us-ascii?Q?TNsyAhk2+BUXZEiQjxqo/2jxkKFa0Ku6N+SJQHoqwjJgOmBNLehI5qdVN+gR?=
 =?us-ascii?Q?1xLOdhz6sB09UZfo5jy5nCMYWcQdcUpcqkqHrHsWShJw4DCgyTFDR4fjJCc0?=
 =?us-ascii?Q?c8IPKd5hsdJjLqG2FaDNB5DWFx+yOwaQVADX4QsD1+Oc+GYlC0nkDqKOTiCw?=
 =?us-ascii?Q?cqASN4TSPO9as2nokNDmeRgKWoHG+8IX6Nx7omVIfU9b7v3H9rlCM/3XO20/?=
 =?us-ascii?Q?HjlipLM52ul57Fu2Mz3nUZ2Sz95KCwfCk4f5r2wucKPTWt7Rg5Z71QRzYMYV?=
 =?us-ascii?Q?qFz2DTTioDZiLWaj0nSfqanK4y15pD9J1g0dbWCFIMEq3oSc6PtOZ3ZJnbvb?=
 =?us-ascii?Q?5Fzu8+EmntTtcEcYOc+AJWgoxxVzmZtIqiSjpm+ZJzAMhOCG30p+EP7tptZl?=
 =?us-ascii?Q?X1skOBwJXShOiKKh3RoskKSBnFusi/Y=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c11fc7d8-56e6-4d36-2fc8-08da32a0e051
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 16:19:36.8107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HX+CZERq4WdRqiKKnsNgxpzs5YiNRx0453OpoooynKUVSDRcMSMxNPCroIeDL8bF45X0elKq3xGvAfdPggk2tgwof+tSegcnHPcq7O+rhyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2222
X-Proofpoint-GUID: MifslWQzuZ3nXW-XKtNdKrMl8Ri77KcZ
X-Proofpoint-ORIG-GUID: MifslWQzuZ3nXW-XKtNdKrMl8Ri77KcZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_04,2022-05-10_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

Currently png support is dependent on vnc for linking object file to
libpng. This commit makes the parameter independent of vnc as it breaks
system emulator with --disable-vnc unless --disable-png is added.

Fixes: 9a0a119a382867dc9a5c2ae9348003bf79d84af2
Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
---
 ui/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/ui/meson.build b/ui/meson.build
index eba93b41e3..df65dbd0e0 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -40,11 +40,15 @@ vnc_ss.add(files(
   'vnc-jobs.c',
   'vnc-clipboard.c',
 ))
-vnc_ss.add(zlib, png, jpeg, gnutls)
+vnc_ss.add(zlib, jpeg, gnutls)
 vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
 softmmu_ss.add_all(when: vnc, if_true: vnc_ss)
 softmmu_ss.add(when: vnc, if_false: files('vnc-stubs.c'))
 
+if png.found()
+  softmmu_ss.add(png)
+endif
+
 ui_modules = {}
 
 if curses.found()
-- 
2.22.3


