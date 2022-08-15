Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66017592A77
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 09:56:06 +0200 (CEST)
Received: from localhost ([::1]:37020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNUxB-0005Ps-CH
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 03:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUaH-0001Ny-GB
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:32:32 -0400
Received: from mail-eopbgr130101.outbound.protection.outlook.com
 ([40.107.13.101]:9382 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUaF-0001Ew-4B
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:32:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrE8ytwuNOW4nd+XP53gIgBbp7Kiz1iVYmNnDxE10+MMXTblmBQKfAUw3hLeABA6fgnt2EXRMxSULEYj4Y69dOCOieCJmETOW+b/3Ep4GgJ5/oUoLfw/IvIAQ69PfnPk0a/C+5MsAc1s0iG56q4MlyYRtavc5/oqyhwLKzDqxhB/5Ywdp5Mz+avAjap47WQtl4hHzswqgFJXOWGNLVoelvrOO25ILU0mv2x1zEZ1AR6x6DB47gaPWs85UJzpJau9CP76w8ihTgljp/XrLLqsyCEv7mSvclCl5ST6nwK90vjXyqrKbGICIU7U+14YZI89jZDbwPPBOrHjuqzPE2pQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/lakJP8HG6nRG2Twh7MGTDE1e4PussKHSAMvDko8wI=;
 b=fTUOtreLqx0Ce7xAiV2+XoL7nj5zO9XpszUX6x3UZeAFiBHUUVW7XcckukCYHqJekMlwboZa9B0uZj2J95qE1JCrKW00JWNGIFBml8sZY/aJ/Ss1GZ6X+7mMNajlME+Ky2e+s6R2/K9SVQEjsXRpcjFRXsOsYV0U9IH9h69SOn3dwVO7AfViP7mmrgJExmjmliKoNOJAjIxfYUBB6ds5JNjc+GDg0yFi40VhfhUU6g0bpWbFena1F62BXenPoCZ6/xpHysxsrl/3dGHRvt2p83xSxIbjbdiJimiVcwCRSHtPbewKLLWeD0r1buEcCDTt+so/eqgltMEn+srF+df9SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/lakJP8HG6nRG2Twh7MGTDE1e4PussKHSAMvDko8wI=;
 b=ALvk22hNaswFjjQfhVM4KUe3zRq3Kf6kuOcUZHCVi28aS8ZnV+22JB/DaEZyYwVslIXZIm1BWNf1VGbsXFNgjzNC/sMR2QcxBDjg7h/OvGEap13Q1ewFJbS1rGluJfoqjN9pqZny8ax/iLPuKJK9f2gJeM6wkyKukPTPVW6w1Zg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by DU0PR03MB9152.eurprd03.prod.outlook.com (2603:10a6:10:471::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 07:32:10 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:32:10 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 19/20] disas/nanomips: Add modifier static
Date: Mon, 15 Aug 2022 09:26:28 +0200
Message-Id: <20220815072629.12865-20-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR08CA0009.eurprd08.prod.outlook.com
 (2603:10a6:803:104::22) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d150bfd0-6e2f-416e-a9cf-08da7e904391
X-MS-TrafficTypeDiagnostic: DU0PR03MB9152:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /1ofGCLJXjk3rbmftrelFexGiu/t3Xdgz93N1+WgenDNWFrL/kl9GdUV8vfaAv1QBytJ9Hr54QfI14qjgfDSDNWSYrzxSQcdYXqTIKtLRUnLgvOYN+YSkXMWaN9u1BxQh4aQGQj68agSt9CUWJ42BTfC3BeB5WGOkevJgig6kt1rwU9eV/Ky9C9N89ZUuE+/cELT9Mlwa1U+CI3cwKAMoQBi2sSvW9eAFfULdJar8xaN3KMeK+vq3gZoDIlH/oOq+m6z8a8CSNb11VQBz54z6+ASrJKtv3tLE89k90W/scWq6MZEXtU1ZbMhOl/SOrHt8Iqx++0PL72ks2bSHspyKsnoXUFVTNuEPHYBpI5jDxnKEdFDcMcmUusFQrsbTFUrCHdnWpsql6arlaGfS7c4BuOUNu947E6l651jOtv0xl14GWCYj+fs/B48sCuvdQSZKhOQqFzEl4AqYi9kkat1EAkhgnS12AhlqIVEvt/q9bZdG8RfwSyXxnClAG70/BJQGr3k2ejaGKnmnSHrTuREW+lA06UGLf/KVzXVfqInWq0L0dh8Cvl7JMDckZAqqNsTS6spdLiZrrhmPWgVEIOWgEqRMarH/226lol25IR9Y6xNW5O6yfwWpxebgTwjWX6S9h+pCfx0FRJ+4SkIY/gNlkKnMM1j44QDU6Hz7eR8f1TQDNQk3F6T1wFTIgxX7QQSKE9kUw7gjQSDpRJ0RibC1GQQco0D+O0rATogOiqvnEC8ENoob441q7UqaOZ+t0h1ilyVsrkGy3p8ZGFTyB7zy6QQkgPCa2uOdZv0Z1wE5gk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39840400004)(376002)(396003)(136003)(346002)(366004)(52116002)(1076003)(8936002)(5660300002)(44832011)(2906002)(26005)(86362001)(41300700001)(66476007)(186003)(6666004)(2616005)(6506007)(6512007)(83380400001)(478600001)(38100700002)(4326008)(8676002)(66556008)(316002)(107886003)(6916009)(38350700002)(6486002)(66946007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2/tgShAARjMiHM5k9ctwq1wi4hu9fQy65R79xE4Va39EXyzut8xrG1CsarBd?=
 =?us-ascii?Q?DYoYuP0Qxgnkyo3hCHPIgnd0J3T3N8Dnj7xBPpstYIsybMRgHh7tGttuqtOe?=
 =?us-ascii?Q?S7wyB/F4HqGxz1i7u6SiJTZWetv4h/1O6COtYlFx7SquYWPblpWiGhzljfVN?=
 =?us-ascii?Q?rCe/JofCfqWBsPWvfDgHIVaZV8eWgvSsOfTUS/Fe6/GE+B0hG7qdZ+RvIs70?=
 =?us-ascii?Q?nRJrqENCDyUJf3dRy4Rui8Kn6PhAI/u7J+cbMrYVf72GmnlPBeYsQpdzu0NU?=
 =?us-ascii?Q?tJJN4FHH2ckP+67PjD6ETnnOdCV1ZJSCjN0sW8/hxyaPod3TPK5T7pcY5cGR?=
 =?us-ascii?Q?arJiizhRtKV6PmGktzGeK0khklD9RzZOzHMC0k7QMSKCYzDHcPISMj9XQcBy?=
 =?us-ascii?Q?qMjXUkeUT6N2aAIIC8wJgMIYzJepTrdLST2p5Jq99wgqArzVCE5LZjO2QPH2?=
 =?us-ascii?Q?iGC75izuKjWXfBLdc0eEP3w0DJ/hw1nGIERVz4YCRRS2Q5lLuRiHEjiGPMa/?=
 =?us-ascii?Q?75Xi4d2gG+XycG7TnbvCxVi9kK42W/B0cSwOYQKydNkPnnQUXFzFtqTzY7Tp?=
 =?us-ascii?Q?5bqa3E4P15ygjeVmhR5058RBu76GH3irlHK7014fg8CWPsKKMneBedst6DPy?=
 =?us-ascii?Q?JgkH8bNvfKNbTYJ5KhQzoe9Yp+BPSRzrFm/jJk+/JNc2rTWjYI66ljNzDAKa?=
 =?us-ascii?Q?1O/xYBYsc8GVd/66HyiW2kKzAVGNKB2/tRg0MdFI+GSK+Q8NgXcOdbFOV8qD?=
 =?us-ascii?Q?B8wjegqyqdPmzp9beh0FwvdfocP1GfSJUvKSlWaK6SYguAS+Hos7gQGCUU1i?=
 =?us-ascii?Q?amz2uuPpMGPmlxW47xCWFwI6OlfTVkiA22gNSGhhvwVBDnK6Ync4sMTaj68d?=
 =?us-ascii?Q?4rqMtwNizsQAsWXdn+AM38n/euhCtBKgLwFd3AleaNvp5T7rvVBPorNHGuql?=
 =?us-ascii?Q?a3y756MVtyky7RuHU4BOfwPU1zwEEBCuLi4afL6YMqtqz8OqMOj1Z6QohH+8?=
 =?us-ascii?Q?oWGqXBBninOouwr+A8yC7W/43/U6ChNuYEy4it0tQK58hBB1L2CYTcRVQAkg?=
 =?us-ascii?Q?FE8mdSskDdZYGHCltWSJ7aA/3fOuLuk4MCzLa4XvYF/1W46dPvkqU8fElpc7?=
 =?us-ascii?Q?LQ/ek2AFytqC1th1oKVh/9lHHXMwAITbUALUfxYV8mI2/OdrYVFiWH0FSqZt?=
 =?us-ascii?Q?/MWXR2BUEJY39TuOVm8jzFv+tKKds0V+Ww0SR4ky2r8qv9AAnuOaa/TiwIoh?=
 =?us-ascii?Q?gP5m8JJICceIMJ7MGEwLp6d83u6zG1IaOpMYnnMbf76mAh5MH1RmOi2hx6ZB?=
 =?us-ascii?Q?yUq8zQoORcfcSNCtk+eoB80htaFhCpEsomozYSqVFq+1BK1nFgdoBby8DFHV?=
 =?us-ascii?Q?AMTcEfhP+XLMd4ugIfmXck8713XWYnZCLfBPqc5j7v2WP5OUbrDJ5VhhL7hw?=
 =?us-ascii?Q?h8tEZIACcgCPdkEyl7nFpmze/9RJVHsYqmmWMKiV2UrVh1EaFSEaiv1leCsB?=
 =?us-ascii?Q?oQ05Kl3EosAxXYAMS1wXN5yBKNG31Y1xStgBSw6Nl5jjXNRZz9sUcZLx0agi?=
 =?us-ascii?Q?H4OHW2YZ6/Cyxn/oFbRo/xxlpMTnCKHHPwexgXbrNGt9jkzSyoLsklYg24oz?=
 =?us-ascii?Q?2A=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d150bfd0-6e2f-416e-a9cf-08da7e904391
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:32:10.1450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D23H0YfNYG1MBpucqWeSMY9WTlXeH+9Su8qoZOWPyx9o1li5hIZVagy9SBinY5Mo+URzJF3XwGBq+GmHu2ImFd/BIYH3KSbbewTvIvM52tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9152
Received-SPF: pass client-ip=40.107.13.101;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Modifier static has been added to the remaining functions that shouldn't
be used outside of the nanomips disassembler.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index e7d6bffe84..6cb527d1f7 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -114,13 +114,13 @@ static const char *to_string(img_address a)
 }
 
 
-uint64 extract_bits(uint64 data, uint32 bit_offset, uint32 bit_size)
+static uint64 extract_bits(uint64 data, uint32 bit_offset, uint32 bit_size)
 {
     return (data << (64 - (bit_size + bit_offset))) >> (64 - bit_size);
 }
 
 
-int64 sign_extend(int64 data, int msb)
+static int64 sign_extend(int64 data, int msb)
 {
     uint64 shift = 63 - msb;
     return (data << shift) >> shift;
@@ -463,7 +463,7 @@ static uint64 encode_shift3_from_shift(uint64 d)
 
 
 /* special value for load literal */
-int64 encode_eu_from_s_li16(uint64 d)
+static int64 encode_eu_from_s_li16(uint64 d)
 {
     IMGASSERTONCE(d < 128);
     return d == 127 ? -1 : (int64)d;
@@ -22780,7 +22780,7 @@ static struct Pool MAJOR[2] = {
 };
 
 
-int nanomips_dis(char *buf,
+static int nanomips_dis(char *buf,
                  unsigned address,
                  unsigned short one,
                  unsigned short two,
-- 
2.25.1


