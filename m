Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A433F764A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:49:39 +0200 (CEST)
Received: from localhost ([::1]:50706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mItHe-0001kD-GK
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItBH-0006Bv-Sg
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:43:03 -0400
Received: from mail-dm6nam12on2127.outbound.protection.outlook.com
 ([40.107.243.127]:2657 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItBG-0000OG-4a
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:43:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFbWLYf4EEW4SouZfIBoGcJMqn7dLEc9B5+u3zFsvnbfqrug2FOl4ciXoqqfyS6ZC7L1pMgO6oXEMAtXVzkgtls0Y5JMZn8X10HIcOCWnYKIc5eAYrHtZW8lUUiDTyUQPA3OqxImy3NrOyctaTl1xCgfajeksfZeZftdqAhrb78D59LK8lgB6rbXzNiQnHjJb3hoAOojyh8YTgupp5zjLU2PV6N6ZF/15m/krj7HQFzsFaGKzOBwIEUlwQHGRzTHfmycU1DaBx9W6R47iQQzyFF5Ae0khcHMiXH1jlIVXCtkCL2md0eCxkeSvoaeH+R6kpbkDkFfoFiWXAnAl8xNVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8y7fAv7xVpWUn7zCNt3QXu4XFGUmA2uznSX6GRMyeY=;
 b=DLKDPneDLJzDO7Qfo/3AnlGhiQW+6mFwldrrsxnD7mgXp/hehj+EvMytmPECKE2R4DVIMviBUp0el8Ejg5ilLtGWmRTocBcPN6Ea+oyNWg2HczKFtLHbeG4UULmlO+nLjQB2MVz7TJplsGBwqT80uXHpi/2i5XhhZ+/Vrzjh+xaHBdw6FzMUOYmyFkWGJXX1FWmhtaOtDCvw1oO92sg7HqjAgmYinzerlgymA7qbXUJt3voDEWngp0MitBrWydKb9xPayIwe7pyWVQQHDPuyTJLBOBK5UtnSF6SRA/HcAA1mN6aRRVB2Z4DyfHLdLRIX1Ro/9IHqxePLxvLwVHmkIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8y7fAv7xVpWUn7zCNt3QXu4XFGUmA2uznSX6GRMyeY=;
 b=IFiSeEBSmKLAr4I39qzErn5BGqweINa7ru2bbDLDdD7yYk9USdZL5q1rVeHFWYnSxWVXXhMBhQnDXyTdSQurckRv23u+WE5uXhegNo4eQN8QJYiTzrONd7FK8W/iwypsubrJJu/+l8ZXvCWcF9u9YBXbQQD+nCAFs+hP4cPf4yo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4399.namprd03.prod.outlook.com (2603:10b6:805:fe::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 13:42:53 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 13:42:53 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL v2 8/8] MAINTAINERS: add fuzzing reviewer
Date: Wed, 25 Aug 2021 09:42:32 -0400
Message-Id: <20210825134232.45074-9-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825134232.45074-1-alxndr@bu.edu>
References: <20210825134232.45074-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0016.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::29) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR15CA0016.namprd15.prod.outlook.com (2603:10b6:208:1b4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 13:42:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9133ddf2-ed4e-437d-7ed6-08d967ce3d0f
X-MS-TrafficTypeDiagnostic: SN6PR03MB4399:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4399AE59590F33121B87A604BAC69@SN6PR03MB4399.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:254;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JtqqldHEsvWC/o+BxlnVWf6Js53o/hVf7G7aGDtZpy2bk6ZWVXmcY5lCItGri0YckF2/XVMAadRxWGZE36bBMRMVZV3yyhvIR0HnrTfTXinyvAE63IMG3OWucILZ3axhiqR9g0DV+HlVdztFTYkvJkhZUjC7IlUVzgnxGb3AOQFnp0ZR+Z9gcMlIe7JYLAclpAJBJbTABQeX4KdMwM5oo2mGfqWKlpAeheGdCZIdCOhw3oXa0w+4ggsYBpuHrH77D6sprfl59Gw0fnU05e3k0JjJtLPUI7v8/qiW7Oep4Na+vPsz6kG4RQ17njTyLGN3NTmEFxv44xlv/iz2GuVLvKctLxJwcLqhresPAZeYB1ekf479x2M0D0HvmcFp2DSNVlPM36Mm4VETxItS39tbVEaWmM1VdsaueTPFlDgIHStwRqPvVmRMntbD7OXV/YNhm/PiJKAOc4aKXOqEwInOOgruVZqf0V8fOWqTxuAPJvYNx5FTxPxMDP4LTAB/hG+NRuDCHpIWGzG2bZoWy6dvBKDmI8mYMzjT9m8t/ZSouz0ptHtCJhfb7hUNzP6lSpbtvzh8I8at6ESxfc1x6H+PmYYL8cuo8lWNzvk5xB9snEy0P8RkCZ0KKakCjcwT03cdKpIKMTYelOzA6dSPCxu3a9aw+Eu/HhoszXCTGpfJt3M/4V0u5zwD0foNf4wJ5JmqTyv6VGFTQ0jnL50sokNvecQZUZGsMvwcnIIrftvVJzzM7fjE5v/k1vc1lt2j9v1x3YevfYc5ZFvElQzJ1u8XKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(66946007)(52116002)(45080400002)(4744005)(66476007)(75432002)(86362001)(6486002)(2616005)(1076003)(956004)(8676002)(66556008)(8936002)(6512007)(36756003)(6666004)(4326008)(26005)(316002)(786003)(6506007)(966005)(54906003)(5660300002)(186003)(2906002)(38100700002)(38350700002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elRpVTluam1PYnNKUEpMdCtCaGRkNmtUOFhjcGVXRmZRUDBSTVlkL2gvOVFz?=
 =?utf-8?B?OHUyRkVESTJqRFNxY3VZVEx0ZjN2bzVsZndrOTU3UmtsKzN5NmJ6b0xkM3h5?=
 =?utf-8?B?OTVFVlNlSXQwc05IWUZkNXF2MHRybk5NL3UrQjVCcXJyNlIzZzdna0dSUUUr?=
 =?utf-8?B?V1luQUZNbnZ4MlJUcVh1REUwd0VUZDdyWS9ZbnFnNG1sS0l4dTQxL2RCMVBO?=
 =?utf-8?B?MjRoYVA3VjZmWkJ1cWR1L3pTNVBnU1g3U2FNUE5LZ1crTlVneXd4QTc3RWFB?=
 =?utf-8?B?V2RLQ2Rsb1l0SHdaUEJZRHlkb3JFZWZ0WGNCQXErekRnNzY0LzJEVzJSOElX?=
 =?utf-8?B?ekVEcThUZGxMYlVxUTVYcUE3Zy9UenRuQlJZakgxV3F2cnpCZm1lSG5oSWtG?=
 =?utf-8?B?RGEyVU5iczZqV2xhMHFvK1N0aXJSNHpDQWtZeUNROTU1ckhQVTkvb2dtK05U?=
 =?utf-8?B?YnpTenM3Qm4wNiszVU9DYjRVYVBKV0tQTXAvd0ZsYW5TUlhpYWU1S3Y1Z3Vi?=
 =?utf-8?B?R1Z5ZkpsemFyNzBWNmdybjJQTVYzNWZtbTJvaVpKQU5zZ1JPYXg0ZnBvMkw1?=
 =?utf-8?B?c2JxenBZeFB5Rk1tTVhrWXJrQkZHRkNwbGROZi81SXJHNnhxNmc2T3NJVGhR?=
 =?utf-8?B?b1o4RlZibVBKemk5dk5Sdk13RFN6aktHNjh6NlhpL3A1aHAzZk9uQ1VWSU1Z?=
 =?utf-8?B?REdzNXV6NWE1ZXBUSDZHRkFoT1VWNlJDOE55UStCdXFiSWpCdFFSSmtFOEtH?=
 =?utf-8?B?UmtqbW5walRUNmwyZVlpSG1DcHVUK2tHa0pIQnJqSnJmclR0NVFXZys3Z2lN?=
 =?utf-8?B?OGRzNk44Z0xWcTBwVjdBYmJ6dGRjTjUycW1sVmJVUUdEeE03a1ZoT1o0azJn?=
 =?utf-8?B?SDhVMEpEUlBCd0dkRnAzRFdiRVdOVWpqRHlUbjVEdUQwSXRqeGNMWHRnSHh3?=
 =?utf-8?B?MVhlekdjcWt6Zlh5ZGlYcUxVMm5lVDZ4dUk0U0ZCL29tZmlUTWtoZUVBUk9Y?=
 =?utf-8?B?eiswYVd1Wk93d0FmenBKaWs5UDVmRDR5aFNxbFVvVlY2WTVPaDcxSm94cUlS?=
 =?utf-8?B?QlRzRzhlR1ZDM3BWS0ROcHlTUk5qeDBhV3JiZEtCaXlRWjFFaG5xQ3BUcXF0?=
 =?utf-8?B?Y21QK3BTdmpmNS82N1dYT3ZZallCVXAyK29uaUNoSEZXdGRzSkpydUdPZnZI?=
 =?utf-8?B?QUVPMkNWZHp6Q25rVG1iZkdQKzdyZjNJMHNNY1JpSkovazYvQWQyeVN4alV6?=
 =?utf-8?B?YjEyMGorMUlJVGRJZk1YcUJYdHNlQ3ExRGlIMVB4bWZEeHp0Y2RZOTl1TGl6?=
 =?utf-8?B?K1M1Y2JZeUlBV2U1OWFHMzFsanZxWTFRbjRkbEZUMGZlTEhveVpnTERlQzNR?=
 =?utf-8?B?YWpSSG5TbWdtcmlBSXpZQms1QVI5RG9JY0k5bUZsWG1RanAya3VjQVVRTS9i?=
 =?utf-8?B?MlI5MG4rUWpDSWo2dkNUYjNpc2M3L2tjWVUwODVsWmgzTlh2RlFRT2dMUE81?=
 =?utf-8?B?aEFKWnNLaWVOZXNwT0xiRUttSGwwVnIwcWZiRlcvRjJNT3NtMWc1VEFCamls?=
 =?utf-8?B?NFBMOWRwMVRnZXJCcGJUWmpiUGo2Z1JWUS9IME9VSjllWXNSdGdQY29STUNO?=
 =?utf-8?B?Rk5xOW9QdkZaRFlzd1BHR0pXdGtjWnJ6Wmk0eERFOGtyUHdCTWVwZ0NGOXZv?=
 =?utf-8?B?dFBqQzFJMENpcG9McVZhR1Y2dVNQYU56bXZxWHVtV29HTE5HNUF6Z2NjQUNp?=
 =?utf-8?Q?LqJ73q8HDPC+ctDiAPAbggNBiPUq2j2dkLMmXxK?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9133ddf2-ed4e-437d-7ed6-08d967ce3d0f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:42:53.6614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9U4uGIO3iYpXiJvvji2Ws5Xr3zOiDx31SumYzw3hzt9HqgjHQc9RtKaQkCAUJMb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4399
Received-SPF: pass client-ip=40.107.243.127; envelope-from=alxndr@bu.edu;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.89, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Qiuhao Li <Qiuhao.Li@outlook.com>

To keep me cc-ed when something changes. Suggested by Alexander.

https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg03631.html

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5bef084ca1..be840225c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2707,6 +2707,7 @@ R: Bandan Das <bsd@redhat.com>
 R: Stefan Hajnoczi <stefanha@redhat.com>
 R: Thomas Huth <thuth@redhat.com>
 R: Darren Kenny <darren.kenny@oracle.com> 
+R: Qiuhao Li <Qiuhao.Li@outlook.com>
 S: Maintained
 F: tests/qtest/fuzz/
 F: tests/qtest/fuzz-*test.c
-- 
2.30.2


