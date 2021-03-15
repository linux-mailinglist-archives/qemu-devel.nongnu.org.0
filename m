Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880BC33C632
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:54:40 +0100 (CET)
Received: from localhost ([::1]:55180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsMR-0000jx-JA
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs72-00045R-00
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:44 -0400
Received: from mail-dm3nam07on2131.outbound.protection.outlook.com
 ([40.107.95.131]:13664 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs6x-0006Et-Ch
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJD2kt37AWQU9Nl0A2iSeZn/0kJHnOqCtbnxhxE2lplIdB6QpDDd5cwWIDsOSwOI0LlKZLT4CcBHS9LM8GBfNdYrAZKbp6Szw3bkwkmeHwiTelcahdWC1H8RNTR22FJIlWEtfwwVgZNXFdb0/3GTo4CM4pYOzykxdLQDy90ObX5V7sTgzzn53K3U7Z8ugPFBvarE05mIfPMD5AE4EZQqlcRaW2CDKFjqvUNMic4wWsKNmLSnsr+CFIA5QUD3AaW1n2BabW7EfkJ4VNl/MvsKBAGAsmUX7skyzNgvQkemgWAEviVxrDbl1Msc9+dIiGLLgfxElspDpTrAA1atXjtRQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0eHyBh6jsRpQpcq5sq07dpFKHV+JHq5fC0kFYPIO/0=;
 b=bL1ssGEGLShKPkLhaip7MshUIs7XqMoFPTCW52X+hcRMwvhtDw77CijkWW43hoeY4MZhKv0XGJ4vLvzZV9Cw5qvzx5xx2GiApj6Aj09sGuaI6V99dArvKYpfbWQSAtmVnDkcPbGRuTi46R5lQedPS/+qw8cRnjtZNPNzdTXQ/0V5nE9Gmlt+6NqDMjFqB/ylXPHeFgZW1BJddT1IejQClSFHc+9ZP3UhTwN4t1kL8xm3HPjGqHXrQJ1NxsQVe71CcFkf6yMN4X4VmSu1u5WXSvOXo4Un8dn5qaAy+++LDd/VQ0alVLeeVbfSQvPLcZO8Bw1kG/bvaoXySZBjj4013w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0eHyBh6jsRpQpcq5sq07dpFKHV+JHq5fC0kFYPIO/0=;
 b=JLai4pmNfWZgLfvSc785NoKf5aOTU1IcQvhNiHh/EHtBlXFBP3rwDjaDp7Bjb7kOcgslC3sma3dWuq+Cnhr+Pml/4u7VNZfM/W/FuNmRrq9OlEEYkQBGm+UMSi9QMmqEHBoBO8AlyLHdGnTfc2Tr+YgHcI2Q38CU5E4bewKnnDo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4286.namprd03.prod.outlook.com (2603:10b6:805:c8::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 18:38:25 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 18:38:25 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/11] MAINTAINERS: Cover fuzzer reproducer tests within
 'Device Fuzzing'
Date: Mon, 15 Mar 2021 14:38:04 -0400
Message-Id: <20210315183812.27760-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315183812.27760-1-alxndr@bu.edu>
References: <20210315183812.27760-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [128.197.127.33]
X-ClientProxiedBy: BL1PR13CA0323.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::28) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 BL1PR13CA0323.namprd13.prod.outlook.com (2603:10b6:208:2c1::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend
 Transport; Mon, 15 Mar 2021 18:38:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55963d9f-f6f7-4b54-d0fe-08d8e7e184ec
X-MS-TrafficTypeDiagnostic: SN6PR03MB4286:
X-Microsoft-Antispam-PRVS: <SN6PR03MB42861ED6866BAA7EEA6FCAAEBA6C9@SN6PR03MB4286.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mSeSQaIrlKVBnYS0twyKcclEzd708T5ZXhse6inhSSaLb8zbw5399D7RYb0Bg326OnRsyQmnD1ORTjcAw7RqGaguD8dJ7WDwllSkIYhgNOHun082kZwWF06B67W3aX/1UdOCaOppD1F/URVTDuO6L1YXrG3LixsigA4t73hJsxxhTYgO2CkR6TULmoCw8e2NLGM4SpjnjH4YlyOzBhHkMVRKLOXZYhy6bn2xfpi3fh/GBUNGUIAEofoLnNAhCf+/tUi0tSDCyWU9WF6cfvKDRHZn3n2D2C+4fa6CDVdVZ9Wmg0SD9EukfHFUo1OHFpK5Zu5M/g2X8tFE8O5yk8QRKLYv5ELuObfdbpSk9eBqheIk1R93UX5Zqeal0snNgIHeJyQEddrLeQk14aURxPbZtzguLJ0jxedKv2GfUSI/VyMALN1o//JpboAvnb0YXSNBlIzGSdBJjQbuBDgpy8P7rsrmZh0xYJAvJPiDE2yB1h/TBbNJnPVAJSSaAj2vMETdClPoHNyGh9ehL2ojxYm+8CUkZaWqNcxlH/MXY2Tl7KHd05dkWnGnsppm9Jiia4GT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(2906002)(6916009)(52116002)(786003)(26005)(66946007)(86362001)(6486002)(6666004)(186003)(2616005)(16526019)(8936002)(66476007)(1076003)(956004)(66556008)(54906003)(75432002)(478600001)(4744005)(4326008)(8676002)(36756003)(316002)(5660300002)(7696005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SzVQRjRVOW16SFFwK0VLaFZIcG9zRCtsNWlhcjRIdS9WdFdPY2JmNGdydm83?=
 =?utf-8?B?a3BUVHN2N3ZlMHRqRkl5a0VzWmp0eVA1c3dMUTNTRWZncExxY0RqUHZPNjJy?=
 =?utf-8?B?L0srdTUwWFFvKzBWUjhQYnVOdXhVSm81TUc0Wk0xTWdZOTdSTUxhcnNNVkY3?=
 =?utf-8?B?azg3QzNPT29ha05MRUliWFArUDYyVURHcEhXeEM3S2JjeUFNczRRV3lLc2FU?=
 =?utf-8?B?U2RZcWR1dE5mY3lpeHhLd0hONVZXK1VpK1Qwa0w4LzBhYTJ2TVNyZ1RuS0k2?=
 =?utf-8?B?TTd6OFVpYUpZNVkzVUlDUTVOc3lnSWtvOGVpVlh5akQrK3dsYlJHSmFBWHp2?=
 =?utf-8?B?T0ZGZytMeWhlMGQ5eW5rSnN0UzV1Ylp4d1g5UmxreXJSZTVBd2ZobnZJSGdu?=
 =?utf-8?B?elpvVUtnbmdBdXhCVzVxaEhCRXQ0ZUU0UUZqYjNaUWIrVFNrWG4yMmk2MG15?=
 =?utf-8?B?cDhrZzdVYnNmdkE4bHFZcG1JU245Tmp3b3FFQ1VkZ1kzVFF2SVc5ODByQUVE?=
 =?utf-8?B?cTdib051NEJxbGVOVXFJYjhwWUtZbExoSUp6bXhOVXRpNno3K0ZLT25iQlk0?=
 =?utf-8?B?WDlNa1dRbGR2SHk0VE9PaURPdEJDRGZ6RDhlbDhjTUpIQzhjd0NvZlBjZTZ3?=
 =?utf-8?B?azdCYzdqODZlbElWOGFWMTNnb0hvQS9HcERPRGJudFJuOVN5Z3BpZTB3bHpQ?=
 =?utf-8?B?aGtibGxva01xUk9IUmRvOEdZaG9RK1lpTk8va2xadHc3eUMzRGpHMDZmbmdQ?=
 =?utf-8?B?TjBNaW5vS25vU1hldUE4eElGTVZUUVlNSlV5TFdMRmdLTGRObGpSVDNaV0NF?=
 =?utf-8?B?aXBEcjFKZWJqTVNtd054emF4WFZTaFJMUmxxVEpyRmI1OEZJSm1XbEFKd1J1?=
 =?utf-8?B?U1d1QVZ6UHJKVmU0WkJMVDJvVkpLd2VEMDcwZjhmM1RTK0VWL2U3YlJmVlVX?=
 =?utf-8?B?TS9PSXk1cE9ReldNNGlNcnhESkpvc0tBTGF1NTlzaWNCeDQrSmNCYm1iUjcx?=
 =?utf-8?B?K1VoMHU3UUEwdjdoYnJ5R1BKbGZrR2lCNnVzcFhsNjdzaE9IeTgvSkl0YXdu?=
 =?utf-8?B?Y1F3aHhZQWU1QUYrQ1JsY29HdU1tMkRNejhrSFFGc2ZXNVMvRk9xRUxvcWQ1?=
 =?utf-8?B?dHc4NVQyVlVRbzIrQWxHM21LY0pSay8zNElmbVBMcUh0TG1zNjlSMXRYKzk4?=
 =?utf-8?B?YVBxSk9HaDJwQm8xRmwvU3haNS9YQXE2MmlQcVBmNEQ4WlNpeXVtdGhERUxM?=
 =?utf-8?B?STk0Qit2eDVJUkkxQS83WVJXNG45OUw0dGtxSEJSQlBYdkJmQ2l6byt1YjlW?=
 =?utf-8?B?aUs4MU0zVUh4aVFFdFRBR3RmU3pjOUZIWnJpSmZLNHp0TkMwbDVzYjZFdjEx?=
 =?utf-8?B?UG1UTXlRTTVDalBKK2FVOW5waDNQbStSYzVueE1DQTArTkFMMThOODhKamli?=
 =?utf-8?B?MFdXTVN4bGR1ZDhCY0tEQnRaZ1dXL1V5dlRhc1Fzbm1PU1lYVGgyOElJbEFR?=
 =?utf-8?B?SFVQUnkyNUNDQUQ5UjdZMHhobkxKRk55NytkTTJyZ09VaG8zWURCT053NHVo?=
 =?utf-8?B?cVhVeUZlai9oTFpTRzE5U1htTFQ3N1RrNGdwRGxaTnJNQVZGUDZud2NUWXJW?=
 =?utf-8?B?MENuRjNlV0RlTmJqeWoraC9OOFJUakhSNDRnWHIxYUM2QUQvVGUvUk1iem9w?=
 =?utf-8?B?SWpLa1lMbW5qYWQ4NzZXU1R1ZytHcGJwa3ZENjVhZjVNNDdlUUFlWFpPTHVj?=
 =?utf-8?Q?q20Oo74T5d9YK/DJRvxvQNvkq7QTj3lqzWnU10Y?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 55963d9f-f6f7-4b54-d0fe-08d8e7e184ec
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 18:38:25.8414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bi/3zA+x4z2VhUy/lGkxZvjpou9GThbZcIWK0MZ5LFgBpbJIyudkGeZvG8qsmROB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4286
Received-SPF: pass client-ip=40.107.95.131; envelope-from=alxndr@bu.edu;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

When we started to commit the fuzzer QTest reproducers to
fuzz-test.c in commit d8dd1095019 ("qtest: add fuzz test case"),
we forgot to add the corresponding MAINTAINERS entry. Do it now.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 71c835bc1d..0bd720a3d6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2634,6 +2634,7 @@ R: Stefan Hajnoczi <stefanha@redhat.com>
 R: Thomas Huth <thuth@redhat.com>
 S: Maintained
 F: tests/qtest/fuzz/
+F: tests/qtest/fuzz-*test.c
 F: scripts/oss-fuzz/
 F: docs/devel/fuzzing.rst
 
-- 
2.27.0


