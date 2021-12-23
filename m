Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C25C47E919
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 22:33:31 +0100 (CET)
Received: from localhost ([::1]:35324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0ViM-0007gp-MP
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 16:33:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n0Rz3-0001LN-5D
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 12:34:29 -0500
Received: from [2a01:111:f403:7010::711] (port=15881
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n0Rz1-0000CW-Lu
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 12:34:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSap+fX2ifymkqOh3FDAVuqPyhlb8O0gMg3Mo18AMagummlw5/UEEK+LXjKWlku6vT4Wtcvhl/VtAn+0Uli3jgYIrJcD4kYIxA+zBonSDNmIWbWxwHS9PO4h8X9DyYcxL21yz4GMzWPAR6NylJ4dJbCLB/tIz2JGwHLM/viP4XMvYM3jfpCxYNoC9a/AEmLIc8cuH+jTl1BaH45nGo9MO2oaPCJlLeGY9wGAVaMCxotJ0zS7mSeaGhA/E+IRIWgA/8iEWxRORYYXyUfR6h08UnMMU5x0jbpVrnY0Bn+WHrLio8CJ5aCrE8VimubGm4yHiRmnvqeITR9QY27UGzbPgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afbpNv9F6HJOACakV3xKdAuYZSJBe0xyDasQxOohdLs=;
 b=BuajMkSSbbasdc0t1Uf+YCa/rbrIjAgOZrrV2bKIOeICwRwKVYKsTtTySvRAGsaxjTbY66NCRxp2uynApU346TVmIqRU+fj81sunPym4t8/yeAktdxerplvZIXTT7XHoZdQWcEPQJi8TrE1j+4ipZ0lLyLlrLeBJTVrJCPl3gAbYC1ubh3DaO9tjnHyzu4ztUR1t9cjJ+2sIbAJHnBpU9pOftmwJJzlfV3EZSWZXjB2Yo2khQfrgcbwYE8vsbJzg0mwtZGc0wvozIUbU5mc+MqqCAvp2PUceMzLoDlxcs1MBjbd/mRBvj6C9RpRXq4kI/63B5pPht65GILVxP4BcCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afbpNv9F6HJOACakV3xKdAuYZSJBe0xyDasQxOohdLs=;
 b=e5v9O0B0sxSPazVouEFvHYKXLFkEEpDpoSmqln1ZAI2iqKake//wREyrDnRUdV6KKlK2eLqZYZxDNA3mEhnhQO3HC1M8YkzUFct2++Odw5mkoS9nHpc4gmPU1A5eaO9Z3H5jGFyGwXOCBRv3aNeVWbBpCd6RMobzXR5ffxQN5Wk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYBP286MB0032.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:801c::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.18; Thu, 23 Dec 2021 17:18:39 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%7]) with mapi id 15.20.4823.021; Thu, 23 Dec 2021
 17:18:39 +0000
Date: Fri, 24 Dec 2021 01:18:37 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] MAINTAINERS: add myself as CanoKey maintainer
Message-ID: <YcSvbX7z/B0mBWkh@Sun>
References: <YcSt+qozrl+J8ool@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcSt+qozrl+J8ool@Sun>
X-Operating-System: Linux Sun 5.10.81
X-Mailer: Mutt 2.1.3 (2021-09-10)
X-ClientProxiedBy: HK2PR03CA0047.apcprd03.prod.outlook.com
 (2603:1096:202:17::17) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67f69d79-5e71-4718-a9e6-08d9c63842e9
X-MS-TrafficTypeDiagnostic: TYBP286MB0032:EE_
X-Microsoft-Antispam-PRVS: <TYBP286MB003244CA768B4CB1A828EBC4BC7E9@TYBP286MB0032.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:214;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u6T3n2pUKTKf+0W99BvWdOphuilj6G1hjAfxyXwce8VDaHiyswimoiE2tJW8FUwdXr67saMFJdAGcjBVQ4TEsiHuPTKxEyApTqg8RDdToWuJIbb4TXvrCk2FiHTHDtBbpoyhoJWPbGYHJa/FbOvu6CDSxgk/p3XyFYDX0ET3lfHChXplHOA3moiwA+iNMw+tWRA1TRLwkDxcmlJmsOGj9HSmcymWfZ2DEDNcwp+N0dC4KxaDWk0H2PdolJeV2Zv0cMr7un08vAdG8aY8GviEqEnVqU/Okl2IJGb7OrGiLGioAT+iiBxWVqj+tErtyvIbOTR6EinfY4sDsM0ynfgdlJXU59e1uOv4wIfP5JszNpETY6VSjfZhDEvTWlokHCV7wAtgp2/H5BMcaSG1/Js17KRFJYr4bVBrrh9ZZ4zKeFxocI/dmn3yg0DiPcz3J8VVMGi32UtkYrqgmF+WchYthOqAbwIyMqpahv2XYZcMWEq280gsYhvwQWsmpFRfBRwBctCEM2tt4DgST4ssGilrSe2NLu2kNfgYtiUO9YakzPPDxFaXYqM2AqwUv047DUXBVtO3qTMhAMnSMZ9SZdwwQiwjZYBWNXMP9wwdB/ZmapZvoipiDpkKafIVAfmc1vdrUhGqzChw6ijN9A9FeERxccK5yaqeys0Ig+gSru+1DyeLdkuJ6rmvuQwLUjK7lam8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(39830400003)(376002)(136003)(396003)(366004)(346002)(186003)(4744005)(4326008)(6512007)(9686003)(6486002)(52116002)(38100700002)(508600001)(5660300002)(6506007)(6916009)(66476007)(786003)(8676002)(2906002)(8936002)(66946007)(66556008)(316002)(86362001)(33716001)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oc0UMKjCVTgDhgVHW2AmSYuPuuuEPIz6i0Upinm9c1CyCLdHofmZbWtwfnhC?=
 =?us-ascii?Q?2wg8rezz8ZuT3Pv/UC1sJrpMY8QGtmKtN0VsSw13kcTsoCnTBVikZVb+i9hw?=
 =?us-ascii?Q?JNY1lGk4nN2DZOW/QYcsVnkMc0AenQluFvy9wJTbjQ3v2g571MIBMTSnR3k4?=
 =?us-ascii?Q?sTYQ1Q6sIuxfVVkLMataUj6/aooPUwf6deWLlkCM1RK5VkTWgS8nC5Dhg9sC?=
 =?us-ascii?Q?dFM/QdR/eneNmLFTx9Q8gk6960ytfFh9yhPhJgXxesmoDU/ZUJkHz47qtewv?=
 =?us-ascii?Q?Xq37aTKFzAy0aK5fhXTeCrMo08kCvctoizVk3wwZMPTFcer1Y12Dc+5a613i?=
 =?us-ascii?Q?0+eo3Bj7rvRBlz6Aqq60ZAQIbzXvMMCUoPEygztIy3rh9ehb4xadg13IMvMX?=
 =?us-ascii?Q?Y6JRRIMt8DjyAZYT2T/XoCk1WdWWdfTbexKBLVJ9Oaaxd4k7HY6XWt/063d7?=
 =?us-ascii?Q?w4pNbrDTMfFFVgVf+cRMYGizYGVgaz/6idZ/JLNp3tITj7h9m8CYORomZaBj?=
 =?us-ascii?Q?UCtKcXxUb8wlxAvL3oWcReZNSA4uuQxTa6tBkMl4zOUC+mljWZ1D+JSvkeJh?=
 =?us-ascii?Q?vPH2my2MkqPId0rUmg8D1lLA0XWZo9/9uepQ/SDNTQHGaCwuP0J0FFjIh04c?=
 =?us-ascii?Q?uWlb6TExXn/cDKhQQ61pLLWVUjyegH2IdTl22Ozh8pgwozxXWPYHV7cPdtDU?=
 =?us-ascii?Q?+bw2JMBeTyorH6sbhUYQSHJo9iFdngZRY6x3qARMPJsxOsmzHa/ewhbtAfe6?=
 =?us-ascii?Q?hUDEJh4odVvsmMRWFsT4udw5lxNMiX9PWVpJW62QtgEZbw9JLtSMvaanPSfp?=
 =?us-ascii?Q?IinT7QltUk7+oe6qWiEGewTtDmIWq8sizyu1vNFnLICmMGsHCMYWVL2yCCqN?=
 =?us-ascii?Q?bSF+asicmNoU8FNZuv1dxCox1mR2lC3q2xvqcVCco2zp3iROFaEiwhzYn16n?=
 =?us-ascii?Q?ZQviaX2EpK/d+riiPq0jVWAXIieV9AHmFSBLt4ls0yU198kBXG4vnBcXEW1i?=
 =?us-ascii?Q?cAqVZ8PlWolCu6HPZdRTS3FrLc5jC3Lr31Ud8zvFEaa9aRM3jN7DB++hqOeN?=
 =?us-ascii?Q?6LG6f00VCcSbCU3Pa61bOHeZ7jkHgRszIVRLQLHWi4/1cYT1AfS2ICeJzpfb?=
 =?us-ascii?Q?HQp8YmfYBKXXbiUQ7/Pq55C79hl8UXAW9CbmyQVDhmZk6hiTkCi2ACN4fxF/?=
 =?us-ascii?Q?Waz/UUiiJ043FTnoDFkdG9qOVMFMeO9Bx0Mqgw50W3zmn7x94fnXMWNMG4to?=
 =?us-ascii?Q?8cfpM2nUrwR77ZfeyGQCckYo76enQ6uFayxFZyJ91haMCM91PoMsgg9H8adX?=
 =?us-ascii?Q?IO9LDUqpfpP+R/myvmAi4Uan/iqAOQNYQEK6GYQJKh62yIV6UxiuUu2BiMfD?=
 =?us-ascii?Q?zicaSCjVHytGAdydumoJGMhEduunHcBYixMw/5P7nWwgIhTeKh5HqXzUpe50?=
 =?us-ascii?Q?ib9pPjFvelRH7GcNjRRhf/RhlgHIWC7Xy5n7jf97TEA3EshuENZICFh4pMTe?=
 =?us-ascii?Q?tUSgUnKCSIMnAR7LhDBF85F+4LWQR067GMIblgxqxeq2QRBExRLDRp60H0jc?=
 =?us-ascii?Q?k186OF90PkmZDqMxIdR3iFzG2//K1YiV62wj54nx?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f69d79-5e71-4718-a9e6-08d9c63842e9
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 17:18:39.4587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STzuHJioLQ5cIqRgKCZZHjc+UR/hFtjyObDNk8cS6RPcAR3nvoeR+pZWcDEyp8my
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0032
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:7010::711
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:7010::711;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 23 Dec 2021 16:25:05 -0500
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, contact@canokeys.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5456536805..522b0e5687 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2295,6 +2295,14 @@ F: hw/timer/mips_gictimer.c
 F: include/hw/intc/mips_gic.h
 F: include/hw/timer/mips_gictimer.h
 
+CanoKey
+M: Hongren (Zenithal) Zheng <i@zenithal.me>
+S: Maintained
+R: Canokeys.org <contact@canokeys.org>
+F: hw/usb/canokey.c
+F: hw/usb/canokey.h
+F: docs/canokey.txt
+
 Subsystems
 ----------
 Overall Audio backends
-- 
2.34.0

