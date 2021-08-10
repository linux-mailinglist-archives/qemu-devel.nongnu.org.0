Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E804E3E50C2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 03:49:38 +0200 (CEST)
Received: from localhost ([::1]:35270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDGte-00034S-0u
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 21:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mDGsl-0001dY-Ok
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 21:48:43 -0400
Received: from mail-bn8nam08on20611.outbound.protection.outlook.com
 ([2a01:111:f400:7e8d::611]:27873
 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mDGsj-0008Ql-J1
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 21:48:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nurNTx2Sosth13VtSYKUn01s9U3rSyC0LbqxpQplrZ9pKI5/P5gzn9BKn1/m/asyLAlOuer4TI2FC2v+gREa4Ony7WIWCta8qi9bAvIbCWktp9cPCCA/q+HR2bjq+dUUpfr/GqHE/iFwhNyQsyiklzzq9azrZ5qoofuP1hYGicV5PWm9tIoWGynWpZhNY830YnSYxUFSN946Dqqn/yPZT8TR3E6qR0/yMuZ8SfXYYvrn/mM1M/6uoLIniJrAS48scDiGXigDop2gCO6ztvfQ9gzltriGUDOwtmXkdIjfvLUFsqjI8YJZr7ts92gVyFz0sWsy0I6r0CW1r7lbHzdQGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkh9/cX+1VMUXFpdzU9C7SvKUuISGOK/hqOkA/zARJA=;
 b=ZKKVB26sYzh+TAZspxsYE9cdZO+AAerhDvIBfENBLujUoQAwZWgfqqgsKjESgVKEWUYavrw//Ntp+/6InuIuaIFaz5jM59m5qJ97B0XVCSVJFfHQqM0kH7sOxO7HWNU4AiOYO9xI6ibE01CkDr4qbHo2peTVdxJwakaWOH4Qk/sthKFk3jOqFchwP1Sx9WsGykbc+TH/R4aC1ey/6wCKaAcchXBEmDr6RSY6Y+7owNkIAyPWATbFEgAXtZ+DJwc47Mun8YETT+FcUdU33A3AkCBAKSxCgYnw0+R7bcuEbDJiP07j1Kq+FhOuIZaqjOQEg4E9uDgoKH/CJCCiWtPHLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkh9/cX+1VMUXFpdzU9C7SvKUuISGOK/hqOkA/zARJA=;
 b=ZarnR0jlL0zAEqE4kP/o4IYWkMPuqF1m6EOTnAk+iWii0uCLwWCsCHXiMmg7WBvF3JNYBc+zWTw8YOCyX3MxEDFIhVfKFuJF3iQ7Ht5soOsTBZGJg9WuMAipMI42khmtGU0I0e0b8xzRo8oHuX+tzM714Gmy5mLNRcp5BwxpoU0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4119.namprd12.prod.outlook.com (2603:10b6:610:aa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Tue, 10 Aug
 2021 01:43:36 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%7]) with mapi id 15.20.4394.022; Tue, 10 Aug 2021
 01:43:36 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL for-6.1 1/1] qga: fix leak of base64 decoded data on command
 error
Date: Mon,  9 Aug 2021 20:39:24 -0500
Message-Id: <20210810013922.215443-2-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210810013922.215443-1-michael.roth@amd.com>
References: <20210810013922.215443-1-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:806:6e::20) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.11) by
 SA9PR11CA0015.namprd11.prod.outlook.com (2603:10b6:806:6e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Tue, 10 Aug 2021 01:43:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 593d440f-25ad-4ca4-7b60-08d95ba0454a
X-MS-TrafficTypeDiagnostic: CH2PR12MB4119:
X-Microsoft-Antispam-PRVS: <CH2PR12MB411999CDD150286F5101628195F79@CH2PR12MB4119.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +DXhRSFx2/+qbQY4Q8QrPKRca+M+h27hPqS3GbzS1rQJGXrwiAJwiNrVchEOBeLSu1ple9zsPV+zGMR4lIfyl9QqYNq0BKpgM5wOPvqgcH62dgx2201Q+6Lon8PISYCqyjKnJ/Nm3UIwffeAXKu/5Bl2R4PpKXwn3a8qETTPsaDF3WHuAG8wcnGgHdlt6WfHnUjtzwdWCU/Globpqz0bvsvHEEgNgwaVjF19aWyIN2J3g2wFLvuNw6RNmzjrjLZHRqsuow7TE8yvB48fCUFx0A/EJmdajWvCOjQhJXucEaMGA5GxPdac5per/wnDCocn646yPBoczDUUGGfS6dR/GDJYYsPUDZA2opPo2rCf1kVh4PB5uJXMGlo5YSo8EUP3AXdUJIYlGB+9F6BE7N5kqFy3QoCKGDrYntHnEv4/CIHJs4+TxlYLIxS10xD0vqBD6xOFr9RrCIDzimdudXD1Htxkqsb55pSfzKmFGUotjjgxDAIPj6Bi1VMcmSW6mn9jzC3WcWNnHvgIhNeZxwPOLAQIRBzURGCVMgPz0HFeO36ItugISALRBwSqe4A/2bjTTfHNZYFrZnY/wtW40iCpw8VfhiqBQxRy84OPOEebjK6MmstB1X83rVxZb/UEHVYezUn7Ij3GGwi3MJj+GYi6zezdnypwDb34+wZbDCK7ORjp29jmOJbAYIju4HfWKnFj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(478600001)(6916009)(66946007)(52116002)(54906003)(2906002)(66556008)(2616005)(38100700002)(66476007)(4326008)(956004)(38350700002)(6496006)(44832011)(8676002)(36756003)(5660300002)(1076003)(6486002)(26005)(6666004)(86362001)(8936002)(83380400001)(316002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3dWY2VnQUcyUCtnMzZJbzExRk5SalF3Z25IdERtSVp1clBrMDJSZDVjVjY2?=
 =?utf-8?B?Tnp6R1dNZUtYSTBLK2Q2YWVHY01KWVc2T1VKTElHbmoyQ3dIc1ZoRVZWcE5h?=
 =?utf-8?B?VWN4VUp6MTRzeTVRY0NyVGVBN0ZFQjJqOWFodFJxaEl1QnhKa2p0N0prM0pi?=
 =?utf-8?B?aVI0R0c4ZFJXVWFlTHZoaXhuSVdGcVFDUnNXcU0rc1FaMTdNV2VoUFQ2SklR?=
 =?utf-8?B?ZWRUWm1rU2F5QWtEUTNKU05Qdk55NjhyQ3pVcXhEcjA3N1d1RnRVb08zb0ow?=
 =?utf-8?B?UFZHcVFwWWJHQ0ZTd2w2MDhKZkxTc1J1L1V1dFVndUY4dFdXQ2t3NE1GSEdD?=
 =?utf-8?B?RHdpRGU2QWNBNWFLRUhSTXN4ZU1lcktlQTBQUHRDK213R0llN3Jld0pnaFZr?=
 =?utf-8?B?bWNHVi9YcFAvZXhzNHVVVDhORkNGanY1L0VuS25CdzltWU40K0FVZ2FCdE14?=
 =?utf-8?B?UXNTd0ZzVzVybktxckZUSGVDZUlaTmcxeUVkT1VKVDJ5Q2UzdUZ2V1FEY2cv?=
 =?utf-8?B?Vnl3MEFQekR2bHJQd05oMkYyZjRHT05NdUZMR25sdXdvbmlBRXZoTmV3bi9w?=
 =?utf-8?B?KzJsUkpURWZRc0dscHUvL01WcjRaWGlET0RFRmFHd2dZc1QzZ3o3dzQ5bkNt?=
 =?utf-8?B?cVpZdk1QWnU5OGVjYlExam1vb0VRekljWTIzZGZDM2pTamVROEF3a2lOcEhJ?=
 =?utf-8?B?alpGTXEveWNzVVh1Q1IzYlJBeS9RYXVWTTBwYVVYcXdacmVoRUNSMjdSNExD?=
 =?utf-8?B?Q1MwNVNGNmVISzIxUE9XRmxDL2piSGxna05pNWsydXozRnEzTXo3NHl0RVBl?=
 =?utf-8?B?cTJMN1E5eVRRL2F1a2k5eVhWSlZYVWxZdHJsMDM1OUtBbERlTUk0S2pLcFVa?=
 =?utf-8?B?YXVOZkFJbFdKTjJ1ZEpoNnZZT3lXOElHWmh1empRczVhOGlsMTRQQk5zMndR?=
 =?utf-8?B?ZWRBcytudkZHb1AxWjdYRkhjdzNyMHhvb0hYakk5SVFMRnRIMzl1RDlDc21a?=
 =?utf-8?B?LzUzNjNueTJNZTZYU3Fwc2ZLdUNvY2ZvTGZJa2dKRzFCd1ZnaFB4bGNNbkV2?=
 =?utf-8?B?UXlDUW9RUzFLamk0d2FFQTlkQnoyd2ZFTXdMVCtDcU9INDNJTS9KVHB6U1dG?=
 =?utf-8?B?SVI0dUM3VHZPNTh3MnJGMjFYOGU0VGVGeTBKMm96aytGbUVFN1JRUkdmNnlZ?=
 =?utf-8?B?RW9EcTlsVFlQLzNKK1NLU1lFTGtzREt6akllbHh2b2pDQnRwbXVNWEw4WTcv?=
 =?utf-8?B?T1N1Zmt3VlhVZHdkTlAzNEYxeTc1aktBZVJETnFTK1QvVm85NXJveUdsSXlB?=
 =?utf-8?B?KzZYOXVUeWtTYXdlbWxiTHloQUhkY3lOUWM2c0xPQ3A4Y08vc3NKbGZQV0Fa?=
 =?utf-8?B?RU1wZUkvcVVETjBqV2Y0WnQ5NzkvUUNBN0dmMjlVTUMxMitpeHhEaFhKZkpr?=
 =?utf-8?B?TUN5WUhSbFBPY1pSU0NrYnE5eDZ5V0JPNkkra1BMYmhBNHJmend4bHN5NlFs?=
 =?utf-8?B?VTZZK2FxMzFhNU9lTzQ2V0hBLzFKR2VPSGEwUWZydmpHVkRGNDF2US84N0F5?=
 =?utf-8?B?ajBxb0Z6aDBEdzhaNkFWZDNFL3E4djBPQW1qVnhnRXgydFlFNno1WGVqY3RW?=
 =?utf-8?B?NzJIUHFWZkJ2NGYwU0xtUUU2VE4xdVRNblhsUC8zSzlGVEQ2VDB4VlMyM1cw?=
 =?utf-8?B?VkIvM0piT0dlQVZHOXd3VGNLQVNzeEtYczBPQ1FCVnplM2IvNWU3MFhCdkNj?=
 =?utf-8?Q?BZ3CY13RRC2coaZ8EbmVGXG9ubpYqlgCebPwgt8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 593d440f-25ad-4ca4-7b60-08d95ba0454a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 01:43:36.6623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8J/o0cEahf76E7dxPIz/u1nSIu+g3BbqqJP+5Y9RbW588mge8wMHv4S13v/c/zdFF3s8iNX4c/yi7F/q8hiZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4119
Received-SPF: softfail client-ip=2a01:111:f400:7e8d::611;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

If the guest command fails to be spawned, then we would leak the decoded
base64 input used for the command's stdin feed.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 qga/commands.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qga/commands.c b/qga/commands.c
index a6491d2cf8..80501e4a73 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -402,7 +402,7 @@ GuestExec *qmp_guest_exec(const char *path,
     GIOChannel *in_ch, *out_ch, *err_ch;
     GSpawnFlags flags;
     bool has_output = (has_capture_output && capture_output);
-    uint8_t *input = NULL;
+    g_autofree uint8_t *input = NULL;
     size_t ninput = 0;
 
     arglist.value = (char *)path;
@@ -441,7 +441,7 @@ GuestExec *qmp_guest_exec(const char *path,
     g_child_watch_add(pid, guest_exec_child_watch, gei);
 
     if (has_input_data) {
-        gei->in.data = input;
+        gei->in.data = g_steal_pointer(&input);
         gei->in.size = ninput;
 #ifdef G_OS_WIN32
         in_ch = g_io_channel_win32_new_fd(in_fd);
-- 
2.25.1


