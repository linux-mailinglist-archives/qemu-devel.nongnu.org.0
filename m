Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C670E3FD913
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:56:39 +0200 (CEST)
Received: from localhost ([::1]:45682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOr8-0006xf-SS
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mLOlJ-00071v-Cv
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:50:38 -0400
Received: from mail-dm6nam10on2092.outbound.protection.outlook.com
 ([40.107.93.92]:59136 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mLOlH-0002U7-EG
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:50:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaOrR721klfR/sY9bmJrunVUuOpZhTU+VKAnIKiM9hGEjfv11W8G9NIAFcMcOLBQRjWgH9j6DN7ya0Sfqitfx9dEe4eP5tzbLMqWndSNbLCbSiLFbpc/upDNFPnwIK7iYpkR1iK9a3Gj3f5EzyPAhR9iCw9B08WtnIVidoUHU339gMaSI0FcTN/LdmfWsAL/2Zc+p4jPMQQkHf3XmcJMsyUsRJzutxy0DuZhA30p7aXmP5SGqthhZ+lITN8Bye4KtEgeH4e4bLsF+Is5bZ5p9ghOMs0cT2mVvIJA/aOvSUrZv4qWuvfpntS21gGCrRzpdRJmV4YglP6s2wpXt5zG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=A8D8LxN617mqIUJYx3IJYatJk9LPcKg3RqTpSeu0hpc=;
 b=MYHpi2S/p9Q/eoAfrdGtVpDwBBKKsGoJmuloTpp2oY09UYSRnStYqnHXaC1dYzsI7tsuwIPbTUR/fcdnBq6Xuqha24DASeJN5JNoNSF+Oawtae+3e60XiX8mQoJfMfYz/ThhJIwysOKX4gxl8yr0A7HphrIBlHj6XY92oIt8hQhAeTxQ0DL6rAAY4h2KQwU6PpzabiEp5DohC5fXje86bBDordurNEfl9d2Xk7OyWUSOc/XvwQxG1V8r0wn80AFuDC83WI8E6PvlIN2laBIHOw8JYRKJDc9Hl+BuYBkNP346+rugqdfBV+J56UWit1nJkXJr0pHrNKr5N0EVgr2YBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8D8LxN617mqIUJYx3IJYatJk9LPcKg3RqTpSeu0hpc=;
 b=Fr0HbiuaP0PUZbIDHTZ5FTmGN2rXgaLOVlxWVnvHkpDGIHqeUUiTAmE+nK0HV43Ky8z+1ojFqzK6NqAdggTYpecbRSmZLFtTF3d4F4LqPF/sCRVmtsf4XtWRWhK1lFgcG/JV084sCyBiCn07MMhCBo3a0x1D9DUa1jx7/WNSl9KGYA9IioHDFCVOIQ5QcIu/HXPUcccYvoqpn0ESPA6BHHCXMSwsJXqNfq0JVPf3O5Ei/Omz3i79HL4NUebLVrbkGL6XA4O1s3F8Sxw5ega1WQYuJvHR3UVqgHWi59THEjo1AR2JqsEESAzsZ0nsKDFYc80Sk6+4QyBA3p6VLGesmg==
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN2PR03MB2286.namprd03.prod.outlook.com (2603:10b6:804:b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 11:50:31 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 11:50:32 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL v3 7/8] MAINTAINERS: Add myself as a reviewer for Device Fuzzing
Date: Wed,  1 Sep 2021 07:50:03 -0400
Message-Id: <20210901115004.34768-8-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901115004.34768-1-alxndr@bu.edu>
References: <20210901115004.34768-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0328.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::33) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0328.namprd13.prod.outlook.com (2603:10b6:208:2c1::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.8 via Frontend
 Transport; Wed, 1 Sep 2021 11:50:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e45751d-ed8a-4e46-6652-08d96d3eb3a7
X-MS-TrafficTypeDiagnostic: SN2PR03MB2286:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN2PR03MB2286B2CFAFCF787D2E3A4183BACD9@SN2PR03MB2286.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JaPyXf61/9xypJmPKVX6B4Y5f8S74bCmwvo2KMqZmsB1Q4xLHdLTPuDxb4fELWfFqxJUCnt42giYVxZgz8kUBV9Jeavtfo8QazZbeAbNDgrVuWgYTBzcfKms74QKHaAzK3NUVVJWOVP+KRRsvc4IMMqK0jk3Re1FAjNE0jwq+/1Xeah6ktKJkM33mwhI38moCnaTtkzirxVJfL22QMuTclJy0wM0uuciSTL21AZmudQrWmR3zqY7LToa1rYw4LUQqwdi/OaHR7s6e4HjNj5/mOk1mCqzNCTMePSMlhNs+pxZDL+9V8GjKo5HG2TVhn1NGjJHv6AOkN20ki7WCRayCfb2zj89U0/08aYdXMGmGtgWOeBHAr+IobaOJuhGd/o9QuAznDjGld8jzBYcEXg0RQ3hb1gy0WszVZk0i2BYMQt22kh+72VqdGbNJhb7mvdnZ6uQzt3Ff8f47wSCiz5+0QWrpmb/ggxu3p82zAbGj+F9Ysq09RVKe/wkfiHB90Hb7+Iv3bf21zR3H8+0uDKDuGTRQvzar4jgzVnLozoQkgmt/SV9SqYBqPYg+9A+xi506OEXVhEChwR4+RnInneytCbdssl9Gv5lgMkoLbPD/jnZ7eILFnoKlzodpuuPEIuO49xi2xyP5wn5yYYFlFH4dmnLO6jP87y82mCFn8yTlLni708Q9VU8aMZB01Zd3lO1VGdHN4g/aQ9YJXPX++CZRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(6486002)(5660300002)(66476007)(66556008)(6916009)(66946007)(6512007)(8676002)(8936002)(4744005)(36756003)(478600001)(2906002)(4326008)(86362001)(75432002)(54906003)(1076003)(2616005)(956004)(6666004)(316002)(38100700002)(38350700002)(6506007)(52116002)(186003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czhHSHNtTHZQWHArcFNMMWJza1pPV0JlMG5wWkVYeFlobk1NamVSaW1Tdlpx?=
 =?utf-8?B?a0o5Wkk3YWxHR01CSHFlaGQvQ0hVWm42ZnEzcWhjdmoyT05PQWs4V3VCTGQ1?=
 =?utf-8?B?N09VL09XQi9uZzU5eXRnV3RrNnV2V0pBUnh3RjRBL2VnUERwQ0x4bkkwZXha?=
 =?utf-8?B?Y21PbDdNQU5JZnN0WWFYdndLTit1TDFoaUVYaG5UdDljYjNPbEZWMDlSNEQ4?=
 =?utf-8?B?ZVhVK0FodWRiVVBwWFE2b2VOQ3hkbCtVRWdBdlEwZlE0OERzNmY3S0REY1Zy?=
 =?utf-8?B?OHE1NEpsekVQR0NCc09nK2tMa1g3akxOUXhjWWIrbnJPTjh6OGtyVGpIWDVL?=
 =?utf-8?B?dU9DYVNFNlIyMU5tRnRIc0FvWGVaWll2RklCZENQaHBPQ1BCcDB3aGJsTjRn?=
 =?utf-8?B?Z3ZjUTNLUXIzUFRUNjNjc2hCN3NYUG9XcUlUOUVqK2UveWJkbU1wUDgyNTNF?=
 =?utf-8?B?a1VwL1RtbzZBUzNEd2RuSnBPbU13MFBxOE9NeWRCQjIyYmh0Vmw2ZHBRbHJV?=
 =?utf-8?B?Wkt5SWw5UHJCd1FUMVZiZW9jejlKK0JXWDlKc0p3UUJLeUZwbFFibXROb1dw?=
 =?utf-8?B?eUtROU82c2dTNFdOTnZEUE1IcXk0MVdPN3BBTE9qU21qZ3lISE0vb3pYSG0y?=
 =?utf-8?B?U2crNG8vWUtPSW9NRVpFbjJzQTFZOGt4Rk9QQ3gySEJnN1VhanYzb2EvQnVV?=
 =?utf-8?B?akRYbU1QQUVrV0thRHFxTkZQSkRrSEdWb0g5Z1BKV2h2U1FRZnZkbW1IYlFN?=
 =?utf-8?B?V045RGUwdkQ4ZUdETHc0VFJCZGxMUklMODF0RkZGd0JMOGZYUS85YzlCZFRx?=
 =?utf-8?B?MCtwSjlMZkRnQUY2MFB5K1NYZXM2dlZTMHRqYTUrTmhEZWhmcFU4R21QRkNx?=
 =?utf-8?B?a3U3NlJ2WkZPMG9KMXlLKzgrME9qYU4ydEJDZ01GaDZzZHlZR3lCeWQ1SEp2?=
 =?utf-8?B?em80MldxR05YWGVnZkpwQmt5UWZSaXkwdzBrTXo2Y0F2TUh6bjQ5UWtjVGlq?=
 =?utf-8?B?TFVzRmpkT2J0V3VCMXl4RWlqbzV6YWVRS1ZFa0FwT2xoQmNxT3JQMHpvV3Z1?=
 =?utf-8?B?TWZSb1pkdi9qWHBvUnRnaXBiSCtndnJndm1TZi9sL3d3dUErSlZZckJmQ1NK?=
 =?utf-8?B?bFhRU3U3aW5LbDVmWEI5dFBlbGR0dzl6TEplZWIvU013VGhVVFgxVDJrZVVJ?=
 =?utf-8?B?cDZMdUgzYXBIUmhLSk1DN3ZxY0lUZFB6UWtUckV6ZThTdGtGdlZhRGdOd3dz?=
 =?utf-8?B?NE9uNiswNkprbHByM1Q4dkU3SmZVTVBuOVp6SW1aMms0bE1PWXFuQjJyR1Rq?=
 =?utf-8?B?SENQMGpmYmFNaFIvNHpZa0ZCNEVvakFkQTI5LzlBREd2TE5tUzJVVjd6WjRQ?=
 =?utf-8?B?MjVaelBOSVRjSGE3YkNRcXhrMWJwbUIwaDl0bmVXSjdSTHNQSjlwem5weVhF?=
 =?utf-8?B?U1dUMndVbkhKZmdXWmtuVnhyWXNjRktNT3hjTkkwZ2psVkNqamxMRWRaaUdI?=
 =?utf-8?B?QjI2b2lWcjJPbGxwazVDdCs1dmFGMXIya0RlYmlrd0NLUUxDeDZBQ2Nrc2JM?=
 =?utf-8?B?dExjdlFRWDNCbjl4NS92TWY2RmZnTmxhdXBsRVl4RFdTUTFNek5mNVRkQUtL?=
 =?utf-8?B?c05ocDZXL3diV1ZxTHY5bURxblpTM0o4Q3VPMW4rYnVJSGNPSUkrdERNYlVx?=
 =?utf-8?B?T2c5YWMzc3Z3TGk3Mjh0bEJRWTU5b2JzNkRXMWMxK2ZIT3djNFlYYXMvQm9O?=
 =?utf-8?Q?ytGQGM8ObXEe9dIHsE49RZM39qmi/r/wgTO9ITX?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e45751d-ed8a-4e46-6652-08d96d3eb3a7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 11:50:32.0777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o48/YIbmoiOAI6OwOrzwsVuOzjeSsyWDu5lzgalia3l7f1fH3lQaGZIRAvyiaKtt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2286
Received-SPF: pass client-ip=40.107.93.92; envelope-from=alxndr@bu.edu;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.238, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
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
Cc: bonzini@redhat.com, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
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
index dffcb651f4..8b725091d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2711,6 +2711,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
 R: Bandan Das <bsd@redhat.com>
 R: Stefan Hajnoczi <stefanha@redhat.com>
 R: Thomas Huth <thuth@redhat.com>
+R: Darren Kenny <darren.kenny@oracle.com> 
 S: Maintained
 F: tests/qtest/fuzz/
 F: tests/qtest/fuzz-*test.c
-- 
2.30.2


