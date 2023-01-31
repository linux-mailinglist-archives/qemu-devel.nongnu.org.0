Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBD5683300
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 17:49:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMto1-0001RH-H1; Tue, 31 Jan 2023 11:48:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1pMto0-0001Qv-0f
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 11:48:24 -0500
Received: from mail-dm6nam10on2064.outbound.protection.outlook.com
 ([40.107.93.64] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1pMtny-000209-5T
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 11:48:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k28iJmj0ejT30OMixRSwbvvIGQXQFXh4bxkul9Z/MJrMZ84rL4TqE0f5O7k4CU1f1WCNk/VCtxIsB3X2VFWmhiuKdwK897ShuYXlxG0Xli7k7OEDWlhE/G4/gqj9v8gxlwogl8XlX45j+g+N0JudIGaU1aB5lOuOY6HYbIVbsdHOQov9/hBuVvcUpRyh18VM7sSzhLilcVoIQ/e6GOCPHLKNpTGrCyYFHzKQ0KyJ2kbX0I2vPZPrUSZD3n240/eJ2VDAXw2LoqtSb5lku3WfibNhO8RXOrCXYMSk543BdO32Cr7wy5mAV9keXyQ8JIsxjeFaUvA+9yEe8l6rYe1H4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dDhpAILtiplXQkjXVYHBWJhpT411w7kwr985u3k6Mc=;
 b=Ly7d7lWnIBoD0pbPWxCk7F/WHPNy9YJVuZQNeafqUMQzZ8oXuAieotJapLJhotWyWngEuGiUO/Bx2xSujvhvM/Z/MbESlsQZLxzk3HvDFwUqwRYVLKp7wYulM+HewC16qHReEWjLO7CwwhZH9h43zGuxerxpMfiB59ddgSzrm7jTAZcAHQQRUuKQAelifebnPqTNGGUVAaJMq8msAO2mnB8na9OHVgx5Xlhx0G0iJTFhDKkanqtm4bhIMaApa0zl5eqBfwWPNgfOWS4lmbOueT7qhC4+GU/kykiTEjSvtpwpcRXE/cw3j3radzv7kWB7QmRrT92vI+lMU9KHQs8f/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=memverge.com; dmarc=pass action=none header.from=memverge.com;
 dkim=pass header.d=memverge.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=memverge.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0dDhpAILtiplXQkjXVYHBWJhpT411w7kwr985u3k6Mc=;
 b=LITMXRY4TBqkIJSEi4goFd6POI8EMFLqnQB+/xTHuTXPjJxPbQJzUy9HeHF64+EGPMDeeEWvPUB33P0ZUSpyDgrv8r8mO9vK1tZnjsmCTxnOhXBk1iNij4cIy99KpWKUfeIjz30D3HTXdhJ/X6ZzIwvYbuWeeVHzV4OlogVnAU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=memverge.com;
Received: from BN6PR17MB3121.namprd17.prod.outlook.com (2603:10b6:405:7c::19)
 by PH0PR17MB5567.namprd17.prod.outlook.com (2603:10b6:510:b8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 16:48:14 +0000
Received: from BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::d253:1eb3:9347:c660]) by BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::d253:1eb3:9347:c660%4]) with mapi id 15.20.6043.028; Tue, 31 Jan 2023
 16:48:14 +0000
Date: Tue, 31 Jan 2023 11:08:47 -0500
From: Gregory Price <gregory.price@memverge.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Michael Tsirkin <mst@redhat.com>,
 Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Mike Maslenkin <mike.maslenkin@gmail.com>
Subject: Re: [PATCH 1/2] tests/qtest/cxl-test: whitespace, line ending cleanup
Message-ID: <Y9k9D1y1gT4jZ0Zx@memverge.com>
References: <20230131163847.23025-1-Jonathan.Cameron@huawei.com>
 <20230131163847.23025-2-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131163847.23025-2-Jonathan.Cameron@huawei.com>
X-ClientProxiedBy: YT4PR01CA0356.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::21) To BN6PR17MB3121.namprd17.prod.outlook.com
 (2603:10b6:405:7c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR17MB3121:EE_|PH0PR17MB5567:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ff86ade-bec6-4bb8-90a0-08db03aaf20b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KxuLrhXasLwsfphwDV3qJRFX1l9lxonDiZqhZFcQ25ajXS+DaWHKvquRLRlLoBUJVynNMVFys3+p+3eoKfhJDUmiMqffY5xoGnsqN4Q2yTtmCMx/+NMNGrEFQkhT7JaJhoCvimZbSe2S6Rt3Cw7cqmv2laovR5dhz8qilLXkPBV+mNOg3/vB258GG3LUoPXLCfJVOKrf9i3igQwpcU0mLGyaiznbEPF5xLgMGonqmyBPUOvliG2Qk9BByi0rBKUoJAKyppIRn/nS+/wUL4SMJZLVp4nl0q+b+ZYq6yUd+b16uM4qo9x48b4LHlX+C32UBb1lEnyPRKFL4BuAxsshKN5hTXTQIfOBplgZ7PkuDvsR6WvbDbvtaD3ahpN/X2qUTKATqdXrb5EZ+FjOwjLcugg2aGAG8Lbt6nEKwrvLQHJi0kyclccfSetpjOnSpbMC048XuhZzDSPowbu0FSS6Rk/8944YJW57nhjTRYLTf19JWEA8i0d23HGzDhX55SsIZeESis3xPdjbpcm1CuWPoZlYjw1WgpjmGFDUguLmkWf/vycFfwOHHc2XUgwObUNMDZ+Do8Ptted/HaH1l+4fMmFJcsJFhfnqDmsY8TZ1/8OxnFlF8IvW6RQ+RLXvzutKpUENXk75tYtCmxPINivxkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR17MB3121.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39840400004)(396003)(136003)(346002)(376002)(366004)(451199018)(8676002)(4326008)(66556008)(66476007)(66946007)(6916009)(54906003)(316002)(2906002)(8936002)(41300700001)(5660300002)(44832011)(7416002)(4744005)(38100700002)(6506007)(6666004)(83380400001)(36756003)(2616005)(186003)(6512007)(26005)(6486002)(478600001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lvUNGL8/Iki+l2hDNAgxpVYD0lyOwWmNcvw6fAj1NaFEBQ6IqsEovDThwJkj?=
 =?us-ascii?Q?IqbgXOT1la3Mey1ilEun0Q14wHkMfEXnWsfMVwMxJylZS/D8yaq3BWEGCPC6?=
 =?us-ascii?Q?vlVb1shm26PGnLHNkFe6uQpIn9uZraaD5HY+vXE6lzUqNdhitu1N9eynNzLV?=
 =?us-ascii?Q?nPJiXiR39Ud7t3tMeS9wY37MgbeQ04pFeeVUdHgiMDmXPqGkNQbdPlouvUe6?=
 =?us-ascii?Q?EDP/NvNSM0agyCHzAXxlGxZSRHu/cTYXU7HXFTAzfnorlykHSHfvLfKmnmYw?=
 =?us-ascii?Q?BsV92raearQDIaRPCwa37aPuJh2KlUve4aD3KNcbdgCn5SqoCQVZSqwLGH3k?=
 =?us-ascii?Q?ZULvWwFhJVqdZejmd3K88ab9vwrKHVJg64OjgMqF336rXpnemNI3HTBLXbUL?=
 =?us-ascii?Q?MMU+xMFa9ZW54xV5vRRu6T5ZTWnW/dcZnJEOamO7hu3x2KM72Ja27g4qmonB?=
 =?us-ascii?Q?7BBJz39qmqyM4RW4rcLCMtf1juO/qEY/vtlG3sA8Ss8OerJHQ/plTUw0FFa0?=
 =?us-ascii?Q?/XLIWhWgar1xg2LEZVHY1/O4Vhd7FTyHAt1jo2XQQKkZvq3eg5aQoObDGtAD?=
 =?us-ascii?Q?FO9wOlSgdtR9i6rdxncvvebQ8HI468xeKaTGLvZ/fUyBH1Z+wo7PzFBFg+OS?=
 =?us-ascii?Q?RDddQ6+1A32DdK+TA3cj8+hnOmqveJEraqfKXiT7qxHkZETSkVl5/OKrLttS?=
 =?us-ascii?Q?0EAIMm6vt72yEtBfctIrAIiChHlFk4NrpkZKdC4wgis/EizugHsY24ShIR9t?=
 =?us-ascii?Q?pmSeKWG8kJLzw/Uw9PrPXhwC+/Vn6/KanT01iC3pzDysgbpAkSBvwFbonqyD?=
 =?us-ascii?Q?INaUskEbKEAUr8GKh1WRmKWaPNpzQKsNKVOtJGea2JPj/uY5DeNR27h3bZOZ?=
 =?us-ascii?Q?IsbC5e2PGiz2Y45KllJLfdaGRJWJxo0cMwL0H12hgaYp1f6HvGOcvTDSrP0F?=
 =?us-ascii?Q?Mi+yAvhJflrD+ZQBG+eIhed23S2lQJ1Itdyj89CkpeIk0fnz8ZK9HVw+QKaT?=
 =?us-ascii?Q?zh6tWOe3sILTPo3JIjhTHmmOQ2FdD8T1tiCGUv/2866bJCFnKL1OEdNAmnvV?=
 =?us-ascii?Q?z25o/LyD/lRu+37dukGexGYLDOvSrvd3WR8fjz0Ep8I0TAtr6IkePHxG75lW?=
 =?us-ascii?Q?HPo3Egw9NMLXqNg+VTHYPKd9Ebxkiex28OMqliM0g3GHzfyx2sl2c4ZkgZF5?=
 =?us-ascii?Q?dcqXtNTZv1/t2EevVGU6lOTuQnPwXK5WQ7jl9IeBFwqX5aojtSq2ZeiFeJLS?=
 =?us-ascii?Q?A6gm3kJ+l3zqDh6IRZpgZcFTGIfzR72lRF8ukYDggPLgbbeum+GE2fl8YFlD?=
 =?us-ascii?Q?6dmc2c+lix05z1hBAKTCvCRPHRiYsa+KSRNL6vQAF+vMi241s7vqCEGz8Q8b?=
 =?us-ascii?Q?/dftT4+0LVKJN1Sd5ed7ckMGAh+jOV/d4DsOUPP32sBqK9V9BigFX78DpdSJ?=
 =?us-ascii?Q?HkYLeZv6nFa7OHEgIynK7f32vJz1M+iY5zBBUsqCkedMqFYwxFb5hvl9Dc/v?=
 =?us-ascii?Q?9LVENI70Mg4agl23MDxg7vtvxy9IcYjGTBJ6rqbk7etxgewQpxbBJ5LsbKBO?=
 =?us-ascii?Q?KF0EFyVeowEG2ooVTAK3uC/j4EBzRYuSgqERUBLWLkixwKL4biT5yBGnBWt9?=
 =?us-ascii?Q?Yg=3D=3D?=
X-OriginatorOrg: memverge.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff86ade-bec6-4bb8-90a0-08db03aaf20b
X-MS-Exchange-CrossTenant-AuthSource: BN6PR17MB3121.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 16:48:14.4318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5c90cb59-37e7-4c81-9c07-00473d5fb682
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBiaWZz5WMDQadOVw0BRfpMmdPCCcf8G8oNPtXZfxvlYctlbwbQs6cdexrd8jixR3lWCrv9pww8wZS1lVjslEX8LBDYhF/60R1P9CjovcUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR17MB5567
Received-SPF: none client-ip=40.107.93.64;
 envelope-from=gregory.price@memverge.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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

On Tue, Jan 31, 2023 at 04:38:46PM +0000, Jonathan Cameron wrote:
> From: Gregory Price <gourry.memverge@gmail.com>
> 
> Defines are starting to exceed line length limits, align them for
> cleanliness before making modifications.
> 
> Signed-off-by: Gregory Price <gregory.price@memverge.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
> Changes since RFC v4:
>   Naming consistency improvements.
>  
>  tests/qtest/cxl-test.c | 84 +++++++++++++++++++++++-------------------
>  1 file changed, 46 insertions(+), 38 deletions(-)
> 
> // ... snip ...
>

changes lgtm

