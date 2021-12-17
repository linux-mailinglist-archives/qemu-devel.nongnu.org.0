Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D4A4783AB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 04:33:55 +0100 (CET)
Received: from localhost ([::1]:40482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my40I-0006zl-Oj
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 22:33:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1my3wr-0005ac-ER
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 22:30:21 -0500
Received: from mail-dm6nam10on2104.outbound.protection.outlook.com
 ([40.107.93.104]:47968 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1my3wo-00040n-RK
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 22:30:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZBD7xxbAFQ/+XueDxkaf1vlD94da2vo0fmJPbbYFw4u8Um7XgVwHXtzSkdWvKFt7du1b/51UEsdLaitaAKf/5T+gWW57cqNPudqoN6Vyvt5TEj+zE39Coa2uaIcwxi3e3gv2+ttY0yqj8XkvvCwk4GmOtkbUBoNCIDJgGMKuRUKVY+sBlu9JS7bHf75Xklb4/mTHDloB1O+6T9hcyF7Yaybwoyp2q8QoNlGAzTRZiZYvbd0NiP+SfVT4ODoDnolX/dy1uhyaXD4JmGcVYgEy2trEdsprMzPAhrfpr9daCadvi6PCiTUhJmJNmE0eYWVHjeyiUdkH986pDv6wP743w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKpOc3H+1FYLhHGKC3eCKcd+cP0Yw/7T/oOe9PJG0aU=;
 b=XCMRIJ3cuQQVwcpuau/bRpR95oP5Ls5CKvl3UuP/OSFPdFfTXxCGqNtT/o3LaO4AqwgBp44tcKrXWWgoML7o+WHQpzgPEZRjeH83sX57aTOhyOGIQCbVQhW79LxeJOwyJ1/ZCzsIR8JXbZfJHmV6aPh8cqeC8x+2bEV/lXV+r2U08fAy4dH6mYJWuyyLa05I6gU3SH25hzKUS/1P2JrOVTWoL4LOExPPSOBkQBZjZpPavR3og9GsZKyr5EvtTaXNL9aBe87R5htTGbTubIPy5sqL0YFJIfUK2XIjjSILFEerEUuYOlmDAMU6ZqSSmUIyDr/URClavEQ8yyUVdCeMTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKpOc3H+1FYLhHGKC3eCKcd+cP0Yw/7T/oOe9PJG0aU=;
 b=II6E0weYrpGxF2HKcAkFXVKEODDnPhbZ1z9cHM0+A/DVgTaYmXFWxsbKA4Ccn4ju4U/ZnR/QVbwNqvUACfaOKQ3ruYLD87jyq/aouA0rL27pbpt0VRckCAuHgxFe/Dn73RaGlPXkljPYvForSl0XzfKOAp2qngKRVAtqJWiOpBI0P0RVpN9zyywqpXzufn0UA9Z1GxRoSQK/dG0L52KIkK3E9OAzdl4EK9ByhDSWcoqFqnWzEbP0mFgBaBeI5EM3UQHmm4BqYtkNSNysku7WHpxfmnVE8guv/7qqKBXUQGym1FnKSZTYWacPA+kCw6E3On34YCfZWzY2yD1/FxWXIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5594.namprd03.prod.outlook.com (2603:10b6:806:b2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 03:09:29 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::6cf1:fa6a:fb65:131]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::6cf1:fa6a:fb65:131%3]) with mapi id 15.20.4778.019; Fri, 17 Dec 2021
 03:09:29 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] memory: Fix dma-reentrancy issues at the MMIO level
Date: Thu, 16 Dec 2021 22:08:58 -0500
Message-Id: <20211217030858.834822-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR12CA0020.namprd12.prod.outlook.com
 (2603:10b6:208:a8::33) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4432c79d-66d6-4246-fdf9-08d9c10aa393
X-MS-TrafficTypeDiagnostic: SA0PR03MB5594:EE_
X-Microsoft-Antispam-PRVS: <SA0PR03MB55949CCC87FCB671CDFFF5ECBA789@SA0PR03MB5594.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VCCk1XStVixvZLXWP0djIwOe1nprEvOa/27SlYWXtHAPiwlwS7btNn5pEjFuj0BqZQGo+eGLKBWzJu9xBcWwx4t7xpQ+Z/2Z2HOv+NgXhY2XXnbfUxZtEUJ906blJ0ldupuJAXETmyoj0y8NneVu3ZiSWxMKjJK4t10s5kVwzeZoORdeWtrH+2z6vEPUcDnskhoOX5IWea3e5iFteBgoAE+uKOaDzJxXeNAdzXJ37McG9qbw9mDcYbCRNb+DXEAGSnRTBWGOEeLVE+tZNzwFFyvL63mho75XHYYYB93iQNXIV64+lbm5UNU4UilI1q3kdsfJaYCPXZXvYz85/AaHfzLpHSI6tVI7XPLaZqgqwRnOKYI2ynm205YkR04075Q93Lh1YX5ku6SjWQ/G2Zg40zt0AkuZVv45Dj5Q4vG/aWrSY4VDdCPK127OjJ7UMGcQaQ8xhWUZ4KjIWkXgkOlOOwNDUYieQIhOhMZEIyF3MTKalJcE55tNq2hSSGGWaBTnYAbrlcCErgZ1dxzMcO6x9gVaRNDudxMIQET3hdhGybiZ8XiS376muTyz1NaXmClKQe6yaz1V/7xZKDc8g7fiE7ystV/GJZmO2gMRyDimAk/EZKEE9q8Ptq4Q7DEfSTSQo1aANMFxoNAPQkKpU1tnDoCu2PATe0f08nb5ymnbz/XpSlS5BoR3ucVA7+/+uLMwGUEiiQtPYdkfJAPpo8iFA4ZyJ/pe2y0ZPSMQYTFmhjeIZl3I7jsnnTb96MaTKM1vSeyuttlLwQMJSLYTKtPupA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(966005)(54906003)(7416002)(8676002)(2616005)(4326008)(52116002)(316002)(8936002)(36756003)(5660300002)(6666004)(786003)(6486002)(6916009)(66556008)(66946007)(38350700002)(66476007)(6512007)(26005)(38100700002)(6506007)(83380400001)(2906002)(86362001)(75432002)(508600001)(186003)(1076003)(45080400002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG5jLzJlR3VDLzNGU1J4QmFjWXM3RXZ4Y1hrYnViRjdheVBvNHRaNUN1YkE5?=
 =?utf-8?B?R29kZHdnZkVxN0VtMmtkRGt5cVlQQllJaGIzejdKVGl2MnVIMGZ4QVprN0dv?=
 =?utf-8?B?TVo0eW91YmY0NkF0YzZKaWJ4RG5LenV1TUplMjk2bHVJYWVOUHJ0bDR6dmU1?=
 =?utf-8?B?V0Q3eWNTVFNXRXU2YlorTm1IVmhiMkErMllpNzlkWlZZcGc0OGZrTXNtSE5l?=
 =?utf-8?B?amd5blRCbEVxUVNjWWdsbFFhMm45TmpieitLcFdidGkwOGNRVTZlSkF1YThl?=
 =?utf-8?B?RjJjenU2RnlFcURGeWdxOEFQMDRTaHBzemNiU3MrUE14VmFaUCs0NklwNTJM?=
 =?utf-8?B?Tm1oc0RUaTkzQXJhUnpzbWRtbE1rTW05VFBBRE9WbVJmQ1NPZEthWHRCczRv?=
 =?utf-8?B?NHkraGpvdnp6alFCZkxwNWtaMFExYklNV01PalNhaGVOdm1GUE84eVREcWtP?=
 =?utf-8?B?WDlldWlpVXRGdnFUWjh3cG90OWdoUk9SYWI2d1J2dGdUa3N5MnlzSVc1RGpy?=
 =?utf-8?B?ejhkTzg2bG9jSk1WSVd0UzlzL3JzSU9naEZ5SEZOVmJZV1pnQ0lNczdKWUIz?=
 =?utf-8?B?RmRSVWMwNjdFa1hBWENwZloxdDNhalVJZm1hd0owU3VRTDFBNm5PbUwyNlJ1?=
 =?utf-8?B?K2o1NEh5eEhOWnBqTXorMXdCclhsenlBMFVvZ0kwZUQ5RzNWaSs0eXZyQ3Qz?=
 =?utf-8?B?UUt4NjE3WG1Pck01TmJGMWhNMTJqTkxwUVBMT1p0cjZMNHAyQTZZb3JkKzJJ?=
 =?utf-8?B?cHAvQzg1Zk1XZlROM3VBRXRhSlZhWnZJYWJYMTRmVHo0dkhRR3V0TTMyMVFS?=
 =?utf-8?B?TElQay9Pd3hpZWNkcGxEMitBN2NHeWtCOTV0V1NGZFdDT3ZUVHlxS0ZYZWhB?=
 =?utf-8?B?Nzh0MEc3M2VOL1I5SUhrZzZWZzAvalB0c05zcWE1NlhtTVVTLzVIN3pja2ZV?=
 =?utf-8?B?T0xxeUFZUVc4b055eWR0c3ljanpHNmpJZ3Q1ZTIxRldhc3lGbUhrYU9xMDNH?=
 =?utf-8?B?T1pvbkRJWDZGUmFKa0pGbG15TXBTOUl3bHhGV2pIK3FPVTRSNzUwajBMei9n?=
 =?utf-8?B?NG1mbTVHUHdibGJlNzJlazFhdFJuVXdWN3hyMFJyOTFNQjBRRG1ET0NtbDRu?=
 =?utf-8?B?TEtRNk5MQzd3T0tKUHpXSzYyTUlpeFZYUGNVUDhaN1B0ZVczalBtaHBUVWNq?=
 =?utf-8?B?STd1UWhWY2xIdVUwWk1OMGpCbG9TeTlHZFdlTzhEVmFoNGw0akM4TVdoQTE4?=
 =?utf-8?B?SVBHb3VTVjVhdXJKTDZoeU1qUmNTZG0yR3AwOHkxRHJaV29hdDhvNEwxdk1F?=
 =?utf-8?B?dzk0L3g0NWR0TU1aaERER1ZMMFdpKzRWTDh4VGxLaGFMRkxyNFc3VXRjVzJw?=
 =?utf-8?B?ZWVKcDlyWnRYZW0yVDZ2SE55TDRKckw0eXpXSktjT3IycnV2VWRNbVozR0Fk?=
 =?utf-8?B?SFp5dlY1Y050WTdOSGFZLzFZU2tGY2RoTDFCY0RhdFBOdnFSRVVxc1hBMWNa?=
 =?utf-8?B?MUIrTEJpNGRUUnhqbEc3ZkJ3TVA1UEloYkdUSmtKanQ5UlZnWklQMzIrVllT?=
 =?utf-8?B?ZDFPaGVueDZSejByUGlWSTlQTmc5NmZIQitTRzJxQ2VwclA2clZUbTBVbjRr?=
 =?utf-8?B?Z2FIMUFSdmtweTVHTTlaNDd4bVE4Qk85RGo2WXZhaG9sZnpwRnlCREV3b21o?=
 =?utf-8?B?b0czdVE2TTVEVld4blV5djUyM1huSHgwUTRndVFENnhlNE9VQ3kwR29iVW94?=
 =?utf-8?B?TjkwYXVxWU5YWVMvdjlCK09oVDd5UjQ4eG4zZTNwcS93MUJTSnJQZEw3QWJs?=
 =?utf-8?B?eUdhcjZPUVFmeFJDdE02RDVWNDlXNEJvalFoSnhJSEtRaDFkQXI1a2lYT3F5?=
 =?utf-8?B?dy82dkwrQ1V5cEFJb2hhOVhuMnJyMTRXZTRmU3hGZXVxKzFUbVdpQlJNa0ky?=
 =?utf-8?B?RXV3bGQyNTRnQmpDYkh4d2Vrc3ZsTlZ2TE4rdHRRZ2FvT1NJUHljSnRVVG9u?=
 =?utf-8?B?bVpIOFY5cWVPdHVxQklrQzhzMjVhc3BmcFJieGdxRGJjSXMxaTIxUEZYSk9h?=
 =?utf-8?B?c0phMHIvYzZTUE1kcTV3ditLQTNsVXR6YmZWdz09?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4432c79d-66d6-4246-fdf9-08d9c10aa393
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 03:09:28.9363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIcdFQtkOLjqk5qbP9HMwWBSEAOsk7hqBPHAJNtmLi4bqxU5pV5ZlOK5p8FtSxdt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5594
Received-SPF: pass client-ip=40.107.93.104; envelope-from=alxndr@bu.edu;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here's my shot at fixing dma-reentracy issues. This patch adds a flag to
the DeviceState, which is set/checked when we call an accessor
associated with the device's IO MRs.

The problem, in short, as I understand it: For the vast majority of
cases, we want to prevent a device from accessing it's own PIO/MMIO
regions over DMA.

This patch/solution is based on some assumptions:
1. DMA accesses that hit mmio regions are only dangerous if they end up
interacting with memory-regions belonging to the device initiating the
DMA.
Not dangerous:  sdhci_pio->dma_write->e1000_mmio
Dangerous:      sdhci_pio->dma_write->sdhci_mmio

2. Most devices do not interact with their own PIO/MMIO memory-regions
using DMA.

3. There is no way for there to be multiple simultaneous accesses to a
device's PIO/MMIO memory-regions.

4. All devices are QOMified :-)

With this patch, I wasn't able to reproduce the issues being tracked
here, with QTest reproducers:
https://gitlab.com/qemu-project/qemu/-/issues/556

This passes the i386 qos/qtests for me and I was able to boot some linux/windows
VMs with basic devices configured, without any apparent problems.

Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Li Qiang <liq3ea@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Bandan Das <bsd@redhat.com>
Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Cc: Darren Kenny <darren.kenny@oracle.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 include/hw/qdev-core.h |  1 +
 softmmu/memory.c       | 15 +++++++++++++++
 softmmu/trace-events   |  1 +
 3 files changed, 17 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 20d3066595..32f7c779ab 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -193,6 +193,7 @@ struct DeviceState {
     int instance_id_alias;
     int alias_required_for_version;
     ResettableState reset;
+    int engaged_in_direct_io;
 };
 
 struct DeviceListener {
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7340e19ff5..255c3c602f 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -532,6 +532,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
     uint64_t access_mask;
     unsigned access_size;
     unsigned i;
+    DeviceState *dev = NULL;
     MemTxResult r = MEMTX_OK;
 
     if (!access_size_min) {
@@ -541,6 +542,17 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
         access_size_max = 4;
     }
 
+    /* Do not allow more than one simultanous access to a device's IO Regions */
+    if (mr->owner &&
+        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
+        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
+        if (dev->engaged_in_direct_io) {
+            trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
+            return MEMTX_ERROR;
+        }
+        dev->engaged_in_direct_io = true;
+    }
+
     /* FIXME: support unaligned access? */
     access_size = MAX(MIN(size, access_size_max), access_size_min);
     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
@@ -555,6 +567,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
                         access_mask, attrs);
         }
     }
+    if (dev) {
+        dev->engaged_in_direct_io = false;
+    }
     return r;
 }
 
diff --git a/softmmu/trace-events b/softmmu/trace-events
index 9c88887b3c..d7228316db 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -13,6 +13,7 @@ memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, u
 memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
 memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
+memory_region_reentrant_io(int cpu_index, void *mr, uint64_t offset, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" size %u"
 memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_ram_device_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_sync_dirty(const char *mr, const char *listener, int global) "mr '%s' listener '%s' synced (global=%d)"
-- 
2.33.0


