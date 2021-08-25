Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EE73F7647
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:48:26 +0200 (CEST)
Received: from localhost ([::1]:48320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mItGJ-00006C-3k
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItBF-000634-SK
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:43:01 -0400
Received: from mail-dm6nam12on2127.outbound.protection.outlook.com
 ([40.107.243.127]:2657 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItBE-0000OG-AY
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:43:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gc/0C9pH9bE0/z6MV6P5Z07NCHYJQuNY+O0JQQpJeHLjmlJuGr/C3/lwb1i3/8GyrYWa+CFROx6qi+p3lz4YpnP6xF4pItpDZmjnMTC8UuRl9gdJWEJB0hZt28Rjag6JloTXzOmgXLSOB0SstlzBF30Vc2inezPyfdOx3/1HufRMAUotXPdba9cOYB1jc88sm23D9ifcLU+pwSvHdXuiO2oXTFVcvEpeP10x3nMtr2h6v9e/WLshDU9E5y6pTG91K3eiEZ8tpDrc8slzSO7Oqu7uIbluUW7+ra5fi1BcMykp6x4u2KBOKtEmCQO5fK/2HjCscDv5e6naeeoYiHmwKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/K0LlkG26vz3DS946wlEBDOprWMRTfAlc0FJqw8l1LE=;
 b=dG5Hg6VYGBQlsRytWv1bUs1X+q8UCAtFiuDZSGOJBejkNP5gKlQ448Bxeipx5DOAD8NkWfcje4CXg7Txypwd0a+FQCNlVU+e8Qu5fTdkLM24kxpPemc6FPjxWZnBxqj4AnZPFKIWooGUUWk2lcBnvszksKaoEWcfPShmqfgBP8MdeRQDt+5tgZJ//kDbgwROTJRZINPjT/dDlq5KQGSXW7VG7m1EGKj0p4d7Wckd+iM+YlQ02cTNRzfUVAJb4Qaz5lYnpFGll6WpPsBkL2/Nws0cALh9KG27tDvzMNxwLs4ACScKwoDJj+fnwWrzZLA0M6GI7cUEf7BXs9Q7XXMH3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/K0LlkG26vz3DS946wlEBDOprWMRTfAlc0FJqw8l1LE=;
 b=o47e0ZuYlc38QJWQXAP2ZQVBbg8aOZG0mXf+6n5Wltj2+hG4/qgim7mpyfPMbSmbvEjkLhggzFSxI2O1iL/rXd9n55POrBHCBSpAdgHLyxMQ0apUGkakgbBclXT63UfurW2StsKu+liF8RzVBo6odrR4jOxb9RDlO3uYe15LC6o=
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
Subject: [PULL v2 7/8] MAINTAINERS: Add myself as a reviewer for Device Fuzzing
Date: Wed, 25 Aug 2021 09:42:31 -0400
Message-Id: <20210825134232.45074-8-alxndr@bu.edu>
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
 Transport; Wed, 25 Aug 2021 13:42:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29b3390b-d305-48a8-af15-08d967ce3c88
X-MS-TrafficTypeDiagnostic: SN6PR03MB4399:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB43995A76527F5FE327414B98BAC69@SN6PR03MB4399.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bI2ZAXPROL7J4BvmH537tiTuIbnf9klnhoZKufT2d/RUMtqu7TLNp+BSAIt7/nug2+UAeQ4uWB7/bwkcmQuq2SHtKaGRx4K/TV62wm8/rY6Ra8axh3J5Fdqto/q/qMmZbfiswh3WdLmugEBvf84ssQomYWNlmJoV3UHybzYTU9uQh1+sLMO/OArVLz0625cl+IaiIc8KTJUEq6PQxadHXsM7+JijWQMgiVOfEgt0cmbCQScE81CHW8gdBXRONUgNXAg4hKP32WwrKEBVAkCTJhQkHBZ/B56FxKG/Fp8reR3csw27yNqwpLy/I843weKX1PupFX4kV993e3MAEJWSp2MVohNOfycOwSteAWba4oakctM5ZqlmGaTQFU0KKXufE3ofYt4FeQ1qdU+GiK3uRdGrOtY64YkmvBLff2mMnoFNBP1ji7zip4zKyHnk6lD95RgMJjj2IqERBPKOtRPdkss+zLWh1SjhPpTKDFd8mlRNG7JjNTqoDS02fBXEone5mwmJDfyxNRmpdgWzcXt9IIqBWjIp48Geg2QWV+8WDGUVZGP6LIwYQQKvBYLBv5CQk+UNHuWQK6ASxB0jKG2mxNNQ6+w28MhrYKUOR/j0T8Iw3uHHFMiyT1Kw3P6GJlhcqF9JigYDK+qpo7TMsTa5kxoq1ZvSA9VGKNghsjKI9ZmtzkksFIhIrloTpD36IgW6SG0hylkYuHmXc/ni/3w0gA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(66946007)(52116002)(4744005)(66476007)(75432002)(86362001)(6486002)(2616005)(1076003)(956004)(8676002)(66556008)(8936002)(6512007)(36756003)(6666004)(4326008)(26005)(316002)(786003)(6506007)(54906003)(5660300002)(186003)(2906002)(38100700002)(38350700002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODJMRGs5SzBDVzBPWVZETDRUV0tFSXIraUhTOWhJRG15R3MrcTVqZmlNWjBE?=
 =?utf-8?B?R2Z0aXQzN0VwYlpaYkUwdjNQU05BdXRKOTltOFE4UnRjWVhlY3o1Ny8vWE9G?=
 =?utf-8?B?dUYvOGZyMHMxOTZqWTgwMmk0NzN1U2hIVkFTWWk4YldLN1oreGFxZVpSQ1p6?=
 =?utf-8?B?ZE01bHhac3o2R1c1UVAvbkxoamJURThSend0c2FrK1ozZW9hcE54WjlLekRU?=
 =?utf-8?B?cDJNU0hhZXhyYzZUR2Z0TzNoRTBKbXZRMHFobUZCb0I2Y1UxWTVUNkRuby95?=
 =?utf-8?B?NXE1OGVMWmlLNEZmMjArV2YxQUIxTHV0eUtkMTF4bDAwamRablQ5MnRQajJE?=
 =?utf-8?B?T0Nqd3lSWmVPZjlPeHd2OUFjRzE4WHNLUW1kQ1JmdmNoeWpqRTgvcFBuUFVj?=
 =?utf-8?B?QnQ1VDMxUVlKbG40WGEvbkNwSHNRa2VhNGhEakh6eFF6RFNVOUlvUU5ZMTFH?=
 =?utf-8?B?NnVvVkZVZ2dKaXJ1elRXNFgwMEN0ajdpL2RZYkdxaCsyTEJ6VFM4YTFqN0R1?=
 =?utf-8?B?R3pUY1ZhVFgxeXJWZ0lObW9BU1dJUkJKeEhxMjM5b3JJZGE1a2QxanFjMnpD?=
 =?utf-8?B?UmlPQ1k3SlBjbjJ3LzdraGl0clBZVjhIZFpFdTNBbUxEaXlRd0FrSSt3Zk0z?=
 =?utf-8?B?aTFhMTVkay92TWpHa3dWdzhrc2xpR0krcWYwd25ZaEdPdkI2bmJGVXRiVmc1?=
 =?utf-8?B?bytzSlBPZ2ZUREQ2TG5acUpEdjhVS0laLzJZcE40OFFxcm80a3BDdGk3d2hR?=
 =?utf-8?B?NWtnTDg1bWlhVk51QXJwUjhubjRqY0dxWC90RFlFK0FQNXV3OEdNMUVPRjVM?=
 =?utf-8?B?cWJVYm5Nd0N0bFFGTU5qYmVZd0ZRRW03S1ZqOWxmNHMrdHpzeTg0UWJlL1BX?=
 =?utf-8?B?UGl4aHhBZkpUb3pxLzQrdlA2MzZ0a0h0REhPWWFYRnlFRFEveThWSFUwbzI3?=
 =?utf-8?B?aHp0TXgwd0gyNmNVeTRsSHJEM0pCbnpkTXBnRVJhTlBrS3NiMmJ1K1hLSEZS?=
 =?utf-8?B?Mzg0TGwxdGJCcU1yNE90amtEa2lwcW5seENuVVJkVVhPYWFuK0VOeFNFeHRa?=
 =?utf-8?B?YS9SNzRGN0ZKQlFiaFNwZ2VFQzRMSVJmL1NpUDdrRWlRY0dGNThRN2NtZFFu?=
 =?utf-8?B?R3QvRmpsZ3FCOVh6dkZLZWJPS2hPYmpWN01qTmc2RjEvcVZZZzRzb1FtSnA0?=
 =?utf-8?B?RXBON2N5M3l6VXF0Ry9ETXA2NVZFQ3lkZk4wVGtlaG1tUURwZFUyaGRscXVt?=
 =?utf-8?B?MXBDc1Z2VC9hVjlOVHhqNzJ2K0FyUjVjQzE2bmk5M3Jac3EwN0EyUWtEOGs1?=
 =?utf-8?B?clNjY0V5MFhxbVZrb21qRUNSbFg4RjlpejVxZUZkdzhHZEwwTFNBenV0NHlE?=
 =?utf-8?B?UUVxQng5em9nM1FBWmdSbXhlTTMzbWFhMnFjQTNsM0E2L05Xa2RQQUJHZTFJ?=
 =?utf-8?B?RjMwc2JzZE5KcGlpUkdmSXdjRmU0RDVmY1premRJVEhQdk43NVhhckRjLzBw?=
 =?utf-8?B?bFpMeDU3akZJWTlJUXErSXUyZndDMHk3eG1LR1VIRW1WSkxFRG4zYzhiNkdX?=
 =?utf-8?B?cktMU0xudDd5VS9zSkRyK3kwbUZDd2JVK0c4V0FqKytBZTBPb2FOemV0ZUhX?=
 =?utf-8?B?RFZYcGczUlhDMXlMN2NXMG9OQWQ3cFJ0ZXhwVHNnd1VYMXB3OVN0ZW1SOEpD?=
 =?utf-8?B?ZXhVRzgrRFVnalV2cDd5Yys0b05yRytTbE1IZDIzRHpQNnF6TEJlV3doenVC?=
 =?utf-8?Q?79FR6lPap/3HX9osqSDzwgSU6IXxSFbuV+jB53c?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b3390b-d305-48a8-af15-08d967ce3c88
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:42:52.8629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHcjXpW/AaAJ8qHszQGSHcIQPzW5uIrBn+FCK1Yjq4Gc1GxDuPKjCHdFFLwxTbbA
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
Cc: Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Darren Kenny <darren.kenny@oracle.com>

Should have done this much sooner given the amount of reviewing I'm
already doing in this area.

Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6b3697962c..5bef084ca1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2706,6 +2706,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
 R: Bandan Das <bsd@redhat.com>
 R: Stefan Hajnoczi <stefanha@redhat.com>
 R: Thomas Huth <thuth@redhat.com>
+R: Darren Kenny <darren.kenny@oracle.com> 
 S: Maintained
 F: tests/qtest/fuzz/
 F: tests/qtest/fuzz-*test.c
-- 
2.30.2


