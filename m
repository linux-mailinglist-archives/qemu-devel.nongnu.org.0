Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BDC435115
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 19:18:40 +0200 (CEST)
Received: from localhost ([::1]:58234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdFEd-0001O0-JO
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 13:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1mdFDE-00008h-Jp
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:17:13 -0400
Received: from mail-mw2nam12on20722.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::722]:64993
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1mdFDC-0008MG-4r
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:17:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQbM5DgOSvgflmPCzupgptz1PHGSrwPurGNxZstrk3aoExoFWTQVkpxKLbXrI4/VcfS8xVnBhPwA9+NXACuJqWWsma26skXEizW7eWoqWuKcUBXBAZN6wjh50VsPV4OFIWOefhFTA6F1mcKwq+/bO1HTUNH0TfEAHdzf+5Ez2EBsM7VDE51UA8P8V+8bDUBLxhcKW0MKD+PAt2HqqlXnO5Jcl2H73+jSy/Jk9f1viTCqssL5FaIYeutlu+koZXkWxA3W5pMjEjiYOXrkHR+5ny/2zhXC6c0HMnim/P+mQ2TZ7EawbtUSU368nyk0ve5cOdjpMyTA7aMI/DCZ+amI+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXtyDaG3TUuUjX/vxk9F3G9v/dvmA59XnBov0twNsD0=;
 b=Cv39q+xEwHZKL8NfvpUUEgCuML7e1HNho+6ZMCbuMN2EB/Fe2gCiKPBitlGNFKD7cNLQ8AEwOdbtBs2r/QYJtX+tYMNSjLBfuiWn9S0LzU/FgBfXw9/AgsuVBJSQ66SFmGJjFzvd8Z6dOLV/Tf+8DxLApUq1AyLrRBqIy5vC8vQZcHVEAO0xGoruYmqdq0MUDSpW57/JNHjApfHM0FptuuULBicvqsirHBcRvVVtytPrZTwlxYjaPo7nemSFmUMYzaWnE5MyCVr+HHzYYpUZubebc5TaGIEJ72Wp6p/yTuJIY01Qdo+vGQQEMpZxmfgwL30fWsW2E6TwfKxssnkxWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXtyDaG3TUuUjX/vxk9F3G9v/dvmA59XnBov0twNsD0=;
 b=t1mVkMVMcpTxhu/bLNK7DgpHhMtjA1HopWtpKG00nesf+9i9z8DtGa44y5e5UCkOdQ9XSPDiXbVl6le+lsZZEQQK7zG2NGEHVtNmg+7Q6OFZd1sKmm5DSeb2360ZfEjnff+4eY5N/pP2fAKcOAXrhivFKdWdRXzeGGivoDHCl4o=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 CH2PR01MB5848.prod.exchangelabs.com (2603:10b6:610:41::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17; Wed, 20 Oct 2021 17:12:04 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::54ed:4286:b323:8ae6]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::54ed:4286:b323:8ae6%5]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 17:12:03 +0000
Date: Wed, 20 Oct 2021 13:12:01 -0400
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, cota@braap.org
Subject: Re: plugins: Missing Store Exclusive Memory Accesses
Message-ID: <YXBN4UZvY5ESdz6v@strawberry.localdomain>
References: <YUOssEF1lND+Rhsr@strawberry.localdomain>
 <87fsu3tppe.fsf@linaro.org>
 <YUpAXEYX0D27BnEA@strawberry.localdomain>
 <YUuQeSFsmM6YiBCp@strawberry.localdomain>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YUuQeSFsmM6YiBCp@strawberry.localdomain>
X-ClientProxiedBy: CH0PR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:610:cc::27) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
Received: from strawberry.localdomain (68.73.113.219) by
 CH0PR03CA0082.namprd03.prod.outlook.com (2603:10b6:610:cc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 17:12:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8ff874f-9f11-46b5-bb86-08d993ecbc6a
X-MS-TrafficTypeDiagnostic: CH2PR01MB5848:
X-Microsoft-Antispam-PRVS: <CH2PR01MB5848DADACB0D2AF10AD314718ABE9@CH2PR01MB5848.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GohcfXcFtTgVrBr09X31VZhCrwgbhjHLGmrF83sjz6P9udpubt2qqueDrFfoKrL4jEPylRZhl7qeRykzupfSkzzBdulizGwD0OkrP2rkK7TncYRbKQMo4xPdLHKMR3mcHvAfSK22UNrXzyWXt5XRrVI2ZdKurUfX6QZgliFmTrJF6aY9ETsjRbowmifyjvKVsT/GO5MZbz2lgrKzSrFtOnDbC4pW0+MaDFzpD9BMpy8YRCEnVjQ3lB93drf7Oh7VWhT9a6KU81nyK0h392A98WpEadHsLmu2+WYbj9rmJ+FmCevzOsnauVDrJdd1R5R8Aql6CUTvSmjMKZ3Hyc5votiD31VO9z/pAa4l6/1BUV/ynqX3IwLVyI4ivYnSAHFhWJOCERoQWAMzTzNV7H93P4ldYhFgZ8b/oqSHnzxsHg2GqLeGCA5P3a26FUGCOYXncsS/Jr3KbTdW9DXs4YvuHDQckB71d2QhuCRW7oN2cAl0O2dpwekXmxtkI4VEJnNb80QTIRbegzgPPv5TAbk3IUULr3VtB7fiVyQ3DSyny6dGH47fY9qwV/PdUMpjWpBitqqoXUpft2ausjHwmDUXY5sBSfW8Tkhb92cU1cE0ga+giOjiYnJRT8Pxrh48rupEuFgbemXWbhpkOWiIxKIakQ+OssPEqkVlBk/1ya0v4FIiVApMGzQvWoVJhVtQd4LlBSF5I9t6anaRluV6S23S/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(66574015)(66556008)(52116002)(186003)(956004)(66946007)(8936002)(38100700002)(316002)(38350700002)(9686003)(66476007)(7696005)(26005)(6506007)(8676002)(508600001)(86362001)(83380400001)(55016002)(5660300002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ORxlSzaqSIh0tH7a5IYNn1pEJLiX0uZPLAfyfKL7zjnjKsW62mgO7MA2pM?=
 =?iso-8859-1?Q?+USbO2JxEu6wyUxBAh0ddmEP+UwXhGiwdqRrfv2Mdu8A0j/5/BeqH29q9K?=
 =?iso-8859-1?Q?BpkMrMJzIWXQGowjmpb6K4ftWK5Q2JL7qDV0ocx2fUl3YWUVWu3ZtjPuN2?=
 =?iso-8859-1?Q?b7fFPuJJ+u3xQXNJglNPmFf9MsIlHGkezH8j4VEITsJMh3J8bSICdi5FIQ?=
 =?iso-8859-1?Q?WldBwzeomRcZlxziDGYUPlMDl3RJPOEwDoATXtwSV2pceKTu4nPZVA5wtg?=
 =?iso-8859-1?Q?i7MBjjBTn3CdssLgEpm6HsJlOhTB7dkhVMfYE1lH3XQdkOzlJJafwXnjUg?=
 =?iso-8859-1?Q?zqmX4s0NBPeP5SysMUYaqen4VANS9HEmalXGMCsaNHJevJN9zktKTbGb39?=
 =?iso-8859-1?Q?mEfku1r2TAoLbk59vyiNMnjQa5PL25YTXwEcEs4dHdwd5YBV3mXtew1/Ep?=
 =?iso-8859-1?Q?99DWo8FW6mi63cl4TJznikqO0rV5v8hCp60XGNHLSwDR/widHXNxy6NBbV?=
 =?iso-8859-1?Q?V4CJ9oSaXG7TQDKAy3tzznRHmimPydodI0vuK4wPP8FN/9g3jlN51h2Gy1?=
 =?iso-8859-1?Q?uJw4Lf/zs8fssfTRlIsB1yy4WAe4ziuqa0CMjYFQkKsSsdWqnn92UlTCXt?=
 =?iso-8859-1?Q?dalF5MuVk+2/+MXzkMpQJJmQ/PhL8By7Ya4Qb06FMK0e9Vr6sU0cUuYjZI?=
 =?iso-8859-1?Q?LaWPtD2q1q0TLVCH30541/+DMugHfKdvov4koqxdlrzfp9DPeBXVGaTfqE?=
 =?iso-8859-1?Q?cJ1f16GRfRBThXs1F60g8Dag0rYMn7A1ZQMfDlgQqfCy1zJNKogAFPH1it?=
 =?iso-8859-1?Q?A6dtFUm98v4tuW5+vi5XW48zDhhwHGIEhWV4l8+CModOTAKgZpajXcuebX?=
 =?iso-8859-1?Q?pQkk52M7eVB6pVQNyTdDYd3+CVJIGFFZDMmHqlWhCZXPnFN10y7V+j3y5U?=
 =?iso-8859-1?Q?xgUNrXa1uoaUExN3jerHQpNrkyX8cZ2kwjTQLgrnY4ZsbgOdX86wiFSqcm?=
 =?iso-8859-1?Q?48o7wfkouqez9pgV0fPTb/SttkSuQLoSeIlW/f7AgGn+dEaOUQMDmcEqaB?=
 =?iso-8859-1?Q?D8iQqioQuHF5XJk0Z32njq1hcEEo3fw+Y7fDBKSGFKbafvlYQDSTqJMXcG?=
 =?iso-8859-1?Q?lGt6smbemvyTtgtBx16VHHnVTBDQiCIGqWn8p/aiUV98+3q6Zcuyo+Qk0Q?=
 =?iso-8859-1?Q?nakD4NoJ1LK5IaOlDo3ChNIhk2ZnkILLcKCMgARuuUYd8/s/kitN+ICNQP?=
 =?iso-8859-1?Q?QxL7B1W8ny9HSK88biQaNw6H3f/hmYSKa2YYPm9cxjTcsyijjHpkmtQNBO?=
 =?iso-8859-1?Q?G4as7yTCtCjOszdwA1VkLqeVnJQ5pYjtaYs3CPFWoLQIZqN0Z6PfsdNLRD?=
 =?iso-8859-1?Q?GGFNmuuM2z?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ff874f-9f11-46b5-bb86-08d993ecbc6a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 17:12:03.7101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWXgcoOJIel0gyt09MSJ9I4zNFdPTvJbQbtBPmzdKwo3w2gP8KCQvPHtRZvHD+Q8KhH7EpzYUDEPxkDWwjsYR6Tf4NwpCl+REJ0bYqQX2YIlYNtgHqi4iJSg9qk/5ABY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR01MB5848
Received-SPF: pass client-ip=2a01:111:f400:fe5a::722;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>

On Sep 22 16:22, Aaron Lindsay wrote:
> On Sep 21 16:28, Aaron Lindsay wrote:
> > On Sep 17 12:05, Alex Bennée wrote:
> > > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > > > I recently noticed that the plugin interface does not appear to be
> > > > emitting callbacks to functions registered via
> > > > `qemu_plugin_register_vcpu_mem_cb` for AArch64 store exclusives. This
> > > > would include instructions like `stxp  w16, x2, x3, [x4]` (encoding:
> > > > 0xc8300c82). Seeing as how I'm only running with a single CPU, I don't
> > > > see how this could be due to losing exclusivity after the preceding
> > > > `ldxp`.
> > > 
> > > The exclusive handling is a bit special due to the need to emulate it's
> > > behaviour using cmpxchg primitives.
> > > 
> > > >
> > > > In looking at QEMU's source, I *think* this is because the
> > > > `gen_store_exclusive` function in translate-a64.c is not making the same
> > > > calls to `plugin_gen_mem_callbacks` & company that are being made by
> > > > "normal" stores handled by functions like `tcg_gen_qemu_st_i64` (at
> > > > least in my case; I do see some code paths under `gen_store_exclusive`
> > > > call down into `tcg_gen_qemu_st_i64` eventually, but it appears not all
> > > > of them do?).
> > > 
> > > The key TCG operation is the cmpxchg which does the effective store. For
> > > -smp 1 we should use normal ld and st tcg ops. For > 1 it eventually
> > > falls to tcg_gen_atomic_cmpxchg_XX which is a helper. That eventually
> > > ends up at:
> > > 
> > >   atomic_trace_rmw_post
> > > 
> > > which should be where things are hooked.
> > 
> > When I open this up in gdb, I see that I'm getting the following call
> > graph for the `stxp` instruction in question (for -smp 1):
> > 
> > gen_store_exclusive -> gen_helper_paired_cmpxchg64_le
> > 
> > In other words, I'm taking the `s->be_data == MO_LE` else/if clause.
> > 
> > I do not see where the helper behind that (defined in helper-a64.c as
> > `uint64_t HELPER(paired_cmpxchg64_le)...`) is calling in to generate
> > plugin callbacks in this case. Am I missing something?
> 
> Richard, Alex,
> 
> The more I look at this, the more it feels like the following
> AArch64-specific helpers may have been overlooked when adding
> tracing/plugin hooks:
> 	gen_helper_paired_cmpxchg64_le
> 	gen_helper_paired_cmpxchg64_be
> 
> But... I'm still not sure I fully understand how everything I'm digging
> into interacts; I am happy to keep investigating and work towards a fix,
> but think I need a nudge in the right direction.

Ping?

I'm happy to spend some more time digging into this issue, and would
love to be pointed in the right direction if someone is able!

Thanks!

-Aaron

