Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1636645B8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:13:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFGZf-0006Vd-BV; Tue, 10 Jan 2023 10:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pFGZc-0006UH-K3
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:30:00 -0500
Received: from mail-dm6nam10on2127.outbound.protection.outlook.com
 ([40.107.93.127] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pFGZb-0006SZ-2C
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:30:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Co8o2GAiOmb/IiKJ1e/ndrJX5pmSNU7hSJNjbHe4lAiO7XbF6ZcNXvSn2tHmtyYnVCFW+FFtilhx1u84LJSYl/fhq5Iisbo2G/zHOWkdjABiAXLxwISaTZMxpS2qGr3OS6qNAsmZN9mSAUnBx6J4hBOBvgHaiGAxYVDRxRl0u2ExdW7IS7PISCHxAEu1I1l5jtzPU2jf0hTmY69MRvtqxMksno5gFcARqsOVuN1nlrfjzoEttJP6F1ciIoJ1mikH3LrRUnJcDIY8+YAVKkzs9bmH9SGK+w+1hg8AMBbbxnDeJ05aKI6hpGD++2GZ3JK5HgAr81QIUBj7ZluoQBoypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwRORo16SIak13vjpK7sEp7CXD0AoUpFeu4RSqnL4VQ=;
 b=ktgo6qTqtOqI+R8Bnbu2c1c1qSzckEW0/eGgexYf8sY6gng5COXPAZsDbrKXntqGOjikSzIhJvntZe4/ydfHBjwJXavjOQS640D6GHxZOhrSJJpU6uhpDNpXpHdGKDag1VaXqqi+Y365yzcLi3QeLLTHHQw3a6W9/MJ3+wtRLfYBcHq9HcIJL7XobS4rZuY8nUIpm99fmXdSEqJ0UtYObmh69QaZsJBNM11T/koQs5YFzB4/5XEu4MN8AiGYzTQXr30bNRf9qlPYo0BzEP+9VWY2SW7OEH3YggiL/JWxzgI02DkpfZSK0ffBPcJWfKukMDrnEq/2/7NInMQuew2VQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwRORo16SIak13vjpK7sEp7CXD0AoUpFeu4RSqnL4VQ=;
 b=SUSsSBT8Ma8/4L+P2YTvDkV+itZHh8n2mjY47XtEYqdlp98yEhvWehtuqsn+uD61Xt0anm1iMuPKLtWd2dybPHaXKT3VVxXYO6TffEfUKpXX5ypiywOhWPC9iRMpDZCCxri+/eBlAcM7vQhDtieMpHs3PSflSXWiK3qgbyAn1zY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 CH0PR01MB7121.prod.exchangelabs.com (2603:10b6:610:fa::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Tue, 10 Jan 2023 15:29:55 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::607c:1d6c:d30d:6281]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::607c:1d6c:d30d:6281%6]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 15:29:55 +0000
Date: Tue, 10 Jan 2023 10:29:40 -0500
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Emilio Cota <cota@braap.org>
Cc: qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/4] plugins: fix optimization in
 plugin_gen_disable_mem_helpers
Message-ID: <Y72EZGiDBQsvTyUs@strawberry.localdomain>
References: <20230108164731.61469-1-cota@braap.org>
 <20230108164731.61469-2-cota@braap.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230108164731.61469-2-cota@braap.org>
X-ClientProxiedBy: CH0PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:610:e6::26) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|CH0PR01MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: eb21a629-0fb9-46c8-1069-08daf31f8663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QnnXF3eDB3Kb6HLtx2ZKPI6LcdlEsa2xUReq1mPw0eplPguL0KG/CwAg30UIp7tmHA4IKLsb9PzuvdgODs0H4h+GqbSUCiXqcm/k1Ljcz3qo+ycFLdb7YZLd/3JszI37UWEqb2w5s9cyUKG0thkCI0HXP1dENgOwIJ3Adpm2s+4YvEccFyWiyMKJs1/iBE35NnFOqhfh2xEfWGHoZk1bN2XnIkODUganQjoTaVn57OSJS0bumQVw/7097fmpLGlfxqssKw/DTlfPE3zJdZ3yOHuzaQtrAL4V79ECvsUo8yusOAer8yqwDG1qHT4axnkZHyrCNgnrWL26udBdDPhBFWkVMf/N/5yWaCNlkBgVLyifRxRNx10aVqeto3q1Ceq2RJr+kyyAe6dpaPc1Rfvrtx++AGr6RvYlehs+B23ccH9VWL354SfyMYJ4DU/8tj3cNIZsMmUrxZ2nDymBdBWVyneWPdNhSGLDEB1QqFjC9CjY65lvVM6hM+gzrkcilGYcFyQRqLMn8E5giIAP7/Bl4LKy/LoL1yhcymDe0eILZyHrNuRVPZywEUZwVHMu46gC0bxv7VOYSvZ9miARSJFvZrj6kq8Y3VhqYs4Rsh2yxrfsgmWSHdVVFgRz00h2MD+CDn3v7qgq+O9ptx4gLb6M6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(366004)(136003)(396003)(346002)(376002)(451199015)(316002)(83380400001)(6666004)(478600001)(6486002)(26005)(6512007)(9686003)(6916009)(54906003)(186003)(2906002)(86362001)(6506007)(41300700001)(38100700002)(5660300002)(4744005)(66556008)(8676002)(66946007)(4326008)(66476007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n4s2tJj4uJKRxURAogPf4Ka/TzTgG4ie+ua94RtDgrTNhHjI9LRE5VAtBlEa?=
 =?us-ascii?Q?2Bl6ZALtU83t6yp9nNW7p8EyepHPOdClCgcG7dvr+JKLfQwid3aZYZL6kpWV?=
 =?us-ascii?Q?NqXQ6c9ui7RyCCucRoKBA8OmEouOZXnQX8b1jYiGkWOMDz+oguDASj3nQ/Qj?=
 =?us-ascii?Q?scvTgFfFhk2BMqzwTczkCV/JBu94PIW1T/S5TMjaC2Cjza1WDd4JTI9IeRHg?=
 =?us-ascii?Q?sok/ZGnAPsIPqI+0G5HT/yh1GBj/jnYp+JY5vtz5YAY6WDfgjLTrsv8dMIof?=
 =?us-ascii?Q?ekcMHNs60IqxoMvNMj3covaI+M6c21d3dfdTxHrIPfbFM4pufV1/7rxQdXxM?=
 =?us-ascii?Q?cYa7GbZ0/cb3wpSDlhl43p3NldpO6WNzPdEEym4dMh1fVIX4rcXJUnb9i7G7?=
 =?us-ascii?Q?n/jXoavWY9UM3ygQB97yZ6vwL65IxESJ6JAQkgPEc1xGyiuBIcaK+waCua9s?=
 =?us-ascii?Q?B5d4YadQ3FzR2ntS8JjztSb6aqPlSW/RCGDrWVze3sM7di7YK/9dSW/jNiH7?=
 =?us-ascii?Q?CLljUhBwj61RvQa3mRs1OH0dYX8s5OGOGDKLb8nP9gdf1IPMg7+B63AgRVjQ?=
 =?us-ascii?Q?azflp6HtQyhepqFhGIxJcBOIPHiljJ+d8H0Xq09uycVusCNQF3davcx8lg64?=
 =?us-ascii?Q?wEeq91qWRYdPZ9ErONS87IjysMKsNOx9DgekRt0p5O5BOjKQkd5RAS5QotL1?=
 =?us-ascii?Q?mhT63a8z2m0C65DaWw8m6zWTVpKX469Z5n/1FkmIyaZuU341qb8WsA8vkDXy?=
 =?us-ascii?Q?rdu87Af8SHtWUolWlsU4XM0PyoCH1SrQX5J5Rp3LKiyUnZJ+Tx1D4XL0Y+T4?=
 =?us-ascii?Q?RLGUPsyAEWKFj8gncqdVszW/DAblpNVZKyUYT5cMp2liE5ScIIs+9ll0HFiP?=
 =?us-ascii?Q?hXIw7nHZ+1zSRuj61XBEnBSd11iC6SRW9+RLsHroGsEMmAgC2VLqvrLLgbi/?=
 =?us-ascii?Q?0m+SPU5b+/Lu719Bj2RI3FSKolM1CKkMn0JaELes3qnbdqr1nNc2iYZ6KNV2?=
 =?us-ascii?Q?SiT09mUZYc7kw51AEkIJj8HBex0Ec+MvJDeAWmGutpt7Feow/BRiXjHBdS5e?=
 =?us-ascii?Q?Ez9i57LZV8VETnPpsy5avaQoGHKPbhkzvfNvoQeZYXCGTgGV3MLkKCxyCqQU?=
 =?us-ascii?Q?e6nyxe2f+eE4G6OTSgc6SSdly0/XvyxxBCT8ELuxMfrqqbPh60jpyESOtT7h?=
 =?us-ascii?Q?Hj8CEu8WLQndpADsD9NVw8yOANf9luIt6zPjNNJWn+7llvLinKxvQdp17eIi?=
 =?us-ascii?Q?vE2vYvcmohGf90jYLG2gAAmnBnYfccBnQgMQFaaiXqOzMwAEQRmQ4ieSFsGK?=
 =?us-ascii?Q?wPwRBN8Cjo65ZFPblhrxDiEsPJsA0sySheMfL+xCYQyP+RgwSte9NZPDjfop?=
 =?us-ascii?Q?bJ48oC2BJcK90VBEPom9d1/n4hCZYhRZFbKGniaZTX43AeZlvfhMoJxLqJ7B?=
 =?us-ascii?Q?yrTKyL/9LuRqHX6j8vL1Q7xX0gGsXtIyMriTWemwaqaRSIBhXz+zZvvCWdB4?=
 =?us-ascii?Q?inVIv9G1cEOCRQXnurgwmVzRzEW+rIjwwL1rFGfERqfNHr5ZnDz6mLG2ts1p?=
 =?us-ascii?Q?Ac5Fjjigc5a4QKBh+WHiYFX0f3zysbwhT3mgxVpSLyrXWJZgguYR6EuYxVQz?=
 =?us-ascii?Q?FBM3wa6aNJ7Dw7pP0SIZdmo=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb21a629-0fb9-46c8-1069-08daf31f8663
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 15:29:55.2565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0dQ2muteJlgcX6jsxkc+LDIVUVGW+dJIF0XBv1xVbjLMkiW1iiGypMpyqbtR85GCc34KADAuyL5agIwdcNzjes3XwYk4mFhXQBUunV/EeJr90wGW8OAm3rDH1zzSJ0rO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR01MB7121
Received-SPF: pass client-ip=40.107.93.127;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

On Jan 08 11:47, Emilio Cota wrote:
> We were mistakenly checking tcg_ctx->plugin_insn as a canary to know
> whether the TB had emitted helpers that might have accessed memory.
> 
> The problem is that tcg_ctx->plugin_insn gets updated on every
> instruction in the TB, which results in us wrongly performing the
> optimization (i.e. not clearing cpu->plugin_mem_cbs) way too often,
> since it's not rare that the last instruction in the TB doesn't
> use helpers.
> 
> Fix it by tracking a per-TB canary.
> 
> While at it, expand documentation.
> 
> Related: #1381
> 
> Signed-off-by: Emilio Cota <cota@braap.org>
> ---
>  accel/tcg/plugin-gen.c | 26 ++++++++++++++++++--------
>  include/qemu/plugin.h  |  7 +++++++
>  2 files changed, 25 insertions(+), 8 deletions(-)

Tested-by: Aaron Lindsay <aaron@os.amperecomputing.com>

