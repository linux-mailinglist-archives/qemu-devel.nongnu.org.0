Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D0033E799
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 04:24:41 +0100 (CET)
Received: from localhost ([::1]:40522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMMnY-0007SN-Vd
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 23:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lMMll-0005Kl-Eg
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:22:49 -0400
Received: from mail-eopbgr750053.outbound.protection.outlook.com
 ([40.107.75.53]:4470 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1lMMlj-00011A-RY
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:22:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6ranWZzrsPe/y4oUQ4JWuSho1Kw//LmdDyP7UUlT5VKpEbRttsnXlRYFZg4WqrHPjX2oXQYV/Jwo7G+nCdR3p6QcTMe4jz4eZYO3mMSizEwO9F/t6TjC/xvBwA7DUOCO6UwBPBbG5XDO6b7iC/9n3Q19D52o4XecmjK6i/IVq79AJgmylBnbgp1oI2zUnJakaZFLTfqCtwpqY6qE4nGnFrfbyviv2BsM5nV3gM1NyhFLG8RCIv/4n8Is6zTAomLR5s7pCBPLeHyzwzXSrhNSQg/UiXdxyk1F+PQ7yHv3PGxAHrQ/iM6AUO3Mi6RmGyHg+QUziPzlWDWe091aU2abQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/M5Df7a5YZoJfi5hhMwqO7Bg3WhQ2CfAgyynAi9HJDw=;
 b=lQ/56e8jJxc0TAtSx4HCXdy1bkjTCtxSGSJKFUbDAcJ8Ox+jmUiJ/odsQn5j0OnMa+6kpMVx2kCmplHP8kP2Ct/JG7f4h2JlZfzBScIW3RwSBTIfDSZsE9/MeCExWd5qfMjbAaM36ZCMSBDcEfBIyws4DPBln66o49zaiZAtKfVRxQ9yN8KgLr01biblDsb6ALiR0Xb8Nskk9G0TyL6vV8ln82/UQBX7W3ijMR0TH0RtPgWDHWuYaxHV2jaI47/zuvCvAwsb5VOOygedPuR0bD9XD8Z933OOoQFGXYj3k5ioh4lwOzk1rWi64o+pxFINGgdkmbv9G08EM2eVW+w43g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/M5Df7a5YZoJfi5hhMwqO7Bg3WhQ2CfAgyynAi9HJDw=;
 b=bZlecJgGgyCuVNlaDmNPaAWRr3RxWJw9JMIaQkrO7VOs/xZFjZ6TR151+Vs6B6KC5UkZJH/zIyII56Dts3l59Hv2HF1/e5P2H3XkQS+PzxxLqnrIKgGiImnErueLNtgC/MO/q5DxWED4AFPmAZYAYXtJwhukvAxycR2+yqG0v9w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4954.namprd12.prod.outlook.com (2603:10b6:610:63::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 03:22:43 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::81f6:605c:f345:b99f]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::81f6:605c:f345:b99f%3]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 03:22:43 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 3/6] qga: Delete redundant spaces
Date: Tue, 16 Mar 2021 22:22:14 -0500
Message-Id: <20210317032217.1460684-4-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317032217.1460684-1-michael.roth@amd.com>
References: <20210317032217.1460684-1-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN0PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:408:e6::20) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.84.11) by
 BN0PR03CA0015.namprd03.prod.outlook.com (2603:10b6:408:e6::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 03:22:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a8c5f4cd-0efd-4251-e29a-08d8e8f3ed56
X-MS-TrafficTypeDiagnostic: CH2PR12MB4954:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4954BC648C5B5214506AE359956A9@CH2PR12MB4954.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oXgLuDSFUYuPuU7w6Pnrrm+augvUVGtY41Yvuo6LQIEvVLmZVFpZKhR4T3sEAG/+SjS2vwGUASsSqHFC0z3FxGwgr2/VlIBqlfkt0IK9NXw9c4KVUyADT9VXIoQhMjISwCEkgBUH8TQ9xJU6/E0wEnA160TeZiWxa/hGPI6fRzb90gpMm8XQdJxJYs0t8+XtGVDF0XZnSvwtW0M8qGXfFex4ZxCqNKlUyKTRepCKFAC7DQH2kLp0kFLhcY4GJTMB7kDm+I81+kBhbwns/JugSuuE82a7fsU3ulCbBvdB6TucURTag25nn3zVBGpp1eviEERdf/iwPrpTkkykY+7zAFWRIXGronkArDmkkykg+wggUCGZwrPQ1u7PYzJodI973rCIqyaURtWTyFhm3YQe+F0vp6CPPqCmkeadslEXQHNSIcKrIEz/BPOit4QFO6yijhsvU0K8JbmUKXf8Or15BS42oJlsDy1BqoWkRLY8gny2jnajxVJEGsdU7IgCn6gxIwLefw4R5d2+UF1Gi7AyZBNIWUSU7kMfLyPalWgFOwHW+gcQeqw0J1dFvJ7dCWd+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(186003)(8676002)(8936002)(4326008)(478600001)(316002)(26005)(66946007)(54906003)(83380400001)(1076003)(2616005)(66476007)(956004)(66556008)(86362001)(6916009)(36756003)(44832011)(6666004)(6486002)(52116002)(16526019)(6496006)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q1lpSndaUldKbkNFMkk3NnlNQWl1bi9XeUZ6ellMMldFdW03UVlaZWJIRlg3?=
 =?utf-8?B?d0gyL05rWmtvTFIyZXlISGV1d1RkRmtWaTl1ZWZKWllaUC9jcStDVkU2SkdQ?=
 =?utf-8?B?cUYyeWZ3M2RnSmtrUXNnTFVrQ0l1MTVpS1ZLSG1KQnd6UEdyV2E0a0kyZkNr?=
 =?utf-8?B?dVRaSDdkM0xwNnJRQU9tUldmSFpEUjY4WTJUNS83U0xLbHdhelN4anBrOFpY?=
 =?utf-8?B?Q3NkQUhkVE1GejFwYk1JVGxqSkhCTUJPVnpibkwvSkZEcXExY21IVG10V0p0?=
 =?utf-8?B?eE5FeUI3Y3pHZHdaUVJNUHkrSFAxYmdaQjNaUTJKOG1TczFjaWp4ZmltbVR3?=
 =?utf-8?B?cHNLQWRrSFNZL1JwK0Z0d1NaUTI4d1VZd0l4cDdaVUwyY0lMYWV0N2kzTUtN?=
 =?utf-8?B?ZmNjUlFIQk81OEg0TXpkL3RDc0dtaGdJbXQrSTNnWklTcHNXbUw2ZzdqcHow?=
 =?utf-8?B?TnVidzFBQlpyTHZPWnE4dnVFeEdmM3FxZXBFdUVQU3dmZGVZZWtwVlRQSEdR?=
 =?utf-8?B?emczT0k4ckhlc28xQTc5c3JlSWhSVCs4RktSTkZvTzNBWFBwa3Bsc2pnRHc2?=
 =?utf-8?B?bzZ4QTI3SDVBSXhiUFV0ckVHWFpsSUxHTjRBR0ZNaFNwRXhnMTNGSlZidWdu?=
 =?utf-8?B?RnJEK3BRK0E2YktXOCtBSGxhN3ZvS09JRm84bmtWMFI2MXg4d1plemFLb2pz?=
 =?utf-8?B?bWFUY0RoNjlNb2JCYW80Tld1cEsvdVhIOFY1UktXTzJPak8xMVgzakJ1RDFa?=
 =?utf-8?B?eFpXVzBaeFlZOTFtaW54WVlJM05pV0toT2dFcXJUS3FubklHLzJOZDNqck5C?=
 =?utf-8?B?MXVEZVNUMkVJK25XTFR3N3BtM0IwdFFySnFtSVNtQUlUSmN4NkxHNmljNmVL?=
 =?utf-8?B?VXY5RG5NNlJrZzUxVXZZZFpyTEtvTEN6VTY2akVyQ3dNWVlQY05TWnFvSU1l?=
 =?utf-8?B?Y3h2NVYxMyt3cXUvZjZoSTNlOWtVdnd5Z1pRdWpDL0R4bzdiUWNaNGlSWHA2?=
 =?utf-8?B?WkxxR0pYNC8vOTh1MThzTkpMdVN5bHBBYWJMMkNSSTZlWGJ2YS9VZ0tKYXJQ?=
 =?utf-8?B?djNWT3F5ZEwrdndIeDdRMHZjU0FQeE9VSXNKdmhqakpXYUo3eUlzSkxHUExD?=
 =?utf-8?B?QnVSRDlnQ1A0cTN6TlFBTmt0amorRlV5dTFObEZJdmVZMTBVOStUaldCZGkw?=
 =?utf-8?B?QkROUWNBRTBIQkFlODdoUi96WXVnV3ZwMGZFajB3QkIzSEZmWG9rc2dnL3FT?=
 =?utf-8?B?T21yV1FQazZTMWNVVDJiV3JoemdGMmxyKzRTaURLVnJ2Q0pTbXRGaUtlSkl6?=
 =?utf-8?B?Q1poK2NxQWlFZXpIcU5LSm9BQk5oMHhVSGE2RXNYVWR5Q1E5RVUwOTZ2dEV0?=
 =?utf-8?B?RjkvcU5iaVB3cVRPS0RUTGw3U1B1azlGbytyM2RVSGVhVTA5Y1ArNUFWS0Ri?=
 =?utf-8?B?dmV3VVhDVGVEZ1cxdEd0dVoyYjRBL0JTTXBqNjV2M28yL0xjbVkrSzdsc0FX?=
 =?utf-8?B?bjRSci9pRmQzNW5NcFhpT2gwV2VlMTVjQm1UVTNGMUg3Tkx0ZHM2RWRxb1hT?=
 =?utf-8?B?bmZxUk1vRytZOERvanA4dW5TRWZxWGo2RUliR1hmSGJVdCtWaEgwcjEzNmhm?=
 =?utf-8?B?R1hhTGpYZ0hOQnBKcjl5eHVINWo4cjQzOG1tbkwxdm12UEhWRGFVWkNiakFh?=
 =?utf-8?B?eXFDbFkxRTRBT2dLdWJ0RnRBQW9CT25TMlVESkdLMTJqNGVmT2FiR3hjUkZj?=
 =?utf-8?Q?I4HgIKNKEOA3pOniyd/yFFPhZ2zgCtLJbTt0/Yg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c5f4cd-0efd-4251-e29a-08d8e8f3ed56
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:22:43.0800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEO2k0hDVBXVt3VA/4S2hFGeutLbDdrz5PVXB41xk1+Qf7hgi/4bpYPa6jk8IybUn/BQU+llBTW3ocUzJ2aBtA==
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
 qga/commands-win32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 4f4c579a3b..27baf17d6c 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -1323,7 +1323,7 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
         DWORD char_count = 0;
         char *path, *out;
         GError *gerr = NULL;
-        gchar * argv[4];
+        gchar *argv[4];
 
         GetVolumePathNamesForVolumeNameW(guid, NULL, 0, &char_count);
 
@@ -2174,7 +2174,7 @@ static ga_win_10_0_server_t const WIN_10_0_SERVER_VERSION_MATRIX[3] = {
 
 static void ga_get_win_version(RTL_OSVERSIONINFOEXW *info, Error **errp)
 {
-    typedef NTSTATUS(WINAPI * rtl_get_version_t)(
+    typedef NTSTATUS(WINAPI *rtl_get_version_t)(
         RTL_OSVERSIONINFOEXW *os_version_info_ex);
 
     info->dwOSVersionInfoSize = sizeof(RTL_OSVERSIONINFOEXW);
-- 
2.25.1


