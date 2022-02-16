Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C274B8385
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:03:28 +0100 (CET)
Received: from localhost ([::1]:39500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGDf-0005l5-OG
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:03:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rohit.kumar3@nutanix.com>)
 id 1nKEXu-0007G0-Mt
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 02:16:17 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:58644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rohit.kumar3@nutanix.com>)
 id 1nKEXs-0007U7-BY
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 02:16:14 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FNO9nW001995;
 Tue, 15 Feb 2022 23:16:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=uC6X56heMH6nR1cRD523Fo+ZyYEw/++EivccWbTbUjw=;
 b=O540SqIzf0Vg7xxmRflu6TSpUBK0f2OEw1okuzSW5+4C3EGTGFeynayPmKuRtgnWrH9M
 XoEk0WNPc71+emZg4beRjM2NjNPeIohDNRGIckiQKiYeRd99QwWuldf06yuOP1cTXONO
 8u6S77lm1yZ9jFxDEYqe0eHtsas0Op20v7N5MV3cSiyJUZAXlMAqjBcu3ue8qkzk3PCE
 dtQviUzRpO//lAAa0vR37HXBXAebEEGydo+lz1VB0niqZtwe/0aGehn9b0de0WgLJGty
 BxIEdQDNCQJkapHuI028CVxvWXFk1fYosk+FXbl1glgDQxyT9aeOxdyqcPsjYNMmFsVR RA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3e8ntk0p01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 23:16:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtys0xi91OAFaGKafSSUa4LOr+yusQmw5mMgZpRSaFJ3/s6YshZpQ8Pk18QmHZ6uUNWarkN+0ZC+Z8FZJ7pgy8LItcHpMZhlYbVpzS8LdcQndQNlzv6pr939eQmRvO4SX1DCKfVtmxC7LOMgaHiYxF+vSj3G61M/90DPrU6n96g+vH3GHtuK2v8FipWd+cILZsCB+pElTrWbXzC+Ix7dL+A/n1jnjOvkZ9JklKu6mFRKCMCbWHcafYIWxUmmvX/CRdPJS8/kLYm/5GLBYE72Fm6xED4MOM5NzhEYr5l6BKAH/NI4Wn0QWnOPJE0a+sjo1RiR/Lprg6rR/M25ZVTg5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uC6X56heMH6nR1cRD523Fo+ZyYEw/++EivccWbTbUjw=;
 b=OlykTUQrJwhDxh8VghflDj6+22MizotiWgK5vo+PhLO664t9tmtvaEg+5jLg5hqlay2YquFMpyJz9K1mImzUTp2qhkxGY6XV9fQ6n4nQVCEBcqzKZktXnl6o3DkjCkJGXzXYmaMrly5hS6I7XKEt1fX16XJlLcEI2pgRsOxsaS7yaaXQh6b13PWQKh9q3Cfkeyh5piZZENCC3UJifIk8MyaPPUiZF1VHMGps+TFQFTgP6ymLBgkZdjVnb/+SJ1hWGd/gS6p6w3oGwaJbPtAxIV7u3fFoy+mIiA7zDG/erlFWUlIUsg9yk071xjdhvEcUlLzq+dOjzLMP/nIf2tkf5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SJ0PR02MB8564.namprd02.prod.outlook.com (2603:10b6:a03:3f6::16)
 by SN1PR02MB3823.namprd02.prod.outlook.com (2603:10b6:802:2e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Wed, 16 Feb
 2022 07:16:01 +0000
Received: from SJ0PR02MB8564.namprd02.prod.outlook.com
 ([fe80::f58f:2ec1:820b:19f1]) by SJ0PR02MB8564.namprd02.prod.outlook.com
 ([fe80::f58f:2ec1:820b:19f1%3]) with mapi id 15.20.4975.019; Wed, 16 Feb 2022
 07:16:01 +0000
From: Rohit Kumar <rohit.kumar3@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] Check and report for incomplete 'global' option format
Date: Tue, 15 Feb 2022 23:15:08 -0800
Message-Id: <20220216071508.412974-1-rohit.kumar3@nutanix.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:40::16) To SJ0PR02MB8564.namprd02.prod.outlook.com
 (2603:10b6:a03:3f6::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d544a49b-6eba-4353-de2b-08d9f11c2f7d
X-MS-TrafficTypeDiagnostic: SN1PR02MB3823:EE_
X-Microsoft-Antispam-PRVS: <SN1PR02MB3823133771D95D0254CF99C9D1359@SN1PR02MB3823.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:411;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MT4Tk8DIlv1IZNVQZFVhzbTQiXUguMcsvUIqyBbRYKW06xV+F50FSxzrhzgNrRaWrSJhM8LKATc5XntWLyMMjWw3ZV5GK9eJRiU+ZHDe+ZMVG/7GRUQD3BwCYjLilTrTs7bvGrUk1+NoDfuSwm6yJ6gf1FpPmX6vOHQ9SJhHmcJqW/HteP3p2FlJikG+655OC/nkZKHZru8bBRW1eQuoWa9yhuQFLUbrgj/eOTofPT64Q+kS17aMFwTP06WtRUGfxjE6DveWiZ6ZwFSm63qA/Fn8IuBwa57yY/hUCJ6dBH0PyVDHnckxrZjwZfHYiXA4TJ2Gv8d5tn8jfZ82tXazKD8KAIguh8Cp1x0sVE3exn52Rgmx7iHkRwkyrA0cJaWz05BCuqLT/7P7Lfw9apdw88mU6cCuzfkf1mFq/WNDLmU/mSseT4uZv9999d94PUozqBnXavpOTB6P14NSDffn0wPsCdx4dg3/dd+gqAGaCYMV3dmLeUR5QJHjclUgw5Sw1jia0oEzEmMbz8d6s/lTOZkJ6C5yEKl2WiMYIXBcFOQlzZ2ogSYc+QytibVEOnbFYGjlsQToMpgF52PN3YTFJSRP2NVIYxcVaFLkvCiLZvVBItljAh5i3iKVkAgABX7+l6r0hjAlUIT18Kh5lqJxWJ+DIZbr0tMkbEsmWY2MpFOY3lzcydCIvohsDUEYONZz6hRTFxkJ080kM5hn+kaGJKXchzHYGxKsNcbX4vsISDSiUvOH/CIgWKScrDUf4gc2568VzkSDmsFbpItdGkFTCG+CNUyB5J4yHH543ELS8Vg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB8564.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(38350700002)(2906002)(508600001)(36756003)(52116002)(6506007)(4326008)(2616005)(86362001)(6486002)(966005)(38100700002)(83380400001)(66946007)(8936002)(26005)(1076003)(186003)(5660300002)(316002)(6916009)(107886003)(66556008)(8676002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xwWKUUJMSRDDlabccwLfUzzRAgWmcN3MUsM5fEkNrhYYI2D0qdr/rak4eT4q?=
 =?us-ascii?Q?YdpsbRqU5Fz2Uc1FVGEGI9OeR6Vq1hnd+rXOIAdjTuAw9FYWiP32Vq8NsUEO?=
 =?us-ascii?Q?/i206f+ia6O4WcHPRpoThpJEMT1orsTwUidoE7rTpcihc27VagirjDrS04ZE?=
 =?us-ascii?Q?2hGWePBF1FxmsaCudbRJGlETrHTHKArsYp7yxj7JvRCNDMcCtSBt8kiHcaC1?=
 =?us-ascii?Q?TG7tZBbBTc6tMQzNpDJ1/9D4E80zH6wWBzeGUEXG4QKy8Y2xIEPDzTGv/kfD?=
 =?us-ascii?Q?W6HqgZPQbANLyZ7kvrP7qPbMIVj565RHyzh8iXL3lzM/eN3U7tv5ybRcw4nQ?=
 =?us-ascii?Q?odsjf+dc0PVwKP1cZy/TVPA9+SxLc81M3mL/0FTLMacBO2mfXi86yqoDtsRd?=
 =?us-ascii?Q?cxGf6dK8L0p4JnycirUuYmKCGzq8WZOHPhUv63q2blNWo3FZA7WOeBJBZB87?=
 =?us-ascii?Q?O/08qez619OlZ1Y3+zmYHHqncTU0AB39iV8Hk+ESHV2PT1TbkiXk0Z3yBsS+?=
 =?us-ascii?Q?M7un5jBfGnff7GwDWIEh+hUVB9oFcOAZ+9yCkOKzRSCBgMOYMRXOE84qa/AQ?=
 =?us-ascii?Q?2fVqPqPMdSTDLYqR4qO8teYq4pp9ddpQCF89m0UuL6KT6clYmrzQH63t/5wC?=
 =?us-ascii?Q?MIqtcTKHmQaTso8yobW/dpi1efklW8fW65qXvpakUoFqCsKhWPzSeo/5k0Yj?=
 =?us-ascii?Q?EDep5qBlRsa1+4VscGrSP3LguM5YeRT7R6aA2fvE8gNc05WvHYPkbctJ93iH?=
 =?us-ascii?Q?N8bDs049W3zKVBQN+jeJhvJ7odtCS4K0BYN1xs1O1mGdKFVEtpTTxNWMH02G?=
 =?us-ascii?Q?lVO/2Z9v3WCIfS/hzOsqjX3PnYFlhSNFPXog4u0J3kNFRVl/Xue03QDgVfdh?=
 =?us-ascii?Q?uwpLD9iitgRAf6p7E91M9C5f4Q9zETB4b6PnrF8xj8XnHVVBGJX1+QEMmEZG?=
 =?us-ascii?Q?JzldMJN40BrbsNNRrnorc0cS4KEPb+WRh54tWnbZ6dNqYL4OVW4OdAMWkQ/T?=
 =?us-ascii?Q?iYoszXFgR0Tt6WB/9PLPZ88L23ViODtuBcMjJ2ZuUD6YdhrAZLzUFfiujQvm?=
 =?us-ascii?Q?XeGTx0rb+BReQ30Xpfj1JCxI9Cwqh641Vk8lqxlyXygrKPNAdx3kP07M1RrX?=
 =?us-ascii?Q?Wz7EObA+9CM4S3id9j+yVtMogpx2z7YQ1osMkxnLG2zfc6bHQhdnHJYp1Zzl?=
 =?us-ascii?Q?C3Tr+CaTJiyMJn6zOwbp1MCJhWtPymnHjhkXJ2Y2NCR77tk6wpRSbUkfugHD?=
 =?us-ascii?Q?m9rjYB/kjp0/UYXWntnGaB3vMD1xUWCaEu3/DYExq6rjJQiY5YYlltXQtZNM?=
 =?us-ascii?Q?WZ95+Rsfl/bZrn3yvmFeC7gg9e1p3M2DGoeHSSbigCne4zUaWno4YxT/T+4O?=
 =?us-ascii?Q?/TgsYo7vvw0PFEUZVT7oWEwyTpmMKmz/ijQqP9f4Fpt1Oh0Xtasc50dJ+fvu?=
 =?us-ascii?Q?DE8EQVuyNEcSu5r/JA/RY+mTYNtAEKQiOxweF5MRolj2ciTLztCO0Sso5H78?=
 =?us-ascii?Q?ZvnGBO6evIE7AYeow54DBow8OJ0TnxLrpDhPiERNSscDUsc8uvQ1IgZQo6eF?=
 =?us-ascii?Q?zS7pFHMO+uwBmZR7CICpIzQdAcqFfKZrm74vwHKVKvrvD4DglpTZQhm6GTgL?=
 =?us-ascii?Q?VRFwkC4wAaCKXtRvHoNDDE2ojFBC1DK6c+3yuizChb69Fz9bPFvbE3g7fPjU?=
 =?us-ascii?Q?3Sud5/dPr6c6nx32Pr2A1crFwu4=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d544a49b-6eba-4353-de2b-08d9f11c2f7d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8564.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 07:16:01.1228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJ+2qehIMNeJTfAQw4luQnsqB+pwSquxo6LndAS7U6//L1DKFyfuZKGsRgu0ZjqV4+U2NfbsJa7IkRKb/Ac2iZlGeNKdhhdjFtttjDPBjkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3823
X-Proofpoint-GUID: HvVTeFJc0BCgvi2COqr-oac7uO78uFNd
X-Proofpoint-ORIG-GUID: HvVTeFJc0BCgvi2COqr-oac7uO78uFNd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_02,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=rohit.kumar3@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: eduardo@habkost.net, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, armbru@redhat.com, prachatos.mitra@nutanix.com,
 pbonzini@redhat.com, Rohit Kumar <rohit.kumar3@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qemu might crash when provided incomplete '-global' option.
For example:
     qemu-system-x86_64 -global driver=isa-fdc
     qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
     string_input_visitor_new: Assertion `str' failed.
     Aborted (core dumped)

Fixes: 3751d7c43f795b ("vl: allow full-blown QemuOpts syntax for -global")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/604
Signed-off-by: Rohit Kumar <rohit.kumar3@nutanix.com>
---
 diff to v2:
  - Avoided double reporting of error.
  - Added the "Fixes" line in the commit message.

 softmmu/qdev-monitor.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 01f3834db5..e918ab8bf3 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -1034,6 +1034,13 @@ int qemu_global_option(const char *str)
     if (!opts) {
         return -1;
     }
+    if (!qemu_opt_get(opts, "driver")
+        || !qemu_opt_get(opts, "property")
+        || !qemu_opt_get(opts, "value")) {
+        error_report("options 'driver', 'property', and 'value'"
+                     " are required");
+        return -1;
+    }
 
     return 0;
 }
-- 
2.25.1


