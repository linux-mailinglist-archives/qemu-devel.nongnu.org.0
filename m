Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74D940FAF8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:58:52 +0200 (CEST)
Received: from localhost ([::1]:42346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRFKF-0003xu-Uh
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1mRF6c-0006M9-4T
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:44:46 -0400
Received: from mail-bn8nam11on2102.outbound.protection.outlook.com
 ([40.107.236.102]:19681 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1mRF6a-0001iZ-1N
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:44:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwD8s9+U4cGXSEuRVP6oRwR4N76SpKNnTh3h3lKDqPgFKqKJcVMi4h0nuyhGepVH+7STxzyNJUZcj89ZInwhRv7ZSZZPxIV6np+8Wegw+R64bhCCnOOm6LfzU8B2zbmAQYxC4axdnjYSPI3i8d5Wt3WoBTuh81X4P+JEFFMK3USzkQ/6DMXDqI22XhSQfgtVgIgVv2tb6CWMa2nr1GXFKI4BctetKQqDMML4pHhy5Xp2W1COMCE6M2QgU7ug2LFLuubLIjTJjrJFKnoE9cUG63uL+SUxZskl8ZuTiObM2IL/Bcn7sh3w9JA6kRs9GWhm4yKJRmd1YakrQfcaQf7v8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=2xAfPsdsN/GDKrJMi0EA0mQjNTxoQNgWBiFP6Rq2/5M=;
 b=YGZvcYmYdFdxKz7Fj6g/sECYkAONt2AgNdIcaCBjdS/twPLA1TGVPoT76tprHc0ka2c4yjXM0dbmKWE4IAPg+NLR1TdPMQB//OqF+HeSwVtYjnWuJ4EQJCFbtnseyw2kPXUmXvmKg7U4JAUvZpwXhN6XetLJ5g3Z223uNLUOQtbIUCdlqZ9vx8+TlgXPMVqajugkEaSBYrPgHpo11BoRxQ4qPii1PgnX0cw+bmjC0ONvIm0OwYXBQN4uE8OfyJKa2/dpLLkIsS4AfL66WNWn4AtVgJ4haWebqU3nVzkttr++JiOkwOwblnh2jJ8sT9GDsq799Q350+M+UrkHArdlaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xAfPsdsN/GDKrJMi0EA0mQjNTxoQNgWBiFP6Rq2/5M=;
 b=pwadcs+77xpbqpn6NDgMK8iH/1pwVDKRMZsLMnVDA1EnvOLmigLTxzgaiMllnUS0ETPt9JJNwyzgag9giv1uX+NIsJxNXCM8cCMTmlyYwAwE+WtmkbKkG1FwWLl3N1ZJllGxnYiUiCfndcTBVvpixmHT5AGM3/S2FRUIvM26olI=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB4429.prod.exchangelabs.com (2603:10b6:805:e0::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14; Fri, 17 Sep 2021 14:44:41 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::2076:9ee4:550b:4a3a]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::2076:9ee4:550b:4a3a%5]) with mapi id 15.20.4523.017; Fri, 17 Sep 2021
 14:44:40 +0000
Date: Fri, 17 Sep 2021 10:44:35 -0400
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, richard.henderson@linaro.org
Subject: Re: plugins: Missing Store Exclusive Memory Accesses
Message-ID: <YUSp07U2t0LhC+HF@strawberry.localdomain>
References: <YUOssEF1lND+Rhsr@strawberry.localdomain>
 <87fsu3tppe.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fsu3tppe.fsf@linaro.org>
X-ClientProxiedBy: CH2PR11CA0027.namprd11.prod.outlook.com
 (2603:10b6:610:54::37) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
Received: from strawberry.localdomain (68.73.113.219) by
 CH2PR11CA0027.namprd11.prod.outlook.com (2603:10b6:610:54::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 14:44:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9c0f8ca-7960-462b-f6ec-08d979e9adf2
X-MS-TrafficTypeDiagnostic: SN6PR01MB4429:
X-Microsoft-Antispam-PRVS: <SN6PR01MB4429B0904EC582D0173B3C148ADD9@SN6PR01MB4429.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +r4hY4A9rk+WmvibGpXQrp8ItZwWGz+Uz/PXcu4MboV6M7DQjtOKIIKJAj++Y/yckQvcxwkzDSSt0JpPTFoKRBhx8tQO6IxprVUwypLjfRAi28KfvZJYNpMuohDq9OcYO3WCKRj3KIF6eF91DLx2ONjXGjLMVL0VVGJbzlzpUPTYgJiJV/89+q6aH+tniRykflnjXakEXRrNK25NJdlR+0g4PgNT382ZyNiFXFw7VlgEtRQFkCgN5/J17z1TJRH+8+brLsUbfYjTetO9v4du039yjg4KmuC+CiGfohH1QVfyzgEMIbTJR8TSqdJd+PQNkqWf9NrHJgYeQytiJChE3pZnjWYi+2mVNwHNv+x4KuC1fQ84DSGd8lIdrT5kjOXzd2cIkgcfuvLx+aOaWcfn63ZfRJxnKZ6FzvpG7yo9anH14VqV7+meXhAqCDEiWD4cmnCczoXhexgfB8z8IEbMwoxLbj8Ny/wIKyZM3gYj1K1q0zxKqMHfn40ezaWIN2SUjG9nj1anUTFV8zLYejksu3wd9A+qO7k+vmioVkHCZR0BxL+A+8hG/hvuYIHf8Ke66F8V/1YkSB5dRTpNYU35EdtcOfwRxOeAWEThkvn+rQv3R72zXu98KedKvotaC7/e31P4qdL5Ctx4S8YHvJWoKoDJS+/Tv47NPljn73xQ1yYm6fm6iqlkFQ0AsY5LEi1VdwlQGxuc3esMAOH0SROq3fxiTwuvsKsCK1C4/ei1/j0Wn/BEekbaLDKuQN/qywrx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(6666004)(6506007)(66574015)(7696005)(52116002)(26005)(66946007)(86362001)(38100700002)(316002)(186003)(38350700002)(4326008)(508600001)(6916009)(66556008)(9686003)(66476007)(55016002)(956004)(5660300002)(2906002)(8936002)(8676002)(67856001)(473944003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PTYRqFlasI5ESD9J3ucqOsNbp3cxiio+LbcfkYr8wBqZlfzegWbAbxieKR?=
 =?iso-8859-1?Q?h8TJBGaVHsdMwJPZAuYyfGgbchQgCPHDF1D2IC85OF3ct4c7h0yXtPkCYr?=
 =?iso-8859-1?Q?ryFkEfpI7PKZvJKEFzGXiPzVUdXn0XtG6yEWqYyhy2vyjcLNff6yPApx8A?=
 =?iso-8859-1?Q?k+sNh1y8Ro6KC/q8wwN6HVC/xUPc38wLJopIP3fjNXj9bcXp5tynGbBR1R?=
 =?iso-8859-1?Q?1qod7n+ADZDb4wkf98lYtqz9sv1ak6GGCx7PQ5Tw2SOG4Sl13svIMIPdji?=
 =?iso-8859-1?Q?iYZi8ykYU82GjWTBDUzQCVKVL9mwXaejR4loWTw4+sNnQxo6yapq+fdBGb?=
 =?iso-8859-1?Q?LuuYNFM/0GWvrJtKUFrPq8n5gsHydyp/M9cYigxfneM1VieaoQBDOf0zFc?=
 =?iso-8859-1?Q?llpjCSMLKu6mLLbSLrF6SR0pcHCC9UrN+S89aZ7YfJRtV1VJ1KCTm5KPul?=
 =?iso-8859-1?Q?ao+WsOPjd5J3EvFlDWZAxlEsQwmFCsMwU226q/dbHf4HZuOcOKKb4r0HVu?=
 =?iso-8859-1?Q?HR8kHXN14pkDx9yuhe471tv/ts5Vmd/Vb6g93X2sEZlMCinrJ1WesUXa73?=
 =?iso-8859-1?Q?oiU/Nhkz/cgQYCz1J94CIVTu4r4dtxWpLfUGbUwDxpudJfvIVIeJXSfYOK?=
 =?iso-8859-1?Q?4HOjjJigxSmWu4EEigHeUofp7jZRj31kkc0QhYadBIpvY4mVNM9eexwE3b?=
 =?iso-8859-1?Q?l/xIYKPDoPSX+JtdOIJd9yFnoPHacITPAP/V/FQ/vrMs7z/Izqr7iu7zLO?=
 =?iso-8859-1?Q?xnQqzzpVJy8s0PPLegXn0qvXEbGDvyUj+NDX/F3LTQbxa64dKCRSdzt8GC?=
 =?iso-8859-1?Q?7C0317xlJI6//KUtP8ZyGxS9Q+KPkYWcPBC7yw4FevV3UEAbclFJkm0dPn?=
 =?iso-8859-1?Q?KU+LgCN1cTc7WSto2Ua39iS3bH659ecQ2FazBdbGZxWMa8WetKIbE7iZ0y?=
 =?iso-8859-1?Q?Nndq+PfudubFm9RiaGPs+d96PTOigx+8p66/RbNrzci9vYOCdcNIm1bY7F?=
 =?iso-8859-1?Q?TaQtOE49kG0GXGvGUSUYNGq1TzdXZGbzl/TP8EBWBM5LL1ag+KhR8U0/J0?=
 =?iso-8859-1?Q?EqN5VO6O+cNUKjzdsYNphZN/ym7RsRWG+7VqxVWv/pNDZW7dex6v/N1MPx?=
 =?iso-8859-1?Q?uB8vXbQqaevih0Cz0fPMyZ2rDr2ufPbKUUdSMBIW93xoImy0BvfZwuB3/R?=
 =?iso-8859-1?Q?sj1227hdi+wfpVNyPSkQEikZZHtv/oQm6SwKQFwxT8pQwmbPbDKesgnWsO?=
 =?iso-8859-1?Q?mjhgB3fsMvYcDDOqcCEzB0CeY1R/QVWSq+I48kmPYZvNrQgKH/XlUu9+pS?=
 =?iso-8859-1?Q?qmIkV92JNGfsOPAO9PalsXLsiBwX1mMYPqXuseu2FinfrRBs8riEBz3CKO?=
 =?iso-8859-1?Q?REtTwEvvFz?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c0f8ca-7960-462b-f6ec-08d979e9adf2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 14:44:40.5945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yuRgHmwDOyCHh5Sxi5qSB9ISMGDwMK0peOgMccUp1ckMu5dXdNVmAak0PVBMW56OjuR4sBXrCZPNqHEc8juzhn7NNpIfAQXDJQC/DmFATqy8xsHGl7a1T7HpXctw5g/0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4429
Received-SPF: pass client-ip=40.107.236.102;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Sep 17 12:05, Alex Bennée wrote:
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > In looking at QEMU's source, I *think* this is because the
> > `gen_store_exclusive` function in translate-a64.c is not making the same
> > calls to `plugin_gen_mem_callbacks` & company that are being made by
> > "normal" stores handled by functions like `tcg_gen_qemu_st_i64` (at
> > least in my case; I do see some code paths under `gen_store_exclusive`
> > call down into `tcg_gen_qemu_st_i64` eventually, but it appears not all
> > of them do?).
> 
> The key TCG operation is the cmpxchg which does the effective store. For
> -smp 1 we should use normal ld and st tcg ops. For > 1 it eventually
> falls to tcg_gen_atomic_cmpxchg_XX which is a helper. That eventually
> ends up at:
> 
>   atomic_trace_rmw_post
> 
> which should be where things are hooked.

If I am understanding you correctly, it seems like my `stxp` should be using
the "normal" load and store tcg ops since I am running with `-smp 1`, and
therefore correctly emitting plugin memory callbacks.

I think my next step is to figure out exactly which tcg code path is being used
for this instruction to remove any doubt about what's going on here.

> > Does my initial guess check out? And, if so, does anyone have insight
> > into how to fix this issue most cleanly/generically? I suspect if/when I
> > debug my particular case I can discover one code path to fix, but I'm
> > wondering if my discovery may be part of a larger class of cases which
> > fell through the cracks and ought to be fixed together.
> 
> Have you got simple example of a test case?

My test case is reasonably simple - I can reproduce the issue reliably and in
under 5 minutes - but I don't currently have a self-contained version in a form
I can share.

Here is the surrounding dynamic instruction stream, as reported by the plugin
interface (via callbacks registered with
`qemu_plugin_register_vcpu_insn_exec_cb`), along with corresponding memory
accesses (reported via callbacks registered with
`qemu_plugin_register_vcpu_mem_cb`):

  pc               ( opcode   ): `disassembly`
------------------|-------------|-------------
0xffff0000082076b4 (0x9436c8a9): `bl    #0xffff000008fb9958`
0xffff000008fb9958 (0xf9800091): `prfm  pstl1strm, [x4]`
0xffff000008fb995c (0xc87f4490): `ldxp  x16, x17, [x4]`
	^ accesses virtual addresses: 0xffff8002fffdde60, 0xffff8002fffdde68
0xffff000008fb9960 (0xca000210): `eor   x16, x16, x0`
0xffff000008fb9964 (0xca010231): `eor   x17, x17, x1`
0xffff000008fb9968 (0xaa110211): `orr   x17, x16, x17`
0xffff000008fb996c (0xb5000071): `cbnz  x17, #0xffff000008fb9978`
0xffff000008fb9970 (0xc8300c82): `stxp  w16, x2, x3, [x4]`
0xffff000008fb9974 (0x35ffff50): `cbnz  w16, #0xffff000008fb995c`
0xffff000008fb9978 (0xaa1103e0): `mov   x0, x17`
0xffff000008fb997c (0xd65f03c0): `ret   `
0xffff0000082076b8 (0xd503201f): `nop   `
0xffff0000082076bc (0xd503201f): `nop   `
0xffff0000082076c0 (0xd503201f): `nop   `
0xffff0000082076c4 (0xb94010a1): `ldr   w1, [x5, #0x10]`
	^ accesses virtual addresses: 0xffff8002f18b5cd0
0xffff0000082076c8 (0x51000421): `sub   w1, w1, #1`
0xffff0000082076cc (0xb90010a1): `str   w1, [x5, #0x10]`
	^ accesses virtual addresses: 0xffff8002f18b5cd0
0xffff0000082076d0 (0x35000061): `cbnz  w1, #0xffff0000082076dc`

Notice that the `stxp` receives no corresponding callbacks via
`qemu_plugin_register_vcpu_mem_cb` like the `ldxp`, `ldr`, and `str` do.

-Aaron

