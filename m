Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B69F69E3CF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 16:44:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUnz-0004m5-7h; Tue, 21 Feb 2023 10:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1pUUnn-0004jE-0h
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:43:35 -0500
Received: from mail-mw2nam04on2062c.outbound.protection.outlook.com
 ([2a01:111:f400:7e8c::62c]
 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1pUUnk-0002og-MI
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:43:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dE/lWM/i4HdtoeTBJlMdVXTMPmjp0BQHjsEEuuIMbB4EeZiwRWPynHf2+p0PiEd7aYC7tmSIw1a/4s76JMRIrInlLY/GlvnsvT09gCudKBMdCPwweaAv73LdUCswW2PgS+ebNl31irelU/VQwIURRXR/4uUxhv6CO5FQ8KvhGfNDBKB+kKyxdWmNhK/qNczVqss5UqvX8g9E0kSQC273/80BmzumDfStms16o15pdWn+IF6LM9e+32QRQfMalzhCMh3BA/tZ0awT/063gTEHzdziS3pjlw04SRz/2GInaaVy/FRc8fTqKFmLXb+pxRqJOlOoo2EGf0+71phJ8CL9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dp8g0MWKFIGewmOGd0ZwpTSIdHqOptTcDHNAzXGgofE=;
 b=Lr0ebwi9BF1gP/+mUnumCMTcxh9rqnUDP3MZcXEXV4mCWq3ZgG+yhWnWtP2yVuMd5phdAwy5Og0c1iodsHcfcPVBCg+uQa6B0Q4WTejRNSZcNNKQVGcf7UJgepbUe5BnbXQ6LgoAxdygJ8rdEyEut2gvTmkjo3zF9BnYxKfgZuARWHA9wUY0oLV2hiXYxU1s9TjLoOWYUW+0xcu6XD2P0eL+1NZQojEyVS7a+SEdp1ASC80bDJEdus2y2kGDJUjlAWN8/wK8pNmVj6X77/MaaQIjchL0QM2g+0EcBLitfBWkFUENiyqDOiz2+4OcRAEK1PQS8fGCqUTcnY/Yo0+ukg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=memverge.com; dmarc=pass action=none header.from=memverge.com;
 dkim=pass header.d=memverge.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=memverge.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dp8g0MWKFIGewmOGd0ZwpTSIdHqOptTcDHNAzXGgofE=;
 b=cR+TLb8EoDBNHoo1KVx+KCSgu04aFMdYbAundym7YyDjcY2mu2eu2prBPv7Gb2yFJoAAJIruWWcJqx4vAKIJ3sqg+mqnGAtDrQn3+CFfeGAVtbXTFs42BilTe/hGqIn/P1H5Zj6QdEXvI40JtkMvmBPboei0e0f3Wj+he/iBjnw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=memverge.com;
Received: from BN6PR17MB3121.namprd17.prod.outlook.com (2603:10b6:405:7c::19)
 by SA0PR17MB4190.namprd17.prod.outlook.com (2603:10b6:806:84::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Tue, 21 Feb
 2023 15:43:18 +0000
Received: from BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::d253:1eb3:9347:c660]) by BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::d253:1eb3:9347:c660%3]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 15:43:17 +0000
Date: Sat, 18 Feb 2023 05:22:30 -0500
From: Gregory Price <gregory.price@memverge.com>
To: qemu-devel@nongnu.org, linux-cxl@vger.kernel.org
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [RFC] CXL: TCG/KVM instruction alignment issue discussion default
Message-ID: <Y/Cm5nuJl3G2CG2p@memverge.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR13CA0195.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::20) To BN6PR17MB3121.namprd17.prod.outlook.com
 (2603:10b6:405:7c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR17MB3121:EE_|SA0PR17MB4190:EE_
X-MS-Office365-Filtering-Correlation-Id: 969ac84f-f7a0-4324-3f2c-08db142259e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2hR/tF4CJ9+UDXrZqh7SDJMmERB6YZJ+b7psjVdR1okXejEQLVwdiUcjVORuOwev6ru7YlqmH4YMOQIq/vXjPJkhUWZ29pChB+wzKUFbyJt8xDY9ktlKexGx9eDz1FQ7AEJrFmFuZ6Q/tXpoJuZSgOoVt/WzIysg/y6yXMEv6GOj7SUyb80uh/XEbR4tHP2FNOdemTCITjH1vZgkhcGyZb+/+NnRmRhDATD095DSJ4l69cFXRk5s/kPDgxGE7auMARZHoND7HMfcE117+Rz6tkKuUo/JaZE3snl4bARZAsxHVvoZQKFw7FwuaEmN3nWH2Q+YZBIsy5iGT06hmGeRoLLpp4IwRztjWKzdwjw3mBwo5XFkyHSmjlLK4c3gkyEm1+8lBz8RHcYAmGbU9p/sSAVRgYaXyQ7NeulnFk74hDlgWhYAEWbAaMgbF7dg4vXl5KNmzttYkLLHflhdMQKZwC0BcTqB2BTSEdNI1e/OR5+DXkK7+0oXUd9UVixFwGUGmUIe5Lye3DhVTB1R0uEL+p/teeF/5pW7iG3Ig9wB8s2Xf/ZNotYOey4DegTwOHZzRdKNN2C4GzZ1alSbJqLlEu5g8mA86TEJA2K51b1ajJUtKTYnOugQe17sbrCBPO2wFE5s4dfju09DxEJS/tqddA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR17MB3121.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(39830400003)(396003)(376002)(346002)(451199018)(2906002)(44832011)(8676002)(5660300002)(4326008)(8936002)(41300700001)(38100700002)(26005)(66556008)(66946007)(66476007)(36756003)(316002)(186003)(86362001)(478600001)(83380400001)(2616005)(6486002)(6506007)(6512007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M+1ybed7qD9FkkHSF/vhW0AhwKuppZ/++yBBKB2F96/dt42fCrP640wbOxQe?=
 =?us-ascii?Q?uIO29p72tGanSC4tFfNyxE5pDMLB1jnT6XVvoLEr/c6nCHQHBwbmX3pXlbaQ?=
 =?us-ascii?Q?R3soB4c1/DmpJy0nwMA9OXbzvsg9Pdk+3+1Rp3LOiC74Npw1Os1B/thzHUXk?=
 =?us-ascii?Q?B39vgtjSi6SxCkfmGCBnE44o6JTsSyp2mB0m2NHaVkiEKy6mmPLg4cd5qRGF?=
 =?us-ascii?Q?atBwAvIe7aBxrhyuREVPI95E7LZnQ9gRtkD+VGuOcVjLZgd3VKW7vriM/IZo?=
 =?us-ascii?Q?FTY+dUdKbIq4qsRUxmrYUnNgYlsHZoGXYtA1qSiyDQGNhwcOXz/OXyYeXGdL?=
 =?us-ascii?Q?TPq658ipgpEWEVS8FIHB2J5bRsLfcHR88dFeFRNoojq1OhKXZirh/Eol6pnp?=
 =?us-ascii?Q?zzAVFbZ8OZVF3roiLOIqiK/309kt8jYqSLnxq9cZJLJIPsAAiKn3k/uSm+La?=
 =?us-ascii?Q?5RQfekiH8wZU+8ji7zmFikZHq3oD+9YJkz7Gvt2AUVPcOP9HtNq80LtndpFF?=
 =?us-ascii?Q?yuU+EML2Ie3R4KKHfICptqVfpnhjxwFihi88Rin2zlCkf2O/TCXQIVK/no8S?=
 =?us-ascii?Q?giwYZQxWCLCKmzIqv25B1sUKbsJRoxxWOk6FRrebrTIH/yiaDlb1oOKnO7W0?=
 =?us-ascii?Q?9SyfFLVtPRYcyoKi08C5lL7cHtOWCPsAZO7qU5PJdeJraHjuZSTmTflu4SuI?=
 =?us-ascii?Q?5WeTjem/ylUZWNZqxsf1qP/CGfSCW3/f4jhzghSdnRSEQ9zEdCqH3uN3GATj?=
 =?us-ascii?Q?8umGXoG3O/SHKoXeU5t75P5IvHlDz9j38fwp+AcKkLdPcWeJ86rNs4zWHJrI?=
 =?us-ascii?Q?uO6PSWuwjZEB28UYClWiPc161v3F+zUyVNClxWyw0PRhM7VywaDWBUa7B6/J?=
 =?us-ascii?Q?0M5wsxhlTgymBhR+bj5wHH5mu5AfYM80verlIS1ImEVPnjaxDsFk9Q3rWIjA?=
 =?us-ascii?Q?jmJFJ9JYPgIk1rLg9dW5Y5Tz9UfsqYnsgSBpfAaIFkRjtb//RIz0HS2EvIcu?=
 =?us-ascii?Q?DBQkDWDUyi2FJoN+HSWtT0+UFcNFCp5jW7oaMN2cxu83CiGC67I1iqevNzT5?=
 =?us-ascii?Q?nqnSA3ZZg7xeoTTrdRqn+35AqThB333ylg5dqUwQRp8ESwWcI+HTnZJW7Ah3?=
 =?us-ascii?Q?6vZJi0tZvwcAijY+9gdZO8HXPQaqdhaYKWCcpWYWHwScibH7FYhYDkBbpEgW?=
 =?us-ascii?Q?vXN2L9+2Fw4iLxcO02AxQ38bQG1t3E2TAHqWJhHDKviFYTr6UgRJbeyGyvrN?=
 =?us-ascii?Q?mLdE2DqqlIvm77k1j6DWZS/D2JIVQiT6dIG51VxK99T71Xvu2nN5kwg6Ek7D?=
 =?us-ascii?Q?EqpL+KVas3hfsMp0E1RYYb59dz+rKxk/Kp4nVzJnEW19eJVS8FjH9+jJwaAy?=
 =?us-ascii?Q?8CZVKvFlJ0IfmcFxtbuRFyGZ+iyWhv6oyWuxGVzoVfnTBS++XDcIaNNqWSY8?=
 =?us-ascii?Q?R+IdmcxkK79t5wmqaGDGhBX+9dJAAoiQ2hBiDG2xNCf9Pf/IW+yjsfUQckci?=
 =?us-ascii?Q?HjZbOqwnKi3y72K2Jw6QP6llpvakMrQ365/1t2WcndP843iOuPKceU2iSHSs?=
 =?us-ascii?Q?95JetmRIfPw+IK/Er6lBWjG6SYO9DujeR/pVRtv89FuyiZmgu8scTE0K5/EL?=
 =?us-ascii?Q?dQ=3D=3D?=
X-OriginatorOrg: memverge.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 969ac84f-f7a0-4324-3f2c-08db142259e2
X-MS-Exchange-CrossTenant-AuthSource: BN6PR17MB3121.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 15:43:17.4375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5c90cb59-37e7-4c81-9c07-00473d5fb682
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tv7J0LQU0UlBBWj/FBBpcT0TIH4hFKS6YnOF92HmH5gBF0yKacntObHP0PPNf7H1Uqtgsy4uHRc/X0cyhkijGcnZCoju4DKXKU9JidWgi4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR17MB4190
Received-SPF: none client-ip=2a01:111:f400:7e8c::62c;
 envelope-from=gregory.price@memverge.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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


Breaking this off into a separate thread for archival sake.

There's a bug with handling execution of instructions held in CXL
memory - specifically when an instruction crosses a page boundary.

The result of this is that type-3 devices cannot use KVM at all at the
moment, and require the attached patch to run in TCG-only mode.


CXL memory devices are presently emulated as MMIO, and MMIO has no
coherency guarantees, so TCG doesn't cache the results of translating
an instruction, meaning execution is incredibly slow (orders of
magnitude slower than KVM).


Request for comments:


First there's the stability issue:

0) TCG cannot handle instructions across a page boundary spanning ram and
   MMIO. See attached patch for hotfix.  This basically solves the page
   boundary issue by reverting the entire block to MMIO-mode if the
   problem is detected.

1) KVM needs to be investigated.  It's likely the same/similar issue,
   but it's not confirmed.



Second there's the performance issue:

0) Do we actually care about performance? How likely are users to
   attempt to run software out of CXL memory?

1) If we do care, is there a potential for converting CXL away from the
   MMIO design?  The issue is coherency for shared memory. Emulating
   coherency is a) hard, and b) a ton of work for little gain.

   Presently marking CXL memory as MMIO basically enforces coherency by
   preventing caching, though it's unclear how this is enforced
   by KVM (or if it is, i have to imagine it is).



It might be nice to solve this for non-shared memory regions, but
testing functionality >>> performance at this point so it might not
worth the investment.


Just tossing this out for discussion
~Gregory




diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 061519691f..cd383d7125 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -171,8 +171,16 @@ static void *translator_access(CPUArchState *env, DisasContextBase *db,
         if (host == NULL) {
             tb_page_addr_t phys_page =
                 get_page_addr_code_hostp(env, base, &db->host_addr[1]);
-            /* We cannot handle MMIO as second page. */
-            assert(phys_page != -1);
+
+            /*
+            * If the second page is MMIO, treat as if the first page
+            * was MMIO as well, so that we do not cache the TB.
+            */
+            if (unlikely(phys_page == -1)) {
+                tb_set_page_addr0(tb, -1);
+                return NULL;
+            }
+
             tb_set_page_addr1(tb, phys_page);
 #ifdef CONFIG_USER_ONLY
             page_protect(end);

