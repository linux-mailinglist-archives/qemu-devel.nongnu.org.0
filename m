Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1164540EBDF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 22:51:33 +0200 (CEST)
Received: from localhost ([::1]:51042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQyLz-00022V-Ji
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 16:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1mQyKM-0000zk-LA
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 16:49:50 -0400
Received: from mail-co1nam11on20714.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::714]:58080
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1mQyKJ-0003Xb-J9
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 16:49:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctZv1GofySvP4YonH2OaG6Ckb9CJvUaholH4tU1pYljFgf+noUPgq14zyYzJFC69a3BRMBPlXvDzvIoNgf0JLflopCrF/cIS2SZCVdycXhfUy4wvQVk5wW1My4C7a2ZFR3+ojl0IVBpDiUtzE3NhBfoRmMwoYM2wjGBtgkj2GkK9JJjq3dbl0cEi2q+eDrxgpzi6mq2KmJOEG2eKEbPY/9YPAo+o7FsudWgVOxAoFDgcKrx5BncD8pM1hMLiz0GEUuEvgPFQoeHswU/MTb1sYKHQFCiGQo+LDHGLlNVOaxEKBlUBDUKuwIuDDgZoj/24ToUUt+u61lWluvsIFfK+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=g1X8TnxofwMlFKJ8J5if53R20wzgECO/9pPQKfDS614=;
 b=QIqwojNClCxibr2Te7LsxDScMdu+Ol5QSxLaciwEiXHxVRmyZbqB0X7a/RvoCKhkihzMyElS/RIfaoqbUVQYQYxK1MtblnNige5Of68qHnoFBuX9jWDlPxR1cS7aypCnB6ns/nvlJztz2Kl+nj6pjU1siDYLJVaYWeYeovmbLbQjRV/zqeqKz2Kj398sPygcSgA9+Ftm9gBFOE4YfwK3bMXaaS8V0ZeVxfclqA8Mra1snN0E27vrUM/w/Bg4yqm7nuk7fws4MlNVhBc5yW61EjmNj6tBEZWiCVKGIPd74DF+c1fOpZegHNBoZkR8CK+zLzuAHGGWutuaI4UdaRzjvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1X8TnxofwMlFKJ8J5if53R20wzgECO/9pPQKfDS614=;
 b=hJjq3OTK75TmmoiB/UTpqi4cjFvj0xqEn65otgUHTfe2S10g/ZnWP6GmlJ1IODWSdo4fhSr2Mp3mehw7zrOQQDs87hOenMmQeiP/Zwgjxc+qkfs4CZif/eKwJ2luR5V4nO/tbEn0RyT8WfqYiLEtkhkmFgExcig1m/tNbdlcizo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB4814.prod.exchangelabs.com (2603:10b6:805:d3::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16; Thu, 16 Sep 2021 20:44:40 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::2076:9ee4:550b:4a3a]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::2076:9ee4:550b:4a3a%5]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 20:44:40 +0000
Date: Thu, 16 Sep 2021 16:44:32 -0400
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: cota@braap.org, richard.henderson@linaro.org
Subject: plugins: Missing Store Exclusive Memory Accesses
Message-ID: <YUOssEF1lND+Rhsr@strawberry.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: CH0PR04CA0094.namprd04.prod.outlook.com
 (2603:10b6:610:75::9) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
Received: from strawberry.localdomain (68.73.113.219) by
 CH0PR04CA0094.namprd04.prod.outlook.com (2603:10b6:610:75::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 20:44:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5d1f95d-201d-4ede-f210-08d97952ce01
X-MS-TrafficTypeDiagnostic: SN6PR01MB4814:
X-Microsoft-Antispam-PRVS: <SN6PR01MB4814D841087E0E36103995DD8ADC9@SN6PR01MB4814.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Mb3iUvWlJBH4RZc178BvnNfNhSsrLD/1/IPt4VZzhMHUTiXW1/+rxl4ijB3og2EpUZXQpa3HyMNyfq7Q33gJ5Jw96X0rKoMGYafB4LKyYT3fEoMP0Q39hR4vuXpq24qCAHG5pJcbKt3/BypMvLPY9Nv/bMUlTNZRlvctGZENZ44k5gNzKuCXRB5qx4ORJrKwjZ4zYqwIsPC3sdxOSi3WEL8SZWINL/Fxt9iIcHTK9nMUZBBiX396mKG9ToxAIXXMYnxW/5XVkACvjS6BSQgLiTY25t8aLKvM0W2gsTTWMCLXL2r6oR/m5jcURKrrbJqRyFN7mz9gAm4KVJcsdJHW/ygsAIAuGkj1UmrDZLBmimbrZk+mfFQmkLpscHwBEjE3B09SaPYewwjekOOwS3SptIZNxHvAvIx/fF4K7xelRK3iIKKbs+Mcn7ABQ4dv2vSzfrjq3PucZmWp984vJDi2E20kg/7fEtrnr143L3ZRXYiQ2AraVysk//Mm31jrRK8bgCNzc1R1tXqds4bqc6rR0E4v9NkgXE6cUMmTNjyWvV6vSQTV0gH1kdzhzzF+Tj/Q1At2QGAo67pmZfzz62tIw7XYp1KpZXjC7FaXCw6OCtrpk/bVnoEeWyNUI6R8yRFIYfPd+41Kin1BZbq+q96tSfSkbmmR967r8PgTPE39ozC7daOhTNBjFUB0hK1Wat9CnryGo1d7cVzmOhZqKT8zpALH5QXVPH7Ek0ZCiPNUcE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(83380400001)(2906002)(5660300002)(52116002)(956004)(7696005)(38350700002)(38100700002)(6506007)(6666004)(508600001)(8676002)(66476007)(66946007)(66556008)(316002)(4326008)(26005)(186003)(6916009)(55016002)(9686003)(8936002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wk8JDWpTxoJltORAUJno7d3p3hY4fE0k1rIoLCGjH6i50xyxXzGABbuZnsz/?=
 =?us-ascii?Q?fpRiOZ1Lexg4Y9Fqsmy7KtWyLaX6e7mBrQxmyQ2Utjv+SEEFRKS6MwUlwHtS?=
 =?us-ascii?Q?38m+ddrg3x2hLLlLQRSb+xA5L/HkNnGhHOSiMp+T4hoYRTlQfTkMGgCtjCsh?=
 =?us-ascii?Q?svX5K0QI/0J1m3Bty4CBPh4rwqm/c7GsFpCEzzC8Rji5vuXfHVrZ+1ZvKzm2?=
 =?us-ascii?Q?KaWoycr9vEABouKmpnA7bti+nzpvFagc3UimbiNI8k42F4gtuLWqfRibymPN?=
 =?us-ascii?Q?HbC0kbhpBRb+8zfsl0SDSykU/90HLbiPcAe6Gr9DBkUBie+nja3R7GlHJcEc?=
 =?us-ascii?Q?cPUZ8ABEsTjg/uvHyAmr4XGy8ltPNv4FRDRAVX1/ZfpmB27UBWqN8buUH7AZ?=
 =?us-ascii?Q?5JNSPHa6CBlvLHNcEW1BKR4hl3UvZXoEt0IhjJxFwaW8Res9MaGYz/5KS2Am?=
 =?us-ascii?Q?g5UOjXYHgqM+D0YbxrFJn1L8cTI+YJGueJorHII4T0EHROiPcALCauFXPxRM?=
 =?us-ascii?Q?hJzn+1C44fGQNF26WxDvt7UVgkUHgDtlIATXTId7vCW2aR90mUOe1JeDwU0I?=
 =?us-ascii?Q?VH7ksnxxWRwHMEvQerP1cYGNRyf01gvrcY3reQXHeSG7VEAcKORE+XgkzGSB?=
 =?us-ascii?Q?/JYrVp0xKQ32LVkfpjxQE8GItHAljN/AhPF0Lc0/RMKapDAB3Avsfm0q3AMX?=
 =?us-ascii?Q?QHRfXrqKATCj7mwIQKSCBQGAGx5AnlNiIlC0PfGCsE8tIgmnRi1ijLTL//3V?=
 =?us-ascii?Q?Bv7ZDbNWIkqZ3z++O9PL/VeGAlpUpVHk1/v5WEbzOg4GabmFsLRcUTrXFuDQ?=
 =?us-ascii?Q?WCYKauL1LM3Isj48RzdjymWUWM9riJkY8O05xc0jhl7Ewbk1AlbmAV1euZm9?=
 =?us-ascii?Q?PZ4CTNkNEdtsTcAui7H6u6WLyNPqmwhOIU+B2KQzKlJLHvF03kqZ/9+9IpEa?=
 =?us-ascii?Q?QDli1AXqg9IJX5zyhDOz7fZwSlaQg9wYcVjLapr43ZjCC6KWREG0mVqq6Cl8?=
 =?us-ascii?Q?Np4HbNF8jAy7WQqB/VP6rk2LtgZwSDDHROh0OIutluSWEgbXUt9iuX4CZbPY?=
 =?us-ascii?Q?6D3S4uqD1CHUSfPZaCH+HTkMsG1k6KT0+RhxjTUqmJf/kJtkWM73xlK7zlVB?=
 =?us-ascii?Q?oYKrnW+ECrQ+Wja/EDrQZnm5jIqn6cK5OdVfs9zlSTyZ5U2AkQ+DNGILgF55?=
 =?us-ascii?Q?0HV5wBscoczKI3ugHdgKMpIqVJx/dhCjxGM+aqZJaZsHf3SlFL/Zg0fEqA0X?=
 =?us-ascii?Q?10jII4dFWc50GCgpxL4plcVCuBFp+U5hxEjiJfHLF0HvuluFa67EwW1w5hdF?=
 =?us-ascii?Q?1LwUDAlC0hxYUkGZllSnL1pt?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d1f95d-201d-4ede-f210-08d97952ce01
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 20:44:40.3307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blpgo8QwZ2dc788H0LiiYpLgaFt/T63dP0S4J1JhEQoQjrXKkKdgxUggrgMUwA0HxkHEn7tLHgW3yitmzVhFSExIRy8/RRsr5cm/KfSoEsKMfpdt7j2I+DSdfHTtoey9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4814
Received-SPF: pass client-ip=2a01:111:f400:7eab::714;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hello,

I recently noticed that the plugin interface does not appear to be
emitting callbacks to functions registered via
`qemu_plugin_register_vcpu_mem_cb` for AArch64 store exclusives. This
would include instructions like `stxp  w16, x2, x3, [x4]` (encoding:
0xc8300c82). Seeing as how I'm only running with a single CPU, I don't
see how this could be due to losing exclusivity after the preceding
`ldxp`.

In looking at QEMU's source, I *think* this is because the
`gen_store_exclusive` function in translate-a64.c is not making the same
calls to `plugin_gen_mem_callbacks` & company that are being made by
"normal" stores handled by functions like `tcg_gen_qemu_st_i64` (at
least in my case; I do see some code paths under `gen_store_exclusive`
call down into `tcg_gen_qemu_st_i64` eventually, but it appears not all
of them do?).

Does my initial guess check out? And, if so, does anyone have insight
into how to fix this issue most cleanly/generically? I suspect if/when I
debug my particular case I can discover one code path to fix, but I'm
wondering if my discovery may be part of a larger class of cases which
fell through the cracks and ought to be fixed together.

Thanks for any help,

Aaron

