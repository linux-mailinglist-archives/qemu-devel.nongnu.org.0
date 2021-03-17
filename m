Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C49933E79C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 04:28:00 +0100 (CET)
Received: from localhost ([::1]:47748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMMql-000280-BY
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 23:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lMMlp-0005Sf-DO
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:22:53 -0400
Received: from mail-eopbgr750053.outbound.protection.outlook.com
 ([40.107.75.53]:4470 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lMMln-00011A-GK
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:22:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvOykYVJMraVmM1xVrdnmzXoeeJLOZtkyAj/b/QkE3R11g+j8k3CnRKnG2vMvrYbjWJTPWFCC0ZZC/MycYmOEA+85uthCVF9q7ks+4wyTq33BT7y7a6XVjLhhGCfsvMfvgOyRzDj55X36W8U6R0cNY7BZ7fSBxJOC3wuToSYGualiFL/uX3Gx2VS9p5TQtMO1KoO0gNwsXLcbSLDDwKYTD33WNK7tP/iDcqNR9D6syNk9SVpvTeL360Y21gSexqHPzXho8w108e1uj7h95IuSHyXpkrL3rTbSBjHHN7AZivtRcbBhlkw7jtyusOikoKUwVIzeNdS5GHJj7XqlcYPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2j7K2uII9kt9fbDXY5phqFNWi31+gNgB6t4dXN0Oabo=;
 b=WF1jzio/psTxwj05B3PxhTjTe8E4AayObsX3XxGqlWcqoR5KKRXFLhDOCOu2FcRYNPxGuB0iotp2Zb1NtBQT58crePh/tU6MjWxBCmDUUhm4aBhmOKkQF204Iu+AMMZ3SHuYdaD7U4ovwWzCW0tFRsrvDtJt3oXlisXVRVhcAlBEynbvMN6N3Iou5tB/Rwh7Ye7/6lnjteVdmu4+T/hw0QZ45jhSCMB+N45RyVK0CzyQuWxJa8wkVoRvOk85TGxXsgmuKsn1V2JsDfz66wX6FjjaWpy8c268x7jKV/9dywqM+4UBMRuUQ37DlS2V4YUY07UTrka+lyxmgWc84k8UhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2j7K2uII9kt9fbDXY5phqFNWi31+gNgB6t4dXN0Oabo=;
 b=knoYHs33GI5EkVjh6pzKxNPGTlNr/bQaT73hiJvPn1yiOCeC9RFAQe6GB7/aoAxDhOJhB7iYhHEiwnw3kM+wffN3kcrOdJOiealfnzEf+oNwBcAaUCDM+jLSkbYDdKxP9DDBqX1+f/EolgkdELrqwSdAQbuFPv2kcUUUzqZguNo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4954.namprd12.prod.outlook.com (2603:10b6:610:63::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 03:22:49 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::81f6:605c:f345:b99f]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::81f6:605c:f345:b99f%3]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 03:22:49 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 5/6] qga: Switch and case should be at the same indent
Date: Tue, 16 Mar 2021 22:22:16 -0500
Message-Id: <20210317032217.1460684-6-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317032217.1460684-1-michael.roth@amd.com>
References: <20210317032217.1460684-1-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN0PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:408:e6::14) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.84.11) by
 BN0PR03CA0009.namprd03.prod.outlook.com (2603:10b6:408:e6::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 03:22:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 806d260f-8c01-4c60-9e62-08d8e8f3f12a
X-MS-TrafficTypeDiagnostic: CH2PR12MB4954:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4954119ACE103978ED842C7A956A9@CH2PR12MB4954.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cgmNN3Wjcz1DQtBaxQyELBMSCOgTj9IcsKw7msVArhfBDELDF0ivfVDLcA8Q84k8bUY9EAwEo4476AW0TX/W2Kg82rW4e3Xdn2+eXjufOH8tPj7xJ4mofPwR+B3sUF1bgHksJXQcq928Ec+M0/fs3KpVpjG10UWkRe8qvBxqvWFF67HXeJBFrOj85tFH0EspuHEg1JakpwICDBTKidI4EY4wg3s7Pd1ClWDB7yc2rtYWWqIujLzldSjfPcisS01pNN9+X8mw5UvhnXDWk7zEJZggBmpOLNB/dlYiivrxeapaB0g24p3ZN+tQmxfMgiWRlw3ClW9aG/H/N54IIw/Iwuij7WR0jw/KSqsuaDfO7HD0Por266z0liAHg/v1TdhjMjGiaAs4RRdvO7yhJAOutZDrDMl4imZcZUO05KeGyCrguxIEM5wMkhEy04g9tp/Qk+iF/sgdJZPAvEsFUcwdlNbaykggJMZOj82DpnfgZQO3RCEof5iRm1TekNU7WElkKNekpIYWer+aF8zE9YeOnoNXwX9b037XoiKCu6UpyrmubIGyFwLxREgCgmOS0nyV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(186003)(8676002)(8936002)(4326008)(478600001)(316002)(26005)(66946007)(54906003)(83380400001)(1076003)(2616005)(66476007)(956004)(66556008)(86362001)(6916009)(36756003)(44832011)(6666004)(6486002)(52116002)(16526019)(6496006)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YUtqMGVFSC9SZzVLSXVYNUxiTW1jWnFveTBRRmZGNHE2dTVPWkFmK2drYmJF?=
 =?utf-8?B?NElEcjh4U05MZ3UwR1pnWFhTbXJPWllmUTU5VU9DYnlJaGtRZGl5M2ZCb0hO?=
 =?utf-8?B?aTBoSU00R1BIakJta2RZbTlYVkVzYTF4SGQvQnMyQ1FkQ1N3c01tMHU5OUUr?=
 =?utf-8?B?WXZyQUg2dHFSbnlrVy82bmUyWTh2MnRxdHNOYlpDRU5kTFlKMkRHdWRxY0M4?=
 =?utf-8?B?WGVSOUFiOElmM1hTbFVEVHgvallsQlM5dHdlT0hPaFhEVlEwZXh2Y0R1QTFP?=
 =?utf-8?B?QXdnd1hEalkreGpMQ3hIcXlMSFRCM0FoQzU0RGNyd1o2RU1BeENtMklpcXR3?=
 =?utf-8?B?SWFHTlViZkVMSFZ4SXlyL0NrQ1FlV3hLMU51SXlBc2NiZTl4K3VGMjVPcE5r?=
 =?utf-8?B?bFNHTmc4THliZmc5b0txNGIyM2VmcGNsWVdSbkZSczhKdlVtK3RQR24ySFdt?=
 =?utf-8?B?ZkdaZ1dLbnYxR3F3OHIvM2QzSmlabGs0ZmxScERHYzlOTXJ0Q1dnWDJBS2Qy?=
 =?utf-8?B?QXZKaUNlVExkTDNWdmpWWG5ISEpZSGpLZjlKcmJLRW8vcVBZR2RoenFqS3FO?=
 =?utf-8?B?S3pJenpoSlNDN21LZ290aGNWa3l2TUJyMzk3RHZDbllWQXBKNkFzaTJvK2E2?=
 =?utf-8?B?R01VdzhBSkN0SHZZYkxGV3MvdzBvbC9BWi9oN3FFREcwajRNUWlUdCtXR25r?=
 =?utf-8?B?VEZmTG5zRUxaaFJJWXh0bTZMVllwcElucXRCRjhQS2dtR2NOaGY5ZVRzanZy?=
 =?utf-8?B?R3c5T0hPaW5tWTVibTVOWncxc1I5aVFuU1I4ZFRJUzlrN3NVM2ZZZ3pPeVdP?=
 =?utf-8?B?Z0JEQmNwWGtrSzViMDREWTZkaUlJR1VzM0tCdFB0S002TEpaTjJGMXFFdCsx?=
 =?utf-8?B?LzMrTkZ1NXBBYmg5QTZSUFEvcWozZ3Y0OXlCSHRLWkhuOS9XVUxSRndkR29J?=
 =?utf-8?B?Q2IrKzFMZUIrdXBDZEFoSWtuRkFvNTVoOWF2cjNsd0d4aUVnb0N4cHBkL28w?=
 =?utf-8?B?QzM3OTRuVG0xMkc3MmN2eGZaQUxoZnpzQnUrTHFUczZPV0kwTG8vR1dZclhP?=
 =?utf-8?B?cE1DVVR6elB1Wjlmb0dxVlVTR0diOE1DUnF1RWFKUnV6QnRJcnc3QVVKeXJt?=
 =?utf-8?B?RlZsdnprWFVCVHp3MkU3b3NyWjF2Z0RNazVNeEtCS1ZXNDRHR1Z1Zmw5RVUy?=
 =?utf-8?B?V3RFQ2YwV05RcFdxZEhKWlUxSmo4LzdBdGVNUVZib215amNEREM2ZnlveGh0?=
 =?utf-8?B?dUNMeGhQOFp3UWVZanlSMGEyQjIyNHcxSFVDYnFxWGhyN0VkOGlXUERjUFdn?=
 =?utf-8?B?ZmIweHU3SEdzcldrMmROellxNFpMUDluOTlUL1U5ZVk2ODVXbDYxSHdIeDc2?=
 =?utf-8?B?ekEvTTRRTi9HNk50MmRkdTFLQ0VOZ3VTc0RUdmdFbDBpSEJEaFBYMk9naERF?=
 =?utf-8?B?cCtNNjB6OVVLZXkwaXZJNFF3anJsSXoxSHN3amdDbklkRDFaNXE4SjY4MnYr?=
 =?utf-8?B?V0tBRm9nTVowWmVqb1RkWkhiY2d1UlRwdFEyZG9NRUpSNzZJTFBDbmJVWUtL?=
 =?utf-8?B?ZFgzclZPSzJOUmlxTTBtYkRzV0lkdWdaODRGQllxTlY1cUpQdlpJdW5ZeU5Y?=
 =?utf-8?B?V2h5RDBWQm54MkQwSFRGSnlCVXJmVjArd3RGbW9KUmJ2ZUhZdlgyWTZWSjlr?=
 =?utf-8?B?VXNhOERxc3NUVldNWWxmKzQ2NFFDNUJLVys2eEZZMVdhYWxPdngvc21Xc3Vv?=
 =?utf-8?Q?v45GVB6xfEXwGqMlllmtENQGnCa8jSKdG1Esz9a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806d260f-8c01-4c60-9e62-08d8e8f3f12a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:22:49.6054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+Qi8n1e9ouswJgx+VvtAiJYiADhTCISflmSDaVmSVjPsOZ1fU6QNWirkZFBZk5mEXMMc7cXsUDa4SJVcXCS9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4954
Received-SPF: softfail client-ip=40.107.75.53;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: AlexChen <alex.chen@huawei.com>, peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: AlexChen <alex.chen@huawei.com>

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: AlexChen <alex.chen@huawei.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 qga/main.c | 52 ++++++++++++++++++++++++++--------------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/qga/main.c b/qga/main.c
index 20db0058db..ebb910773b 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -279,20 +279,20 @@ QEMU_HELP_BOTTOM "\n"
 static const char *ga_log_level_str(GLogLevelFlags level)
 {
     switch (level & G_LOG_LEVEL_MASK) {
-        case G_LOG_LEVEL_ERROR:
-            return "error";
-        case G_LOG_LEVEL_CRITICAL:
-            return "critical";
-        case G_LOG_LEVEL_WARNING:
-            return "warning";
-        case G_LOG_LEVEL_MESSAGE:
-            return "message";
-        case G_LOG_LEVEL_INFO:
-            return "info";
-        case G_LOG_LEVEL_DEBUG:
-            return "debug";
-        default:
-            return "user";
+    case G_LOG_LEVEL_ERROR:
+        return "error";
+    case G_LOG_LEVEL_CRITICAL:
+        return "critical";
+    case G_LOG_LEVEL_WARNING:
+        return "warning";
+    case G_LOG_LEVEL_MESSAGE:
+        return "message";
+    case G_LOG_LEVEL_INFO:
+        return "info";
+    case G_LOG_LEVEL_DEBUG:
+        return "debug";
+    default:
+        return "user";
     }
 }
 
@@ -687,19 +687,19 @@ DWORD WINAPI service_ctrl_handler(DWORD ctrl, DWORD type, LPVOID data,
     GAService *service = &ga_state->service;
 
     switch (ctrl) {
-        case SERVICE_CONTROL_STOP:
-        case SERVICE_CONTROL_SHUTDOWN:
-            quit_handler(SIGTERM);
-            SetEvent(ga_state->wakeup_event);
-            service->status.dwCurrentState = SERVICE_STOP_PENDING;
-            SetServiceStatus(service->status_handle, &service->status);
-            break;
-        case SERVICE_CONTROL_DEVICEEVENT:
-            handle_serial_device_events(type, data);
-            break;
+    case SERVICE_CONTROL_STOP:
+    case SERVICE_CONTROL_SHUTDOWN:
+        quit_handler(SIGTERM);
+        SetEvent(ga_state->wakeup_event);
+        service->status.dwCurrentState = SERVICE_STOP_PENDING;
+        SetServiceStatus(service->status_handle, &service->status);
+        break;
+    case SERVICE_CONTROL_DEVICEEVENT:
+        handle_serial_device_events(type, data);
+        break;
 
-        default:
-            ret = ERROR_CALL_NOT_IMPLEMENTED;
+    default:
+        ret = ERROR_CALL_NOT_IMPLEMENTED;
     }
     return ret;
 }
-- 
2.25.1


