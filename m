Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0612031DD73
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 17:35:44 +0100 (CET)
Received: from localhost ([::1]:58840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCPni-0001aD-GN
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 11:35:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lCPky-0000h4-Ts
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:32:54 -0500
Received: from mail-co1nam11on2102.outbound.protection.outlook.com
 ([40.107.220.102]:64493 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lCPkw-0006Z7-Gh
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:32:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvRpni8k2EE13tVjVvRVROrpKADlDze8vQRl8WTq3vbZPR4sINGV/ZzuxK6+B5iNXwt65eHFGP399I+DbFRNE/u/m6rzZGjD+chAqEyULQ65VvhNARO8tGUuhHUTTOD+2xK8i/ZF6QfLV4Ir1Ypv3bQw11QVT4DdhScwRPf6mu7MUCjBsO10fFAbe8VWf1zx7k5CX5jckrc2oaIlZee5WNW3ogwmtWyIbAzHxL7FLVgfpDWanY0K5hXGsn/hdmegFgagrhgV2YPZrIhsJKsEREekj4qkHMl30tHoPvbqcSk/ex4E3eTeMuB8CC4eiRxkjitWyKYRzK3W6G2tfSe88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIGQcDB0Kdm4HUIbLigWw7xFg4PYL1t+n+vmmTRq5JE=;
 b=OVbQkf1CqSPMMqCMZLd2r7Njr7OYCDQiem+6Bvqu9Mw0s3bag1aTHsVcTnyutMbvEE8I8Ap/sU76LZt1EEjF3eEb0+S6Q0YwMUR5kGiT3cVoG2ZXz2hLrvHjXeSf+aTaf2S1WjL49JQugD+Uc+6JGwoq/DXmi0rF7YIeRxeCdw9Nty5iz252kaWEHuL8DMKXTC2xJEtCDz55UT+oNIJgngTfap//yttO2j14gIiy6nT7Mpf4ZkugUTDYNLZsasA0oWGmOq3yDYdGsy7lZ9cqeEHyHHZNdIZsQvZnybqOg+9OJZK6JHPZcV7MTs962BNGIHy2bN+lPLlNhy6fDb58MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIGQcDB0Kdm4HUIbLigWw7xFg4PYL1t+n+vmmTRq5JE=;
 b=pQuupHW8Oo8aa3d/9TrvLUzeWiDiFRxmnQBLnnT+TR8ZBVBik03KyLajQLs9aUDwJ7k8DYCUoIRFRRxWxUHwv14p+vfd9bOyEnhRVf4OUi25ENYiQRgpsb4btKU6FOETnYw5TtyH1boJ1AIjV6Z4Ni1CsQCrKAtI8GEkhIwQyuw=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN2PR01MB2173.prod.exchangelabs.com (2603:10b6:804:b::14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.29; Wed, 17 Feb 2021 16:32:45 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5%6]) with mapi id 15.20.3846.041; Wed, 17 Feb 2021
 16:32:45 +0000
Date: Wed, 17 Feb 2021 11:32:13 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, "Emilio G. Cota" <cota@braap.org>,
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>,
 Robert Henry <robhenry@microsoft.com>, mahmoudabdalghany@outlook.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 20/21] accel/tcg: allow plugin instrumentation to be
 disable via cflags
Message-ID: <YC1FDdV52Z7OHfh/@strawberry.localdomain>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-21-alex.bennee@linaro.org>
 <YCXRpCiekU+TgoAX@strawberry.localdomain>
 <877dndz6p7.fsf@linaro.org>
 <YCahojKDngG997Xz@strawberry.localdomain>
 <CAHDbmO0no_pRyG_hAEzUUJ60X6xoX1387CwaaZCJQwyyT+b0VQ@mail.gmail.com>
 <YCax2Q6VsDwMDMe6@strawberry.localdomain>
 <87r1lgti4c.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r1lgti4c.fsf@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL1PR13CA0504.namprd13.prod.outlook.com
 (2603:10b6:208:2c7::29) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL1PR13CA0504.namprd13.prod.outlook.com (2603:10b6:208:2c7::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.12 via Frontend
 Transport; Wed, 17 Feb 2021 16:32:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55129590-050a-4950-4a10-08d8d361a6d3
X-MS-TrafficTypeDiagnostic: SN2PR01MB2173:
X-Microsoft-Antispam-PRVS: <SN2PR01MB2173AA3E4A712D267BB713CC8A869@SN2PR01MB2173.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +6tqPf4VSPNuf1mEnneR0GzOb453esFOXb70+5lZZpk7PnpS3HVtnJzw36yaJqCuRnA3RkzXYUz+e46Ijm4tAVYekTYkpnDRtMZcrXhvRAw5nM8VRf3LKvWIl7CbATY+IeLgiY/JZpwQ3j+hvl/ApmBzilHXDNiN8iFntXzU/nUk9J/0KNMy+mFvBTUC81ekrlhZz+yRuqGyVhJXsgIxn3kY+s+kbtgwjSK6u28DK8aummsI8qMxUcgc7QBw6hfk/1ud7ZalgvnRBkCpshl1Dk8I/Rp9hSzs+wsuSIXaNUWcj7PM9mDIDZG3pCf88+7QFnVdVUQKfGD126iBSIX52a8gLYwoykuOtYYbj63hZPB0M0Xmf1BkIlK7eCXpMUV40T7wXEjkH1hC5QvNjw9TJswyWDa4NppW11dvtjChMcrR4lXAiKhv/xBUQbfwPbQyENnwSVo4l13ezXp0JwklmSfreXjyTQKjssmVbL2arkwSScFFFlNTAEiIznhpsidw9r3xspuScfQM/mjlbQ6G/KwcVUbK85R2fbGEhgl/Lm5wcUHYCM/XC+NjSGDhMPxTOrUKyEg+JR4P6+3qOQr4yQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(136003)(376002)(396003)(346002)(366004)(316002)(9686003)(8676002)(6916009)(186003)(7696005)(26005)(55016002)(4326008)(956004)(8936002)(5660300002)(2906002)(83380400001)(52116002)(478600001)(34580700001)(66556008)(6506007)(30864003)(54906003)(66946007)(66574015)(16526019)(86362001)(66476007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?C8T5QPjpXpKQ3korJX1eQJ5xMt3QlGDIpjzc+g7yuFsPsUwgzrJoDLa5bU?=
 =?iso-8859-1?Q?4e3vPE5se4uLLvUvcan2G6UmusD2RaE0ZXYHkrnTZerYbTufo3+QjQ6U+q?=
 =?iso-8859-1?Q?+8yGHvdK4ABh8+iOb5qqZox3Oh2AY38bV+wzKPNKDE+JNG5lyWntXKspEE?=
 =?iso-8859-1?Q?WHb54qmrFiHgm5sLf7YDqcLk024c0ot2J7QbXIPhmhq9MZ8KuRKo9LjGZd?=
 =?iso-8859-1?Q?EHdGuG5cXJtPQDj5BrH1zbaE+2ZqABlyVLzLrb9TNzIFcg7HiAoZ7VPusV?=
 =?iso-8859-1?Q?9+HNY+fd2f9dbSh17iGzH4NvQYDt/wmOXiep5ZTBpuGDxomzm9YDzLfwWv?=
 =?iso-8859-1?Q?X0PZlGXvs196A5qsONFZqKVjalgszqyHN/1Voafhaqh3c/vQCf0g9FY4qg?=
 =?iso-8859-1?Q?/sTzxp7L79mBhXVRlpLIAH+o0NrI1qvznASJ529kh79pw9cUuwEfSHQuXW?=
 =?iso-8859-1?Q?FuWmIhvuQV9abZ0VnPOMPKs9bWvevq/iusmW4CwFgcTAtMnSaIoy1I4wvq?=
 =?iso-8859-1?Q?BeSRiRLQjqLwPLsmRh/vbzrszDl7HiqGASGlRaV2SmvCiD7NGul8D/tdaQ?=
 =?iso-8859-1?Q?Rwp2AiGGiHQkqmbVWVuuliC7SNItcvCho1OoEN16jGi7LDmp3XC60XJgK2?=
 =?iso-8859-1?Q?AWg1G5weZSVSYO71vmRaCJiJEHMCFCehA0jdv6GJuCx3u7e3R9pTmVYnPe?=
 =?iso-8859-1?Q?yFAchXuJzZtBPVt9uI+LSYpQXAYsnVRYrS8V63VIUQcB5UO4dkj2E0IjZ5?=
 =?iso-8859-1?Q?XclDtm0erNP1DUFKYjrz5UPcct4jjm3Vvipz9u8BeMRpGnRZVSQGsYvv5Q?=
 =?iso-8859-1?Q?stYJeoqzxT3rmkh1snirvpl4bZ/SI/B9pnWaevKkyCp/7d6vtwtJl/ENAH?=
 =?iso-8859-1?Q?hEWJLP3oiNAxLgFCZApL91YIQHbQeoLnA3Qyhhg/6Hlck2hYogpbBTcnKg?=
 =?iso-8859-1?Q?pv2WU3+Uwt5j179Sz12+O0vkRUxVNi2ypOoCawXEZGsNafJFGJsZLgebcW?=
 =?iso-8859-1?Q?lJgEuynwU2wig0ZzHUpeugD/cfYF9Y3l72Q7DoWU7x9F1bRIohSSX5GyIH?=
 =?iso-8859-1?Q?rY8K5P9y4ji6IZ6zKnwfBo18Ilu2NzppB6MYF4pJ/FdlYFGaFG3XfgETdB?=
 =?iso-8859-1?Q?C2p9n9CszGEmWE9fXkJiFwV/iuX4qUHs/jfbezQKoOCKHr0RzF+jBhWKjL?=
 =?iso-8859-1?Q?EbAHHyYqtZnEqxujjwHyb7iCWaWO9qKSc/uI/hO5+WZ2J0nX+OSKALTf1I?=
 =?iso-8859-1?Q?XkYhxTSqgqsvgO5YpdXBZKC93hfFp7D99vLDmUFmaDTtMHToYMU6X6TNCq?=
 =?iso-8859-1?Q?SwMZADo/BjG/Qh8DwVxtQAVrryMhxP03cqcDyO3GsuCNZlPhd3nifg4kLL?=
 =?iso-8859-1?Q?jK2xM/AQ0J?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55129590-050a-4950-4a10-08d8d361a6d3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 16:32:44.9834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4cx9mCtEJLXTd+NnRyByzO/F0ijXN0nlFJhsh1FAaNhh01HtexNuriG4NHg/pUzk7ZqXTRgMAE4wmEZidxunRAHBK6MgYiunCg88pZ8fZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR01MB2173
Received-SPF: pass client-ip=40.107.220.102;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

On Feb 16 10:34, Alex Bennée wrote:
> 
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> 
> > On Feb 12 16:04, Alex Bennée wrote:
> >> Do you see two stores or one store? I think I got the sense the wrong
> >> way around because the store is instrumented before the mmu code,
> >> hence should be skipped on a re-instrumented block.
> >
> > I only see one store between the instruction callback for the store and
> > the instruction callback for the subsequent instruction.
> 
> I've posted:
> 
>   Subject: [PATCH  v3 00/23] plugins/next pre-PR (hwprofile, regression fixes, icount count fix)
>   Date: Sat, 13 Feb 2021 13:03:02 +0000
>   Message-Id: <20210213130325.14781-1-alex.bennee@linaro.org>
> 
> which I think solves it. Could you have a look?

Just did, and it looks good to me - Thanks!

-Aaron

> >
> > -Aaron
> >
> >> On Fri, 12 Feb 2021 at 15:41, Aaron Lindsay
> >> <aaron@os.amperecomputing.com> wrote:
> >> >
> >> > On Feb 12 14:43, Alex Bennée wrote:
> >> > > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> >> > > > On Feb 10 22:10, Alex Bennée wrote:
> >> > > >> When icount is enabled and we recompile an MMIO access we end up
> >> > > >> double counting the instruction execution. To avoid this we introduce
> >> > > >> the CF_NOINSTR cflag which disables instrumentation for the next TB.
> >> > > >> As this is part of the hashed compile flags we will only execute the
> >> > > >> generated TB while coming out of a cpu_io_recompile.
> >> > > >
> >> > > > Unfortunately this patch works a little too well!
> >> > > >
> >> > > > With this change, the memory access callbacks registered via
> >> > > > `qemu_plugin_register_vcpu_mem_cb()` are never called for the
> >> > > > re-translated instruction making the IO access, since we've disabled all
> >> > > > instrumentation.
> >> > > >
> >> > > > Is it possible to selectively disable only instruction callbacks using
> >> > > > this mechanism, while still allowing others that would not yet have been
> >> > > > called for the re-translated instruction?
> >> > >
> >> > > Can you try the following fugly patch on top of this series:
> >> >
> >> > This patch does allow me to successfully observe memory callbacks for
> >> > stores in this case. It seems from looking at the patch that you
> >> > intentionally only allowed memory callbacks for stores in this case, and
> >> > I still don't see callbacks any for loads.
> >> >
> >> > -Aaron
> >> >
> >> > > --8<---------------cut here---------------start------------->8---
> >> > > diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
> >> > > index 4834a9e2f4..b1b72b5d90 100644
> >> > > --- a/include/exec/plugin-gen.h
> >> > > +++ b/include/exec/plugin-gen.h
> >> > > @@ -19,7 +19,7 @@ struct DisasContextBase;
> >> > >
> >> > >  #ifdef CONFIG_PLUGIN
> >> > >
> >> > > -bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb);
> >> > > +bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool supress);
> >> > >  void plugin_gen_tb_end(CPUState *cpu);
> >> > >  void plugin_gen_insn_start(CPUState *cpu, const struct DisasContextBase *db);
> >> > >  void plugin_gen_insn_end(void);
> >> > > @@ -41,7 +41,7 @@ static inline void plugin_insn_append(const void *from, size_t size)
> >> > >  #else /* !CONFIG_PLUGIN */
> >> > >
> >> > >  static inline
> >> > > -bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
> >> > > +bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool supress)
> >> > >  {
> >> > >      return false;
> >> > >  }
> >> > > diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
> >> > > index 841deed79c..2a26a2277f 100644
> >> > > --- a/include/qemu/plugin.h
> >> > > +++ b/include/qemu/plugin.h
> >> > > @@ -92,6 +92,7 @@ struct qemu_plugin_dyn_cb {
> >> > >      };
> >> > >  };
> >> > >
> >> > > +/* Internal context for instrumenting an instruction */
> >> > >  struct qemu_plugin_insn {
> >> > >      GByteArray *data;
> >> > >      uint64_t vaddr;
> >> > > @@ -99,6 +100,7 @@ struct qemu_plugin_insn {
> >> > >      GArray *cbs[PLUGIN_N_CB_TYPES][PLUGIN_N_CB_SUBTYPES];
> >> > >      bool calls_helpers;
> >> > >      bool mem_helper;
> >> > > +    bool store_only;
> >> > >  };
> >> > >
> >> > >  /*
> >> > > @@ -128,6 +130,7 @@ static inline struct qemu_plugin_insn *qemu_plugin_insn_alloc(void)
> >> > >      return insn;
> >> > >  }
> >> > >
> >> > > +/* Internal context for this TranslationBlock */
> >> > >  struct qemu_plugin_tb {
> >> > >      GPtrArray *insns;
> >> > >      size_t n;
> >> > > @@ -135,6 +138,7 @@ struct qemu_plugin_tb {
> >> > >      uint64_t vaddr2;
> >> > >      void *haddr1;
> >> > >      void *haddr2;
> >> > > +    bool store_only;
> >> > >      GArray *cbs[PLUGIN_N_CB_SUBTYPES];
> >> > >  };
> >> > >
> >> > > diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
> >> > > index 8a1bb801e0..137b91282e 100644
> >> > > --- a/accel/tcg/plugin-gen.c
> >> > > +++ b/accel/tcg/plugin-gen.c
> >> > > @@ -842,7 +842,7 @@ static void plugin_gen_inject(const struct qemu_plugin_tb *plugin_tb)
> >> > >      pr_ops();
> >> > >  }
> >> > >
> >> > > -bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
> >> > > +bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool store_only)
> >> > >  {
> >> > >      struct qemu_plugin_tb *ptb = tcg_ctx->plugin_tb;
> >> > >      bool ret = false;
> >> > > @@ -855,6 +855,7 @@ bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
> >> > >          ptb->vaddr2 = -1;
> >> > >          get_page_addr_code_hostp(cpu->env_ptr, tb->pc, &ptb->haddr1);
> >> > >          ptb->haddr2 = NULL;
> >> > > +        ptb->store_only = store_only;
> >> > >
> >> > >          plugin_gen_empty_callback(PLUGIN_GEN_FROM_TB);
> >> > >      }
> >> > > diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
> >> > > index 14d1ea795d..082f2c8ee1 100644
> >> > > --- a/accel/tcg/translator.c
> >> > > +++ b/accel/tcg/translator.c
> >> > > @@ -58,7 +58,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
> >> > >      ops->tb_start(db, cpu);
> >> > >      tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
> >> > >
> >> > > -    plugin_enabled = !(tb_cflags(db->tb) & CF_NOINSTR) && plugin_gen_tb_start(cpu, tb);
> >> > > +    plugin_enabled = plugin_gen_tb_start(cpu, tb, tb_cflags(db->tb) & CF_NOINSTR);
> >> > >
> >> > >      while (true) {
> >> > >          db->num_insns++;
> >> > > @@ -100,6 +100,8 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
> >> > >              gen_io_start();
> >> > >              ops->translate_insn(db, cpu);
> >> > >          } else {
> >> > > +            /* we should only see NOINSTR for io_recompile */
> >> > > +            g_assert(!(tb_cflags(db->tb) & CF_NOINSTR));
> >> > >              ops->translate_insn(db, cpu);
> >> > >          }
> >> > >
> >> > > diff --git a/plugins/api.c b/plugins/api.c
> >> > > index 5dc8e6f934..ac8475707d 100644
> >> > > --- a/plugins/api.c
> >> > > +++ b/plugins/api.c
> >> > > @@ -84,15 +84,19 @@ void qemu_plugin_register_vcpu_tb_exec_cb(struct qemu_plugin_tb *tb,
> >> > >                                            enum qemu_plugin_cb_flags flags,
> >> > >                                            void *udata)
> >> > >  {
> >> > > -    plugin_register_dyn_cb__udata(&tb->cbs[PLUGIN_CB_REGULAR],
> >> > > -                                  cb, flags, udata);
> >> > > +    if (!tb->store_only) {
> >> > > +        plugin_register_dyn_cb__udata(&tb->cbs[PLUGIN_CB_REGULAR],
> >> > > +                                      cb, flags, udata);
> >> > > +    }
> >> > >  }
> >> > >
> >> > >  void qemu_plugin_register_vcpu_tb_exec_inline(struct qemu_plugin_tb *tb,
> >> > >                                                enum qemu_plugin_op op,
> >> > >                                                void *ptr, uint64_t imm)
> >> > >  {
> >> > > -    plugin_register_inline_op(&tb->cbs[PLUGIN_CB_INLINE], 0, op, ptr, imm);
> >> > > +    if (!tb->store_only) {
> >> > > +        plugin_register_inline_op(&tb->cbs[PLUGIN_CB_INLINE], 0, op, ptr, imm);
> >> > > +    }
> >> > >  }
> >> > >
> >> > >  void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
> >> > > @@ -100,16 +104,20 @@ void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
> >> > >                                              enum qemu_plugin_cb_flags flags,
> >> > >                                              void *udata)
> >> > >  {
> >> > > -    plugin_register_dyn_cb__udata(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_REGULAR],
> >> > > -        cb, flags, udata);
> >> > > +    if (!insn->store_only) {
> >> > > +        plugin_register_dyn_cb__udata(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_REGULAR],
> >> > > +                                      cb, flags, udata);
> >> > > +    }
> >> > >  }
> >> > >
> >> > >  void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_insn *insn,
> >> > >                                                  enum qemu_plugin_op op,
> >> > >                                                  void *ptr, uint64_t imm)
> >> > >  {
> >> > > -    plugin_register_inline_op(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_INLINE],
> >> > > -                              0, op, ptr, imm);
> >> > > +    if (!insn->store_only) {
> >> > > +        plugin_register_inline_op(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_INLINE],
> >> > > +                                  0, op, ptr, imm);
> >> > > +    }
> >> > >  }
> >> > >
> >> > >
> >> > > @@ -120,8 +128,13 @@ void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
> >> > >                                        enum qemu_plugin_mem_rw rw,
> >> > >                                        void *udata)
> >> > >  {
> >> > > -    plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULAR],
> >> > > -                                cb, flags, rw, udata);
> >> > > +    if (insn->store_only && (rw & QEMU_PLUGIN_MEM_W)) {
> >> > > +        plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULAR],
> >> > > +                                    cb, flags, QEMU_PLUGIN_MEM_W, udata);
> >> > > +    } else {
> >> > > +        plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULAR],
> >> > > +                                    cb, flags, rw, udata);
> >> > > +    }
> >> > >  }
> >> > >
> >> > >  void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *insn,
> >> > > @@ -129,8 +142,10 @@ void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *insn,
> >> > >                                            enum qemu_plugin_op op, void *ptr,
> >> > >                                            uint64_t imm)
> >> > >  {
> >> > > -    plugin_register_inline_op(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_INLINE],
> >> > > -        rw, op, ptr, imm);
> >> > > +    if (!insn->store_only) {
> >> > > +        plugin_register_inline_op(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_INLINE],
> >> > > +                                  rw, op, ptr, imm);
> >> > > +    }
> >> > >  }
> >> > >
> >> > >  void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
> >> > > @@ -181,10 +196,13 @@ uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb)
> >> > >  struct qemu_plugin_insn *
> >> > >  qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx)
> >> > >  {
> >> > > +    struct qemu_plugin_insn *insn;
> >> > >      if (unlikely(idx >= tb->n)) {
> >> > >          return NULL;
> >> > >      }
> >> > > -    return g_ptr_array_index(tb->insns, idx);
> >> > > +    insn = g_ptr_array_index(tb->insns, idx);
> >> > > +    insn->store_only = tb->store_only;
> >> > > +    return insn;
> >> > >  }
> >> > >
> >> > >  /*
> >> > > --8<---------------cut here---------------end--------------->8---
> >> > >
> >> > > --
> >> > > Alex Bennée
> >> 
> >> 
> >> 
> >> -- 
> >> Alex Bennée
> >> KVM/QEMU Hacker for Linaro
> 
> 
> -- 
> Alex Bennée

