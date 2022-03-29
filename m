Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C624EA86E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 09:18:09 +0200 (CEST)
Received: from localhost ([::1]:40960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ67E-0001Bf-IH
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 03:18:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZ62Z-0006ik-KB
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 03:13:19 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:13056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZ62X-0002CO-7l
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 03:13:19 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22T41koI004386;
 Tue, 29 Mar 2022 00:13:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=aWpq8ynHbMCTC5tG3JF67oR8pzzbwd8Jq4ZPLYpS9lI=;
 b=aCgycyLyTnO/AN1k6Kkwsy2qX8LFkm12mhX52W5MCMaAT0LEETi7S49ceuJPV/amUQsW
 Z50YaWdQXxsOtj+49WNbjaYzvAumwFsh5uTmyb6XrbAcoh5YUyUGjOUw661MGNVte9Sw
 xxOqZrG4e5xOHMrguLyf+XPINIG06HV6d8b2eAJkiyDFCj972gS/Ystl80/TkTDwKBAL
 JfiJzOjKYh9mdi/jr2D/u9d0I0+x2QbJFRs8rsJWSX5x4SWmooYyfcDYimNonaE+RQ9c
 3MUXHUbZ+tZ/bn0L3IIjtiRTTEsoQMvKjW6kMPbCAqVlqgt+yQ1v4JfAfuYQGm1Msr93 6w== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3f20c9dc9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 00:13:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eh90OopDDtfqP/w1eEg7rE2TKrCoWjZeCuezDX+bWG9LQ3ezTpcN6ewOBHHlK5DMdHfj0UcZi5Tldj+ahKA+SmNFF4yoLEXdolceZiExl6nP3ylI7PBmKd/NdgTLC7rPrhrY4ezI6MthdiFaEbqp4/CWGaaZYi8m4Gua6REfmt8mgopmDg7LAbek8FO9l9QZi5gJCQdAhSnaarzSr7h4v5MS1S/ONeDYkpY8ndR6PaWZZxD421TA9llj4TLuUvrG5lIO3GGNfdTEd1XkCC54Lhu3LVgDDc22+vAhf2KK9HUop49JTejUuf5cq66gPge+Op6o4NjrSk/zAXBNds4YZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWpq8ynHbMCTC5tG3JF67oR8pzzbwd8Jq4ZPLYpS9lI=;
 b=exT9UieEjhKXoBdtTILjVh7DLchy8BFkgR1JtRD7jC4WBRSXIgGht55UG6A9eu0+n8mZiolKx9R/NC10G8t9GvLDNo9uJ+P4SHLAYby7yK0vREHhy1QaBHD0y7Cdv9Lxjrm+OYkX3HXx+zR0ihEjU29kPKAALSP3R2mKkiJ0cfoPhMiW27VMEJ2TjU4hjHPDcaESpEShX+X0Yskly6pQu7YiIDMa/S0F7c46WfY9ovaZ306D8Ck35dUFau8DtlWNLGaJdiElvwFW8Ehu5UlPc/wmxDtVjI72Pw4aeO5i2noZ7oMihAlxshrndlBP67VsqzF10/pDrvLT/WiAdeCIsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by BN6PR02MB2820.namprd02.prod.outlook.com (2603:10b6:404:fa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Tue, 29 Mar
 2022 07:13:13 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 07:13:13 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
Date: Tue, 29 Mar 2022 07:13:07 +0000
Message-Id: <20220329071308.200045-1-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::8) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adb359f4-b806-432b-a20e-08da1153969b
X-MS-TrafficTypeDiagnostic: BN6PR02MB2820:EE_
X-Microsoft-Antispam-PRVS: <BN6PR02MB282067357C4323C9A700A1ED991E9@BN6PR02MB2820.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VHQEXG6c7KNXnnJ38WZ+ZC+PL4MnrA0tsNU6VfDqMJ6o2UTYwAhX14U1siqk3Y9mdn0nBDiJHGcWxPNSuJGHcfXBy2THwZm8OhHTFKn2oT2s9wWyFmGtM+4EH3UPL1TboNgQiUjfyak4foZ/BbW+3ab2U3/l9MnUbcEYOuVBvgF7rbwy4O8f/BNHL6YfKe81AF0IoEO64efhNqy5UUmEW3J8JejDSJhRRa9JA0AwOsuX03bW5qivifjhkmV6rjHnraOjPO37WYWd4ytAEXlcLaRzcvcoAPDO0TWmPVaMPXy9GcCiZEa9RTduRk7TWfp5zR+dR+93s7MHpd5TB0N6BTPTJHcWIJpnIZFdTjwYajp/9QvQAJ1OYK43I11UYWUgW6fQbQqS8hiZzZyUvlr8VMrFPEM8PdWxipp9TKyE6/4FR+oskGOo9VT2h+fxGdC+6+AMQzRwlfehpgEGIQGcCZpSS3XunvyegM1WIgozCknKYmZSTMx/bPsjdATf1yoz+JCenJltiZ2H2WJUO3jzZF5mhq6FlfCLEvzC0wIA4VeJXVzq+PyRt74yFGWliwQrm3UWPvlYtPiCTTazm+ybBBoD3pQ/bZSYxSUHPLKrKBnQ3Q+OvP+vDp/pCDro3/hcTqLqNThJl/8Bv1ZpkMv4a2Vzrkp7boPucsg0LB27CMY8x5QYtDkXNnyuhaFyO9DfhedgGLpNe5bghWcTtVa1eQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(5660300002)(38100700002)(6916009)(1076003)(44832011)(38350700002)(8936002)(86362001)(2616005)(186003)(107886003)(26005)(316002)(6486002)(6506007)(6512007)(52116002)(8676002)(4326008)(66946007)(66556008)(6666004)(508600001)(66476007)(36756003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkZBcC9zL3lxMW9Jc2JPVnZobjBsL0hOWTVhR1cwbjlDRDBTcktScDB1ZlVI?=
 =?utf-8?B?QUxuVmxzckdjYlJGdWp0RzRPejRpaTczSDNBVVYyUnAwckpPU2EwaUVQcFMv?=
 =?utf-8?B?TzlEaEpIWWcwL3JmSElXV2tYV0h5ZkE4TFNkUWgrRjFNM2pieU5NbWRqSXJ4?=
 =?utf-8?B?Rk1aVXFEbVNsdmhyZ2N0Njh1SkU2VFBKbUNnT05pOVR4R2RRNjJBVUJPSkFo?=
 =?utf-8?B?dnhmZmt4LzZYS2RpcXVCQ2ZVQkpsS21MakNGMmdEeEp4TVJoSW5DNFJ3ajlT?=
 =?utf-8?B?d0xuV2xiMGNwOWZ3ZWs0Z2NpUG9QUEVheFdmS2JiMjdaVmNMNy9xZmpjcW9z?=
 =?utf-8?B?Q01kUTkxUDdpNkVweGdjUzloOVBMRlE0Z005YndHN0ZxRW52UkpqMHo3T3lB?=
 =?utf-8?B?SjlPTzVJVWc5VjlGZmFabHluR2luYm1kYVh4SmZGam1xOTE2S1RQL1hlRG9u?=
 =?utf-8?B?WW51ZXREVVhLbkdrNkZFV0xXbXRlR0o3RzVORVZsY3NLamNqU0NIVWN6Y2Ew?=
 =?utf-8?B?ZTZ0OUUvZjBFTE1ha1pDR2g2MjIzeEp3a3FUa005SlJGR1VycnJCamM3aTBK?=
 =?utf-8?B?KzhsL0pFNm00R28xanVHZk5jVklYUHc4T0hJSnVFN3ZLa0pxNTJjRmt1S1Bq?=
 =?utf-8?B?SDl5Rmo5T3E0TDQxKzQzUk5iOEZxQXJMeGZ5a1ZxakxERTBRZTFoVTN5bVJB?=
 =?utf-8?B?NlNSdzZQRGRTZ3NTTVZtOWVGVHBGN09GZGwzbE5CQVpyY2E0cEpmbEFwTy9H?=
 =?utf-8?B?VzJmOFVsMzJtSzVQN2h4bjNlcW5aOGx0ZUtHcFZOYmo4cWFxVjQwVVNpTHBT?=
 =?utf-8?B?WXZnSE1TcHNNMk9VTFBhUHk3NFNjaldvYlJyTFJoWXlCZ0JBSk4vME12RmRn?=
 =?utf-8?B?dWdXOGMzaHF2cGZmWGxmZ0lDQkNobVMrY0hvTmNtVm1rZXZsMW0wV1VGbGhq?=
 =?utf-8?B?SUliSXlZMFpublRRUGpYcThUY2x6RHd1RWdlMlIzdEZ6eU1PMDF5bklWd0F3?=
 =?utf-8?B?RkxHSHJDRE04UTBHL3ZsNTFRWTgrOFU3U2Fvek9xYWRxUXA5aGluZG9QTWhW?=
 =?utf-8?B?byt0emdFRGFJMnVra1ZxVXFwL0EveEF0dktLREVPV0hjZzhuWUNoVU1GVXNW?=
 =?utf-8?B?UVR4RmJEN0x5bHZVZlZJL1RFRDFTWEZ1OTV4b3ZxeUsvUlg0U1hkbk9GY3RZ?=
 =?utf-8?B?bGdOVFpzOTdaRHM3UzBXSnhLeDZVNmI5K1QrdUJCRGhtZUdueTh1QndDNnM0?=
 =?utf-8?B?OUdub2kxSEhBd051cGpnVytlUWZRanBJeDZMNHc4c1J1cjFHc3dlelV3K0RI?=
 =?utf-8?B?ZjlyS3BFcHl2ZEMwYllXL3ptSWJhWlBxQ3E2MWFjRzdjaWlMZDhJSWNjTW5B?=
 =?utf-8?B?ZVhYY1YwQ1lIN2RJRk8zK2xJQklhdmMwZGFDbzNxN2tkeVRkU0wyWHdwYmNw?=
 =?utf-8?B?Q0tHUnVwc3h3dStjdVM0c0xvM1VXUEVwcXdXcnJHcHFIK0YvaGpoY05GKzBI?=
 =?utf-8?B?SnY1ckhkeTZXVWNxSFNBcFdFVS9GVTdmRHdhUGI4L2NIaWRtZTJzeHFkY3FK?=
 =?utf-8?B?c1NXMy81NEdnbFlEYXNoM3cwVWVIbWh3L0VwS1QyWHJrR2NiU0l0OHVIcmJE?=
 =?utf-8?B?UzZpM01DaFBVelFaL1NsL3pobDdWZkM4ei92clRoZVJ3NWRwQ2tkTFp3VUNz?=
 =?utf-8?B?R1RZMWZmMmR4NGRTR1l4Y01tYnFRWndNWUZOSWJjenJsZHN1UzZrOHNTUFo2?=
 =?utf-8?B?Y1J6QXhwSUhNUGFRaEJZZnVObTIwaHJ3VFRTN2FwbUorc2Z5Wi8ydlZBMnNR?=
 =?utf-8?B?ZXNaN1h5QmlYbFdMbzl6d2NURjAwUGVmdG1ZYm5qZDNlOEZaR2JjZisvd0hE?=
 =?utf-8?B?aWUzY3U2bDZEelZvVjhxWklLU1BHYzJwaCtqMDc3UHlwQVdpOWFqSmdKK0pT?=
 =?utf-8?B?K1Y0SzZST1Fza3BJL280ODIwei9LWGZSRWVJaVlGeTZLQUZHM1ZHbEtDaFQ1?=
 =?utf-8?B?djQ0OWhzOTQ0WnFGeUZTYy94a1ExaXdqVVMwaTF5K3orUnpGQVNONGRKVXYw?=
 =?utf-8?B?S2Z0UkN3Q0VCeFhZUXI3UE9ISndXTEhCL0xxdU1WZWhMRUpiUG9GVXZGdk8r?=
 =?utf-8?B?cDM0NkxIMnRKT2pHbmMzbDNyRWRSSDVTL3c3Sng5cUk3aXNMUitWMjdMaHhv?=
 =?utf-8?B?VWJrRUU3NmNLaktRQ1ZQY2Nrd2FCWHFoMS9qcUZpVGVESzRONU85ZGswcWM5?=
 =?utf-8?B?am9TdCtPL29YODQ0NE1VUkNDSW1VMlUwU2RIeERJenBvSDJWQ2xidXNKZVdT?=
 =?utf-8?B?K0ZMRlg0ODgwSERqVjVlUjN6ZXNZMjBMUnRRaXd0MzdoQUhpaEI0WlN0ZTdp?=
 =?utf-8?Q?FzNEaW7dkWJbcuD8=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb359f4-b806-432b-a20e-08da1153969b
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 07:13:13.4179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBdcZXQx/CjO8zHvotptWfL8yG0wDdxPY3+J/xWa1sFZwwnnp4EQCU/zK3rteYcShi3P/0MOtiFEeGgDW1ycjyEzeJ50X6a5VaH8Y/897EA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2820
X-Proofpoint-GUID: Mbx61ulgYfYsgtOLgDsyBFR7Q0h9aD0e
X-Proofpoint-ORIG-GUID: Mbx61ulgYfYsgtOLgDsyBFR7Q0h9aD0e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-29_02,2022-03-28_01,2022-02-23_01
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, dgilbert@redhat.com, armbru@redhat.com,
 Kshitij Suri <kshitij.suri@nutanix.com>, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Libpng is only detected if VNC is enabled currently. This patch adds a
generalised png option in the meson build which is aimed to replace use of
CONFIG_VNC_PNG with CONFIG_PNG.

Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build        |  9 ++++-----
 meson_options.txt  |  4 ++--
 ui/vnc-enc-tight.c | 18 +++++++++---------
 ui/vnc.c           |  4 ++--
 ui/vnc.h           |  2 +-
 5 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/meson.build b/meson.build
index 282e7c4650..ccb6840a49 100644
--- a/meson.build
+++ b/meson.build
@@ -1115,14 +1115,13 @@ if gtkx11.found()
   x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
                    kwargs: static_kwargs)
 endif
+png = dependency('libpng', required: get_option('png'),
+                 method: 'pkg-config', kwargs: static_kwargs)
 vnc = not_found
-png = not_found
 jpeg = not_found
 sasl = not_found
 if get_option('vnc').allowed() and have_system
   vnc = declare_dependency() # dummy dependency
-  png = dependency('libpng', required: get_option('vnc_png'),
-                   method: 'pkg-config', kwargs: static_kwargs)
   jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
                     method: 'pkg-config', kwargs: static_kwargs)
   sasl = cc.find_library('sasl2', has_headers: ['sasl/sasl.h'],
@@ -1554,9 +1553,9 @@ config_host_data.set('CONFIG_TPM', have_tpm)
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
+config_host_data.set('CONFIG_PNG', png.found())
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
-config_host_data.set('CONFIG_VNC_PNG', png.found())
 config_host_data.set('CONFIG_VNC_SASL', sasl.found())
 config_host_data.set('CONFIG_VIRTFS', have_virtfs)
 config_host_data.set('CONFIG_VTE', vte.found())
@@ -3638,11 +3637,11 @@ summary_info += {'curses support':    curses}
 summary_info += {'virgl support':     virgl}
 summary_info += {'curl support':      curl}
 summary_info += {'Multipath support': mpathpersist}
+summary_info += {'PNG support':       png}
 summary_info += {'VNC support':       vnc}
 if vnc.found()
   summary_info += {'VNC SASL support':  sasl}
   summary_info += {'VNC JPEG support':  jpeg}
-  summary_info += {'VNC PNG support':   png}
 endif
 if targetos not in ['darwin', 'haiku', 'windows']
   summary_info += {'OSS support':     oss}
diff --git a/meson_options.txt b/meson_options.txt
index 52b11cead4..d85734f8e6 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -177,12 +177,12 @@ option('vde', type : 'feature', value : 'auto',
        description: 'vde network backend support')
 option('virglrenderer', type : 'feature', value : 'auto',
        description: 'virgl rendering support')
+option('png', type : 'feature', value : 'auto',
+       description: 'PNG support with libpng')
 option('vnc', type : 'feature', value : 'auto',
        description: 'VNC server')
 option('vnc_jpeg', type : 'feature', value : 'auto',
        description: 'JPEG lossy compression for VNC server')
-option('vnc_png', type : 'feature', value : 'auto',
-       description: 'PNG compression for VNC server')
 option('vnc_sasl', type : 'feature', value : 'auto',
        description: 'SASL authentication for VNC server')
 option('vte', type : 'feature', value : 'auto',
diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
index 7b86a4713d..e879cca7f5 100644
--- a/ui/vnc-enc-tight.c
+++ b/ui/vnc-enc-tight.c
@@ -32,7 +32,7 @@
    INT32 definitions between jmorecfg.h (included by jpeglib.h) and
    Win32 basetsd.h (included by windows.h). */
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
 /* The following define is needed by pngconf.h. Otherwise it won't compile,
    because setjmp.h was already included by qemu-common.h. */
 #define PNG_SKIP_SETJMP_CHECK
@@ -95,7 +95,7 @@ static const struct {
 };
 #endif
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
 static const struct {
     int png_zlib_level, png_filters;
 } tight_png_conf[] = {
@@ -919,7 +919,7 @@ static int send_full_color_rect(VncState *vs, int x, int y, int w, int h)
     int stream = 0;
     ssize_t bytes;
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     if (tight_can_send_png_rect(vs, w, h)) {
         return send_png_rect(vs, x, y, w, h, NULL);
     }
@@ -966,7 +966,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
     int stream = 1;
     int level = tight_conf[vs->tight->compression].mono_zlib_level;
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     if (tight_can_send_png_rect(vs, w, h)) {
         int ret;
         int bpp = vs->client_pf.bytes_per_pixel * 8;
@@ -1020,7 +1020,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
 struct palette_cb_priv {
     VncState *vs;
     uint8_t *header;
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     png_colorp png_palette;
 #endif
 };
@@ -1082,7 +1082,7 @@ static int send_palette_rect(VncState *vs, int x, int y,
     int colors;
     ssize_t bytes;
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     if (tight_can_send_png_rect(vs, w, h)) {
         return send_png_rect(vs, x, y, w, h, palette);
     }
@@ -1233,7 +1233,7 @@ static int send_jpeg_rect(VncState *vs, int x, int y, int w, int h, int quality)
 /*
  * PNG compression stuff.
  */
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
 static void write_png_palette(int idx, uint32_t pix, void *opaque)
 {
     struct palette_cb_priv *priv = opaque;
@@ -1379,7 +1379,7 @@ static int send_png_rect(VncState *vs, int x, int y, int w, int h,
     buffer_reset(&vs->tight->png);
     return 1;
 }
-#endif /* CONFIG_VNC_PNG */
+#endif /* CONFIG_PNG */
 
 static void vnc_tight_start(VncState *vs)
 {
@@ -1706,7 +1706,7 @@ void vnc_tight_clear(VncState *vs)
 #ifdef CONFIG_VNC_JPEG
     buffer_free(&vs->tight->jpeg);
 #endif
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     buffer_free(&vs->tight->png);
 #endif
 }
diff --git a/ui/vnc.c b/ui/vnc.c
index 310a873c21..8376291b47 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2165,7 +2165,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
             vs->features |= VNC_FEATURE_TIGHT_MASK;
             vs->vnc_encoding = enc;
             break;
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
         case VNC_ENCODING_TIGHT_PNG:
             vs->features |= VNC_FEATURE_TIGHT_PNG_MASK;
             vs->vnc_encoding = enc;
@@ -3256,7 +3256,7 @@ static void vnc_connect(VncDisplay *vd, QIOChannelSocket *sioc,
 #ifdef CONFIG_VNC_JPEG
     buffer_init(&vs->tight->jpeg,     "vnc-tight-jpeg/%p", sioc);
 #endif
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     buffer_init(&vs->tight->png,      "vnc-tight-png/%p", sioc);
 #endif
     buffer_init(&vs->zlib.zlib,      "vnc-zlib/%p", sioc);
diff --git a/ui/vnc.h b/ui/vnc.h
index a7149831f9..a60fb13115 100644
--- a/ui/vnc.h
+++ b/ui/vnc.h
@@ -201,7 +201,7 @@ typedef struct VncTight {
 #ifdef CONFIG_VNC_JPEG
     Buffer jpeg;
 #endif
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     Buffer png;
 #endif
     int levels[4];
-- 
2.22.3


