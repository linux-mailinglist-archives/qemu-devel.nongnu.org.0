Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A2569FC54
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 20:37:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUuuW-0007Iz-Rn; Wed, 22 Feb 2023 14:36:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pUuuU-0007Hr-KS; Wed, 22 Feb 2023 14:36:14 -0500
Received: from mail-bn8nam04on20721.outbound.protection.outlook.com
 ([2a01:111:f400:7e8d::721]
 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pUuuT-0005XO-1H; Wed, 22 Feb 2023 14:36:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9X1U0geQyXFMUlMxOEEbPRNxZpOow+3UtuvAstKfP94jxblEz8QoH0xXq09TfwRFwkocASpOe1ujFp/WxEYGxoRV+zvzyDzE+q0z5Eol2XOaZPw8Yk41xC0F7R+2M9/YUmYLEfqe7RlXAmMgR7v49GBYZL6Q6qFhpJXd7q/9PI08WJqS+vrvVebcaO/T0y3w1D3pH04c5Z+4mk6UlCXHS+eDMNf+sjslUXhedodegg1uHhW2yPoS1e2CB4zvJBMYb83dCz07bwRY6NACitVzAWyS7MQWhs+9Wevp3i9V9Ly46H0PBhfrXc/aFRF2NfF8Dgis9t8+tb/SFuh3Xnq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Us8yGBQQo2+X7GcbXo32ObTU+IRgTK5fx26SfEsyVE=;
 b=oO+Eli+D25GqXL3aA4KDlv3gqHOJBVtqon339xU4wLjSTHerj5EzVNd+mqmMg4lqEEscylit6vCobPN8GM7zUNUTNBVOMOzSxlPuwCn+R1hVALnkHsEOHU8tmnRo2tYqzzOcbunU5A3kMYWL98wEtKkjq7ZHYVz8Gyv9JihV3cq1XHbKPLho0Qbddd7/Sjx/l6boiusmPDeruKo41M0SYasxFRYS3IHc6O99hEM5zpO+BZ1p2NfYXZ/fPr/HTlJFiWNcJWJSQ4UoeulXKpXUty5uE5zm6YDZo2yd64um5VKeRfO1iZRpMq2T/vmm4RUrwNb/rXiYi8jYOkxWjdL/ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Us8yGBQQo2+X7GcbXo32ObTU+IRgTK5fx26SfEsyVE=;
 b=RX5SWzGoONSQRGZCcn/j/4NFU133LMVee3sfl1hMnI60JlUQkZfA8Nt6kEMi3WDLyhOdLbq0MyebuTP9F0w9kwroX8LkulW6/1VKpeEQZJ7562tEco7TD15hGXPX8Tldj0LGhbr3r49AoH6TV/w2cdpGk2+WPuzmsKR5+aPcx28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SJ0PR01MB6448.prod.exchangelabs.com (2603:10b6:a03:29a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.20; Wed, 22 Feb 2023 19:36:07 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8%9]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 19:36:07 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v2 3/7] target/arm: Implement v8.3 EnhancedPAC
Date: Wed, 22 Feb 2023 14:35:40 -0500
Message-Id: <20230222193544.3392713-4-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR08CA0016.namprd08.prod.outlook.com
 (2603:10b6:610:5a::26) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|SJ0PR01MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: 099aca07-15c0-47d6-44bb-08db150c0b20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /o3ODln4r+nwouZQTHJPemu/3ERanqmo7/No8PrVqmZRVlm9OMZUEswvF5hc5QMimq5eE6pIW8fRbXd4pHz+DhceFradImnaZ8pfWE1J98IZxZK0fqFzyFj4Hkhn0a32B41k9F4nq4gCvX2zWBHV4bH0GGkRDNBQBw77ifLMzIpmnQSAv3kglyNOxRBK6L+7f+Grdjf1oQxodvSmxmv1eSgVV17jbu0qB1S4Udy3z7T6GcnLAhVhtIkUJinkkdnxBTGz7Q3f3hNDhVMmF2DA7pKUDk7QpCo0kUH8C+qBhVsL4UD3QEKjpm7ItDZCu2tnV6PGXyxvGo0FrIALWgtmKfR7/DR87UDDUVb7py21/GcFR+cAtCFgM2GEi2QjsWEw1aoN1yJSgF1cre22WmU4o4BWUO0Uew2F7K23SaeSDQPs2wyg3IuPLGxhi8ULI8synKy6N+odyMsBGkxZcxggCsQamOZtfupjv6QqWkjU+3vKcx2lgQYdjUdSqoxzWYNE5OsVCQP1y0XY1i0xpBOWbJ+5OgBm/ZLCBmoGVDcNLJ+IADsGy3kc1MlYB5b6Avuo6uuZtzxgaTSyN6ApqGJ9OgAHkv5YF6ELZzNYcH0fejiw16sBokoQxZi+Hwn+IFEu/VuRdM40xhiwWfaPqwi7KsG1ciAL6eEIF/znhmHKA08g+CSUUouLSGNP0Sy4IEavyD+dhKKwTdYEivVtZspTHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39850400004)(396003)(366004)(346002)(451199018)(8676002)(66556008)(66946007)(66476007)(5660300002)(316002)(4326008)(41300700001)(86362001)(107886003)(2616005)(83380400001)(26005)(38350700002)(6506007)(6486002)(186003)(6512007)(1076003)(6666004)(52116002)(110136005)(2906002)(38100700002)(4744005)(478600001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HjPId5w9GWDblZOQLlKbGkHRmnB2b8egIFB11AD9mUv7IG+T3hwFGIpU2SIn?=
 =?us-ascii?Q?q2Zo9F2Dv9Bi7JAmlfwzfrQoO96W18Ti1YY557tWmqz15h5sSTTGyeqToclM?=
 =?us-ascii?Q?gO2yLNv2HnlQMZmLgPpG9x20CmzqpxchL/ByNAYCJBRcgV+RDWWFlYTnwHmb?=
 =?us-ascii?Q?884/Wr1BulF5WnvK3mv9J5j96HCh83HDEf4NegG26aYYPHV8pXyzk/ytIrx4?=
 =?us-ascii?Q?PeqwwwXc3UNlcLeGxslvJW7z0Rz1Q1FqhnWZz7sInJaloNI6b4GVyO3Cak0M?=
 =?us-ascii?Q?uDLPp1KKT+Sixhjf2g4vDEgAcv+w5yuJEEMAaizJfvkHI55iu+qJJSejp1Zy?=
 =?us-ascii?Q?EuYZXOW/oodjHnPllICclIr/QE/1U48cMVv+XPAYmiBjwJNGmaHUvre4+SgU?=
 =?us-ascii?Q?WGTXvQfIpUpf9lV/CAF4mCP8DUxACMN5q6+IK8VWOmMD2Wc/K2wS1JIMvFCU?=
 =?us-ascii?Q?fTiPpAPourk+9pdMtN3srgvhN38Ux8aRSEAOLbGoILOl/mumiLso2dQ//RGW?=
 =?us-ascii?Q?rwUY0yEdiZrdw5CzbLA8Eg6C874qbdN5XoIIxPu6AltYzS3ImEUd1FCr9f6o?=
 =?us-ascii?Q?qbY2hEmbVjY16CzZqQh7TuW3XNL9Sskd2KW8Qxu/OGf11/QEC/5wVDgLhr8t?=
 =?us-ascii?Q?JTwGvsu2I4f3GwARytio5t8Uu+ajVOPr61Jc8ST5L4KJNtAPJwDVM2ibg7Ax?=
 =?us-ascii?Q?0xauHSNhrBgl6sF6elE1cqYKBTMiUCgDviPCRUzpct5hVa0Uscp35F1PSGb3?=
 =?us-ascii?Q?BVs3B4oe5K3RtwA0blEld4oKgJ/6EPyi0ZmQd5P7B/nW9HnrCMuFdY0EjcAj?=
 =?us-ascii?Q?f1i4dqXXPOhgCaT0alFFRH6hFxYpbx62pH8Qjp9rh6Trgdr6MND1C6cAXEff?=
 =?us-ascii?Q?6w0KiRhDTv4GAoDFU0RW0Gap1JtxinDl/om5eNrSmUzZKY3+Lh1zApjrm7ax?=
 =?us-ascii?Q?eAEpXxv4+1T7Ghhxudfu9WAfNuv7eVTzh3OCcR2J9qTu0W5aFSn/B+fF7pKN?=
 =?us-ascii?Q?H714NEyCBQrFtB+4osbZar6eS7VWxvFULvhahvUkgFC5pINIbB3FiePZNjbM?=
 =?us-ascii?Q?7By9SHVsK1kvLfFZRkTssycdycNtzNACzR+QtmhoJcyN7eNGlEMYioE2mkbT?=
 =?us-ascii?Q?hlG9XD3FZLv2Y4P9BCEjaWDJqL9rqjTk8JAtyYvD+/Eila/CHBDzdT0+h8f0?=
 =?us-ascii?Q?Tmobi5mkoO2X72QzoRvLYMMnOR9SXTNvW6aiQ5F8Pdm6k+kCfrnHbbEDMyZM?=
 =?us-ascii?Q?GS3/oc0jUJZfsKdGJZ7Hx+j0PluLt2nbZM5kPDSxryd7qaEWtw7pvhdijoup?=
 =?us-ascii?Q?mP2Kq3yEX3TgLkSFONIi2N5tUvvbd33qn6apsjEVqlk2gNWV7B+KzJ+y0ujU?=
 =?us-ascii?Q?hSGWFOVRT/bJ5OdsXs+7wW8aGoVxcQmTQZN/YmO5HwiA5NqS97uboPS6sZc5?=
 =?us-ascii?Q?jxDHCR9k2KEp+0vntvpoQIFCMTuRa49hes5WNL2f4ObFIY1G+vg+TKzVuB1E?=
 =?us-ascii?Q?1Vi18kU95IrnnY+Ys0rcGra+li2sIG3PGhmjdwDznS69fFoeOcylyjK1gQ0f?=
 =?us-ascii?Q?XxenrL9ePvT3XQmLPFeV37w3kZq2vCXvBXvcjJPXz+UiK+LsImT/PNKPgy4K?=
 =?us-ascii?Q?ZFCLE6k5XyeeDXeVqI1Ws0I=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 099aca07-15c0-47d6-44bb-08db150c0b20
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 19:36:07.5074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fG7zziWmw1VJXdmplpZG1J/lmE5jxVVV+0cAoo9xLiP48dLIocwbFkDNZ3t3tLrW76fiSRi5KsscmazAjsUhSPvKM2JS7JAxOqWnR+B+n3yj8DuEunT+ERvNSkZhN5dX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6448
Received-SPF: pass client-ip=2a01:111:f400:7e8d::721;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/pauth_helper.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index f525ef7fad..a83956652f 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -347,11 +347,15 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
      */
     test = sextract64(ptr, bot_bit, top_bit - bot_bit);
     if (test != 0 && test != -1) {
-        /*
-         * Note that our top_bit is one greater than the pseudocode's
-         * version, hence "- 2" here.
-         */
-        pac ^= MAKE_64BIT_MASK(top_bit - 2, 1);
+        if (cpu_isar_feature(aa64_pauth_epac, env_archcpu(env))) {
+            pac = 0;
+        } else {
+            /*
+             * Note that our top_bit is one greater than the pseudocode's
+             * version, hence "- 2" here.
+             */
+            pac ^= MAKE_64BIT_MASK(top_bit - 2, 1);
+        }
     }
 
     /*
-- 
2.25.1


