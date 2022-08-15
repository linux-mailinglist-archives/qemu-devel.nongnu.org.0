Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA694592A64
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 09:37:50 +0200 (CEST)
Received: from localhost ([::1]:40580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNUfW-0004vD-2Z
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 03:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUW6-0007Pu-1n
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:28:06 -0400
Received: from mail-vi1eur05on2097.outbound.protection.outlook.com
 ([40.107.21.97]:18016 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUW3-0000JK-VW
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:28:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8yWR2e0q5fTR+NKkgFfR7wYf8WLO5fhvjZ5TpmqOcUjAZZ5pqla/qOKOa5gzst6CfSgkDZziO9I2Cw5a50qqiKkmbD5hXNPYpFWN0F5O/Ws6dU/3MrJNhoXHm1e7F1zbuvZBZ/SoYMojmmtMgg/fes7Iugvdc4KBcJ4xCS1uGjBYwj3F7QT8zXumTDI6zbupF8cfPqFILFOGOhbRvN3oO74GBSmw7NuhlJfLPlomSpbXbrafWjptSId7GOJ+BK3sShqyR+IclX/BSe1IW1EZN8d+vfyRFZgOzmvH+EgSgt4RJfr91vtCxJmBkxe0rpu0ir2MBhB1SX0GVcnbUQjmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgKMYpoW+cvkSCoAV83VaxCuznQr60QY7mP5UAy+wa0=;
 b=V49ratVSVCKoRAAF1j7somZ0tulTdeZWHMEPSoBM9oGWnP1wwhDMuBv61CmyQSYNUVfn/tFRRI0g2mfgdPRJkowxOSw3A69RPk+oGAhf/E4G4OpJGClPtphX9Emdf0LwV6pCBhizcqjkD271kx0G6/VAsZ+96kj5pEf83/n1VMh8OAeBytyLYfYEhaU18CmWeSgZIyek2DHTYcNvR/pKFC/ouKLNtZfCK1MHC41SN5Q7CMkKYbh64v2nFd5A+zh463Eiv07x8dzxnU32srgXxs/YZ22RngAwRMA5ISloffFce4OOhEW4VcGsRPYs7w1mfQ5vw2ZXXnRzQoJVHpRVOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgKMYpoW+cvkSCoAV83VaxCuznQr60QY7mP5UAy+wa0=;
 b=Y9Cwmb0cyxypRBMGOKvUlXjTxhIY7HTRC1qHDcLKnamAvJva7h3IiHI9W9Tt0jB+0TvUEu7pZBoBCBNeLZysHzZ2WzjmxfHwCujUvoZ8OpZdkxaJ+yxUstBrTxATIjv0WwZREajU7eY5SVFzJhLIZ3HvXXqfBk1tz59nDxJnzI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by PA4PR03MB8134.eurprd03.prod.outlook.com (2603:10a6:102:2a1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19; Mon, 15 Aug
 2022 07:27:58 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:27:58 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 03/20] disas/nanomips: Delete NMD class fields
Date: Mon, 15 Aug 2022 09:26:12 +0200
Message-Id: <20220815072629.12865-4-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1a20c08c-c758-4bf9-433e-08da7e8fad99
X-MS-TrafficTypeDiagnostic: PA4PR03MB8134:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GWgczglQ0qi69V87q/n+DY9GXh8a3BoutjUD06FommCeJ+qJh5ZGeyqi4sts71OAaQH7r/UM0XtskKjKHfJSEBQvPSMPAYMfcM+oTwVuxzhfSX3dhOYnrjEHZI71q+DGNFfMho7gOeyfaT0X2QxJDFkKNRKVHIBbJQKqorWNx7ZWsGoaxEW8k7JYoyTN8zV1ew68Sllf7KzcchuAoOVwjTerb6KMGbe14bmq3c0Fta3adDF+o/aLnGi14aPmabaZ6RmQuyaNUJexy6vFgfo3tZP4vpNO7B8qRwr1imdqUjJV1TqbpYhWhnW0Dn8JbmD9Kwbz/mcfR8pplfTaKk9hYtPjX6Ber5c+Qfg9dM5bE7IFDJvAcZ+RqCned7RB/ffTu4Y4sKxAorIZ7LPMgK0XqEFLNSEzTDJc8jR8m/aAGr2r6hh0O9+j5B2KF+mw++kBmuqGaLQGyWW2HbZs1VSW7zOtzdLi27sY7vFrNwH/p4rjbxWIznjjKPXw1+CgjGxEAtRclnxu4XksylAGnBKrAvE3rqgZBbnblNkOguSQYm3acGyhAg2PiCf9gFquj2T9hgsDk+WIt7ZCDnfSpj+PGIAaU0withLhmtRheCDOUnUiJPEx93wAJa8vyjzv9fSDRgalQ+bF0Me9UVOIj57IXa1xH3dsgaLkYCRAYjDQiiu4NpRLRYSYR1vemMGaZOOMFNWu+8vVQwThh1WsYiN7pQ1BilImEoQpo0XB0qwrICQlXZY4YbtRwvF8xM7r6fyDc6471Qadet4pnEBgIl8QymA4AWYgYVNjufpHTXnC+W0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(346002)(39830400003)(136003)(396003)(38100700002)(2906002)(26005)(66556008)(5660300002)(66946007)(66476007)(6512007)(52116002)(6506007)(38350700002)(6916009)(478600001)(6486002)(107886003)(41300700001)(186003)(86362001)(2616005)(6666004)(316002)(83380400001)(4326008)(1076003)(8676002)(44832011)(8936002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yJGz/NO5ygwnlE487Jxl8u49njSOzjmg31Q75b1MxK9cPtimCbnS72GqkuN2?=
 =?us-ascii?Q?63qZMiwDSdDcCGqXFI8qTf92qfGT96oWwuD5fHAeJ1LR18kpArFDmNilGbvN?=
 =?us-ascii?Q?WtxadJsh/WruYlgENr9nIH3nvHbgMrfMk8iufaTyKo1WMn8ahhgLnBQcTyUs?=
 =?us-ascii?Q?+9R0gnJVCbqzkB1Pau6ebTkP0/R4wGuEv0b0AVVEfD7Bqf+uqpttmJq0UcYF?=
 =?us-ascii?Q?mS09qkWdiUvIBY32hJCeGyT0X4X1FlzciPvTfY8ZSBAYeXnHVmhCjX1CE9eI?=
 =?us-ascii?Q?rVLBz0shtgL3ToyDaqyEeovJwiq6Q9S0yZXv6HtdahBDZPhWyMjADh2HViYK?=
 =?us-ascii?Q?TvOAg6PBHCZF/qE3QRl3dtSzMDir1+043h4ugaNs58FJgxqOc6E/oZjkyEMX?=
 =?us-ascii?Q?n0Gz5lmM+Nnoqa5rTN9rypf2ekUhn7F94mGfucSSuk68dgG0wpDNLoVbBjal?=
 =?us-ascii?Q?fjej0zVtXSm8GiF6kyE7GXqaeD3rSjRlVp6NQxvZ3Rd3CxDbTrx5F2q/JGjV?=
 =?us-ascii?Q?oVMgxzQ49uLpr5PK3j+c6fMU5LsIGb5Fmp1lEynOmIgLAtUUF2/p+65rNrsY?=
 =?us-ascii?Q?+hF/E4fVqG6s9GL8whHgifsjCyWTUcfSut7nPiiRPp2oaeTRb5s5NVKMLWvv?=
 =?us-ascii?Q?D4Ry9JvAYQIqt6JfNbefqPK7X5UDIR4w5WSA4N4iNrFM7Maw4FkyCjXo8kTd?=
 =?us-ascii?Q?qKApHGdSAeY3g24UHgNXB5kWRzkNZb3fhvqmtq4eghkq64cRH9id7j4ARRKn?=
 =?us-ascii?Q?9bLHq2LKxy+WtggVxKvUm1Hm1+qaKEBKmCVVczLQ5jRPlXG5Cd6KOsCUSaBK?=
 =?us-ascii?Q?jV6/5Tp0eyIEXRRxAOuswbYqLo8lW+NcyNmRzXUPqxsoyORyQKKzxnnR5Sde?=
 =?us-ascii?Q?itceLTnAjHZLr5Lv4ELZyRig/BNm1SIwY5WRjm24lHwHaWOGKG3zbd+3YJFA?=
 =?us-ascii?Q?HHg2xpmjkfU0oYWWZ0Q00fa/3mcCgmsFX5mEP/ZW61S6WejUNLJlyJvZVDCV?=
 =?us-ascii?Q?/ddo98wO5o9TvGIL0hlFlwpMpY76R6LClOgYmTmy4zFUXE+nWSVj5R91frJ9?=
 =?us-ascii?Q?IirdxKBSjiKNJmaJC6f7/w7VkMzhkQWqdqR4EXes5P1PgKBUrQIL7lMldrPN?=
 =?us-ascii?Q?/9r0hQzpU4GvedPc/aTH8/k8dy0Kp0FXXZdDL092djTargdd/zlt9HL0Kp8R?=
 =?us-ascii?Q?+V84Q03NqPJkQWcDmKPdKuCEmwFIBRzAlPWvYFMOvJOk4cnJxZmVI4vfhsOh?=
 =?us-ascii?Q?7QvzLlmizJVPIOJPz2loJBLvDTxc1Ib2NoUxXaQ8A0SW7mirt/A0czLgRrBn?=
 =?us-ascii?Q?JOW7upn2Ce96OK4K/EszoFEXMe2AK4iCBpgBywgGgQTwNLJaGTtxG2Ue5xRl?=
 =?us-ascii?Q?SahA1lAnaG8wC9tu/Sfns0ey1GopeEN12w9aI71gB4qlmkW9Pmm3+ld8/8R6?=
 =?us-ascii?Q?kBPNayP9VZARkZLypblaq1zzC1L2TZNA9PMXFtzJhP4s0Aui4xEyQPqtk6xE?=
 =?us-ascii?Q?1nb/m4B4PcR8aqwThNpzdl79H+DCevbCNS8zr1xBheKxWoyOpg6sgZujN8RC?=
 =?us-ascii?Q?HWL+WYwhkai4rlcrEPqpGeovf1qiqpXvPFu2TqOUS7rPsx/DxtSTwUXJyVRB?=
 =?us-ascii?Q?5w=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a20c08c-c758-4bf9-433e-08da7e8fad99
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:27:58.5365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCgk++TW41rvf3XrimkSvPwWN8udpOBAAwU1Biblstf+e/rQGolexOrdM+TRpIAleTDRQVa5k3/qEXkcZrUl78hfHQRV44vjUqIzImTGW3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8134
Received-SPF: pass client-ip=40.107.21.97;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Class fields have been replaced with the public static variables.
Therefore, there is no more need for a constructor. The main goal is to
remove NMD class completely.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 6 +++++-
 disas/nanomips.h   | 9 ---------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 00e489fd59..2cbaa122ae 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -40,6 +40,8 @@
 
 #define IMGASSERTONCE(test)
 
+static img_address           m_pc;
+static TABLE_ATTRIBUTE_TYPE   m_requested_instruction_categories;
 
 int nanomips_dis(char *buf,
                  unsigned address,
@@ -51,7 +53,9 @@ int nanomips_dis(char *buf,
     uint16 bits[3] = {one, two, three};
 
     TABLE_ENTRY_TYPE type;
-    NMD d(address, ALL_ATTRIBUTES);
+    m_pc = address;
+    m_requested_instruction_categories = ALL_ATTRIBUTES;
+    NMD d;
     int size = d.Disassemble(bits, disasm, type);
 
     strcpy(buf, disasm.c_str());
diff --git a/disas/nanomips.h b/disas/nanomips.h
index f65a0957b8..9858740bf3 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -65,20 +65,11 @@ class NMD
 {
 public:
 
-    NMD(img_address pc, TABLE_ATTRIBUTE_TYPE requested_instruction_categories)
-        : m_pc(pc)
-        , m_requested_instruction_categories(requested_instruction_categories)
-    {
-    }
-
     int Disassemble(const uint16 *data, std::string & dis,
                     TABLE_ENTRY_TYPE & type);
 
 private:
 
-    img_address           m_pc;
-    TABLE_ATTRIBUTE_TYPE   m_requested_instruction_categories;
-
     typedef std::string(NMD:: *disassembly_function)(uint64 instruction);
     typedef bool(NMD:: *conditional_function)(uint64 instruction);
 
-- 
2.25.1


