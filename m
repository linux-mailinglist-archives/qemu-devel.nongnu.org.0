Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C615AD037
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:36:13 +0200 (CEST)
Received: from localhost ([::1]:49528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9Se-0002s9-Co
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8te-0004h2-8O
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:00:02 -0400
Received: from mail-am7eur03on2092.outbound.protection.outlook.com
 ([40.107.105.92]:65153 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8tc-0001yU-CV
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:00:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQRfAaPz4SxUXnRJtpWquZ6Rne/8IQi7AEQzHpAv4eZ3HUjV/ssjLDFvXqe2XwLPhC+ltqAt5M2q5y+dtJWDP2sYNiNt9dY3/MzduObHuuBGIl/PGu2WyW5hx+Jc4YXzOC+8VbH3NbF4GyP0hz2avbikRx4tntGUKjXW9yWyN8zXTaNycTAk3cuKZXa0M1srS36nz34PHUeWx3Mdd/TEkMaztA1AAKCWHcuOtlQGYRc2Qb/j82N8N0Ld66j/vv638l0qYAzH6rq6P0rhtvkfuncKMwgxFzBe01Y9Sx0dLDLQYeigRdldUl8+WF29BPTYB397SkbZbU0qA64kY6RDaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITj86skw0bes9Y1rIL9drGQJDXOhTtVTo3yhShIp7vk=;
 b=B8Mkqd0puPU/PHDqn6xec0AoHyNomoxKa0o3YT6C/Ro2iHSSDeVL7+vW0TYgfraz6gqh7GAhv9/odbnkA5ZXjvBXXPkPPMN5xD0HfJVCnvYaJui/6Dlo5WWlUdRJAWndbz0dPdqucNsosHNiKdpJxXNZx5ib5yYNzjPFZmVKWL/QMIpyLl9Ubj11JA+jXcMpCZM11nGYMAGvkwvj1oj8WWbRw6lvtXeoQgLWoM5WqpQ+2Cx7Fvg/5Hl6uw1VjAmtHnfkLVNDke8HToRD18PTpOTtIoHbWG2XOJfsPAqWHJW8dEkJ8o9Y+C8K/RFJIJKLx/zkPagZKjfBMc7Qv/fYYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITj86skw0bes9Y1rIL9drGQJDXOhTtVTo3yhShIp7vk=;
 b=PsmJF2T4UOF6mVTmgyAWBn3X8z1vh+Usv7H7z+pMawsHKUqQnwK7c08dGoduH4vV/foc1NJRP5/o51ltNBoxMP/Xo4W1MZZzcBpupLAHkXy1g6QyxNn4l9e6bSSpjbAwl7I494vC8MTHWAYE3KVYDKs9sUUdG+XDc7iLdInWumk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS8PR03MB8740.eurprd03.prod.outlook.com (2603:10a6:20b:53b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Mon, 5 Sep
 2022 09:59:57 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 09:59:57 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 10/20] disas/nanomips: Delete nanomips.h
Date: Mon,  5 Sep 2022 11:55:12 +0200
Message-Id: <20220905095522.66941-11-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0602CA0023.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::33) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72d43bf5-c142-4a08-887e-08da8f256379
X-MS-TrafficTypeDiagnostic: AS8PR03MB8740:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7MLFKYUBUj91bQF3ew24R4Zu1mp5fR5wrryfZVBmr8GiKQPUipsUtNyX5VSpE8EHx8n2+eXjMHSZ/byX5oX6RLNhqQHyrt50Ar2D1mDsvtJJf/4BwIMvNz7NtrFhx5VMa2ytAzsZoqDsA1ki1Xx2dkdVkPJdEBIRtohDSKvhQHC1PrRWndw8/r/cXu9VjzZ5CzxjgAGh252TsMSFxwLy5LSl/e1NA5xcjiqq3s1es77rigsEwgPDdcOC7nilz61LOo+yVOcr8iYxCpmra4wXQNmQtwlBKGdVHMyKp9rgSXULVhoBMzqGXlViikq5Y2aAlkLdtDcLoT4fUd2PnDD2vy68u7GUnQolBJUbooQfFq0kEE5MlbMIcVgKEKqzdLIWT7SyE8TvmtqA5xI9LCnfr5mIR85WKV0PXc9SMc4+PVaOdR8xrt5tQ9EKHVPHqbVqEeMOUhXWfXhT9dCrbem84bzaylp0Zw3HFX7sQxNdxSB8eWVqceYp6KHtvJlJUc6fJ5ubzcp56H5RYMBcz6Sy/1rriaHpSaTg+WmWg9S7BLnLzVRKnNBeThUDt7TLH2z1/mA38ZgP0T1O8hrX5soBVgwENkduA10EPSmcA9aGz2j6CLUamOVpxdfCjhNNQ8XgS/SiWp4edWS8m8ktqUggXR4SEO2gYmOCA8sL/HYCWjAdKW5aBT7orWoK84Nl7omhi7eoyDqLL+hUfxM8zxMoRISRMzNGEhFj88uCCfRg/5bI8aXXSj0xIdkkBeX/j40z8h+luREfm4dWzfAnZAKOQAz1y5d7Pmg9vct83jWZvNc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(376002)(366004)(396003)(39840400004)(7416002)(8936002)(44832011)(5660300002)(2906002)(38100700002)(478600001)(6486002)(41300700001)(38350700002)(52116002)(6506007)(6666004)(316002)(83380400001)(6916009)(54906003)(66476007)(4326008)(66556008)(8676002)(66946007)(26005)(6512007)(186003)(2616005)(1076003)(86362001)(36756003)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkNqbzhwUWNuOHRMQzQzQzBUVUZxUEVRRGQxMXpsRTJ1UlU1V0xYWDZvK1hH?=
 =?utf-8?B?aExzdHNIaFdMKzhUUzdnZWtDSWo4Ty9HcmVLMWdleW9la1FpRjdHK3IvQzh4?=
 =?utf-8?B?VHlFMUJ3WU9XMDE0ZEQyZDdOMTMvWndPbzZZdW9UM29kREtCR1pHSU94TDlK?=
 =?utf-8?B?ZlF5VTVZUXM5SDcxWGFwaWdpYWJ4YjNZdlhQcDQ1SU94c0pvVnVOU2psVVNL?=
 =?utf-8?B?M255R2VTS1pUM0IzRXlQTWxjcm5PbnlOeDdBN0daSFNCcVVybFBISS9CVU5y?=
 =?utf-8?B?c01rNnBjVUhDd3FhaFFMTFRpZXVyT21ZYmprcnZRanMwdmdhZ0UzR2tkMlly?=
 =?utf-8?B?NjhHTzg2eE9zdWNHUHowRkJWM0RxaTVrKzZidXRVY09XV1BKU0VMaFUvNWxu?=
 =?utf-8?B?RWhEM09YdUN2TnMyclhoTVFITHpwSUJHUWhDMG1Sa3NQdk1WZzdDekx0TFE3?=
 =?utf-8?B?REpYcU1yVytDSnFYVVc4ckprL2w1aTY4ZjFVM08zbFhmVWplVkIya0R3M3Z0?=
 =?utf-8?B?QSt6NDlhdDlLcDJFL0M5bjJjZzhoaWZZbWdRN2dkQTVKWWp4bkFIb1c3Rm5W?=
 =?utf-8?B?cDdxZTl3KzdMRlhoQ05DZGpGWFFYRFZqbGpWcHFoUk9aV1d2SlFodzVXL1pJ?=
 =?utf-8?B?V2VQZWJ2alFiR24xWlNWeHAzMmdIOGRRUXhMNTZ2WjhCYzZnV2RFTWk4Tlhs?=
 =?utf-8?B?ekt2WExaa05LeDB5bDA2M21rNmVKTHEwRGpxNWRDOHRobmp3c29QbWh4cW1V?=
 =?utf-8?B?N2MxN0lYMlM3RkRXSEV1SHA2czNWYUtVVkJXNkxoaDcvc2lKdHZ1K054Wndw?=
 =?utf-8?B?VmtKMWJmMWhPM245Y0NtL2tkUFM3aVZxNkw3VFhHY3REOC9Jc3ozb1lXTHlE?=
 =?utf-8?B?dU55ZFVzREVuTEh6c1BzY1NIaVdRcDh3Q0NnUFc0SCtMY2c3NGc2NncyckVt?=
 =?utf-8?B?WlBURHZqUWpPTXB1VUJHRG9VYmlYbGNzUkR1Zy9HbnpWWnFSMURqdStYSWJW?=
 =?utf-8?B?MkVubnpHWmpvblByb0w1cnc2MUl3VFBUL3J2cndTb0xFbkxCUXV2UExJeXhL?=
 =?utf-8?B?bGlPa2srNTZnWWRxMDkrazluMndKQk1sU2ZLV1V3NXFCTEp3UGI0RisrRVF0?=
 =?utf-8?B?dDdMUkNCQlZMci9tUWZaSnNMMjAyVmYvVzBHbDFaVWFQNVhRVitXYko2Tmhk?=
 =?utf-8?B?emFnVStYa25yQmx5MWppejZRK1hFdzRWRWd3Kzh4T2hQbHRWQmhZQnI0cUxt?=
 =?utf-8?B?TlVVdy95bUo1MXNWTmFBeTdNdXZqcHJQZER1Q0h5UHQrTnR1ZmdVd09wcXRS?=
 =?utf-8?B?OGxncGVpRzBSL3hVQzRsSkx3alVZTVZkTjArVllZelM4QjdoQ2ptcmxkTGlx?=
 =?utf-8?B?bzhUZFFUQUoxSWtVR0M1QlQ1ZWw5MUIybnBJckFHSmJnMmh4NlREL3o1a1M1?=
 =?utf-8?B?b0xZWGlTRXR4S1FxRVRyNURXVXozdkJzSzdTZW5mdElqbHdYTmhycFhNcVdB?=
 =?utf-8?B?WWozVVdEWXEyY3BaTzI4ZXRvSjFOaHBMQmZ3RWxkSWtpRnJJeDVFNytuZVVs?=
 =?utf-8?B?cEx0K05CV3k1Q1JFTHFiRVp4b2RyNlZ3Z0tqRVVqM21GYVBlUlFpUFJMNmow?=
 =?utf-8?B?UXZJTnRZL3UzamhVVnZHNEJHMnl4NmJwSXkwZk1NbWRWa2dPNGYyYlBNVVFm?=
 =?utf-8?B?bDU4R09wVmgwaFNCRnhyUnBXVW4vamFCRGJXYno4Znh0bDBrbERJdFdJa0tn?=
 =?utf-8?B?Sk50L1dINDVtdTZwNWZ6MnVBWDBBWUtPOXVHRDJQNTY3ZWV1NW1kTk4xYXRh?=
 =?utf-8?B?QnNyWlgwTUlvSnA5RXVsNFpYbnBEUWxiWUpacWhRR1RMTWxBSjMxMzFhOXA2?=
 =?utf-8?B?MWRYWG1CSm9mUXRCZG1pZXIzVmlpOWQvYWdIK3FZRVVLa2FQRncxcXNnNlhQ?=
 =?utf-8?B?KzJRdmplMG1talRKZEh5MXNuUnNpOUw4YnJNM1R3KzZZaVhBaDByazBpV1U3?=
 =?utf-8?B?eTFxa1JteDdYMjNRRVNGYU92RmFhTDFyUDd4VC9QSnlSdExHWXNESE5CMis3?=
 =?utf-8?B?UFpaOUpwTzFVaFQ2V1VPdlFJYzBFRWNwV1dtd3lnS3l6N0I2eTZEUEc4Y214?=
 =?utf-8?B?Q3EyUFl1ejZ0QmN2V1UzMWd6KzltTHhoRVgrZ0pNNVZjQU15Y2I3RmJzTW9E?=
 =?utf-8?B?VUE9PQ==?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d43bf5-c142-4a08-887e-08da8f256379
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 09:59:57.3067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyqnagCSMZjTClb4N/dHLBF9j44v/qoU/3++fG3iY84idKENOrqy6P2x11VsuOgA1pYjZwc1PxO6J2cMx8ZCYDccRqcguhvwiC49B50pP44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8740
Received-SPF: pass client-ip=40.107.105.92;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Header file nanomips.h has been deleted for the nanomips disassembler to
stay consistent with the rest of the disassemblers which don't include
extra header files.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 disas/nanomips.h | 26 --------------------------
 1 file changed, 26 deletions(-)
 delete mode 100644 disas/nanomips.h

diff --git a/disas/nanomips.h b/disas/nanomips.h
deleted file mode 100644
index 0fd7299900..0000000000
--- a/disas/nanomips.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/*
- *  Header file for nanoMIPS disassembler component of QEMU
- *
- *  Copyright (C) 2018  Wave Computing, Inc.
- *  Copyright (C) 2018  Matthew Fortune <matthew.fortune@mips.com>
- *  Copyright (C) 2018  Aleksandar Markovic <amarkovic@wavecomp.com>
- *
- *  This program is free software: you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation, either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program.  If not, see <https://www.gnu.org/licenses/>.
- *
- */
-
-#ifndef DISAS_NANOMIPS_H
-#define DISAS_NANOMIPS_H
-
-#endif
-- 
2.25.1


