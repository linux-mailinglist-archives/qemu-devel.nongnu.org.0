Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64203585159
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 16:13:50 +0200 (CEST)
Received: from localhost ([::1]:50770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHQkO-0000hi-Vj
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 10:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oHQfu-0005Aq-Qz
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 10:09:10 -0400
Received: from mail-ve1eur01on0727.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::727]:9699
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oHQfm-00012H-W8
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 10:09:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eH3dSCmKX/84xNMbaLlBS3aHzYJdihl89D6cKGDcl2fpM+neaWbBBwth/LoeMrK6OQCedtMyRB9j7h6RQv5OFB5FYuxLYPYhrl7Ck5yhtVMQrSbnDq9f/3/K7LdPJ/hFoLvx2YBE2UTGas50eXsL0rbJEhJXuczlFAYLS8v0Kg+6gdjnZaJGi+7LeppiHYjCKtuNI9OU4ZvtUGNlHzRZp+ycQLGpOfT9XPsKoEw/saQM2zt7Clg17o6X/MgL1TZnwiFEYT7qFN1FE5nvOPYhVn8uVyU6jXkm3AKis6QKIUNN3vlqns9UI5liuAdH01CbOxNsHvxYOlTVfOmccBMZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaPo/qG+9fGH1/ytBEWa3UnaIyruia1k85K0rTc4094=;
 b=abs0RJygPTPpZ4CUX08V98smCXzA8vTotX1pnff0sFdK1CWC31o6i0galsH+no/VnbJd2490Jlh3BKBvxQUEejMOHBNWtY5AhnwF0al0+qhFZ7e2X8MW3t8y146NeI7fxQG53tvAETmytn3lx6Mg86wHZd5KqgeYXx3H7RckXxzp0sdgp/NilgVVvv6YROq1waa3kqlffVTioCKAByrkL3nuShYnD4AUJ3SlS8Exo+CKW5EzvGrVkEopxjiafk6kI4L6lBiUHV6JPW/3v/YwieU0S67x8JdSB8iN/GFn0Im5ltJyFf/ABr18Ayst9E2aBYPmFG72fKHNCyqbhO4deg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaPo/qG+9fGH1/ytBEWa3UnaIyruia1k85K0rTc4094=;
 b=zMgQ8ab6FYLMSitKcHy3UcylxzD8XR6XPeT5S8nA2AUGP4pd1LbYTIR11x9otqapYXgVF3AEQ1mVaAeygCu/OUc9SIfMXuG+w7uyFwtis+gv3Dll/3QHOP1URo6xz17O+g89B/wEl1iASjoSivYPwMViPDC5d2w3+IJz+FtmXfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by VE1PR03MB5967.eurprd03.prod.outlook.com (2603:10a6:803:108::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Fri, 29 Jul
 2022 14:03:17 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::4061:bff8:22db:9300]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::4061:bff8:22db:9300%5]) with mapi id 15.20.5482.011; Fri, 29 Jul 2022
 14:03:16 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, djordje.todorovic@syrmia.com,
 mips32r2@gmail.com, dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH] disas/nanomips: Convert nanoMIPS disassembler to C
Date: Fri, 29 Jul 2022 16:02:52 +0200
Message-Id: <20220729140252.66572-1-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CWLP265CA0293.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:401:5d::17) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a852898-3f0d-4db5-e0a8-08da716b1515
X-MS-TrafficTypeDiagnostic: VE1PR03MB5967:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lE8LVa6UQJ7PdtvpgRKni6swO3ptvHmThwvzxJGnBSkAqWlREYFU1PLI7REX2O2hPAsnLUG3+kvcd6qRkedCDqOBfdZnVC91mEClJf9S2HQbzvbyO6uwN5mIfTQBN9C9YoEi/05IKUoMGsg7ASly05WBjhLJe1ze954ofiE/iSkY+boi8iVLSRYedP3H2GvNxvIVnUYTpO+syONAYoSCiI9XGnjitsOCxX9f2uyaP6J1d36i+Qx3ZkSqBCZU2Vg2NUWzwcNVXRTBRRUMRsR7jCHMMgy/6WTo9UUVMkVMJD+S9YhK3Rhh1ZprB2rQedHVFprXtKSWbA10YmuieivEtLApWusHuTsJH2ndcFuSzAmUgkfpGeJFj2gerL3RKYLFrT0WQs+GKBH5M/FjTo2x/sMS9M/HUWmDft5ykgIxjOI/qVjemjl8slFNXA6zh4GZuyr2n5um5PQ5FOJsu9SHSayKOmWfnqFqcL4nPVSEH8iJHtFgIL8LSgg/3zyqC+nbtuPzR5KKfFdVu/g5R4uq/QH0EowOPyDoi5OZJYl3gKpZacFHaihKOzFyqfY2i5PW4ims4VtkssgZQNd4hszYs4x871J7g0m529aJdPE0AggzbyiS3/E9cYa0QFYBYdDWjNYWyxLZWYsTJHgkz5V8eCE/7E0/I+bwlH0+SDHAUjf5HmU3heRZ8GQPkUhimg6wKDC6tsOm/KsCY2V/lCblrW22Pdo18e736cSxkR2z7rZnfDWZzkeREp6YGqHgl/pfZ3W/Z4+s4FHw4U4wXl4Ff/Cq/16+JTUGLAoO4yCTL8EKoPPWXgfPkMbcDGIofKovvGwkcUmdZa21+kL3TSFHahU/D5Ee4Pi9bZG6+KHs9U8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(376002)(366004)(396003)(39830400003)(41300700001)(86362001)(38100700002)(38350700002)(478600001)(6506007)(52116002)(2906002)(6666004)(6486002)(36756003)(966005)(6916009)(5660300002)(26005)(1076003)(30864003)(44832011)(6512007)(186003)(107886003)(316002)(2616005)(8936002)(66556008)(66476007)(66946007)(83380400001)(8676002)(4326008)(2004002)(579004)(559001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fj/W3xAtXHt5JBuNCRzYt7VBowx4eAkRT4TcY9yk/SmfWfzJu7y3otxBnSsu?=
 =?us-ascii?Q?+tbXEUdQzLIXsdtAF7SAsky0kLKtAH9/En20M6aTSuSvj2pAPLMseknM9YFf?=
 =?us-ascii?Q?SyT+wyQ3TG6uLixScvAEkmYyaa5ky7Tu2foTzlyD6zmmg1h1/jG/czug53xX?=
 =?us-ascii?Q?wuFhjcEoifBL7s9TLGSFU7vcNrofe9B5Q2DUzVajbiyhlhvlmm9JuRIam3uP?=
 =?us-ascii?Q?DZZZTtXyw7vaTLEYvfie5k9T61p3gHvUep6+cCLgxm0pFXIqhR1TI34t9Jfe?=
 =?us-ascii?Q?Btd2kU7BwwR/hX1GxhlEWVAq7WgeLtaVUO1Ji21mBiRT2MMQRuv1D951W3BL?=
 =?us-ascii?Q?gr2Ts2zvavZwBMD+KtNKxj1+xqCi/TMgO/QhNCv4odoeqMsbqHNQEcm0aMcd?=
 =?us-ascii?Q?fLjzSmtSrzMgV4hncQqYT62tyFAT2hDiiKI1sLd03E6EvnMvGyEqbDwa3DVg?=
 =?us-ascii?Q?VeRpoUVJfRK7NZ9EL7L2Vyhj/hM84fo5e2VUJP15Sn6iCqeLHGhMvS7wjEsn?=
 =?us-ascii?Q?s+lDqsG8Iw8o+8s2+8HLztfFUw7AoSkbd/6DRrfqcsVkp9RB2h6BtwfKm3Wr?=
 =?us-ascii?Q?XBrXg0YOsoMPXFsRqqpQ0FfNuLcoA9s29q6tMT744D38qkPtF05OTW/gdMpB?=
 =?us-ascii?Q?Onrhv2F6yjUiht3znOAmjP0LO9o97TWz8G+sBRdD4Y8X4Keb5NvMoZAgsP5J?=
 =?us-ascii?Q?QGtTT8hnfMaSZczcdC0ucgUEJ/aEgqUklLshn2q9gzajlAcVzXI5htsArxhq?=
 =?us-ascii?Q?5NmxNKan/u5xiyxfKA5tBw+9BEtJaAxW+rWePkKXVYYu7E908+SGY6F9xMF1?=
 =?us-ascii?Q?t8SuT3XqA9PzVg+XELxk4vfWiQVLMKkjsJOAAa7LQ15QEwHzhBQutGwkhz6C?=
 =?us-ascii?Q?WJ3abHnjbr2Jrm9X4Z81IZORYddyg7X+OIys1PHJMqFsQJN77xhAHvzM1soJ?=
 =?us-ascii?Q?V9qvYrKzbo8y9xNkk7sCKJznPA/uT7GHJcF8K57dGoAxTWzvXNRX1br8NHTI?=
 =?us-ascii?Q?ERZL/ZIt4vtp3nGKicRxj1j4krRxxoz4uqWEWtsdciAz2TqMVVN6TUDgcDXp?=
 =?us-ascii?Q?yEoex6To65xsW4vEfostw7djzlFCAg3vwGwHAgPFovG2X+2iPd3Ljadu9uMY?=
 =?us-ascii?Q?UNpURnxiEjnB7CreswpJ+FkAEWYzQdIWy3DVXNbUOlbuU9AsBMerRLneIU2l?=
 =?us-ascii?Q?I4iydkCRIapgHOHrngRipcAeFYpu9EX+sD/Rhs2Zd9Mo1DGlCamlvy49WslV?=
 =?us-ascii?Q?VTVnlR7d9HSEpJVXpNtShmQJ0jq8HeWrwjpu+Kmt8jKI+k92mePMbQykiFTG?=
 =?us-ascii?Q?EYrzGMTv5zrLhPlQVjv6YmgbBtc3FtyjSOjghe0vR2UT37+SwTJ2uLdMa3fw?=
 =?us-ascii?Q?Z4dhhUPIw6pGL7D4sYGcFF+oF7b94cEE50Sp5T8RHN8TX6XUAzRDcS8S6nZ2?=
 =?us-ascii?Q?/csIN0lhgAKSIUaF9qxRNlyiO+CW9PEfWfGov+WQKIqHR30lNtDZ8iLDoIRw?=
 =?us-ascii?Q?qApq/t6dW6lXdxC9oUZb8hN3p7gsFql91bN343Eniqr+7wl5exn4JZgtc/Sx?=
 =?us-ascii?Q?j39pEkv7q1EEFGr/bM7sdThYUBagtNrfYOB6xuFtQhVF6HOEhzduq4vccObY?=
 =?us-ascii?Q?Lw=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a852898-3f0d-4db5-e0a8-08da716b1515
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 14:03:16.8352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWQVoZwOkk/q+wdhMN9e4m3FO3eFc8+g/Je4bSdz/WJmkpvEjkn3QLF8QygXFSKoWOwjCBNBDILD2P3USbREIEMHNpbGTe3KxaFPBsT0BYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5967
Received-SPF: pass client-ip=2a01:111:f400:fe1f::727;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

C++ features like class, exception handling and function overloading
have been removed and replaced with equivalent C code.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
Please see the discussion about why converting it here:
https://lists.nongnu.org/archive/html/qemu-devel/2022-06/msg01803.html

The validity of the disassembler after refactoring has been tested with
the QEMU emulator version 6.0.1. With the most recent version, there is a
problem with the executing nanoMIPS programs in the semihosting mode. The
issue is reported here: https://gitlab.com/qemu-project/qemu/-/issues/1126
We're currently working on fixing this.

 disas/meson.build                  |    2 +-
 disas/{nanomips.cpp => nanomips.c} | 8407 ++++++++++++++--------------
 disas/nanomips.h                   | 1076 ----
 3 files changed, 4154 insertions(+), 5331 deletions(-)
 rename disas/{nanomips.cpp => nanomips.c} (73%)
 delete mode 100644 disas/nanomips.h

diff --git a/disas/meson.build b/disas/meson.build
index ba22f7cbcd..1977f5cd92 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -5,7 +5,7 @@ common_ss.add(when: 'CONFIG_HPPA_DIS', if_true: files('hppa.c'))
 common_ss.add(when: 'CONFIG_M68K_DIS', if_true: files('m68k.c'))
 common_ss.add(when: 'CONFIG_MICROBLAZE_DIS', if_true: files('microblaze.c'))
 common_ss.add(when: 'CONFIG_MIPS_DIS', if_true: files('mips.c'))
-common_ss.add(when: 'CONFIG_NANOMIPS_DIS', if_true: files('nanomips.cpp'))
+common_ss.add(when: 'CONFIG_NANOMIPS_DIS', if_true: files('nanomips.c'))
 common_ss.add(when: 'CONFIG_NIOS2_DIS', if_true: files('nios2.c'))
 common_ss.add(when: 'CONFIG_RISCV_DIS', if_true: files('riscv.c'))
 common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
diff --git a/disas/nanomips.cpp b/disas/nanomips.c
similarity index 73%
rename from disas/nanomips.cpp
rename to disas/nanomips.c
index 9be8df75dd..09ee296371 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.c
@@ -30,274 +30,121 @@
 #include "qemu/osdep.h"
 #include "disas/dis-asm.h"
 
-#include <cstring>
-#include <stdexcept>
-#include <sstream>
+#include <string.h>
 #include <stdio.h>
 #include <stdarg.h>
-
-#include "nanomips.h"
+#include <stdint.h>
+#include <inttypes.h>
+#include <setjmp.h>
 
 #define IMGASSERTONCE(test)
 
+typedef int64_t int64;
+typedef uint64_t uint64;
+typedef uint32_t uint32;
+typedef uint16_t uint16;
+typedef uint64_t img_address;
+typedef char *(*disassembly_function)(uint64 instruction);
+typedef bool(*conditional_function)(uint64 instruction);
+
+typedef enum {
+    instruction,
+    call_instruction,
+    branch_instruction,
+    return_instruction,
+    reserved_block,
+    pool,
+} TABLE_ENTRY_TYPE;
+
+typedef enum {
+    MIPS64_ = 0x00000001,
+    XNP_ = 0x00000002,
+    XMMS_ = 0x00000004,
+    EVA_ = 0x00000008,
+    DSP_ = 0x00000010,
+    MT_ = 0x00000020,
+    EJTAG_ = 0x00000040,
+    TLBINV_ = 0x00000080,
+    CP0_ = 0x00000100,
+    CP1_ = 0x00000200,
+    CP2_ = 0x00000400,
+    UDI_ = 0x00000800,
+    MCU_ = 0x00001000,
+    VZ_ = 0x00002000,
+    TLB_ = 0x00004000,
+    MVH_ = 0x00008000,
+    ALL_ATTRIBUTES = 0xffffffffull,
+} TABLE_ATTRIBUTE_TYPE;
+
+struct Pool {
+    TABLE_ENTRY_TYPE     type;
+    struct Pool          *next_table;
+    int                  next_table_size;
+    int                  instructions_size;
+    uint64               mask;
+    uint64               value;
+    disassembly_function disassembly;
+    conditional_function condition;
+    uint64               attributes;
+};
 
-int nanomips_dis(char *buf,
-                 unsigned address,
-                 unsigned short one,
-                 unsigned short two,
-                 unsigned short three)
-{
-    std::string disasm;
-    uint16 bits[3] = {one, two, three};
-
-    NMD::TABLE_ENTRY_TYPE type;
-    NMD d(address, NMD::ALL_ATTRIBUTES);
-    int size = d.Disassemble(bits, disasm, type);
+static img_address           m_pc;
+static TABLE_ATTRIBUTE_TYPE   m_requested_instruction_categories;
+static struct disassemble_info *disassm_info;
+static jmp_buf j_buf;
 
-    strcpy(buf, disasm.c_str());
-    return size;
-}
-
-int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
+static char *img_format(const char *format, ...)
 {
-    int status;
-    bfd_byte buffer[2];
-    uint16_t insn1 = 0, insn2 = 0, insn3 = 0;
-    char buf[200];
-
-    info->bytes_per_chunk = 2;
-    info->display_endian = info->endian;
-    info->insn_info_valid = 1;
-    info->branch_delay_insns = 0;
-    info->data_size = 0;
-    info->insn_type = dis_nonbranch;
-    info->target = 0;
-    info->target2 = 0;
-
-    status = (*info->read_memory_func)(memaddr, buffer, 2, info);
-    if (status != 0) {
-        (*info->memory_error_func)(status, memaddr, info);
-        return -1;
-    }
-
-    if (info->endian == BFD_ENDIAN_BIG) {
-        insn1 = bfd_getb16(buffer);
-    } else {
-        insn1 = bfd_getl16(buffer);
-    }
-    (*info->fprintf_func)(info->stream, "%04x ", insn1);
-
-    /* Handle 32-bit opcodes.  */
-    if ((insn1 & 0x1000) == 0) {
-        status = (*info->read_memory_func)(memaddr + 2, buffer, 2, info);
-        if (status != 0) {
-            (*info->memory_error_func)(status, memaddr + 2, info);
-            return -1;
-        }
-
-        if (info->endian == BFD_ENDIAN_BIG) {
-            insn2 = bfd_getb16(buffer);
-        } else {
-            insn2 = bfd_getl16(buffer);
-        }
-        (*info->fprintf_func)(info->stream, "%04x ", insn2);
-    } else {
-        (*info->fprintf_func)(info->stream, "     ");
-    }
-    /* Handle 48-bit opcodes.  */
-    if ((insn1 >> 10) == 0x18) {
-        status = (*info->read_memory_func)(memaddr + 4, buffer, 2, info);
-        if (status != 0) {
-            (*info->memory_error_func)(status, memaddr + 4, info);
-            return -1;
-        }
-
-        if (info->endian == BFD_ENDIAN_BIG) {
-            insn3 = bfd_getb16(buffer);
-        } else {
-            insn3 = bfd_getl16(buffer);
-        }
-        (*info->fprintf_func)(info->stream, "%04x ", insn3);
-    } else {
-        (*info->fprintf_func)(info->stream, "     ");
-    }
-
-    int length = nanomips_dis(buf, memaddr, insn1, insn2, insn3);
-
-    /* FIXME: Should probably use a hash table on the major opcode here.  */
-
-    (*info->fprintf_func) (info->stream, "%s", buf);
-    if (length > 0) {
-        return length / 8;
+    char buffer[256];
+    va_list args;
+    va_start(args, format);
+    int err = vsprintf(buffer, format, args);
+    if (err < 0) {
+        perror(buffer);
     }
-
-    info->insn_type = dis_noninsn;
-
-    return insn3 ? 6 : insn2 ? 4 : 2;
+    va_end(args);
+    return strdup(buffer);
 }
 
 
-namespace img
-{
-    address addr32(address a)
-    {
-        return a;
-    }
-
-    std::string format(const char *format, ...)
-    {
-        char buffer[256];
-        va_list args;
-        va_start(args, format);
-        int err = vsprintf(buffer, format, args);
-        if (err < 0) {
-            perror(buffer);
-        }
-        va_end(args);
-        return buffer;
-    }
-
-    std::string format(const char *format,
-                       std::string s)
-    {
-        char buffer[256];
-
-        sprintf(buffer, format, s.c_str());
-
-        return buffer;
-    }
-
-    std::string format(const char *format,
-                       std::string s1,
-                       std::string s2)
-    {
-        char buffer[256];
-
-        sprintf(buffer, format, s1.c_str(), s2.c_str());
-
-        return buffer;
-    }
-
-    std::string format(const char *format,
-                       std::string s1,
-                       std::string s2,
-                       std::string s3)
-    {
-        char buffer[256];
-
-        sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str());
-
-        return buffer;
-    }
-
-    std::string format(const char *format,
-                       std::string s1,
-                       std::string s2,
-                       std::string s3,
-                       std::string s4)
-    {
-        char buffer[256];
-
-        sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str(),
-                                s4.c_str());
-
-        return buffer;
-    }
-
-    std::string format(const char *format,
-                       std::string s1,
-                       std::string s2,
-                       std::string s3,
-                       std::string s4,
-                       std::string s5)
-    {
-        char buffer[256];
-
-        sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str(),
-                                s4.c_str(), s5.c_str());
-
-        return buffer;
-    }
-
-    std::string format(const char *format,
-                       uint64 d,
-                       std::string s2)
-    {
-        char buffer[256];
-
-        sprintf(buffer, format, d, s2.c_str());
-
-        return buffer;
-    }
-
-    std::string format(const char *format,
-                       std::string s1,
-                       uint64 d,
-                       std::string s2)
-    {
-        char buffer[256];
-
-        sprintf(buffer, format, s1.c_str(), d, s2.c_str());
-
-        return buffer;
-    }
-
-    std::string format(const char *format,
-                       std::string s1,
-                       std::string s2,
-                       uint64 d)
-    {
-        char buffer[256];
-
-        sprintf(buffer, format, s1.c_str(), s2.c_str(), d);
-
-        return buffer;
-    }
-
-    char as_char(int c)
-    {
-        return static_cast<char>(c);
-    }
-};
-
-
-std::string to_string(img::address a)
+static char *to_string(img_address a)
 {
     char buffer[256];
     sprintf(buffer, "0x%" PRIx64, a);
-    return buffer;
+    return strdup(buffer);
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
 }
 
 
-uint64 NMD::renumber_registers(uint64 index, uint64 *register_list,
-                               size_t register_list_size)
+static uint64 renumber_registers(uint64 index, uint64 *register_list,
+                                 size_t register_list_size)
 {
     if (index < register_list_size) {
         return register_list[index];
     }
-
-    throw std::runtime_error(img::format(
-                   "Invalid register mapping index %" PRIu64
-                   ", size of list = %zu",
-                   index, register_list_size));
+    const char *err = img_format(
+                      "Invalid register mapping index %" PRIu64
+                      ", size of list = %zu",
+                      index, register_list_size);
+    (*disassm_info->fprintf_func)(disassm_info->stream, "%s", err);
+    longjmp(j_buf, 1);
 }
 
 
 /*
- * NMD::decode_gpr_gpr4() - decoder for 'gpr4' gpr encoding type
+ * decode_gpr_gpr4() - decoder for 'gpr4' gpr encoding type
  *
  *   Map a 4-bit code to the 5-bit register space according to this pattern:
  *
@@ -322,7 +169,7 @@ uint64 NMD::renumber_registers(uint64 index, uint64 *register_list,
  *     - MUL[4X4]
  *     - SW[4X4]
  */
-uint64 NMD::decode_gpr_gpr4(uint64 d)
+static uint64 decode_gpr_gpr4(uint64 d)
 {
     static uint64 register_list[] = {  8,  9, 10, 11,  4,  5,  6,  7,
                                       16, 17, 18, 19, 20, 21, 22, 23 };
@@ -332,7 +179,7 @@ uint64 NMD::decode_gpr_gpr4(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr4_zero() - decoder for 'gpr4.zero' gpr encoding type
+ * decode_gpr_gpr4_zero() - decoder for 'gpr4.zero' gpr encoding type
  *
  *   Map a 4-bit code to the 5-bit register space according to this pattern:
  *
@@ -358,7 +205,7 @@ uint64 NMD::decode_gpr_gpr4(uint64 d)
  *     - MOVEP
  *     - SW[4X4]
  */
-uint64 NMD::decode_gpr_gpr4_zero(uint64 d)
+static uint64 decode_gpr_gpr4_zero(uint64 d)
 {
     static uint64 register_list[] = {  8,  9, 10,  0,  4,  5,  6,  7,
                                       16, 17, 18, 19, 20, 21, 22, 23 };
@@ -368,7 +215,7 @@ uint64 NMD::decode_gpr_gpr4_zero(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr3() - decoder for 'gpr3' gpr encoding type
+ * decode_gpr_gpr3() - decoder for 'gpr3' gpr encoding type
  *
  *   Map a 3-bit code to the 5-bit register space according to this pattern:
  *
@@ -417,7 +264,7 @@ uint64 NMD::decode_gpr_gpr4_zero(uint64 d)
  *     - SW[16]
  *     - XOR[16]
  */
-uint64 NMD::decode_gpr_gpr3(uint64 d)
+static uint64 decode_gpr_gpr3(uint64 d)
 {
     static uint64 register_list[] = { 16, 17, 18, 19,  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
@@ -426,7 +273,7 @@ uint64 NMD::decode_gpr_gpr3(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr3_src_store() - decoder for 'gpr3.src.store' gpr encoding
+ * decode_gpr_gpr3_src_store() - decoder for 'gpr3.src.store' gpr encoding
  *     type
  *
  *   Map a 3-bit code to the 5-bit register space according to this pattern:
@@ -457,7 +304,7 @@ uint64 NMD::decode_gpr_gpr3(uint64 d)
  *     - SW[16]
  *     - SW[GP16]
  */
-uint64 NMD::decode_gpr_gpr3_src_store(uint64 d)
+static uint64 decode_gpr_gpr3_src_store(uint64 d)
 {
     static uint64 register_list[] = {  0, 17, 18, 19,  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
@@ -466,7 +313,7 @@ uint64 NMD::decode_gpr_gpr3_src_store(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr2_reg1() - decoder for 'gpr2.reg1' gpr encoding type
+ * decode_gpr_gpr2_reg1() - decoder for 'gpr2.reg1' gpr encoding type
  *
  *   Map a 2-bit code to the 5-bit register space according to this pattern:
  *
@@ -487,7 +334,7 @@ uint64 NMD::decode_gpr_gpr3_src_store(uint64 d)
  *     - MOVEP
  *     - MOVEP[REV]
  */
-uint64 NMD::decode_gpr_gpr2_reg1(uint64 d)
+static uint64 decode_gpr_gpr2_reg1(uint64 d)
 {
     static uint64 register_list[] = {  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
@@ -496,7 +343,7 @@ uint64 NMD::decode_gpr_gpr2_reg1(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr2_reg2() - decoder for 'gpr2.reg2' gpr encoding type
+ * decode_gpr_gpr2_reg2() - decoder for 'gpr2.reg2' gpr encoding type
  *
  *   Map a 2-bit code to the 5-bit register space according to this pattern:
  *
@@ -517,7 +364,7 @@ uint64 NMD::decode_gpr_gpr2_reg1(uint64 d)
  *     - MOVEP
  *     - MOVEP[REV]
  */
-uint64 NMD::decode_gpr_gpr2_reg2(uint64 d)
+static uint64 decode_gpr_gpr2_reg2(uint64 d)
 {
     static uint64 register_list[] = {  5,  6,  7,  8 };
     return renumber_registers(d, register_list,
@@ -526,7 +373,7 @@ uint64 NMD::decode_gpr_gpr2_reg2(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr1() - decoder for 'gpr1' gpr encoding type
+ * decode_gpr_gpr1() - decoder for 'gpr1' gpr encoding type
  *
  *   Map a 1-bit code to the 5-bit register space according to this pattern:
  *
@@ -546,7 +393,7 @@ uint64 NMD::decode_gpr_gpr2_reg2(uint64 d)
  *
  *     - MOVE.BALC
  */
-uint64 NMD::decode_gpr_gpr1(uint64 d)
+static uint64 decode_gpr_gpr1(uint64 d)
 {
     static uint64 register_list[] = {  4,  5 };
     return renumber_registers(d, register_list,
@@ -554,73 +401,60 @@ uint64 NMD::decode_gpr_gpr1(uint64 d)
 }
 
 
-uint64 NMD::copy(uint64 d)
+static uint64 copy_ui(uint64 d)
 {
     return d;
 }
 
 
-int64 NMD::copy(int64 d)
+static int64 copy_i(int64 d)
 {
     return d;
 }
 
 
-int64 NMD::neg_copy(uint64 d)
+static int64 neg_copy_ui(uint64 d)
 {
     return 0ll - d;
 }
 
 
-int64 NMD::neg_copy(int64 d)
-{
-    return -d;
-}
-
-
 /* strange wrapper around  gpr3 */
-uint64 NMD::encode_rs3_and_check_rs3_ge_rt3(uint64 d)
+static uint64 encode_rs3_and_check_rs3_ge_rt3(uint64 d)
 {
 return decode_gpr_gpr3(d);
 }
 
 
 /* strange wrapper around  gpr3 */
-uint64 NMD::encode_rs3_and_check_rs3_lt_rt3(uint64 d)
+static uint64 encode_rs3_and_check_rs3_lt_rt3(uint64 d)
 {
     return decode_gpr_gpr3(d);
 }
 
 
 /* nop - done by extraction function */
-uint64 NMD::encode_s_from_address(uint64 d)
-{
-    return d;
-}
-
-
-/* nop - done by extraction function */
-uint64 NMD::encode_u_from_address(uint64 d)
+static uint64 encode_s_from_address(uint64 d)
 {
     return d;
 }
 
 
 /* nop - done by extraction function */
-uint64 NMD::encode_s_from_s_hi(uint64 d)
+static uint64 encode_u_from_address(uint64 d)
 {
     return d;
 }
 
 
-uint64 NMD::encode_count3_from_count(uint64 d)
+static uint64 encode_count3_from_count(uint64 d)
 {
     IMGASSERTONCE(d < 8);
     return d == 0ull ? 8ull : d;
 }
 
 
-uint64 NMD::encode_shift3_from_shift(uint64 d)
+static uint64 encode_shift3_from_shift(uint64 d)
 {
     IMGASSERTONCE(d < 8);
     return d == 0ull ? 8ull : d;
@@ -628,21 +462,21 @@ uint64 NMD::encode_shift3_from_shift(uint64 d)
 
 
 /* special value for load literal */
-int64 NMD::encode_eu_from_s_li16(uint64 d)
+static int64 encode_eu_from_s_li16(uint64 d)
 {
     IMGASSERTONCE(d < 128);
     return d == 127 ? -1 : (int64)d;
 }
 
 
-uint64 NMD::encode_msbd_from_size(uint64 d)
+static uint64 encode_msbd_from_size(uint64 d)
 {
     IMGASSERTONCE(d < 32);
     return d + 1;
 }
 
 
-uint64 NMD::encode_eu_from_u_andi16(uint64 d)
+static uint64 encode_eu_from_u_andi16(uint64 d)
 {
     IMGASSERTONCE(d < 16);
     if (d == 12) {
@@ -655,42 +489,20 @@ uint64 NMD::encode_eu_from_u_andi16(uint64 d)
 }
 
 
-uint64 NMD::encode_msbd_from_pos_and_size(uint64 d)
-{
-    IMGASSERTONCE(0);
-    return d;
-}
-
-
 /* save16 / restore16   ???? */
-uint64 NMD::encode_rt1_from_rt(uint64 d)
+static uint64 encode_rt1_from_rt(uint64 d)
 {
     return d ? 31 : 30;
 }
 
 
 /* ? */
-uint64 NMD::encode_lsb_from_pos_and_size(uint64 d)
+static uint64 encode_lsb_from_pos_and_size(uint64 d)
 {
     return d;
 }
 
-
-std::string NMD::save_restore_list(uint64 rt, uint64 count, uint64 gp)
-{
-    std::string str;
-
-    for (uint64 counter = 0; counter != count; counter++) {
-        bool use_gp = gp && (counter == count - 1);
-        uint64 this_rt = use_gp ? 28 : ((rt & 0x10) | (rt + counter)) & 0x1f;
-        str += img::format(",%s", GPR(this_rt));
-    }
-
-    return str;
-}
-
-
-std::string NMD::GPR(uint64 reg)
+static const char *GPR(uint64 reg)
 {
     static const char *gpr_reg[32] = {
         "zero", "at",   "v0",   "v1",   "a0",   "a1",   "a2",   "a3",
@@ -698,80 +510,89 @@ std::string NMD::GPR(uint64 reg)
         "s0",   "s1",   "s2",   "s3",   "s4",   "s5",   "s6",   "s7",
         "r24",  "r25",  "k0",   "k1",   "gp",   "sp",   "fp",   "ra"
     };
-
     if (reg < 32) {
         return gpr_reg[reg];
     }
-
-    throw std::runtime_error(img::format("Invalid GPR register index %" PRIu64,
-                                         reg));
+    const char *err = img_format("Invalid GPR register index %" PRIu64,
+                                 reg);
+    (*disassm_info->fprintf_func)(disassm_info->stream, "%s", err);
+    longjmp(j_buf, 1);
 }
 
-
-std::string NMD::FPR(uint64 reg)
+static const char *FPR(uint64 reg)
 {
     static const char *fpr_reg[32] = {
-        "f0",  "f1",  "f2",  "f3",  "f4",  "f5",  "f6",  "f7",
-        "f8",  "f9",  "f10", "f11", "f12", "f13", "f14", "f15",
+        "f0", "f1", "f2", "f3", "f4", "f5", "f6", "f7",
+        "f8", "f9", "f10", "f11", "f12", "f13", "f14", "f15",
         "f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23",
-        "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31"
-    };
-
+        "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31"};
     if (reg < 32) {
         return fpr_reg[reg];
     }
-
-    throw std::runtime_error(img::format("Invalid FPR register index %" PRIu64,
-                                         reg));
+    const char *err = img_format("Invalid FPR register index %" PRIu64,
+                                 reg);
+    (*disassm_info->fprintf_func)(disassm_info->stream, "%s", err);
+    longjmp(j_buf, 1);
 }
 
-
-std::string NMD::AC(uint64 reg)
+static const char *AC(uint64 reg)
 {
     static const char *ac_reg[4] = {
-        "ac0",  "ac1",  "ac2",  "ac3"
-    };
-
+        "ac0", "ac1", "ac2", "ac3"};
     if (reg < 4) {
         return ac_reg[reg];
     }
-
-    throw std::runtime_error(img::format("Invalid AC register index %" PRIu64,
-                                         reg));
+    const char *err = img_format("Invalid AC register index %" PRIu64,
+                                 reg);
+    (*disassm_info->fprintf_func)(disassm_info->stream, "%s", err);
+    longjmp(j_buf, 1);
 }
 
 
-std::string NMD::IMMEDIATE(uint64 value)
+static char *IMMEDIATE_UI(uint64 value)
 {
-    return img::format("0x%" PRIx64, value);
+    return img_format("0x%" PRIx64, value);
 }
 
 
-std::string NMD::IMMEDIATE(int64 value)
+static char *IMMEDIATE_I(int64 value)
 {
-    return img::format("%" PRId64, value);
+    return img_format("%" PRId64, value);
 }
 
-
-std::string NMD::CPR(uint64 reg)
+static char *CPR(uint64 reg)
 {
     /* needs more work */
-    return img::format("CP%" PRIu64, reg);
+    return img_format("CP%" PRIu64, reg);
 }
 
 
-std::string NMD::ADDRESS(uint64 value, int instruction_size)
+static char *ADDRESS(uint64 value, int instruction_size)
 {
     /* token for string replace */
     /* const char TOKEN_REPLACE = (char)0xa2; */
-    img::address address = m_pc + value + instruction_size;
+    img_address address = m_pc + value + instruction_size;
     /* symbol replacement */
     /* return img::as_char(TOKEN_REPLACE) + to_string(address); */
     return to_string(address);
 }
 
 
-uint64 NMD::extract_op_code_value(const uint16 * data, int size)
+static char *save_restore_list(uint64 rt, uint64 count, uint64 gp)
+{
+    char str[256];
+    str[0] = '\0';
+    for (uint64 counter = 0; counter != count; counter++) {
+        bool use_gp = gp && (counter == count - 1);
+        uint64 this_rt = use_gp ? 28 : ((rt & 0x10) | (rt + counter)) & 0x1f;
+        strcat(str, img_format(",%s", GPR(this_rt)));
+    }
+
+    return strdup(str);
+}
+
+
+static uint64 extract_op_code_value(const uint16 *data, int size)
 {
     switch (size) {
     case 16:
@@ -786,92 +607,7 @@ uint64 NMD::extract_op_code_value(const uint16 * data, int size)
 }
 
 
-int NMD::Disassemble(const uint16 * data, std::string & dis,
-                     NMD::TABLE_ENTRY_TYPE & type)
-{
-    return Disassemble(data, dis, type, MAJOR, 2);
-}
-
-
-/*
- * Recurse through tables until the instruction is found then return
- * the string and size
- *
- * inputs:
- *      pointer to a word stream,
- *      disassember table and size
- * returns:
- *      instruction size    - negative is error
- *      disassembly string  - on error will constain error string
- */
-int NMD::Disassemble(const uint16 * data, std::string & dis,
-                     NMD::TABLE_ENTRY_TYPE & type, const Pool *table,
-                     int table_size)
-{
-    try
-    {
-        for (int i = 0; i < table_size; i++) {
-            uint64 op_code = extract_op_code_value(data,
-                                 table[i].instructions_size);
-            if ((op_code & table[i].mask) == table[i].value) {
-                /* possible match */
-                conditional_function cond = table[i].condition;
-                if ((cond == 0) || (this->*cond)(op_code)) {
-                    try
-                    {
-                        if (table[i].type == pool) {
-                            return Disassemble(data, dis, type,
-                                               table[i].next_table,
-                                               table[i].next_table_size);
-                        } else if ((table[i].type == instruction) ||
-                                   (table[i].type == call_instruction) ||
-                                   (table[i].type == branch_instruction) ||
-                                   (table[i].type == return_instruction)) {
-                            if ((table[i].attributes != 0) &&
-                                (m_requested_instruction_categories &
-                                 table[i].attributes) == 0) {
-                                /*
-                                 * failed due to instruction having
-                                 * an ASE attribute and the requested version
-                                 * not having that attribute
-                                 */
-                                dis = "ASE attribute mismatch";
-                                return -5;
-                            }
-                            disassembly_function dis_fn = table[i].disassembly;
-                            if (dis_fn == 0) {
-                                dis = "disassembler failure - bad table entry";
-                                return -6;
-                            }
-                            type = table[i].type;
-                            dis = (this->*dis_fn)(op_code);
-                            return table[i].instructions_size;
-                        } else {
-                            dis = "reserved instruction";
-                            return -2;
-                        }
-                    }
-                    catch (std::runtime_error & e)
-                    {
-                        dis = e.what();
-                        return -3;          /* runtime error */
-                    }
-                }
-            }
-        }
-    }
-    catch (std::exception & e)
-    {
-        dis = e.what();
-        return -4;          /* runtime error */
-    }
-
-    dis = "failed to disassemble";
-    return -1;      /* failed to disassemble        */
-}
-
-
-uint64 NMD::extract_code_18_to_0(uint64 instruction)
+static uint64 extract_code_18_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 19);
@@ -879,7 +615,7 @@ uint64 NMD::extract_code_18_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift3_2_1_0(uint64 instruction)
+static uint64 extract_shift3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -887,7 +623,7 @@ uint64 NMD::extract_shift3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3__s3(uint64 instruction)
+static uint64 extract_u_11_10_9_8_7_6_5_4_3__s3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 9) << 3;
@@ -895,7 +631,7 @@ uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3__s3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_count_3_2_1_0(uint64 instruction)
+static uint64 extract_count_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4);
@@ -903,7 +639,7 @@ uint64 NMD::extract_count_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtz3_9_8_7(uint64 instruction)
+static uint64 extract_rtz3_9_8_7(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 7, 3);
@@ -911,7 +647,7 @@ uint64 NMD::extract_rtz3_9_8_7(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_to_1__s1(uint64 instruction)
+static uint64 extract_u_17_to_1__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 1, 17) << 1;
@@ -919,7 +655,7 @@ uint64 NMD::extract_u_17_to_1__s1(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se9_20_19_18_17_16_15_14_13_12_11(uint64 instruction)
+static int64 extract_s__se9_20_19_18_17_16_15_14_13_12_11(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 11, 10);
@@ -928,7 +664,7 @@ int64 NMD::extract_s__se9_20_19_18_17_16_15_14_13_12_11(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(uint64 instruction)
+static int64 extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 11;
@@ -938,7 +674,7 @@ int64 NMD::extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_10(uint64 instruction)
+static uint64 extract_u_10(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 10, 1);
@@ -946,7 +682,7 @@ uint64 NMD::extract_u_10(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtz4_27_26_25_23_22_21(uint64 instruction)
+static uint64 extract_rtz4_27_26_25_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 3);
@@ -955,7 +691,7 @@ uint64 NMD::extract_rtz4_27_26_25_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sa_15_14_13_12_11(uint64 instruction)
+static uint64 extract_sa_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -963,7 +699,7 @@ uint64 NMD::extract_sa_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_4_3_2_1_0(uint64 instruction)
+static uint64 extract_shift_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5);
@@ -971,7 +707,7 @@ uint64 NMD::extract_shift_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shiftx_10_9_8_7__s1(uint64 instruction)
+static uint64 extract_shiftx_10_9_8_7__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 7, 4) << 1;
@@ -979,7 +715,7 @@ uint64 NMD::extract_shiftx_10_9_8_7__s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_hint_25_24_23_22_21(uint64 instruction)
+static uint64 extract_hint_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -987,7 +723,7 @@ uint64 NMD::extract_hint_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_count3_14_13_12(uint64 instruction)
+static uint64 extract_count3_14_13_12(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 12, 3);
@@ -995,7 +731,7 @@ uint64 NMD::extract_count3_14_13_12(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se31_0_11_to_2_20_to_12_s12(uint64 instruction)
+static int64 extract_s__se31_0_11_to_2_20_to_12_s12(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 31;
@@ -1006,7 +742,7 @@ int64 NMD::extract_s__se31_0_11_to_2_20_to_12_s12(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction)
+static int64 extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 7;
@@ -1016,7 +752,7 @@ int64 NMD::extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u2_10_9(uint64 instruction)
+static uint64 extract_u2_10_9(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 9, 2);
@@ -1024,7 +760,7 @@ uint64 NMD::extract_u2_10_9(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_25_24_23_22_21_20_19_18_17_16(uint64 instruction)
+static uint64 extract_code_25_24_23_22_21_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 10);
@@ -1032,7 +768,7 @@ uint64 NMD::extract_code_25_24_23_22_21_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_rs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1040,7 +776,7 @@ uint64 NMD::extract_rs_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_2_1__s1(uint64 instruction)
+static uint64 extract_u_2_1__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 1, 2) << 1;
@@ -1048,7 +784,7 @@ uint64 NMD::extract_u_2_1__s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_stripe_6(uint64 instruction)
+static uint64 extract_stripe_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 1);
@@ -1056,7 +792,7 @@ uint64 NMD::extract_stripe_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ac_15_14(uint64 instruction)
+static uint64 extract_ac_15_14(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 14, 2);
@@ -1064,7 +800,7 @@ uint64 NMD::extract_ac_15_14(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_20_19_18_17_16(uint64 instruction)
+static uint64 extract_shift_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1072,7 +808,7 @@ uint64 NMD::extract_shift_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rdl_25_24(uint64 instruction)
+static uint64 extract_rdl_25_24(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 24, 1);
@@ -1080,7 +816,7 @@ uint64 NMD::extract_rdl_25_24(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(uint64 instruction)
+static int64 extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 10;
@@ -1090,7 +826,7 @@ int64 NMD::extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_eu_6_5_4_3_2_1_0(uint64 instruction)
+static uint64 extract_eu_6_5_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 7);
@@ -1098,7 +834,7 @@ uint64 NMD::extract_eu_6_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_5_4_3_2_1_0(uint64 instruction)
+static uint64 extract_shift_5_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 6);
@@ -1106,7 +842,7 @@ uint64 NMD::extract_shift_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_count_19_18_17_16(uint64 instruction)
+static uint64 extract_count_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 4);
@@ -1114,7 +850,7 @@ uint64 NMD::extract_count_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_2_1_0(uint64 instruction)
+static uint64 extract_code_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1122,7 +858,7 @@ uint64 NMD::extract_code_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3_2_1_0(uint64 instruction)
+static uint64 extract_u_11_10_9_8_7_6_5_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 12);
@@ -1130,7 +866,7 @@ uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs_4_3_2_1_0(uint64 instruction)
+static uint64 extract_rs_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5);
@@ -1138,7 +874,7 @@ uint64 NMD::extract_rs_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_20_to_3__s3(uint64 instruction)
+static uint64 extract_u_20_to_3__s3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 18) << 3;
@@ -1146,7 +882,7 @@ uint64 NMD::extract_u_20_to_3__s3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4) << 2;
@@ -1154,7 +890,7 @@ uint64 NMD::extract_u_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_cofun_25_24_23(uint64 instruction)
+static uint64 extract_cofun_25_24_23(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 23);
@@ -1162,7 +898,7 @@ uint64 NMD::extract_cofun_25_24_23(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3) << 2;
@@ -1170,7 +906,7 @@ uint64 NMD::extract_u_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rd3_3_2_1(uint64 instruction)
+static uint64 extract_rd3_3_2_1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 1, 3);
@@ -1178,7 +914,7 @@ uint64 NMD::extract_rd3_3_2_1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sa_15_14_13_12(uint64 instruction)
+static uint64 extract_sa_15_14_13_12(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 12, 4);
@@ -1186,7 +922,7 @@ uint64 NMD::extract_sa_15_14_13_12(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt_25_24_23_22_21(uint64 instruction)
+static uint64 extract_rt_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1194,7 +930,7 @@ uint64 NMD::extract_rt_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ru_7_6_5_4_3(uint64 instruction)
+static uint64 extract_ru_7_6_5_4_3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 5);
@@ -1202,7 +938,7 @@ uint64 NMD::extract_ru_7_6_5_4_3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_to_0(uint64 instruction)
+static uint64 extract_u_17_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 18);
@@ -1210,7 +946,7 @@ uint64 NMD::extract_u_17_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rsz4_4_2_1_0(uint64 instruction)
+static uint64 extract_rsz4_4_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1219,7 +955,7 @@ uint64 NMD::extract_rsz4_4_2_1_0(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se21_0_20_to_1_s1(uint64 instruction)
+static int64 extract_s__se21_0_20_to_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 21;
@@ -1229,7 +965,7 @@ int64 NMD::extract_s__se21_0_20_to_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_op_25_to_3(uint64 instruction)
+static uint64 extract_op_25_to_3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 23);
@@ -1237,7 +973,7 @@ uint64 NMD::extract_op_25_to_3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs4_4_2_1_0(uint64 instruction)
+static uint64 extract_rs4_4_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1246,7 +982,7 @@ uint64 NMD::extract_rs4_4_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_bit_23_22_21(uint64 instruction)
+static uint64 extract_bit_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 3);
@@ -1254,7 +990,7 @@ uint64 NMD::extract_bit_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt_41_40_39_38_37(uint64 instruction)
+static uint64 extract_rt_41_40_39_38_37(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 37, 5);
@@ -1262,7 +998,7 @@ uint64 NMD::extract_rt_41_40_39_38_37(uint64 instruction)
 }
 
 
-int64 NMD::extract_shift__se5_21_20_19_18_17_16(uint64 instruction)
+static int64 extract_shift__se5_21_20_19_18_17_16(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 16, 6);
@@ -1271,7 +1007,7 @@ int64 NMD::extract_shift__se5_21_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rd2_3_8(uint64 instruction)
+static uint64 extract_rd2_3_8(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 1) << 1;
@@ -1280,7 +1016,7 @@ uint64 NMD::extract_rd2_3_8(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_17_to_0(uint64 instruction)
+static uint64 extract_code_17_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 18);
@@ -1288,7 +1024,7 @@ uint64 NMD::extract_code_17_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_size_20_19_18_17_16(uint64 instruction)
+static uint64 extract_size_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1296,7 +1032,7 @@ uint64 NMD::extract_size_20_19_18_17_16(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se8_15_7_6_5_4_3_2_s2(uint64 instruction)
+static int64 extract_s__se8_15_7_6_5_4_3_2_s2(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 2, 6) << 2;
@@ -1306,7 +1042,7 @@ int64 NMD::extract_s__se8_15_7_6_5_4_3_2_s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_15_to_0(uint64 instruction)
+static uint64 extract_u_15_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 16);
@@ -1314,7 +1050,7 @@ uint64 NMD::extract_u_15_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_fs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_fs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1322,7 +1058,7 @@ uint64 NMD::extract_fs_20_19_18_17_16(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se8_15_7_6_5_4_3_2_1_0(uint64 instruction)
+static int64 extract_s__se8_15_7_6_5_4_3_2_1_0(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 8);
@@ -1332,7 +1068,7 @@ int64 NMD::extract_s__se8_15_7_6_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_stype_20_19_18_17_16(uint64 instruction)
+static uint64 extract_stype_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1340,7 +1076,7 @@ uint64 NMD::extract_stype_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtl_11(uint64 instruction)
+static uint64 extract_rtl_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 9, 1);
@@ -1348,7 +1084,7 @@ uint64 NMD::extract_rtl_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_hs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_hs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1356,7 +1092,7 @@ uint64 NMD::extract_hs_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sel_13_12_11(uint64 instruction)
+static uint64 extract_sel_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 3);
@@ -1364,7 +1100,7 @@ uint64 NMD::extract_sel_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_lsb_4_3_2_1_0(uint64 instruction)
+static uint64 extract_lsb_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5);
@@ -1372,7 +1108,7 @@ uint64 NMD::extract_lsb_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_gp_2(uint64 instruction)
+static uint64 extract_gp_2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 2, 1);
@@ -1380,7 +1116,7 @@ uint64 NMD::extract_gp_2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt3_9_8_7(uint64 instruction)
+static uint64 extract_rt3_9_8_7(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 7, 3);
@@ -1388,7 +1124,7 @@ uint64 NMD::extract_rt3_9_8_7(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ft_25_24_23_22_21(uint64 instruction)
+static uint64 extract_ft_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1396,7 +1132,7 @@ uint64 NMD::extract_ft_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_16_15_14_13_12_11(uint64 instruction)
+static uint64 extract_u_17_16_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 7);
@@ -1404,7 +1140,7 @@ uint64 NMD::extract_u_17_16_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_cs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_cs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1412,7 +1148,7 @@ uint64 NMD::extract_cs_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt4_9_7_6_5(uint64 instruction)
+static uint64 extract_rt4_9_7_6_5(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 5, 3);
@@ -1421,7 +1157,7 @@ uint64 NMD::extract_rt4_9_7_6_5(uint64 instruction)
 }
 
 
-uint64 NMD::extract_msbt_10_9_8_7_6(uint64 instruction)
+static uint64 extract_msbt_10_9_8_7_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 5);
@@ -1429,7 +1165,7 @@ uint64 NMD::extract_msbt_10_9_8_7_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_5_4_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_5_4_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 6) << 2;
@@ -1437,7 +1173,7 @@ uint64 NMD::extract_u_5_4_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sa_15_14_13(uint64 instruction)
+static uint64 extract_sa_15_14_13(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 13, 3);
@@ -1445,7 +1181,7 @@ uint64 NMD::extract_sa_15_14_13(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se14_0_13_to_1_s1(uint64 instruction)
+static int64 extract_s__se14_0_13_to_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 14;
@@ -1455,7 +1191,7 @@ int64 NMD::extract_s__se14_0_13_to_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs3_6_5_4(uint64 instruction)
+static uint64 extract_rs3_6_5_4(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 4, 3);
@@ -1463,7 +1199,7 @@ uint64 NMD::extract_rs3_6_5_4(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_31_to_0__s32(uint64 instruction)
+static uint64 extract_u_31_to_0__s32(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 32) << 32;
@@ -1471,7 +1207,7 @@ uint64 NMD::extract_u_31_to_0__s32(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_10_9_8_7_6(uint64 instruction)
+static uint64 extract_shift_10_9_8_7_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 5);
@@ -1479,7 +1215,7 @@ uint64 NMD::extract_shift_10_9_8_7_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_cs_25_24_23_22_21(uint64 instruction)
+static uint64 extract_cs_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1487,7 +1223,7 @@ uint64 NMD::extract_cs_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shiftx_11_10_9_8_7_6(uint64 instruction)
+static uint64 extract_shiftx_11_10_9_8_7_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 6);
@@ -1495,7 +1231,7 @@ uint64 NMD::extract_shiftx_11_10_9_8_7_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt_9_8_7_6_5(uint64 instruction)
+static uint64 extract_rt_9_8_7_6_5(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 5, 5);
@@ -1503,7 +1239,7 @@ uint64 NMD::extract_rt_9_8_7_6_5(uint64 instruction)
 }
 
 
-uint64 NMD::extract_op_25_24_23_22_21(uint64 instruction)
+static uint64 extract_op_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1511,7 +1247,7 @@ uint64 NMD::extract_op_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_6_5_4_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_6_5_4_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 7) << 2;
@@ -1519,7 +1255,7 @@ uint64 NMD::extract_u_6_5_4_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_bit_16_15_14_13_12_11(uint64 instruction)
+static uint64 extract_bit_16_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 6);
@@ -1527,7 +1263,7 @@ uint64 NMD::extract_bit_16_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_mask_20_19_18_17_16_15_14(uint64 instruction)
+static uint64 extract_mask_20_19_18_17_16_15_14(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 14, 7);
@@ -1535,7 +1271,7 @@ uint64 NMD::extract_mask_20_19_18_17_16_15_14(uint64 instruction)
 }
 
 
-uint64 NMD::extract_eu_3_2_1_0(uint64 instruction)
+static uint64 extract_eu_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4);
@@ -1543,7 +1279,7 @@ uint64 NMD::extract_eu_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_7_6_5_4__s4(uint64 instruction)
+static uint64 extract_u_7_6_5_4__s4(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 4, 4) << 4;
@@ -1551,7 +1287,7 @@ uint64 NMD::extract_u_7_6_5_4__s4(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se8_15_7_6_5_4_3_s3(uint64 instruction)
+static int64 extract_s__se8_15_7_6_5_4_3_s3(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 3, 5) << 3;
@@ -1561,7 +1297,7 @@ int64 NMD::extract_s__se8_15_7_6_5_4_3_s3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ft_15_14_13_12_11(uint64 instruction)
+static uint64 extract_ft_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1569,7 +1305,7 @@ uint64 NMD::extract_ft_15_14_13_12_11(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se31_15_to_0_31_to_16(uint64 instruction)
+static int64 extract_s__se31_15_to_0_31_to_16(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 16) << 16;
@@ -1579,7 +1315,7 @@ int64 NMD::extract_s__se31_15_to_0_31_to_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_20_19_18_17_16_15_14_13(uint64 instruction)
+static uint64 extract_u_20_19_18_17_16_15_14_13(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 13, 8);
@@ -1587,7 +1323,7 @@ uint64 NMD::extract_u_20_19_18_17_16_15_14_13(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_to_2__s2(uint64 instruction)
+static uint64 extract_u_17_to_2__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 2, 16) << 2;
@@ -1595,7 +1331,7 @@ uint64 NMD::extract_u_17_to_2__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rd_15_14_13_12_11(uint64 instruction)
+static uint64 extract_rd_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1603,7 +1339,7 @@ uint64 NMD::extract_rd_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_c0s_20_19_18_17_16(uint64 instruction)
+static uint64 extract_c0s_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1611,7 +1347,7 @@ uint64 NMD::extract_c0s_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_1_0(uint64 instruction)
+static uint64 extract_code_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 2);
@@ -1619,7 +1355,7 @@ uint64 NMD::extract_code_1_0(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se25_0_24_to_1_s1(uint64 instruction)
+static int64 extract_s__se25_0_24_to_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 25;
@@ -1629,7 +1365,7 @@ int64 NMD::extract_s__se25_0_24_to_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_1_0(uint64 instruction)
+static uint64 extract_u_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 2);
@@ -1637,7 +1373,7 @@ uint64 NMD::extract_u_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_3_8__s2(uint64 instruction)
+static uint64 extract_u_3_8__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 1) << 3;
@@ -1646,7 +1382,7 @@ uint64 NMD::extract_u_3_8__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_fd_15_14_13_12_11(uint64 instruction)
+static uint64 extract_fd_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1654,7 +1390,7 @@ uint64 NMD::extract_fd_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_4_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_4_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5) << 2;
@@ -1662,7 +1398,7 @@ uint64 NMD::extract_u_4_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtz4_9_7_6_5(uint64 instruction)
+static uint64 extract_rtz4_9_7_6_5(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 5, 3);
@@ -1671,7 +1407,7 @@ uint64 NMD::extract_rtz4_9_7_6_5(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sel_15_14_13_12_11(uint64 instruction)
+static uint64 extract_sel_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1679,7 +1415,7 @@ uint64 NMD::extract_sel_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ct_25_24_23_22_21(uint64 instruction)
+static uint64 extract_ct_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1687,7 +1423,7 @@ uint64 NMD::extract_ct_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_20_to_2__s2(uint64 instruction)
+static uint64 extract_u_20_to_2__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 2, 19) << 2;
@@ -1695,7 +1431,7 @@ uint64 NMD::extract_u_20_to_2__s2(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se3_4_2_1_0(uint64 instruction)
+static int64 extract_s__se3_4_2_1_0(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1705,7 +1441,7 @@ int64 NMD::extract_s__se3_4_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_3_2_1_0__s1(uint64 instruction)
+static uint64 extract_u_3_2_1_0__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4) << 1;
@@ -1714,28 +1450,28 @@ uint64 NMD::extract_u_3_2_1_0__s1(uint64 instruction)
 
 
 
-bool NMD::ADDIU_32__cond(uint64 instruction)
+static bool ADDIU_32__cond(uint64 instruction)
 {
     uint64 rt = extract_rt_25_24_23_22_21(instruction);
     return rt != 0;
 }
 
 
-bool NMD::ADDIU_RS5__cond(uint64 instruction)
+static bool ADDIU_RS5__cond(uint64 instruction)
 {
     uint64 rt = extract_rt_9_8_7_6_5(instruction);
     return rt != 0;
 }
 
 
-bool NMD::BALRSC_cond(uint64 instruction)
+static bool BALRSC_cond(uint64 instruction)
 {
     uint64 rt = extract_rt_25_24_23_22_21(instruction);
     return rt != 0;
 }
 
 
-bool NMD::BEQC_16__cond(uint64 instruction)
+static bool BEQC_16__cond(uint64 instruction)
 {
     uint64 rs3 = extract_rs3_6_5_4(instruction);
     uint64 rt3 = extract_rt3_9_8_7(instruction);
@@ -1744,7 +1480,7 @@ bool NMD::BEQC_16__cond(uint64 instruction)
 }
 
 
-bool NMD::BNEC_16__cond(uint64 instruction)
+static bool BNEC_16__cond(uint64 instruction)
 {
     uint64 rs3 = extract_rs3_6_5_4(instruction);
     uint64 rt3 = extract_rt3_9_8_7(instruction);
@@ -1753,35 +1489,35 @@ bool NMD::BNEC_16__cond(uint64 instruction)
 }
 
 
-bool NMD::MOVE_cond(uint64 instruction)
+static bool MOVE_cond(uint64 instruction)
 {
     uint64 rt = extract_rt_9_8_7_6_5(instruction);
     return rt != 0;
 }
 
 
-bool NMD::P16_BR1_cond(uint64 instruction)
+static bool P16_BR1_cond(uint64 instruction)
 {
     uint64 u = extract_u_3_2_1_0__s1(instruction);
     return u != 0;
 }
 
 
-bool NMD::PREF_S9__cond(uint64 instruction)
+static bool PREF_S9__cond(uint64 instruction)
 {
     uint64 hint = extract_hint_25_24_23_22_21(instruction);
     return hint != 31;
 }
 
 
-bool NMD::PREFE_cond(uint64 instruction)
+static bool PREFE_cond(uint64 instruction)
 {
     uint64 hint = extract_hint_25_24_23_22_21(instruction);
     return hint != 31;
 }
 
 
-bool NMD::SLTU_cond(uint64 instruction)
+static bool SLTU_cond(uint64 instruction)
 {
     uint64 rd = extract_rd_15_14_13_12_11(instruction);
     return rd != 0;
@@ -1799,15 +1535,15 @@ bool NMD::SLTU_cond(uint64 instruction)
  *               fs -----
  *                    fd -----
  */
-std::string NMD::ABS_D(uint64 instruction)
+static char *ABS_D(uint64 instruction)
 {
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string fs = FPR(copy(fs_value));
-    std::string fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *fd = FPR(copy_ui(fd_value));
 
-    return img::format("ABS.D %s, %s", fd, fs);
+    return img_format("ABS.D %s, %s", fd, fs);
 }
 
 
@@ -1821,15 +1557,15 @@ std::string NMD::ABS_D(uint64 instruction)
  *               fd -----
  *                    fs -----
  */
-std::string NMD::ABS_S(uint64 instruction)
+static char *ABS_S(uint64 instruction)
 {
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string fs = FPR(copy(fs_value));
-    std::string fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *fd = FPR(copy_ui(fd_value));
 
-    return img::format("ABS.S %s, %s", fd, fs);
+    return img_format("ABS.S %s, %s", fd, fs);
 }
 
 
@@ -1843,15 +1579,15 @@ std::string NMD::ABS_S(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ABSQ_S_PH(uint64 instruction)
+static char *ABSQ_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("ABSQ_S.PH %s, %s", rt, rs);
+    return img_format("ABSQ_S.PH %s, %s", rt, rs);
 }
 
 
@@ -1865,15 +1601,15 @@ std::string NMD::ABSQ_S_PH(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ABSQ_S_QB(uint64 instruction)
+static char *ABSQ_S_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("ABSQ_S.QB %s, %s", rt, rs);
+    return img_format("ABSQ_S.QB %s, %s", rt, rs);
 }
 
 
@@ -1887,15 +1623,15 @@ std::string NMD::ABSQ_S_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ABSQ_S_W(uint64 instruction)
+static char *ABSQ_S_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("ABSQ_S.W %s, %s", rt, rs);
+    return img_format("ABSQ_S.W %s, %s", rt, rs);
 }
 
 
@@ -1908,17 +1644,17 @@ std::string NMD::ABSQ_S_W(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ACLR(uint64 instruction)
+static char *ACLR(uint64 instruction)
 {
     uint64 bit_value = extract_bit_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *bit = IMMEDIATE_UI(copy_ui(bit_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("ACLR %s, %s(%s)", bit, s, rs);
+    return img_format("ACLR %s, %s(%s)", bit, s, rs);
 }
 
 
@@ -1931,17 +1667,17 @@ std::string NMD::ACLR(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADD(uint64 instruction)
+static char *ADD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("ADD %s, %s, %s", rd, rs, rt);
+    return img_format("ADD %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -1956,17 +1692,17 @@ std::string NMD::ADD(uint64 instruction)
  *               fs -----
  *                    fd -----
  */
-std::string NMD::ADD_D(uint64 instruction)
+static char *ADD_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string fd = FPR(copy(fd_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *fd = FPR(copy_ui(fd_value));
 
-    return img::format("ADD.D %s, %s, %s", fd, fs, ft);
+    return img_format("ADD.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -1981,17 +1717,17 @@ std::string NMD::ADD_D(uint64 instruction)
  *               fs -----
  *                    fd -----
  */
-std::string NMD::ADD_S(uint64 instruction)
+static char *ADD_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string fd = FPR(copy(fd_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *fd = FPR(copy_ui(fd_value));
 
-    return img::format("ADD.S %s, %s, %s", fd, fs, ft);
+    return img_format("ADD.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -2004,17 +1740,17 @@ std::string NMD::ADD_S(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_32_(uint64 instruction)
+static char *ADDIU_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_15_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("ADDIU %s, %s, %s", rt, rs, u);
+    return img_format("ADDIU %s, %s, %s", rt, rs, u);
 }
 
 
@@ -2027,15 +1763,15 @@ std::string NMD::ADDIU_32_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_48_(uint64 instruction)
+static char *ADDIU_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
 
-    return img::format("ADDIU %s, %s", rt, s);
+    return img_format("ADDIU %s, %s", rt, s);
 }
 
 
@@ -2048,15 +1784,15 @@ std::string NMD::ADDIU_48_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_GP48_(uint64 instruction)
+static char *ADDIU_GP48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
 
-    return img::format("ADDIU %s, $%d, %s", rt, 28, s);
+    return img_format("ADDIU %s, $%d, %s", rt, 28, s);
 }
 
 
@@ -2069,15 +1805,15 @@ std::string NMD::ADDIU_GP48_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_GP_B_(uint64 instruction)
+static char *ADDIU_GP_B_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("ADDIU %s, $%d, %s", rt, 28, u);
+    return img_format("ADDIU %s, $%d, %s", rt, 28, u);
 }
 
 
@@ -2090,15 +1826,15 @@ std::string NMD::ADDIU_GP_B_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_GP_W_(uint64 instruction)
+static char *ADDIU_GP_W_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("ADDIU %s, $%d, %s", rt, 28, u);
+    return img_format("ADDIU %s, $%d, %s", rt, 28, u);
 }
 
 
@@ -2111,17 +1847,17 @@ std::string NMD::ADDIU_GP_W_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_NEG_(uint64 instruction)
+static char *ADDIU_NEG_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(neg_copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_I(neg_copy_ui(u_value));
 
-    return img::format("ADDIU %s, %s, %s", rt, rs, u);
+    return img_format("ADDIU %s, %s, %s", rt, rs, u);
 }
 
 
@@ -2134,15 +1870,15 @@ std::string NMD::ADDIU_NEG_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_R1_SP_(uint64 instruction)
+static char *ADDIU_R1_SP_(uint64 instruction)
 {
     uint64 u_value = extract_u_5_4_3_2_1_0__s2(instruction);
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("ADDIU %s, $%d, %s", rt3, 29, u);
+    return img_format("ADDIU %s, $%d, %s", rt3, 29, u);
 }
 
 
@@ -2155,17 +1891,17 @@ std::string NMD::ADDIU_R1_SP_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_R2_(uint64 instruction)
+static char *ADDIU_R2_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1_0__s2(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("ADDIU %s, %s, %s", rt3, rs3, u);
+    return img_format("ADDIU %s, %s, %s", rt3, rs3, u);
 }
 
 
@@ -2177,15 +1913,15 @@ std::string NMD::ADDIU_R2_(uint64 instruction)
  *     rt -----
  *           s - ---
  */
-std::string NMD::ADDIU_RS5_(uint64 instruction)
+static char *ADDIU_RS5_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     int64 s_value = extract_s__se3_4_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
 
-    return img::format("ADDIU %s, %s", rt, s);
+    return img_format("ADDIU %s, %s", rt, s);
 }
 
 
@@ -2199,15 +1935,15 @@ std::string NMD::ADDIU_RS5_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDIUPC_32_(uint64 instruction)
+static char *ADDIUPC_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("ADDIUPC %s, %s", rt, s);
+    return img_format("ADDIUPC %s, %s", rt, s);
 }
 
 
@@ -2221,15 +1957,15 @@ std::string NMD::ADDIUPC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDIUPC_48_(uint64 instruction)
+static char *ADDIUPC_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
-    return img::format("ADDIUPC %s, %s", rt, s);
+    return img_format("ADDIUPC %s, %s", rt, s);
 }
 
 
@@ -2243,17 +1979,17 @@ std::string NMD::ADDIUPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQ_PH(uint64 instruction)
+static char *ADDQ_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("ADDQ.PH %s, %s, %s", rd, rs, rt);
+    return img_format("ADDQ.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2268,17 +2004,17 @@ std::string NMD::ADDQ_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQ_S_PH(uint64 instruction)
+static char *ADDQ_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("ADDQ_S.PH %s, %s, %s", rd, rs, rt);
+    return img_format("ADDQ_S.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2292,17 +2028,17 @@ std::string NMD::ADDQ_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQ_S_W(uint64 instruction)
+static char *ADDQ_S_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("ADDQ_S.W %s, %s, %s", rd, rs, rt);
+    return img_format("ADDQ_S.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2317,17 +2053,17 @@ std::string NMD::ADDQ_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_PH(uint64 instruction)
+static char *ADDQH_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("ADDQH.PH %s, %s, %s", rd, rs, rt);
+    return img_format("ADDQH.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2342,17 +2078,17 @@ std::string NMD::ADDQH_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_R_PH(uint64 instruction)
+static char *ADDQH_R_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("ADDQH_R.PH %s, %s, %s", rd, rs, rt);
+    return img_format("ADDQH_R.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2367,17 +2103,17 @@ std::string NMD::ADDQH_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_R_W(uint64 instruction)
+static char *ADDQH_R_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("ADDQH_R.W %s, %s, %s", rd, rs, rt);
+    return img_format("ADDQH_R.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2392,17 +2128,17 @@ std::string NMD::ADDQH_R_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_W(uint64 instruction)
+static char *ADDQH_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("ADDQH.W %s, %s, %s", rd, rs, rt);
+    return img_format("ADDQH.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2416,17 +2152,17 @@ std::string NMD::ADDQH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDSC(uint64 instruction)
+static char *ADDSC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("ADDSC %s, %s, %s", rd, rs, rt);
+    return img_format("ADDSC %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2439,17 +2175,17 @@ std::string NMD::ADDSC(uint64 instruction)
  *       rs3 ---
  *          rd3 ---
  */
-std::string NMD::ADDU_16_(uint64 instruction)
+static char *ADDU_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 rd3_value = extract_rd3_3_2_1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rd3 = GPR(decode_gpr_gpr3(rd3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
 
-    return img::format("ADDU %s, %s, %s", rd3, rs3, rt3);
+    return img_format("ADDU %s, %s, %s", rd3, rs3, rt3);
 }
 
 
@@ -2463,17 +2199,17 @@ std::string NMD::ADDU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_32_(uint64 instruction)
+static char *ADDU_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("ADDU %s, %s, %s", rd, rs, rt);
+    return img_format("ADDU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2487,15 +2223,15 @@ std::string NMD::ADDU_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_4X4_(uint64 instruction)
+static char *ADDU_4X4_(uint64 instruction)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
 
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
-    std::string rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
 
-    return img::format("ADDU %s, %s", rs4, rt4);
+    return img_format("ADDU %s, %s", rs4, rt4);
 }
 
 
@@ -2509,17 +2245,17 @@ std::string NMD::ADDU_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_PH(uint64 instruction)
+static char *ADDU_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("ADDU.PH %s, %s, %s", rd, rs, rt);
+    return img_format("ADDU.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2533,17 +2269,17 @@ std::string NMD::ADDU_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_QB(uint64 instruction)
+static char *ADDU_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("ADDU.QB %s, %s, %s", rd, rs, rt);
+    return img_format("ADDU.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2558,17 +2294,17 @@ std::string NMD::ADDU_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_S_PH(uint64 instruction)
+static char *ADDU_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("ADDU_S.PH %s, %s, %s", rd, rs, rt);
+    return img_format("ADDU_S.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2582,17 +2318,17 @@ std::string NMD::ADDU_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_S_QB(uint64 instruction)
+static char *ADDU_S_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("ADDU_S.QB %s, %s, %s", rd, rs, rt);
+    return img_format("ADDU_S.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2607,17 +2343,17 @@ std::string NMD::ADDU_S_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDUH_QB(uint64 instruction)
+static char *ADDUH_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("ADDUH.QB %s, %s, %s", rd, rs, rt);
+    return img_format("ADDUH.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2632,17 +2368,17 @@ std::string NMD::ADDUH_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDUH_R_QB(uint64 instruction)
+static char *ADDUH_R_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("ADDUH_R.QB %s, %s, %s", rd, rs, rt);
+    return img_format("ADDUH_R.QB %s, %s, %s", rd, rs, rt);
 }
 
 /*
@@ -2655,17 +2391,17 @@ std::string NMD::ADDUH_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDWC(uint64 instruction)
+static char *ADDWC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("ADDWC %s, %s, %s", rd, rs, rt);
+    return img_format("ADDWC %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2679,15 +2415,15 @@ std::string NMD::ADDWC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ALUIPC(uint64 instruction)
+static char *ALUIPC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
+    return img_format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
 }
 
 
@@ -2700,15 +2436,15 @@ std::string NMD::ALUIPC(uint64 instruction)
  *       rs3 ---
  *           eu ----
  */
-std::string NMD::AND_16_(uint64 instruction)
+static char *AND_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("AND %s, %s", rs3, rt3);
+    return img_format("AND %s, %s", rs3, rt3);
 }
 
 
@@ -2722,17 +2458,17 @@ std::string NMD::AND_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::AND_32_(uint64 instruction)
+static char *AND_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("AND %s, %s, %s", rd, rs, rt);
+    return img_format("AND %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2745,17 +2481,17 @@ std::string NMD::AND_32_(uint64 instruction)
  *       rs3 ---
  *           eu ----
  */
-std::string NMD::ANDI_16_(uint64 instruction)
+static char *ANDI_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 eu_value = extract_eu_3_2_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string eu = IMMEDIATE(encode_eu_from_u_andi16(eu_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *eu = IMMEDIATE_UI(encode_eu_from_u_andi16(eu_value));
 
-    return img::format("ANDI %s, %s, %s", rt3, rs3, eu);
+    return img_format("ANDI %s, %s, %s", rt3, rs3, eu);
 }
 
 
@@ -2769,17 +2505,17 @@ std::string NMD::ANDI_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ANDI_32_(uint64 instruction)
+static char *ANDI_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("ANDI %s, %s, %s", rt, rs, u);
+    return img_format("ANDI %s, %s, %s", rt, rs, u);
 }
 
 
@@ -2793,17 +2529,17 @@ std::string NMD::ANDI_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::APPEND(uint64 instruction)
+static char *APPEND(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
-    return img::format("APPEND %s, %s, %s", rt, rs, sa);
+    return img_format("APPEND %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -2817,17 +2553,17 @@ std::string NMD::APPEND(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ASET(uint64 instruction)
+static char *ASET(uint64 instruction)
 {
     uint64 bit_value = extract_bit_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *bit = IMMEDIATE_UI(copy_ui(bit_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("ASET %s, %s(%s)", bit, s, rs);
+    return img_format("ASET %s, %s(%s)", bit, s, rs);
 }
 
 
@@ -2841,13 +2577,13 @@ std::string NMD::ASET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BALC_16_(uint64 instruction)
+static char *BALC_16_(uint64 instruction)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2);
+    const char *s = ADDRESS(encode_s_from_address(s_value), 2);
 
-    return img::format("BALC %s", s);
+    return img_format("BALC %s", s);
 }
 
 
@@ -2861,13 +2597,13 @@ std::string NMD::BALC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BALC_32_(uint64 instruction)
+static char *BALC_32_(uint64 instruction)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BALC %s", s);
+    return img_format("BALC %s", s);
 }
 
 
@@ -2881,15 +2617,15 @@ std::string NMD::BALC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BALRSC(uint64 instruction)
+static char *BALRSC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("BALRSC %s, %s", rt, rs);
+    return img_format("BALRSC %s, %s", rt, rs);
 }
 
 
@@ -2903,17 +2639,17 @@ std::string NMD::BALRSC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BBEQZC(uint64 instruction)
+static char *BBEQZC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *bit = IMMEDIATE_UI(copy_ui(bit_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BBEQZC %s, %s, %s", rt, bit, s);
+    return img_format("BBEQZC %s, %s, %s", rt, bit, s);
 }
 
 
@@ -2927,17 +2663,17 @@ std::string NMD::BBEQZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BBNEZC(uint64 instruction)
+static char *BBNEZC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *bit = IMMEDIATE_UI(copy_ui(bit_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BBNEZC %s, %s, %s", rt, bit, s);
+    return img_format("BBNEZC %s, %s, %s", rt, bit, s);
 }
 
 
@@ -2951,13 +2687,13 @@ std::string NMD::BBNEZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC_16_(uint64 instruction)
+static char *BC_16_(uint64 instruction)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2);
+    const char *s = ADDRESS(encode_s_from_address(s_value), 2);
 
-    return img::format("BC %s", s);
+    return img_format("BC %s", s);
 }
 
 
@@ -2971,13 +2707,13 @@ std::string NMD::BC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC_32_(uint64 instruction)
+static char *BC_32_(uint64 instruction)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BC %s", s);
+    return img_format("BC %s", s);
 }
 
 
@@ -2991,15 +2727,15 @@ std::string NMD::BC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC1EQZC(uint64 instruction)
+static char *BC1EQZC(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BC1EQZC %s, %s", ft, s);
+    return img_format("BC1EQZC %s, %s", ft, s);
 }
 
 
@@ -3013,15 +2749,15 @@ std::string NMD::BC1EQZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC1NEZC(uint64 instruction)
+static char *BC1NEZC(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BC1NEZC %s, %s", ft, s);
+    return img_format("BC1NEZC %s, %s", ft, s);
 }
 
 
@@ -3035,15 +2771,15 @@ std::string NMD::BC1NEZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC2EQZC(uint64 instruction)
+static char *BC2EQZC(uint64 instruction)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ct = CPR(copy(ct_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *ct = CPR(copy_ui(ct_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BC2EQZC %s, %s", ct, s);
+    return img_format("BC2EQZC %s, %s", ct, s);
 }
 
 
@@ -3057,15 +2793,15 @@ std::string NMD::BC2EQZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC2NEZC(uint64 instruction)
+static char *BC2NEZC(uint64 instruction)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ct = CPR(copy(ct_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *ct = CPR(copy_ui(ct_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BC2NEZC %s, %s", ct, s);
+    return img_format("BC2NEZC %s, %s", ct, s);
 }
 
 
@@ -3079,17 +2815,17 @@ std::string NMD::BC2NEZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQC_16_(uint64 instruction)
+static char *BEQC_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s1(instruction);
 
-    std::string rs3 = GPR(encode_rs3_and_check_rs3_lt_rt3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = ADDRESS(encode_u_from_address(u_value), 2);
+    const char *rs3 = GPR(encode_rs3_and_check_rs3_lt_rt3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *u = ADDRESS(encode_u_from_address(u_value), 2);
 
-    return img::format("BEQC %s, %s, %s", rs3, rt3, u);
+    return img_format("BEQC %s, %s, %s", rs3, rt3, u);
 }
 
 
@@ -3103,17 +2839,17 @@ std::string NMD::BEQC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQC_32_(uint64 instruction)
+static char *BEQC_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BEQC %s, %s, %s", rs, rt, s);
+    return img_format("BEQC %s, %s, %s", rs, rt, s);
 }
 
 
@@ -3127,17 +2863,17 @@ std::string NMD::BEQC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQIC(uint64 instruction)
+static char *BEQIC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BEQIC %s, %s, %s", rt, u, s);
+    return img_format("BEQIC %s, %s, %s", rt, u, s);
 }
 
 
@@ -3151,15 +2887,15 @@ std::string NMD::BEQIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQZC_16_(uint64 instruction)
+static char *BEQZC_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 2);
 
-    return img::format("BEQZC %s, %s", rt3, s);
+    return img_format("BEQZC %s, %s", rt3, s);
 }
 
 
@@ -3173,17 +2909,17 @@ std::string NMD::BEQZC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEC(uint64 instruction)
+static char *BGEC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BGEC %s, %s, %s", rs, rt, s);
+    return img_format("BGEC %s, %s, %s", rs, rt, s);
 }
 
 
@@ -3197,17 +2933,17 @@ std::string NMD::BGEC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEIC(uint64 instruction)
+static char *BGEIC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BGEIC %s, %s, %s", rt, u, s);
+    return img_format("BGEIC %s, %s, %s", rt, u, s);
 }
 
 
@@ -3221,17 +2957,17 @@ std::string NMD::BGEIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEIUC(uint64 instruction)
+static char *BGEIUC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BGEIUC %s, %s, %s", rt, u, s);
+    return img_format("BGEIUC %s, %s, %s", rt, u, s);
 }
 
 
@@ -3245,17 +2981,17 @@ std::string NMD::BGEIUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEUC(uint64 instruction)
+static char *BGEUC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BGEUC %s, %s, %s", rs, rt, s);
+    return img_format("BGEUC %s, %s, %s", rs, rt, s);
 }
 
 
@@ -3269,17 +3005,17 @@ std::string NMD::BGEUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTC(uint64 instruction)
+static char *BLTC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BLTC %s, %s, %s", rs, rt, s);
+    return img_format("BLTC %s, %s, %s", rs, rt, s);
 }
 
 
@@ -3293,17 +3029,17 @@ std::string NMD::BLTC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTIC(uint64 instruction)
+static char *BLTIC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BLTIC %s, %s, %s", rt, u, s);
+    return img_format("BLTIC %s, %s, %s", rt, u, s);
 }
 
 
@@ -3317,17 +3053,17 @@ std::string NMD::BLTIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTIUC(uint64 instruction)
+static char *BLTIUC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BLTIUC %s, %s, %s", rt, u, s);
+    return img_format("BLTIUC %s, %s, %s", rt, u, s);
 }
 
 
@@ -3341,17 +3077,17 @@ std::string NMD::BLTIUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTUC(uint64 instruction)
+static char *BLTUC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BLTUC %s, %s, %s", rs, rt, s);
+    return img_format("BLTUC %s, %s, %s", rs, rt, s);
 }
 
 
@@ -3365,17 +3101,17 @@ std::string NMD::BLTUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEC_16_(uint64 instruction)
+static char *BNEC_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s1(instruction);
 
-    std::string rs3 = GPR(encode_rs3_and_check_rs3_ge_rt3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = ADDRESS(encode_u_from_address(u_value), 2);
+    const char *rs3 = GPR(encode_rs3_and_check_rs3_ge_rt3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *u = ADDRESS(encode_u_from_address(u_value), 2);
 
-    return img::format("BNEC %s, %s, %s", rs3, rt3, u);
+    return img_format("BNEC %s, %s, %s", rs3, rt3, u);
 }
 
 
@@ -3389,17 +3125,17 @@ std::string NMD::BNEC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEC_32_(uint64 instruction)
+static char *BNEC_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BNEC %s, %s, %s", rs, rt, s);
+    return img_format("BNEC %s, %s, %s", rs, rt, s);
 }
 
 
@@ -3413,17 +3149,17 @@ std::string NMD::BNEC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEIC(uint64 instruction)
+static char *BNEIC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BNEIC %s, %s, %s", rt, u, s);
+    return img_format("BNEIC %s, %s, %s", rt, u, s);
 }
 
 
@@ -3437,15 +3173,15 @@ std::string NMD::BNEIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEZC_16_(uint64 instruction)
+static char *BNEZC_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 2);
 
-    return img::format("BNEZC %s, %s", rt3, s);
+    return img_format("BNEZC %s, %s", rt3, s);
 }
 
 
@@ -3459,13 +3195,13 @@ std::string NMD::BNEZC_16_(uint64 instruction)
  *            s[13:1] -------------
  *                           s[14] -
  */
-std::string NMD::BPOSGE32C(uint64 instruction)
+static char *BPOSGE32C(uint64 instruction)
 {
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BPOSGE32C %s", s);
+    return img_format("BPOSGE32C %s", s);
 }
 
 
@@ -3479,13 +3215,13 @@ std::string NMD::BPOSGE32C(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BREAK_16_(uint64 instruction)
+static char *BREAK_16_(uint64 instruction)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
-    return img::format("BREAK %s", code);
+    return img_format("BREAK %s", code);
 }
 
 
@@ -3499,13 +3235,13 @@ std::string NMD::BREAK_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BREAK_32_(uint64 instruction)
+static char *BREAK_32_(uint64 instruction)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
-    return img::format("BREAK %s", code);
+    return img_format("BREAK %s", code);
 }
 
 
@@ -3519,13 +3255,13 @@ std::string NMD::BREAK_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BRSC(uint64 instruction)
+static char *BRSC(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("BRSC %s", rs);
+    return img_format("BRSC %s", rs);
 }
 
 
@@ -3539,17 +3275,17 @@ std::string NMD::BRSC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CACHE(uint64 instruction)
+static char *CACHE(uint64 instruction)
 {
     uint64 op_value = extract_op_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string op = IMMEDIATE(copy(op_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *op = IMMEDIATE_UI(copy_ui(op_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("CACHE %s, %s(%s)", op, s, rs);
+    return img_format("CACHE %s, %s(%s)", op, s, rs);
 }
 
 
@@ -3563,17 +3299,17 @@ std::string NMD::CACHE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CACHEE(uint64 instruction)
+static char *CACHEE(uint64 instruction)
 {
     uint64 op_value = extract_op_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string op = IMMEDIATE(copy(op_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *op = IMMEDIATE_UI(copy_ui(op_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("CACHEE %s, %s(%s)", op, s, rs);
+    return img_format("CACHEE %s, %s(%s)", op, s, rs);
 }
 
 
@@ -3587,15 +3323,15 @@ std::string NMD::CACHEE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_L_D(uint64 instruction)
+static char *CEIL_L_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("CEIL.L.D %s, %s", ft, fs);
+    return img_format("CEIL.L.D %s, %s", ft, fs);
 }
 
 
@@ -3609,15 +3345,15 @@ std::string NMD::CEIL_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_L_S(uint64 instruction)
+static char *CEIL_L_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("CEIL.L.S %s, %s", ft, fs);
+    return img_format("CEIL.L.S %s, %s", ft, fs);
 }
 
 
@@ -3631,15 +3367,15 @@ std::string NMD::CEIL_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_W_D(uint64 instruction)
+static char *CEIL_W_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("CEIL.W.D %s, %s", ft, fs);
+    return img_format("CEIL.W.D %s, %s", ft, fs);
 }
 
 
@@ -3653,15 +3389,15 @@ std::string NMD::CEIL_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_W_S(uint64 instruction)
+static char *CEIL_W_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("CEIL.W.S %s, %s", ft, fs);
+    return img_format("CEIL.W.S %s, %s", ft, fs);
 }
 
 
@@ -3675,15 +3411,15 @@ std::string NMD::CEIL_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CFC1(uint64 instruction)
+static char *CFC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
-    return img::format("CFC1 %s, %s", rt, cs);
+    return img_format("CFC1 %s, %s", rt, cs);
 }
 
 
@@ -3697,15 +3433,15 @@ std::string NMD::CFC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CFC2(uint64 instruction)
+static char *CFC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
-    return img::format("CFC2 %s, %s", rt, cs);
+    return img_format("CFC2 %s, %s", rt, cs);
 }
 
 
@@ -3719,15 +3455,15 @@ std::string NMD::CFC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLASS_D(uint64 instruction)
+static char *CLASS_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("CLASS.D %s, %s", ft, fs);
+    return img_format("CLASS.D %s, %s", ft, fs);
 }
 
 
@@ -3741,15 +3477,15 @@ std::string NMD::CLASS_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLASS_S(uint64 instruction)
+static char *CLASS_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("CLASS.S %s, %s", ft, fs);
+    return img_format("CLASS.S %s, %s", ft, fs);
 }
 
 
@@ -3763,15 +3499,15 @@ std::string NMD::CLASS_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLO(uint64 instruction)
+static char *CLO(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("CLO %s, %s", rt, rs);
+    return img_format("CLO %s, %s", rt, rs);
 }
 
 
@@ -3785,15 +3521,15 @@ std::string NMD::CLO(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLZ(uint64 instruction)
+static char *CLZ(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("CLZ %s, %s", rt, rs);
+    return img_format("CLZ %s, %s", rt, rs);
 }
 
 
@@ -3807,17 +3543,17 @@ std::string NMD::CLZ(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_AF_D(uint64 instruction)
+static char *CMP_AF_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.AF.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.AF.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -3831,17 +3567,17 @@ std::string NMD::CMP_AF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_AF_S(uint64 instruction)
+static char *CMP_AF_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.AF.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.AF.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -3855,17 +3591,17 @@ std::string NMD::CMP_AF_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_EQ_D(uint64 instruction)
+static char *CMP_EQ_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.EQ.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.EQ.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -3878,15 +3614,15 @@ std::string NMD::CMP_EQ_D(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMP_EQ_PH(uint64 instruction)
+static char *CMP_EQ_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("CMP.EQ.PH %s, %s", rs, rt);
+    return img_format("CMP.EQ.PH %s, %s", rs, rt);
 }
 
 
@@ -3900,17 +3636,17 @@ std::string NMD::CMP_EQ_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_EQ_S(uint64 instruction)
+static char *CMP_EQ_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.EQ.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.EQ.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -3924,17 +3660,17 @@ std::string NMD::CMP_EQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LE_D(uint64 instruction)
+static char *CMP_LE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.LE.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.LE.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -3947,15 +3683,15 @@ std::string NMD::CMP_LE_D(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMP_LE_PH(uint64 instruction)
+static char *CMP_LE_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("CMP.LE.PH %s, %s", rs, rt);
+    return img_format("CMP.LE.PH %s, %s", rs, rt);
 }
 
 
@@ -3969,17 +3705,17 @@ std::string NMD::CMP_LE_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LE_S(uint64 instruction)
+static char *CMP_LE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.LE.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.LE.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -3993,17 +3729,17 @@ std::string NMD::CMP_LE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LT_D(uint64 instruction)
+static char *CMP_LT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.LT.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.LT.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4016,15 +3752,15 @@ std::string NMD::CMP_LT_D(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMP_LT_PH(uint64 instruction)
+static char *CMP_LT_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("CMP.LT.PH %s, %s", rs, rt);
+    return img_format("CMP.LT.PH %s, %s", rs, rt);
 }
 
 
@@ -4038,17 +3774,17 @@ std::string NMD::CMP_LT_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LT_S(uint64 instruction)
+static char *CMP_LT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.LT.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.LT.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4062,17 +3798,17 @@ std::string NMD::CMP_LT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_NE_D(uint64 instruction)
+static char *CMP_NE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.NE.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.NE.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4086,17 +3822,17 @@ std::string NMD::CMP_NE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_NE_S(uint64 instruction)
+static char *CMP_NE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.NE.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.NE.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4110,17 +3846,17 @@ std::string NMD::CMP_NE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_OR_D(uint64 instruction)
+static char *CMP_OR_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.OR.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.OR.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4134,17 +3870,17 @@ std::string NMD::CMP_OR_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_OR_S(uint64 instruction)
+static char *CMP_OR_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.OR.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.OR.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4158,17 +3894,17 @@ std::string NMD::CMP_OR_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SAF_D(uint64 instruction)
+static char *CMP_SAF_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SAF.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SAF.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4182,17 +3918,17 @@ std::string NMD::CMP_SAF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SAF_S(uint64 instruction)
+static char *CMP_SAF_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SAF.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SAF.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4206,17 +3942,17 @@ std::string NMD::CMP_SAF_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SEQ_D(uint64 instruction)
+static char *CMP_SEQ_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SEQ.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SEQ.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4230,17 +3966,17 @@ std::string NMD::CMP_SEQ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SEQ_S(uint64 instruction)
+static char *CMP_SEQ_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SEQ.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SEQ.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4254,17 +3990,17 @@ std::string NMD::CMP_SEQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLE_D(uint64 instruction)
+static char *CMP_SLE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SLE.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SLE.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4278,17 +4014,17 @@ std::string NMD::CMP_SLE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLE_S(uint64 instruction)
+static char *CMP_SLE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SLE.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SLE.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4302,17 +4038,17 @@ std::string NMD::CMP_SLE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLT_D(uint64 instruction)
+static char *CMP_SLT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SLT.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SLT.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4326,17 +4062,17 @@ std::string NMD::CMP_SLT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLT_S(uint64 instruction)
+static char *CMP_SLT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SLT.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SLT.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4350,17 +4086,17 @@ std::string NMD::CMP_SLT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SNE_D(uint64 instruction)
+static char *CMP_SNE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SNE.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SNE.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4374,17 +4110,17 @@ std::string NMD::CMP_SNE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SNE_S(uint64 instruction)
+static char *CMP_SNE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SNE.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SNE.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4398,17 +4134,17 @@ std::string NMD::CMP_SNE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SOR_D(uint64 instruction)
+static char *CMP_SOR_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SOR.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SOR.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4422,17 +4158,17 @@ std::string NMD::CMP_SOR_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SOR_S(uint64 instruction)
+static char *CMP_SOR_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SOR.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SOR.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4446,17 +4182,17 @@ std::string NMD::CMP_SOR_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUEQ_D(uint64 instruction)
+static char *CMP_SUEQ_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SUEQ.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SUEQ.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4470,17 +4206,17 @@ std::string NMD::CMP_SUEQ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUEQ_S(uint64 instruction)
+static char *CMP_SUEQ_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SUEQ.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SUEQ.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4494,17 +4230,17 @@ std::string NMD::CMP_SUEQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULE_D(uint64 instruction)
+static char *CMP_SULE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SULE.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SULE.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4518,17 +4254,17 @@ std::string NMD::CMP_SULE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULE_S(uint64 instruction)
+static char *CMP_SULE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SULE.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SULE.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4542,17 +4278,17 @@ std::string NMD::CMP_SULE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULT_D(uint64 instruction)
+static char *CMP_SULT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SULT.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SULT.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4566,17 +4302,17 @@ std::string NMD::CMP_SULT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULT_S(uint64 instruction)
+static char *CMP_SULT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SULT.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SULT.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4590,17 +4326,17 @@ std::string NMD::CMP_SULT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUN_D(uint64 instruction)
+static char *CMP_SUN_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SUN.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SUN.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4614,17 +4350,17 @@ std::string NMD::CMP_SUN_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUNE_D(uint64 instruction)
+static char *CMP_SUNE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SUNE.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SUNE.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4638,17 +4374,17 @@ std::string NMD::CMP_SUNE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUNE_S(uint64 instruction)
+static char *CMP_SUNE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SUNE.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SUNE.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4662,17 +4398,17 @@ std::string NMD::CMP_SUNE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUN_S(uint64 instruction)
+static char *CMP_SUN_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.SUN.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SUN.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4686,17 +4422,17 @@ std::string NMD::CMP_SUN_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UEQ_D(uint64 instruction)
+static char *CMP_UEQ_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.UEQ.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.UEQ.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4710,17 +4446,17 @@ std::string NMD::CMP_UEQ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UEQ_S(uint64 instruction)
+static char *CMP_UEQ_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.UEQ.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.UEQ.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4734,17 +4470,17 @@ std::string NMD::CMP_UEQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULE_D(uint64 instruction)
+static char *CMP_ULE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.ULE.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.ULE.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4758,17 +4494,17 @@ std::string NMD::CMP_ULE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULE_S(uint64 instruction)
+static char *CMP_ULE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.ULE.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.ULE.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4782,17 +4518,17 @@ std::string NMD::CMP_ULE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULT_D(uint64 instruction)
+static char *CMP_ULT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.ULT.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.ULT.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4806,17 +4542,17 @@ std::string NMD::CMP_ULT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULT_S(uint64 instruction)
+static char *CMP_ULT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.ULT.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.ULT.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4830,17 +4566,17 @@ std::string NMD::CMP_ULT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UN_D(uint64 instruction)
+static char *CMP_UN_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.UN.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.UN.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4854,17 +4590,17 @@ std::string NMD::CMP_UN_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UNE_D(uint64 instruction)
+static char *CMP_UNE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.UNE.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.UNE.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4878,17 +4614,17 @@ std::string NMD::CMP_UNE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UNE_S(uint64 instruction)
+static char *CMP_UNE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.UNE.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.UNE.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4902,17 +4638,17 @@ std::string NMD::CMP_UNE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UN_S(uint64 instruction)
+static char *CMP_UN_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("CMP.UN.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.UN.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4927,17 +4663,17 @@ std::string NMD::CMP_UN_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGDU_EQ_QB(uint64 instruction)
+static char *CMPGDU_EQ_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("CMPGDU.EQ.QB %s, %s, %s", rd, rs, rt);
+    return img_format("CMPGDU.EQ.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -4952,17 +4688,17 @@ std::string NMD::CMPGDU_EQ_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGDU_LE_QB(uint64 instruction)
+static char *CMPGDU_LE_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("CMPGDU.LE.QB %s, %s, %s", rd, rs, rt);
+    return img_format("CMPGDU.LE.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -4977,17 +4713,17 @@ std::string NMD::CMPGDU_LE_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGDU_LT_QB(uint64 instruction)
+static char *CMPGDU_LT_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("CMPGDU.LT.QB %s, %s, %s", rd, rs, rt);
+    return img_format("CMPGDU.LT.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5002,17 +4738,17 @@ std::string NMD::CMPGDU_LT_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGU_EQ_QB(uint64 instruction)
+static char *CMPGU_EQ_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("CMPGU.EQ.QB %s, %s, %s", rd, rs, rt);
+    return img_format("CMPGU.EQ.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5027,17 +4763,17 @@ std::string NMD::CMPGU_EQ_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGU_LE_QB(uint64 instruction)
+static char *CMPGU_LE_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("CMPGU.LE.QB %s, %s, %s", rd, rs, rt);
+    return img_format("CMPGU.LE.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5052,17 +4788,17 @@ std::string NMD::CMPGU_LE_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGU_LT_QB(uint64 instruction)
+static char *CMPGU_LT_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("CMPGU.LT.QB %s, %s, %s", rd, rs, rt);
+    return img_format("CMPGU.LT.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5076,15 +4812,15 @@ std::string NMD::CMPGU_LT_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMPU_EQ_QB(uint64 instruction)
+static char *CMPU_EQ_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("CMPU.EQ.QB %s, %s", rs, rt);
+    return img_format("CMPU.EQ.QB %s, %s", rs, rt);
 }
 
 
@@ -5098,15 +4834,15 @@ std::string NMD::CMPU_EQ_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMPU_LE_QB(uint64 instruction)
+static char *CMPU_LE_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("CMPU.LE.QB %s, %s", rs, rt);
+    return img_format("CMPU.LE.QB %s, %s", rs, rt);
 }
 
 
@@ -5120,15 +4856,15 @@ std::string NMD::CMPU_LE_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMPU_LT_QB(uint64 instruction)
+static char *CMPU_LT_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("CMPU.LT.QB %s, %s", rs, rt);
+    return img_format("CMPU.LT.QB %s, %s", rs, rt);
 }
 
 
@@ -5142,13 +4878,13 @@ std::string NMD::CMPU_LT_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::COP2_1(uint64 instruction)
+static char *COP2_1(uint64 instruction)
 {
     uint64 cofun_value = extract_cofun_25_24_23(instruction);
 
-    std::string cofun = IMMEDIATE(copy(cofun_value));
+    const char *cofun = IMMEDIATE_UI(copy_ui(cofun_value));
 
-    return img::format("COP2_1 %s", cofun);
+    return img_format("COP2_1 %s", cofun);
 }
 
 
@@ -5162,15 +4898,15 @@ std::string NMD::COP2_1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CTC1(uint64 instruction)
+static char *CTC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
-    return img::format("CTC1 %s, %s", rt, cs);
+    return img_format("CTC1 %s, %s", rt, cs);
 }
 
 
@@ -5184,15 +4920,15 @@ std::string NMD::CTC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CTC2(uint64 instruction)
+static char *CTC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
-    return img::format("CTC2 %s, %s", rt, cs);
+    return img_format("CTC2 %s, %s", rt, cs);
 }
 
 
@@ -5206,15 +4942,15 @@ std::string NMD::CTC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_D_L(uint64 instruction)
+static char *CVT_D_L(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("CVT.D.L %s, %s", ft, fs);
+    return img_format("CVT.D.L %s, %s", ft, fs);
 }
 
 
@@ -5228,15 +4964,15 @@ std::string NMD::CVT_D_L(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_D_S(uint64 instruction)
+static char *CVT_D_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("CVT.D.S %s, %s", ft, fs);
+    return img_format("CVT.D.S %s, %s", ft, fs);
 }
 
 
@@ -5250,15 +4986,15 @@ std::string NMD::CVT_D_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_D_W(uint64 instruction)
+static char *CVT_D_W(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("CVT.D.W %s, %s", ft, fs);
+    return img_format("CVT.D.W %s, %s", ft, fs);
 }
 
 
@@ -5272,15 +5008,15 @@ std::string NMD::CVT_D_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_L_D(uint64 instruction)
+static char *CVT_L_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("CVT.L.D %s, %s", ft, fs);
+    return img_format("CVT.L.D %s, %s", ft, fs);
 }
 
 
@@ -5294,15 +5030,15 @@ std::string NMD::CVT_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_L_S(uint64 instruction)
+static char *CVT_L_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("CVT.L.S %s, %s", ft, fs);
+    return img_format("CVT.L.S %s, %s", ft, fs);
 }
 
 
@@ -5316,15 +5052,15 @@ std::string NMD::CVT_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_D(uint64 instruction)
+static char *CVT_S_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("CVT.S.D %s, %s", ft, fs);
+    return img_format("CVT.S.D %s, %s", ft, fs);
 }
 
 
@@ -5338,15 +5074,15 @@ std::string NMD::CVT_S_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_L(uint64 instruction)
+static char *CVT_S_L(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("CVT.S.L %s, %s", ft, fs);
+    return img_format("CVT.S.L %s, %s", ft, fs);
 }
 
 
@@ -5360,15 +5096,15 @@ std::string NMD::CVT_S_L(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_PL(uint64 instruction)
+static char *CVT_S_PL(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("CVT.S.PL %s, %s", ft, fs);
+    return img_format("CVT.S.PL %s, %s", ft, fs);
 }
 
 
@@ -5382,15 +5118,15 @@ std::string NMD::CVT_S_PL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_PU(uint64 instruction)
+static char *CVT_S_PU(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("CVT.S.PU %s, %s", ft, fs);
+    return img_format("CVT.S.PU %s, %s", ft, fs);
 }
 
 
@@ -5404,15 +5140,15 @@ std::string NMD::CVT_S_PU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_W(uint64 instruction)
+static char *CVT_S_W(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("CVT.S.W %s, %s", ft, fs);
+    return img_format("CVT.S.W %s, %s", ft, fs);
 }
 
 
@@ -5426,15 +5162,15 @@ std::string NMD::CVT_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_W_D(uint64 instruction)
+static char *CVT_W_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("CVT.W.D %s, %s", ft, fs);
+    return img_format("CVT.W.D %s, %s", ft, fs);
 }
 
 
@@ -5448,15 +5184,15 @@ std::string NMD::CVT_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_W_S(uint64 instruction)
+static char *CVT_W_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("CVT.W.S %s, %s", ft, fs);
+    return img_format("CVT.W.S %s, %s", ft, fs);
 }
 
 
@@ -5470,15 +5206,15 @@ std::string NMD::CVT_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDIU_48_(uint64 instruction)
+static char *DADDIU_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
 
-    return img::format("DADDIU %s, %s", rt, s);
+    return img_format("DADDIU %s, %s", rt, s);
 }
 
 
@@ -5492,17 +5228,17 @@ std::string NMD::DADDIU_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDIU_NEG_(uint64 instruction)
+static char *DADDIU_NEG_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(neg_copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_UI(neg_copy_ui(u_value));
 
-    return img::format("DADDIU %s, %s, %s", rt, rs, u);
+    return img_format("DADDIU %s, %s, %s", rt, rs, u);
 }
 
 
@@ -5516,17 +5252,17 @@ std::string NMD::DADDIU_NEG_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDIU_U12_(uint64 instruction)
+static char *DADDIU_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("DADDIU %s, %s, %s", rt, rs, u);
+    return img_format("DADDIU %s, %s, %s", rt, rs, u);
 }
 
 
@@ -5540,17 +5276,17 @@ std::string NMD::DADDIU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADD(uint64 instruction)
+static char *DADD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DADD %s, %s, %s", rd, rs, rt);
+    return img_format("DADD %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5564,17 +5300,17 @@ std::string NMD::DADD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDU(uint64 instruction)
+static char *DADDU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DADDU %s, %s, %s", rd, rs, rt);
+    return img_format("DADDU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5588,15 +5324,15 @@ std::string NMD::DADDU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DCLO(uint64 instruction)
+static char *DCLO(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("DCLO %s, %s", rt, rs);
+    return img_format("DCLO %s, %s", rt, rs);
 }
 
 
@@ -5610,15 +5346,15 @@ std::string NMD::DCLO(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DCLZ(uint64 instruction)
+static char *DCLZ(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("DCLZ %s, %s", rt, rs);
+    return img_format("DCLZ %s, %s", rt, rs);
 }
 
 
@@ -5632,17 +5368,17 @@ std::string NMD::DCLZ(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DDIV(uint64 instruction)
+static char *DDIV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DDIV %s, %s, %s", rd, rs, rt);
+    return img_format("DDIV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5656,17 +5392,17 @@ std::string NMD::DDIV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DDIVU(uint64 instruction)
+static char *DDIVU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DDIVU %s, %s, %s", rd, rs, rt);
+    return img_format("DDIVU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5680,11 +5416,11 @@ std::string NMD::DDIVU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DERET(uint64 instruction)
+static char *DERET(uint64 instruction)
 {
     (void)instruction;
 
-    return "DERET ";
+    return strdup("DERET ");
 }
 
 
@@ -5698,19 +5434,19 @@ std::string NMD::DERET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DEXTM(uint64 instruction)
+static char *DEXTM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string lsb = IMMEDIATE(copy(lsb_value));
-    std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *lsb = IMMEDIATE_UI(copy_ui(lsb_value));
+    const char *msbd = IMMEDIATE_UI(encode_msbd_from_size(msbd_value));
 
-    return img::format("DEXTM %s, %s, %s, %s", rt, rs, lsb, msbd);
+    return img_format("DEXTM %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
 
 
@@ -5724,19 +5460,19 @@ std::string NMD::DEXTM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DEXT(uint64 instruction)
+static char *DEXT(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string lsb = IMMEDIATE(copy(lsb_value));
-    std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *lsb = IMMEDIATE_UI(copy_ui(lsb_value));
+    const char *msbd = IMMEDIATE_UI(encode_msbd_from_size(msbd_value));
 
-    return img::format("DEXT %s, %s, %s, %s", rt, rs, lsb, msbd);
+    return img_format("DEXT %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
 
 
@@ -5750,19 +5486,19 @@ std::string NMD::DEXT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DEXTU(uint64 instruction)
+static char *DEXTU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string lsb = IMMEDIATE(copy(lsb_value));
-    std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *lsb = IMMEDIATE_UI(copy_ui(lsb_value));
+    const char *msbd = IMMEDIATE_UI(encode_msbd_from_size(msbd_value));
 
-    return img::format("DEXTU %s, %s, %s, %s", rt, rs, lsb, msbd);
+    return img_format("DEXTU %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
 
 
@@ -5776,20 +5512,20 @@ std::string NMD::DEXTU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DINSM(uint64 instruction)
+static char *DINSM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *pos = IMMEDIATE_UI(encode_lsb_from_pos_and_size(lsb_value));
+    const char *size = IMMEDIATE_UI(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
-    return img::format("DINSM %s, %s, %s, %s", rt, rs, pos, size);
+    return img_format("DINSM %s, %s, %s, %s", rt, rs, pos, size);
     /* hand edited */
 }
 
@@ -5804,20 +5540,20 @@ std::string NMD::DINSM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DINS(uint64 instruction)
+static char *DINS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *pos = IMMEDIATE_UI(encode_lsb_from_pos_and_size(lsb_value));
+    const char *size = IMMEDIATE_UI(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
-    return img::format("DINS %s, %s, %s, %s", rt, rs, pos, size);
+    return img_format("DINS %s, %s, %s, %s", rt, rs, pos, size);
     /* hand edited */
 }
 
@@ -5832,20 +5568,20 @@ std::string NMD::DINS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DINSU(uint64 instruction)
+static char *DINSU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *pos = IMMEDIATE_UI(encode_lsb_from_pos_and_size(lsb_value));
+    const char *size = IMMEDIATE_UI(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
-    return img::format("DINSU %s, %s, %s, %s", rt, rs, pos, size);
+    return img_format("DINSU %s, %s, %s, %s", rt, rs, pos, size);
     /* hand edited */
 }
 
@@ -5860,13 +5596,13 @@ std::string NMD::DINSU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DI(uint64 instruction)
+static char *DI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DI %s", rt);
+    return img_format("DI %s", rt);
 }
 
 
@@ -5880,17 +5616,17 @@ std::string NMD::DI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIV(uint64 instruction)
+static char *DIV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DIV %s, %s, %s", rd, rs, rt);
+    return img_format("DIV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5904,17 +5640,17 @@ std::string NMD::DIV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIV_D(uint64 instruction)
+static char *DIV_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("DIV.D %s, %s, %s", fd, fs, ft);
+    return img_format("DIV.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -5928,17 +5664,17 @@ std::string NMD::DIV_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIV_S(uint64 instruction)
+static char *DIV_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("DIV.S %s, %s, %s", fd, fs, ft);
+    return img_format("DIV.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -5952,17 +5688,17 @@ std::string NMD::DIV_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIVU(uint64 instruction)
+static char *DIVU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DIVU %s, %s, %s", rd, rs, rt);
+    return img_format("DIVU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5976,19 +5712,19 @@ std::string NMD::DIVU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DLSA(uint64 instruction)
+static char *DLSA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 u2_value = extract_u2_10_9(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string u2 = IMMEDIATE(copy(u2_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u2 = IMMEDIATE_UI(copy_ui(u2_value));
 
-    return img::format("DLSA %s, %s, %s, %s", rd, rs, rt, u2);
+    return img_format("DLSA %s, %s, %s, %s", rd, rs, rt, u2);
 }
 
 
@@ -6002,15 +5738,15 @@ std::string NMD::DLSA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DLUI_48_(uint64 instruction)
+static char *DLUI_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     uint64 u_value = extract_u_31_to_0__s32(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("DLUI %s, %s", rt, u);
+    return img_format("DLUI %s, %s", rt, u);
 }
 
 
@@ -6024,17 +5760,17 @@ std::string NMD::DLUI_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFC0(uint64 instruction)
+static char *DMFC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
-    return img::format("DMFC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("DMFC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -6048,15 +5784,15 @@ std::string NMD::DMFC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFC1(uint64 instruction)
+static char *DMFC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("DMFC1 %s, %s", rt, fs);
+    return img_format("DMFC1 %s, %s", rt, fs);
 }
 
 
@@ -6070,15 +5806,15 @@ std::string NMD::DMFC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFC2(uint64 instruction)
+static char *DMFC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
-    return img::format("DMFC2 %s, %s", rt, cs);
+    return img_format("DMFC2 %s, %s", rt, cs);
 }
 
 
@@ -6092,17 +5828,17 @@ std::string NMD::DMFC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFGC0(uint64 instruction)
+static char *DMFGC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
-    return img::format("DMFGC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("DMFGC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -6116,17 +5852,17 @@ std::string NMD::DMFGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMOD(uint64 instruction)
+static char *DMOD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DMOD %s, %s, %s", rd, rs, rt);
+    return img_format("DMOD %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -6140,17 +5876,17 @@ std::string NMD::DMOD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMODU(uint64 instruction)
+static char *DMODU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DMODU %s, %s, %s", rd, rs, rt);
+    return img_format("DMODU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -6164,17 +5900,17 @@ std::string NMD::DMODU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTC0(uint64 instruction)
+static char *DMTC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
-    return img::format("DMTC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("DMTC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -6188,15 +5924,15 @@ std::string NMD::DMTC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTC1(uint64 instruction)
+static char *DMTC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("DMTC1 %s, %s", rt, fs);
+    return img_format("DMTC1 %s, %s", rt, fs);
 }
 
 
@@ -6210,15 +5946,15 @@ std::string NMD::DMTC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTC2(uint64 instruction)
+static char *DMTC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
-    return img::format("DMTC2 %s, %s", rt, cs);
+    return img_format("DMTC2 %s, %s", rt, cs);
 }
 
 
@@ -6232,17 +5968,17 @@ std::string NMD::DMTC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTGC0(uint64 instruction)
+static char *DMTGC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
-    return img::format("DMTGC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("DMTGC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -6256,13 +5992,13 @@ std::string NMD::DMTGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMT(uint64 instruction)
+static char *DMT(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DMT %s", rt);
+    return img_format("DMT %s", rt);
 }
 
 
@@ -6276,17 +6012,17 @@ std::string NMD::DMT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMUH(uint64 instruction)
+static char *DMUH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DMUH %s, %s, %s", rd, rs, rt);
+    return img_format("DMUH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -6300,17 +6036,17 @@ std::string NMD::DMUH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMUHU(uint64 instruction)
+static char *DMUHU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DMUHU %s, %s, %s", rd, rs, rt);
+    return img_format("DMUHU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -6324,17 +6060,17 @@ std::string NMD::DMUHU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMUL(uint64 instruction)
+static char *DMUL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DMUL %s, %s, %s", rd, rs, rt);
+    return img_format("DMUL %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -6348,17 +6084,17 @@ std::string NMD::DMUL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMULU(uint64 instruction)
+static char *DMULU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DMULU %s, %s, %s", rd, rs, rt);
+    return img_format("DMULU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -6373,17 +6109,17 @@ std::string NMD::DMULU(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::DPA_W_PH(uint64 instruction)
+static char *DPA_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DPA.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPA.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6397,17 +6133,17 @@ std::string NMD::DPA_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQ_SA_L_W(uint64 instruction)
+static char *DPAQ_SA_L_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DPAQ_SA.L.W %s, %s, %s", ac, rs, rt);
+    return img_format("DPAQ_SA.L.W %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6421,17 +6157,17 @@ std::string NMD::DPAQ_SA_L_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQ_S_W_PH(uint64 instruction)
+static char *DPAQ_S_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DPAQ_S.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPAQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6445,17 +6181,17 @@ std::string NMD::DPAQ_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQX_SA_W_PH(uint64 instruction)
+static char *DPAQX_SA_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DPAQX_SA.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPAQX_SA.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6469,17 +6205,17 @@ std::string NMD::DPAQX_SA_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQX_S_W_PH(uint64 instruction)
+static char *DPAQX_S_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DPAQX_S.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPAQX_S.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6493,17 +6229,17 @@ std::string NMD::DPAQX_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAU_H_QBL(uint64 instruction)
+static char *DPAU_H_QBL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DPAU.H.QBL %s, %s, %s", ac, rs, rt);
+    return img_format("DPAU.H.QBL %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6517,17 +6253,17 @@ std::string NMD::DPAU_H_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAU_H_QBR(uint64 instruction)
+static char *DPAU_H_QBR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DPAU.H.QBR %s, %s, %s", ac, rs, rt);
+    return img_format("DPAU.H.QBR %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6541,17 +6277,17 @@ std::string NMD::DPAU_H_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAX_W_PH(uint64 instruction)
+static char *DPAX_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DPAX.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPAX.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6565,17 +6301,17 @@ std::string NMD::DPAX_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPS_W_PH(uint64 instruction)
+static char *DPS_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DPS.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPS.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6589,17 +6325,17 @@ std::string NMD::DPS_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQ_SA_L_W(uint64 instruction)
+static char *DPSQ_SA_L_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DPSQ_SA.L.W %s, %s, %s", ac, rs, rt);
+    return img_format("DPSQ_SA.L.W %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6613,17 +6349,17 @@ std::string NMD::DPSQ_SA_L_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQ_S_W_PH(uint64 instruction)
+static char *DPSQ_S_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DPSQ_S.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPSQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6637,17 +6373,17 @@ std::string NMD::DPSQ_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQX_SA_W_PH(uint64 instruction)
+static char *DPSQX_SA_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DPSQX_SA.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPSQX_SA.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6661,17 +6397,17 @@ std::string NMD::DPSQX_SA_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQX_S_W_PH(uint64 instruction)
+static char *DPSQX_S_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DPSQX_S.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPSQX_S.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6685,17 +6421,17 @@ std::string NMD::DPSQX_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSU_H_QBL(uint64 instruction)
+static char *DPSU_H_QBL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DPSU.H.QBL %s, %s, %s", ac, rs, rt);
+    return img_format("DPSU.H.QBL %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6709,17 +6445,17 @@ std::string NMD::DPSU_H_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSU_H_QBR(uint64 instruction)
+static char *DPSU_H_QBR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DPSU.H.QBR %s, %s, %s", ac, rs, rt);
+    return img_format("DPSU.H.QBR %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6733,17 +6469,17 @@ std::string NMD::DPSU_H_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSX_W_PH(uint64 instruction)
+static char *DPSX_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DPSX.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPSX.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6757,17 +6493,17 @@ std::string NMD::DPSX_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DROTR(uint64 instruction)
+static char *DROTR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
-    return img::format("DROTR %s, %s, %s", rt, rs, shift);
+    return img_format("DROTR %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -6781,17 +6517,17 @@ std::string NMD::DROTR(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DROTR32(uint64 instruction)
+static char *DROTR32(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
-    return img::format("DROTR32 %s, %s, %s", rt, rs, shift);
+    return img_format("DROTR32 %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -6805,17 +6541,17 @@ std::string NMD::DROTR32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DROTRV(uint64 instruction)
+static char *DROTRV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DROTRV %s, %s, %s", rd, rs, rt);
+    return img_format("DROTRV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -6829,19 +6565,19 @@ std::string NMD::DROTRV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DROTX(uint64 instruction)
+static char *DROTX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shiftx_value = extract_shiftx_11_10_9_8_7_6(instruction);
     uint64 shift_value = extract_shift_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
-    std::string shiftx = IMMEDIATE(copy(shiftx_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
+    const char *shiftx = IMMEDIATE_UI(copy_ui(shiftx_value));
 
-    return img::format("DROTX %s, %s, %s, %s", rt, rs, shift, shiftx);
+    return img_format("DROTX %s, %s, %s, %s", rt, rs, shift, shiftx);
 }
 
 
@@ -6855,17 +6591,17 @@ std::string NMD::DROTX(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSLL(uint64 instruction)
+static char *DSLL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
-    return img::format("DSLL %s, %s, %s", rt, rs, shift);
+    return img_format("DSLL %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -6879,17 +6615,17 @@ std::string NMD::DSLL(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSLL32(uint64 instruction)
+static char *DSLL32(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
-    return img::format("DSLL32 %s, %s, %s", rt, rs, shift);
+    return img_format("DSLL32 %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -6903,17 +6639,17 @@ std::string NMD::DSLL32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSLLV(uint64 instruction)
+static char *DSLLV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DSLLV %s, %s, %s", rd, rs, rt);
+    return img_format("DSLLV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -6927,17 +6663,17 @@ std::string NMD::DSLLV(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRA(uint64 instruction)
+static char *DSRA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
-    return img::format("DSRA %s, %s, %s", rt, rs, shift);
+    return img_format("DSRA %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -6951,17 +6687,17 @@ std::string NMD::DSRA(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRA32(uint64 instruction)
+static char *DSRA32(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
-    return img::format("DSRA32 %s, %s, %s", rt, rs, shift);
+    return img_format("DSRA32 %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -6975,17 +6711,17 @@ std::string NMD::DSRA32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSRAV(uint64 instruction)
+static char *DSRAV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DSRAV %s, %s, %s", rd, rs, rt);
+    return img_format("DSRAV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -6999,17 +6735,17 @@ std::string NMD::DSRAV(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRL(uint64 instruction)
+static char *DSRL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
-    return img::format("DSRL %s, %s, %s", rt, rs, shift);
+    return img_format("DSRL %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -7023,17 +6759,17 @@ std::string NMD::DSRL(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRL32(uint64 instruction)
+static char *DSRL32(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
-    return img::format("DSRL32 %s, %s, %s", rt, rs, shift);
+    return img_format("DSRL32 %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -7047,17 +6783,17 @@ std::string NMD::DSRL32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSRLV(uint64 instruction)
+static char *DSRLV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DSRLV %s, %s, %s", rd, rs, rt);
+    return img_format("DSRLV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -7071,17 +6807,17 @@ std::string NMD::DSRLV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSUB(uint64 instruction)
+static char *DSUB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DSUB %s, %s, %s", rd, rs, rt);
+    return img_format("DSUB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -7095,17 +6831,17 @@ std::string NMD::DSUB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSUBU(uint64 instruction)
+static char *DSUBU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DSUBU %s, %s, %s", rd, rs, rt);
+    return img_format("DSUBU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -7119,13 +6855,13 @@ std::string NMD::DSUBU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DVPE(uint64 instruction)
+static char *DVPE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DVPE %s", rt);
+    return img_format("DVPE %s", rt);
 }
 
 
@@ -7139,13 +6875,13 @@ std::string NMD::DVPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DVP(uint64 instruction)
+static char *DVP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("DVP %s", rt);
+    return img_format("DVP %s", rt);
 }
 
 
@@ -7159,11 +6895,11 @@ std::string NMD::DVP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EHB(uint64 instruction)
+static char *EHB(uint64 instruction)
 {
     (void)instruction;
 
-    return "EHB ";
+    return strdup("EHB ");
 }
 
 
@@ -7177,13 +6913,13 @@ std::string NMD::EHB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EI(uint64 instruction)
+static char *EI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("EI %s", rt);
+    return img_format("EI %s", rt);
 }
 
 
@@ -7197,13 +6933,13 @@ std::string NMD::EI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EMT(uint64 instruction)
+static char *EMT(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("EMT %s", rt);
+    return img_format("EMT %s", rt);
 }
 
 
@@ -7217,11 +6953,11 @@ std::string NMD::EMT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ERET(uint64 instruction)
+static char *ERET(uint64 instruction)
 {
     (void)instruction;
 
-    return "ERET ";
+    return strdup("ERET ");
 }
 
 
@@ -7235,11 +6971,11 @@ std::string NMD::ERET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ERETNC(uint64 instruction)
+static char *ERETNC(uint64 instruction)
 {
     (void)instruction;
 
-    return "ERETNC ";
+    return strdup("ERETNC ");
 }
 
 
@@ -7253,13 +6989,13 @@ std::string NMD::ERETNC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EVP(uint64 instruction)
+static char *EVP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("EVP %s", rt);
+    return img_format("EVP %s", rt);
 }
 
 
@@ -7273,13 +7009,13 @@ std::string NMD::EVP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EVPE(uint64 instruction)
+static char *EVPE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("EVPE %s", rt);
+    return img_format("EVPE %s", rt);
 }
 
 
@@ -7293,19 +7029,19 @@ std::string NMD::EVPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXT(uint64 instruction)
+static char *EXT(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string lsb = IMMEDIATE(copy(lsb_value));
-    std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *lsb = IMMEDIATE_UI(copy_ui(lsb_value));
+    const char *msbd = IMMEDIATE_UI(encode_msbd_from_size(msbd_value));
 
-    return img::format("EXT %s, %s, %s, %s", rt, rs, lsb, msbd);
+    return img_format("EXT %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
 
 
@@ -7319,19 +7055,19 @@ std::string NMD::EXT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTD(uint64 instruction)
+static char *EXTD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
-    return img::format("EXTD %s, %s, %s, %s", rd, rs, rt, shift);
+    return img_format("EXTD %s, %s, %s, %s", rd, rs, rt, shift);
 }
 
 
@@ -7345,19 +7081,19 @@ std::string NMD::EXTD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTD32(uint64 instruction)
+static char *EXTD32(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
-    return img::format("EXTD32 %s, %s, %s, %s", rd, rs, rt, shift);
+    return img_format("EXTD32 %s, %s, %s, %s", rd, rs, rt, shift);
 }
 
 
@@ -7371,17 +7107,17 @@ std::string NMD::EXTD32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTPDP(uint64 instruction)
+static char *EXTPDP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string size = IMMEDIATE(copy(size_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *size = IMMEDIATE_UI(copy_ui(size_value));
 
-    return img::format("EXTPDP %s, %s, %s", rt, ac, size);
+    return img_format("EXTPDP %s, %s, %s", rt, ac, size);
 }
 
 
@@ -7395,17 +7131,17 @@ std::string NMD::EXTPDP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTPDPV(uint64 instruction)
+static char *EXTPDPV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("EXTPDPV %s, %s, %s", rt, ac, rs);
+    return img_format("EXTPDPV %s, %s, %s", rt, ac, rs);
 }
 
 
@@ -7419,17 +7155,17 @@ std::string NMD::EXTPDPV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTP(uint64 instruction)
+static char *EXTP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string size = IMMEDIATE(copy(size_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *size = IMMEDIATE_UI(copy_ui(size_value));
 
-    return img::format("EXTP %s, %s, %s", rt, ac, size);
+    return img_format("EXTP %s, %s, %s", rt, ac, size);
 }
 
 
@@ -7443,17 +7179,17 @@ std::string NMD::EXTP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTPV(uint64 instruction)
+static char *EXTPV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("EXTPV %s, %s, %s", rt, ac, rs);
+    return img_format("EXTPV %s, %s, %s", rt, ac, rs);
 }
 
 
@@ -7468,17 +7204,17 @@ std::string NMD::EXTPV(uint64 instruction)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_RS_W(uint64 instruction)
+static char *EXTR_RS_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
-    return img::format("EXTR_RS.W %s, %s, %s", rt, ac, shift);
+    return img_format("EXTR_RS.W %s, %s, %s", rt, ac, shift);
 }
 
 
@@ -7493,17 +7229,17 @@ std::string NMD::EXTR_RS_W(uint64 instruction)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_R_W(uint64 instruction)
+static char *EXTR_R_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
-    return img::format("EXTR_R.W %s, %s, %s", rt, ac, shift);
+    return img_format("EXTR_R.W %s, %s, %s", rt, ac, shift);
 }
 
 
@@ -7518,17 +7254,17 @@ std::string NMD::EXTR_R_W(uint64 instruction)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_S_H(uint64 instruction)
+static char *EXTR_S_H(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
-    return img::format("EXTR_S.H %s, %s, %s", rt, ac, shift);
+    return img_format("EXTR_S.H %s, %s, %s", rt, ac, shift);
 }
 
 
@@ -7543,17 +7279,17 @@ std::string NMD::EXTR_S_H(uint64 instruction)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_W(uint64 instruction)
+static char *EXTR_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
-    return img::format("EXTR.W %s, %s, %s", rt, ac, shift);
+    return img_format("EXTR.W %s, %s, %s", rt, ac, shift);
 }
 
 
@@ -7568,17 +7304,17 @@ std::string NMD::EXTR_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_RS_W(uint64 instruction)
+static char *EXTRV_RS_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("EXTRV_RS.W %s, %s, %s", rt, ac, rs);
+    return img_format("EXTRV_RS.W %s, %s, %s", rt, ac, rs);
 }
 
 
@@ -7593,17 +7329,17 @@ std::string NMD::EXTRV_RS_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_R_W(uint64 instruction)
+static char *EXTRV_R_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("EXTRV_R.W %s, %s, %s", rt, ac, rs);
+    return img_format("EXTRV_R.W %s, %s, %s", rt, ac, rs);
 }
 
 
@@ -7618,17 +7354,17 @@ std::string NMD::EXTRV_R_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_S_H(uint64 instruction)
+static char *EXTRV_S_H(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("EXTRV_S.H %s, %s, %s", rt, ac, rs);
+    return img_format("EXTRV_S.H %s, %s, %s", rt, ac, rs);
 }
 
 
@@ -7643,17 +7379,17 @@ std::string NMD::EXTRV_S_H(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_W(uint64 instruction)
+static char *EXTRV_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("EXTRV.W %s, %s, %s", rt, ac, rs);
+    return img_format("EXTRV.W %s, %s, %s", rt, ac, rs);
 }
 
 
@@ -7668,19 +7404,19 @@ std::string NMD::EXTRV_W(uint64 instruction)
  *               rd -----
  *                 shift -----
  */
-std::string NMD::EXTW(uint64 instruction)
+static char *EXTW(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
-    return img::format("EXTW %s, %s, %s, %s", rd, rs, rt, shift);
+    return img_format("EXTW %s, %s, %s, %s", rd, rs, rt, shift);
 }
 
 
@@ -7694,15 +7430,15 @@ std::string NMD::EXTW(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_L_D(uint64 instruction)
+static char *FLOOR_L_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("FLOOR.L.D %s, %s", ft, fs);
+    return img_format("FLOOR.L.D %s, %s", ft, fs);
 }
 
 
@@ -7716,15 +7452,15 @@ std::string NMD::FLOOR_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_L_S(uint64 instruction)
+static char *FLOOR_L_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("FLOOR.L.S %s, %s", ft, fs);
+    return img_format("FLOOR.L.S %s, %s", ft, fs);
 }
 
 
@@ -7738,15 +7474,15 @@ std::string NMD::FLOOR_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_W_D(uint64 instruction)
+static char *FLOOR_W_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("FLOOR.W.D %s, %s", ft, fs);
+    return img_format("FLOOR.W.D %s, %s", ft, fs);
 }
 
 
@@ -7760,15 +7496,15 @@ std::string NMD::FLOOR_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_W_S(uint64 instruction)
+static char *FLOOR_W_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("FLOOR.W.S %s, %s", ft, fs);
+    return img_format("FLOOR.W.S %s, %s", ft, fs);
 }
 
 
@@ -7782,17 +7518,17 @@ std::string NMD::FLOOR_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FORK(uint64 instruction)
+static char *FORK(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("FORK %s, %s, %s", rd, rs, rt);
+    return img_format("FORK %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -7806,13 +7542,13 @@ std::string NMD::FORK(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::HYPCALL(uint64 instruction)
+static char *HYPCALL(uint64 instruction)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
-    return img::format("HYPCALL %s", code);
+    return img_format("HYPCALL %s", code);
 }
 
 
@@ -7826,13 +7562,13 @@ std::string NMD::HYPCALL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::HYPCALL_16_(uint64 instruction)
+static char *HYPCALL_16_(uint64 instruction)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
-    return img::format("HYPCALL %s", code);
+    return img_format("HYPCALL %s", code);
 }
 
 
@@ -7846,20 +7582,20 @@ std::string NMD::HYPCALL_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::INS(uint64 instruction)
+static char *INS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *pos = IMMEDIATE_UI(encode_lsb_from_pos_and_size(lsb_value));
+    const char *size = IMMEDIATE_UI(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
-    return img::format("INS %s, %s, %s, %s", rt, rs, pos, size);
+    return img_format("INS %s, %s, %s, %s", rt, rs, pos, size);
     /* hand edited */
 }
 
@@ -7873,15 +7609,15 @@ std::string NMD::INS(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::INSV(uint64 instruction)
+static char *INSV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("INSV %s, %s", rt, rs);
+    return img_format("INSV %s, %s", rt, rs);
 }
 
 
@@ -7895,11 +7631,11 @@ std::string NMD::INSV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::IRET(uint64 instruction)
+static char *IRET(uint64 instruction)
 {
     (void)instruction;
 
-    return "IRET ";
+    return strdup("IRET ");
 }
 
 
@@ -7913,13 +7649,13 @@ std::string NMD::IRET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JALRC_16_(uint64 instruction)
+static char *JALRC_16_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("JALRC $%d, %s", 31, rt);
+    return img_format("JALRC $%d, %s", 31, rt);
 }
 
 
@@ -7933,15 +7669,15 @@ std::string NMD::JALRC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JALRC_32_(uint64 instruction)
+static char *JALRC_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("JALRC %s, %s", rt, rs);
+    return img_format("JALRC %s, %s", rt, rs);
 }
 
 
@@ -7955,15 +7691,15 @@ std::string NMD::JALRC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JALRC_HB(uint64 instruction)
+static char *JALRC_HB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("JALRC.HB %s, %s", rt, rs);
+    return img_format("JALRC.HB %s, %s", rt, rs);
 }
 
 
@@ -7977,13 +7713,13 @@ std::string NMD::JALRC_HB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JRC(uint64 instruction)
+static char *JRC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("JRC %s", rt);
+    return img_format("JRC %s", rt);
 }
 
 
@@ -7997,17 +7733,17 @@ std::string NMD::JRC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_16_(uint64 instruction)
+static char *LB_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("LB %s, %s(%s)", rt3, u, rs3);
+    return img_format("LB %s, %s(%s)", rt3, u, rs3);
 }
 
 
@@ -8021,15 +7757,15 @@ std::string NMD::LB_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_GP_(uint64 instruction)
+static char *LB_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("LB %s, %s($%d)", rt, u, 28);
+    return img_format("LB %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -8043,17 +7779,17 @@ std::string NMD::LB_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_S9_(uint64 instruction)
+static char *LB_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LB %s, %s(%s)", rt, s, rs);
+    return img_format("LB %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8067,17 +7803,17 @@ std::string NMD::LB_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_U12_(uint64 instruction)
+static char *LB_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LB %s, %s(%s)", rt, u, rs);
+    return img_format("LB %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -8091,17 +7827,17 @@ std::string NMD::LB_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBE(uint64 instruction)
+static char *LBE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LBE %s, %s(%s)", rt, s, rs);
+    return img_format("LBE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8115,17 +7851,17 @@ std::string NMD::LBE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_16_(uint64 instruction)
+static char *LBU_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("LBU %s, %s(%s)", rt3, u, rs3);
+    return img_format("LBU %s, %s(%s)", rt3, u, rs3);
 }
 
 
@@ -8139,15 +7875,15 @@ std::string NMD::LBU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_GP_(uint64 instruction)
+static char *LBU_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("LBU %s, %s($%d)", rt, u, 28);
+    return img_format("LBU %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -8161,17 +7897,17 @@ std::string NMD::LBU_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_S9_(uint64 instruction)
+static char *LBU_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LBU %s, %s(%s)", rt, s, rs);
+    return img_format("LBU %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8185,17 +7921,17 @@ std::string NMD::LBU_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_U12_(uint64 instruction)
+static char *LBU_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LBU %s, %s(%s)", rt, u, rs);
+    return img_format("LBU %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -8209,17 +7945,17 @@ std::string NMD::LBU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBUE(uint64 instruction)
+static char *LBUE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LBUE %s, %s(%s)", rt, s, rs);
+    return img_format("LBUE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8233,17 +7969,17 @@ std::string NMD::LBUE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBUX(uint64 instruction)
+static char *LBUX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("LBUX %s, %s(%s)", rd, rs, rt);
+    return img_format("LBUX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -8257,17 +7993,17 @@ std::string NMD::LBUX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBX(uint64 instruction)
+static char *LBX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("LBX %s, %s(%s)", rd, rs, rt);
+    return img_format("LBX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -8281,15 +8017,15 @@ std::string NMD::LBX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LD_GP_(uint64 instruction)
+static char *LD_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("LD %s, %s($%d)", rt, u, 28);
+    return img_format("LD %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -8303,17 +8039,17 @@ std::string NMD::LD_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LD_S9_(uint64 instruction)
+static char *LD_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LD %s, %s(%s)", rt, s, rs);
+    return img_format("LD %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8327,17 +8063,17 @@ std::string NMD::LD_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LD_U12_(uint64 instruction)
+static char *LD_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LD %s, %s(%s)", rt, u, rs);
+    return img_format("LD %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -8351,15 +8087,15 @@ std::string NMD::LD_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1_GP_(uint64 instruction)
+static char *LDC1_GP_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("LDC1 %s, %s($%d)", ft, u, 28);
+    return img_format("LDC1 %s, %s($%d)", ft, u, 28);
 }
 
 
@@ -8373,17 +8109,17 @@ std::string NMD::LDC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1_S9_(uint64 instruction)
+static char *LDC1_S9_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LDC1 %s, %s(%s)", ft, s, rs);
+    return img_format("LDC1 %s, %s(%s)", ft, s, rs);
 }
 
 
@@ -8397,17 +8133,17 @@ std::string NMD::LDC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1_U12_(uint64 instruction)
+static char *LDC1_U12_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LDC1 %s, %s(%s)", ft, u, rs);
+    return img_format("LDC1 %s, %s(%s)", ft, u, rs);
 }
 
 
@@ -8421,17 +8157,17 @@ std::string NMD::LDC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1XS(uint64 instruction)
+static char *LDC1XS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("LDC1XS %s, %s(%s)", ft, rs, rt);
+    return img_format("LDC1XS %s, %s(%s)", ft, rs, rt);
 }
 
 
@@ -8445,17 +8181,17 @@ std::string NMD::LDC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1X(uint64 instruction)
+static char *LDC1X(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("LDC1X %s, %s(%s)", ft, rs, rt);
+    return img_format("LDC1X %s, %s(%s)", ft, rs, rt);
 }
 
 
@@ -8469,17 +8205,17 @@ std::string NMD::LDC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC2(uint64 instruction)
+static char *LDC2(uint64 instruction)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ct = CPR(copy(ct_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ct = CPR(copy_ui(ct_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LDC2 %s, %s(%s)", ct, s, rs);
+    return img_format("LDC2 %s, %s(%s)", ct, s, rs);
 }
 
 
@@ -8493,19 +8229,19 @@ std::string NMD::LDC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDM(uint64 instruction)
+static char *LDM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *count3 = IMMEDIATE_UI(encode_count3_from_count(count3_value));
 
-    return img::format("LDM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("LDM %s, %s(%s), %s", rt, s, rs, count3);
 }
 
 
@@ -8519,15 +8255,15 @@ std::string NMD::LDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDPC_48_(uint64 instruction)
+static char *LDPC_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
-    return img::format("LDPC %s, %s", rt, s);
+    return img_format("LDPC %s, %s", rt, s);
 }
 
 
@@ -8541,17 +8277,17 @@ std::string NMD::LDPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDX(uint64 instruction)
+static char *LDX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("LDX %s, %s(%s)", rd, rs, rt);
+    return img_format("LDX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -8565,17 +8301,17 @@ std::string NMD::LDX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDXS(uint64 instruction)
+static char *LDXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("LDXS %s, %s(%s)", rd, rs, rt);
+    return img_format("LDXS %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -8589,17 +8325,17 @@ std::string NMD::LDXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_16_(uint64 instruction)
+static char *LH_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1__s1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("LH %s, %s(%s)", rt3, u, rs3);
+    return img_format("LH %s, %s(%s)", rt3, u, rs3);
 }
 
 
@@ -8613,15 +8349,15 @@ std::string NMD::LH_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_GP_(uint64 instruction)
+static char *LH_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("LH %s, %s($%d)", rt, u, 28);
+    return img_format("LH %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -8635,17 +8371,17 @@ std::string NMD::LH_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_S9_(uint64 instruction)
+static char *LH_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LH %s, %s(%s)", rt, s, rs);
+    return img_format("LH %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8659,17 +8395,17 @@ std::string NMD::LH_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_U12_(uint64 instruction)
+static char *LH_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LH %s, %s(%s)", rt, u, rs);
+    return img_format("LH %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -8683,17 +8419,17 @@ std::string NMD::LH_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHE(uint64 instruction)
+static char *LHE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LHE %s, %s(%s)", rt, s, rs);
+    return img_format("LHE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8707,17 +8443,17 @@ std::string NMD::LHE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_16_(uint64 instruction)
+static char *LHU_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1__s1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("LHU %s, %s(%s)", rt3, u, rs3);
+    return img_format("LHU %s, %s(%s)", rt3, u, rs3);
 }
 
 
@@ -8731,15 +8467,15 @@ std::string NMD::LHU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_GP_(uint64 instruction)
+static char *LHU_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("LHU %s, %s($%d)", rt, u, 28);
+    return img_format("LHU %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -8753,17 +8489,17 @@ std::string NMD::LHU_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_S9_(uint64 instruction)
+static char *LHU_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LHU %s, %s(%s)", rt, s, rs);
+    return img_format("LHU %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8777,17 +8513,17 @@ std::string NMD::LHU_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_U12_(uint64 instruction)
+static char *LHU_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LHU %s, %s(%s)", rt, u, rs);
+    return img_format("LHU %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -8801,17 +8537,17 @@ std::string NMD::LHU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHUE(uint64 instruction)
+static char *LHUE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LHUE %s, %s(%s)", rt, s, rs);
+    return img_format("LHUE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8825,17 +8561,17 @@ std::string NMD::LHUE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHUX(uint64 instruction)
+static char *LHUX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("LHUX %s, %s(%s)", rd, rs, rt);
+    return img_format("LHUX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -8849,17 +8585,17 @@ std::string NMD::LHUX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHUXS(uint64 instruction)
+static char *LHUXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("LHUXS %s, %s(%s)", rd, rs, rt);
+    return img_format("LHUXS %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -8873,17 +8609,17 @@ std::string NMD::LHUXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHXS(uint64 instruction)
+static char *LHXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("LHXS %s, %s(%s)", rd, rs, rt);
+    return img_format("LHXS %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -8897,17 +8633,17 @@ std::string NMD::LHXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHX(uint64 instruction)
+static char *LHX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("LHX %s, %s(%s)", rd, rs, rt);
+    return img_format("LHX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -8921,15 +8657,15 @@ std::string NMD::LHX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LI_16_(uint64 instruction)
+static char *LI_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 eu_value = extract_eu_6_5_4_3_2_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string eu = IMMEDIATE(encode_eu_from_s_li16(eu_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *eu = IMMEDIATE_I(encode_eu_from_s_li16(eu_value));
 
-    return img::format("LI %s, %s", rt3, eu);
+    return img_format("LI %s, %s", rt3, eu);
 }
 
 
@@ -8943,15 +8679,15 @@ std::string NMD::LI_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LI_48_(uint64 instruction)
+static char *LI_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
 
-    return img::format("LI %s, %s", rt, s);
+    return img_format("LI %s, %s", rt, s);
 }
 
 
@@ -8965,17 +8701,17 @@ std::string NMD::LI_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LL(uint64 instruction)
+static char *LL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LL %s, %s(%s)", rt, s, rs);
+    return img_format("LL %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8989,17 +8725,17 @@ std::string NMD::LL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLD(uint64 instruction)
+static char *LLD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LLD %s, %s(%s)", rt, s, rs);
+    return img_format("LLD %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -9013,17 +8749,17 @@ std::string NMD::LLD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLDP(uint64 instruction)
+static char *LLDP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ru = GPR(copy_ui(ru_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LLDP %s, %s, (%s)", rt, ru, rs);
+    return img_format("LLDP %s, %s, (%s)", rt, ru, rs);
 }
 
 
@@ -9037,17 +8773,17 @@ std::string NMD::LLDP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLE(uint64 instruction)
+static char *LLE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LLE %s, %s(%s)", rt, s, rs);
+    return img_format("LLE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -9061,17 +8797,17 @@ std::string NMD::LLE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLWP(uint64 instruction)
+static char *LLWP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ru = GPR(copy_ui(ru_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LLWP %s, %s, (%s)", rt, ru, rs);
+    return img_format("LLWP %s, %s, (%s)", rt, ru, rs);
 }
 
 
@@ -9085,17 +8821,17 @@ std::string NMD::LLWP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLWPE(uint64 instruction)
+static char *LLWPE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ru = GPR(copy_ui(ru_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LLWPE %s, %s, (%s)", rt, ru, rs);
+    return img_format("LLWPE %s, %s, (%s)", rt, ru, rs);
 }
 
 
@@ -9109,19 +8845,19 @@ std::string NMD::LLWPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LSA(uint64 instruction)
+static char *LSA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 u2_value = extract_u2_10_9(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string u2 = IMMEDIATE(copy(u2_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u2 = IMMEDIATE_UI(copy_ui(u2_value));
 
-    return img::format("LSA %s, %s, %s, %s", rd, rs, rt, u2);
+    return img_format("LSA %s, %s, %s, %s", rd, rs, rt, u2);
 }
 
 
@@ -9135,15 +8871,15 @@ std::string NMD::LSA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LUI(uint64 instruction)
+static char *LUI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
 
-    return img::format("LUI %s, %%hi(%s)", rt, s);
+    return img_format("LUI %s, %%hi(%s)", rt, s);
 }
 
 
@@ -9157,17 +8893,17 @@ std::string NMD::LUI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_16_(uint64 instruction)
+static char *LW_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("LW %s, %s(%s)", rt3, u, rs3);
+    return img_format("LW %s, %s(%s)", rt3, u, rs3);
 }
 
 
@@ -9181,17 +8917,17 @@ std::string NMD::LW_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_4X4_(uint64 instruction)
+static char *LW_4X4_(uint64 instruction)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
     uint64 u_value = extract_u_3_8__s2(instruction);
 
-    std::string rt4 = GPR(decode_gpr_gpr4(rt4_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
-    return img::format("LW %s, %s(%s)", rt4, u, rs4);
+    return img_format("LW %s, %s(%s)", rt4, u, rs4);
 }
 
 
@@ -9205,15 +8941,15 @@ std::string NMD::LW_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_GP_(uint64 instruction)
+static char *LW_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("LW %s, %s($%d)", rt, u, 28);
+    return img_format("LW %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -9227,15 +8963,15 @@ std::string NMD::LW_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_GP16_(uint64 instruction)
+static char *LW_GP16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("LW %s, %s($%d)", rt3, u, 28);
+    return img_format("LW %s, %s($%d)", rt3, u, 28);
 }
 
 
@@ -9249,17 +8985,17 @@ std::string NMD::LW_GP16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_S9_(uint64 instruction)
+static char *LW_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LW %s, %s(%s)", rt, s, rs);
+    return img_format("LW %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -9273,15 +9009,15 @@ std::string NMD::LW_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_SP_(uint64 instruction)
+static char *LW_SP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("LW %s, %s($%d)", rt, u, 29);
+    return img_format("LW %s, %s($%d)", rt, u, 29);
 }
 
 
@@ -9295,17 +9031,17 @@ std::string NMD::LW_SP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_U12_(uint64 instruction)
+static char *LW_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LW %s, %s(%s)", rt, u, rs);
+    return img_format("LW %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -9319,15 +9055,15 @@ std::string NMD::LW_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1_GP_(uint64 instruction)
+static char *LWC1_GP_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("LWC1 %s, %s($%d)", ft, u, 28);
+    return img_format("LWC1 %s, %s($%d)", ft, u, 28);
 }
 
 
@@ -9341,17 +9077,17 @@ std::string NMD::LWC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1_S9_(uint64 instruction)
+static char *LWC1_S9_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LWC1 %s, %s(%s)", ft, s, rs);
+    return img_format("LWC1 %s, %s(%s)", ft, s, rs);
 }
 
 
@@ -9365,17 +9101,17 @@ std::string NMD::LWC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1_U12_(uint64 instruction)
+static char *LWC1_U12_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LWC1 %s, %s(%s)", ft, u, rs);
+    return img_format("LWC1 %s, %s(%s)", ft, u, rs);
 }
 
 
@@ -9389,17 +9125,17 @@ std::string NMD::LWC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1X(uint64 instruction)
+static char *LWC1X(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("LWC1X %s, %s(%s)", ft, rs, rt);
+    return img_format("LWC1X %s, %s(%s)", ft, rs, rt);
 }
 
 
@@ -9413,17 +9149,17 @@ std::string NMD::LWC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1XS(uint64 instruction)
+static char *LWC1XS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("LWC1XS %s, %s(%s)", ft, rs, rt);
+    return img_format("LWC1XS %s, %s(%s)", ft, rs, rt);
 }
 
 
@@ -9437,17 +9173,17 @@ std::string NMD::LWC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC2(uint64 instruction)
+static char *LWC2(uint64 instruction)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ct = CPR(copy(ct_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ct = CPR(copy_ui(ct_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LWC2 %s, %s(%s)", ct, s, rs);
+    return img_format("LWC2 %s, %s(%s)", ct, s, rs);
 }
 
 
@@ -9461,17 +9197,17 @@ std::string NMD::LWC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWE(uint64 instruction)
+static char *LWE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LWE %s, %s(%s)", rt, s, rs);
+    return img_format("LWE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -9485,19 +9221,19 @@ std::string NMD::LWE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWM(uint64 instruction)
+static char *LWM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *count3 = IMMEDIATE_UI(encode_count3_from_count(count3_value));
 
-    return img::format("LWM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("LWM %s, %s(%s), %s", rt, s, rs, count3);
 }
 
 
@@ -9511,15 +9247,15 @@ std::string NMD::LWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWPC_48_(uint64 instruction)
+static char *LWPC_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
-    return img::format("LWPC %s, %s", rt, s);
+    return img_format("LWPC %s, %s", rt, s);
 }
 
 
@@ -9533,15 +9269,15 @@ std::string NMD::LWPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWU_GP_(uint64 instruction)
+static char *LWU_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("LWU %s, %s($%d)", rt, u, 28);
+    return img_format("LWU %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -9555,17 +9291,17 @@ std::string NMD::LWU_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWU_S9_(uint64 instruction)
+static char *LWU_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LWU %s, %s(%s)", rt, s, rs);
+    return img_format("LWU %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -9579,17 +9315,17 @@ std::string NMD::LWU_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWU_U12_(uint64 instruction)
+static char *LWU_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("LWU %s, %s(%s)", rt, u, rs);
+    return img_format("LWU %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -9603,17 +9339,17 @@ std::string NMD::LWU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWUX(uint64 instruction)
+static char *LWUX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("LWUX %s, %s(%s)", rd, rs, rt);
+    return img_format("LWUX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -9627,17 +9363,17 @@ std::string NMD::LWUX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWUXS(uint64 instruction)
+static char *LWUXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("LWUXS %s, %s(%s)", rd, rs, rt);
+    return img_format("LWUXS %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -9651,17 +9387,17 @@ std::string NMD::LWUXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWX(uint64 instruction)
+static char *LWX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("LWX %s, %s(%s)", rd, rs, rt);
+    return img_format("LWX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -9675,17 +9411,17 @@ std::string NMD::LWX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWXS_16_(uint64 instruction)
+static char *LWXS_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 rd3_value = extract_rd3_3_2_1(instruction);
 
-    std::string rd3 = GPR(decode_gpr_gpr3(rd3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rt3 = IMMEDIATE(decode_gpr_gpr3(rt3_value));
+    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = IMMEDIATE_UI(decode_gpr_gpr3(rt3_value));
 
-    return img::format("LWXS %s, %s(%s)", rd3, rs3, rt3);
+    return img_format("LWXS %s, %s(%s)", rd3, rs3, rt3);
 }
 
 
@@ -9699,17 +9435,17 @@ std::string NMD::LWXS_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWXS_32_(uint64 instruction)
+static char *LWXS_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("LWXS %s, %s(%s)", rd, rs, rt);
+    return img_format("LWXS %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -9724,17 +9460,17 @@ std::string NMD::LWXS_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADD_DSP_(uint64 instruction)
+static char *MADD_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MADD %s, %s, %s", ac, rs, rt);
+    return img_format("MADD %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -9748,17 +9484,17 @@ std::string NMD::MADD_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADDF_D(uint64 instruction)
+static char *MADDF_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("MADDF.D %s, %s, %s", fd, fs, ft);
+    return img_format("MADDF.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -9772,17 +9508,17 @@ std::string NMD::MADDF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADDF_S(uint64 instruction)
+static char *MADDF_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("MADDF.S %s, %s, %s", fd, fs, ft);
+    return img_format("MADDF.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -9797,17 +9533,17 @@ std::string NMD::MADDF_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADDU_DSP_(uint64 instruction)
+static char *MADDU_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MADDU %s, %s, %s", ac, rs, rt);
+    return img_format("MADDU %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -9822,17 +9558,17 @@ std::string NMD::MADDU_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_S_W_PHL(uint64 instruction)
+static char *MAQ_S_W_PHL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MAQ_S.W.PHL %s, %s, %s", ac, rs, rt);
+    return img_format("MAQ_S.W.PHL %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -9847,17 +9583,17 @@ std::string NMD::MAQ_S_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_S_W_PHR(uint64 instruction)
+static char *MAQ_S_W_PHR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MAQ_S.W.PHR %s, %s, %s", ac, rs, rt);
+    return img_format("MAQ_S.W.PHR %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -9872,17 +9608,17 @@ std::string NMD::MAQ_S_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_SA_W_PHL(uint64 instruction)
+static char *MAQ_SA_W_PHL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MAQ_SA.W.PHL %s, %s, %s", ac, rs, rt);
+    return img_format("MAQ_SA.W.PHL %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -9897,17 +9633,17 @@ std::string NMD::MAQ_SA_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_SA_W_PHR(uint64 instruction)
+static char *MAQ_SA_W_PHR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MAQ_SA.W.PHR %s, %s, %s", ac, rs, rt);
+    return img_format("MAQ_SA.W.PHR %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -9921,17 +9657,17 @@ std::string NMD::MAQ_SA_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAX_D(uint64 instruction)
+static char *MAX_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("MAX.D %s, %s, %s", fd, fs, ft);
+    return img_format("MAX.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -9945,17 +9681,17 @@ std::string NMD::MAX_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAX_S(uint64 instruction)
+static char *MAX_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("MAX.S %s, %s, %s", fd, fs, ft);
+    return img_format("MAX.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -9969,17 +9705,17 @@ std::string NMD::MAX_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAXA_D(uint64 instruction)
+static char *MAXA_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("MAXA.D %s, %s, %s", fd, fs, ft);
+    return img_format("MAXA.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -9993,17 +9729,17 @@ std::string NMD::MAXA_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAXA_S(uint64 instruction)
+static char *MAXA_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("MAXA.S %s, %s, %s", fd, fs, ft);
+    return img_format("MAXA.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -10017,17 +9753,17 @@ std::string NMD::MAXA_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFC0(uint64 instruction)
+static char *MFC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
-    return img::format("MFC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MFC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -10041,15 +9777,15 @@ std::string NMD::MFC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFC1(uint64 instruction)
+static char *MFC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("MFC1 %s, %s", rt, fs);
+    return img_format("MFC1 %s, %s", rt, fs);
 }
 
 
@@ -10063,15 +9799,15 @@ std::string NMD::MFC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFC2(uint64 instruction)
+static char *MFC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
-    return img::format("MFC2 %s, %s", rt, cs);
+    return img_format("MFC2 %s, %s", rt, cs);
 }
 
 
@@ -10085,17 +9821,17 @@ std::string NMD::MFC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFGC0(uint64 instruction)
+static char *MFGC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
-    return img::format("MFGC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MFGC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -10109,17 +9845,17 @@ std::string NMD::MFGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHC0(uint64 instruction)
+static char *MFHC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
-    return img::format("MFHC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MFHC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -10133,15 +9869,15 @@ std::string NMD::MFHC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHC1(uint64 instruction)
+static char *MFHC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("MFHC1 %s, %s", rt, fs);
+    return img_format("MFHC1 %s, %s", rt, fs);
 }
 
 
@@ -10155,15 +9891,15 @@ std::string NMD::MFHC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHC2(uint64 instruction)
+static char *MFHC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
-    return img::format("MFHC2 %s, %s", rt, cs);
+    return img_format("MFHC2 %s, %s", rt, cs);
 }
 
 
@@ -10177,17 +9913,17 @@ std::string NMD::MFHC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHGC0(uint64 instruction)
+static char *MFHGC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
-    return img::format("MFHGC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MFHGC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -10200,15 +9936,15 @@ std::string NMD::MFHGC0(uint64 instruction)
  *     rt -----
  *               ac --
  */
-std::string NMD::MFHI_DSP_(uint64 instruction)
+static char *MFHI_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
 
-    return img::format("MFHI %s, %s", rt, ac);
+    return img_format("MFHI %s, %s", rt, ac);
 }
 
 
@@ -10222,19 +9958,19 @@ std::string NMD::MFHI_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHTR(uint64 instruction)
+static char *MFHTR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = IMMEDIATE(copy(c0s_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = IMMEDIATE_UI(copy_ui(c0s_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
-    return img::format("MFHTR %s, %s, %s, %s", rt, c0s, u, sel);
+    return img_format("MFHTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
 
 
@@ -10247,15 +9983,15 @@ std::string NMD::MFHTR(uint64 instruction)
  *     rt -----
  *               ac --
  */
-std::string NMD::MFLO_DSP_(uint64 instruction)
+static char *MFLO_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
 
-    return img::format("MFLO %s, %s", rt, ac);
+    return img_format("MFLO %s, %s", rt, ac);
 }
 
 
@@ -10269,19 +10005,19 @@ std::string NMD::MFLO_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFTR(uint64 instruction)
+static char *MFTR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = IMMEDIATE(copy(c0s_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = IMMEDIATE_UI(copy_ui(c0s_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
-    return img::format("MFTR %s, %s, %s, %s", rt, c0s, u, sel);
+    return img_format("MFTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
 
 
@@ -10295,17 +10031,17 @@ std::string NMD::MFTR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MIN_D(uint64 instruction)
+static char *MIN_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("MIN.D %s, %s, %s", fd, fs, ft);
+    return img_format("MIN.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -10319,17 +10055,17 @@ std::string NMD::MIN_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MIN_S(uint64 instruction)
+static char *MIN_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("MIN.S %s, %s, %s", fd, fs, ft);
+    return img_format("MIN.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -10343,17 +10079,17 @@ std::string NMD::MIN_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MINA_D(uint64 instruction)
+static char *MINA_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("MINA.D %s, %s, %s", fd, fs, ft);
+    return img_format("MINA.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -10367,17 +10103,17 @@ std::string NMD::MINA_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MINA_S(uint64 instruction)
+static char *MINA_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("MINA.S %s, %s, %s", fd, fs, ft);
+    return img_format("MINA.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -10391,17 +10127,17 @@ std::string NMD::MINA_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOD(uint64 instruction)
+static char *MOD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MOD %s, %s, %s", rd, rs, rt);
+    return img_format("MOD %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -10415,17 +10151,17 @@ std::string NMD::MOD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MODSUB(uint64 instruction)
+static char *MODSUB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MODSUB %s, %s, %s", rd, rs, rt);
+    return img_format("MODSUB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -10439,17 +10175,17 @@ std::string NMD::MODSUB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MODU(uint64 instruction)
+static char *MODU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MODU %s, %s, %s", rd, rs, rt);
+    return img_format("MODU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -10463,15 +10199,15 @@ std::string NMD::MODU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOV_D(uint64 instruction)
+static char *MOV_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("MOV.D %s, %s", ft, fs);
+    return img_format("MOV.D %s, %s", ft, fs);
 }
 
 
@@ -10485,15 +10221,15 @@ std::string NMD::MOV_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOV_S(uint64 instruction)
+static char *MOV_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("MOV.S %s, %s", ft, fs);
+    return img_format("MOV.S %s, %s", ft, fs);
 }
 
 
@@ -10507,17 +10243,17 @@ std::string NMD::MOV_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVE_BALC(uint64 instruction)
+static char *MOVE_BALC(uint64 instruction)
 {
     uint64 rtz4_value = extract_rtz4_27_26_25_23_22_21(instruction);
     uint64 rd1_value = extract_rdl_25_24(instruction);
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
-    std::string rd1 = GPR(decode_gpr_gpr1(rd1_value));
-    std::string rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rd1 = GPR(decode_gpr_gpr1(rd1_value));
+    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("MOVE.BALC %s, %s, %s", rd1, rtz4, s);
+    return img_format("MOVE.BALC %s, %s, %s", rd1, rtz4, s);
 }
 
 
@@ -10531,19 +10267,19 @@ std::string NMD::MOVE_BALC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVEP(uint64 instruction)
+static char *MOVEP(uint64 instruction)
 {
     uint64 rtz4_value = extract_rtz4_9_7_6_5(instruction);
     uint64 rd2_value = extract_rd2_3_8(instruction);
     uint64 rsz4_value = extract_rsz4_4_2_1_0(instruction);
 
-    std::string rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
-    std::string re2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
+    const char *rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
+    const char *re2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
     /* !!!!!!!!!! - no conversion function */
-    std::string rsz4 = GPR(decode_gpr_gpr4_zero(rsz4_value));
-    std::string rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
+    const char *rsz4 = GPR(decode_gpr_gpr4_zero(rsz4_value));
+    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
 
-    return img::format("MOVEP %s, %s, %s, %s", rd2, re2, rsz4, rtz4);
+    return img_format("MOVEP %s, %s, %s, %s", rd2, re2, rsz4, rtz4);
     /* hand edited */
 }
 
@@ -10558,19 +10294,19 @@ std::string NMD::MOVEP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVEP_REV_(uint64 instruction)
+static char *MOVEP_REV_(uint64 instruction)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rd2_value = extract_rd2_3_8(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
 
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
-    std::string rt4 = GPR(decode_gpr_gpr4(rt4_value));
-    std::string rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
-    std::string rs2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    const char *rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
+    const char *rs2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
     /* !!!!!!!!!! - no conversion function */
 
-    return img::format("MOVEP %s, %s, %s, %s", rs4, rt4, rd2, rs2);
+    return img_format("MOVEP %s, %s, %s, %s", rs4, rt4, rd2, rs2);
     /* hand edited */
 }
 
@@ -10585,15 +10321,15 @@ std::string NMD::MOVEP_REV_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVE(uint64 instruction)
+static char *MOVE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 rs_value = extract_rs_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("MOVE %s, %s", rt, rs);
+    return img_format("MOVE %s, %s", rt, rs);
 }
 
 
@@ -10607,17 +10343,17 @@ std::string NMD::MOVE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVN(uint64 instruction)
+static char *MOVN(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MOVN %s, %s, %s", rd, rs, rt);
+    return img_format("MOVN %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -10631,17 +10367,17 @@ std::string NMD::MOVN(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVZ(uint64 instruction)
+static char *MOVZ(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MOVZ %s, %s, %s", rd, rs, rt);
+    return img_format("MOVZ %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -10655,17 +10391,17 @@ std::string NMD::MOVZ(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MSUB_DSP_(uint64 instruction)
+static char *MSUB_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MSUB %s, %s, %s", ac, rs, rt);
+    return img_format("MSUB %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -10679,17 +10415,17 @@ std::string NMD::MSUB_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MSUBF_D(uint64 instruction)
+static char *MSUBF_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("MSUBF.D %s, %s, %s", fd, fs, ft);
+    return img_format("MSUBF.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -10703,17 +10439,17 @@ std::string NMD::MSUBF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MSUBF_S(uint64 instruction)
+static char *MSUBF_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("MSUBF.S %s, %s, %s", fd, fs, ft);
+    return img_format("MSUBF.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -10727,17 +10463,17 @@ std::string NMD::MSUBF_S(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MSUBU_DSP_(uint64 instruction)
+static char *MSUBU_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MSUBU %s, %s, %s", ac, rs, rt);
+    return img_format("MSUBU %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -10751,17 +10487,17 @@ std::string NMD::MSUBU_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTC0(uint64 instruction)
+static char *MTC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
-    return img::format("MTC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MTC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -10775,15 +10511,15 @@ std::string NMD::MTC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTC1(uint64 instruction)
+static char *MTC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("MTC1 %s, %s", rt, fs);
+    return img_format("MTC1 %s, %s", rt, fs);
 }
 
 
@@ -10797,15 +10533,15 @@ std::string NMD::MTC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTC2(uint64 instruction)
+static char *MTC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
-    return img::format("MTC2 %s, %s", rt, cs);
+    return img_format("MTC2 %s, %s", rt, cs);
 }
 
 
@@ -10819,17 +10555,17 @@ std::string NMD::MTC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTGC0(uint64 instruction)
+static char *MTGC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
-    return img::format("MTGC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MTGC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -10843,17 +10579,17 @@ std::string NMD::MTGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHC0(uint64 instruction)
+static char *MTHC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
-    return img::format("MTHC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MTHC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -10867,15 +10603,15 @@ std::string NMD::MTHC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHC1(uint64 instruction)
+static char *MTHC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("MTHC1 %s, %s", rt, fs);
+    return img_format("MTHC1 %s, %s", rt, fs);
 }
 
 
@@ -10889,15 +10625,15 @@ std::string NMD::MTHC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHC2(uint64 instruction)
+static char *MTHC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
-    return img::format("MTHC2 %s, %s", rt, cs);
+    return img_format("MTHC2 %s, %s", rt, cs);
 }
 
 
@@ -10911,17 +10647,17 @@ std::string NMD::MTHC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHGC0(uint64 instruction)
+static char *MTHGC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
-    return img::format("MTHGC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MTHGC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -10934,15 +10670,15 @@ std::string NMD::MTHGC0(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MTHI_DSP_(uint64 instruction)
+static char *MTHI_DSP_(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string ac = AC(copy(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *ac = AC(copy_ui(ac_value));
 
-    return img::format("MTHI %s, %s", rs, ac);
+    return img_format("MTHI %s, %s", rs, ac);
 }
 
 
@@ -10955,15 +10691,15 @@ std::string NMD::MTHI_DSP_(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MTHLIP(uint64 instruction)
+static char *MTHLIP(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string ac = AC(copy(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *ac = AC(copy_ui(ac_value));
 
-    return img::format("MTHLIP %s, %s", rs, ac);
+    return img_format("MTHLIP %s, %s", rs, ac);
 }
 
 
@@ -10977,19 +10713,19 @@ std::string NMD::MTHLIP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHTR(uint64 instruction)
+static char *MTHTR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = IMMEDIATE(copy(c0s_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = IMMEDIATE_UI(copy_ui(c0s_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
-    return img::format("MTHTR %s, %s, %s, %s", rt, c0s, u, sel);
+    return img_format("MTHTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
 
 
@@ -11002,15 +10738,15 @@ std::string NMD::MTHTR(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MTLO_DSP_(uint64 instruction)
+static char *MTLO_DSP_(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string ac = AC(copy(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *ac = AC(copy_ui(ac_value));
 
-    return img::format("MTLO %s, %s", rs, ac);
+    return img_format("MTLO %s, %s", rs, ac);
 }
 
 
@@ -11024,19 +10760,19 @@ std::string NMD::MTLO_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTTR(uint64 instruction)
+static char *MTTR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = IMMEDIATE(copy(c0s_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = IMMEDIATE_UI(copy_ui(c0s_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
-    return img::format("MTTR %s, %s, %s, %s", rt, c0s, u, sel);
+    return img_format("MTTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
 
 
@@ -11050,17 +10786,17 @@ std::string NMD::MTTR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUH(uint64 instruction)
+static char *MUH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MUH %s, %s, %s", rd, rs, rt);
+    return img_format("MUH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11074,17 +10810,17 @@ std::string NMD::MUH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUHU(uint64 instruction)
+static char *MUHU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MUHU %s, %s, %s", rd, rs, rt);
+    return img_format("MUHU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11098,17 +10834,17 @@ std::string NMD::MUHU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_32_(uint64 instruction)
+static char *MUL_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MUL %s, %s, %s", rd, rs, rt);
+    return img_format("MUL %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11122,15 +10858,15 @@ std::string NMD::MUL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_4X4_(uint64 instruction)
+static char *MUL_4X4_(uint64 instruction)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
 
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
-    std::string rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
 
-    return img::format("MUL %s, %s", rs4, rt4);
+    return img_format("MUL %s, %s", rs4, rt4);
 }
 
 
@@ -11144,17 +10880,17 @@ std::string NMD::MUL_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_D(uint64 instruction)
+static char *MUL_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("MUL.D %s, %s, %s", fd, fs, ft);
+    return img_format("MUL.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -11169,17 +10905,17 @@ std::string NMD::MUL_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_PH(uint64 instruction)
+static char *MUL_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MUL.PH %s, %s, %s", rd, rs, rt);
+    return img_format("MUL.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11194,17 +10930,17 @@ std::string NMD::MUL_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_S_PH(uint64 instruction)
+static char *MUL_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MUL_S.PH %s, %s, %s", rd, rs, rt);
+    return img_format("MUL_S.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11218,17 +10954,17 @@ std::string NMD::MUL_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_S(uint64 instruction)
+static char *MUL_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("MUL.S %s, %s, %s", fd, fs, ft);
+    return img_format("MUL.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -11243,17 +10979,17 @@ std::string NMD::MUL_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEQ_S_W_PHL(uint64 instruction)
+static char *MULEQ_S_W_PHL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MULEQ_S.W.PHL %s, %s, %s", rd, rs, rt);
+    return img_format("MULEQ_S.W.PHL %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11268,17 +11004,17 @@ std::string NMD::MULEQ_S_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEQ_S_W_PHR(uint64 instruction)
+static char *MULEQ_S_W_PHR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MULEQ_S.W.PHR %s, %s, %s", rd, rs, rt);
+    return img_format("MULEQ_S.W.PHR %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11293,17 +11029,17 @@ std::string NMD::MULEQ_S_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEU_S_PH_QBL(uint64 instruction)
+static char *MULEU_S_PH_QBL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MULEU_S.PH.QBL %s, %s, %s", rd, rs, rt);
+    return img_format("MULEU_S.PH.QBL %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11318,17 +11054,17 @@ std::string NMD::MULEU_S_PH_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEU_S_PH_QBR(uint64 instruction)
+static char *MULEU_S_PH_QBR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MULEU_S.PH.QBR %s, %s, %s", rd, rs, rt);
+    return img_format("MULEU_S.PH.QBR %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11343,17 +11079,17 @@ std::string NMD::MULEU_S_PH_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_RS_PH(uint64 instruction)
+static char *MULQ_RS_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MULQ_RS.PH %s, %s, %s", rd, rs, rt);
+    return img_format("MULQ_RS.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11368,17 +11104,17 @@ std::string NMD::MULQ_RS_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_RS_W(uint64 instruction)
+static char *MULQ_RS_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MULQ_RS.W %s, %s, %s", rd, rs, rt);
+    return img_format("MULQ_RS.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11393,17 +11129,17 @@ std::string NMD::MULQ_RS_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_S_PH(uint64 instruction)
+static char *MULQ_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MULQ_S.PH %s, %s, %s", rd, rs, rt);
+    return img_format("MULQ_S.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11418,17 +11154,17 @@ std::string NMD::MULQ_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_S_W(uint64 instruction)
+static char *MULQ_S_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MULQ_S.W %s, %s, %s", rd, rs, rt);
+    return img_format("MULQ_S.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11443,17 +11179,17 @@ std::string NMD::MULQ_S_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULSA_W_PH(uint64 instruction)
+static char *MULSA_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MULSA.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("MULSA.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -11468,17 +11204,17 @@ std::string NMD::MULSA_W_PH(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULSAQ_S_W_PH(uint64 instruction)
+static char *MULSAQ_S_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MULSAQ_S.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("MULSAQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -11492,17 +11228,17 @@ std::string NMD::MULSAQ_S_W_PH(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULT_DSP_(uint64 instruction)
+static char *MULT_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MULT %s, %s, %s", ac, rs, rt);
+    return img_format("MULT %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -11516,17 +11252,17 @@ std::string NMD::MULT_DSP_(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULTU_DSP_(uint64 instruction)
+static char *MULTU_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MULTU %s, %s, %s", ac, rs, rt);
+    return img_format("MULTU %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -11540,17 +11276,17 @@ std::string NMD::MULTU_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULU(uint64 instruction)
+static char *MULU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("MULU %s, %s, %s", rd, rs, rt);
+    return img_format("MULU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11564,15 +11300,15 @@ std::string NMD::MULU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NEG_D(uint64 instruction)
+static char *NEG_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("NEG.D %s, %s", ft, fs);
+    return img_format("NEG.D %s, %s", ft, fs);
 }
 
 
@@ -11586,15 +11322,15 @@ std::string NMD::NEG_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NEG_S(uint64 instruction)
+static char *NEG_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("NEG.S %s, %s", ft, fs);
+    return img_format("NEG.S %s, %s", ft, fs);
 }
 
 
@@ -11608,11 +11344,11 @@ std::string NMD::NEG_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOP_16_(uint64 instruction)
+static char *NOP_16_(uint64 instruction)
 {
     (void)instruction;
 
-    return "NOP ";
+    return strdup("NOP ");
 }
 
 
@@ -11626,11 +11362,11 @@ std::string NMD::NOP_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOP_32_(uint64 instruction)
+static char *NOP_32_(uint64 instruction)
 {
     (void)instruction;
 
-    return "NOP ";
+    return strdup("NOP ");
 }
 
 
@@ -11644,17 +11380,17 @@ std::string NMD::NOP_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOR(uint64 instruction)
+static char *NOR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("NOR %s, %s, %s", rd, rs, rt);
+    return img_format("NOR %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11668,15 +11404,15 @@ std::string NMD::NOR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOT_16_(uint64 instruction)
+static char *NOT_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("NOT %s, %s", rt3, rs3);
+    return img_format("NOT %s, %s", rt3, rs3);
 }
 
 
@@ -11690,15 +11426,15 @@ std::string NMD::NOT_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::OR_16_(uint64 instruction)
+static char *OR_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
 
-    return img::format("OR %s, %s", rs3, rt3);
+    return img_format("OR %s, %s", rs3, rt3);
 }
 
 
@@ -11712,17 +11448,17 @@ std::string NMD::OR_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::OR_32_(uint64 instruction)
+static char *OR_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("OR %s, %s, %s", rd, rs, rt);
+    return img_format("OR %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11736,17 +11472,17 @@ std::string NMD::OR_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ORI(uint64 instruction)
+static char *ORI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("ORI %s, %s, %s", rt, rs, u);
+    return img_format("ORI %s, %s, %s", rt, rs, u);
 }
 
 
@@ -11761,17 +11497,17 @@ std::string NMD::ORI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PACKRL_PH(uint64 instruction)
+static char *PACKRL_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("PACKRL.PH %s, %s, %s", rd, rs, rt);
+    return img_format("PACKRL.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11785,11 +11521,11 @@ std::string NMD::PACKRL_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PAUSE(uint64 instruction)
+static char *PAUSE(uint64 instruction)
 {
     (void)instruction;
 
-    return "PAUSE ";
+    return strdup("PAUSE ");
 }
 
 
@@ -11804,17 +11540,17 @@ std::string NMD::PAUSE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PICK_PH(uint64 instruction)
+static char *PICK_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("PICK.PH %s, %s, %s", rd, rs, rt);
+    return img_format("PICK.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11829,17 +11565,17 @@ std::string NMD::PICK_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PICK_QB(uint64 instruction)
+static char *PICK_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("PICK.QB %s, %s, %s", rd, rs, rt);
+    return img_format("PICK.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11854,15 +11590,15 @@ std::string NMD::PICK_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQ_W_PHL(uint64 instruction)
+static char *PRECEQ_W_PHL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("PRECEQ.W.PHL %s, %s", rt, rs);
+    return img_format("PRECEQ.W.PHL %s, %s", rt, rs);
 }
 
 
@@ -11877,15 +11613,15 @@ std::string NMD::PRECEQ_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQ_W_PHR(uint64 instruction)
+static char *PRECEQ_W_PHR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("PRECEQ.W.PHR %s, %s", rt, rs);
+    return img_format("PRECEQ.W.PHR %s, %s", rt, rs);
 }
 
 
@@ -11900,15 +11636,15 @@ std::string NMD::PRECEQ_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBLA(uint64 instruction)
+static char *PRECEQU_PH_QBLA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("PRECEQU.PH.QBLA %s, %s", rt, rs);
+    return img_format("PRECEQU.PH.QBLA %s, %s", rt, rs);
 }
 
 
@@ -11923,15 +11659,15 @@ std::string NMD::PRECEQU_PH_QBLA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBL(uint64 instruction)
+static char *PRECEQU_PH_QBL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("PRECEQU.PH.QBL %s, %s", rt, rs);
+    return img_format("PRECEQU.PH.QBL %s, %s", rt, rs);
 }
 
 
@@ -11946,15 +11682,15 @@ std::string NMD::PRECEQU_PH_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBRA(uint64 instruction)
+static char *PRECEQU_PH_QBRA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("PRECEQU.PH.QBRA %s, %s", rt, rs);
+    return img_format("PRECEQU.PH.QBRA %s, %s", rt, rs);
 }
 
 
@@ -11969,15 +11705,15 @@ std::string NMD::PRECEQU_PH_QBRA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBR(uint64 instruction)
+static char *PRECEQU_PH_QBR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("PRECEQU.PH.QBR %s, %s", rt, rs);
+    return img_format("PRECEQU.PH.QBR %s, %s", rt, rs);
 }
 
 
@@ -11993,15 +11729,15 @@ std::string NMD::PRECEQU_PH_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBLA(uint64 instruction)
+static char *PRECEU_PH_QBLA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("PRECEU.PH.QBLA %s, %s", rt, rs);
+    return img_format("PRECEU.PH.QBLA %s, %s", rt, rs);
 }
 
 
@@ -12016,15 +11752,15 @@ std::string NMD::PRECEU_PH_QBLA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBL(uint64 instruction)
+static char *PRECEU_PH_QBL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("PRECEU.PH.QBL %s, %s", rt, rs);
+    return img_format("PRECEU.PH.QBL %s, %s", rt, rs);
 }
 
 
@@ -12040,15 +11776,15 @@ std::string NMD::PRECEU_PH_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBRA(uint64 instruction)
+static char *PRECEU_PH_QBRA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("PRECEU.PH.QBRA %s, %s", rt, rs);
+    return img_format("PRECEU.PH.QBRA %s, %s", rt, rs);
 }
 
 
@@ -12063,15 +11799,15 @@ std::string NMD::PRECEU_PH_QBRA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBR(uint64 instruction)
+static char *PRECEU_PH_QBR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("PRECEU.PH.QBR %s, %s", rt, rs);
+    return img_format("PRECEU.PH.QBR %s, %s", rt, rs);
 }
 
 
@@ -12086,17 +11822,17 @@ std::string NMD::PRECEU_PH_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECR_QB_PH(uint64 instruction)
+static char *PRECR_QB_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("PRECR.QB.PH %s, %s, %s", rd, rs, rt);
+    return img_format("PRECR.QB.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -12111,17 +11847,17 @@ std::string NMD::PRECR_QB_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECR_SRA_PH_W(uint64 instruction)
+static char *PRECR_SRA_PH_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
-    return img::format("PRECR_SRA.PH.W %s, %s, %s", rt, rs, sa);
+    return img_format("PRECR_SRA.PH.W %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -12136,17 +11872,17 @@ std::string NMD::PRECR_SRA_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECR_SRA_R_PH_W(uint64 instruction)
+static char *PRECR_SRA_R_PH_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
-    return img::format("PRECR_SRA_R.PH.W %s, %s, %s", rt, rs, sa);
+    return img_format("PRECR_SRA_R.PH.W %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -12161,17 +11897,17 @@ std::string NMD::PRECR_SRA_R_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQ_PH_W(uint64 instruction)
+static char *PRECRQ_PH_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("PRECRQ.PH.W %s, %s, %s", rd, rs, rt);
+    return img_format("PRECRQ.PH.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -12186,17 +11922,17 @@ std::string NMD::PRECRQ_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQ_QB_PH(uint64 instruction)
+static char *PRECRQ_QB_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("PRECRQ.QB.PH %s, %s, %s", rd, rs, rt);
+    return img_format("PRECRQ.QB.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -12211,17 +11947,17 @@ std::string NMD::PRECRQ_QB_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQ_RS_PH_W(uint64 instruction)
+static char *PRECRQ_RS_PH_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("PRECRQ_RS.PH.W %s, %s, %s", rd, rs, rt);
+    return img_format("PRECRQ_RS.PH.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -12236,17 +11972,17 @@ std::string NMD::PRECRQ_RS_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQU_S_QB_PH(uint64 instruction)
+static char *PRECRQU_S_QB_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("PRECRQU_S.QB.PH %s, %s, %s", rd, rs, rt);
+    return img_format("PRECRQU_S.QB.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -12260,17 +11996,17 @@ std::string NMD::PRECRQU_S_QB_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREF_S9_(uint64 instruction)
+static char *PREF_S9_(uint64 instruction)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string hint = IMMEDIATE(copy(hint_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *hint = IMMEDIATE_UI(copy_ui(hint_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("PREF %s, %s(%s)", hint, s, rs);
+    return img_format("PREF %s, %s(%s)", hint, s, rs);
 }
 
 
@@ -12284,17 +12020,17 @@ std::string NMD::PREF_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREF_U12_(uint64 instruction)
+static char *PREF_U12_(uint64 instruction)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string hint = IMMEDIATE(copy(hint_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *hint = IMMEDIATE_UI(copy_ui(hint_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("PREF %s, %s(%s)", hint, u, rs);
+    return img_format("PREF %s, %s(%s)", hint, u, rs);
 }
 
 
@@ -12308,17 +12044,17 @@ std::string NMD::PREF_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREFE(uint64 instruction)
+static char *PREFE(uint64 instruction)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string hint = IMMEDIATE(copy(hint_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *hint = IMMEDIATE_UI(copy_ui(hint_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("PREFE %s, %s(%s)", hint, s, rs);
+    return img_format("PREFE %s, %s(%s)", hint, s, rs);
 }
 
 
@@ -12332,17 +12068,17 @@ std::string NMD::PREFE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREPEND(uint64 instruction)
+static char *PREPEND(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
-    return img::format("PREPEND %s, %s, %s", rt, rs, sa);
+    return img_format("PREPEND %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -12355,15 +12091,15 @@ std::string NMD::PREPEND(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::RADDU_W_QB(uint64 instruction)
+static char *RADDU_W_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("RADDU.W.QB %s, %s", rt, rs);
+    return img_format("RADDU.W.QB %s, %s", rt, rs);
 }
 
 
@@ -12376,15 +12112,15 @@ std::string NMD::RADDU_W_QB(uint64 instruction)
  *     rt -----
  *        mask -------
  */
-std::string NMD::RDDSP(uint64 instruction)
+static char *RDDSP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string mask = IMMEDIATE(copy(mask_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *mask = IMMEDIATE_UI(copy_ui(mask_value));
 
-    return img::format("RDDSP %s, %s", rt, mask);
+    return img_format("RDDSP %s, %s", rt, mask);
 }
 
 
@@ -12398,17 +12134,17 @@ std::string NMD::RDDSP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RDHWR(uint64 instruction)
+static char *RDHWR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 hs_value = extract_hs_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string hs = CPR(copy(hs_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *hs = CPR(copy_ui(hs_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
-    return img::format("RDHWR %s, %s, %s", rt, hs, sel);
+    return img_format("RDHWR %s, %s, %s", rt, hs, sel);
 }
 
 
@@ -12422,15 +12158,15 @@ std::string NMD::RDHWR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RDPGPR(uint64 instruction)
+static char *RDPGPR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("RDPGPR %s, %s", rt, rs);
+    return img_format("RDPGPR %s, %s", rt, rs);
 }
 
 
@@ -12444,15 +12180,15 @@ std::string NMD::RDPGPR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RECIP_D(uint64 instruction)
+static char *RECIP_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("RECIP.D %s, %s", ft, fs);
+    return img_format("RECIP.D %s, %s", ft, fs);
 }
 
 
@@ -12466,15 +12202,15 @@ std::string NMD::RECIP_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RECIP_S(uint64 instruction)
+static char *RECIP_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("RECIP.S %s, %s", ft, fs);
+    return img_format("RECIP.S %s, %s", ft, fs);
 }
 
 
@@ -12488,15 +12224,15 @@ std::string NMD::RECIP_S(uint64 instruction)
  *     rt -----
  *           s ----------
  */
-std::string NMD::REPL_PH(uint64 instruction)
+static char *REPL_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se9_20_19_18_17_16_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
 
-    return img::format("REPL.PH %s, %s", rt, s);
+    return img_format("REPL.PH %s, %s", rt, s);
 }
 
 
@@ -12510,15 +12246,15 @@ std::string NMD::REPL_PH(uint64 instruction)
  *     rt -----
  *           u --------
  */
-std::string NMD::REPL_QB(uint64 instruction)
+static char *REPL_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_19_18_17_16_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("REPL.QB %s, %s", rt, u);
+    return img_format("REPL.QB %s, %s", rt, u);
 }
 
 
@@ -12532,15 +12268,15 @@ std::string NMD::REPL_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::REPLV_PH(uint64 instruction)
+static char *REPLV_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("REPLV.PH %s, %s", rt, rs);
+    return img_format("REPLV.PH %s, %s", rt, rs);
 }
 
 
@@ -12553,15 +12289,15 @@ std::string NMD::REPLV_PH(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::REPLV_QB(uint64 instruction)
+static char *REPLV_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("REPLV.QB %s, %s", rt, rs);
+    return img_format("REPLV.QB %s, %s", rt, rs);
 }
 
 
@@ -12575,15 +12311,15 @@ std::string NMD::REPLV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTORE_32_(uint64 instruction)
+static char *RESTORE_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
-    return img::format("RESTORE %s%s", u,
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    return img_format("RESTORE %s%s", u,
                save_restore_list(rt_value, count_value, gp_value));
 }
 
@@ -12598,14 +12334,14 @@ std::string NMD::RESTORE_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTORE_JRC_16_(uint64 instruction)
+static char *RESTORE_JRC_16_(uint64 instruction)
 {
     uint64 rt1_value = extract_rtl_11(instruction);
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
-    return img::format("RESTORE.JRC %s%s", u,
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    return img_format("RESTORE.JRC %s%s", u,
         save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
 }
 
@@ -12620,15 +12356,15 @@ std::string NMD::RESTORE_JRC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTORE_JRC_32_(uint64 instruction)
+static char *RESTORE_JRC_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
-    return img::format("RESTORE.JRC %s%s", u,
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    return img_format("RESTORE.JRC %s%s", u,
                save_restore_list(rt_value, count_value, gp_value));
 }
 
@@ -12643,15 +12379,15 @@ std::string NMD::RESTORE_JRC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTOREF(uint64 instruction)
+static char *RESTOREF(uint64 instruction)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string count = IMMEDIATE(copy(count_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *count = IMMEDIATE_UI(copy_ui(count_value));
 
-    return img::format("RESTOREF %s, %s", u, count);
+    return img_format("RESTOREF %s, %s", u, count);
 }
 
 
@@ -12665,15 +12401,15 @@ std::string NMD::RESTOREF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RINT_D(uint64 instruction)
+static char *RINT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("RINT.D %s, %s", ft, fs);
+    return img_format("RINT.D %s, %s", ft, fs);
 }
 
 
@@ -12687,15 +12423,15 @@ std::string NMD::RINT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RINT_S(uint64 instruction)
+static char *RINT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("RINT.S %s, %s", ft, fs);
+    return img_format("RINT.S %s, %s", ft, fs);
 }
 
 
@@ -12709,17 +12445,17 @@ std::string NMD::RINT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROTR(uint64 instruction)
+static char *ROTR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
-    return img::format("ROTR %s, %s, %s", rt, rs, shift);
+    return img_format("ROTR %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -12733,17 +12469,17 @@ std::string NMD::ROTR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROTRV(uint64 instruction)
+static char *ROTRV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("ROTRV %s, %s, %s", rd, rs, rt);
+    return img_format("ROTRV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -12757,7 +12493,7 @@ std::string NMD::ROTRV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROTX(uint64 instruction)
+static char *ROTX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12765,13 +12501,13 @@ std::string NMD::ROTX(uint64 instruction)
     uint64 stripe_value = extract_stripe_6(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
-    std::string shiftx = IMMEDIATE(copy(shiftx_value));
-    std::string stripe = IMMEDIATE(copy(stripe_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
+    const char *shiftx = IMMEDIATE_UI(copy_ui(shiftx_value));
+    const char *stripe = IMMEDIATE_UI(copy_ui(stripe_value));
 
-    return img::format("ROTX %s, %s, %s, %s, %s",
+    return img_format("ROTX %s, %s, %s, %s, %s",
                        rt, rs, shift, shiftx, stripe);
 }
 
@@ -12786,15 +12522,15 @@ std::string NMD::ROTX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_L_D(uint64 instruction)
+static char *ROUND_L_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("ROUND.L.D %s, %s", ft, fs);
+    return img_format("ROUND.L.D %s, %s", ft, fs);
 }
 
 
@@ -12808,15 +12544,15 @@ std::string NMD::ROUND_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_L_S(uint64 instruction)
+static char *ROUND_L_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("ROUND.L.S %s, %s", ft, fs);
+    return img_format("ROUND.L.S %s, %s", ft, fs);
 }
 
 
@@ -12830,15 +12566,15 @@ std::string NMD::ROUND_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_W_D(uint64 instruction)
+static char *ROUND_W_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("ROUND.W.D %s, %s", ft, fs);
+    return img_format("ROUND.W.D %s, %s", ft, fs);
 }
 
 
@@ -12852,15 +12588,15 @@ std::string NMD::ROUND_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_W_S(uint64 instruction)
+static char *ROUND_W_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("ROUND.W.S %s, %s", ft, fs);
+    return img_format("ROUND.W.S %s, %s", ft, fs);
 }
 
 
@@ -12874,15 +12610,15 @@ std::string NMD::ROUND_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RSQRT_D(uint64 instruction)
+static char *RSQRT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("RSQRT.D %s, %s", ft, fs);
+    return img_format("RSQRT.D %s, %s", ft, fs);
 }
 
 
@@ -12896,15 +12632,15 @@ std::string NMD::RSQRT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RSQRT_S(uint64 instruction)
+static char *RSQRT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("RSQRT.S %s, %s", ft, fs);
+    return img_format("RSQRT.S %s, %s", ft, fs);
 }
 
 
@@ -12918,14 +12654,14 @@ std::string NMD::RSQRT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SAVE_16_(uint64 instruction)
+static char *SAVE_16_(uint64 instruction)
 {
     uint64 rt1_value = extract_rtl_11(instruction);
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
-    return img::format("SAVE %s%s", u,
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    return img_format("SAVE %s%s", u,
         save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
 }
 
@@ -12940,15 +12676,15 @@ std::string NMD::SAVE_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SAVE_32_(uint64 instruction)
+static char *SAVE_32_(uint64 instruction)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
-    return img::format("SAVE %s%s", u,
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    return img_format("SAVE %s%s", u,
                save_restore_list(rt_value, count_value, gp_value));
 }
 
@@ -12963,15 +12699,15 @@ std::string NMD::SAVE_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SAVEF(uint64 instruction)
+static char *SAVEF(uint64 instruction)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string count = IMMEDIATE(copy(count_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *count = IMMEDIATE_UI(copy_ui(count_value));
 
-    return img::format("SAVEF %s, %s", u, count);
+    return img_format("SAVEF %s, %s", u, count);
 }
 
 
@@ -12985,17 +12721,17 @@ std::string NMD::SAVEF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_16_(uint64 instruction)
+static char *SB_16_(uint64 instruction)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_1_0(instruction);
 
-    std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("SB %s, %s(%s)", rtz3, u, rs3);
+    return img_format("SB %s, %s(%s)", rtz3, u, rs3);
 }
 
 
@@ -13009,15 +12745,15 @@ std::string NMD::SB_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_GP_(uint64 instruction)
+static char *SB_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("SB %s, %s($%d)", rt, u, 28);
+    return img_format("SB %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -13031,17 +12767,17 @@ std::string NMD::SB_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_S9_(uint64 instruction)
+static char *SB_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SB %s, %s(%s)", rt, s, rs);
+    return img_format("SB %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -13055,17 +12791,17 @@ std::string NMD::SB_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_U12_(uint64 instruction)
+static char *SB_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SB %s, %s(%s)", rt, u, rs);
+    return img_format("SB %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -13079,17 +12815,17 @@ std::string NMD::SB_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SBE(uint64 instruction)
+static char *SBE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SBE %s, %s(%s)", rt, s, rs);
+    return img_format("SBE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -13103,17 +12839,17 @@ std::string NMD::SBE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SBX(uint64 instruction)
+static char *SBX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SBX %s, %s(%s)", rd, rs, rt);
+    return img_format("SBX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -13127,17 +12863,17 @@ std::string NMD::SBX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SC(uint64 instruction)
+static char *SC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SC %s, %s(%s)", rt, s, rs);
+    return img_format("SC %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -13151,17 +12887,17 @@ std::string NMD::SC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCD(uint64 instruction)
+static char *SCD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SCD %s, %s(%s)", rt, s, rs);
+    return img_format("SCD %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -13175,17 +12911,17 @@ std::string NMD::SCD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCDP(uint64 instruction)
+static char *SCDP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ru = GPR(copy_ui(ru_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SCDP %s, %s, (%s)", rt, ru, rs);
+    return img_format("SCDP %s, %s, (%s)", rt, ru, rs);
 }
 
 
@@ -13199,17 +12935,17 @@ std::string NMD::SCDP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCE(uint64 instruction)
+static char *SCE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SCE %s, %s(%s)", rt, s, rs);
+    return img_format("SCE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -13223,17 +12959,17 @@ std::string NMD::SCE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCWP(uint64 instruction)
+static char *SCWP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ru = GPR(copy_ui(ru_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SCWP %s, %s, (%s)", rt, ru, rs);
+    return img_format("SCWP %s, %s, (%s)", rt, ru, rs);
 }
 
 
@@ -13247,17 +12983,17 @@ std::string NMD::SCWP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCWPE(uint64 instruction)
+static char *SCWPE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ru = GPR(copy_ui(ru_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SCWPE %s, %s, (%s)", rt, ru, rs);
+    return img_format("SCWPE %s, %s, (%s)", rt, ru, rs);
 }
 
 
@@ -13271,15 +13007,15 @@ std::string NMD::SCWPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SD_GP_(uint64 instruction)
+static char *SD_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("SD %s, %s($%d)", rt, u, 28);
+    return img_format("SD %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -13293,17 +13029,17 @@ std::string NMD::SD_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SD_S9_(uint64 instruction)
+static char *SD_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SD %s, %s(%s)", rt, s, rs);
+    return img_format("SD %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -13317,17 +13053,17 @@ std::string NMD::SD_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SD_U12_(uint64 instruction)
+static char *SD_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SD %s, %s(%s)", rt, u, rs);
+    return img_format("SD %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -13341,13 +13077,13 @@ std::string NMD::SD_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDBBP_16_(uint64 instruction)
+static char *SDBBP_16_(uint64 instruction)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
-    return img::format("SDBBP %s", code);
+    return img_format("SDBBP %s", code);
 }
 
 
@@ -13361,13 +13097,13 @@ std::string NMD::SDBBP_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDBBP_32_(uint64 instruction)
+static char *SDBBP_32_(uint64 instruction)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
-    return img::format("SDBBP %s", code);
+    return img_format("SDBBP %s", code);
 }
 
 
@@ -13381,15 +13117,15 @@ std::string NMD::SDBBP_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1_GP_(uint64 instruction)
+static char *SDC1_GP_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("SDC1 %s, %s($%d)", ft, u, 28);
+    return img_format("SDC1 %s, %s($%d)", ft, u, 28);
 }
 
 
@@ -13403,17 +13139,17 @@ std::string NMD::SDC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1_S9_(uint64 instruction)
+static char *SDC1_S9_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SDC1 %s, %s(%s)", ft, s, rs);
+    return img_format("SDC1 %s, %s(%s)", ft, s, rs);
 }
 
 
@@ -13427,17 +13163,17 @@ std::string NMD::SDC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1_U12_(uint64 instruction)
+static char *SDC1_U12_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SDC1 %s, %s(%s)", ft, u, rs);
+    return img_format("SDC1 %s, %s(%s)", ft, u, rs);
 }
 
 
@@ -13451,17 +13187,17 @@ std::string NMD::SDC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1X(uint64 instruction)
+static char *SDC1X(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SDC1X %s, %s(%s)", ft, rs, rt);
+    return img_format("SDC1X %s, %s(%s)", ft, rs, rt);
 }
 
 
@@ -13475,17 +13211,17 @@ std::string NMD::SDC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1XS(uint64 instruction)
+static char *SDC1XS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SDC1XS %s, %s(%s)", ft, rs, rt);
+    return img_format("SDC1XS %s, %s(%s)", ft, rs, rt);
 }
 
 
@@ -13499,17 +13235,17 @@ std::string NMD::SDC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC2(uint64 instruction)
+static char *SDC2(uint64 instruction)
 {
     uint64 cs_value = extract_cs_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string cs = CPR(copy(cs_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *cs = CPR(copy_ui(cs_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SDC2 %s, %s(%s)", cs, s, rs);
+    return img_format("SDC2 %s, %s(%s)", cs, s, rs);
 }
 
 
@@ -13523,19 +13259,19 @@ std::string NMD::SDC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDM(uint64 instruction)
+static char *SDM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *count3 = IMMEDIATE_UI(encode_count3_from_count(count3_value));
 
-    return img::format("SDM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("SDM %s, %s(%s), %s", rt, s, rs, count3);
 }
 
 
@@ -13549,15 +13285,15 @@ std::string NMD::SDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDPC_48_(uint64 instruction)
+static char *SDPC_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
-    return img::format("SDPC %s, %s", rt, s);
+    return img_format("SDPC %s, %s", rt, s);
 }
 
 
@@ -13571,17 +13307,17 @@ std::string NMD::SDPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDXS(uint64 instruction)
+static char *SDXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SDXS %s, %s(%s)", rd, rs, rt);
+    return img_format("SDXS %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -13595,17 +13331,17 @@ std::string NMD::SDXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDX(uint64 instruction)
+static char *SDX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SDX %s, %s(%s)", rd, rs, rt);
+    return img_format("SDX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -13619,15 +13355,15 @@ std::string NMD::SDX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEB(uint64 instruction)
+static char *SEB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SEB %s, %s", rt, rs);
+    return img_format("SEB %s, %s", rt, rs);
 }
 
 
@@ -13641,15 +13377,15 @@ std::string NMD::SEB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEH(uint64 instruction)
+static char *SEH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SEH %s, %s", rt, rs);
+    return img_format("SEH %s, %s", rt, rs);
 }
 
 
@@ -13663,17 +13399,17 @@ std::string NMD::SEH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEL_D(uint64 instruction)
+static char *SEL_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("SEL.D %s, %s, %s", fd, fs, ft);
+    return img_format("SEL.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -13687,17 +13423,17 @@ std::string NMD::SEL_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEL_S(uint64 instruction)
+static char *SEL_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("SEL.S %s, %s, %s", fd, fs, ft);
+    return img_format("SEL.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -13711,17 +13447,17 @@ std::string NMD::SEL_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELEQZ_D(uint64 instruction)
+static char *SELEQZ_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("SELEQZ.D %s, %s, %s", fd, fs, ft);
+    return img_format("SELEQZ.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -13735,17 +13471,17 @@ std::string NMD::SELEQZ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELEQZ_S(uint64 instruction)
+static char *SELEQZ_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("SELEQZ.S %s, %s, %s", fd, fs, ft);
+    return img_format("SELEQZ.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -13759,17 +13495,17 @@ std::string NMD::SELEQZ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELNEZ_D(uint64 instruction)
+static char *SELNEZ_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("SELNEZ.D %s, %s, %s", fd, fs, ft);
+    return img_format("SELNEZ.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -13783,17 +13519,17 @@ std::string NMD::SELNEZ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELNEZ_S(uint64 instruction)
+static char *SELNEZ_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("SELNEZ.S %s, %s, %s", fd, fs, ft);
+    return img_format("SELNEZ.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -13807,17 +13543,17 @@ std::string NMD::SELNEZ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEQI(uint64 instruction)
+static char *SEQI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("SEQI %s, %s, %s", rt, rs, u);
+    return img_format("SEQI %s, %s, %s", rt, rs, u);
 }
 
 
@@ -13831,17 +13567,17 @@ std::string NMD::SEQI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_16_(uint64 instruction)
+static char *SH_16_(uint64 instruction)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1__s1(instruction);
 
-    std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("SH %s, %s(%s)", rtz3, u, rs3);
+    return img_format("SH %s, %s(%s)", rtz3, u, rs3);
 }
 
 
@@ -13855,15 +13591,15 @@ std::string NMD::SH_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_GP_(uint64 instruction)
+static char *SH_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("SH %s, %s($%d)", rt, u, 28);
+    return img_format("SH %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -13877,17 +13613,17 @@ std::string NMD::SH_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_S9_(uint64 instruction)
+static char *SH_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SH %s, %s(%s)", rt, s, rs);
+    return img_format("SH %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -13901,17 +13637,17 @@ std::string NMD::SH_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_U12_(uint64 instruction)
+static char *SH_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SH %s, %s(%s)", rt, u, rs);
+    return img_format("SH %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -13925,17 +13661,17 @@ std::string NMD::SH_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHE(uint64 instruction)
+static char *SHE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SHE %s, %s(%s)", rt, s, rs);
+    return img_format("SHE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -13949,15 +13685,15 @@ std::string NMD::SHE(uint64 instruction)
  *      shift ------
  *               ac --
  */
-std::string NMD::SHILO(uint64 instruction)
+static char *SHILO(uint64 instruction)
 {
     int64 shift_value = extract_shift__se5_21_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string shift = IMMEDIATE(copy(shift_value));
-    std::string ac = AC(copy(ac_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
+    const char *ac = AC(copy_ui(ac_value));
 
-    return img::format("SHILO %s, %s", ac, shift);
+    return img_format("SHILO %s, %s", ac, shift);
 }
 
 
@@ -13971,15 +13707,15 @@ std::string NMD::SHILO(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::SHILOV(uint64 instruction)
+static char *SHILOV(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string ac = AC(copy(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *ac = AC(copy_ui(ac_value));
 
-    return img::format("SHILOV %s, %s", ac, rs);
+    return img_format("SHILOV %s, %s", ac, rs);
 }
 
 
@@ -13993,17 +13729,17 @@ std::string NMD::SHILOV(uint64 instruction)
  *          rs -----
  *               sa ----
  */
-std::string NMD::SHLL_PH(uint64 instruction)
+static char *SHLL_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
-    return img::format("SHLL.PH %s, %s, %s", rt, rs, sa);
+    return img_format("SHLL.PH %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14017,17 +13753,17 @@ std::string NMD::SHLL_PH(uint64 instruction)
  *          rs -----
  *               sa ---
  */
-std::string NMD::SHLL_QB(uint64 instruction)
+static char *SHLL_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
-    return img::format("SHLL.QB %s, %s, %s", rt, rs, sa);
+    return img_format("SHLL.QB %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14042,17 +13778,17 @@ std::string NMD::SHLL_QB(uint64 instruction)
  *          rs -----
  *               sa ----
  */
-std::string NMD::SHLL_S_PH(uint64 instruction)
+static char *SHLL_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
-    return img::format("SHLL_S.PH %s, %s, %s", rt, rs, sa);
+    return img_format("SHLL_S.PH %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14066,17 +13802,17 @@ std::string NMD::SHLL_S_PH(uint64 instruction)
  *          rs -----
  *               sa -----
  */
-std::string NMD::SHLL_S_W(uint64 instruction)
+static char *SHLL_S_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
-    return img::format("SHLL_S.W %s, %s, %s", rt, rs, sa);
+    return img_format("SHLL_S.W %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14091,17 +13827,17 @@ std::string NMD::SHLL_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_PH(uint64 instruction)
+static char *SHLLV_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SHLLV.PH %s, %s, %s", rd, rt, rs);
+    return img_format("SHLLV.PH %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14115,17 +13851,17 @@ std::string NMD::SHLLV_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_QB(uint64 instruction)
+static char *SHLLV_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SHLLV.QB %s, %s, %s", rd, rt, rs);
+    return img_format("SHLLV.QB %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14140,17 +13876,17 @@ std::string NMD::SHLLV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_S_PH(uint64 instruction)
+static char *SHLLV_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SHLLV_S.PH %s, %s, %s", rd, rt, rs);
+    return img_format("SHLLV_S.PH %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14164,17 +13900,17 @@ std::string NMD::SHLLV_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_S_W(uint64 instruction)
+static char *SHLLV_S_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SHLLV_S.W %s, %s, %s", rd, rt, rs);
+    return img_format("SHLLV_S.W %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14188,17 +13924,17 @@ std::string NMD::SHLLV_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_PH(uint64 instruction)
+static char *SHRA_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
-    return img::format("SHRA.PH %s, %s, %s", rt, rs, sa);
+    return img_format("SHRA.PH %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14212,17 +13948,17 @@ std::string NMD::SHRA_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_QB(uint64 instruction)
+static char *SHRA_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
-    return img::format("SHRA.QB %s, %s, %s", rt, rs, sa);
+    return img_format("SHRA.QB %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14236,17 +13972,17 @@ std::string NMD::SHRA_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_R_PH(uint64 instruction)
+static char *SHRA_R_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
-    return img::format("SHRA_R.PH %s, %s, %s", rt, rs, sa);
+    return img_format("SHRA_R.PH %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14260,17 +13996,17 @@ std::string NMD::SHRA_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_R_QB(uint64 instruction)
+static char *SHRA_R_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
-    return img::format("SHRA_R.QB %s, %s, %s", rt, rs, sa);
+    return img_format("SHRA_R.QB %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14284,17 +14020,17 @@ std::string NMD::SHRA_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_R_W(uint64 instruction)
+static char *SHRA_R_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
-    return img::format("SHRA_R.W %s, %s, %s", rt, rs, sa);
+    return img_format("SHRA_R.W %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14308,17 +14044,17 @@ std::string NMD::SHRA_R_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_PH(uint64 instruction)
+static char *SHRAV_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SHRAV.PH %s, %s, %s", rd, rt, rs);
+    return img_format("SHRAV.PH %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14332,17 +14068,17 @@ std::string NMD::SHRAV_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_QB(uint64 instruction)
+static char *SHRAV_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SHRAV.QB %s, %s, %s", rd, rt, rs);
+    return img_format("SHRAV.QB %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14356,17 +14092,17 @@ std::string NMD::SHRAV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_R_PH(uint64 instruction)
+static char *SHRAV_R_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SHRAV_R.PH %s, %s, %s", rd, rt, rs);
+    return img_format("SHRAV_R.PH %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14380,17 +14116,17 @@ std::string NMD::SHRAV_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_R_QB(uint64 instruction)
+static char *SHRAV_R_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SHRAV_R.QB %s, %s, %s", rd, rt, rs);
+    return img_format("SHRAV_R.QB %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14404,17 +14140,17 @@ std::string NMD::SHRAV_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_R_W(uint64 instruction)
+static char *SHRAV_R_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SHRAV_R.W %s, %s, %s", rd, rt, rs);
+    return img_format("SHRAV_R.W %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14428,17 +14164,17 @@ std::string NMD::SHRAV_R_W(uint64 instruction)
  *          rs -----
  *               sa ----
  */
-std::string NMD::SHRL_PH(uint64 instruction)
+static char *SHRL_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
-    return img::format("SHRL.PH %s, %s, %s", rt, rs, sa);
+    return img_format("SHRL.PH %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14452,17 +14188,17 @@ std::string NMD::SHRL_PH(uint64 instruction)
  *          rs -----
  *               sa ---
  */
-std::string NMD::SHRL_QB(uint64 instruction)
+static char *SHRL_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
-    return img::format("SHRL.QB %s, %s, %s", rt, rs, sa);
+    return img_format("SHRL.QB %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14477,17 +14213,17 @@ std::string NMD::SHRL_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRLV_PH(uint64 instruction)
+static char *SHRLV_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SHRLV.PH %s, %s, %s", rd, rt, rs);
+    return img_format("SHRLV.PH %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14501,17 +14237,17 @@ std::string NMD::SHRLV_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRLV_QB(uint64 instruction)
+static char *SHRLV_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SHRLV.QB %s, %s, %s", rd, rt, rs);
+    return img_format("SHRLV.QB %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14525,17 +14261,17 @@ std::string NMD::SHRLV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHX(uint64 instruction)
+static char *SHX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SHX %s, %s(%s)", rd, rs, rt);
+    return img_format("SHX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -14549,17 +14285,17 @@ std::string NMD::SHX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHXS(uint64 instruction)
+static char *SHXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SHXS %s, %s(%s)", rd, rs, rt);
+    return img_format("SHXS %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -14573,13 +14309,13 @@ std::string NMD::SHXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SIGRIE(uint64 instruction)
+static char *SIGRIE(uint64 instruction)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
-    return img::format("SIGRIE %s", code);
+    return img_format("SIGRIE %s", code);
 }
 
 
@@ -14593,17 +14329,17 @@ std::string NMD::SIGRIE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLL_16_(uint64 instruction)
+static char *SLL_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 shift3_value = extract_shift3_2_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *shift3 = IMMEDIATE_UI(encode_shift3_from_shift(shift3_value));
 
-    return img::format("SLL %s, %s, %s", rt3, rs3, shift3);
+    return img_format("SLL %s, %s, %s", rt3, rs3, shift3);
 }
 
 
@@ -14617,17 +14353,17 @@ std::string NMD::SLL_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLL_32_(uint64 instruction)
+static char *SLL_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
-    return img::format("SLL %s, %s, %s", rt, rs, shift);
+    return img_format("SLL %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -14641,17 +14377,17 @@ std::string NMD::SLL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLLV(uint64 instruction)
+static char *SLLV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SLLV %s, %s, %s", rd, rs, rt);
+    return img_format("SLLV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -14665,17 +14401,17 @@ std::string NMD::SLLV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLT(uint64 instruction)
+static char *SLT(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SLT %s, %s, %s", rd, rs, rt);
+    return img_format("SLT %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -14689,17 +14425,17 @@ std::string NMD::SLT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLTI(uint64 instruction)
+static char *SLTI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("SLTI %s, %s, %s", rt, rs, u);
+    return img_format("SLTI %s, %s, %s", rt, rs, u);
 }
 
 
@@ -14713,17 +14449,17 @@ std::string NMD::SLTI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLTIU(uint64 instruction)
+static char *SLTIU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("SLTIU %s, %s, %s", rt, rs, u);
+    return img_format("SLTIU %s, %s, %s", rt, rs, u);
 }
 
 
@@ -14737,17 +14473,17 @@ std::string NMD::SLTIU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLTU(uint64 instruction)
+static char *SLTU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SLTU %s, %s, %s", rd, rs, rt);
+    return img_format("SLTU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -14761,17 +14497,17 @@ std::string NMD::SLTU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SOV(uint64 instruction)
+static char *SOV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SOV %s, %s, %s", rd, rs, rt);
+    return img_format("SOV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -14785,13 +14521,13 @@ std::string NMD::SOV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SPECIAL2(uint64 instruction)
+static char *SPECIAL2(uint64 instruction)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
-    std::string op = IMMEDIATE(copy(op_value));
+    const char *op = IMMEDIATE_UI(copy_ui(op_value));
 
-    return img::format("SPECIAL2 %s", op);
+    return img_format("SPECIAL2 %s", op);
 }
 
 
@@ -14805,15 +14541,15 @@ std::string NMD::SPECIAL2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SQRT_D(uint64 instruction)
+static char *SQRT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("SQRT.D %s, %s", ft, fs);
+    return img_format("SQRT.D %s, %s", ft, fs);
 }
 
 
@@ -14827,15 +14563,15 @@ std::string NMD::SQRT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SQRT_S(uint64 instruction)
+static char *SQRT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("SQRT.S %s, %s", ft, fs);
+    return img_format("SQRT.S %s, %s", ft, fs);
 }
 
 
@@ -14849,17 +14585,17 @@ std::string NMD::SQRT_S(uint64 instruction)
  *               rd -----
  *                    sa -----
  */
-std::string NMD::SRA(uint64 instruction)
+static char *SRA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
-    return img::format("SRA %s, %s, %s", rt, rs, shift);
+    return img_format("SRA %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -14873,17 +14609,17 @@ std::string NMD::SRA(uint64 instruction)
  *          rt -----
  *               rd -----
  */
-std::string NMD::SRAV(uint64 instruction)
+static char *SRAV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SRAV %s, %s, %s", rd, rs, rt);
+    return img_format("SRAV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -14897,17 +14633,17 @@ std::string NMD::SRAV(uint64 instruction)
  *          rt -----
  *               rd -----
  */
-std::string NMD::SRL_16_(uint64 instruction)
+static char *SRL_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 shift3_value = extract_shift3_2_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *shift3 = IMMEDIATE_UI(encode_shift3_from_shift(shift3_value));
 
-    return img::format("SRL %s, %s, %s", rt3, rs3, shift3);
+    return img_format("SRL %s, %s, %s", rt3, rs3, shift3);
 }
 
 
@@ -14921,17 +14657,17 @@ std::string NMD::SRL_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SRL_32_(uint64 instruction)
+static char *SRL_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
-    return img::format("SRL %s, %s, %s", rt, rs, shift);
+    return img_format("SRL %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -14945,17 +14681,17 @@ std::string NMD::SRL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SRLV(uint64 instruction)
+static char *SRLV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SRLV %s, %s, %s", rd, rs, rt);
+    return img_format("SRLV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -14969,17 +14705,17 @@ std::string NMD::SRLV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUB(uint64 instruction)
+static char *SUB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SUB %s, %s, %s", rd, rs, rt);
+    return img_format("SUB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -14993,17 +14729,17 @@ std::string NMD::SUB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUB_D(uint64 instruction)
+static char *SUB_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("SUB.D %s, %s, %s", fd, fs, ft);
+    return img_format("SUB.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -15017,17 +14753,17 @@ std::string NMD::SUB_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUB_S(uint64 instruction)
+static char *SUB_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
-    return img::format("SUB.S %s, %s, %s", fd, fs, ft);
+    return img_format("SUB.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -15041,17 +14777,17 @@ std::string NMD::SUB_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQ_PH(uint64 instruction)
+static char *SUBQ_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SUBQ.PH %s, %s, %s", rd, rs, rt);
+    return img_format("SUBQ.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15066,17 +14802,17 @@ std::string NMD::SUBQ_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQ_S_PH(uint64 instruction)
+static char *SUBQ_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SUBQ_S.PH %s, %s, %s", rd, rs, rt);
+    return img_format("SUBQ_S.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15091,17 +14827,17 @@ std::string NMD::SUBQ_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQ_S_W(uint64 instruction)
+static char *SUBQ_S_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SUBQ_S.W %s, %s, %s", rd, rs, rt);
+    return img_format("SUBQ_S.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15116,17 +14852,17 @@ std::string NMD::SUBQ_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_PH(uint64 instruction)
+static char *SUBQH_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SUBQH.PH %s, %s, %s", rd, rs, rt);
+    return img_format("SUBQH.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15141,17 +14877,17 @@ std::string NMD::SUBQH_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_R_PH(uint64 instruction)
+static char *SUBQH_R_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SUBQH_R.PH %s, %s, %s", rd, rs, rt);
+    return img_format("SUBQH_R.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15166,17 +14902,17 @@ std::string NMD::SUBQH_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_R_W(uint64 instruction)
+static char *SUBQH_R_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SUBQH_R.W %s, %s, %s", rd, rs, rt);
+    return img_format("SUBQH_R.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15191,17 +14927,17 @@ std::string NMD::SUBQH_R_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_W(uint64 instruction)
+static char *SUBQH_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SUBQH.W %s, %s, %s", rd, rs, rt);
+    return img_format("SUBQH.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15215,17 +14951,17 @@ std::string NMD::SUBQH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_16_(uint64 instruction)
+static char *SUBU_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 rd3_value = extract_rd3_3_2_1(instruction);
 
-    std::string rd3 = GPR(decode_gpr_gpr3(rd3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
 
-    return img::format("SUBU %s, %s, %s", rd3, rs3, rt3);
+    return img_format("SUBU %s, %s, %s", rd3, rs3, rt3);
 }
 
 
@@ -15239,17 +14975,17 @@ std::string NMD::SUBU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_32_(uint64 instruction)
+static char *SUBU_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SUBU %s, %s, %s", rd, rs, rt);
+    return img_format("SUBU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15263,17 +14999,17 @@ std::string NMD::SUBU_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_PH(uint64 instruction)
+static char *SUBU_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SUBU.PH %s, %s, %s", rd, rs, rt);
+    return img_format("SUBU.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15287,17 +15023,17 @@ std::string NMD::SUBU_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_QB(uint64 instruction)
+static char *SUBU_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SUBU.QB %s, %s, %s", rd, rs, rt);
+    return img_format("SUBU.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15312,17 +15048,17 @@ std::string NMD::SUBU_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_S_PH(uint64 instruction)
+static char *SUBU_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SUBU_S.PH %s, %s, %s", rd, rs, rt);
+    return img_format("SUBU_S.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15337,17 +15073,17 @@ std::string NMD::SUBU_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_S_QB(uint64 instruction)
+static char *SUBU_S_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SUBU_S.QB %s, %s, %s", rd, rs, rt);
+    return img_format("SUBU_S.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15362,17 +15098,17 @@ std::string NMD::SUBU_S_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBUH_QB(uint64 instruction)
+static char *SUBUH_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SUBUH.QB %s, %s, %s", rd, rs, rt);
+    return img_format("SUBUH.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15387,17 +15123,17 @@ std::string NMD::SUBUH_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBUH_R_QB(uint64 instruction)
+static char *SUBUH_R_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SUBUH_R.QB %s, %s, %s", rd, rs, rt);
+    return img_format("SUBUH_R.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15411,17 +15147,17 @@ std::string NMD::SUBUH_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_16_(uint64 instruction)
+static char *SW_16_(uint64 instruction)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
-    std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("SW %s, %s(%s)", rtz3, u, rs3);
+    return img_format("SW %s, %s(%s)", rtz3, u, rs3);
 }
 
 
@@ -15435,17 +15171,17 @@ std::string NMD::SW_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_4X4_(uint64 instruction)
+static char *SW_4X4_(uint64 instruction)
 {
     uint64 rtz4_value = extract_rtz4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
     uint64 u_value = extract_u_3_8__s2(instruction);
 
-    std::string rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
-    return img::format("SW %s, %s(%s)", rtz4, u, rs4);
+    return img_format("SW %s, %s(%s)", rtz4, u, rs4);
 }
 
 
@@ -15459,15 +15195,15 @@ std::string NMD::SW_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_GP16_(uint64 instruction)
+static char *SW_GP16_(uint64 instruction)
 {
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
 
-    std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("SW %s, %s($%d)", rtz3, u, 28);
+    return img_format("SW %s, %s($%d)", rtz3, u, 28);
 }
 
 
@@ -15481,15 +15217,15 @@ std::string NMD::SW_GP16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_GP_(uint64 instruction)
+static char *SW_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("SW %s, %s($%d)", rt, u, 28);
+    return img_format("SW %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -15503,17 +15239,17 @@ std::string NMD::SW_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_S9_(uint64 instruction)
+static char *SW_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SW %s, %s(%s)", rt, s, rs);
+    return img_format("SW %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -15527,15 +15263,15 @@ std::string NMD::SW_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_SP_(uint64 instruction)
+static char *SW_SP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("SW %s, %s($%d)", rt, u, 29);
+    return img_format("SW %s, %s($%d)", rt, u, 29);
 }
 
 
@@ -15549,17 +15285,17 @@ std::string NMD::SW_SP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_U12_(uint64 instruction)
+static char *SW_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SW %s, %s(%s)", rt, u, rs);
+    return img_format("SW %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -15573,15 +15309,15 @@ std::string NMD::SW_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1_GP_(uint64 instruction)
+static char *SWC1_GP_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("SWC1 %s, %s($%d)", ft, u, 28);
+    return img_format("SWC1 %s, %s($%d)", ft, u, 28);
 }
 
 
@@ -15595,17 +15331,17 @@ std::string NMD::SWC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1_S9_(uint64 instruction)
+static char *SWC1_S9_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SWC1 %s, %s(%s)", ft, s, rs);
+    return img_format("SWC1 %s, %s(%s)", ft, s, rs);
 }
 
 
@@ -15619,17 +15355,17 @@ std::string NMD::SWC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1_U12_(uint64 instruction)
+static char *SWC1_U12_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SWC1 %s, %s(%s)", ft, u, rs);
+    return img_format("SWC1 %s, %s(%s)", ft, u, rs);
 }
 
 
@@ -15643,17 +15379,17 @@ std::string NMD::SWC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1X(uint64 instruction)
+static char *SWC1X(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SWC1X %s, %s(%s)", ft, rs, rt);
+    return img_format("SWC1X %s, %s(%s)", ft, rs, rt);
 }
 
 
@@ -15667,17 +15403,17 @@ std::string NMD::SWC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1XS(uint64 instruction)
+static char *SWC1XS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SWC1XS %s, %s(%s)", ft, rs, rt);
+    return img_format("SWC1XS %s, %s(%s)", ft, rs, rt);
 }
 
 
@@ -15691,17 +15427,17 @@ std::string NMD::SWC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC2(uint64 instruction)
+static char *SWC2(uint64 instruction)
 {
     uint64 cs_value = extract_cs_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string cs = CPR(copy(cs_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *cs = CPR(copy_ui(cs_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SWC2 %s, %s(%s)", cs, s, rs);
+    return img_format("SWC2 %s, %s(%s)", cs, s, rs);
 }
 
 
@@ -15715,17 +15451,17 @@ std::string NMD::SWC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWE(uint64 instruction)
+static char *SWE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SWE %s, %s(%s)", rt, s, rs);
+    return img_format("SWE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -15739,19 +15475,19 @@ std::string NMD::SWE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWM(uint64 instruction)
+static char *SWM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *count3 = IMMEDIATE_UI(encode_count3_from_count(count3_value));
 
-    return img::format("SWM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("SWM %s, %s(%s), %s", rt, s, rs, count3);
 }
 
 
@@ -15765,15 +15501,15 @@ std::string NMD::SWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWPC_48_(uint64 instruction)
+static char *SWPC_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
-    return img::format("SWPC %s, %s", rt, s);
+    return img_format("SWPC %s, %s", rt, s);
 }
 
 
@@ -15787,17 +15523,17 @@ std::string NMD::SWPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWX(uint64 instruction)
+static char *SWX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SWX %s, %s(%s)", rd, rs, rt);
+    return img_format("SWX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -15811,17 +15547,17 @@ std::string NMD::SWX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWXS(uint64 instruction)
+static char *SWXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("SWXS %s, %s(%s)", rd, rs, rt);
+    return img_format("SWXS %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -15835,13 +15571,13 @@ std::string NMD::SWXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYNC(uint64 instruction)
+static char *SYNC(uint64 instruction)
 {
     uint64 stype_value = extract_stype_20_19_18_17_16(instruction);
 
-    std::string stype = IMMEDIATE(copy(stype_value));
+    const char *stype = IMMEDIATE_UI(copy_ui(stype_value));
 
-    return img::format("SYNC %s", stype);
+    return img_format("SYNC %s", stype);
 }
 
 
@@ -15855,15 +15591,15 @@ std::string NMD::SYNC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYNCI(uint64 instruction)
+static char *SYNCI(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SYNCI %s(%s)", s, rs);
+    return img_format("SYNCI %s(%s)", s, rs);
 }
 
 
@@ -15877,15 +15613,15 @@ std::string NMD::SYNCI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYNCIE(uint64 instruction)
+static char *SYNCIE(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("SYNCIE %s(%s)", s, rs);
+    return img_format("SYNCIE %s(%s)", s, rs);
 }
 
 
@@ -15899,13 +15635,13 @@ std::string NMD::SYNCIE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYSCALL_16_(uint64 instruction)
+static char *SYSCALL_16_(uint64 instruction)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
-    return img::format("SYSCALL %s", code);
+    return img_format("SYSCALL %s", code);
 }
 
 
@@ -15917,13 +15653,13 @@ std::string NMD::SYSCALL_16_(uint64 instruction)
  *  00000000000010
  *           code ------------------
  */
-std::string NMD::SYSCALL_32_(uint64 instruction)
+static char *SYSCALL_32_(uint64 instruction)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
-    return img::format("SYSCALL %s", code);
+    return img_format("SYSCALL %s", code);
 }
 
 
@@ -15937,15 +15673,15 @@ std::string NMD::SYSCALL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TEQ(uint64 instruction)
+static char *TEQ(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("TEQ %s, %s", rs, rt);
+    return img_format("TEQ %s, %s", rs, rt);
 }
 
 
@@ -15959,11 +15695,11 @@ std::string NMD::TEQ(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGINV(uint64 instruction)
+static char *TLBGINV(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBGINV ";
+    return strdup("TLBGINV ");
 }
 
 
@@ -15977,11 +15713,11 @@ std::string NMD::TLBGINV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGINVF(uint64 instruction)
+static char *TLBGINVF(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBGINVF ";
+    return strdup("TLBGINVF ");
 }
 
 
@@ -15995,11 +15731,11 @@ std::string NMD::TLBGINVF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGP(uint64 instruction)
+static char *TLBGP(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBGP ";
+    return strdup("TLBGP ");
 }
 
 
@@ -16013,11 +15749,11 @@ std::string NMD::TLBGP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGR(uint64 instruction)
+static char *TLBGR(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBGR ";
+    return strdup("TLBGR ");
 }
 
 
@@ -16031,11 +15767,11 @@ std::string NMD::TLBGR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGWI(uint64 instruction)
+static char *TLBGWI(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBGWI ";
+    return strdup("TLBGWI ");
 }
 
 
@@ -16049,11 +15785,11 @@ std::string NMD::TLBGWI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGWR(uint64 instruction)
+static char *TLBGWR(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBGWR ";
+    return strdup("TLBGWR ");
 }
 
 
@@ -16067,11 +15803,11 @@ std::string NMD::TLBGWR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBINV(uint64 instruction)
+static char *TLBINV(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBINV ";
+    return strdup("TLBINV ");
 }
 
 
@@ -16085,11 +15821,11 @@ std::string NMD::TLBINV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBINVF(uint64 instruction)
+static char *TLBINVF(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBINVF ";
+    return strdup("TLBINVF ");
 }
 
 
@@ -16103,11 +15839,11 @@ std::string NMD::TLBINVF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBP(uint64 instruction)
+static char *TLBP(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBP ";
+    return strdup("TLBP ");
 }
 
 
@@ -16121,11 +15857,11 @@ std::string NMD::TLBP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBR(uint64 instruction)
+static char *TLBR(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBR ";
+    return strdup("TLBR ");
 }
 
 
@@ -16139,11 +15875,11 @@ std::string NMD::TLBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBWI(uint64 instruction)
+static char *TLBWI(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBWI ";
+    return strdup("TLBWI ");
 }
 
 
@@ -16157,11 +15893,11 @@ std::string NMD::TLBWI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBWR(uint64 instruction)
+static char *TLBWR(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBWR ";
+    return strdup("TLBWR ");
 }
 
 
@@ -16175,15 +15911,15 @@ std::string NMD::TLBWR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TNE(uint64 instruction)
+static char *TNE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("TNE %s, %s", rs, rt);
+    return img_format("TNE %s, %s", rs, rt);
 }
 
 
@@ -16197,15 +15933,15 @@ std::string NMD::TNE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_L_D(uint64 instruction)
+static char *TRUNC_L_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("TRUNC.L.D %s, %s", ft, fs);
+    return img_format("TRUNC.L.D %s, %s", ft, fs);
 }
 
 
@@ -16219,15 +15955,15 @@ std::string NMD::TRUNC_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_L_S(uint64 instruction)
+static char *TRUNC_L_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("TRUNC.L.S %s, %s", ft, fs);
+    return img_format("TRUNC.L.S %s, %s", ft, fs);
 }
 
 
@@ -16241,15 +15977,15 @@ std::string NMD::TRUNC_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_W_D(uint64 instruction)
+static char *TRUNC_W_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("TRUNC.W.D %s, %s", ft, fs);
+    return img_format("TRUNC.W.D %s, %s", ft, fs);
 }
 
 
@@ -16263,15 +15999,15 @@ std::string NMD::TRUNC_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_W_S(uint64 instruction)
+static char *TRUNC_W_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
-    return img::format("TRUNC.W.S %s, %s", ft, fs);
+    return img_format("TRUNC.W.S %s, %s", ft, fs);
 }
 
 
@@ -16285,19 +16021,19 @@ std::string NMD::TRUNC_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UALDM(uint64 instruction)
+static char *UALDM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *count3 = IMMEDIATE_UI(encode_count3_from_count(count3_value));
 
-    return img::format("UALDM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("UALDM %s, %s(%s), %s", rt, s, rs, count3);
 }
 
 
@@ -16311,17 +16047,17 @@ std::string NMD::UALDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UALH(uint64 instruction)
+static char *UALH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("UALH %s, %s(%s)", rt, s, rs);
+    return img_format("UALH %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -16335,19 +16071,19 @@ std::string NMD::UALH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UALWM(uint64 instruction)
+static char *UALWM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *count3 = IMMEDIATE_UI(encode_count3_from_count(count3_value));
 
-    return img::format("UALWM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("UALWM %s, %s(%s), %s", rt, s, rs, count3);
 }
 
 
@@ -16361,19 +16097,19 @@ std::string NMD::UALWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UASDM(uint64 instruction)
+static char *UASDM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *count3 = IMMEDIATE_UI(encode_count3_from_count(count3_value));
 
-    return img::format("UASDM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("UASDM %s, %s(%s), %s", rt, s, rs, count3);
 }
 
 
@@ -16387,17 +16123,17 @@ std::string NMD::UASDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UASH(uint64 instruction)
+static char *UASH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("UASH %s, %s(%s)", rt, s, rs);
+    return img_format("UASH %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -16411,19 +16147,19 @@ std::string NMD::UASH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UASWM(uint64 instruction)
+static char *UASWM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *count3 = IMMEDIATE_UI(encode_count3_from_count(count3_value));
 
-    return img::format("UASWM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("UASWM %s, %s(%s), %s", rt, s, rs, count3);
 }
 
 
@@ -16437,13 +16173,13 @@ std::string NMD::UASWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UDI(uint64 instruction)
+static char *UDI(uint64 instruction)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
-    std::string op = IMMEDIATE(copy(op_value));
+    const char *op = IMMEDIATE_UI(copy_ui(op_value));
 
-    return img::format("UDI %s", op);
+    return img_format("UDI %s", op);
 }
 
 
@@ -16455,13 +16191,13 @@ std::string NMD::UDI(uint64 instruction)
  *  001000          1100001101111111
  *   code ----------
  */
-std::string NMD::WAIT(uint64 instruction)
+static char *WAIT(uint64 instruction)
 {
     uint64 code_value = extract_code_25_24_23_22_21_20_19_18_17_16(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
-    return img::format("WAIT %s", code);
+    return img_format("WAIT %s", code);
 }
 
 
@@ -16475,15 +16211,15 @@ std::string NMD::WAIT(uint64 instruction)
  *     rt -----
  *        mask -------
  */
-std::string NMD::WRDSP(uint64 instruction)
+static char *WRDSP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string mask = IMMEDIATE(copy(mask_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *mask = IMMEDIATE_UI(copy_ui(mask_value));
 
-    return img::format("WRDSP %s, %s", rt, mask);
+    return img_format("WRDSP %s, %s", rt, mask);
 }
 
 
@@ -16497,15 +16233,15 @@ std::string NMD::WRDSP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::WRPGPR(uint64 instruction)
+static char *WRPGPR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("WRPGPR %s, %s", rt, rs);
+    return img_format("WRPGPR %s, %s", rt, rs);
 }
 
 
@@ -16519,15 +16255,15 @@ std::string NMD::WRPGPR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::XOR_16_(uint64 instruction)
+static char *XOR_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
 
-    return img::format("XOR %s, %s", rs3, rt3);
+    return img_format("XOR %s, %s", rs3, rt3);
 }
 
 
@@ -16541,17 +16277,17 @@ std::string NMD::XOR_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::XOR_32_(uint64 instruction)
+static char *XOR_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
-    return img::format("XOR %s, %s, %s", rd, rs, rt);
+    return img_format("XOR %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -16565,17 +16301,17 @@ std::string NMD::XOR_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::XORI(uint64 instruction)
+static char *XORI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
-    return img::format("XORI %s, %s, %s", rt, rs, u);
+    return img_format("XORI %s, %s, %s", rt, rs, u);
 }
 
 
@@ -16588,19 +16324,17 @@ std::string NMD::XORI(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::YIELD(uint64 instruction)
+static char *YIELD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
-    return img::format("YIELD %s, %s", rt, rs);
+    return img_format("YIELD %s, %s", rt, rs);
 }
 
-
-
 /*
  *                nanoMIPS instruction pool organization
  *                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -16703,83 +16437,83 @@ std::string NMD::YIELD(uint64 instruction)
  *
  */
 
-NMD::Pool NMD::P_SYSCALL[2] = {
+static struct Pool P_SYSCALL[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfffc0000, 0x00080000, &NMD::SYSCALL_32_      , 0,
+       0xfffc0000, 0x00080000, &SYSCALL_32_      , 0,
        0x0                 },        /* SYSCALL[32] */
     { instruction         , 0                   , 0   , 32,
-       0xfffc0000, 0x000c0000, &NMD::HYPCALL          , 0,
+       0xfffc0000, 0x000c0000, &HYPCALL          , 0,
        CP0_ | VZ_          },        /* HYPCALL */
 };
 
 
-NMD::Pool NMD::P_RI[4] = {
+static struct Pool P_RI[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfff80000, 0x00000000, &NMD::SIGRIE           , 0,
+       0xfff80000, 0x00000000, &SIGRIE           , 0,
        0x0                 },        /* SIGRIE */
     { pool                , P_SYSCALL           , 2   , 32,
        0xfff80000, 0x00080000, 0                      , 0,
        0x0                 },        /* P.SYSCALL */
     { instruction         , 0                   , 0   , 32,
-       0xfff80000, 0x00100000, &NMD::BREAK_32_        , 0,
+       0xfff80000, 0x00100000, &BREAK_32_        , 0,
        0x0                 },        /* BREAK[32] */
     { instruction         , 0                   , 0   , 32,
-       0xfff80000, 0x00180000, &NMD::SDBBP_32_        , 0,
+       0xfff80000, 0x00180000, &SDBBP_32_        , 0,
        EJTAG_              },        /* SDBBP[32] */
 };
 
 
-NMD::Pool NMD::P_ADDIU[2] = {
+static struct Pool P_ADDIU[2] = {
     { pool                , P_RI                , 4   , 32,
        0xffe00000, 0x00000000, 0                      , 0,
        0x0                 },        /* P.RI */
     { instruction         , 0                   , 0   , 32,
-       0xfc000000, 0x00000000, &NMD::ADDIU_32_        , &NMD::ADDIU_32__cond   ,
+       0xfc000000, 0x00000000, &ADDIU_32_        , &ADDIU_32__cond   ,
        0x0                 },        /* ADDIU[32] */
 };
 
 
-NMD::Pool NMD::P_TRAP[2] = {
+static struct Pool P_TRAP[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000000, &NMD::TEQ              , 0,
+       0xfc0007ff, 0x20000000, &TEQ              , 0,
        XMMS_               },        /* TEQ */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000400, &NMD::TNE              , 0,
+       0xfc0007ff, 0x20000400, &TNE              , 0,
        XMMS_               },        /* TNE */
 };
 
 
-NMD::Pool NMD::P_CMOVE[2] = {
+static struct Pool P_CMOVE[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000210, &NMD::MOVZ             , 0,
+       0xfc0007ff, 0x20000210, &MOVZ             , 0,
        0x0                 },        /* MOVZ */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000610, &NMD::MOVN             , 0,
+       0xfc0007ff, 0x20000610, &MOVN             , 0,
        0x0                 },        /* MOVN */
 };
 
 
-NMD::Pool NMD::P_D_MT_VPE[2] = {
+static struct Pool P_D_MT_VPE[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1f3fff, 0x20010ab0, &NMD::DMT              , 0,
+       0xfc1f3fff, 0x20010ab0, &DMT              , 0,
        MT_                 },        /* DMT */
     { instruction         , 0                   , 0   , 32,
-       0xfc1f3fff, 0x20000ab0, &NMD::DVPE             , 0,
+       0xfc1f3fff, 0x20000ab0, &DVPE             , 0,
        MT_                 },        /* DVPE */
 };
 
 
-NMD::Pool NMD::P_E_MT_VPE[2] = {
+static struct Pool P_E_MT_VPE[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1f3fff, 0x20010eb0, &NMD::EMT              , 0,
+       0xfc1f3fff, 0x20010eb0, &EMT              , 0,
        MT_                 },        /* EMT */
     { instruction         , 0                   , 0   , 32,
-       0xfc1f3fff, 0x20000eb0, &NMD::EVPE             , 0,
+       0xfc1f3fff, 0x20000eb0, &EVPE             , 0,
        MT_                 },        /* EVPE */
 };
 
 
-NMD::Pool NMD::_P_MT_VPE[2] = {
+static struct Pool _P_MT_VPE[2] = {
     { pool                , P_D_MT_VPE          , 2   , 32,
        0xfc003fff, 0x20000ab0, 0                      , 0,
        0x0                 },        /* P.D_MT_VPE */
@@ -16789,7 +16523,7 @@ NMD::Pool NMD::_P_MT_VPE[2] = {
 };
 
 
-NMD::Pool NMD::P_MT_VPE[8] = {
+static struct Pool P_MT_VPE[8] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc003bff, 0x200002b0, 0                      , 0,
        0x0                 },        /* P.MT_VPE~*(0) */
@@ -16817,38 +16551,38 @@ NMD::Pool NMD::P_MT_VPE[8] = {
 };
 
 
-NMD::Pool NMD::P_DVP[2] = {
+static struct Pool P_DVP[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20000390, &NMD::DVP              , 0,
+       0xfc00ffff, 0x20000390, &DVP              , 0,
        0x0                 },        /* DVP */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20000790, &NMD::EVP              , 0,
+       0xfc00ffff, 0x20000790, &EVP              , 0,
        0x0                 },        /* EVP */
 };
 
 
-NMD::Pool NMD::P_SLTU[2] = {
+static struct Pool P_SLTU[2] = {
     { pool                , P_DVP               , 2   , 32,
        0xfc00fbff, 0x20000390, 0                      , 0,
        0x0                 },        /* P.DVP */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000390, &NMD::SLTU             , &NMD::SLTU_cond        ,
+       0xfc0003ff, 0x20000390, &SLTU             , &SLTU_cond        ,
        0x0                 },        /* SLTU */
 };
 
 
-NMD::Pool NMD::_POOL32A0[128] = {
+static struct Pool _POOL32A0[128] = {
     { pool                , P_TRAP              , 2   , 32,
        0xfc0003ff, 0x20000000, 0                      , 0,
        0x0                 },        /* P.TRAP */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000008, &NMD::SEB              , 0,
+       0xfc0003ff, 0x20000008, &SEB              , 0,
        XMMS_               },        /* SEB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000010, &NMD::SLLV             , 0,
+       0xfc0003ff, 0x20000010, &SLLV             , 0,
        0x0                 },        /* SLLV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000018, &NMD::MUL_32_          , 0,
+       0xfc0003ff, 0x20000018, &MUL_32_          , 0,
        0x0                 },        /* MUL[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000020, 0                      , 0,
@@ -16857,22 +16591,22 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000028, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(5) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000030, &NMD::MFC0             , 0,
+       0xfc0003ff, 0x20000030, &MFC0             , 0,
        0x0                 },        /* MFC0 */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000038, &NMD::MFHC0            , 0,
+       0xfc0003ff, 0x20000038, &MFHC0            , 0,
        CP0_ | MVH_         },        /* MFHC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000040, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(8) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000048, &NMD::SEH              , 0,
+       0xfc0003ff, 0x20000048, &SEH              , 0,
        0x0                 },        /* SEH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000050, &NMD::SRLV             , 0,
+       0xfc0003ff, 0x20000050, &SRLV             , 0,
        0x0                 },        /* SRLV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000058, &NMD::MUH              , 0,
+       0xfc0003ff, 0x20000058, &MUH              , 0,
        0x0                 },        /* MUH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000060, 0                      , 0,
@@ -16881,10 +16615,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000068, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(13) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000070, &NMD::MTC0             , 0,
+       0xfc0003ff, 0x20000070, &MTC0             , 0,
        CP0_                },        /* MTC0 */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000078, &NMD::MTHC0            , 0,
+       0xfc0003ff, 0x20000078, &MTHC0            , 0,
        CP0_ | MVH_         },        /* MTHC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000080, 0                      , 0,
@@ -16893,10 +16627,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000088, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(17) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000090, &NMD::SRAV             , 0,
+       0xfc0003ff, 0x20000090, &SRAV             , 0,
        0x0                 },        /* SRAV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000098, &NMD::MULU             , 0,
+       0xfc0003ff, 0x20000098, &MULU             , 0,
        0x0                 },        /* MULU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200000a0, 0                      , 0,
@@ -16905,10 +16639,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200000a8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(21) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000b0, &NMD::MFGC0            , 0,
+       0xfc0003ff, 0x200000b0, &MFGC0            , 0,
        CP0_ | VZ_          },        /* MFGC0 */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000b8, &NMD::MFHGC0           , 0,
+       0xfc0003ff, 0x200000b8, &MFHGC0           , 0,
        CP0_ | VZ_ | MVH_   },        /* MFHGC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200000c0, 0                      , 0,
@@ -16917,10 +16651,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200000c8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(25) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000d0, &NMD::ROTRV            , 0,
+       0xfc0003ff, 0x200000d0, &ROTRV            , 0,
        0x0                 },        /* ROTRV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000d8, &NMD::MUHU             , 0,
+       0xfc0003ff, 0x200000d8, &MUHU             , 0,
        0x0                 },        /* MUHU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200000e0, 0                      , 0,
@@ -16929,10 +16663,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200000e8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(29) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000f0, &NMD::MTGC0            , 0,
+       0xfc0003ff, 0x200000f0, &MTGC0            , 0,
        CP0_ | VZ_          },        /* MTGC0 */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000f8, &NMD::MTHGC0           , 0,
+       0xfc0003ff, 0x200000f8, &MTHGC0           , 0,
        CP0_ | VZ_ | MVH_   },        /* MTHGC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000100, 0                      , 0,
@@ -16941,10 +16675,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000108, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(33) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000110, &NMD::ADD              , 0,
+       0xfc0003ff, 0x20000110, &ADD              , 0,
        XMMS_               },        /* ADD */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000118, &NMD::DIV              , 0,
+       0xfc0003ff, 0x20000118, &DIV              , 0,
        0x0                 },        /* DIV */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000120, 0                      , 0,
@@ -16953,7 +16687,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000128, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(37) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000130, &NMD::DMFC0            , 0,
+       0xfc0003ff, 0x20000130, &DMFC0            , 0,
        CP0_ | MIPS64_      },        /* DMFC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000138, 0                      , 0,
@@ -16965,10 +16699,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000148, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(41) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000150, &NMD::ADDU_32_         , 0,
+       0xfc0003ff, 0x20000150, &ADDU_32_         , 0,
        0x0                 },        /* ADDU[32] */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000158, &NMD::MOD              , 0,
+       0xfc0003ff, 0x20000158, &MOD              , 0,
        0x0                 },        /* MOD */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000160, 0                      , 0,
@@ -16977,7 +16711,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000168, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(45) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000170, &NMD::DMTC0            , 0,
+       0xfc0003ff, 0x20000170, &DMTC0            , 0,
        CP0_ | MIPS64_      },        /* DMTC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000178, 0                      , 0,
@@ -16989,10 +16723,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000188, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(49) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000190, &NMD::SUB              , 0,
+       0xfc0003ff, 0x20000190, &SUB              , 0,
        XMMS_               },        /* SUB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000198, &NMD::DIVU             , 0,
+       0xfc0003ff, 0x20000198, &DIVU             , 0,
        0x0                 },        /* DIVU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001a0, 0                      , 0,
@@ -17001,22 +16735,22 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200001a8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(53) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001b0, &NMD::DMFGC0           , 0,
+       0xfc0003ff, 0x200001b0, &DMFGC0           , 0,
        CP0_ | MIPS64_ | VZ_},        /* DMFGC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001b8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(55) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001c0, &NMD::RDHWR            , 0,
+       0xfc0003ff, 0x200001c0, &RDHWR            , 0,
        XMMS_               },        /* RDHWR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001c8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(57) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001d0, &NMD::SUBU_32_         , 0,
+       0xfc0003ff, 0x200001d0, &SUBU_32_         , 0,
        0x0                 },        /* SUBU[32] */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001d8, &NMD::MODU             , 0,
+       0xfc0003ff, 0x200001d8, &MODU             , 0,
        0x0                 },        /* MODU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001e0, 0                      , 0,
@@ -17025,7 +16759,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200001e8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(61) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001f0, &NMD::DMTGC0           , 0,
+       0xfc0003ff, 0x200001f0, &DMTGC0           , 0,
        CP0_ | MIPS64_ | VZ_},        /* DMTGC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001f8, 0                      , 0,
@@ -17046,13 +16780,13 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000220, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(68) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000228, &NMD::FORK             , 0,
+       0xfc0003ff, 0x20000228, &FORK             , 0,
        MT_                 },        /* FORK */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000230, &NMD::MFTR             , 0,
+       0xfc0003ff, 0x20000230, &MFTR             , 0,
        MT_                 },        /* MFTR */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000238, &NMD::MFHTR            , 0,
+       0xfc0003ff, 0x20000238, &MFHTR            , 0,
        MT_                 },        /* MFHTR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000240, 0                      , 0,
@@ -17061,7 +16795,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000248, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(73) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000250, &NMD::AND_32_          , 0,
+       0xfc0003ff, 0x20000250, &AND_32_          , 0,
        0x0                 },        /* AND[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000258, 0                      , 0,
@@ -17070,13 +16804,13 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000260, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(76) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000268, &NMD::YIELD            , 0,
+       0xfc0003ff, 0x20000268, &YIELD            , 0,
        MT_                 },        /* YIELD */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000270, &NMD::MTTR             , 0,
+       0xfc0003ff, 0x20000270, &MTTR             , 0,
        MT_                 },        /* MTTR */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000278, &NMD::MTHTR            , 0,
+       0xfc0003ff, 0x20000278, &MTHTR            , 0,
        MT_                 },        /* MTHTR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000280, 0                      , 0,
@@ -17085,7 +16819,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000288, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(81) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000290, &NMD::OR_32_           , 0,
+       0xfc0003ff, 0x20000290, &OR_32_           , 0,
        0x0                 },        /* OR[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000298, 0                      , 0,
@@ -17109,7 +16843,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200002c8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(89) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200002d0, &NMD::NOR              , 0,
+       0xfc0003ff, 0x200002d0, &NOR              , 0,
        0x0                 },        /* NOR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200002d8, 0                      , 0,
@@ -17133,7 +16867,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000308, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(97) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000310, &NMD::XOR_32_          , 0,
+       0xfc0003ff, 0x20000310, &XOR_32_          , 0,
        0x0                 },        /* XOR[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000318, 0                      , 0,
@@ -17157,7 +16891,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000348, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(105) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000350, &NMD::SLT              , 0,
+       0xfc0003ff, 0x20000350, &SLT              , 0,
        0x0                 },        /* SLT */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000358, 0                      , 0,
@@ -17205,7 +16939,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200003c8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(121) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200003d0, &NMD::SOV              , 0,
+       0xfc0003ff, 0x200003d0, &SOV              , 0,
        0x0                 },        /* SOV */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200003d8, 0                      , 0,
@@ -17225,185 +16959,185 @@ NMD::Pool NMD::_POOL32A0[128] = {
 };
 
 
-NMD::Pool NMD::ADDQ__S__PH[2] = {
+static struct Pool ADDQ__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000000d, &NMD::ADDQ_PH          , 0,
+       0xfc0007ff, 0x2000000d, &ADDQ_PH          , 0,
        DSP_                },        /* ADDQ.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000040d, &NMD::ADDQ_S_PH        , 0,
+       0xfc0007ff, 0x2000040d, &ADDQ_S_PH        , 0,
        DSP_                },        /* ADDQ_S.PH */
 };
 
 
-NMD::Pool NMD::MUL__S__PH[2] = {
+static struct Pool MUL__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000002d, &NMD::MUL_PH           , 0,
+       0xfc0007ff, 0x2000002d, &MUL_PH           , 0,
        DSP_                },        /* MUL.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000042d, &NMD::MUL_S_PH         , 0,
+       0xfc0007ff, 0x2000042d, &MUL_S_PH         , 0,
        DSP_                },        /* MUL_S.PH */
 };
 
 
-NMD::Pool NMD::ADDQH__R__PH[2] = {
+static struct Pool ADDQH__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000004d, &NMD::ADDQH_PH         , 0,
+       0xfc0007ff, 0x2000004d, &ADDQH_PH         , 0,
        DSP_                },        /* ADDQH.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000044d, &NMD::ADDQH_R_PH       , 0,
+       0xfc0007ff, 0x2000044d, &ADDQH_R_PH       , 0,
        DSP_                },        /* ADDQH_R.PH */
 };
 
 
-NMD::Pool NMD::ADDQH__R__W[2] = {
+static struct Pool ADDQH__R__W[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000008d, &NMD::ADDQH_W          , 0,
+       0xfc0007ff, 0x2000008d, &ADDQH_W          , 0,
        DSP_                },        /* ADDQH.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000048d, &NMD::ADDQH_R_W        , 0,
+       0xfc0007ff, 0x2000048d, &ADDQH_R_W        , 0,
        DSP_                },        /* ADDQH_R.W */
 };
 
 
-NMD::Pool NMD::ADDU__S__QB[2] = {
+static struct Pool ADDU__S__QB[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200000cd, &NMD::ADDU_QB          , 0,
+       0xfc0007ff, 0x200000cd, &ADDU_QB          , 0,
        DSP_                },        /* ADDU.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200004cd, &NMD::ADDU_S_QB        , 0,
+       0xfc0007ff, 0x200004cd, &ADDU_S_QB        , 0,
        DSP_                },        /* ADDU_S.QB */
 };
 
 
-NMD::Pool NMD::ADDU__S__PH[2] = {
+static struct Pool ADDU__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000010d, &NMD::ADDU_PH          , 0,
+       0xfc0007ff, 0x2000010d, &ADDU_PH          , 0,
        DSP_                },        /* ADDU.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000050d, &NMD::ADDU_S_PH        , 0,
+       0xfc0007ff, 0x2000050d, &ADDU_S_PH        , 0,
        DSP_                },        /* ADDU_S.PH */
 };
 
 
-NMD::Pool NMD::ADDUH__R__QB[2] = {
+static struct Pool ADDUH__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000014d, &NMD::ADDUH_QB         , 0,
+       0xfc0007ff, 0x2000014d, &ADDUH_QB         , 0,
        DSP_                },        /* ADDUH.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000054d, &NMD::ADDUH_R_QB       , 0,
+       0xfc0007ff, 0x2000054d, &ADDUH_R_QB       , 0,
        DSP_                },        /* ADDUH_R.QB */
 };
 
 
-NMD::Pool NMD::SHRAV__R__PH[2] = {
+static struct Pool SHRAV__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000018d, &NMD::SHRAV_PH         , 0,
+       0xfc0007ff, 0x2000018d, &SHRAV_PH         , 0,
        DSP_                },        /* SHRAV.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000058d, &NMD::SHRAV_R_PH       , 0,
+       0xfc0007ff, 0x2000058d, &SHRAV_R_PH       , 0,
        DSP_                },        /* SHRAV_R.PH */
 };
 
 
-NMD::Pool NMD::SHRAV__R__QB[2] = {
+static struct Pool SHRAV__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200001cd, &NMD::SHRAV_QB         , 0,
+       0xfc0007ff, 0x200001cd, &SHRAV_QB         , 0,
        DSP_                },        /* SHRAV.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200005cd, &NMD::SHRAV_R_QB       , 0,
+       0xfc0007ff, 0x200005cd, &SHRAV_R_QB       , 0,
        DSP_                },        /* SHRAV_R.QB */
 };
 
 
-NMD::Pool NMD::SUBQ__S__PH[2] = {
+static struct Pool SUBQ__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000020d, &NMD::SUBQ_PH          , 0,
+       0xfc0007ff, 0x2000020d, &SUBQ_PH          , 0,
        DSP_                },        /* SUBQ.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000060d, &NMD::SUBQ_S_PH        , 0,
+       0xfc0007ff, 0x2000060d, &SUBQ_S_PH        , 0,
        DSP_                },        /* SUBQ_S.PH */
 };
 
 
-NMD::Pool NMD::SUBQH__R__PH[2] = {
+static struct Pool SUBQH__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000024d, &NMD::SUBQH_PH         , 0,
+       0xfc0007ff, 0x2000024d, &SUBQH_PH         , 0,
        DSP_                },        /* SUBQH.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000064d, &NMD::SUBQH_R_PH       , 0,
+       0xfc0007ff, 0x2000064d, &SUBQH_R_PH       , 0,
        DSP_                },        /* SUBQH_R.PH */
 };
 
 
-NMD::Pool NMD::SUBQH__R__W[2] = {
+static struct Pool SUBQH__R__W[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000028d, &NMD::SUBQH_W          , 0,
+       0xfc0007ff, 0x2000028d, &SUBQH_W          , 0,
        DSP_                },        /* SUBQH.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000068d, &NMD::SUBQH_R_W        , 0,
+       0xfc0007ff, 0x2000068d, &SUBQH_R_W        , 0,
        DSP_                },        /* SUBQH_R.W */
 };
 
 
-NMD::Pool NMD::SUBU__S__QB[2] = {
+static struct Pool SUBU__S__QB[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200002cd, &NMD::SUBU_QB          , 0,
+       0xfc0007ff, 0x200002cd, &SUBU_QB          , 0,
        DSP_                },        /* SUBU.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200006cd, &NMD::SUBU_S_QB        , 0,
+       0xfc0007ff, 0x200006cd, &SUBU_S_QB        , 0,
        DSP_                },        /* SUBU_S.QB */
 };
 
 
-NMD::Pool NMD::SUBU__S__PH[2] = {
+static struct Pool SUBU__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000030d, &NMD::SUBU_PH          , 0,
+       0xfc0007ff, 0x2000030d, &SUBU_PH          , 0,
        DSP_                },        /* SUBU.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000070d, &NMD::SUBU_S_PH        , 0,
+       0xfc0007ff, 0x2000070d, &SUBU_S_PH        , 0,
        DSP_                },        /* SUBU_S.PH */
 };
 
 
-NMD::Pool NMD::SHRA__R__PH[2] = {
+static struct Pool SHRA__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000335, &NMD::SHRA_PH          , 0,
+       0xfc0007ff, 0x20000335, &SHRA_PH          , 0,
        DSP_                },        /* SHRA.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000735, &NMD::SHRA_R_PH        , 0,
+       0xfc0007ff, 0x20000735, &SHRA_R_PH        , 0,
        DSP_                },        /* SHRA_R.PH */
 };
 
 
-NMD::Pool NMD::SUBUH__R__QB[2] = {
+static struct Pool SUBUH__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000034d, &NMD::SUBUH_QB         , 0,
+       0xfc0007ff, 0x2000034d, &SUBUH_QB         , 0,
        DSP_                },        /* SUBUH.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000074d, &NMD::SUBUH_R_QB       , 0,
+       0xfc0007ff, 0x2000074d, &SUBUH_R_QB       , 0,
        DSP_                },        /* SUBUH_R.QB */
 };
 
 
-NMD::Pool NMD::SHLLV__S__PH[2] = {
+static struct Pool SHLLV__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000038d, &NMD::SHLLV_PH         , 0,
+       0xfc0007ff, 0x2000038d, &SHLLV_PH         , 0,
        DSP_                },        /* SHLLV.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000078d, &NMD::SHLLV_S_PH       , 0,
+       0xfc0007ff, 0x2000078d, &SHLLV_S_PH       , 0,
        DSP_                },        /* SHLLV_S.PH */
 };
 
 
-NMD::Pool NMD::SHLL__S__PH[4] = {
+static struct Pool SHLL__S__PH[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000fff, 0x200003b5, &NMD::SHLL_PH          , 0,
+       0xfc000fff, 0x200003b5, &SHLL_PH          , 0,
        DSP_                },        /* SHLL.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc000fff, 0x200007b5, 0                      , 0,
        0x0                 },        /* SHLL[_S].PH~*(1) */
     { instruction         , 0                   , 0   , 32,
-       0xfc000fff, 0x20000bb5, &NMD::SHLL_S_PH        , 0,
+       0xfc000fff, 0x20000bb5, &SHLL_S_PH        , 0,
        DSP_                },        /* SHLL_S.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc000fff, 0x20000fb5, 0                      , 0,
@@ -17411,19 +17145,19 @@ NMD::Pool NMD::SHLL__S__PH[4] = {
 };
 
 
-NMD::Pool NMD::PRECR_SRA__R__PH_W[2] = {
+static struct Pool PRECR_SRA__R__PH_W[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200003cd, &NMD::PRECR_SRA_PH_W   , 0,
+       0xfc0007ff, 0x200003cd, &PRECR_SRA_PH_W   , 0,
        DSP_                },        /* PRECR_SRA.PH.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200007cd, &NMD::PRECR_SRA_R_PH_W , 0,
+       0xfc0007ff, 0x200007cd, &PRECR_SRA_R_PH_W , 0,
        DSP_                },        /* PRECR_SRA_R.PH.W */
 };
 
 
-NMD::Pool NMD::_POOL32A5[128] = {
+static struct Pool _POOL32A5[128] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000005, &NMD::CMP_EQ_PH        , 0,
+       0xfc0003ff, 0x20000005, &CMP_EQ_PH        , 0,
        DSP_                },        /* CMP.EQ.PH */
     { pool                , ADDQ__S__PH         , 2   , 32,
        0xfc0003ff, 0x2000000d, 0                      , 0,
@@ -17432,10 +17166,10 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x20000015, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(2) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x2000001d, &NMD::SHILO            , 0,
+       0xfc0003ff, 0x2000001d, &SHILO            , 0,
        DSP_                },        /* SHILO */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000025, &NMD::MULEQ_S_W_PHL    , 0,
+       0xfc0003ff, 0x20000025, &MULEQ_S_W_PHL    , 0,
        DSP_                },        /* MULEQ_S.W.PHL */
     { pool                , MUL__S__PH          , 2   , 32,
        0xfc0003ff, 0x2000002d, 0                      , 0,
@@ -17444,10 +17178,10 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x20000035, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(6) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x2000003d, &NMD::REPL_PH          , 0,
+       0xfc0003ff, 0x2000003d, &REPL_PH          , 0,
        DSP_                },        /* REPL.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000045, &NMD::CMP_LT_PH        , 0,
+       0xfc0003ff, 0x20000045, &CMP_LT_PH        , 0,
        DSP_                },        /* CMP.LT.PH */
     { pool                , ADDQH__R__PH        , 2   , 32,
        0xfc0003ff, 0x2000004d, 0                      , 0,
@@ -17459,10 +17193,10 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000005d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(11) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000065, &NMD::MULEQ_S_W_PHR    , 0,
+       0xfc0003ff, 0x20000065, &MULEQ_S_W_PHR    , 0,
        DSP_                },        /* MULEQ_S.W.PHR */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x2000006d, &NMD::PRECR_QB_PH      , 0,
+       0xfc0003ff, 0x2000006d, &PRECR_QB_PH      , 0,
        DSP_                },        /* PRECR.QB.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000075, 0                      , 0,
@@ -17471,13 +17205,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000007d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(15) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000085, &NMD::CMP_LE_PH        , 0,
+       0xfc0003ff, 0x20000085, &CMP_LE_PH        , 0,
        DSP_                },        /* CMP.LE.PH */
     { pool                , ADDQH__R__W         , 2   , 32,
        0xfc0003ff, 0x2000008d, 0                      , 0,
        0x0                 },        /* ADDQH[_R].W */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000095, &NMD::MULEU_S_PH_QBL   , 0,
+       0xfc0003ff, 0x20000095, &MULEU_S_PH_QBL   , 0,
        DSP_                },        /* MULEU_S.PH.QBL */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000009d, 0                      , 0,
@@ -17486,7 +17220,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200000a5, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(20) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000ad, &NMD::PRECRQ_QB_PH     , 0,
+       0xfc0003ff, 0x200000ad, &PRECRQ_QB_PH     , 0,
        DSP_                },        /* PRECRQ.QB.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200000b5, 0                      , 0,
@@ -17495,13 +17229,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200000bd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(23) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000c5, &NMD::CMPGU_EQ_QB      , 0,
+       0xfc0003ff, 0x200000c5, &CMPGU_EQ_QB      , 0,
        DSP_                },        /* CMPGU.EQ.QB */
     { pool                , ADDU__S__QB         , 2   , 32,
        0xfc0003ff, 0x200000cd, 0                      , 0,
        0x0                 },        /* ADDU[_S].QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000d5, &NMD::MULEU_S_PH_QBR   , 0,
+       0xfc0003ff, 0x200000d5, &MULEU_S_PH_QBR   , 0,
        DSP_                },        /* MULEU_S.PH.QBR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200000dd, 0                      , 0,
@@ -17510,7 +17244,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200000e5, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(28) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000ed, &NMD::PRECRQ_PH_W      , 0,
+       0xfc0003ff, 0x200000ed, &PRECRQ_PH_W      , 0,
        DSP_                },        /* PRECRQ.PH.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200000f5, 0                      , 0,
@@ -17519,13 +17253,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200000fd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(31) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000105, &NMD::CMPGU_LT_QB      , 0,
+       0xfc0003ff, 0x20000105, &CMPGU_LT_QB      , 0,
        DSP_                },        /* CMPGU.LT.QB */
     { pool                , ADDU__S__PH         , 2   , 32,
        0xfc0003ff, 0x2000010d, 0                      , 0,
        0x0                 },        /* ADDU[_S].PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000115, &NMD::MULQ_RS_PH       , 0,
+       0xfc0003ff, 0x20000115, &MULQ_RS_PH       , 0,
        DSP_                },        /* MULQ_RS.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000011d, 0                      , 0,
@@ -17534,7 +17268,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x20000125, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(36) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x2000012d, &NMD::PRECRQ_RS_PH_W   , 0,
+       0xfc0003ff, 0x2000012d, &PRECRQ_RS_PH_W   , 0,
        DSP_                },        /* PRECRQ_RS.PH.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000135, 0                      , 0,
@@ -17543,13 +17277,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000013d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(39) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000145, &NMD::CMPGU_LE_QB      , 0,
+       0xfc0003ff, 0x20000145, &CMPGU_LE_QB      , 0,
        DSP_                },        /* CMPGU.LE.QB */
     { pool                , ADDUH__R__QB        , 2   , 32,
        0xfc0003ff, 0x2000014d, 0                      , 0,
        0x0                 },        /* ADDUH[_R].QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000155, &NMD::MULQ_S_PH        , 0,
+       0xfc0003ff, 0x20000155, &MULQ_S_PH        , 0,
        DSP_                },        /* MULQ_S.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000015d, 0                      , 0,
@@ -17558,7 +17292,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x20000165, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(44) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x2000016d, &NMD::PRECRQU_S_QB_PH  , 0,
+       0xfc0003ff, 0x2000016d, &PRECRQU_S_QB_PH  , 0,
        DSP_                },        /* PRECRQU_S.QB.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000175, 0                      , 0,
@@ -17567,13 +17301,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000017d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(47) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000185, &NMD::CMPGDU_EQ_QB     , 0,
+       0xfc0003ff, 0x20000185, &CMPGDU_EQ_QB     , 0,
        DSP_                },        /* CMPGDU.EQ.QB */
     { pool                , SHRAV__R__PH        , 2   , 32,
        0xfc0003ff, 0x2000018d, 0                      , 0,
        0x0                 },        /* SHRAV[_R].PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000195, &NMD::MULQ_RS_W        , 0,
+       0xfc0003ff, 0x20000195, &MULQ_RS_W        , 0,
        DSP_                },        /* MULQ_RS.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000019d, 0                      , 0,
@@ -17582,7 +17316,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200001a5, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(52) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001ad, &NMD::PACKRL_PH        , 0,
+       0xfc0003ff, 0x200001ad, &PACKRL_PH        , 0,
        DSP_                },        /* PACKRL.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001b5, 0                      , 0,
@@ -17591,13 +17325,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200001bd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(55) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001c5, &NMD::CMPGDU_LT_QB     , 0,
+       0xfc0003ff, 0x200001c5, &CMPGDU_LT_QB     , 0,
        DSP_                },        /* CMPGDU.LT.QB */
     { pool                , SHRAV__R__QB        , 2   , 32,
        0xfc0003ff, 0x200001cd, 0                      , 0,
        0x0                 },        /* SHRAV[_R].QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001d5, &NMD::MULQ_S_W         , 0,
+       0xfc0003ff, 0x200001d5, &MULQ_S_W         , 0,
        DSP_                },        /* MULQ_S.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001dd, 0                      , 0,
@@ -17606,7 +17340,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200001e5, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(60) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001ed, &NMD::PICK_QB          , 0,
+       0xfc0003ff, 0x200001ed, &PICK_QB          , 0,
        DSP_                },        /* PICK.QB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001f5, 0                      , 0,
@@ -17615,13 +17349,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200001fd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(63) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000205, &NMD::CMPGDU_LE_QB     , 0,
+       0xfc0003ff, 0x20000205, &CMPGDU_LE_QB     , 0,
        DSP_                },        /* CMPGDU.LE.QB */
     { pool                , SUBQ__S__PH         , 2   , 32,
        0xfc0003ff, 0x2000020d, 0                      , 0,
        0x0                 },        /* SUBQ[_S].PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000215, &NMD::APPEND           , 0,
+       0xfc0003ff, 0x20000215, &APPEND           , 0,
        DSP_                },        /* APPEND */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000021d, 0                      , 0,
@@ -17630,7 +17364,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x20000225, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(68) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x2000022d, &NMD::PICK_PH          , 0,
+       0xfc0003ff, 0x2000022d, &PICK_PH          , 0,
        DSP_                },        /* PICK.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000235, 0                      , 0,
@@ -17639,13 +17373,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000023d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(71) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000245, &NMD::CMPU_EQ_QB       , 0,
+       0xfc0003ff, 0x20000245, &CMPU_EQ_QB       , 0,
        DSP_                },        /* CMPU.EQ.QB */
     { pool                , SUBQH__R__PH        , 2   , 32,
        0xfc0003ff, 0x2000024d, 0                      , 0,
        0x0                 },        /* SUBQH[_R].PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000255, &NMD::PREPEND          , 0,
+       0xfc0003ff, 0x20000255, &PREPEND          , 0,
        DSP_                },        /* PREPEND */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000025d, 0                      , 0,
@@ -17663,13 +17397,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000027d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(79) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000285, &NMD::CMPU_LT_QB       , 0,
+       0xfc0003ff, 0x20000285, &CMPU_LT_QB       , 0,
        DSP_                },        /* CMPU.LT.QB */
     { pool                , SUBQH__R__W         , 2   , 32,
        0xfc0003ff, 0x2000028d, 0                      , 0,
        0x0                 },        /* SUBQH[_R].W */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000295, &NMD::MODSUB           , 0,
+       0xfc0003ff, 0x20000295, &MODSUB           , 0,
        DSP_                },        /* MODSUB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000029d, 0                      , 0,
@@ -17687,13 +17421,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200002bd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(87) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200002c5, &NMD::CMPU_LE_QB       , 0,
+       0xfc0003ff, 0x200002c5, &CMPU_LE_QB       , 0,
        DSP_                },        /* CMPU.LE.QB */
     { pool                , SUBU__S__QB         , 2   , 32,
        0xfc0003ff, 0x200002cd, 0                      , 0,
        0x0                 },        /* SUBU[_S].QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200002d5, &NMD::SHRAV_R_W        , 0,
+       0xfc0003ff, 0x200002d5, &SHRAV_R_W        , 0,
        DSP_                },        /* SHRAV_R.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200002dd, 0                      , 0,
@@ -17705,19 +17439,19 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200002ed, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(93) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200002f5, &NMD::SHRA_R_W         , 0,
+       0xfc0003ff, 0x200002f5, &SHRA_R_W         , 0,
        DSP_                },        /* SHRA_R.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200002fd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(95) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000305, &NMD::ADDQ_S_W         , 0,
+       0xfc0003ff, 0x20000305, &ADDQ_S_W         , 0,
        DSP_                },        /* ADDQ_S.W */
     { pool                , SUBU__S__PH         , 2   , 32,
        0xfc0003ff, 0x2000030d, 0                      , 0,
        0x0                 },        /* SUBU[_S].PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000315, &NMD::SHRLV_PH         , 0,
+       0xfc0003ff, 0x20000315, &SHRLV_PH         , 0,
        DSP_                },        /* SHRLV.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000031d, 0                      , 0,
@@ -17735,13 +17469,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000033d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(103) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000345, &NMD::SUBQ_S_W         , 0,
+       0xfc0003ff, 0x20000345, &SUBQ_S_W         , 0,
        DSP_                },        /* SUBQ_S.W */
     { pool                , SUBUH__R__QB        , 2   , 32,
        0xfc0003ff, 0x2000034d, 0                      , 0,
        0x0                 },        /* SUBUH[_R].QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000355, &NMD::SHRLV_QB         , 0,
+       0xfc0003ff, 0x20000355, &SHRLV_QB         , 0,
        DSP_                },        /* SHRLV.QB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000035d, 0                      , 0,
@@ -17759,13 +17493,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000037d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(111) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000385, &NMD::ADDSC            , 0,
+       0xfc0003ff, 0x20000385, &ADDSC            , 0,
        DSP_                },        /* ADDSC */
     { pool                , SHLLV__S__PH        , 2   , 32,
        0xfc0003ff, 0x2000038d, 0                      , 0,
        0x0                 },        /* SHLLV[_S].PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000395, &NMD::SHLLV_QB         , 0,
+       0xfc0003ff, 0x20000395, &SHLLV_QB         , 0,
        DSP_                },        /* SHLLV.QB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000039d, 0                      , 0,
@@ -17783,13 +17517,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200003bd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(119) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200003c5, &NMD::ADDWC            , 0,
+       0xfc0003ff, 0x200003c5, &ADDWC            , 0,
        DSP_                },        /* ADDWC */
     { pool                , PRECR_SRA__R__PH_W  , 2   , 32,
        0xfc0003ff, 0x200003cd, 0                      , 0,
        0x0                 },        /* PRECR_SRA[_R].PH.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200003d5, &NMD::SHLLV_S_W        , 0,
+       0xfc0003ff, 0x200003d5, &SHLLV_S_W        , 0,
        DSP_                },        /* SHLLV_S.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200003dd, 0                      , 0,
@@ -17801,7 +17535,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200003ed, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(125) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200003f5, &NMD::SHLL_S_W         , 0,
+       0xfc0003ff, 0x200003f5, &SHLL_S_W         , 0,
        DSP_                },        /* SHLL_S.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200003fd, 0                      , 0,
@@ -17809,59 +17543,59 @@ NMD::Pool NMD::_POOL32A5[128] = {
 };
 
 
-NMD::Pool NMD::PP_LSX[16] = {
+static struct Pool PP_LSX[16] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000007, &NMD::LBX              , 0,
+       0xfc0007ff, 0x20000007, &LBX              , 0,
        0x0                 },        /* LBX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000087, &NMD::SBX              , 0,
+       0xfc0007ff, 0x20000087, &SBX              , 0,
        XMMS_               },        /* SBX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000107, &NMD::LBUX             , 0,
+       0xfc0007ff, 0x20000107, &LBUX             , 0,
        0x0                 },        /* LBUX */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0x20000187, 0                      , 0,
        0x0                 },        /* PP.LSX~*(3) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000207, &NMD::LHX              , 0,
+       0xfc0007ff, 0x20000207, &LHX              , 0,
        0x0                 },        /* LHX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000287, &NMD::SHX              , 0,
+       0xfc0007ff, 0x20000287, &SHX              , 0,
        XMMS_               },        /* SHX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000307, &NMD::LHUX             , 0,
+       0xfc0007ff, 0x20000307, &LHUX             , 0,
        0x0                 },        /* LHUX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000387, &NMD::LWUX             , 0,
+       0xfc0007ff, 0x20000387, &LWUX             , 0,
        MIPS64_             },        /* LWUX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000407, &NMD::LWX              , 0,
+       0xfc0007ff, 0x20000407, &LWX              , 0,
        0x0                 },        /* LWX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000487, &NMD::SWX              , 0,
+       0xfc0007ff, 0x20000487, &SWX              , 0,
        XMMS_               },        /* SWX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000507, &NMD::LWC1X            , 0,
+       0xfc0007ff, 0x20000507, &LWC1X            , 0,
        CP1_                },        /* LWC1X */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000587, &NMD::SWC1X            , 0,
+       0xfc0007ff, 0x20000587, &SWC1X            , 0,
        CP1_                },        /* SWC1X */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000607, &NMD::LDX              , 0,
+       0xfc0007ff, 0x20000607, &LDX              , 0,
        MIPS64_             },        /* LDX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000687, &NMD::SDX              , 0,
+       0xfc0007ff, 0x20000687, &SDX              , 0,
        MIPS64_             },        /* SDX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000707, &NMD::LDC1X            , 0,
+       0xfc0007ff, 0x20000707, &LDC1X            , 0,
        CP1_                },        /* LDC1X */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000787, &NMD::SDC1X            , 0,
+       0xfc0007ff, 0x20000787, &SDC1X            , 0,
        CP1_                },        /* SDC1X */
 };
 
 
-NMD::Pool NMD::PP_LSXS[16] = {
+static struct Pool PP_LSXS[16] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0x20000047, 0                      , 0,
        0x0                 },        /* PP.LSXS~*(0) */
@@ -17875,45 +17609,45 @@ NMD::Pool NMD::PP_LSXS[16] = {
        0xfc0007ff, 0x200001c7, 0                      , 0,
        0x0                 },        /* PP.LSXS~*(3) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000247, &NMD::LHXS             , 0,
+       0xfc0007ff, 0x20000247, &LHXS             , 0,
        0x0                 },        /* LHXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200002c7, &NMD::SHXS             , 0,
+       0xfc0007ff, 0x200002c7, &SHXS             , 0,
        XMMS_               },        /* SHXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000347, &NMD::LHUXS            , 0,
+       0xfc0007ff, 0x20000347, &LHUXS            , 0,
        0x0                 },        /* LHUXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200003c7, &NMD::LWUXS            , 0,
+       0xfc0007ff, 0x200003c7, &LWUXS            , 0,
        MIPS64_             },        /* LWUXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000447, &NMD::LWXS_32_         , 0,
+       0xfc0007ff, 0x20000447, &LWXS_32_         , 0,
        0x0                 },        /* LWXS[32] */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200004c7, &NMD::SWXS             , 0,
+       0xfc0007ff, 0x200004c7, &SWXS             , 0,
        XMMS_               },        /* SWXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000547, &NMD::LWC1XS           , 0,
+       0xfc0007ff, 0x20000547, &LWC1XS           , 0,
        CP1_                },        /* LWC1XS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200005c7, &NMD::SWC1XS           , 0,
+       0xfc0007ff, 0x200005c7, &SWC1XS           , 0,
        CP1_                },        /* SWC1XS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000647, &NMD::LDXS             , 0,
+       0xfc0007ff, 0x20000647, &LDXS             , 0,
        MIPS64_             },        /* LDXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200006c7, &NMD::SDXS             , 0,
+       0xfc0007ff, 0x200006c7, &SDXS             , 0,
        MIPS64_             },        /* SDXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000747, &NMD::LDC1XS           , 0,
+       0xfc0007ff, 0x20000747, &LDC1XS           , 0,
        CP1_                },        /* LDC1XS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200007c7, &NMD::SDC1XS           , 0,
+       0xfc0007ff, 0x200007c7, &SDC1XS           , 0,
        CP1_                },        /* SDC1XS */
 };
 
 
-NMD::Pool NMD::P_LSX[2] = {
+static struct Pool P_LSX[2] = {
     { pool                , PP_LSX              , 16  , 32,
        0xfc00007f, 0x20000007, 0                      , 0,
        0x0                 },        /* PP.LSX */
@@ -17923,28 +17657,28 @@ NMD::Pool NMD::P_LSX[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_0[4] = {
+static struct Pool POOL32Axf_1_0[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000007f, &NMD::MFHI_DSP_        , 0,
+       0xfc003fff, 0x2000007f, &MFHI_DSP_        , 0,
        DSP_                },        /* MFHI[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000107f, &NMD::MFLO_DSP_        , 0,
+       0xfc003fff, 0x2000107f, &MFLO_DSP_        , 0,
        DSP_                },        /* MFLO[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000207f, &NMD::MTHI_DSP_        , 0,
+       0xfc003fff, 0x2000207f, &MTHI_DSP_        , 0,
        DSP_                },        /* MTHI[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000307f, &NMD::MTLO_DSP_        , 0,
+       0xfc003fff, 0x2000307f, &MTLO_DSP_        , 0,
        DSP_                },        /* MTLO[DSP] */
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_1[4] = {
+static struct Pool POOL32Axf_1_1[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000027f, &NMD::MTHLIP           , 0,
+       0xfc003fff, 0x2000027f, &MTHLIP           , 0,
        DSP_                },        /* MTHLIP */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000127f, &NMD::SHILOV           , 0,
+       0xfc003fff, 0x2000127f, &SHILOV           , 0,
        DSP_                },        /* SHILOV */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0x2000227f, 0                      , 0,
@@ -17955,53 +17689,53 @@ NMD::Pool NMD::POOL32Axf_1_1[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_3[4] = {
+static struct Pool POOL32Axf_1_3[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000067f, &NMD::RDDSP            , 0,
+       0xfc003fff, 0x2000067f, &RDDSP            , 0,
        DSP_                },        /* RDDSP */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000167f, &NMD::WRDSP            , 0,
+       0xfc003fff, 0x2000167f, &WRDSP            , 0,
        DSP_                },        /* WRDSP */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000267f, &NMD::EXTP             , 0,
+       0xfc003fff, 0x2000267f, &EXTP             , 0,
        DSP_                },        /* EXTP */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000367f, &NMD::EXTPDP           , 0,
+       0xfc003fff, 0x2000367f, &EXTPDP           , 0,
        DSP_                },        /* EXTPDP */
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_4[2] = {
+static struct Pool POOL32Axf_1_4[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc001fff, 0x2000087f, &NMD::SHLL_QB          , 0,
+       0xfc001fff, 0x2000087f, &SHLL_QB          , 0,
        DSP_                },        /* SHLL.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc001fff, 0x2000187f, &NMD::SHRL_QB          , 0,
+       0xfc001fff, 0x2000187f, &SHRL_QB          , 0,
        DSP_                },        /* SHRL.QB */
 };
 
 
-NMD::Pool NMD::MAQ_S_A__W_PHR[2] = {
+static struct Pool MAQ_S_A__W_PHR[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20000a7f, &NMD::MAQ_S_W_PHR      , 0,
+       0xfc003fff, 0x20000a7f, &MAQ_S_W_PHR      , 0,
        DSP_                },        /* MAQ_S.W.PHR */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20002a7f, &NMD::MAQ_SA_W_PHR     , 0,
+       0xfc003fff, 0x20002a7f, &MAQ_SA_W_PHR     , 0,
        DSP_                },        /* MAQ_SA.W.PHR */
 };
 
 
-NMD::Pool NMD::MAQ_S_A__W_PHL[2] = {
+static struct Pool MAQ_S_A__W_PHL[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20001a7f, &NMD::MAQ_S_W_PHL      , 0,
+       0xfc003fff, 0x20001a7f, &MAQ_S_W_PHL      , 0,
        DSP_                },        /* MAQ_S.W.PHL */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20003a7f, &NMD::MAQ_SA_W_PHL     , 0,
+       0xfc003fff, 0x20003a7f, &MAQ_SA_W_PHL     , 0,
        DSP_                },        /* MAQ_SA.W.PHL */
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_5[2] = {
+static struct Pool POOL32Axf_1_5[2] = {
     { pool                , MAQ_S_A__W_PHR      , 2   , 32,
        0xfc001fff, 0x20000a7f, 0                      , 0,
        0x0                 },        /* MAQ_S[A].W.PHR */
@@ -18011,23 +17745,23 @@ NMD::Pool NMD::POOL32Axf_1_5[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_7[4] = {
+static struct Pool POOL32Axf_1_7[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20000e7f, &NMD::EXTR_W           , 0,
+       0xfc003fff, 0x20000e7f, &EXTR_W           , 0,
        DSP_                },        /* EXTR.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20001e7f, &NMD::EXTR_R_W         , 0,
+       0xfc003fff, 0x20001e7f, &EXTR_R_W         , 0,
        DSP_                },        /* EXTR_R.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20002e7f, &NMD::EXTR_RS_W        , 0,
+       0xfc003fff, 0x20002e7f, &EXTR_RS_W        , 0,
        DSP_                },        /* EXTR_RS.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20003e7f, &NMD::EXTR_S_H         , 0,
+       0xfc003fff, 0x20003e7f, &EXTR_S_H         , 0,
        DSP_                },        /* EXTR_S.H */
 };
 
 
-NMD::Pool NMD::POOL32Axf_1[8] = {
+static struct Pool POOL32Axf_1[8] = {
     { pool                , POOL32Axf_1_0       , 4   , 32,
        0xfc000fff, 0x2000007f, 0                      , 0,
        0x0                 },        /* POOL32Axf_1_0 */
@@ -18055,119 +17789,119 @@ NMD::Pool NMD::POOL32Axf_1[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_2_DSP__0_7[8] = {
+static struct Pool POOL32Axf_2_DSP__0_7[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200000bf, &NMD::DPA_W_PH         , 0,
+       0xfc003fff, 0x200000bf, &DPA_W_PH         , 0,
        DSP_                },        /* DPA.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200002bf, &NMD::DPAQ_S_W_PH      , 0,
+       0xfc003fff, 0x200002bf, &DPAQ_S_W_PH      , 0,
        DSP_                },        /* DPAQ_S.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200004bf, &NMD::DPS_W_PH         , 0,
+       0xfc003fff, 0x200004bf, &DPS_W_PH         , 0,
        DSP_                },        /* DPS.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200006bf, &NMD::DPSQ_S_W_PH      , 0,
+       0xfc003fff, 0x200006bf, &DPSQ_S_W_PH      , 0,
        DSP_                },        /* DPSQ_S.W.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0x200008bf, 0                      , 0,
        0x0                 },        /* POOL32Axf_2(DSP)_0_7~*(4) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20000abf, &NMD::MADD_DSP_        , 0,
+       0xfc003fff, 0x20000abf, &MADD_DSP_        , 0,
        DSP_                },        /* MADD[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20000cbf, &NMD::MULT_DSP_        , 0,
+       0xfc003fff, 0x20000cbf, &MULT_DSP_        , 0,
        DSP_                },        /* MULT[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20000ebf, &NMD::EXTRV_W          , 0,
+       0xfc003fff, 0x20000ebf, &EXTRV_W          , 0,
        DSP_                },        /* EXTRV.W */
 };
 
 
-NMD::Pool NMD::POOL32Axf_2_DSP__8_15[8] = {
+static struct Pool POOL32Axf_2_DSP__8_15[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200010bf, &NMD::DPAX_W_PH        , 0,
+       0xfc003fff, 0x200010bf, &DPAX_W_PH        , 0,
        DSP_                },        /* DPAX.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200012bf, &NMD::DPAQ_SA_L_W      , 0,
+       0xfc003fff, 0x200012bf, &DPAQ_SA_L_W      , 0,
        DSP_                },        /* DPAQ_SA.L.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200014bf, &NMD::DPSX_W_PH        , 0,
+       0xfc003fff, 0x200014bf, &DPSX_W_PH        , 0,
        DSP_                },        /* DPSX.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200016bf, &NMD::DPSQ_SA_L_W      , 0,
+       0xfc003fff, 0x200016bf, &DPSQ_SA_L_W      , 0,
        DSP_                },        /* DPSQ_SA.L.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0x200018bf, 0                      , 0,
        0x0                 },        /* POOL32Axf_2(DSP)_8_15~*(4) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20001abf, &NMD::MADDU_DSP_       , 0,
+       0xfc003fff, 0x20001abf, &MADDU_DSP_       , 0,
        DSP_                },        /* MADDU[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20001cbf, &NMD::MULTU_DSP_       , 0,
+       0xfc003fff, 0x20001cbf, &MULTU_DSP_       , 0,
        DSP_                },        /* MULTU[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20001ebf, &NMD::EXTRV_R_W        , 0,
+       0xfc003fff, 0x20001ebf, &EXTRV_R_W        , 0,
        DSP_                },        /* EXTRV_R.W */
 };
 
 
-NMD::Pool NMD::POOL32Axf_2_DSP__16_23[8] = {
+static struct Pool POOL32Axf_2_DSP__16_23[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200020bf, &NMD::DPAU_H_QBL       , 0,
+       0xfc003fff, 0x200020bf, &DPAU_H_QBL       , 0,
        DSP_                },        /* DPAU.H.QBL */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200022bf, &NMD::DPAQX_S_W_PH     , 0,
+       0xfc003fff, 0x200022bf, &DPAQX_S_W_PH     , 0,
        DSP_                },        /* DPAQX_S.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200024bf, &NMD::DPSU_H_QBL       , 0,
+       0xfc003fff, 0x200024bf, &DPSU_H_QBL       , 0,
        DSP_                },        /* DPSU.H.QBL */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200026bf, &NMD::DPSQX_S_W_PH     , 0,
+       0xfc003fff, 0x200026bf, &DPSQX_S_W_PH     , 0,
        DSP_                },        /* DPSQX_S.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200028bf, &NMD::EXTPV            , 0,
+       0xfc003fff, 0x200028bf, &EXTPV            , 0,
        DSP_                },        /* EXTPV */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20002abf, &NMD::MSUB_DSP_        , 0,
+       0xfc003fff, 0x20002abf, &MSUB_DSP_        , 0,
        DSP_                },        /* MSUB[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20002cbf, &NMD::MULSA_W_PH       , 0,
+       0xfc003fff, 0x20002cbf, &MULSA_W_PH       , 0,
        DSP_                },        /* MULSA.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20002ebf, &NMD::EXTRV_RS_W       , 0,
+       0xfc003fff, 0x20002ebf, &EXTRV_RS_W       , 0,
        DSP_                },        /* EXTRV_RS.W */
 };
 
 
-NMD::Pool NMD::POOL32Axf_2_DSP__24_31[8] = {
+static struct Pool POOL32Axf_2_DSP__24_31[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200030bf, &NMD::DPAU_H_QBR       , 0,
+       0xfc003fff, 0x200030bf, &DPAU_H_QBR       , 0,
        DSP_                },        /* DPAU.H.QBR */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200032bf, &NMD::DPAQX_SA_W_PH    , 0,
+       0xfc003fff, 0x200032bf, &DPAQX_SA_W_PH    , 0,
        DSP_                },        /* DPAQX_SA.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200034bf, &NMD::DPSU_H_QBR       , 0,
+       0xfc003fff, 0x200034bf, &DPSU_H_QBR       , 0,
        DSP_                },        /* DPSU.H.QBR */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200036bf, &NMD::DPSQX_SA_W_PH    , 0,
+       0xfc003fff, 0x200036bf, &DPSQX_SA_W_PH    , 0,
        DSP_                },        /* DPSQX_SA.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200038bf, &NMD::EXTPDPV          , 0,
+       0xfc003fff, 0x200038bf, &EXTPDPV          , 0,
        DSP_                },        /* EXTPDPV */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20003abf, &NMD::MSUBU_DSP_       , 0,
+       0xfc003fff, 0x20003abf, &MSUBU_DSP_       , 0,
        DSP_                },        /* MSUBU[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20003cbf, &NMD::MULSAQ_S_W_PH    , 0,
+       0xfc003fff, 0x20003cbf, &MULSAQ_S_W_PH    , 0,
        DSP_                },        /* MULSAQ_S.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20003ebf, &NMD::EXTRV_S_H        , 0,
+       0xfc003fff, 0x20003ebf, &EXTRV_S_H        , 0,
        DSP_                },        /* EXTRV_S.H */
 };
 
 
-NMD::Pool NMD::POOL32Axf_2[4] = {
+static struct Pool POOL32Axf_2[4] = {
     { pool                , POOL32Axf_2_DSP__0_7, 8   , 32,
        0xfc0031ff, 0x200000bf, 0                      , 0,
        0x0                 },        /* POOL32Axf_2(DSP)_0_7 */
@@ -18183,12 +17917,12 @@ NMD::Pool NMD::POOL32Axf_2[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_4[128] = {
+static struct Pool POOL32Axf_4[128] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000013f, &NMD::ABSQ_S_QB        , 0,
+       0xfc00ffff, 0x2000013f, &ABSQ_S_QB        , 0,
        DSP_                },        /* ABSQ_S.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000033f, &NMD::REPLV_PH         , 0,
+       0xfc00ffff, 0x2000033f, &REPLV_PH         , 0,
        DSP_                },        /* REPLV.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000053f, 0                      , 0,
@@ -18209,10 +17943,10 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20000f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(7) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000113f, &NMD::ABSQ_S_PH        , 0,
+       0xfc00ffff, 0x2000113f, &ABSQ_S_PH        , 0,
        DSP_                },        /* ABSQ_S.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000133f, &NMD::REPLV_QB         , 0,
+       0xfc00ffff, 0x2000133f, &REPLV_QB         , 0,
        DSP_                },        /* REPLV.QB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000153f, 0                      , 0,
@@ -18233,7 +17967,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20001f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(15) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000213f, &NMD::ABSQ_S_W         , 0,
+       0xfc00ffff, 0x2000213f, &ABSQ_S_W         , 0,
        DSP_                },        /* ABSQ_S.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000233f, 0                      , 0,
@@ -18281,7 +18015,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20003f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(31) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000413f, &NMD::INSV             , 0,
+       0xfc00ffff, 0x2000413f, &INSV             , 0,
        DSP_                },        /* INSV */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000433f, 0                      , 0,
@@ -18296,16 +18030,16 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x2000493f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(36) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20004b3f, &NMD::CLO              , 0,
+       0xfc00ffff, 0x20004b3f, &CLO              , 0,
        XMMS_               },        /* CLO */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20004d3f, &NMD::MFC2             , 0,
+       0xfc00ffff, 0x20004d3f, &MFC2             , 0,
        CP2_                },        /* MFC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x20004f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(39) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000513f, &NMD::PRECEQ_W_PHL     , 0,
+       0xfc00ffff, 0x2000513f, &PRECEQ_W_PHL     , 0,
        DSP_                },        /* PRECEQ.W.PHL */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000533f, 0                      , 0,
@@ -18320,16 +18054,16 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x2000593f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(44) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20005b3f, &NMD::CLZ              , 0,
+       0xfc00ffff, 0x20005b3f, &CLZ              , 0,
        XMMS_               },        /* CLZ */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20005d3f, &NMD::MTC2             , 0,
+       0xfc00ffff, 0x20005d3f, &MTC2             , 0,
        CP2_                },        /* MTC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x20005f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(47) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000613f, &NMD::PRECEQ_W_PHR     , 0,
+       0xfc00ffff, 0x2000613f, &PRECEQ_W_PHR     , 0,
        DSP_                },        /* PRECEQ.W.PHR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000633f, 0                      , 0,
@@ -18347,16 +18081,16 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20006b3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(53) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20006d3f, &NMD::DMFC2            , 0,
+       0xfc00ffff, 0x20006d3f, &DMFC2            , 0,
        CP2_                },        /* DMFC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x20006f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(55) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000713f, &NMD::PRECEQU_PH_QBL   , 0,
+       0xfc00ffff, 0x2000713f, &PRECEQU_PH_QBL   , 0,
        DSP_                },        /* PRECEQU.PH.QBL */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000733f, &NMD::PRECEQU_PH_QBLA  , 0,
+       0xfc00ffff, 0x2000733f, &PRECEQU_PH_QBLA  , 0,
        DSP_                },        /* PRECEQU.PH.QBLA */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000753f, 0                      , 0,
@@ -18371,7 +18105,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20007b3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(61) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20007d3f, &NMD::DMTC2            , 0,
+       0xfc00ffff, 0x20007d3f, &DMTC2            , 0,
        CP2_                },        /* DMTC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x20007f3f, 0                      , 0,
@@ -18395,16 +18129,16 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20008b3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(69) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20008d3f, &NMD::MFHC2            , 0,
+       0xfc00ffff, 0x20008d3f, &MFHC2            , 0,
        CP2_                },        /* MFHC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x20008f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(71) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000913f, &NMD::PRECEQU_PH_QBR   , 0,
+       0xfc00ffff, 0x2000913f, &PRECEQU_PH_QBR   , 0,
        DSP_                },        /* PRECEQU.PH.QBR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000933f, &NMD::PRECEQU_PH_QBRA  , 0,
+       0xfc00ffff, 0x2000933f, &PRECEQU_PH_QBRA  , 0,
        DSP_                },        /* PRECEQU.PH.QBRA */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000953f, 0                      , 0,
@@ -18419,7 +18153,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20009b3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(77) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20009d3f, &NMD::MTHC2            , 0,
+       0xfc00ffff, 0x20009d3f, &MTHC2            , 0,
        CP2_                },        /* MTHC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x20009f3f, 0                      , 0,
@@ -18449,10 +18183,10 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x2000af3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(87) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000b13f, &NMD::PRECEU_PH_QBL    , 0,
+       0xfc00ffff, 0x2000b13f, &PRECEU_PH_QBL    , 0,
        DSP_                },        /* PRECEU.PH.QBL */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000b33f, &NMD::PRECEU_PH_QBLA   , 0,
+       0xfc00ffff, 0x2000b33f, &PRECEU_PH_QBLA   , 0,
        DSP_                },        /* PRECEU.PH.QBLA */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000b53f, 0                      , 0,
@@ -18491,16 +18225,16 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x2000cb3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(101) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000cd3f, &NMD::CFC2             , 0,
+       0xfc00ffff, 0x2000cd3f, &CFC2             , 0,
        CP2_                },        /* CFC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000cf3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(103) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000d13f, &NMD::PRECEU_PH_QBR    , 0,
+       0xfc00ffff, 0x2000d13f, &PRECEU_PH_QBR    , 0,
        DSP_                },        /* PRECEU.PH.QBR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000d33f, &NMD::PRECEU_PH_QBRA   , 0,
+       0xfc00ffff, 0x2000d33f, &PRECEU_PH_QBRA   , 0,
        DSP_                },        /* PRECEU.PH.QBRA */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000d53f, 0                      , 0,
@@ -18515,7 +18249,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x2000db3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(109) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000dd3f, &NMD::CTC2             , 0,
+       0xfc00ffff, 0x2000dd3f, &CTC2             , 0,
        CP2_                },        /* CTC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000df3f, 0                      , 0,
@@ -18545,7 +18279,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x2000ef3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(119) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000f13f, &NMD::RADDU_W_QB       , 0,
+       0xfc00ffff, 0x2000f13f, &RADDU_W_QB       , 0,
        DSP_                },        /* RADDU.W.QB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000f33f, 0                      , 0,
@@ -18571,18 +18305,18 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_5_group0[32] = {
+static struct Pool POOL32Axf_5_group0[32] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000017f, &NMD::TLBGP            , 0,
+       0xfc00ffff, 0x2000017f, &TLBGP            , 0,
        CP0_ | VZ_ | TLB_   },        /* TLBGP */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000037f, &NMD::TLBP             , 0,
+       0xfc00ffff, 0x2000037f, &TLBP             , 0,
        CP0_ | TLB_         },        /* TLBP */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000057f, &NMD::TLBGINV          , 0,
+       0xfc00ffff, 0x2000057f, &TLBGINV          , 0,
        CP0_ | VZ_ | TLB_ | TLBINV_},        /* TLBGINV */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000077f, &NMD::TLBINV           , 0,
+       0xfc00ffff, 0x2000077f, &TLBINV           , 0,
        CP0_ | TLB_ | TLBINV_},        /* TLBINV */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000097f, 0                      , 0,
@@ -18597,16 +18331,16 @@ NMD::Pool NMD::POOL32Axf_5_group0[32] = {
        0xfc00ffff, 0x20000f7f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group0~*(7) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000117f, &NMD::TLBGR            , 0,
+       0xfc00ffff, 0x2000117f, &TLBGR            , 0,
        CP0_ | VZ_ | TLB_   },        /* TLBGR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000137f, &NMD::TLBR             , 0,
+       0xfc00ffff, 0x2000137f, &TLBR             , 0,
        CP0_ | TLB_         },        /* TLBR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000157f, &NMD::TLBGINVF         , 0,
+       0xfc00ffff, 0x2000157f, &TLBGINVF         , 0,
        CP0_ | VZ_ | TLB_ | TLBINV_},        /* TLBGINVF */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000177f, &NMD::TLBINVF          , 0,
+       0xfc00ffff, 0x2000177f, &TLBINVF          , 0,
        CP0_ | TLB_ | TLBINV_},        /* TLBINVF */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000197f, 0                      , 0,
@@ -18621,10 +18355,10 @@ NMD::Pool NMD::POOL32Axf_5_group0[32] = {
        0xfc00ffff, 0x20001f7f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group0~*(15) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000217f, &NMD::TLBGWI           , 0,
+       0xfc00ffff, 0x2000217f, &TLBGWI           , 0,
        CP0_ | VZ_ | TLB_   },        /* TLBGWI */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000237f, &NMD::TLBWI            , 0,
+       0xfc00ffff, 0x2000237f, &TLBWI            , 0,
        CP0_ | TLB_         },        /* TLBWI */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000257f, 0                      , 0,
@@ -18645,10 +18379,10 @@ NMD::Pool NMD::POOL32Axf_5_group0[32] = {
        0xfc00ffff, 0x20002f7f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group0~*(23) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000317f, &NMD::TLBGWR           , 0,
+       0xfc00ffff, 0x2000317f, &TLBGWR           , 0,
        CP0_ | VZ_ | TLB_   },        /* TLBGWR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000337f, &NMD::TLBWR            , 0,
+       0xfc00ffff, 0x2000337f, &TLBWR            , 0,
        CP0_ | TLB_         },        /* TLBWR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000357f, 0                      , 0,
@@ -18671,7 +18405,7 @@ NMD::Pool NMD::POOL32Axf_5_group0[32] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_5_group1[32] = {
+static struct Pool POOL32Axf_5_group1[32] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000417f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group1~*(0) */
@@ -18682,7 +18416,7 @@ NMD::Pool NMD::POOL32Axf_5_group1[32] = {
        0xfc00ffff, 0x2000457f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group1~*(2) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000477f, &NMD::DI               , 0,
+       0xfc00ffff, 0x2000477f, &DI               , 0,
        0x0                 },        /* DI */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000497f, 0                      , 0,
@@ -18706,7 +18440,7 @@ NMD::Pool NMD::POOL32Axf_5_group1[32] = {
        0xfc00ffff, 0x2000557f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group1~*(10) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000577f, &NMD::EI               , 0,
+       0xfc00ffff, 0x2000577f, &EI               , 0,
        0x0                 },        /* EI */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000597f, 0                      , 0,
@@ -18771,22 +18505,22 @@ NMD::Pool NMD::POOL32Axf_5_group1[32] = {
 };
 
 
-NMD::Pool NMD::ERETx[2] = {
+static struct Pool ERETx[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc01ffff, 0x2000f37f, &NMD::ERET             , 0,
+       0xfc01ffff, 0x2000f37f, &ERET             , 0,
        0x0                 },        /* ERET */
     { instruction         , 0                   , 0   , 32,
-       0xfc01ffff, 0x2001f37f, &NMD::ERETNC           , 0,
+       0xfc01ffff, 0x2001f37f, &ERETNC           , 0,
        0x0                 },        /* ERETNC */
 };
 
 
-NMD::Pool NMD::POOL32Axf_5_group3[32] = {
+static struct Pool POOL32Axf_5_group3[32] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000c17f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group3~*(0) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000c37f, &NMD::WAIT             , 0,
+       0xfc00ffff, 0x2000c37f, &WAIT             , 0,
        0x0                 },        /* WAIT */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000c57f, 0                      , 0,
@@ -18810,7 +18544,7 @@ NMD::Pool NMD::POOL32Axf_5_group3[32] = {
        0xfc00ffff, 0x2000d17f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group3~*(8) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000d37f, &NMD::IRET             , 0,
+       0xfc00ffff, 0x2000d37f, &IRET             , 0,
        MCU_                },        /* IRET */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000d57f, 0                      , 0,
@@ -18831,10 +18565,10 @@ NMD::Pool NMD::POOL32Axf_5_group3[32] = {
        0xfc00ffff, 0x2000df7f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group3~*(15) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000e17f, &NMD::RDPGPR           , 0,
+       0xfc00ffff, 0x2000e17f, &RDPGPR           , 0,
        CP0_                },        /* RDPGPR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000e37f, &NMD::DERET            , 0,
+       0xfc00ffff, 0x2000e37f, &DERET            , 0,
        EJTAG_              },        /* DERET */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000e57f, 0                      , 0,
@@ -18855,7 +18589,7 @@ NMD::Pool NMD::POOL32Axf_5_group3[32] = {
        0xfc00ffff, 0x2000ef7f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group3~*(23) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000f17f, &NMD::WRPGPR           , 0,
+       0xfc00ffff, 0x2000f17f, &WRPGPR           , 0,
        CP0_                },        /* WRPGPR */
     { pool                , ERETx               , 2   , 32,
        0xfc00ffff, 0x2000f37f, 0                      , 0,
@@ -18881,7 +18615,7 @@ NMD::Pool NMD::POOL32Axf_5_group3[32] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_5[4] = {
+static struct Pool POOL32Axf_5[4] = {
     { pool                , POOL32Axf_5_group0  , 32  , 32,
        0xfc00c1ff, 0x2000017f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group0 */
@@ -18897,25 +18631,25 @@ NMD::Pool NMD::POOL32Axf_5[4] = {
 };
 
 
-NMD::Pool NMD::SHRA__R__QB[2] = {
+static struct Pool SHRA__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc001fff, 0x200001ff, &NMD::SHRA_QB          , 0,
+       0xfc001fff, 0x200001ff, &SHRA_QB          , 0,
        DSP_                },        /* SHRA.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc001fff, 0x200011ff, &NMD::SHRA_R_QB        , 0,
+       0xfc001fff, 0x200011ff, &SHRA_R_QB        , 0,
        DSP_                },        /* SHRA_R.QB */
 };
 
 
-NMD::Pool NMD::POOL32Axf_7[8] = {
+static struct Pool POOL32Axf_7[8] = {
     { pool                , SHRA__R__QB         , 2   , 32,
        0xfc000fff, 0x200001ff, 0                      , 0,
        0x0                 },        /* SHRA[_R].QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc000fff, 0x200003ff, &NMD::SHRL_PH          , 0,
+       0xfc000fff, 0x200003ff, &SHRL_PH          , 0,
        DSP_                },        /* SHRL.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc000fff, 0x200005ff, &NMD::REPL_QB          , 0,
+       0xfc000fff, 0x200005ff, &REPL_QB          , 0,
        DSP_                },        /* REPL.QB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc000fff, 0x200007ff, 0                      , 0,
@@ -18935,7 +18669,7 @@ NMD::Pool NMD::POOL32Axf_7[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf[8] = {
+static struct Pool POOL32Axf[8] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0x2000003f, 0                      , 0,
        0x0                 },        /* POOL32Axf~*(0) */
@@ -18963,18 +18697,18 @@ NMD::Pool NMD::POOL32Axf[8] = {
 };
 
 
-NMD::Pool NMD::_POOL32A7[8] = {
+static struct Pool _POOL32A7[8] = {
     { pool                , P_LSX               , 2   , 32,
        0xfc00003f, 0x20000007, 0                      , 0,
        0x0                 },        /* P.LSX */
     { instruction         , 0                   , 0   , 32,
-       0xfc00003f, 0x2000000f, &NMD::LSA              , 0,
+       0xfc00003f, 0x2000000f, &LSA              , 0,
        0x0                 },        /* LSA */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00003f, 0x20000017, 0                      , 0,
        0x0                 },        /* _POOL32A7~*(2) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00003f, 0x2000001f, &NMD::EXTW             , 0,
+       0xfc00003f, 0x2000001f, &EXTW             , 0,
        0x0                 },        /* EXTW */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00003f, 0x20000027, 0                      , 0,
@@ -18991,18 +18725,18 @@ NMD::Pool NMD::_POOL32A7[8] = {
 };
 
 
-NMD::Pool NMD::P32A[8] = {
+static struct Pool P32A[8] = {
     { pool                , _POOL32A0           , 128 , 32,
        0xfc000007, 0x20000000, 0                      , 0,
        0x0                 },        /* _POOL32A0 */
     { instruction         , 0                   , 0   , 32,
-       0xfc000007, 0x20000001, &NMD::SPECIAL2         , 0,
+       0xfc000007, 0x20000001, &SPECIAL2         , 0,
        UDI_                },        /* SPECIAL2 */
     { instruction         , 0                   , 0   , 32,
-       0xfc000007, 0x20000002, &NMD::COP2_1           , 0,
+       0xfc000007, 0x20000002, &COP2_1           , 0,
        CP2_                },        /* COP2_1 */
     { instruction         , 0                   , 0   , 32,
-       0xfc000007, 0x20000003, &NMD::UDI              , 0,
+       0xfc000007, 0x20000003, &UDI              , 0,
        UDI_                },        /* UDI */
     { reserved_block      , 0                   , 0   , 32,
        0xfc000007, 0x20000004, 0                      , 0,
@@ -19019,44 +18753,44 @@ NMD::Pool NMD::P32A[8] = {
 };
 
 
-NMD::Pool NMD::P_GP_D[2] = {
+static struct Pool P_GP_D[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000007, 0x40000001, &NMD::LD_GP_           , 0,
+       0xfc000007, 0x40000001, &LD_GP_           , 0,
        MIPS64_             },        /* LD[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc000007, 0x40000005, &NMD::SD_GP_           , 0,
+       0xfc000007, 0x40000005, &SD_GP_           , 0,
        MIPS64_             },        /* SD[GP] */
 };
 
 
-NMD::Pool NMD::P_GP_W[4] = {
+static struct Pool P_GP_W[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000003, 0x40000000, &NMD::ADDIU_GP_W_      , 0,
+       0xfc000003, 0x40000000, &ADDIU_GP_W_      , 0,
        0x0                 },        /* ADDIU[GP.W] */
     { pool                , P_GP_D              , 2   , 32,
        0xfc000003, 0x40000001, 0                      , 0,
        0x0                 },        /* P.GP.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc000003, 0x40000002, &NMD::LW_GP_           , 0,
+       0xfc000003, 0x40000002, &LW_GP_           , 0,
        0x0                 },        /* LW[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc000003, 0x40000003, &NMD::SW_GP_           , 0,
+       0xfc000003, 0x40000003, &SW_GP_           , 0,
        0x0                 },        /* SW[GP] */
 };
 
 
-NMD::Pool NMD::POOL48I[32] = {
+static struct Pool POOL48I[32] = {
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x600000000000ull, &NMD::LI_48_           , 0,
+       0xfc1f00000000ull, 0x600000000000ull, &LI_48_           , 0,
        XMMS_               },        /* LI[48] */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x600100000000ull, &NMD::ADDIU_48_        , 0,
+       0xfc1f00000000ull, 0x600100000000ull, &ADDIU_48_        , 0,
        XMMS_               },        /* ADDIU[48] */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x600200000000ull, &NMD::ADDIU_GP48_      , 0,
+       0xfc1f00000000ull, 0x600200000000ull, &ADDIU_GP48_      , 0,
        XMMS_               },        /* ADDIU[GP48] */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x600300000000ull, &NMD::ADDIUPC_48_      , 0,
+       0xfc1f00000000ull, 0x600300000000ull, &ADDIUPC_48_      , 0,
        XMMS_               },        /* ADDIUPC[48] */
     { reserved_block      , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x600400000000ull, 0                      , 0,
@@ -19080,7 +18814,7 @@ NMD::Pool NMD::POOL48I[32] = {
        0xfc1f00000000ull, 0x600a00000000ull, 0                      , 0,
        0x0                 },        /* POOL48I~*(10) */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x600b00000000ull, &NMD::LWPC_48_         , 0,
+       0xfc1f00000000ull, 0x600b00000000ull, &LWPC_48_         , 0,
        XMMS_               },        /* LWPC[48] */
     { reserved_block      , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x600c00000000ull, 0                      , 0,
@@ -19092,13 +18826,13 @@ NMD::Pool NMD::POOL48I[32] = {
        0xfc1f00000000ull, 0x600e00000000ull, 0                      , 0,
        0x0                 },        /* POOL48I~*(14) */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x600f00000000ull, &NMD::SWPC_48_         , 0,
+       0xfc1f00000000ull, 0x600f00000000ull, &SWPC_48_         , 0,
        XMMS_               },        /* SWPC[48] */
     { reserved_block      , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x601000000000ull, 0                      , 0,
        0x0                 },        /* POOL48I~*(16) */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x601100000000ull, &NMD::DADDIU_48_       , 0,
+       0xfc1f00000000ull, 0x601100000000ull, &DADDIU_48_       , 0,
        MIPS64_             },        /* DADDIU[48] */
     { reserved_block      , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x601200000000ull, 0                      , 0,
@@ -19107,7 +18841,7 @@ NMD::Pool NMD::POOL48I[32] = {
        0xfc1f00000000ull, 0x601300000000ull, 0                      , 0,
        0x0                 },        /* POOL48I~*(19) */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x601400000000ull, &NMD::DLUI_48_         , 0,
+       0xfc1f00000000ull, 0x601400000000ull, &DLUI_48_         , 0,
        MIPS64_             },        /* DLUI[48] */
     { reserved_block      , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x601500000000ull, 0                      , 0,
@@ -19128,7 +18862,7 @@ NMD::Pool NMD::POOL48I[32] = {
        0xfc1f00000000ull, 0x601a00000000ull, 0                      , 0,
        0x0                 },        /* POOL48I~*(26) */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x601b00000000ull, &NMD::LDPC_48_         , 0,
+       0xfc1f00000000ull, 0x601b00000000ull, &LDPC_48_         , 0,
        MIPS64_             },        /* LDPC[48] */
     { reserved_block      , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x601c00000000ull, 0                      , 0,
@@ -19140,33 +18874,33 @@ NMD::Pool NMD::POOL48I[32] = {
        0xfc1f00000000ull, 0x601e00000000ull, 0                      , 0,
        0x0                 },        /* POOL48I~*(30) */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x601f00000000ull, &NMD::SDPC_48_         , 0,
+       0xfc1f00000000ull, 0x601f00000000ull, &SDPC_48_         , 0,
        MIPS64_             },        /* SDPC[48] */
 };
 
 
-NMD::Pool NMD::PP_SR[4] = {
+static struct Pool PP_SR[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc10f003, 0x80003000, &NMD::SAVE_32_         , 0,
+       0xfc10f003, 0x80003000, &SAVE_32_         , 0,
        0x0                 },        /* SAVE[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc10f003, 0x80003001, 0                      , 0,
        0x0                 },        /* PP.SR~*(1) */
     { instruction         , 0                   , 0   , 32,
-       0xfc10f003, 0x80003002, &NMD::RESTORE_32_      , 0,
+       0xfc10f003, 0x80003002, &RESTORE_32_      , 0,
        0x0                 },        /* RESTORE[32] */
     { return_instruction  , 0                   , 0   , 32,
-       0xfc10f003, 0x80003003, &NMD::RESTORE_JRC_32_  , 0,
+       0xfc10f003, 0x80003003, &RESTORE_JRC_32_  , 0,
        0x0                 },        /* RESTORE.JRC[32] */
 };
 
 
-NMD::Pool NMD::P_SR_F[8] = {
+static struct Pool P_SR_F[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc10f007, 0x80103000, &NMD::SAVEF            , 0,
+       0xfc10f007, 0x80103000, &SAVEF            , 0,
        CP1_                },        /* SAVEF */
     { instruction         , 0                   , 0   , 32,
-       0xfc10f007, 0x80103001, &NMD::RESTOREF         , 0,
+       0xfc10f007, 0x80103001, &RESTOREF         , 0,
        CP1_                },        /* RESTOREF */
     { reserved_block      , 0                   , 0   , 32,
        0xfc10f007, 0x80103002, 0                      , 0,
@@ -19189,7 +18923,7 @@ NMD::Pool NMD::P_SR_F[8] = {
 };
 
 
-NMD::Pool NMD::P_SR[2] = {
+static struct Pool P_SR[2] = {
     { pool                , PP_SR               , 4   , 32,
        0xfc10f000, 0x80003000, 0                      , 0,
        0x0                 },        /* PP.SR */
@@ -19199,26 +18933,26 @@ NMD::Pool NMD::P_SR[2] = {
 };
 
 
-NMD::Pool NMD::P_SLL[5] = {
+static struct Pool P_SLL[5] = {
     { instruction         , 0                   , 0   , 32,
-       0xffe0f1ff, 0x8000c000, &NMD::NOP_32_          , 0,
+       0xffe0f1ff, 0x8000c000, &NOP_32_          , 0,
        0x0                 },        /* NOP[32] */
     { instruction         , 0                   , 0   , 32,
-       0xffe0f1ff, 0x8000c003, &NMD::EHB              , 0,
+       0xffe0f1ff, 0x8000c003, &EHB              , 0,
        0x0                 },        /* EHB */
     { instruction         , 0                   , 0   , 32,
-       0xffe0f1ff, 0x8000c005, &NMD::PAUSE            , 0,
+       0xffe0f1ff, 0x8000c005, &PAUSE            , 0,
        0x0                 },        /* PAUSE */
     { instruction         , 0                   , 0   , 32,
-       0xffe0f1ff, 0x8000c006, &NMD::SYNC             , 0,
+       0xffe0f1ff, 0x8000c006, &SYNC             , 0,
        0x0                 },        /* SYNC */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c000, &NMD::SLL_32_          , 0,
+       0xfc00f1e0, 0x8000c000, &SLL_32_          , 0,
        0x0                 },        /* SLL[32] */
 };
 
 
-NMD::Pool NMD::P_SHIFT[16] = {
+static struct Pool P_SHIFT[16] = {
     { pool                , P_SLL               , 5   , 32,
        0xfc00f1e0, 0x8000c000, 0                      , 0,
        0x0                 },        /* P.SLL */
@@ -19226,53 +18960,53 @@ NMD::Pool NMD::P_SHIFT[16] = {
        0xfc00f1e0, 0x8000c020, 0                      , 0,
        0x0                 },        /* P.SHIFT~*(1) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c040, &NMD::SRL_32_          , 0,
+       0xfc00f1e0, 0x8000c040, &SRL_32_          , 0,
        0x0                 },        /* SRL[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00f1e0, 0x8000c060, 0                      , 0,
        0x0                 },        /* P.SHIFT~*(3) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c080, &NMD::SRA              , 0,
+       0xfc00f1e0, 0x8000c080, &SRA              , 0,
        0x0                 },        /* SRA */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00f1e0, 0x8000c0a0, 0                      , 0,
        0x0                 },        /* P.SHIFT~*(5) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c0c0, &NMD::ROTR             , 0,
+       0xfc00f1e0, 0x8000c0c0, &ROTR             , 0,
        0x0                 },        /* ROTR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00f1e0, 0x8000c0e0, 0                      , 0,
        0x0                 },        /* P.SHIFT~*(7) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c100, &NMD::DSLL             , 0,
+       0xfc00f1e0, 0x8000c100, &DSLL             , 0,
        MIPS64_             },        /* DSLL */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c120, &NMD::DSLL32           , 0,
+       0xfc00f1e0, 0x8000c120, &DSLL32           , 0,
        MIPS64_             },        /* DSLL32 */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c140, &NMD::DSRL             , 0,
+       0xfc00f1e0, 0x8000c140, &DSRL             , 0,
        MIPS64_             },        /* DSRL */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c160, &NMD::DSRL32           , 0,
+       0xfc00f1e0, 0x8000c160, &DSRL32           , 0,
        MIPS64_             },        /* DSRL32 */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c180, &NMD::DSRA             , 0,
+       0xfc00f1e0, 0x8000c180, &DSRA             , 0,
        MIPS64_             },        /* DSRA */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c1a0, &NMD::DSRA32           , 0,
+       0xfc00f1e0, 0x8000c1a0, &DSRA32           , 0,
        MIPS64_             },        /* DSRA32 */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c1c0, &NMD::DROTR            , 0,
+       0xfc00f1e0, 0x8000c1c0, &DROTR            , 0,
        MIPS64_             },        /* DROTR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c1e0, &NMD::DROTR32          , 0,
+       0xfc00f1e0, 0x8000c1e0, &DROTR32          , 0,
        MIPS64_             },        /* DROTR32 */
 };
 
 
-NMD::Pool NMD::P_ROTX[4] = {
+static struct Pool P_ROTX[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000d000, &NMD::ROTX             , 0,
+       0xfc00f820, 0x8000d000, &ROTX             , 0,
        XMMS_               },        /* ROTX */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00f820, 0x8000d020, 0                      , 0,
@@ -19286,74 +19020,74 @@ NMD::Pool NMD::P_ROTX[4] = {
 };
 
 
-NMD::Pool NMD::P_INS[4] = {
+static struct Pool P_INS[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000e000, &NMD::INS              , 0,
+       0xfc00f820, 0x8000e000, &INS              , 0,
        XMMS_               },        /* INS */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000e020, &NMD::DINSU            , 0,
+       0xfc00f820, 0x8000e020, &DINSU            , 0,
        MIPS64_             },        /* DINSU */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000e800, &NMD::DINSM            , 0,
+       0xfc00f820, 0x8000e800, &DINSM            , 0,
        MIPS64_             },        /* DINSM */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000e820, &NMD::DINS             , 0,
+       0xfc00f820, 0x8000e820, &DINS             , 0,
        MIPS64_             },        /* DINS */
 };
 
 
-NMD::Pool NMD::P_EXT[4] = {
+static struct Pool P_EXT[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000f000, &NMD::EXT              , 0,
+       0xfc00f820, 0x8000f000, &EXT              , 0,
        XMMS_               },        /* EXT */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000f020, &NMD::DEXTU            , 0,
+       0xfc00f820, 0x8000f020, &DEXTU            , 0,
        MIPS64_             },        /* DEXTU */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000f800, &NMD::DEXTM            , 0,
+       0xfc00f820, 0x8000f800, &DEXTM            , 0,
        MIPS64_             },        /* DEXTM */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000f820, &NMD::DEXT             , 0,
+       0xfc00f820, 0x8000f820, &DEXT             , 0,
        MIPS64_             },        /* DEXT */
 };
 
 
-NMD::Pool NMD::P_U12[16] = {
+static struct Pool P_U12[16] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80000000, &NMD::ORI              , 0,
+       0xfc00f000, 0x80000000, &ORI              , 0,
        0x0                 },        /* ORI */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80001000, &NMD::XORI             , 0,
+       0xfc00f000, 0x80001000, &XORI             , 0,
        0x0                 },        /* XORI */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80002000, &NMD::ANDI_32_         , 0,
+       0xfc00f000, 0x80002000, &ANDI_32_         , 0,
        0x0                 },        /* ANDI[32] */
     { pool                , P_SR                , 2   , 32,
        0xfc00f000, 0x80003000, 0                      , 0,
        0x0                 },        /* P.SR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80004000, &NMD::SLTI             , 0,
+       0xfc00f000, 0x80004000, &SLTI             , 0,
        0x0                 },        /* SLTI */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80005000, &NMD::SLTIU            , 0,
+       0xfc00f000, 0x80005000, &SLTIU            , 0,
        0x0                 },        /* SLTIU */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80006000, &NMD::SEQI             , 0,
+       0xfc00f000, 0x80006000, &SEQI             , 0,
        0x0                 },        /* SEQI */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00f000, 0x80007000, 0                      , 0,
        0x0                 },        /* P.U12~*(7) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80008000, &NMD::ADDIU_NEG_       , 0,
+       0xfc00f000, 0x80008000, &ADDIU_NEG_       , 0,
        0x0                 },        /* ADDIU[NEG] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80009000, &NMD::DADDIU_U12_      , 0,
+       0xfc00f000, 0x80009000, &DADDIU_U12_      , 0,
        MIPS64_             },        /* DADDIU[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8000a000, &NMD::DADDIU_NEG_      , 0,
+       0xfc00f000, 0x8000a000, &DADDIU_NEG_      , 0,
        MIPS64_             },        /* DADDIU[NEG] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8000b000, &NMD::DROTX            , 0,
+       0xfc00f000, 0x8000b000, &DROTX            , 0,
        MIPS64_             },        /* DROTX */
     { pool                , P_SHIFT             , 16  , 32,
        0xfc00f000, 0x8000c000, 0                      , 0,
@@ -19370,19 +19104,19 @@ NMD::Pool NMD::P_U12[16] = {
 };
 
 
-NMD::Pool NMD::RINT_fmt[2] = {
+static struct Pool RINT_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000020, &NMD::RINT_S           , 0,
+       0xfc0003ff, 0xa0000020, &RINT_S           , 0,
        CP1_                },        /* RINT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000220, &NMD::RINT_D           , 0,
+       0xfc0003ff, 0xa0000220, &RINT_D           , 0,
        CP1_                },        /* RINT.D */
 };
 
 
-NMD::Pool NMD::ADD_fmt0[2] = {
+static struct Pool ADD_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000030, &NMD::ADD_S            , 0,
+       0xfc0003ff, 0xa0000030, &ADD_S            , 0,
        CP1_                },        /* ADD.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000230, 0                      , 0,
@@ -19390,29 +19124,29 @@ NMD::Pool NMD::ADD_fmt0[2] = {
 };
 
 
-NMD::Pool NMD::SELEQZ_fmt[2] = {
+static struct Pool SELEQZ_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000038, &NMD::SELEQZ_S         , 0,
+       0xfc0003ff, 0xa0000038, &SELEQZ_S         , 0,
        CP1_                },        /* SELEQZ.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000238, &NMD::SELEQZ_D         , 0,
+       0xfc0003ff, 0xa0000238, &SELEQZ_D         , 0,
        CP1_                },        /* SELEQZ.D */
 };
 
 
-NMD::Pool NMD::CLASS_fmt[2] = {
+static struct Pool CLASS_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000060, &NMD::CLASS_S          , 0,
+       0xfc0003ff, 0xa0000060, &CLASS_S          , 0,
        CP1_                },        /* CLASS.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000260, &NMD::CLASS_D          , 0,
+       0xfc0003ff, 0xa0000260, &CLASS_D          , 0,
        CP1_                },        /* CLASS.D */
 };
 
 
-NMD::Pool NMD::SUB_fmt0[2] = {
+static struct Pool SUB_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000070, &NMD::SUB_S            , 0,
+       0xfc0003ff, 0xa0000070, &SUB_S            , 0,
        CP1_                },        /* SUB.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000270, 0                      , 0,
@@ -19420,19 +19154,19 @@ NMD::Pool NMD::SUB_fmt0[2] = {
 };
 
 
-NMD::Pool NMD::SELNEZ_fmt[2] = {
+static struct Pool SELNEZ_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000078, &NMD::SELNEZ_S         , 0,
+       0xfc0003ff, 0xa0000078, &SELNEZ_S         , 0,
        CP1_                },        /* SELNEZ.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000278, &NMD::SELNEZ_D         , 0,
+       0xfc0003ff, 0xa0000278, &SELNEZ_D         , 0,
        CP1_                },        /* SELNEZ.D */
 };
 
 
-NMD::Pool NMD::MUL_fmt0[2] = {
+static struct Pool MUL_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00000b0, &NMD::MUL_S            , 0,
+       0xfc0003ff, 0xa00000b0, &MUL_S            , 0,
        CP1_                },        /* MUL.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa00002b0, 0                      , 0,
@@ -19440,19 +19174,19 @@ NMD::Pool NMD::MUL_fmt0[2] = {
 };
 
 
-NMD::Pool NMD::SEL_fmt[2] = {
+static struct Pool SEL_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00000b8, &NMD::SEL_S            , 0,
+       0xfc0003ff, 0xa00000b8, &SEL_S            , 0,
        CP1_                },        /* SEL.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00002b8, &NMD::SEL_D            , 0,
+       0xfc0003ff, 0xa00002b8, &SEL_D            , 0,
        CP1_                },        /* SEL.D */
 };
 
 
-NMD::Pool NMD::DIV_fmt0[2] = {
+static struct Pool DIV_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00000f0, &NMD::DIV_S            , 0,
+       0xfc0003ff, 0xa00000f0, &DIV_S            , 0,
        CP1_                },        /* DIV.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa00002f0, 0                      , 0,
@@ -19460,9 +19194,9 @@ NMD::Pool NMD::DIV_fmt0[2] = {
 };
 
 
-NMD::Pool NMD::ADD_fmt1[2] = {
+static struct Pool ADD_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000130, &NMD::ADD_D            , 0,
+       0xfc0003ff, 0xa0000130, &ADD_D            , 0,
        CP1_                },        /* ADD.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000330, 0                      , 0,
@@ -19470,9 +19204,9 @@ NMD::Pool NMD::ADD_fmt1[2] = {
 };
 
 
-NMD::Pool NMD::SUB_fmt1[2] = {
+static struct Pool SUB_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000170, &NMD::SUB_D            , 0,
+       0xfc0003ff, 0xa0000170, &SUB_D            , 0,
        CP1_                },        /* SUB.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000370, 0                      , 0,
@@ -19480,9 +19214,9 @@ NMD::Pool NMD::SUB_fmt1[2] = {
 };
 
 
-NMD::Pool NMD::MUL_fmt1[2] = {
+static struct Pool MUL_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00001b0, &NMD::MUL_D            , 0,
+       0xfc0003ff, 0xa00001b0, &MUL_D            , 0,
        CP1_                },        /* MUL.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa00003b0, 0                      , 0,
@@ -19490,19 +19224,19 @@ NMD::Pool NMD::MUL_fmt1[2] = {
 };
 
 
-NMD::Pool NMD::MADDF_fmt[2] = {
+static struct Pool MADDF_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00001b8, &NMD::MADDF_S          , 0,
+       0xfc0003ff, 0xa00001b8, &MADDF_S          , 0,
        CP1_                },        /* MADDF.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00003b8, &NMD::MADDF_D          , 0,
+       0xfc0003ff, 0xa00003b8, &MADDF_D          , 0,
        CP1_                },        /* MADDF.D */
 };
 
 
-NMD::Pool NMD::DIV_fmt1[2] = {
+static struct Pool DIV_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00001f0, &NMD::DIV_D            , 0,
+       0xfc0003ff, 0xa00001f0, &DIV_D            , 0,
        CP1_                },        /* DIV.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa00003f0, 0                      , 0,
@@ -19510,17 +19244,17 @@ NMD::Pool NMD::DIV_fmt1[2] = {
 };
 
 
-NMD::Pool NMD::MSUBF_fmt[2] = {
+static struct Pool MSUBF_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00001f8, &NMD::MSUBF_S          , 0,
+       0xfc0003ff, 0xa00001f8, &MSUBF_S          , 0,
        CP1_                },        /* MSUBF.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00003f8, &NMD::MSUBF_D          , 0,
+       0xfc0003ff, 0xa00003f8, &MSUBF_D          , 0,
        CP1_                },        /* MSUBF.D */
 };
 
 
-NMD::Pool NMD::POOL32F_0[64] = {
+static struct Pool POOL32F_0[64] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xa0000000, 0                      , 0,
        CP1_                },        /* POOL32F_0~*(0) */
@@ -19716,177 +19450,177 @@ NMD::Pool NMD::POOL32F_0[64] = {
 };
 
 
-NMD::Pool NMD::MIN_fmt[2] = {
+static struct Pool MIN_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa0000003, &NMD::MIN_S            , 0,
+       0xfc00023f, 0xa0000003, &MIN_S            , 0,
        CP1_                },        /* MIN.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa0000203, &NMD::MIN_D            , 0,
+       0xfc00023f, 0xa0000203, &MIN_D            , 0,
        CP1_                },        /* MIN.D */
 };
 
 
-NMD::Pool NMD::MAX_fmt[2] = {
+static struct Pool MAX_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa000000b, &NMD::MAX_S            , 0,
+       0xfc00023f, 0xa000000b, &MAX_S            , 0,
        CP1_                },        /* MAX.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa000020b, &NMD::MAX_D            , 0,
+       0xfc00023f, 0xa000020b, &MAX_D            , 0,
        CP1_                },        /* MAX.D */
 };
 
 
-NMD::Pool NMD::MINA_fmt[2] = {
+static struct Pool MINA_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa0000023, &NMD::MINA_S           , 0,
+       0xfc00023f, 0xa0000023, &MINA_S           , 0,
        CP1_                },        /* MINA.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa0000223, &NMD::MINA_D           , 0,
+       0xfc00023f, 0xa0000223, &MINA_D           , 0,
        CP1_                },        /* MINA.D */
 };
 
 
-NMD::Pool NMD::MAXA_fmt[2] = {
+static struct Pool MAXA_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa000002b, &NMD::MAXA_S           , 0,
+       0xfc00023f, 0xa000002b, &MAXA_S           , 0,
        CP1_                },        /* MAXA.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa000022b, &NMD::MAXA_D           , 0,
+       0xfc00023f, 0xa000022b, &MAXA_D           , 0,
        CP1_                },        /* MAXA.D */
 };
 
 
-NMD::Pool NMD::CVT_L_fmt[2] = {
+static struct Pool CVT_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000013b, &NMD::CVT_L_S          , 0,
+       0xfc007fff, 0xa000013b, &CVT_L_S          , 0,
        CP1_                },        /* CVT.L.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000413b, &NMD::CVT_L_D          , 0,
+       0xfc007fff, 0xa000413b, &CVT_L_D          , 0,
        CP1_                },        /* CVT.L.D */
 };
 
 
-NMD::Pool NMD::RSQRT_fmt[2] = {
+static struct Pool RSQRT_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000023b, &NMD::RSQRT_S          , 0,
+       0xfc007fff, 0xa000023b, &RSQRT_S          , 0,
        CP1_                },        /* RSQRT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000423b, &NMD::RSQRT_D          , 0,
+       0xfc007fff, 0xa000423b, &RSQRT_D          , 0,
        CP1_                },        /* RSQRT.D */
 };
 
 
-NMD::Pool NMD::FLOOR_L_fmt[2] = {
+static struct Pool FLOOR_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000033b, &NMD::FLOOR_L_S        , 0,
+       0xfc007fff, 0xa000033b, &FLOOR_L_S        , 0,
        CP1_                },        /* FLOOR.L.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000433b, &NMD::FLOOR_L_D        , 0,
+       0xfc007fff, 0xa000433b, &FLOOR_L_D        , 0,
        CP1_                },        /* FLOOR.L.D */
 };
 
 
-NMD::Pool NMD::CVT_W_fmt[2] = {
+static struct Pool CVT_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000093b, &NMD::CVT_W_S          , 0,
+       0xfc007fff, 0xa000093b, &CVT_W_S          , 0,
        CP1_                },        /* CVT.W.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000493b, &NMD::CVT_W_D          , 0,
+       0xfc007fff, 0xa000493b, &CVT_W_D          , 0,
        CP1_                },        /* CVT.W.D */
 };
 
 
-NMD::Pool NMD::SQRT_fmt[2] = {
+static struct Pool SQRT_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0000a3b, &NMD::SQRT_S           , 0,
+       0xfc007fff, 0xa0000a3b, &SQRT_S           , 0,
        CP1_                },        /* SQRT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0004a3b, &NMD::SQRT_D           , 0,
+       0xfc007fff, 0xa0004a3b, &SQRT_D           , 0,
        CP1_                },        /* SQRT.D */
 };
 
 
-NMD::Pool NMD::FLOOR_W_fmt[2] = {
+static struct Pool FLOOR_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0000b3b, &NMD::FLOOR_W_S        , 0,
+       0xfc007fff, 0xa0000b3b, &FLOOR_W_S        , 0,
        CP1_                },        /* FLOOR.W.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0004b3b, &NMD::FLOOR_W_D        , 0,
+       0xfc007fff, 0xa0004b3b, &FLOOR_W_D        , 0,
        CP1_                },        /* FLOOR.W.D */
 };
 
 
-NMD::Pool NMD::RECIP_fmt[2] = {
+static struct Pool RECIP_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000123b, &NMD::RECIP_S          , 0,
+       0xfc007fff, 0xa000123b, &RECIP_S          , 0,
        CP1_                },        /* RECIP.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000523b, &NMD::RECIP_D          , 0,
+       0xfc007fff, 0xa000523b, &RECIP_D          , 0,
        CP1_                },        /* RECIP.D */
 };
 
 
-NMD::Pool NMD::CEIL_L_fmt[2] = {
+static struct Pool CEIL_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000133b, &NMD::CEIL_L_S         , 0,
+       0xfc007fff, 0xa000133b, &CEIL_L_S         , 0,
        CP1_                },        /* CEIL.L.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000533b, &NMD::CEIL_L_D         , 0,
+       0xfc007fff, 0xa000533b, &CEIL_L_D         , 0,
        CP1_                },        /* CEIL.L.D */
 };
 
 
-NMD::Pool NMD::CEIL_W_fmt[2] = {
+static struct Pool CEIL_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0001b3b, &NMD::CEIL_W_S         , 0,
+       0xfc007fff, 0xa0001b3b, &CEIL_W_S         , 0,
        CP1_                },        /* CEIL.W.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0005b3b, &NMD::CEIL_W_D         , 0,
+       0xfc007fff, 0xa0005b3b, &CEIL_W_D         , 0,
        CP1_                },        /* CEIL.W.D */
 };
 
 
-NMD::Pool NMD::TRUNC_L_fmt[2] = {
+static struct Pool TRUNC_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000233b, &NMD::TRUNC_L_S        , 0,
+       0xfc007fff, 0xa000233b, &TRUNC_L_S        , 0,
        CP1_                },        /* TRUNC.L.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000633b, &NMD::TRUNC_L_D        , 0,
+       0xfc007fff, 0xa000633b, &TRUNC_L_D        , 0,
        CP1_                },        /* TRUNC.L.D */
 };
 
 
-NMD::Pool NMD::TRUNC_W_fmt[2] = {
+static struct Pool TRUNC_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0002b3b, &NMD::TRUNC_W_S        , 0,
+       0xfc007fff, 0xa0002b3b, &TRUNC_W_S        , 0,
        CP1_                },        /* TRUNC.W.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0006b3b, &NMD::TRUNC_W_D        , 0,
+       0xfc007fff, 0xa0006b3b, &TRUNC_W_D        , 0,
        CP1_                },        /* TRUNC.W.D */
 };
 
 
-NMD::Pool NMD::ROUND_L_fmt[2] = {
+static struct Pool ROUND_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000333b, &NMD::ROUND_L_S        , 0,
+       0xfc007fff, 0xa000333b, &ROUND_L_S        , 0,
        CP1_                },        /* ROUND.L.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000733b, &NMD::ROUND_L_D        , 0,
+       0xfc007fff, 0xa000733b, &ROUND_L_D        , 0,
        CP1_                },        /* ROUND.L.D */
 };
 
 
-NMD::Pool NMD::ROUND_W_fmt[2] = {
+static struct Pool ROUND_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0003b3b, &NMD::ROUND_W_S        , 0,
+       0xfc007fff, 0xa0003b3b, &ROUND_W_S        , 0,
        CP1_                },        /* ROUND.W.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0007b3b, &NMD::ROUND_W_D        , 0,
+       0xfc007fff, 0xa0007b3b, &ROUND_W_D        , 0,
        CP1_                },        /* ROUND.W.D */
 };
 
 
-NMD::Pool NMD::POOL32Fxf_0[64] = {
+static struct Pool POOL32Fxf_0[64] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000003b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(0) */
@@ -19936,7 +19670,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa0000f3b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(15) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000103b, &NMD::CFC1             , 0,
+       0xfc003fff, 0xa000103b, &CFC1             , 0,
        CP1_                },        /* CFC1 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000113b, 0                      , 0,
@@ -19960,7 +19694,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa000173b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(23) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000183b, &NMD::CTC1             , 0,
+       0xfc003fff, 0xa000183b, &CTC1             , 0,
        CP1_                },        /* CTC1 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000193b, 0                      , 0,
@@ -19984,10 +19718,10 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa0001f3b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(31) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000203b, &NMD::MFC1             , 0,
+       0xfc003fff, 0xa000203b, &MFC1             , 0,
        CP1_                },        /* MFC1 */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000213b, &NMD::CVT_S_PL         , 0,
+       0xfc003fff, 0xa000213b, &CVT_S_PL         , 0,
        CP1_                },        /* CVT.S.PL */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000223b, 0                      , 0,
@@ -19996,7 +19730,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa000233b, 0                      , 0,
        CP1_                },        /* TRUNC.L.fmt */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000243b, &NMD::DMFC1            , 0,
+       0xfc003fff, 0xa000243b, &DMFC1            , 0,
        CP1_ | MIPS64_      },        /* DMFC1 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000253b, 0                      , 0,
@@ -20008,10 +19742,10 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa000273b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(39) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000283b, &NMD::MTC1             , 0,
+       0xfc003fff, 0xa000283b, &MTC1             , 0,
        CP1_                },        /* MTC1 */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000293b, &NMD::CVT_S_PU         , 0,
+       0xfc003fff, 0xa000293b, &CVT_S_PU         , 0,
        CP1_                },        /* CVT.S.PU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa0002a3b, 0                      , 0,
@@ -20020,7 +19754,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa0002b3b, 0                      , 0,
        CP1_                },        /* TRUNC.W.fmt */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa0002c3b, &NMD::DMTC1            , 0,
+       0xfc003fff, 0xa0002c3b, &DMTC1            , 0,
        CP1_ | MIPS64_      },        /* DMTC1 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa0002d3b, 0                      , 0,
@@ -20032,7 +19766,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa0002f3b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(47) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000303b, &NMD::MFHC1            , 0,
+       0xfc003fff, 0xa000303b, &MFHC1            , 0,
        CP1_                },        /* MFHC1 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000313b, 0                      , 0,
@@ -20056,7 +19790,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa000373b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(55) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000383b, &NMD::MTHC1            , 0,
+       0xfc003fff, 0xa000383b, &MTHC1            , 0,
        CP1_                },        /* MTHC1 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000393b, 0                      , 0,
@@ -20082,12 +19816,12 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
 };
 
 
-NMD::Pool NMD::MOV_fmt[4] = {
+static struct Pool MOV_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000007b, &NMD::MOV_S            , 0,
+       0xfc007fff, 0xa000007b, &MOV_S            , 0,
        CP1_                },        /* MOV.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000207b, &NMD::MOV_D            , 0,
+       0xfc007fff, 0xa000207b, &MOV_D            , 0,
        CP1_                },        /* MOV.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007fff, 0xa000407b, 0                      , 0,
@@ -20098,12 +19832,12 @@ NMD::Pool NMD::MOV_fmt[4] = {
 };
 
 
-NMD::Pool NMD::ABS_fmt[4] = {
+static struct Pool ABS_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000037b, &NMD::ABS_S            , 0,
+       0xfc007fff, 0xa000037b, &ABS_S            , 0,
        CP1_                },        /* ABS.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000237b, &NMD::ABS_D            , 0,
+       0xfc007fff, 0xa000237b, &ABS_D            , 0,
        CP1_                },        /* ABS.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007fff, 0xa000437b, 0                      , 0,
@@ -20114,12 +19848,12 @@ NMD::Pool NMD::ABS_fmt[4] = {
 };
 
 
-NMD::Pool NMD::NEG_fmt[4] = {
+static struct Pool NEG_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0000b7b, &NMD::NEG_S            , 0,
+       0xfc007fff, 0xa0000b7b, &NEG_S            , 0,
        CP1_                },        /* NEG.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0002b7b, &NMD::NEG_D            , 0,
+       0xfc007fff, 0xa0002b7b, &NEG_D            , 0,
        CP1_                },        /* NEG.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007fff, 0xa0004b7b, 0                      , 0,
@@ -20130,15 +19864,15 @@ NMD::Pool NMD::NEG_fmt[4] = {
 };
 
 
-NMD::Pool NMD::CVT_D_fmt[4] = {
+static struct Pool CVT_D_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000137b, &NMD::CVT_D_S          , 0,
+       0xfc007fff, 0xa000137b, &CVT_D_S          , 0,
        CP1_                },        /* CVT.D.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000337b, &NMD::CVT_D_W          , 0,
+       0xfc007fff, 0xa000337b, &CVT_D_W          , 0,
        CP1_                },        /* CVT.D.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000537b, &NMD::CVT_D_L          , 0,
+       0xfc007fff, 0xa000537b, &CVT_D_L          , 0,
        CP1_                },        /* CVT.D.L */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007fff, 0xa000737b, 0                      , 0,
@@ -20146,15 +19880,15 @@ NMD::Pool NMD::CVT_D_fmt[4] = {
 };
 
 
-NMD::Pool NMD::CVT_S_fmt[4] = {
+static struct Pool CVT_S_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0001b7b, &NMD::CVT_S_D          , 0,
+       0xfc007fff, 0xa0001b7b, &CVT_S_D          , 0,
        CP1_                },        /* CVT.S.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0003b7b, &NMD::CVT_S_W          , 0,
+       0xfc007fff, 0xa0003b7b, &CVT_S_W          , 0,
        CP1_                },        /* CVT.S.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0005b7b, &NMD::CVT_S_L          , 0,
+       0xfc007fff, 0xa0005b7b, &CVT_S_L          , 0,
        CP1_                },        /* CVT.S.L */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007fff, 0xa0007b7b, 0                      , 0,
@@ -20162,7 +19896,7 @@ NMD::Pool NMD::CVT_S_fmt[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Fxf_1[32] = {
+static struct Pool POOL32Fxf_1[32] = {
     { pool                , MOV_fmt             , 4   , 32,
        0xfc001fff, 0xa000007b, 0                      , 0,
        CP1_                },        /* MOV.fmt */
@@ -20262,7 +19996,7 @@ NMD::Pool NMD::POOL32Fxf_1[32] = {
 };
 
 
-NMD::Pool NMD::POOL32Fxf[4] = {
+static struct Pool POOL32Fxf[4] = {
     { pool                , POOL32Fxf_0         , 64  , 32,
        0xfc0000ff, 0xa000003b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0 */
@@ -20278,7 +20012,7 @@ NMD::Pool NMD::POOL32Fxf[4] = {
 };
 
 
-NMD::Pool NMD::POOL32F_3[8] = {
+static struct Pool POOL32F_3[8] = {
     { pool                , MIN_fmt             , 2   , 32,
        0xfc00003f, 0xa0000003, 0                      , 0,
        CP1_                },        /* MIN.fmt */
@@ -20306,66 +20040,66 @@ NMD::Pool NMD::POOL32F_3[8] = {
 };
 
 
-NMD::Pool NMD::CMP_condn_S[32] = {
+static struct Pool CMP_condn_S[32] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000005, &NMD::CMP_AF_S         , 0,
+       0xfc0007ff, 0xa0000005, &CMP_AF_S         , 0,
        CP1_                },        /* CMP.AF.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000045, &NMD::CMP_UN_S         , 0,
+       0xfc0007ff, 0xa0000045, &CMP_UN_S         , 0,
        CP1_                },        /* CMP.UN.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000085, &NMD::CMP_EQ_S         , 0,
+       0xfc0007ff, 0xa0000085, &CMP_EQ_S         , 0,
        CP1_                },        /* CMP.EQ.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00000c5, &NMD::CMP_UEQ_S        , 0,
+       0xfc0007ff, 0xa00000c5, &CMP_UEQ_S        , 0,
        CP1_                },        /* CMP.UEQ.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000105, &NMD::CMP_LT_S         , 0,
+       0xfc0007ff, 0xa0000105, &CMP_LT_S         , 0,
        CP1_                },        /* CMP.LT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000145, &NMD::CMP_ULT_S        , 0,
+       0xfc0007ff, 0xa0000145, &CMP_ULT_S        , 0,
        CP1_                },        /* CMP.ULT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000185, &NMD::CMP_LE_S         , 0,
+       0xfc0007ff, 0xa0000185, &CMP_LE_S         , 0,
        CP1_                },        /* CMP.LE.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00001c5, &NMD::CMP_ULE_S        , 0,
+       0xfc0007ff, 0xa00001c5, &CMP_ULE_S        , 0,
        CP1_                },        /* CMP.ULE.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000205, &NMD::CMP_SAF_S        , 0,
+       0xfc0007ff, 0xa0000205, &CMP_SAF_S        , 0,
        CP1_                },        /* CMP.SAF.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000245, &NMD::CMP_SUN_S        , 0,
+       0xfc0007ff, 0xa0000245, &CMP_SUN_S        , 0,
        CP1_                },        /* CMP.SUN.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000285, &NMD::CMP_SEQ_S        , 0,
+       0xfc0007ff, 0xa0000285, &CMP_SEQ_S        , 0,
        CP1_                },        /* CMP.SEQ.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00002c5, &NMD::CMP_SUEQ_S       , 0,
+       0xfc0007ff, 0xa00002c5, &CMP_SUEQ_S       , 0,
        CP1_                },        /* CMP.SUEQ.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000305, &NMD::CMP_SLT_S        , 0,
+       0xfc0007ff, 0xa0000305, &CMP_SLT_S        , 0,
        CP1_                },        /* CMP.SLT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000345, &NMD::CMP_SULT_S       , 0,
+       0xfc0007ff, 0xa0000345, &CMP_SULT_S       , 0,
        CP1_                },        /* CMP.SULT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000385, &NMD::CMP_SLE_S        , 0,
+       0xfc0007ff, 0xa0000385, &CMP_SLE_S        , 0,
        CP1_                },        /* CMP.SLE.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00003c5, &NMD::CMP_SULE_S       , 0,
+       0xfc0007ff, 0xa00003c5, &CMP_SULE_S       , 0,
        CP1_                },        /* CMP.SULE.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000405, 0                      , 0,
        CP1_                },        /* CMP.condn.S~*(16) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000445, &NMD::CMP_OR_S         , 0,
+       0xfc0007ff, 0xa0000445, &CMP_OR_S         , 0,
        CP1_                },        /* CMP.OR.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000485, &NMD::CMP_UNE_S        , 0,
+       0xfc0007ff, 0xa0000485, &CMP_UNE_S        , 0,
        CP1_                },        /* CMP.UNE.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00004c5, &NMD::CMP_NE_S         , 0,
+       0xfc0007ff, 0xa00004c5, &CMP_NE_S         , 0,
        CP1_                },        /* CMP.NE.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000505, 0                      , 0,
@@ -20383,13 +20117,13 @@ NMD::Pool NMD::CMP_condn_S[32] = {
        0xfc0007ff, 0xa0000605, 0                      , 0,
        CP1_                },        /* CMP.condn.S~*(24) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000645, &NMD::CMP_SOR_S        , 0,
+       0xfc0007ff, 0xa0000645, &CMP_SOR_S        , 0,
        CP1_                },        /* CMP.SOR.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000685, &NMD::CMP_SUNE_S       , 0,
+       0xfc0007ff, 0xa0000685, &CMP_SUNE_S       , 0,
        CP1_                },        /* CMP.SUNE.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00006c5, &NMD::CMP_SNE_S        , 0,
+       0xfc0007ff, 0xa00006c5, &CMP_SNE_S        , 0,
        CP1_                },        /* CMP.SNE.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000705, 0                      , 0,
@@ -20406,66 +20140,66 @@ NMD::Pool NMD::CMP_condn_S[32] = {
 };
 
 
-NMD::Pool NMD::CMP_condn_D[32] = {
+static struct Pool CMP_condn_D[32] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000015, &NMD::CMP_AF_D         , 0,
+       0xfc0007ff, 0xa0000015, &CMP_AF_D         , 0,
        CP1_                },        /* CMP.AF.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000055, &NMD::CMP_UN_D         , 0,
+       0xfc0007ff, 0xa0000055, &CMP_UN_D         , 0,
        CP1_                },        /* CMP.UN.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000095, &NMD::CMP_EQ_D         , 0,
+       0xfc0007ff, 0xa0000095, &CMP_EQ_D         , 0,
        CP1_                },        /* CMP.EQ.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00000d5, &NMD::CMP_UEQ_D        , 0,
+       0xfc0007ff, 0xa00000d5, &CMP_UEQ_D        , 0,
        CP1_                },        /* CMP.UEQ.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000115, &NMD::CMP_LT_D         , 0,
+       0xfc0007ff, 0xa0000115, &CMP_LT_D         , 0,
        CP1_                },        /* CMP.LT.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000155, &NMD::CMP_ULT_D        , 0,
+       0xfc0007ff, 0xa0000155, &CMP_ULT_D        , 0,
        CP1_                },        /* CMP.ULT.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000195, &NMD::CMP_LE_D         , 0,
+       0xfc0007ff, 0xa0000195, &CMP_LE_D         , 0,
        CP1_                },        /* CMP.LE.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00001d5, &NMD::CMP_ULE_D        , 0,
+       0xfc0007ff, 0xa00001d5, &CMP_ULE_D        , 0,
        CP1_                },        /* CMP.ULE.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000215, &NMD::CMP_SAF_D        , 0,
+       0xfc0007ff, 0xa0000215, &CMP_SAF_D        , 0,
        CP1_                },        /* CMP.SAF.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000255, &NMD::CMP_SUN_D        , 0,
+       0xfc0007ff, 0xa0000255, &CMP_SUN_D        , 0,
        CP1_                },        /* CMP.SUN.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000295, &NMD::CMP_SEQ_D        , 0,
+       0xfc0007ff, 0xa0000295, &CMP_SEQ_D        , 0,
        CP1_                },        /* CMP.SEQ.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00002d5, &NMD::CMP_SUEQ_D       , 0,
+       0xfc0007ff, 0xa00002d5, &CMP_SUEQ_D       , 0,
        CP1_                },        /* CMP.SUEQ.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000315, &NMD::CMP_SLT_D        , 0,
+       0xfc0007ff, 0xa0000315, &CMP_SLT_D        , 0,
        CP1_                },        /* CMP.SLT.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000355, &NMD::CMP_SULT_D       , 0,
+       0xfc0007ff, 0xa0000355, &CMP_SULT_D       , 0,
        CP1_                },        /* CMP.SULT.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000395, &NMD::CMP_SLE_D        , 0,
+       0xfc0007ff, 0xa0000395, &CMP_SLE_D        , 0,
        CP1_                },        /* CMP.SLE.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00003d5, &NMD::CMP_SULE_D       , 0,
+       0xfc0007ff, 0xa00003d5, &CMP_SULE_D       , 0,
        CP1_                },        /* CMP.SULE.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000415, 0                      , 0,
        CP1_                },        /* CMP.condn.D~*(16) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000455, &NMD::CMP_OR_D         , 0,
+       0xfc0007ff, 0xa0000455, &CMP_OR_D         , 0,
        CP1_                },        /* CMP.OR.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000495, &NMD::CMP_UNE_D        , 0,
+       0xfc0007ff, 0xa0000495, &CMP_UNE_D        , 0,
        CP1_                },        /* CMP.UNE.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00004d5, &NMD::CMP_NE_D         , 0,
+       0xfc0007ff, 0xa00004d5, &CMP_NE_D         , 0,
        CP1_                },        /* CMP.NE.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000515, 0                      , 0,
@@ -20483,13 +20217,13 @@ NMD::Pool NMD::CMP_condn_D[32] = {
        0xfc0007ff, 0xa0000615, 0                      , 0,
        CP1_                },        /* CMP.condn.D~*(24) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000655, &NMD::CMP_SOR_D        , 0,
+       0xfc0007ff, 0xa0000655, &CMP_SOR_D        , 0,
        CP1_                },        /* CMP.SOR.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000695, &NMD::CMP_SUNE_D       , 0,
+       0xfc0007ff, 0xa0000695, &CMP_SUNE_D       , 0,
        CP1_                },        /* CMP.SUNE.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00006d5, &NMD::CMP_SNE_D        , 0,
+       0xfc0007ff, 0xa00006d5, &CMP_SNE_D        , 0,
        CP1_                },        /* CMP.SNE.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000715, 0                      , 0,
@@ -20506,7 +20240,7 @@ NMD::Pool NMD::CMP_condn_D[32] = {
 };
 
 
-NMD::Pool NMD::POOL32F_5[8] = {
+static struct Pool POOL32F_5[8] = {
     { pool                , CMP_condn_S         , 32  , 32,
        0xfc00003f, 0xa0000005, 0                      , 0,
        CP1_                },        /* CMP.condn.S */
@@ -20534,7 +20268,7 @@ NMD::Pool NMD::POOL32F_5[8] = {
 };
 
 
-NMD::Pool NMD::POOL32F[8] = {
+static struct Pool POOL32F[8] = {
     { pool                , POOL32F_0           , 64  , 32,
        0xfc000007, 0xa0000000, 0                      , 0,
        CP1_                },        /* POOL32F_0 */
@@ -20562,18 +20296,18 @@ NMD::Pool NMD::POOL32F[8] = {
 };
 
 
-NMD::Pool NMD::POOL32S_0[64] = {
+static struct Pool POOL32S_0[64] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc0000000, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(0) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000008, &NMD::DLSA             , 0,
+       0xfc0001ff, 0xc0000008, &DLSA             , 0,
        MIPS64_             },        /* DLSA */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000010, &NMD::DSLLV            , 0,
+       0xfc0001ff, 0xc0000010, &DSLLV            , 0,
        MIPS64_             },        /* DSLLV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000018, &NMD::DMUL             , 0,
+       0xfc0001ff, 0xc0000018, &DMUL             , 0,
        MIPS64_             },        /* DMUL */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc0000020, 0                      , 0,
@@ -20594,10 +20328,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc0000048, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(9) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000050, &NMD::DSRLV            , 0,
+       0xfc0001ff, 0xc0000050, &DSRLV            , 0,
        MIPS64_             },        /* DSRLV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000058, &NMD::DMUH             , 0,
+       0xfc0001ff, 0xc0000058, &DMUH             , 0,
        MIPS64_             },        /* DMUH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc0000060, 0                      , 0,
@@ -20618,10 +20352,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc0000088, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(17) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000090, &NMD::DSRAV            , 0,
+       0xfc0001ff, 0xc0000090, &DSRAV            , 0,
        MIPS64_             },        /* DSRAV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000098, &NMD::DMULU            , 0,
+       0xfc0001ff, 0xc0000098, &DMULU            , 0,
        MIPS64_             },        /* DMULU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc00000a0, 0                      , 0,
@@ -20642,10 +20376,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc00000c8, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(25) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc00000d0, &NMD::DROTRV           , 0,
+       0xfc0001ff, 0xc00000d0, &DROTRV           , 0,
        MIPS64_             },        /* DROTRV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc00000d8, &NMD::DMUHU            , 0,
+       0xfc0001ff, 0xc00000d8, &DMUHU            , 0,
        MIPS64_             },        /* DMUHU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc00000e0, 0                      , 0,
@@ -20666,10 +20400,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc0000108, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(33) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000110, &NMD::DADD             , 0,
+       0xfc0001ff, 0xc0000110, &DADD             , 0,
        MIPS64_             },        /* DADD */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000118, &NMD::DDIV             , 0,
+       0xfc0001ff, 0xc0000118, &DDIV             , 0,
        MIPS64_             },        /* DDIV */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc0000120, 0                      , 0,
@@ -20690,10 +20424,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc0000148, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(41) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000150, &NMD::DADDU            , 0,
+       0xfc0001ff, 0xc0000150, &DADDU            , 0,
        MIPS64_             },        /* DADDU */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000158, &NMD::DMOD             , 0,
+       0xfc0001ff, 0xc0000158, &DMOD             , 0,
        MIPS64_             },        /* DMOD */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc0000160, 0                      , 0,
@@ -20714,10 +20448,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc0000188, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(49) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000190, &NMD::DSUB             , 0,
+       0xfc0001ff, 0xc0000190, &DSUB             , 0,
        MIPS64_             },        /* DSUB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000198, &NMD::DDIVU            , 0,
+       0xfc0001ff, 0xc0000198, &DDIVU            , 0,
        MIPS64_             },        /* DDIVU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc00001a0, 0                      , 0,
@@ -20738,10 +20472,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc00001c8, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(57) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc00001d0, &NMD::DSUBU            , 0,
+       0xfc0001ff, 0xc00001d0, &DSUBU            , 0,
        MIPS64_             },        /* DSUBU */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc00001d8, &NMD::DMODU            , 0,
+       0xfc0001ff, 0xc00001d8, &DMODU            , 0,
        MIPS64_             },        /* DMODU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc00001e0, 0                      , 0,
@@ -20758,7 +20492,7 @@ NMD::Pool NMD::POOL32S_0[64] = {
 };
 
 
-NMD::Pool NMD::POOL32Sxf_4[128] = {
+static struct Pool POOL32Sxf_4[128] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0xc000013c, 0                      , 0,
        0x0                 },        /* POOL32Sxf_4~*(0) */
@@ -20871,7 +20605,7 @@ NMD::Pool NMD::POOL32Sxf_4[128] = {
        0xfc00ffff, 0xc000493c, 0                      , 0,
        0x0                 },        /* POOL32Sxf_4~*(36) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0xc0004b3c, &NMD::DCLO             , 0,
+       0xfc00ffff, 0xc0004b3c, &DCLO             , 0,
        MIPS64_             },        /* DCLO */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0xc0004d3c, 0                      , 0,
@@ -20895,7 +20629,7 @@ NMD::Pool NMD::POOL32Sxf_4[128] = {
        0xfc00ffff, 0xc000593c, 0                      , 0,
        0x0                 },        /* POOL32Sxf_4~*(44) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0xc0005b3c, &NMD::DCLZ             , 0,
+       0xfc00ffff, 0xc0005b3c, &DCLZ             , 0,
        MIPS64_             },        /* DCLZ */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0xc0005d3c, 0                      , 0,
@@ -21146,7 +20880,7 @@ NMD::Pool NMD::POOL32Sxf_4[128] = {
 };
 
 
-NMD::Pool NMD::POOL32Sxf[8] = {
+static struct Pool POOL32Sxf[8] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc000003c, 0                      , 0,
        0x0                 },        /* POOL32Sxf~*(0) */
@@ -21174,12 +20908,12 @@ NMD::Pool NMD::POOL32Sxf[8] = {
 };
 
 
-NMD::Pool NMD::POOL32S_4[8] = {
+static struct Pool POOL32S_4[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00003f, 0xc0000004, &NMD::EXTD             , 0,
+       0xfc00003f, 0xc0000004, &EXTD             , 0,
        MIPS64_             },        /* EXTD */
     { instruction         , 0                   , 0   , 32,
-       0xfc00003f, 0xc000000c, &NMD::EXTD32           , 0,
+       0xfc00003f, 0xc000000c, &EXTD32           , 0,
        MIPS64_             },        /* EXTD32 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00003f, 0xc0000014, 0                      , 0,
@@ -21202,7 +20936,7 @@ NMD::Pool NMD::POOL32S_4[8] = {
 };
 
 
-NMD::Pool NMD::POOL32S[8] = {
+static struct Pool POOL32S[8] = {
     { pool                , POOL32S_0           , 64  , 32,
        0xfc000007, 0xc0000000, 0                      , 0,
        0x0                 },        /* POOL32S_0 */
@@ -21230,29 +20964,29 @@ NMD::Pool NMD::POOL32S[8] = {
 };
 
 
-NMD::Pool NMD::P_LUI[2] = {
+static struct Pool P_LUI[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000002, 0xe0000000, &NMD::LUI              , 0,
+       0xfc000002, 0xe0000000, &LUI              , 0,
        0x0                 },        /* LUI */
     { instruction         , 0                   , 0   , 32,
-       0xfc000002, 0xe0000002, &NMD::ALUIPC           , 0,
+       0xfc000002, 0xe0000002, &ALUIPC           , 0,
        0x0                 },        /* ALUIPC */
 };
 
 
-NMD::Pool NMD::P_GP_LH[2] = {
+static struct Pool P_GP_LH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0001, 0x44100000, &NMD::LH_GP_           , 0,
+       0xfc1c0001, 0x44100000, &LH_GP_           , 0,
        0x0                 },        /* LH[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0001, 0x44100001, &NMD::LHU_GP_          , 0,
+       0xfc1c0001, 0x44100001, &LHU_GP_          , 0,
        0x0                 },        /* LHU[GP] */
 };
 
 
-NMD::Pool NMD::P_GP_SH[2] = {
+static struct Pool P_GP_SH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0001, 0x44140000, &NMD::SH_GP_           , 0,
+       0xfc1c0001, 0x44140000, &SH_GP_           , 0,
        0x0                 },        /* SH[GP] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc1c0001, 0x44140001, 0                      , 0,
@@ -21260,25 +20994,25 @@ NMD::Pool NMD::P_GP_SH[2] = {
 };
 
 
-NMD::Pool NMD::P_GP_CP1[4] = {
+static struct Pool P_GP_CP1[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0003, 0x44180000, &NMD::LWC1_GP_         , 0,
+       0xfc1c0003, 0x44180000, &LWC1_GP_         , 0,
        CP1_                },        /* LWC1[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0003, 0x44180001, &NMD::SWC1_GP_         , 0,
+       0xfc1c0003, 0x44180001, &SWC1_GP_         , 0,
        CP1_                },        /* SWC1[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0003, 0x44180002, &NMD::LDC1_GP_         , 0,
+       0xfc1c0003, 0x44180002, &LDC1_GP_         , 0,
        CP1_                },        /* LDC1[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0003, 0x44180003, &NMD::SDC1_GP_         , 0,
+       0xfc1c0003, 0x44180003, &SDC1_GP_         , 0,
        CP1_                },        /* SDC1[GP] */
 };
 
 
-NMD::Pool NMD::P_GP_M64[4] = {
+static struct Pool P_GP_M64[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0003, 0x441c0000, &NMD::LWU_GP_          , 0,
+       0xfc1c0003, 0x441c0000, &LWU_GP_          , 0,
        MIPS64_             },        /* LWU[GP] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc1c0003, 0x441c0001, 0                      , 0,
@@ -21292,18 +21026,18 @@ NMD::Pool NMD::P_GP_M64[4] = {
 };
 
 
-NMD::Pool NMD::P_GP_BH[8] = {
+static struct Pool P_GP_BH[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0000, 0x44000000, &NMD::LB_GP_           , 0,
+       0xfc1c0000, 0x44000000, &LB_GP_           , 0,
        0x0                 },        /* LB[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0000, 0x44040000, &NMD::SB_GP_           , 0,
+       0xfc1c0000, 0x44040000, &SB_GP_           , 0,
        0x0                 },        /* SB[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0000, 0x44080000, &NMD::LBU_GP_          , 0,
+       0xfc1c0000, 0x44080000, &LBU_GP_          , 0,
        0x0                 },        /* LBU[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0000, 0x440c0000, &NMD::ADDIU_GP_B_      , 0,
+       0xfc1c0000, 0x440c0000, &ADDIU_GP_B_      , 0,
        0x0                 },        /* ADDIU[GP.B] */
     { pool                , P_GP_LH             , 2   , 32,
        0xfc1c0000, 0x44100000, 0                      , 0,
@@ -21320,136 +21054,136 @@ NMD::Pool NMD::P_GP_BH[8] = {
 };
 
 
-NMD::Pool NMD::P_LS_U12[16] = {
+static struct Pool P_LS_U12[16] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84000000, &NMD::LB_U12_          , 0,
+       0xfc00f000, 0x84000000, &LB_U12_          , 0,
        0x0                 },        /* LB[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84001000, &NMD::SB_U12_          , 0,
+       0xfc00f000, 0x84001000, &SB_U12_          , 0,
        0x0                 },        /* SB[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84002000, &NMD::LBU_U12_         , 0,
+       0xfc00f000, 0x84002000, &LBU_U12_         , 0,
        0x0                 },        /* LBU[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84003000, &NMD::PREF_U12_        , 0,
+       0xfc00f000, 0x84003000, &PREF_U12_        , 0,
        0x0                 },        /* PREF[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84004000, &NMD::LH_U12_          , 0,
+       0xfc00f000, 0x84004000, &LH_U12_          , 0,
        0x0                 },        /* LH[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84005000, &NMD::SH_U12_          , 0,
+       0xfc00f000, 0x84005000, &SH_U12_          , 0,
        0x0                 },        /* SH[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84006000, &NMD::LHU_U12_         , 0,
+       0xfc00f000, 0x84006000, &LHU_U12_         , 0,
        0x0                 },        /* LHU[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84007000, &NMD::LWU_U12_         , 0,
+       0xfc00f000, 0x84007000, &LWU_U12_         , 0,
        MIPS64_             },        /* LWU[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84008000, &NMD::LW_U12_          , 0,
+       0xfc00f000, 0x84008000, &LW_U12_          , 0,
        0x0                 },        /* LW[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84009000, &NMD::SW_U12_          , 0,
+       0xfc00f000, 0x84009000, &SW_U12_          , 0,
        0x0                 },        /* SW[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8400a000, &NMD::LWC1_U12_        , 0,
+       0xfc00f000, 0x8400a000, &LWC1_U12_        , 0,
        CP1_                },        /* LWC1[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8400b000, &NMD::SWC1_U12_        , 0,
+       0xfc00f000, 0x8400b000, &SWC1_U12_        , 0,
        CP1_                },        /* SWC1[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8400c000, &NMD::LD_U12_          , 0,
+       0xfc00f000, 0x8400c000, &LD_U12_          , 0,
        MIPS64_             },        /* LD[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8400d000, &NMD::SD_U12_          , 0,
+       0xfc00f000, 0x8400d000, &SD_U12_          , 0,
        MIPS64_             },        /* SD[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8400e000, &NMD::LDC1_U12_        , 0,
+       0xfc00f000, 0x8400e000, &LDC1_U12_        , 0,
        CP1_                },        /* LDC1[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8400f000, &NMD::SDC1_U12_        , 0,
+       0xfc00f000, 0x8400f000, &SDC1_U12_        , 0,
        CP1_                },        /* SDC1[U12] */
 };
 
 
-NMD::Pool NMD::P_PREF_S9_[2] = {
+static struct Pool P_PREF_S9_[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xffe07f00, 0xa7e01800, &NMD::SYNCI            , 0,
+       0xffe07f00, 0xa7e01800, &SYNCI            , 0,
        0x0                 },        /* SYNCI */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001800, &NMD::PREF_S9_         , &NMD::PREF_S9__cond    ,
+       0xfc007f00, 0xa4001800, &PREF_S9_         , &PREF_S9__cond    ,
        0x0                 },        /* PREF[S9] */
 };
 
 
-NMD::Pool NMD::P_LS_S0[16] = {
+static struct Pool P_LS_S0[16] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4000000, &NMD::LB_S9_           , 0,
+       0xfc007f00, 0xa4000000, &LB_S9_           , 0,
        0x0                 },        /* LB[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4000800, &NMD::SB_S9_           , 0,
+       0xfc007f00, 0xa4000800, &SB_S9_           , 0,
        0x0                 },        /* SB[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001000, &NMD::LBU_S9_          , 0,
+       0xfc007f00, 0xa4001000, &LBU_S9_          , 0,
        0x0                 },        /* LBU[S9] */
     { pool                , P_PREF_S9_          , 2   , 32,
        0xfc007f00, 0xa4001800, 0                      , 0,
        0x0                 },        /* P.PREF[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4002000, &NMD::LH_S9_           , 0,
+       0xfc007f00, 0xa4002000, &LH_S9_           , 0,
        0x0                 },        /* LH[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4002800, &NMD::SH_S9_           , 0,
+       0xfc007f00, 0xa4002800, &SH_S9_           , 0,
        0x0                 },        /* SH[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4003000, &NMD::LHU_S9_          , 0,
+       0xfc007f00, 0xa4003000, &LHU_S9_          , 0,
        0x0                 },        /* LHU[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4003800, &NMD::LWU_S9_          , 0,
+       0xfc007f00, 0xa4003800, &LWU_S9_          , 0,
        MIPS64_             },        /* LWU[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4004000, &NMD::LW_S9_           , 0,
+       0xfc007f00, 0xa4004000, &LW_S9_           , 0,
        0x0                 },        /* LW[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4004800, &NMD::SW_S9_           , 0,
+       0xfc007f00, 0xa4004800, &SW_S9_           , 0,
        0x0                 },        /* SW[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4005000, &NMD::LWC1_S9_         , 0,
+       0xfc007f00, 0xa4005000, &LWC1_S9_         , 0,
        CP1_                },        /* LWC1[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4005800, &NMD::SWC1_S9_         , 0,
+       0xfc007f00, 0xa4005800, &SWC1_S9_         , 0,
        CP1_                },        /* SWC1[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4006000, &NMD::LD_S9_           , 0,
+       0xfc007f00, 0xa4006000, &LD_S9_           , 0,
        MIPS64_             },        /* LD[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4006800, &NMD::SD_S9_           , 0,
+       0xfc007f00, 0xa4006800, &SD_S9_           , 0,
        MIPS64_             },        /* SD[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4007000, &NMD::LDC1_S9_         , 0,
+       0xfc007f00, 0xa4007000, &LDC1_S9_         , 0,
        CP1_                },        /* LDC1[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4007800, &NMD::SDC1_S9_         , 0,
+       0xfc007f00, 0xa4007800, &SDC1_S9_         , 0,
        CP1_                },        /* SDC1[S9] */
 };
 
 
-NMD::Pool NMD::ASET_ACLR[2] = {
+static struct Pool ASET_ACLR[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfe007f00, 0xa4001100, &NMD::ASET             , 0,
+       0xfe007f00, 0xa4001100, &ASET             , 0,
        MCU_                },        /* ASET */
     { instruction         , 0                   , 0   , 32,
-       0xfe007f00, 0xa6001100, &NMD::ACLR             , 0,
+       0xfe007f00, 0xa6001100, &ACLR             , 0,
        MCU_                },        /* ACLR */
 };
 
 
-NMD::Pool NMD::P_LL[4] = {
+static struct Pool P_LL[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005100, &NMD::LL               , 0,
+       0xfc007f03, 0xa4005100, &LL               , 0,
        0x0                 },        /* LL */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005101, &NMD::LLWP             , 0,
+       0xfc007f03, 0xa4005101, &LLWP             , 0,
        XNP_                },        /* LLWP */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f03, 0xa4005102, 0                      , 0,
@@ -21460,12 +21194,12 @@ NMD::Pool NMD::P_LL[4] = {
 };
 
 
-NMD::Pool NMD::P_SC[4] = {
+static struct Pool P_SC[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005900, &NMD::SC               , 0,
+       0xfc007f03, 0xa4005900, &SC               , 0,
        0x0                 },        /* SC */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005901, &NMD::SCWP             , 0,
+       0xfc007f03, 0xa4005901, &SCWP             , 0,
        XNP_                },        /* SCWP */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f03, 0xa4005902, 0                      , 0,
@@ -21476,12 +21210,12 @@ NMD::Pool NMD::P_SC[4] = {
 };
 
 
-NMD::Pool NMD::P_LLD[8] = {
+static struct Pool P_LLD[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f07, 0xa4007100, &NMD::LLD              , 0,
+       0xfc007f07, 0xa4007100, &LLD              , 0,
        MIPS64_             },        /* LLD */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f07, 0xa4007101, &NMD::LLDP             , 0,
+       0xfc007f07, 0xa4007101, &LLDP             , 0,
        MIPS64_             },        /* LLDP */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f07, 0xa4007102, 0                      , 0,
@@ -21504,12 +21238,12 @@ NMD::Pool NMD::P_LLD[8] = {
 };
 
 
-NMD::Pool NMD::P_SCD[8] = {
+static struct Pool P_SCD[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f07, 0xa4007900, &NMD::SCD              , 0,
+       0xfc007f07, 0xa4007900, &SCD              , 0,
        MIPS64_             },        /* SCD */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f07, 0xa4007901, &NMD::SCDP             , 0,
+       0xfc007f07, 0xa4007901, &SCDP             , 0,
        MIPS64_             },        /* SCDP */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f07, 0xa4007902, 0                      , 0,
@@ -21532,7 +21266,7 @@ NMD::Pool NMD::P_SCD[8] = {
 };
 
 
-NMD::Pool NMD::P_LS_S1[16] = {
+static struct Pool P_LS_S1[16] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f00, 0xa4000100, 0                      , 0,
        0x0                 },        /* P.LS.S1~*(0) */
@@ -21546,22 +21280,22 @@ NMD::Pool NMD::P_LS_S1[16] = {
        0xfc007f00, 0xa4001900, 0                      , 0,
        0x0                 },        /* P.LS.S1~*(3) */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4002100, &NMD::UALH             , 0,
+       0xfc007f00, 0xa4002100, &UALH             , 0,
        XMMS_               },        /* UALH */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4002900, &NMD::UASH             , 0,
+       0xfc007f00, 0xa4002900, &UASH             , 0,
        XMMS_               },        /* UASH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f00, 0xa4003100, 0                      , 0,
        0x0                 },        /* P.LS.S1~*(6) */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4003900, &NMD::CACHE            , 0,
+       0xfc007f00, 0xa4003900, &CACHE            , 0,
        CP0_                },        /* CACHE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4004100, &NMD::LWC2             , 0,
+       0xfc007f00, 0xa4004100, &LWC2             , 0,
        CP2_                },        /* LWC2 */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4004900, &NMD::SWC2             , 0,
+       0xfc007f00, 0xa4004900, &SWC2             , 0,
        CP2_                },        /* SWC2 */
     { pool                , P_LL                , 4   , 32,
        0xfc007f00, 0xa4005100, 0                      , 0,
@@ -21570,10 +21304,10 @@ NMD::Pool NMD::P_LS_S1[16] = {
        0xfc007f00, 0xa4005900, 0                      , 0,
        0x0                 },        /* P.SC */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4006100, &NMD::LDC2             , 0,
+       0xfc007f00, 0xa4006100, &LDC2             , 0,
        CP2_                },        /* LDC2 */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4006900, &NMD::SDC2             , 0,
+       0xfc007f00, 0xa4006900, &SDC2             , 0,
        CP2_                },        /* SDC2 */
     { pool                , P_LLD               , 8   , 32,
        0xfc007f00, 0xa4007100, 0                      , 0,
@@ -21584,22 +21318,22 @@ NMD::Pool NMD::P_LS_S1[16] = {
 };
 
 
-NMD::Pool NMD::P_PREFE[2] = {
+static struct Pool P_PREFE[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xffe07f00, 0xa7e01a00, &NMD::SYNCIE           , 0,
+       0xffe07f00, 0xa7e01a00, &SYNCIE           , 0,
        CP0_ | EVA_         },        /* SYNCIE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001a00, &NMD::PREFE            , &NMD::PREFE_cond       ,
+       0xfc007f00, 0xa4001a00, &PREFE            , &PREFE_cond       ,
        CP0_ | EVA_         },        /* PREFE */
 };
 
 
-NMD::Pool NMD::P_LLE[4] = {
+static struct Pool P_LLE[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005200, &NMD::LLE              , 0,
+       0xfc007f03, 0xa4005200, &LLE              , 0,
        CP0_ | EVA_         },        /* LLE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005201, &NMD::LLWPE            , 0,
+       0xfc007f03, 0xa4005201, &LLWPE            , 0,
        CP0_ | EVA_         },        /* LLWPE */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f03, 0xa4005202, 0                      , 0,
@@ -21610,12 +21344,12 @@ NMD::Pool NMD::P_LLE[4] = {
 };
 
 
-NMD::Pool NMD::P_SCE[4] = {
+static struct Pool P_SCE[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005a00, &NMD::SCE              , 0,
+       0xfc007f03, 0xa4005a00, &SCE              , 0,
        CP0_ | EVA_         },        /* SCE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005a01, &NMD::SCWPE            , 0,
+       0xfc007f03, 0xa4005a01, &SCWPE            , 0,
        CP0_ | EVA_         },        /* SCWPE */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f03, 0xa4005a02, 0                      , 0,
@@ -21626,36 +21360,36 @@ NMD::Pool NMD::P_SCE[4] = {
 };
 
 
-NMD::Pool NMD::P_LS_E0[16] = {
+static struct Pool P_LS_E0[16] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4000200, &NMD::LBE              , 0,
+       0xfc007f00, 0xa4000200, &LBE              , 0,
        CP0_ | EVA_         },        /* LBE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4000a00, &NMD::SBE              , 0,
+       0xfc007f00, 0xa4000a00, &SBE              , 0,
        CP0_ | EVA_         },        /* SBE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001200, &NMD::LBUE             , 0,
+       0xfc007f00, 0xa4001200, &LBUE             , 0,
        CP0_ | EVA_         },        /* LBUE */
     { pool                , P_PREFE             , 2   , 32,
        0xfc007f00, 0xa4001a00, 0                      , 0,
        0x0                 },        /* P.PREFE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4002200, &NMD::LHE              , 0,
+       0xfc007f00, 0xa4002200, &LHE              , 0,
        CP0_ | EVA_         },        /* LHE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4002a00, &NMD::SHE              , 0,
+       0xfc007f00, 0xa4002a00, &SHE              , 0,
        CP0_ | EVA_         },        /* SHE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4003200, &NMD::LHUE             , 0,
+       0xfc007f00, 0xa4003200, &LHUE             , 0,
        CP0_ | EVA_         },        /* LHUE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4003a00, &NMD::CACHEE           , 0,
+       0xfc007f00, 0xa4003a00, &CACHEE           , 0,
        CP0_ | EVA_         },        /* CACHEE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4004200, &NMD::LWE              , 0,
+       0xfc007f00, 0xa4004200, &LWE              , 0,
        CP0_ | EVA_         },        /* LWE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4004a00, &NMD::SWE              , 0,
+       0xfc007f00, 0xa4004a00, &SWE              , 0,
        CP0_ | EVA_         },        /* SWE */
     { pool                , P_LLE               , 4   , 32,
        0xfc007f00, 0xa4005200, 0                      , 0,
@@ -21678,47 +21412,47 @@ NMD::Pool NMD::P_LS_E0[16] = {
 };
 
 
-NMD::Pool NMD::P_LS_WM[2] = {
+static struct Pool P_LS_WM[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000400, &NMD::LWM              , 0,
+       0xfc000f00, 0xa4000400, &LWM              , 0,
        XMMS_               },        /* LWM */
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000c00, &NMD::SWM              , 0,
+       0xfc000f00, 0xa4000c00, &SWM              , 0,
        XMMS_               },        /* SWM */
 };
 
 
-NMD::Pool NMD::P_LS_UAWM[2] = {
+static struct Pool P_LS_UAWM[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000500, &NMD::UALWM            , 0,
+       0xfc000f00, 0xa4000500, &UALWM            , 0,
        XMMS_               },        /* UALWM */
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000d00, &NMD::UASWM            , 0,
+       0xfc000f00, 0xa4000d00, &UASWM            , 0,
        XMMS_               },        /* UASWM */
 };
 
 
-NMD::Pool NMD::P_LS_DM[2] = {
+static struct Pool P_LS_DM[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000600, &NMD::LDM              , 0,
+       0xfc000f00, 0xa4000600, &LDM              , 0,
        MIPS64_             },        /* LDM */
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000e00, &NMD::SDM              , 0,
+       0xfc000f00, 0xa4000e00, &SDM              , 0,
        MIPS64_             },        /* SDM */
 };
 
 
-NMD::Pool NMD::P_LS_UADM[2] = {
+static struct Pool P_LS_UADM[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000700, &NMD::UALDM            , 0,
+       0xfc000f00, 0xa4000700, &UALDM            , 0,
        MIPS64_             },        /* UALDM */
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000f00, &NMD::UASDM            , 0,
+       0xfc000f00, 0xa4000f00, &UASDM            , 0,
        MIPS64_             },        /* UASDM */
 };
 
 
-NMD::Pool NMD::P_LS_S9[8] = {
+static struct Pool P_LS_S9[8] = {
     { pool                , P_LS_S0             , 16  , 32,
        0xfc000700, 0xa4000000, 0                      , 0,
        0x0                 },        /* P.LS.S0 */
@@ -21746,32 +21480,32 @@ NMD::Pool NMD::P_LS_S9[8] = {
 };
 
 
-NMD::Pool NMD::P_BAL[2] = {
+static struct Pool P_BAL[2] = {
     { branch_instruction  , 0                   , 0   , 32,
-       0xfe000000, 0x28000000, &NMD::BC_32_           , 0,
+       0xfe000000, 0x28000000, &BC_32_           , 0,
        0x0                 },        /* BC[32] */
     { call_instruction    , 0                   , 0   , 32,
-       0xfe000000, 0x2a000000, &NMD::BALC_32_         , 0,
+       0xfe000000, 0x2a000000, &BALC_32_         , 0,
        0x0                 },        /* BALC[32] */
 };
 
 
-NMD::Pool NMD::P_BALRSC[2] = {
+static struct Pool P_BALRSC[2] = {
     { branch_instruction  , 0                   , 0   , 32,
-       0xffe0f000, 0x48008000, &NMD::BRSC             , 0,
+       0xffe0f000, 0x48008000, &BRSC             , 0,
        0x0                 },        /* BRSC */
     { call_instruction    , 0                   , 0   , 32,
-       0xfc00f000, 0x48008000, &NMD::BALRSC           , &NMD::BALRSC_cond      ,
+       0xfc00f000, 0x48008000, &BALRSC           , &BALRSC_cond      ,
        0x0                 },        /* BALRSC */
 };
 
 
-NMD::Pool NMD::P_J[16] = {
+static struct Pool P_J[16] = {
     { call_instruction    , 0                   , 0   , 32,
-       0xfc00f000, 0x48000000, &NMD::JALRC_32_        , 0,
+       0xfc00f000, 0x48000000, &JALRC_32_        , 0,
        0x0                 },        /* JALRC[32] */
     { call_instruction    , 0                   , 0   , 32,
-       0xfc00f000, 0x48001000, &NMD::JALRC_HB         , 0,
+       0xfc00f000, 0x48001000, &JALRC_HB         , 0,
        0x0                 },        /* JALRC.HB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00f000, 0x48002000, 0                      , 0,
@@ -21818,21 +21552,21 @@ NMD::Pool NMD::P_J[16] = {
 };
 
 
-NMD::Pool NMD::P_BR3A[32] = {
+static struct Pool P_BR3A[32] = {
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1fc000, 0x88004000, &NMD::BC1EQZC          , 0,
+       0xfc1fc000, 0x88004000, &BC1EQZC          , 0,
        CP1_                },        /* BC1EQZC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1fc000, 0x88014000, &NMD::BC1NEZC          , 0,
+       0xfc1fc000, 0x88014000, &BC1NEZC          , 0,
        CP1_                },        /* BC1NEZC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1fc000, 0x88024000, &NMD::BC2EQZC          , 0,
+       0xfc1fc000, 0x88024000, &BC2EQZC          , 0,
        CP2_                },        /* BC2EQZC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1fc000, 0x88034000, &NMD::BC2NEZC          , 0,
+       0xfc1fc000, 0x88034000, &BC2NEZC          , 0,
        CP2_                },        /* BC2NEZC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1fc000, 0x88044000, &NMD::BPOSGE32C        , 0,
+       0xfc1fc000, 0x88044000, &BPOSGE32C        , 0,
        DSP_                },        /* BPOSGE32C */
     { reserved_block      , 0                   , 0   , 32,
        0xfc1fc000, 0x88054000, 0                      , 0,
@@ -21918,67 +21652,67 @@ NMD::Pool NMD::P_BR3A[32] = {
 };
 
 
-NMD::Pool NMD::P_BR1[4] = {
+static struct Pool P_BR1[4] = {
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc00c000, 0x88000000, &NMD::BEQC_32_         , 0,
+       0xfc00c000, 0x88000000, &BEQC_32_         , 0,
        0x0                 },        /* BEQC[32] */
     { pool                , P_BR3A              , 32  , 32,
        0xfc00c000, 0x88004000, 0                      , 0,
        0x0                 },        /* P.BR3A */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc00c000, 0x88008000, &NMD::BGEC             , 0,
+       0xfc00c000, 0x88008000, &BGEC             , 0,
        0x0                 },        /* BGEC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc00c000, 0x8800c000, &NMD::BGEUC            , 0,
+       0xfc00c000, 0x8800c000, &BGEUC            , 0,
        0x0                 },        /* BGEUC */
 };
 
 
-NMD::Pool NMD::P_BR2[4] = {
+static struct Pool P_BR2[4] = {
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc00c000, 0xa8000000, &NMD::BNEC_32_         , 0,
+       0xfc00c000, 0xa8000000, &BNEC_32_         , 0,
        0x0                 },        /* BNEC[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00c000, 0xa8004000, 0                      , 0,
        0x0                 },        /* P.BR2~*(1) */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc00c000, 0xa8008000, &NMD::BLTC             , 0,
+       0xfc00c000, 0xa8008000, &BLTC             , 0,
        0x0                 },        /* BLTC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc00c000, 0xa800c000, &NMD::BLTUC            , 0,
+       0xfc00c000, 0xa800c000, &BLTUC            , 0,
        0x0                 },        /* BLTUC */
 };
 
 
-NMD::Pool NMD::P_BRI[8] = {
+static struct Pool P_BRI[8] = {
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc8000000, &NMD::BEQIC            , 0,
+       0xfc1c0000, 0xc8000000, &BEQIC            , 0,
        0x0                 },        /* BEQIC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc8040000, &NMD::BBEQZC           , 0,
+       0xfc1c0000, 0xc8040000, &BBEQZC           , 0,
        XMMS_               },        /* BBEQZC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc8080000, &NMD::BGEIC            , 0,
+       0xfc1c0000, 0xc8080000, &BGEIC            , 0,
        0x0                 },        /* BGEIC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc80c0000, &NMD::BGEIUC           , 0,
+       0xfc1c0000, 0xc80c0000, &BGEIUC           , 0,
        0x0                 },        /* BGEIUC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc8100000, &NMD::BNEIC            , 0,
+       0xfc1c0000, 0xc8100000, &BNEIC            , 0,
        0x0                 },        /* BNEIC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc8140000, &NMD::BBNEZC           , 0,
+       0xfc1c0000, 0xc8140000, &BBNEZC           , 0,
        XMMS_               },        /* BBNEZC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc8180000, &NMD::BLTIC            , 0,
+       0xfc1c0000, 0xc8180000, &BLTIC            , 0,
        0x0                 },        /* BLTIC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc81c0000, &NMD::BLTIUC           , 0,
+       0xfc1c0000, 0xc81c0000, &BLTIUC           , 0,
        0x0                 },        /* BLTIUC */
 };
 
 
-NMD::Pool NMD::P32[32] = {
+static struct Pool P32[32] = {
     { pool                , P_ADDIU             , 2   , 32,
        0xfc000000, 0x00000000, 0                      , 0,
        0x0                 },        /* P.ADDIU */
@@ -22004,7 +21738,7 @@ NMD::Pool NMD::P32[32] = {
        0xfc000000, 0xe0000000, 0                      , 0,
        0x0                 },        /* P.LUI */
     { instruction         , 0                   , 0   , 32,
-       0xfc000000, 0x04000000, &NMD::ADDIUPC_32_      , 0,
+       0xfc000000, 0x04000000, &ADDIUPC_32_      , 0,
        0x0                 },        /* ADDIUPC[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc000000, 0x24000000, 0                      , 0,
@@ -22028,7 +21762,7 @@ NMD::Pool NMD::P32[32] = {
        0xfc000000, 0xe4000000, 0                      , 0,
        0x0                 },        /* P32~*(29) */
     { call_instruction    , 0                   , 0   , 32,
-       0xfc000000, 0x08000000, &NMD::MOVE_BALC        , 0,
+       0xfc000000, 0x08000000, &MOVE_BALC        , 0,
        XMMS_               },        /* MOVE.BALC */
     { pool                , P_BAL               , 2   , 32,
        0xfc000000, 0x28000000, 0                      , 0,
@@ -22078,17 +21812,17 @@ NMD::Pool NMD::P32[32] = {
 };
 
 
-NMD::Pool NMD::P16_SYSCALL[2] = {
+static struct Pool P16_SYSCALL[2] = {
     { instruction         , 0                   , 0   , 16,
-       0xfffc    , 0x1008    , &NMD::SYSCALL_16_      , 0,
+       0xfffc    , 0x1008    , &SYSCALL_16_      , 0,
        0x0                 },        /* SYSCALL[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfffc    , 0x100c    , &NMD::HYPCALL_16_      , 0,
+       0xfffc    , 0x100c    , &HYPCALL_16_      , 0,
        CP0_ | VZ_          },        /* HYPCALL[16] */
 };
 
 
-NMD::Pool NMD::P16_RI[4] = {
+static struct Pool P16_RI[4] = {
     { reserved_block      , 0                   , 0   , 16,
        0xfff8    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16.RI~*(0) */
@@ -22096,51 +21830,51 @@ NMD::Pool NMD::P16_RI[4] = {
        0xfff8    , 0x1008    , 0                      , 0,
        0x0                 },        /* P16.SYSCALL */
     { instruction         , 0                   , 0   , 16,
-       0xfff8    , 0x1010    , &NMD::BREAK_16_        , 0,
+       0xfff8    , 0x1010    , &BREAK_16_        , 0,
        0x0                 },        /* BREAK[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfff8    , 0x1018    , &NMD::SDBBP_16_        , 0,
+       0xfff8    , 0x1018    , &SDBBP_16_        , 0,
        EJTAG_              },        /* SDBBP[16] */
 };
 
 
-NMD::Pool NMD::P16_MV[2] = {
+static struct Pool P16_MV[2] = {
     { pool                , P16_RI              , 4   , 16,
        0xffe0    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16.RI */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x1000    , &NMD::MOVE             , &NMD::MOVE_cond        ,
+       0xfc00    , 0x1000    , &MOVE             , &MOVE_cond        ,
        0x0                 },        /* MOVE */
 };
 
 
-NMD::Pool NMD::P16_SHIFT[2] = {
+static struct Pool P16_SHIFT[2] = {
     { instruction         , 0                   , 0   , 16,
-       0xfc08    , 0x3000    , &NMD::SLL_16_          , 0,
+       0xfc08    , 0x3000    , &SLL_16_          , 0,
        0x0                 },        /* SLL[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc08    , 0x3008    , &NMD::SRL_16_          , 0,
+       0xfc08    , 0x3008    , &SRL_16_          , 0,
        0x0                 },        /* SRL[16] */
 };
 
 
-NMD::Pool NMD::POOL16C_00[4] = {
+static struct Pool POOL16C_00[4] = {
     { instruction         , 0                   , 0   , 16,
-       0xfc0f    , 0x5000    , &NMD::NOT_16_          , 0,
+       0xfc0f    , 0x5000    , &NOT_16_          , 0,
        0x0                 },        /* NOT[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc0f    , 0x5004    , &NMD::XOR_16_          , 0,
+       0xfc0f    , 0x5004    , &XOR_16_          , 0,
        0x0                 },        /* XOR[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc0f    , 0x5008    , &NMD::AND_16_          , 0,
+       0xfc0f    , 0x5008    , &AND_16_          , 0,
        0x0                 },        /* AND[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc0f    , 0x500c    , &NMD::OR_16_           , 0,
+       0xfc0f    , 0x500c    , &OR_16_           , 0,
        0x0                 },        /* OR[16] */
 };
 
 
-NMD::Pool NMD::POOL16C_0[2] = {
+static struct Pool POOL16C_0[2] = {
     { pool                , POOL16C_00          , 4   , 16,
        0xfc03    , 0x5000    , 0                      , 0,
        0x0                 },        /* POOL16C_00 */
@@ -22150,39 +21884,39 @@ NMD::Pool NMD::POOL16C_0[2] = {
 };
 
 
-NMD::Pool NMD::P16C[2] = {
+static struct Pool P16C[2] = {
     { pool                , POOL16C_0           , 2   , 16,
        0xfc01    , 0x5000    , 0                      , 0,
        0x0                 },        /* POOL16C_0 */
     { instruction         , 0                   , 0   , 16,
-       0xfc01    , 0x5001    , &NMD::LWXS_16_         , 0,
+       0xfc01    , 0x5001    , &LWXS_16_         , 0,
        0x0                 },        /* LWXS[16] */
 };
 
 
-NMD::Pool NMD::P16_A1[2] = {
+static struct Pool P16_A1[2] = {
     { reserved_block      , 0                   , 0   , 16,
        0xfc40    , 0x7000    , 0                      , 0,
        0x0                 },        /* P16.A1~*(0) */
     { instruction         , 0                   , 0   , 16,
-       0xfc40    , 0x7040    , &NMD::ADDIU_R1_SP_     , 0,
+       0xfc40    , 0x7040    , &ADDIU_R1_SP_     , 0,
        0x0                 },        /* ADDIU[R1.SP] */
 };
 
 
-NMD::Pool NMD::P_ADDIU_RS5_[2] = {
+static struct Pool P_ADDIU_RS5_[2] = {
     { instruction         , 0                   , 0   , 16,
-       0xffe8    , 0x9008    , &NMD::NOP_16_          , 0,
+       0xffe8    , 0x9008    , &NOP_16_          , 0,
        0x0                 },        /* NOP[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc08    , 0x9008    , &NMD::ADDIU_RS5_       , &NMD::ADDIU_RS5__cond  ,
+       0xfc08    , 0x9008    , &ADDIU_RS5_       , &ADDIU_RS5__cond  ,
        0x0                 },        /* ADDIU[RS5] */
 };
 
 
-NMD::Pool NMD::P16_A2[2] = {
+static struct Pool P16_A2[2] = {
     { instruction         , 0                   , 0   , 16,
-       0xfc08    , 0x9000    , &NMD::ADDIU_R2_        , 0,
+       0xfc08    , 0x9000    , &ADDIU_R2_        , 0,
        0x0                 },        /* ADDIU[R2] */
     { pool                , P_ADDIU_RS5_        , 2   , 16,
        0xfc08    , 0x9008    , 0                      , 0,
@@ -22190,62 +21924,62 @@ NMD::Pool NMD::P16_A2[2] = {
 };
 
 
-NMD::Pool NMD::P16_ADDU[2] = {
+static struct Pool P16_ADDU[2] = {
     { instruction         , 0                   , 0   , 16,
-       0xfc01    , 0xb000    , &NMD::ADDU_16_         , 0,
+       0xfc01    , 0xb000    , &ADDU_16_         , 0,
        0x0                 },        /* ADDU[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc01    , 0xb001    , &NMD::SUBU_16_         , 0,
+       0xfc01    , 0xb001    , &SUBU_16_         , 0,
        0x0                 },        /* SUBU[16] */
 };
 
 
-NMD::Pool NMD::P16_JRC[2] = {
+static struct Pool P16_JRC[2] = {
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc1f    , 0xd800    , &NMD::JRC              , 0,
+       0xfc1f    , 0xd800    , &JRC              , 0,
        0x0                 },        /* JRC */
     { call_instruction    , 0                   , 0   , 16,
-       0xfc1f    , 0xd810    , &NMD::JALRC_16_        , 0,
+       0xfc1f    , 0xd810    , &JALRC_16_        , 0,
        0x0                 },        /* JALRC[16] */
 };
 
 
-NMD::Pool NMD::P16_BR1[2] = {
+static struct Pool P16_BR1[2] = {
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc00    , 0xd800    , &NMD::BEQC_16_         , &NMD::BEQC_16__cond    ,
+       0xfc00    , 0xd800    , &BEQC_16_         , &BEQC_16__cond    ,
        XMMS_               },        /* BEQC[16] */
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc00    , 0xd800    , &NMD::BNEC_16_         , &NMD::BNEC_16__cond    ,
+       0xfc00    , 0xd800    , &BNEC_16_         , &BNEC_16__cond    ,
        XMMS_               },        /* BNEC[16] */
 };
 
 
-NMD::Pool NMD::P16_BR[2] = {
+static struct Pool P16_BR[2] = {
     { pool                , P16_JRC             , 2   , 16,
        0xfc0f    , 0xd800    , 0                      , 0,
        0x0                 },        /* P16.JRC */
     { pool                , P16_BR1             , 2   , 16,
-       0xfc00    , 0xd800    , 0                      , &NMD::P16_BR1_cond     ,
+       0xfc00    , 0xd800    , 0                      , &P16_BR1_cond     ,
        0x0                 },        /* P16.BR1 */
 };
 
 
-NMD::Pool NMD::P16_SR[2] = {
+static struct Pool P16_SR[2] = {
     { instruction         , 0                   , 0   , 16,
-       0xfd00    , 0x1c00    , &NMD::SAVE_16_         , 0,
+       0xfd00    , 0x1c00    , &SAVE_16_         , 0,
        0x0                 },        /* SAVE[16] */
     { return_instruction  , 0                   , 0   , 16,
-       0xfd00    , 0x1d00    , &NMD::RESTORE_JRC_16_  , 0,
+       0xfd00    , 0x1d00    , &RESTORE_JRC_16_  , 0,
        0x0                 },        /* RESTORE.JRC[16] */
 };
 
 
-NMD::Pool NMD::P16_4X4[4] = {
+static struct Pool P16_4X4[4] = {
     { instruction         , 0                   , 0   , 16,
-       0xfd08    , 0x3c00    , &NMD::ADDU_4X4_        , 0,
+       0xfd08    , 0x3c00    , &ADDU_4X4_        , 0,
        XMMS_               },        /* ADDU[4X4] */
     { instruction         , 0                   , 0   , 16,
-       0xfd08    , 0x3c08    , &NMD::MUL_4X4_         , 0,
+       0xfd08    , 0x3c08    , &MUL_4X4_         , 0,
        XMMS_               },        /* MUL[4X4] */
     { reserved_block      , 0                   , 0   , 16,
        0xfd08    , 0x3d00    , 0                      , 0,
@@ -22256,15 +21990,15 @@ NMD::Pool NMD::P16_4X4[4] = {
 };
 
 
-NMD::Pool NMD::P16_LB[4] = {
+static struct Pool P16_LB[4] = {
     { instruction         , 0                   , 0   , 16,
-       0xfc0c    , 0x5c00    , &NMD::LB_16_           , 0,
+       0xfc0c    , 0x5c00    , &LB_16_           , 0,
        0x0                 },        /* LB[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc0c    , 0x5c04    , &NMD::SB_16_           , 0,
+       0xfc0c    , 0x5c04    , &SB_16_           , 0,
        0x0                 },        /* SB[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc0c    , 0x5c08    , &NMD::LBU_16_          , 0,
+       0xfc0c    , 0x5c08    , &LBU_16_          , 0,
        0x0                 },        /* LBU[16] */
     { reserved_block      , 0                   , 0   , 16,
        0xfc0c    , 0x5c0c    , 0                      , 0,
@@ -22272,15 +22006,15 @@ NMD::Pool NMD::P16_LB[4] = {
 };
 
 
-NMD::Pool NMD::P16_LH[4] = {
+static struct Pool P16_LH[4] = {
     { instruction         , 0                   , 0   , 16,
-       0xfc09    , 0x7c00    , &NMD::LH_16_           , 0,
+       0xfc09    , 0x7c00    , &LH_16_           , 0,
        0x0                 },        /* LH[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc09    , 0x7c01    , &NMD::SH_16_           , 0,
+       0xfc09    , 0x7c01    , &SH_16_           , 0,
        0x0                 },        /* SH[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc09    , 0x7c08    , &NMD::LHU_16_          , 0,
+       0xfc09    , 0x7c08    , &LHU_16_          , 0,
        0x0                 },        /* LHU[16] */
     { reserved_block      , 0                   , 0   , 16,
        0xfc09    , 0x7c09    , 0                      , 0,
@@ -22288,7 +22022,7 @@ NMD::Pool NMD::P16_LH[4] = {
 };
 
 
-NMD::Pool NMD::P16[32] = {
+static struct Pool P16[32] = {
     { pool                , P16_MV              , 2   , 16,
        0xfc00    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16.MV */
@@ -22308,40 +22042,40 @@ NMD::Pool NMD::P16[32] = {
        0xfc00    , 0xb000    , 0                      , 0,
        0x0                 },        /* P16.ADDU */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xd000    , &NMD::LI_16_           , 0,
+       0xfc00    , 0xd000    , &LI_16_           , 0,
        0x0                 },        /* LI[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xf000    , &NMD::ANDI_16_         , 0,
+       0xfc00    , 0xf000    , &ANDI_16_         , 0,
        0x0                 },        /* ANDI[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x1400    , &NMD::LW_16_           , 0,
+       0xfc00    , 0x1400    , &LW_16_           , 0,
        0x0                 },        /* LW[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x3400    , &NMD::LW_SP_           , 0,
+       0xfc00    , 0x3400    , &LW_SP_           , 0,
        0x0                 },        /* LW[SP] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x5400    , &NMD::LW_GP16_         , 0,
+       0xfc00    , 0x5400    , &LW_GP16_         , 0,
        0x0                 },        /* LW[GP16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x7400    , &NMD::LW_4X4_          , 0,
+       0xfc00    , 0x7400    , &LW_4X4_          , 0,
        XMMS_               },        /* LW[4X4] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x9400    , &NMD::SW_16_           , 0,
+       0xfc00    , 0x9400    , &SW_16_           , 0,
        0x0                 },        /* SW[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xb400    , &NMD::SW_SP_           , 0,
+       0xfc00    , 0xb400    , &SW_SP_           , 0,
        0x0                 },        /* SW[SP] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xd400    , &NMD::SW_GP16_         , 0,
+       0xfc00    , 0xd400    , &SW_GP16_         , 0,
        0x0                 },        /* SW[GP16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xf400    , &NMD::SW_4X4_          , 0,
+       0xfc00    , 0xf400    , &SW_4X4_          , 0,
        XMMS_               },        /* SW[4X4] */
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc00    , 0x1800    , &NMD::BC_16_           , 0,
+       0xfc00    , 0x1800    , &BC_16_           , 0,
        0x0                 },        /* BC[16] */
     { call_instruction    , 0                   , 0   , 16,
-       0xfc00    , 0x3800    , &NMD::BALC_16_         , 0,
+       0xfc00    , 0x3800    , &BALC_16_         , 0,
        0x0                 },        /* BALC[16] */
     { reserved_block      , 0                   , 0   , 16,
        0xfc00    , 0x5800    , 0                      , 0,
@@ -22350,10 +22084,10 @@ NMD::Pool NMD::P16[32] = {
        0xfc00    , 0x7800    , 0                      , 0,
        0x0                 },        /* P16~*(14) */
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc00    , 0x9800    , &NMD::BEQZC_16_        , 0,
+       0xfc00    , 0x9800    , &BEQZC_16_        , 0,
        0x0                 },        /* BEQZC[16] */
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc00    , 0xb800    , &NMD::BNEZC_16_        , 0,
+       0xfc00    , 0xb800    , &BNEZC_16_        , 0,
        0x0                 },        /* BNEZC[16] */
     { pool                , P16_BR              , 2   , 16,
        0xfc00    , 0xd800    , 0                      , 0,
@@ -22377,18 +22111,18 @@ NMD::Pool NMD::P16[32] = {
        0xfc00    , 0x9c00    , 0                      , 0,
        0x0                 },        /* P16~*(19) */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xbc00    , &NMD::MOVEP            , 0,
+       0xfc00    , 0xbc00    , &MOVEP            , 0,
        XMMS_               },        /* MOVEP */
     { reserved_block      , 0                   , 0   , 16,
        0xfc00    , 0xdc00    , 0                      , 0,
        0x0                 },        /* P16~*(27) */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xfc00    , &NMD::MOVEP_REV_       , 0,
+       0xfc00    , 0xfc00    , &MOVEP_REV_       , 0,
        XMMS_               },        /* MOVEP[REV] */
 };
 
 
-NMD::Pool NMD::MAJOR[2] = {
+static struct Pool MAJOR[2] = {
     { pool                , P32                 , 32  , 32,
        0x10000000, 0x00000000, 0                      , 0,
        0x0                 },        /* P32 */
@@ -22396,3 +22130,168 @@ NMD::Pool NMD::MAJOR[2] = {
        0x1000    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16 */
 };
+
+
+/*
+ * Recurse through tables until the instruction is found then return
+ * the string and size
+ *
+ * inputs:
+ *      pointer to a word stream,
+ *      disassember table and size
+ * returns:
+ *      instruction size    - negative is error
+ *      disassembly string  - on error will constain error string
+ */
+static int disassemble(const uint16 *data, char *dis,
+                     TABLE_ENTRY_TYPE *type, const struct Pool *table,
+                     int table_size)
+{
+    for (int i = 0; i < table_size; i++) {
+        uint64 op_code = extract_op_code_value(data,
+                                table[i].instructions_size);
+        if ((op_code & table[i].mask) == table[i].value) {
+            /* possible match */
+            conditional_function cond = table[i].condition;
+            if ((cond == 0) || cond(op_code)) {
+                if (table[i].type == pool) {
+                    return disassemble(data, dis, type,
+                                            table[i].next_table,
+                                            table[i].next_table_size);
+                } else if ((table[i].type == instruction) ||
+                            (table[i].type == call_instruction) ||
+                            (table[i].type == branch_instruction) ||
+                            (table[i].type == return_instruction)) {
+                    if ((table[i].attributes != 0) &&
+                        (m_requested_instruction_categories &
+                            table[i].attributes) == 0) {
+                        /*
+                         * failed due to instruction having
+                         * an ASE attribute and the requested version
+                         * not having that attribute
+                         */
+                        strcpy(dis, "ASE attribute mismatch");
+                            return -5;
+                        }
+                    disassembly_function dis_fn = table[i].disassembly;
+                    if (dis_fn == 0) {
+                        strcpy(dis, "disassembler failure - bad table entry");
+                        return -6;
+                    }
+                    *type = table[i].type;
+                    strcpy(dis, dis_fn(op_code));
+                    return table[i].instructions_size;
+                } else {
+                    strcpy(dis, "reserved instruction");
+                    return -2;
+                }
+            }
+        }
+    }
+    strcpy(dis, "failed to disassemble");
+    return -1;      /* failed to disassemble */
+}
+
+
+static int nanomips_dis(char *buf,
+                 unsigned address,
+                 unsigned short one,
+                 unsigned short two,
+                 unsigned short three)
+{
+    char disasm[200];
+    uint16 bits[3] = {one, two, three};
+
+    TABLE_ENTRY_TYPE type;
+    m_pc = address;
+    m_requested_instruction_categories = ALL_ATTRIBUTES;
+    int size = disassemble(bits, disasm, &type, MAJOR, 2);
+
+    strcpy(buf, disasm);
+    return size;
+}
+
+int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
+{
+    int status;
+    bfd_byte buffer[2];
+    uint16_t insn1 = 0, insn2 = 0, insn3 = 0;
+    char buf[200];
+
+    info->bytes_per_chunk = 2;
+    info->display_endian = info->endian;
+    info->insn_info_valid = 1;
+    info->branch_delay_insns = 0;
+    info->data_size = 0;
+    info->insn_type = dis_nonbranch;
+    info->target = 0;
+    info->target2 = 0;
+    disassm_info = info;
+
+    status = (*info->read_memory_func)(memaddr, buffer, 2, info);
+    if (status != 0) {
+        (*info->memory_error_func)(status, memaddr, info);
+        return -1;
+    }
+
+    if (info->endian == BFD_ENDIAN_BIG) {
+        insn1 = bfd_getb16(buffer);
+    } else {
+        insn1 = bfd_getl16(buffer);
+    }
+    (*info->fprintf_func)(info->stream, "%04x ", insn1);
+
+    /* Handle 32-bit opcodes.  */
+    if ((insn1 & 0x1000) == 0) {
+        status = (*info->read_memory_func)(memaddr + 2, buffer, 2, info);
+        if (status != 0) {
+            (*info->memory_error_func)(status, memaddr + 2, info);
+            return -1;
+        }
+
+        if (info->endian == BFD_ENDIAN_BIG) {
+            insn2 = bfd_getb16(buffer);
+        } else {
+            insn2 = bfd_getl16(buffer);
+        }
+        (*info->fprintf_func)(info->stream, "%04x ", insn2);
+    } else {
+        (*info->fprintf_func)(info->stream, "     ");
+    }
+    /* Handle 48-bit opcodes.  */
+    if ((insn1 >> 10) == 0x18) {
+        status = (*info->read_memory_func)(memaddr + 4, buffer, 2, info);
+        if (status != 0) {
+            (*info->memory_error_func)(status, memaddr + 4, info);
+            return -1;
+        }
+
+        if (info->endian == BFD_ENDIAN_BIG) {
+            insn3 = bfd_getb16(buffer);
+        } else {
+            insn3 = bfd_getl16(buffer);
+        }
+        (*info->fprintf_func)(info->stream, "%04x ", insn3);
+    } else {
+        (*info->fprintf_func)(info->stream, "     ");
+    }
+
+    /* Handle runtime errors. */
+    if (setjmp(j_buf) != 0) {
+        info->insn_type = dis_noninsn;
+        return insn3 ? 6 : insn2 ? 4 : 2;
+    }
+
+    int length = nanomips_dis(buf, memaddr, insn1, insn2, insn3);
+
+    /* FIXME: Should probably use a hash table on the major opcode here.  */
+
+    (*info->fprintf_func) (info->stream, "%s", buf);
+    if (length > 0) {
+        return length / 8;
+    }
+
+    info->insn_type = dis_noninsn;
+
+    return insn3 ? 6 : insn2 ? 4 : 2;
+}
diff --git a/disas/nanomips.h b/disas/nanomips.h
deleted file mode 100644
index a0a2225301..0000000000
--- a/disas/nanomips.h
+++ /dev/null
@@ -1,1076 +0,0 @@
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
-#include <string>
-
-typedef int64_t int64;
-typedef uint64_t uint64;
-typedef uint32_t uint32;
-typedef uint16_t uint16;
-
-namespace img
-{
-    typedef uint64_t address;
-}
-
-
-class NMD
-{
-public:
-
-    enum TABLE_ENTRY_TYPE {
-        instruction,
-        call_instruction,
-        branch_instruction,
-        return_instruction,
-        reserved_block,
-        pool,
-    };
-
-    enum TABLE_ATTRIBUTE_TYPE {
-        MIPS64_    = 0x00000001,
-        XNP_       = 0x00000002,
-        XMMS_      = 0x00000004,
-        EVA_       = 0x00000008,
-        DSP_       = 0x00000010,
-        MT_        = 0x00000020,
-        EJTAG_     = 0x00000040,
-        TLBINV_    = 0x00000080,
-        CP0_       = 0x00000100,
-        CP1_       = 0x00000200,
-        CP2_       = 0x00000400,
-        UDI_       = 0x00000800,
-        MCU_       = 0x00001000,
-        VZ_        = 0x00002000,
-        TLB_       = 0x00004000,
-        MVH_       = 0x00008000,
-        ALL_ATTRIBUTES = 0xffffffffull,
-    };
-
-
-    NMD(img::address pc, TABLE_ATTRIBUTE_TYPE requested_instruction_categories)
-        : m_pc(pc)
-        , m_requested_instruction_categories(requested_instruction_categories)
-    {
-    }
-
-    int Disassemble(const uint16 *data, std::string & dis,
-                    TABLE_ENTRY_TYPE & type);
-
-private:
-
-    img::address           m_pc;
-    TABLE_ATTRIBUTE_TYPE   m_requested_instruction_categories;
-
-    typedef std::string(NMD:: *disassembly_function)(uint64 instruction);
-    typedef bool(NMD:: *conditional_function)(uint64 instruction);
-
-    struct Pool {
-        TABLE_ENTRY_TYPE     type;
-        struct Pool          *next_table;
-        int                  next_table_size;
-        int                  instructions_size;
-        uint64               mask;
-        uint64               value;
-        disassembly_function disassembly;
-        conditional_function condition;
-        uint64               attributes;
-    };
-
-    uint64 extract_op_code_value(const uint16 *data, int size);
-    int Disassemble(const uint16 *data, std::string & dis,
-                    TABLE_ENTRY_TYPE & type, const Pool *table, int table_size);
-
-    uint64 renumber_registers(uint64 index, uint64 *register_list,
-                              size_t register_list_size);
-
-    uint64 decode_gpr_gpr4(uint64 d);
-    uint64 decode_gpr_gpr4_zero(uint64 d);
-    uint64 decode_gpr_gpr3(uint64 d);
-    uint64 decode_gpr_gpr3_src_store(uint64 d);
-    uint64 decode_gpr_gpr2_reg1(uint64 d);
-    uint64 decode_gpr_gpr2_reg2(uint64 d);
-    uint64 decode_gpr_gpr1(uint64 d);
-
-    uint64 copy(uint64 d);
-    int64 copy(int64 d);
-    int64 neg_copy(uint64 d);
-    int64 neg_copy(int64 d);
-    uint64 encode_rs3_and_check_rs3_ge_rt3(uint64 d);
-    uint64 encode_rs3_and_check_rs3_lt_rt3(uint64 d);
-    uint64 encode_s_from_address(uint64 d);
-    uint64 encode_u_from_address(uint64 d);
-    uint64 encode_s_from_s_hi(uint64 d);
-    uint64 encode_count3_from_count(uint64 d);
-    uint64 encode_shift3_from_shift(uint64 d);
-    int64 encode_eu_from_s_li16(uint64 d);
-    uint64 encode_msbd_from_size(uint64 d);
-    uint64 encode_eu_from_u_andi16(uint64 d);
-
-    uint64 encode_msbd_from_pos_and_size(uint64 d);
-
-    uint64 encode_rt1_from_rt(uint64 d);
-    uint64 encode_lsb_from_pos_and_size(uint64 d);
-
-    std::string save_restore_list(uint64 rt, uint64 count, uint64 gp);
-
-    std::string GPR(uint64 reg);
-    std::string FPR(uint64 reg);
-    std::string AC(uint64 reg);
-    std::string IMMEDIATE(uint64 value);
-    std::string IMMEDIATE(int64 value);
-    std::string CPR(uint64 reg);
-    std::string ADDRESS(uint64 value, int instruction_size);
-
-    int64 extract_s__se3_4_2_1_0(uint64 instruction);
-    int64 extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction);
-    int64 extract_s__se8_15_7_6_5_4_3_s3(uint64 instruction);
-    int64 extract_s__se8_15_7_6_5_4_3_2_s2(uint64 instruction);
-    int64 extract_s__se8_15_7_6_5_4_3_2_1_0(uint64 instruction);
-    int64 extract_s__se9_20_19_18_17_16_15_14_13_12_11(uint64 instruction);
-    int64 extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(uint64 instruction);
-    int64 extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(uint64 instruction);
-    int64 extract_s__se14_0_13_to_1_s1(uint64 instruction);
-    int64 extract_s__se21_0_20_to_1_s1(uint64 instruction);
-    int64 extract_s__se25_0_24_to_1_s1(uint64 instruction);
-    int64 extract_s__se31_15_to_0_31_to_16(uint64 instruction);
-    int64 extract_s__se31_0_11_to_2_20_to_12_s12(uint64 instruction);
-    int64 extract_shift__se5_21_20_19_18_17_16(uint64 instruction);
-
-    uint64 extract_ac_15_14(uint64 instruction);
-    uint64 extract_bit_16_15_14_13_12_11(uint64 instruction);
-    uint64 extract_bit_23_22_21(uint64 instruction);
-    uint64 extract_c0s_20_19_18_17_16(uint64 instruction);
-    uint64 extract_code_17_to_0(uint64 instruction);
-    uint64 extract_code_18_to_0(uint64 instruction);
-    uint64 extract_code_1_0(uint64 instruction);
-    uint64 extract_code_2_1_0(uint64 instruction);
-    uint64 extract_code_25_24_23_22_21_20_19_18_17_16(uint64 instruction);
-    uint64 extract_cofun_25_24_23(uint64 instruction);
-    uint64 extract_count3_14_13_12(uint64 instruction);
-    uint64 extract_count_3_2_1_0(uint64 instruction);
-    uint64 extract_count_19_18_17_16(uint64 instruction);
-    uint64 extract_cs_20_19_18_17_16(uint64 instruction);
-    uint64 extract_cs_25_24_23_22_21(uint64 instruction);
-    uint64 extract_ct_25_24_23_22_21(uint64 instruction);
-    uint64 extract_eu_3_2_1_0(uint64 instruction);
-    uint64 extract_eu_6_5_4_3_2_1_0(uint64 instruction);
-    uint64 extract_fd_15_14_13_12_11(uint64 instruction);
-    uint64 extract_fs_20_19_18_17_16(uint64 instruction);
-    uint64 extract_ft_15_14_13_12_11(uint64 instruction);
-    uint64 extract_ft_25_24_23_22_21(uint64 instruction);
-    uint64 extract_gp_2(uint64 instruction);
-    uint64 extract_hint_25_24_23_22_21(uint64 instruction);
-    uint64 extract_hs_20_19_18_17_16(uint64 instruction);
-    uint64 extract_lsb_4_3_2_1_0(uint64 instruction);
-    uint64 extract_mask_20_19_18_17_16_15_14(uint64 instruction);
-    uint64 extract_msbt_10_9_8_7_6(uint64 instruction);
-    uint64 extract_op_25_24_23_22_21(uint64 instruction);
-    uint64 extract_op_25_to_3(uint64 instruction);
-    uint64 extract_rdl_25_24(uint64 instruction);
-    uint64 extract_rd2_3_8(uint64 instruction);
-    uint64 extract_rd3_3_2_1(uint64 instruction);
-    uint64 extract_rd_15_14_13_12_11(uint64 instruction);
-    uint64 extract_rs3_6_5_4(uint64 instruction);
-    uint64 extract_rs4_4_2_1_0(uint64 instruction);
-    uint64 extract_rs_4_3_2_1_0(uint64 instruction);
-    uint64 extract_rs_20_19_18_17_16(uint64 instruction);
-    uint64 extract_rsz4_4_2_1_0(uint64 instruction);
-    uint64 extract_rtl_11(uint64 instruction);
-    uint64 extract_rt3_9_8_7(uint64 instruction);
-    uint64 extract_rt4_9_7_6_5(uint64 instruction);
-    uint64 extract_rt_25_24_23_22_21(uint64 instruction);
-    uint64 extract_rt_41_40_39_38_37(uint64 instruction);
-    uint64 extract_rt_9_8_7_6_5(uint64 instruction);
-    uint64 extract_rtz3_9_8_7(uint64 instruction);
-    uint64 extract_rtz4_27_26_25_23_22_21(uint64 instruction);
-    uint64 extract_rtz4_9_7_6_5(uint64 instruction);
-    uint64 extract_ru_7_6_5_4_3(uint64 instruction);
-    uint64 extract_sa_15_14_13_12_11(uint64 instruction);
-    uint64 extract_sa_15_14_13_12(uint64 instruction);
-    uint64 extract_sa_15_14_13(uint64 instruction);
-    uint64 extract_sel_13_12_11(uint64 instruction);
-    uint64 extract_sel_15_14_13_12_11(uint64 instruction);
-    uint64 extract_shift3_2_1_0(uint64 instruction);
-    uint64 extract_shift_4_3_2_1_0(uint64 instruction);
-    uint64 extract_shift_5_4_3_2_1_0(uint64 instruction);
-    uint64 extract_shift_20_19_18_17_16(uint64 instruction);
-    uint64 extract_shift_10_9_8_7_6(uint64 instruction);
-    uint64 extract_shiftx_11_10_9_8_7_6(uint64 instruction);
-    uint64 extract_shiftx_10_9_8_7__s1(uint64 instruction);
-    uint64 extract_size_20_19_18_17_16(uint64 instruction);
-    uint64 extract_stripe_6(uint64 instruction);
-    uint64 extract_stype_20_19_18_17_16(uint64 instruction);
-    uint64 extract_u2_10_9(uint64 instruction);
-    uint64 extract_u_11_10_9_8_7_6_5_4_3_2_1_0(uint64 instruction);
-    uint64 extract_u_15_to_0(uint64 instruction);
-    uint64 extract_u_17_to_0(uint64 instruction);
-    uint64 extract_u_1_0(uint64 instruction);
-    uint64 extract_u_3_2_1_0__s1(uint64 instruction);
-    uint64 extract_u_2_1_0__s2(uint64 instruction);
-    uint64 extract_u_3_2_1_0__s2(uint64 instruction);
-    uint64 extract_u_4_3_2_1_0__s2(uint64 instruction);
-    uint64 extract_u_5_4_3_2_1_0__s2(uint64 instruction);
-    uint64 extract_u_6_5_4_3_2_1_0__s2(uint64 instruction);
-    uint64 extract_u_31_to_0__s32(uint64 instruction);
-    uint64 extract_u_10(uint64 instruction);
-    uint64 extract_u_17_16_15_14_13_12_11(uint64 instruction);
-    uint64 extract_u_20_19_18_17_16_15_14_13(uint64 instruction);
-    uint64 extract_u_17_to_1__s1(uint64 instruction);
-    uint64 extract_u_2_1__s1(uint64 instruction);
-    uint64 extract_u_17_to_2__s2(uint64 instruction);
-    uint64 extract_u_20_to_2__s2(uint64 instruction);
-    uint64 extract_u_20_to_3__s3(uint64 instruction);
-    uint64 extract_u_3_8__s2(uint64 instruction);
-    uint64 extract_u_11_10_9_8_7_6_5_4_3__s3(uint64 instruction);
-    uint64 extract_u_7_6_5_4__s4(uint64 instruction);
-
-    bool ADDIU_32__cond(uint64 instruction);
-    bool ADDIU_RS5__cond(uint64 instruction);
-    bool BALRSC_cond(uint64 instruction);
-    bool BEQC_16__cond(uint64 instruction);
-    bool BNEC_16__cond(uint64 instruction);
-    bool MOVE_cond(uint64 instruction);
-    bool P16_BR1_cond(uint64 instruction);
-    bool PREF_S9__cond(uint64 instruction);
-    bool PREFE_cond(uint64 instruction);
-    bool SLTU_cond(uint64 instruction);
-
-    std::string ABS_D(uint64 instruction);
-    std::string ABS_S(uint64 instruction);
-    std::string ABSQ_S_PH(uint64 instruction);
-    std::string ABSQ_S_QB(uint64 instruction);
-    std::string ABSQ_S_W(uint64 instruction);
-    std::string ACLR(uint64 instruction);
-    std::string ADD(uint64 instruction);
-    std::string ADD_D(uint64 instruction);
-    std::string ADD_S(uint64 instruction);
-    std::string ADDIU_32_(uint64 instruction);
-    std::string ADDIU_48_(uint64 instruction);
-    std::string ADDIU_GP48_(uint64 instruction);
-    std::string ADDIU_GP_B_(uint64 instruction);
-    std::string ADDIU_GP_W_(uint64 instruction);
-    std::string ADDIU_NEG_(uint64 instruction);
-    std::string ADDIU_R1_SP_(uint64 instruction);
-    std::string ADDIU_R2_(uint64 instruction);
-    std::string ADDIU_RS5_(uint64 instruction);
-    std::string ADDIUPC_32_(uint64 instruction);
-    std::string ADDIUPC_48_(uint64 instruction);
-    std::string ADDQ_PH(uint64 instruction);
-    std::string ADDQ_S_PH(uint64 instruction);
-    std::string ADDQ_S_W(uint64 instruction);
-    std::string ADDQH_PH(uint64 instruction);
-    std::string ADDQH_R_PH(uint64 instruction);
-    std::string ADDQH_R_W(uint64 instruction);
-    std::string ADDQH_W(uint64 instruction);
-    std::string ADDSC(uint64 instruction);
-    std::string ADDU_16_(uint64 instruction);
-    std::string ADDU_32_(uint64 instruction);
-    std::string ADDU_4X4_(uint64 instruction);
-    std::string ADDU_PH(uint64 instruction);
-    std::string ADDU_QB(uint64 instruction);
-    std::string ADDU_S_PH(uint64 instruction);
-    std::string ADDU_S_QB(uint64 instruction);
-    std::string ADDUH_QB(uint64 instruction);
-    std::string ADDUH_R_QB(uint64 instruction);
-    std::string ADDWC(uint64 instruction);
-    std::string ALUIPC(uint64 instruction);
-    std::string AND_16_(uint64 instruction);
-    std::string AND_32_(uint64 instruction);
-    std::string ANDI_16_(uint64 instruction);
-    std::string ANDI_32_(uint64 instruction);
-    std::string APPEND(uint64 instruction);
-    std::string ASET(uint64 instruction);
-    std::string BALC_16_(uint64 instruction);
-    std::string BALC_32_(uint64 instruction);
-    std::string BALRSC(uint64 instruction);
-    std::string BBEQZC(uint64 instruction);
-    std::string BBNEZC(uint64 instruction);
-    std::string BC_16_(uint64 instruction);
-    std::string BC_32_(uint64 instruction);
-    std::string BC1EQZC(uint64 instruction);
-    std::string BC1NEZC(uint64 instruction);
-    std::string BC2EQZC(uint64 instruction);
-    std::string BC2NEZC(uint64 instruction);
-    std::string BEQC_16_(uint64 instruction);
-    std::string BEQC_32_(uint64 instruction);
-    std::string BEQIC(uint64 instruction);
-    std::string BEQZC_16_(uint64 instruction);
-    std::string BGEC(uint64 instruction);
-    std::string BGEIC(uint64 instruction);
-    std::string BGEIUC(uint64 instruction);
-    std::string BGEUC(uint64 instruction);
-    std::string BLTC(uint64 instruction);
-    std::string BLTIC(uint64 instruction);
-    std::string BLTIUC(uint64 instruction);
-    std::string BLTUC(uint64 instruction);
-    std::string BNEC_16_(uint64 instruction);
-    std::string BNEC_32_(uint64 instruction);
-    std::string BNEIC(uint64 instruction);
-    std::string BNEZC_16_(uint64 instruction);
-    std::string BPOSGE32C(uint64 instruction);
-    std::string BREAK_16_(uint64 instruction);
-    std::string BREAK_32_(uint64 instruction);
-    std::string BRSC(uint64 instruction);
-    std::string CACHE(uint64 instruction);
-    std::string CACHEE(uint64 instruction);
-    std::string CEIL_L_D(uint64 instruction);
-    std::string CEIL_L_S(uint64 instruction);
-    std::string CEIL_W_D(uint64 instruction);
-    std::string CEIL_W_S(uint64 instruction);
-    std::string CFC1(uint64 instruction);
-    std::string CFC2(uint64 instruction);
-    std::string CLASS_D(uint64 instruction);
-    std::string CLASS_S(uint64 instruction);
-    std::string CLO(uint64 instruction);
-    std::string CLZ(uint64 instruction);
-    std::string CMP_AF_D(uint64 instruction);
-    std::string CMP_AF_S(uint64 instruction);
-    std::string CMP_EQ_D(uint64 instruction);
-    std::string CMP_EQ_PH(uint64 instruction);
-    std::string CMP_EQ_S(uint64 instruction);
-    std::string CMP_LE_D(uint64 instruction);
-    std::string CMP_LE_PH(uint64 instruction);
-    std::string CMP_LE_S(uint64 instruction);
-    std::string CMP_LT_D(uint64 instruction);
-    std::string CMP_LT_PH(uint64 instruction);
-    std::string CMP_LT_S(uint64 instruction);
-    std::string CMP_NE_D(uint64 instruction);
-    std::string CMP_NE_S(uint64 instruction);
-    std::string CMP_OR_D(uint64 instruction);
-    std::string CMP_OR_S(uint64 instruction);
-    std::string CMP_SAF_D(uint64 instruction);
-    std::string CMP_SAF_S(uint64 instruction);
-    std::string CMP_SEQ_D(uint64 instruction);
-    std::string CMP_SEQ_S(uint64 instruction);
-    std::string CMP_SLE_D(uint64 instruction);
-    std::string CMP_SLE_S(uint64 instruction);
-    std::string CMP_SLT_D(uint64 instruction);
-    std::string CMP_SLT_S(uint64 instruction);
-    std::string CMP_SNE_D(uint64 instruction);
-    std::string CMP_SNE_S(uint64 instruction);
-    std::string CMP_SOR_D(uint64 instruction);
-    std::string CMP_SOR_S(uint64 instruction);
-    std::string CMP_SUEQ_D(uint64 instruction);
-    std::string CMP_SUEQ_S(uint64 instruction);
-    std::string CMP_SULE_D(uint64 instruction);
-    std::string CMP_SULE_S(uint64 instruction);
-    std::string CMP_SULT_D(uint64 instruction);
-    std::string CMP_SULT_S(uint64 instruction);
-    std::string CMP_SUN_D(uint64 instruction);
-    std::string CMP_SUN_S(uint64 instruction);
-    std::string CMP_SUNE_D(uint64 instruction);
-    std::string CMP_SUNE_S(uint64 instruction);
-    std::string CMP_UEQ_D(uint64 instruction);
-    std::string CMP_UEQ_S(uint64 instruction);
-    std::string CMP_ULE_D(uint64 instruction);
-    std::string CMP_ULE_S(uint64 instruction);
-    std::string CMP_ULT_D(uint64 instruction);
-    std::string CMP_ULT_S(uint64 instruction);
-    std::string CMP_UN_D(uint64 instruction);
-    std::string CMP_UN_S(uint64 instruction);
-    std::string CMP_UNE_D(uint64 instruction);
-    std::string CMP_UNE_S(uint64 instruction);
-    std::string CMPGDU_EQ_QB(uint64 instruction);
-    std::string CMPGDU_LE_QB(uint64 instruction);
-    std::string CMPGDU_LT_QB(uint64 instruction);
-    std::string CMPGU_EQ_QB(uint64 instruction);
-    std::string CMPGU_LE_QB(uint64 instruction);
-    std::string CMPGU_LT_QB(uint64 instruction);
-    std::string CMPU_EQ_QB(uint64 instruction);
-    std::string CMPU_LE_QB(uint64 instruction);
-    std::string CMPU_LT_QB(uint64 instruction);
-    std::string COP2_1(uint64 instruction);
-    std::string CTC1(uint64 instruction);
-    std::string CTC2(uint64 instruction);
-    std::string CVT_D_L(uint64 instruction);
-    std::string CVT_D_S(uint64 instruction);
-    std::string CVT_D_W(uint64 instruction);
-    std::string CVT_L_D(uint64 instruction);
-    std::string CVT_L_S(uint64 instruction);
-    std::string CVT_S_D(uint64 instruction);
-    std::string CVT_S_L(uint64 instruction);
-    std::string CVT_S_PL(uint64 instruction);
-    std::string CVT_S_PU(uint64 instruction);
-    std::string CVT_S_W(uint64 instruction);
-    std::string CVT_W_D(uint64 instruction);
-    std::string CVT_W_S(uint64 instruction);
-    std::string DADDIU_48_(uint64 instruction);
-    std::string DADDIU_NEG_(uint64 instruction);
-    std::string DADDIU_U12_(uint64 instruction);
-    std::string DADD(uint64 instruction);
-    std::string DADDU(uint64 instruction);
-    std::string DCLO(uint64 instruction);
-    std::string DCLZ(uint64 instruction);
-    std::string DDIV(uint64 instruction);
-    std::string DDIVU(uint64 instruction);
-    std::string DERET(uint64 instruction);
-    std::string DEXTM(uint64 instruction);
-    std::string DEXT(uint64 instruction);
-    std::string DEXTU(uint64 instruction);
-    std::string DINSM(uint64 instruction);
-    std::string DINS(uint64 instruction);
-    std::string DINSU(uint64 instruction);
-    std::string DI(uint64 instruction);
-    std::string DIV(uint64 instruction);
-    std::string DIV_D(uint64 instruction);
-    std::string DIV_S(uint64 instruction);
-    std::string DIVU(uint64 instruction);
-    std::string DLSA(uint64 instruction);
-    std::string DLUI_48_(uint64 instruction);
-    std::string DMFC0(uint64 instruction);
-    std::string DMFC1(uint64 instruction);
-    std::string DMFC2(uint64 instruction);
-    std::string DMFGC0(uint64 instruction);
-    std::string DMOD(uint64 instruction);
-    std::string DMODU(uint64 instruction);
-    std::string DMTC0(uint64 instruction);
-    std::string DMTC1(uint64 instruction);
-    std::string DMTC2(uint64 instruction);
-    std::string DMTGC0(uint64 instruction);
-    std::string DMT(uint64 instruction);
-    std::string DMUH(uint64 instruction);
-    std::string DMUHU(uint64 instruction);
-    std::string DMUL(uint64 instruction);
-    std::string DMULU(uint64 instruction);
-    std::string DPAQ_S_W_PH(uint64 instruction);
-    std::string DPAQ_SA_L_W(uint64 instruction);
-    std::string DPAQX_S_W_PH(uint64 instruction);
-    std::string DPAQX_SA_W_PH(uint64 instruction);
-    std::string DPAU_H_QBL(uint64 instruction);
-    std::string DPAU_H_QBR(uint64 instruction);
-    std::string DPA_W_PH(uint64 instruction);
-    std::string DPAX_W_PH(uint64 instruction);
-    std::string DPS_W_PH(uint64 instruction);
-    std::string DPSQ_SA_L_W(uint64 instruction);
-    std::string DPSQ_S_W_PH(uint64 instruction);
-    std::string DPSQX_SA_W_PH(uint64 instruction);
-    std::string DPSQX_S_W_PH(uint64 instruction);
-    std::string DPSU_H_QBL(uint64 instruction);
-    std::string DPSU_H_QBR(uint64 instruction);
-    std::string DPSX_W_PH(uint64 instruction);
-    std::string DROTR(uint64 instruction);
-    std::string DROTR32(uint64 instruction);
-    std::string DROTRV(uint64 instruction);
-    std::string DROTX(uint64 instruction);
-    std::string DSLL(uint64 instruction);
-    std::string DSLL32(uint64 instruction);
-    std::string DSLLV(uint64 instruction);
-    std::string DSRA(uint64 instruction);
-    std::string DSRA32(uint64 instruction);
-    std::string DSRAV(uint64 instruction);
-    std::string DSRL32(uint64 instruction);
-    std::string DSRL(uint64 instruction);
-    std::string DSRLV(uint64 instruction);
-    std::string DSUB(uint64 instruction);
-    std::string DSUBU(uint64 instruction);
-    std::string DVP(uint64 instruction);
-    std::string DVPE(uint64 instruction);
-    std::string EHB(uint64 instruction);
-    std::string EI(uint64 instruction);
-    std::string EMT(uint64 instruction);
-    std::string ERET(uint64 instruction);
-    std::string ERETNC(uint64 instruction);
-    std::string EVP(uint64 instruction);
-    std::string EVPE(uint64 instruction);
-    std::string EXT(uint64 instruction);
-    std::string EXTD(uint64 instruction);
-    std::string EXTD32(uint64 instruction);
-    std::string EXTP(uint64 instruction);
-    std::string EXTPDP(uint64 instruction);
-    std::string EXTPDPV(uint64 instruction);
-    std::string EXTPV(uint64 instruction);
-    std::string EXTR_RS_W(uint64 instruction);
-    std::string EXTR_R_W(uint64 instruction);
-    std::string EXTR_S_H(uint64 instruction);
-    std::string EXTR_W(uint64 instruction);
-    std::string EXTRV_R_W(uint64 instruction);
-    std::string EXTRV_RS_W(uint64 instruction);
-    std::string EXTRV_S_H(uint64 instruction);
-    std::string EXTRV_W(uint64 instruction);
-    std::string EXTW(uint64 instruction);
-    std::string FLOOR_L_D(uint64 instruction);
-    std::string FLOOR_L_S(uint64 instruction);
-    std::string FLOOR_W_D(uint64 instruction);
-    std::string FLOOR_W_S(uint64 instruction);
-    std::string FORK(uint64 instruction);
-    std::string HYPCALL(uint64 instruction);
-    std::string HYPCALL_16_(uint64 instruction);
-    std::string INS(uint64 instruction);
-    std::string INSV(uint64 instruction);
-    std::string IRET(uint64 instruction);
-    std::string JALRC_16_(uint64 instruction);
-    std::string JALRC_32_(uint64 instruction);
-    std::string JALRC_HB(uint64 instruction);
-    std::string JRC(uint64 instruction);
-    std::string LB_16_(uint64 instruction);
-    std::string LB_GP_(uint64 instruction);
-    std::string LB_S9_(uint64 instruction);
-    std::string LB_U12_(uint64 instruction);
-    std::string LBE(uint64 instruction);
-    std::string LBU_16_(uint64 instruction);
-    std::string LBU_GP_(uint64 instruction);
-    std::string LBU_S9_(uint64 instruction);
-    std::string LBU_U12_(uint64 instruction);
-    std::string LBUE(uint64 instruction);
-    std::string LBUX(uint64 instruction);
-    std::string LBX(uint64 instruction);
-    std::string LD_GP_(uint64 instruction);
-    std::string LD_S9_(uint64 instruction);
-    std::string LD_U12_(uint64 instruction);
-    std::string LDC1_GP_(uint64 instruction);
-    std::string LDC1_S9_(uint64 instruction);
-    std::string LDC1_U12_(uint64 instruction);
-    std::string LDC1X(uint64 instruction);
-    std::string LDC1XS(uint64 instruction);
-    std::string LDC2(uint64 instruction);
-    std::string LDM(uint64 instruction);
-    std::string LDPC_48_(uint64 instruction);
-    std::string LDX(uint64 instruction);
-    std::string LDXS(uint64 instruction);
-    std::string LH_16_(uint64 instruction);
-    std::string LH_GP_(uint64 instruction);
-    std::string LH_S9_(uint64 instruction);
-    std::string LH_U12_(uint64 instruction);
-    std::string LHE(uint64 instruction);
-    std::string LHU_16_(uint64 instruction);
-    std::string LHU_GP_(uint64 instruction);
-    std::string LHU_S9_(uint64 instruction);
-    std::string LHU_U12_(uint64 instruction);
-    std::string LHUE(uint64 instruction);
-    std::string LHUX(uint64 instruction);
-    std::string LHUXS(uint64 instruction);
-    std::string LHX(uint64 instruction);
-    std::string LHXS(uint64 instruction);
-    std::string LI_16_(uint64 instruction);
-    std::string LI_48_(uint64 instruction);
-    std::string LL(uint64 instruction);
-    std::string LLD(uint64 instruction);
-    std::string LLDP(uint64 instruction);
-    std::string LLE(uint64 instruction);
-    std::string LLWP(uint64 instruction);
-    std::string LLWPE(uint64 instruction);
-    std::string LSA(uint64 instruction);
-    std::string LUI(uint64 instruction);
-    std::string LW_16_(uint64 instruction);
-    std::string LW_4X4_(uint64 instruction);
-    std::string LWC1_GP_(uint64 instruction);
-    std::string LWC1_S9_(uint64 instruction);
-    std::string LWC1_U12_(uint64 instruction);
-    std::string LWC1X(uint64 instruction);
-    std::string LWC1XS(uint64 instruction);
-    std::string LWC2(uint64 instruction);
-    std::string LWE(uint64 instruction);
-    std::string LW_GP_(uint64 instruction);
-    std::string LW_GP16_(uint64 instruction);
-    std::string LWM(uint64 instruction);
-    std::string LWPC_48_(uint64 instruction);
-    std::string LW_S9_(uint64 instruction);
-    std::string LW_SP_(uint64 instruction);
-    std::string LW_U12_(uint64 instruction);
-    std::string LWU_GP_(uint64 instruction);
-    std::string LWU_S9_(uint64 instruction);
-    std::string LWU_U12_(uint64 instruction);
-    std::string LWUX(uint64 instruction);
-    std::string LWUXS(uint64 instruction);
-    std::string LWX(uint64 instruction);
-    std::string LWXS_16_(uint64 instruction);
-    std::string LWXS_32_(uint64 instruction);
-    std::string MADD_DSP_(uint64 instruction);
-    std::string MADDF_D(uint64 instruction);
-    std::string MADDF_S(uint64 instruction);
-    std::string MADDU_DSP_(uint64 instruction);
-    std::string MAQ_S_W_PHL(uint64 instruction);
-    std::string MAQ_S_W_PHR(uint64 instruction);
-    std::string MAQ_SA_W_PHL(uint64 instruction);
-    std::string MAQ_SA_W_PHR(uint64 instruction);
-    std::string MAX_D(uint64 instruction);
-    std::string MAX_S(uint64 instruction);
-    std::string MAXA_D(uint64 instruction);
-    std::string MAXA_S(uint64 instruction);
-    std::string MFC0(uint64 instruction);
-    std::string MFC1(uint64 instruction);
-    std::string MFC2(uint64 instruction);
-    std::string MFGC0(uint64 instruction);
-    std::string MFHC0(uint64 instruction);
-    std::string MFHC1(uint64 instruction);
-    std::string MFHC2(uint64 instruction);
-    std::string MFHGC0(uint64 instruction);
-    std::string MFHI_DSP_(uint64 instruction);
-    std::string MFHTR(uint64 instruction);
-    std::string MFLO_DSP_(uint64 instruction);
-    std::string MFTR(uint64 instruction);
-    std::string MIN_D(uint64 instruction);
-    std::string MIN_S(uint64 instruction);
-    std::string MINA_D(uint64 instruction);
-    std::string MINA_S(uint64 instruction);
-    std::string MOD(uint64 instruction);
-    std::string MODSUB(uint64 instruction);
-    std::string MODU(uint64 instruction);
-    std::string MOV_D(uint64 instruction);
-    std::string MOV_S(uint64 instruction);
-    std::string MOVE_BALC(uint64 instruction);
-    std::string MOVEP(uint64 instruction);
-    std::string MOVEP_REV_(uint64 instruction);
-    std::string MOVE(uint64 instruction);
-    std::string MOVN(uint64 instruction);
-    std::string MOVZ(uint64 instruction);
-    std::string MSUB_DSP_(uint64 instruction);
-    std::string MSUBF_D(uint64 instruction);
-    std::string MSUBF_S(uint64 instruction);
-    std::string MSUBU_DSP_(uint64 instruction);
-    std::string MTC0(uint64 instruction);
-    std::string MTC1(uint64 instruction);
-    std::string MTC2(uint64 instruction);
-    std::string MTGC0(uint64 instruction);
-    std::string MTHC0(uint64 instruction);
-    std::string MTHC1(uint64 instruction);
-    std::string MTHC2(uint64 instruction);
-    std::string MTHGC0(uint64 instruction);
-    std::string MTHI_DSP_(uint64 instruction);
-    std::string MTHLIP(uint64 instruction);
-    std::string MTHTR(uint64 instruction);
-    std::string MTLO_DSP_(uint64 instruction);
-    std::string MTTR(uint64 instruction);
-    std::string MUH(uint64 instruction);
-    std::string MUHU(uint64 instruction);
-    std::string MUL_32_(uint64 instruction);
-    std::string MUL_4X4_(uint64 instruction);
-    std::string MUL_D(uint64 instruction);
-    std::string MUL_PH(uint64 instruction);
-    std::string MUL_S(uint64 instruction);
-    std::string MUL_S_PH(uint64 instruction);
-    std::string MULEQ_S_W_PHL(uint64 instruction);
-    std::string MULEQ_S_W_PHR(uint64 instruction);
-    std::string MULEU_S_PH_QBL(uint64 instruction);
-    std::string MULEU_S_PH_QBR(uint64 instruction);
-    std::string MULQ_RS_PH(uint64 instruction);
-    std::string MULQ_RS_W(uint64 instruction);
-    std::string MULQ_S_PH(uint64 instruction);
-    std::string MULQ_S_W(uint64 instruction);
-    std::string MULSA_W_PH(uint64 instruction);
-    std::string MULSAQ_S_W_PH(uint64 instruction);
-    std::string MULT_DSP_(uint64 instruction);
-    std::string MULTU_DSP_(uint64 instruction);
-    std::string MULU(uint64 instruction);
-    std::string NEG_D(uint64 instruction);
-    std::string NEG_S(uint64 instruction);
-    std::string NOP_16_(uint64 instruction);
-    std::string NOP_32_(uint64 instruction);
-    std::string NOR(uint64 instruction);
-    std::string NOT_16_(uint64 instruction);
-    std::string OR_16_(uint64 instruction);
-    std::string OR_32_(uint64 instruction);
-    std::string ORI(uint64 instruction);
-    std::string PACKRL_PH(uint64 instruction);
-    std::string PAUSE(uint64 instruction);
-    std::string PICK_PH(uint64 instruction);
-    std::string PICK_QB(uint64 instruction);
-    std::string PRECEQ_W_PHL(uint64 instruction);
-    std::string PRECEQ_W_PHR(uint64 instruction);
-    std::string PRECEQU_PH_QBL(uint64 instruction);
-    std::string PRECEQU_PH_QBLA(uint64 instruction);
-    std::string PRECEQU_PH_QBR(uint64 instruction);
-    std::string PRECEQU_PH_QBRA(uint64 instruction);
-    std::string PRECEU_PH_QBL(uint64 instruction);
-    std::string PRECEU_PH_QBLA(uint64 instruction);
-    std::string PRECEU_PH_QBR(uint64 instruction);
-    std::string PRECEU_PH_QBRA(uint64 instruction);
-    std::string PRECR_QB_PH(uint64 instruction);
-    std::string PRECR_SRA_PH_W(uint64 instruction);
-    std::string PRECR_SRA_R_PH_W(uint64 instruction);
-    std::string PRECRQ_PH_W(uint64 instruction);
-    std::string PRECRQ_QB_PH(uint64 instruction);
-    std::string PRECRQ_RS_PH_W(uint64 instruction);
-    std::string PRECRQU_S_QB_PH(uint64 instruction);
-    std::string PREF_S9_(uint64 instruction);
-    std::string PREF_U12_(uint64 instruction);
-    std::string PREFE(uint64 instruction);
-    std::string PREPEND(uint64 instruction);
-    std::string RADDU_W_QB(uint64 instruction);
-    std::string RDDSP(uint64 instruction);
-    std::string RDHWR(uint64 instruction);
-    std::string RDPGPR(uint64 instruction);
-    std::string RECIP_D(uint64 instruction);
-    std::string RECIP_S(uint64 instruction);
-    std::string REPL_PH(uint64 instruction);
-    std::string REPL_QB(uint64 instruction);
-    std::string REPLV_PH(uint64 instruction);
-    std::string REPLV_QB(uint64 instruction);
-    std::string RESTORE_32_(uint64 instruction);
-    std::string RESTORE_JRC_16_(uint64 instruction);
-    std::string RESTORE_JRC_32_(uint64 instruction);
-    std::string RESTOREF(uint64 instruction);
-    std::string RINT_D(uint64 instruction);
-    std::string RINT_S(uint64 instruction);
-    std::string ROTR(uint64 instruction);
-    std::string ROTRV(uint64 instruction);
-    std::string ROTX(uint64 instruction);
-    std::string ROUND_L_D(uint64 instruction);
-    std::string ROUND_L_S(uint64 instruction);
-    std::string ROUND_W_D(uint64 instruction);
-    std::string ROUND_W_S(uint64 instruction);
-    std::string RSQRT_D(uint64 instruction);
-    std::string RSQRT_S(uint64 instruction);
-    std::string SAVE_16_(uint64 instruction);
-    std::string SAVE_32_(uint64 instruction);
-    std::string SAVEF(uint64 instruction);
-    std::string SB_16_(uint64 instruction);
-    std::string SB_GP_(uint64 instruction);
-    std::string SB_S9_(uint64 instruction);
-    std::string SB_U12_(uint64 instruction);
-    std::string SBE(uint64 instruction);
-    std::string SBX(uint64 instruction);
-    std::string SC(uint64 instruction);
-    std::string SCD(uint64 instruction);
-    std::string SCDP(uint64 instruction);
-    std::string SCE(uint64 instruction);
-    std::string SCWP(uint64 instruction);
-    std::string SCWPE(uint64 instruction);
-    std::string SD_GP_(uint64 instruction);
-    std::string SD_S9_(uint64 instruction);
-    std::string SD_U12_(uint64 instruction);
-    std::string SDBBP_16_(uint64 instruction);
-    std::string SDBBP_32_(uint64 instruction);
-    std::string SDC1_GP_(uint64 instruction);
-    std::string SDC1_S9_(uint64 instruction);
-    std::string SDC1_U12_(uint64 instruction);
-    std::string SDC1X(uint64 instruction);
-    std::string SDC1XS(uint64 instruction);
-    std::string SDC2(uint64 instruction);
-    std::string SDM(uint64 instruction);
-    std::string SDPC_48_(uint64 instruction);
-    std::string SDX(uint64 instruction);
-    std::string SDXS(uint64 instruction);
-    std::string SEB(uint64 instruction);
-    std::string SEH(uint64 instruction);
-    std::string SEL_D(uint64 instruction);
-    std::string SEL_S(uint64 instruction);
-    std::string SELEQZ_D(uint64 instruction);
-    std::string SELEQZ_S(uint64 instruction);
-    std::string SELNEZ_D(uint64 instruction);
-    std::string SELNEZ_S(uint64 instruction);
-    std::string SEQI(uint64 instruction);
-    std::string SH_16_(uint64 instruction);
-    std::string SH_GP_(uint64 instruction);
-    std::string SH_S9_(uint64 instruction);
-    std::string SH_U12_(uint64 instruction);
-    std::string SHE(uint64 instruction);
-    std::string SHILO(uint64 instruction);
-    std::string SHILOV(uint64 instruction);
-    std::string SHLL_PH(uint64 instruction);
-    std::string SHLL_QB(uint64 instruction);
-    std::string SHLL_S_PH(uint64 instruction);
-    std::string SHLL_S_W(uint64 instruction);
-    std::string SHLLV_PH(uint64 instruction);
-    std::string SHLLV_QB(uint64 instruction);
-    std::string SHLLV_S_PH(uint64 instruction);
-    std::string SHLLV_S_W(uint64 instruction);
-    std::string SHRA_PH(uint64 instruction);
-    std::string SHRA_QB(uint64 instruction);
-    std::string SHRA_R_PH(uint64 instruction);
-    std::string SHRA_R_QB(uint64 instruction);
-    std::string SHRA_R_W(uint64 instruction);
-    std::string SHRAV_PH(uint64 instruction);
-    std::string SHRAV_QB(uint64 instruction);
-    std::string SHRAV_R_PH(uint64 instruction);
-    std::string SHRAV_R_QB(uint64 instruction);
-    std::string SHRAV_R_W(uint64 instruction);
-    std::string SHRL_PH(uint64 instruction);
-    std::string SHRL_QB(uint64 instruction);
-    std::string SHRLV_PH(uint64 instruction);
-    std::string SHRLV_QB(uint64 instruction);
-    std::string SHX(uint64 instruction);
-    std::string SHXS(uint64 instruction);
-    std::string SIGRIE(uint64 instruction);
-    std::string SLL_16_(uint64 instruction);
-    std::string SLL_32_(uint64 instruction);
-    std::string SLLV(uint64 instruction);
-    std::string SLT(uint64 instruction);
-    std::string SLTI(uint64 instruction);
-    std::string SLTIU(uint64 instruction);
-    std::string SLTU(uint64 instruction);
-    std::string SOV(uint64 instruction);
-    std::string SPECIAL2(uint64 instruction);
-    std::string SQRT_D(uint64 instruction);
-    std::string SQRT_S(uint64 instruction);
-    std::string SRA(uint64 instruction);
-    std::string SRAV(uint64 instruction);
-    std::string SRL_16_(uint64 instruction);
-    std::string SRL_32_(uint64 instruction);
-    std::string SRLV(uint64 instruction);
-    std::string SUB(uint64 instruction);
-    std::string SUB_D(uint64 instruction);
-    std::string SUB_S(uint64 instruction);
-    std::string SUBQ_PH(uint64 instruction);
-    std::string SUBQ_S_PH(uint64 instruction);
-    std::string SUBQ_S_W(uint64 instruction);
-    std::string SUBQH_PH(uint64 instruction);
-    std::string SUBQH_R_PH(uint64 instruction);
-    std::string SUBQH_R_W(uint64 instruction);
-    std::string SUBQH_W(uint64 instruction);
-    std::string SUBU_16_(uint64 instruction);
-    std::string SUBU_32_(uint64 instruction);
-    std::string SUBU_PH(uint64 instruction);
-    std::string SUBU_QB(uint64 instruction);
-    std::string SUBU_S_PH(uint64 instruction);
-    std::string SUBU_S_QB(uint64 instruction);
-    std::string SUBUH_QB(uint64 instruction);
-    std::string SUBUH_R_QB(uint64 instruction);
-    std::string SW_16_(uint64 instruction);
-    std::string SW_4X4_(uint64 instruction);
-    std::string SW_GP16_(uint64 instruction);
-    std::string SW_GP_(uint64 instruction);
-    std::string SW_S9_(uint64 instruction);
-    std::string SW_SP_(uint64 instruction);
-    std::string SW_U12_(uint64 instruction);
-    std::string SWC1_GP_(uint64 instruction);
-    std::string SWC1_S9_(uint64 instruction);
-    std::string SWC1_U12_(uint64 instruction);
-    std::string SWC1X(uint64 instruction);
-    std::string SWC1XS(uint64 instruction);
-    std::string SWC2(uint64 instruction);
-    std::string SWE(uint64 instruction);
-    std::string SWM(uint64 instruction);
-    std::string SWPC_48_(uint64 instruction);
-    std::string SWX(uint64 instruction);
-    std::string SWXS(uint64 instruction);
-    std::string SYNC(uint64 instruction);
-    std::string SYNCI(uint64 instruction);
-    std::string SYNCIE(uint64 instruction);
-    std::string SYSCALL_16_(uint64 instruction);
-    std::string SYSCALL_32_(uint64 instruction);
-    std::string TEQ(uint64 instruction);
-    std::string TLBGINV(uint64 instruction);
-    std::string TLBGINVF(uint64 instruction);
-    std::string TLBGP(uint64 instruction);
-    std::string TLBGR(uint64 instruction);
-    std::string TLBGWI(uint64 instruction);
-    std::string TLBGWR(uint64 instruction);
-    std::string TLBINV(uint64 instruction);
-    std::string TLBINVF(uint64 instruction);
-    std::string TLBP(uint64 instruction);
-    std::string TLBR(uint64 instruction);
-    std::string TLBWI(uint64 instruction);
-    std::string TLBWR(uint64 instruction);
-    std::string TNE(uint64 instruction);
-    std::string TRUNC_L_D(uint64 instruction);
-    std::string TRUNC_L_S(uint64 instruction);
-    std::string TRUNC_W_D(uint64 instruction);
-    std::string TRUNC_W_S(uint64 instruction);
-    std::string UALDM(uint64 instruction);
-    std::string UALH(uint64 instruction);
-    std::string UALWM(uint64 instruction);
-    std::string UASDM(uint64 instruction);
-    std::string UASH(uint64 instruction);
-    std::string UASWM(uint64 instruction);
-    std::string UDI(uint64 instruction);
-    std::string WAIT(uint64 instruction);
-    std::string WRDSP(uint64 instruction);
-    std::string WRPGPR(uint64 instruction);
-    std::string XOR_16_(uint64 instruction);
-    std::string XOR_32_(uint64 instruction);
-    std::string XORI(uint64 instruction);
-    std::string YIELD(uint64 instruction);
-
-    static Pool P_SYSCALL[2];
-    static Pool P_RI[4];
-    static Pool P_ADDIU[2];
-    static Pool P_TRAP[2];
-    static Pool P_CMOVE[2];
-    static Pool P_D_MT_VPE[2];
-    static Pool P_E_MT_VPE[2];
-    static Pool _P_MT_VPE[2];
-    static Pool P_MT_VPE[8];
-    static Pool P_DVP[2];
-    static Pool P_SLTU[2];
-    static Pool _POOL32A0[128];
-    static Pool ADDQ__S__PH[2];
-    static Pool MUL__S__PH[2];
-    static Pool ADDQH__R__PH[2];
-    static Pool ADDQH__R__W[2];
-    static Pool ADDU__S__QB[2];
-    static Pool ADDU__S__PH[2];
-    static Pool ADDUH__R__QB[2];
-    static Pool SHRAV__R__PH[2];
-    static Pool SHRAV__R__QB[2];
-    static Pool SUBQ__S__PH[2];
-    static Pool SUBQH__R__PH[2];
-    static Pool SUBQH__R__W[2];
-    static Pool SUBU__S__QB[2];
-    static Pool SUBU__S__PH[2];
-    static Pool SHRA__R__PH[2];
-    static Pool SUBUH__R__QB[2];
-    static Pool SHLLV__S__PH[2];
-    static Pool SHLL__S__PH[4];
-    static Pool PRECR_SRA__R__PH_W[2];
-    static Pool _POOL32A5[128];
-    static Pool PP_LSX[16];
-    static Pool PP_LSXS[16];
-    static Pool P_LSX[2];
-    static Pool POOL32Axf_1_0[4];
-    static Pool POOL32Axf_1_1[4];
-    static Pool POOL32Axf_1_3[4];
-    static Pool POOL32Axf_1_4[2];
-    static Pool MAQ_S_A__W_PHR[2];
-    static Pool MAQ_S_A__W_PHL[2];
-    static Pool POOL32Axf_1_5[2];
-    static Pool POOL32Axf_1_7[4];
-    static Pool POOL32Axf_1[8];
-    static Pool POOL32Axf_2_DSP__0_7[8];
-    static Pool POOL32Axf_2_DSP__8_15[8];
-    static Pool POOL32Axf_2_DSP__16_23[8];
-    static Pool POOL32Axf_2_DSP__24_31[8];
-    static Pool POOL32Axf_2[4];
-    static Pool POOL32Axf_4[128];
-    static Pool POOL32Axf_5_group0[32];
-    static Pool POOL32Axf_5_group1[32];
-    static Pool ERETx[2];
-    static Pool POOL32Axf_5_group3[32];
-    static Pool POOL32Axf_5[4];
-    static Pool SHRA__R__QB[2];
-    static Pool POOL32Axf_7[8];
-    static Pool POOL32Axf[8];
-    static Pool _POOL32A7[8];
-    static Pool P32A[8];
-    static Pool P_GP_D[2];
-    static Pool P_GP_W[4];
-    static Pool POOL48I[32];
-    static Pool PP_SR[4];
-    static Pool P_SR_F[8];
-    static Pool P_SR[2];
-    static Pool P_SLL[5];
-    static Pool P_SHIFT[16];
-    static Pool P_ROTX[4];
-    static Pool P_INS[4];
-    static Pool P_EXT[4];
-    static Pool P_U12[16];
-    static Pool RINT_fmt[2];
-    static Pool ADD_fmt0[2];
-    static Pool SELEQZ_fmt[2];
-    static Pool CLASS_fmt[2];
-    static Pool SUB_fmt0[2];
-    static Pool SELNEZ_fmt[2];
-    static Pool MUL_fmt0[2];
-    static Pool SEL_fmt[2];
-    static Pool DIV_fmt0[2];
-    static Pool ADD_fmt1[2];
-    static Pool SUB_fmt1[2];
-    static Pool MUL_fmt1[2];
-    static Pool MADDF_fmt[2];
-    static Pool DIV_fmt1[2];
-    static Pool MSUBF_fmt[2];
-    static Pool POOL32F_0[64];
-    static Pool MIN_fmt[2];
-    static Pool MAX_fmt[2];
-    static Pool MINA_fmt[2];
-    static Pool MAXA_fmt[2];
-    static Pool CVT_L_fmt[2];
-    static Pool RSQRT_fmt[2];
-    static Pool FLOOR_L_fmt[2];
-    static Pool CVT_W_fmt[2];
-    static Pool SQRT_fmt[2];
-    static Pool FLOOR_W_fmt[2];
-    static Pool RECIP_fmt[2];
-    static Pool CEIL_L_fmt[2];
-    static Pool CEIL_W_fmt[2];
-    static Pool TRUNC_L_fmt[2];
-    static Pool TRUNC_W_fmt[2];
-    static Pool ROUND_L_fmt[2];
-    static Pool ROUND_W_fmt[2];
-    static Pool POOL32Fxf_0[64];
-    static Pool MOV_fmt[4];
-    static Pool ABS_fmt[4];
-    static Pool NEG_fmt[4];
-    static Pool CVT_D_fmt[4];
-    static Pool CVT_S_fmt[4];
-    static Pool POOL32Fxf_1[32];
-    static Pool POOL32Fxf[4];
-    static Pool POOL32F_3[8];
-    static Pool CMP_condn_S[32];
-    static Pool CMP_condn_D[32];
-    static Pool POOL32F_5[8];
-    static Pool POOL32F[8];
-    static Pool POOL32S_0[64];
-    static Pool POOL32Sxf_4[128];
-    static Pool POOL32Sxf[8];
-    static Pool POOL32S_4[8];
-    static Pool POOL32S[8];
-    static Pool P_LUI[2];
-    static Pool P_GP_LH[2];
-    static Pool P_GP_SH[2];
-    static Pool P_GP_CP1[4];
-    static Pool P_GP_M64[4];
-    static Pool P_GP_BH[8];
-    static Pool P_LS_U12[16];
-    static Pool P_PREF_S9_[2];
-    static Pool P_LS_S0[16];
-    static Pool ASET_ACLR[2];
-    static Pool P_LL[4];
-    static Pool P_SC[4];
-    static Pool P_LLD[8];
-    static Pool P_SCD[8];
-    static Pool P_LS_S1[16];
-    static Pool P_PREFE[2];
-    static Pool P_LLE[4];
-    static Pool P_SCE[4];
-    static Pool P_LS_E0[16];
-    static Pool P_LS_WM[2];
-    static Pool P_LS_UAWM[2];
-    static Pool P_LS_DM[2];
-    static Pool P_LS_UADM[2];
-    static Pool P_LS_S9[8];
-    static Pool P_BAL[2];
-    static Pool P_BALRSC[2];
-    static Pool P_J[16];
-    static Pool P_BR3A[32];
-    static Pool P_BR1[4];
-    static Pool P_BR2[4];
-    static Pool P_BRI[8];
-    static Pool P32[32];
-    static Pool P16_SYSCALL[2];
-    static Pool P16_RI[4];
-    static Pool P16_MV[2];
-    static Pool P16_SHIFT[2];
-    static Pool POOL16C_00[4];
-    static Pool POOL16C_0[2];
-    static Pool P16C[2];
-    static Pool P16_A1[2];
-    static Pool P_ADDIU_RS5_[2];
-    static Pool P16_A2[2];
-    static Pool P16_ADDU[2];
-    static Pool P16_JRC[2];
-    static Pool P16_BR1[2];
-    static Pool P16_BR[2];
-    static Pool P16_SR[2];
-    static Pool P16_4X4[4];
-    static Pool P16_LB[4];
-    static Pool P16_LH[4];
-    static Pool P16[32];
-    static Pool MAJOR[2];
-
-};
-
-#endif
-- 
2.25.1


