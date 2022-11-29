Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD32963C980
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 21:44:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p07Rr-0000YJ-3v; Tue, 29 Nov 2022 15:43:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1p07Rj-0000We-9T
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 15:43:15 -0500
Received: from mail-bn8nam11on2100.outbound.protection.outlook.com
 ([40.107.236.100] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1p07Rg-0000RH-U6
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 15:43:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmEyt1novFbrALHJ60ZGGq05It0vrkXS4VOShO1DgpKxta5zC09TcLpzKm7j9VkLyqPlZPBLLr50lNaHZJJu/Bk8Djaq+HQ6no5GQCaPDmP6mXAS0CY04oN0201XOTHk5M8A03ZiPkDY88EEAdXLMv/dVVdCLSbhp1CkeCL/xWlEz8b0fpWXPgpv82xLpNWB0KRKk9zS3wskvQ9pOPFFm+4VK/zzuTCBdF2RNvFZPZC9LDmgHuCNvRQrg8I3/bES9C0oKACiOjep8rBOjojO690zf1JAZk1jzcahvOWSt546El2YCqx4l/R+Lpjc0caSCHMkxugSeayyipGX/w03Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWAlMT2KbZKAHVa0Dap5vc5FYzwPDIQ8Wdh3zq5nnsQ=;
 b=SIfAIZ7X8cGNcRe8sIf/7oKouTX9T4MeWyGSwEb7qcokX+5xi6KSuTMRiT124zhXqD4lqC87yM4s6VtaQ3KbaukkSNtXcPmQ3y/hOloXMaXZ1bv+3gD5Faf+9PSbOWzObmooBIEwIVR4QTkUK7rWshHBS3r9BVZfVgsAG/AL4KhvOjWrLa7+va/DJ6VgeVKBcxVNQ8u/AJr62bcHBNBuc39ktkd1Qt0fTZiHE4RxSZBZbVLyVr+WVhx2fExOdUGc1OkZIF9ch+lIwZGSD6l8CjEumHtSGSoGyiRR+y6VvLHwnfocxWnCRSdMbvUBneCfF1zhIRQPniQDahGGVBijHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWAlMT2KbZKAHVa0Dap5vc5FYzwPDIQ8Wdh3zq5nnsQ=;
 b=XG9CuQpCa/FeT49L75q0MD48QmDibxcoWxO0y9Nej4Ylp+Q8Nd4YxfJKmYeAfBVWHnl3g/btEnrUR5nXN/7cZf8a9dhPiAnAy+2DTJnR5frxEN8R9aLPQlPLpjdbbKf0Znhd02ag2eWFF3CqY14gllF2QAQeuaWV4o+M8Qbmmyc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 BL0PR01MB4258.prod.exchangelabs.com (2603:10b6:208:46::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.25; Tue, 29 Nov 2022 20:38:06 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::607c:1d6c:d30d:6281]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::607c:1d6c:d30d:6281%5]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 20:38:06 +0000
Date: Tue, 29 Nov 2022 15:37:51 -0500
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>
Subject: Re: Plugin Memory Callback Debugging
Message-ID: <Y4Ztn91bFssBdbmR@strawberry.localdomain>
References: <Y3QNRWUK8BLRQlaQ@strawberry.localdomain>
 <878rkbalba.fsf@linaro.org>
 <Y3vdIHJrR1k1lmf8@strawberry.localdomain>
 <871qpwc6i6.fsf@linaro.org>
 <a0eae94e-eafa-e206-be32-e2ce58e466d2@linaro.org>
 <Y3zxW/vFsxCuDFW+@strawberry.localdomain>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y3zxW/vFsxCuDFW+@strawberry.localdomain>
X-ClientProxiedBy: CH0PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:610:b1::29) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|BL0PR01MB4258:EE_
X-MS-Office365-Filtering-Correlation-Id: bbf65a08-0c59-47ea-329b-08dad2499d85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q/d66iet1YBoOvGl5/vq+tCw/C+L0GjpBS7C+GN61DM2H6Yr23nQRpiJulsiQTnG3AbE/oW4JA1SwNb8+4seKGLU4701ZYqCDyEp8zrvfkRV4oN+ajV6vXVA+ZA3WKrTCZxUucK1KIbYfd+kQ9CTfhCHZw+q9KA2aGfseYWVdSMhzwv/t464+tD9LjeJ7rOFiyAYo39ykcUyiK/Z4lSrnX/BV4rjwJVmJXtq31Xaq0aMtcVn6GTp8+r+yS/A9O0X1YOG35C5Nd4nFxF2fplMslstcPYUdOCFWK7gim36b/pljVe93FySyXvVuASsfD1Auyq7VVyCd09b10k2w1Rk7vd1e+Bkxdwd+8yjJa0sh2j63ZNdoiKI6QayzmbE18wTM30Co78E4RCnm292R+R5qa/1ujDIruC91SWsr93K8bNTG8PhZ8sD+JMuE6j4KQ8ql1bcEHOzlBjvueprWCqHZWeDIfO8C9E9oiHsHK4Nt/Yu7Z2nIKVc1UryRrjGeDJrtGxabeO2TYnHpwFWdHs2oyeT0IC4DCllFcgm2lfTTL4qHWobSFyXKtHh0hNQDGM8n10Hj/7fSoMLRtm/+mj6uPHhV8/WYrvIxPulwerXFd6vhgJtRqNSj0P7Wes+v1uUzOI7kDEDYAjnoq+TtCoqSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(346002)(39850400004)(136003)(376002)(451199015)(2906002)(54906003)(38100700002)(316002)(66946007)(66476007)(6916009)(66574015)(41300700001)(5660300002)(8676002)(86362001)(66556008)(8936002)(4326008)(478600001)(53546011)(6666004)(9686003)(6506007)(6512007)(26005)(186003)(3480700007)(6486002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HwIgtDuALovgIeXdyoxlQOEEqFaB5F4tfoYTUdN0LPJk6Q2ZPgBzfkzv4h?=
 =?iso-8859-1?Q?LCp/id1bLlWm/Y6VOJFj6eMButCcU/lFDsI7ozauVYaAGk6OdETlZgNh0K?=
 =?iso-8859-1?Q?zoe7bR80IY8DvOUnj6J+Jb1g34lNuoz82Cpt4Ix7IIn1m87IH5og8Xytw3?=
 =?iso-8859-1?Q?2eKMfip41vfmy/YRBSXzuA0BI+MVBZO4AoeSZb6YSPErhNem2a88BxsBOS?=
 =?iso-8859-1?Q?tAWx49LhyHClmOXVY++VFpT5xv3V21/NWdjpTOWZdNeytw7+SQh9QsrC1I?=
 =?iso-8859-1?Q?nbZTLmJPK4nwrQfzoMp4MuUylx1B3cepShi8+7CupfX1t8QDy//FPEkcfw?=
 =?iso-8859-1?Q?XLzpgotmf6HIq+7Nw4v/6G7bzDZMwMEbXa81zmUQtFmC92WiNuLT1pe0Bx?=
 =?iso-8859-1?Q?kvEgU96RK5paPjab3oY4Kxrit+QwIfeY6BBGPKRJNWK250wx62iMuaUREU?=
 =?iso-8859-1?Q?ti+vEwiYEk+D0SvKutmhfqp9IlUBTe8EK9f7gUjGfdEDMkqnBbEx/75CRy?=
 =?iso-8859-1?Q?Fcoo4Fx1r+dyMQzpJy/bfMm5XFSPiJXmrWZnSVfkfL0lhJ3ML7o7Mhp4JY?=
 =?iso-8859-1?Q?UBmwdvG+D5jao5erda0cySeZsbZZpqBMBOX0n5yZkwLwT8XJK8f29dFAS7?=
 =?iso-8859-1?Q?06OeJ9+6E6CR/W6hWiscipl3CDC2bizX8hdMzaV8aQW/fNXuB14udX3GUP?=
 =?iso-8859-1?Q?VgjJnA+vF+izfqzXk9f0sehlGrkeyxitQoQ6Kdq63vRRWUVkDui4I+5Btn?=
 =?iso-8859-1?Q?QzOHoxvXR6ij+0s/BXXGBrMYkH/BzozkIanjEi9H5134c9Z6HgUNIuZB3a?=
 =?iso-8859-1?Q?cO+WF3k9pprwCjT89zRyIWbFVD/0YIQtXMQKgnx7NruMRfOt/gdYKtvOt6?=
 =?iso-8859-1?Q?SbvIugJ4NEyR7SCuR4frmTUStsxgC5x3DuTjEvfmzuGRPE+fnSDXdxzUrB?=
 =?iso-8859-1?Q?DxPSxnVfUcfzRWDx6PT1drh3Pg8sikdi/+Aesj9McDXl/F2kEeldyQtP27?=
 =?iso-8859-1?Q?ADWnJUYZ815VOe65zcZi68a1XVUW7AGTwFRyEfJ/IIwh6eeEPR6qSj/2tB?=
 =?iso-8859-1?Q?/RtgD15sJbFo+9AQySSOk+aKnWx2YEWSXnVSZvmYIKqEjLe3y+LIOD6wOl?=
 =?iso-8859-1?Q?LPI4YWOPfblsgBWiJpXuidvezwlV5PsSakFa7r+McguhBoftDNOZS0AcIJ?=
 =?iso-8859-1?Q?Z5WSnOxfvUB2dBoxX1NHr8cpiN3HsxbVGNSN2KW4buQOw6i4IDWoaApfML?=
 =?iso-8859-1?Q?j8GjLF9Ggpal/8+nLw7w/46BkX7OGLqH4HkSkgxm2zct1fvt3JOegDEKMB?=
 =?iso-8859-1?Q?9KUnBkyUPK9hsECKVa2MlJCCYbwXHDOYlHIsKvCMVHsiqMRuajVFdLCXYy?=
 =?iso-8859-1?Q?a/D9hihbaUo5kE/BuQbvvlaZd/z0yJSbyOq0d+TlpeJagp95omc50OwGH/?=
 =?iso-8859-1?Q?nEof+IPArarmFQa9IqaG795jEsG4KQpsHJ+BycqwFiDwg1Kc9alNhnZ7jX?=
 =?iso-8859-1?Q?veFJeXsnSMW1UM/2uIFtY0phJVesBjhH4Y+wSSp99FmL1EuJmhvLY51qGT?=
 =?iso-8859-1?Q?7JrREdB1aX30Bz4Wf0uii5XeSsnuCRzmOzwszQEVgU7iyj/iC1k/NTWG7E?=
 =?iso-8859-1?Q?ZoPjhTpPFqfAiJgKCpjBV+tWGWchUipACWqtgsL90T+n6hpbLRQfj7bleV?=
 =?iso-8859-1?Q?gV6HW3n/R3X2lYhHGy4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf65a08-0c59-47ea-329b-08dad2499d85
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 20:38:05.8878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hBuiW3FbWIIz8La4QPO65INjHCEm808xllXaTMgFr+9l/7X9AaNCZlLSJgXT7n2Js49wF22+HAQttW53frasHCEJFvQA0bZIp4oV0PBdFfTVt2U3jF9NwFgqlsn1o1q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4258
Received-SPF: pass client-ip=40.107.236.100;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Nov 22 10:57, Aaron Lindsay wrote:
> On Nov 21 18:22, Richard Henderson wrote:
> > On 11/21/22 13:51, Alex Bennée wrote:
> > > 
> > > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > > 
> > > > On Nov 15 22:36, Alex Bennée wrote:
> > > > > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > > > > > I believe the code *should* always reset `cpu->plugin_mem_cbs` to NULL at the
> > > > > > end of an instruction/TB's execution, so its not exactly clear to me how this
> > > > > > is occurring. However, I suspect it may be relevant that we are calling
> > > > > > `free_dyn_cb_arr()` because my plugin called `qemu_plugin_reset()`.
> > > > > 
> > > > > Hmm I'm going to have to remind myself about how this bit works.
> > > > 
> > > > When is it expected that cpu->plugin_mem_cbs is reset to NULL if it is
> > > > set for an instruction? Is it guaranteed it is reset by the end of the
> > > > tb?
> > > 
> > > It should be by the end of the instruction. See
> > > inject_mem_disable_helper() which inserts TCG code to disable the
> > > helpers. We also have plugin_gen_disable_mem_helpers() which should
> > > catch every exit out of a block (exit_tb, goto_tb, goto_ptr). That is
> > > why qemu_plugin_disable_mem_helpers() is only really concerned about
> > > when we longjmp out of the loop.
> > > 
> > > > If I were to put an assertion in cpu_tb_exec() just after the call
> > > > to tcg_qemu_tb_exec(), should cpu->plugin_mem_cbs always be NULL
> > > > there?
> > > 
> > > Yes I think so.
> > 
> > Indeed.
> 
> Well, the good news is that if this is an assumption we're relying on, it is
> now trivial to reproduce the problem!
> 
> Compile some simple program (doesn't really matter, the issue gets triggered
> early):
> 
> $ echo "int main() { return 0; }" > simple.c && gcc simple.c -o simple
> 
> Make this change to cpu_tb_exec():
> 
> > diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> > index 356fe348de..50a010327d 100644
> > --- a/accel/tcg/cpu-exec.c
> > +++ b/accel/tcg/cpu-exec.c
> > @@ -436,6 +436,9 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
> > 
> >      qemu_thread_jit_execute();
> >      ret = tcg_qemu_tb_exec(env, tb_ptr);
> > +    if (cpu->plugin_mem_cbs != NULL) {
> > +        g_assert_not_reached();
> > +    }
> >      cpu->can_do_io = 1;
> >      /*
> >       * TODO: Delay swapping back to the read-write region of the TB
> 
> And run:
> 
> $ ./build/qemu-aarch64 -plugin contrib/plugins/libexeclog.so -d plugin ./simple
> 
> You should fairly quickly see something like:
> 
> > [snip]
> > 0, 0x5502814d04, 0xb4000082, ""
> > 0, 0x5502814d08, 0xf9400440, "", load, 0x5502844ed0
> > 0, 0x5502814d0c, 0xf1001c1f, ""
> > **
> > ERROR:../accel/tcg/cpu-exec.c:440:cpu_tb_exec: code should not be reached
> > Bail out! ERROR:../accel/tcg/cpu-exec.c:440:cpu_tb_exec: code should not be reached
> 
> When digging through my other failure in `rr` I saw the cpu->plugin_mem_cbs
> pointer changing from one non-null value to another (which also seems to
> indicate it is not being cleared between instructions).
> 
> Does this hint that there are cases where reset cpu->plugin_mem_cbs to NULL is
> getting optimized away, but not the code to set it in the first place?

Is there anyone who could help take a look at this from the code gen
perspective?

-Aaron

