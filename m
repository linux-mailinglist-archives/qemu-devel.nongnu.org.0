Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39C831A31B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 17:52:49 +0100 (CET)
Received: from localhost ([::1]:58988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAbgW-0006Nq-FI
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 11:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lAbeo-0005Ql-An
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 11:51:05 -0500
Received: from mail-bn8nam12on2123.outbound.protection.outlook.com
 ([40.107.237.123]:15745 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lAbem-0002N6-7D
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 11:51:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMBS/pFo0iZbVoTdCdHesd9XqtgqigPP7F87jh/VAHH6WeRrWP/GkC50YtmJ88DlbszbBLxdu5B8DF492sxQyq6DzG+pbHeb+6e1S8G/+nvHkDpE5OD4FV7DHLqC6KSdyfaDMgwjegin6wx/NjW1tjtNP82m0hYjMT2b4TLQGOa+NCxmrcGYgYp7f1MaUCYzg1L61SdkR/mzRBPqFLjLwQssv8QbNMq0+LE+PfqJyZkDDjUbU+USra/dqiovKWGSwgKigayWhELL2NvsE/59Zfkkh0BWUGl1LebIiu6ypRWOsifbbYrRA8c9aFUgIOIpEl8VutLieP1OnOXErmiGfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wQ8S+U7oGVIQ5dDrwmnbx0kZVerjwGcW71DrJnsjtg=;
 b=jT1rfosD1/XJl3IwLjtu5fvSyBlR0j1wWnKp1VwBmMk7qjv4Q+NJRYH/aEniZfHFkelDL2QCPMcvJM4wWMehMmF4Vf7kPI+LnuONpafsI9om6CxexxmVfFuKH4zyXyh5J0WNtgbzegI6yOVImQl+MiLGLbC/eevYxGqCL0FkZeBMhevA0b/DiLAc6NiVrfS9wNHuTQxpbYX7RWpkDuw5iHHgApUJU/BkPRWhz8j91xyY9eNEYi6fNygVkHcW4lWM20CcXFsngmlAi+3BO7s99+JSccrfGxbcAbMsrxgwcReE5wXr90wgh+vZKIHXY+lwJ+aHm/ittXmvcG2Ka+bqcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wQ8S+U7oGVIQ5dDrwmnbx0kZVerjwGcW71DrJnsjtg=;
 b=IFqfAOs8AYoznQuhzhGv9iND0hK/Zh3QGZSeqw8SWSXPyISBVvnKE+t2GyxUdYD3R7nYy6ae9weCUGVMk2YX8M2L+/UiA7JY/4P0D1QcpIR7+ptiNaiuTk10+40xEjI0Vwh4VHBSFYvbA8uaQBr2kge6OuO9wK3K+IbbbFWqW4I=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB3759.prod.exchangelabs.com (2603:10b6:805:19::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.29; Fri, 12 Feb 2021 16:50:56 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5%6]) with mapi id 15.20.3825.034; Fri, 12 Feb 2021
 16:50:56 +0000
Date: Fri, 12 Feb 2021 11:50:33 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, "Emilio G. Cota" <cota@braap.org>,
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>,
 Robert Henry <robhenry@microsoft.com>, mahmoudabdalghany@outlook.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 20/21] accel/tcg: allow plugin instrumentation to be
 disable via cflags
Message-ID: <YCax2Q6VsDwMDMe6@strawberry.localdomain>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-21-alex.bennee@linaro.org>
 <YCXRpCiekU+TgoAX@strawberry.localdomain>
 <877dndz6p7.fsf@linaro.org>
 <YCahojKDngG997Xz@strawberry.localdomain>
 <CAHDbmO0no_pRyG_hAEzUUJ60X6xoX1387CwaaZCJQwyyT+b0VQ@mail.gmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHDbmO0no_pRyG_hAEzUUJ60X6xoX1387CwaaZCJQwyyT+b0VQ@mail.gmail.com>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL0PR0102CA0017.prod.exchangelabs.com
 (2603:10b6:207:18::30) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL0PR0102CA0017.prod.exchangelabs.com (2603:10b6:207:18::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.28 via Frontend Transport; Fri, 12 Feb 2021 16:50:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8129fcce-fc1f-4cd7-a117-08d8cf765d7b
X-MS-TrafficTypeDiagnostic: SN6PR01MB3759:
X-Microsoft-Antispam-PRVS: <SN6PR01MB37596FB1322ED527D5CACC218A8B9@SN6PR01MB3759.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h+9p4khbzynuYGopmBX1Rj5mqGZFgqtKku8EexwKjXjmrAG0SVGeAjn1LisACX5fkWXhOGYmIJjarKpMVVDTkpA0Oe3yHgirN3TS0NObbqf0gmDPGDLm0SmnyTfBhCe93zopQM8lyzGISUYTYVjELzFbb+NqHAvfqnSViyU3SI92Wm8jca+ravYM9JDNBUSDZrZYL43imN6V596uJRWrgcG0AP1fCha4U9G04iTAmileYl1afXakOgDyX9GEEB+gpcdAfegnVS/uEpD0LFKy8xxQxpFiSLAstgmST9sycy9dLIhcmSK18v3tqfqCckyhAzSOsq7ruW3atu8lq2i+rhdb57f1CTH3a9JMqOF9Bco9LH5slMlrTohbE5m5SFfFFVZxX9llAqcpwQgsjLqTa5gKWJ4Pu0kYFG9pF72AW7QyYGpAIpq/RZtV/+Vf00GHB1Lt4j8PxUvG/X+JoZ6ReGRFtB8xESk1o5EWsmu58LZ3so16sAZaoSJc/5UhDZCqqK7JJaZsad9e7flDc7wsEm4UbOGuNLsFC6iiFLSSQD4ZdgHXBtty5Ryo8+l8WSgNWin1jAvNzUs8ymQzRaZ9kA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39850400004)(396003)(346002)(83380400001)(66556008)(316002)(66476007)(54906003)(52116002)(956004)(8936002)(66946007)(4326008)(7696005)(5660300002)(2906002)(86362001)(9686003)(8676002)(6916009)(55016002)(6506007)(34580700001)(478600001)(66574015)(26005)(16526019)(186003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?r75Qd95Mh0e3Kotsc1nybStnem4bh+658hSndoqf32RSycWx0yz7UUPmMF?=
 =?iso-8859-1?Q?kTJErzwjU5mwzOQk/Wsqr+vWNI2TcM1JL8wyy6fogIHUwE36FoDS0KmwhA?=
 =?iso-8859-1?Q?BWWn6uLwWCOQPwLW+vec3GMdnTHpmUPkucD/2Bn71CIYemcqqfo5zwrdLM?=
 =?iso-8859-1?Q?N1OgpWbNv2/t1QZtwugfgRsz3LBIf+kBe0iLaHcvjt64f99Zoxbvri0Bq5?=
 =?iso-8859-1?Q?A9q0pdhEIimBv1HBbFcXcoNJr5bvYsU3QL+ViiUMcjiYMSB2Ev6ZPpgdGt?=
 =?iso-8859-1?Q?/expzfspksUsuem2nJaEO9rKWRB3xgx2Xzj8+vh7ng+4tZpyDOag0SN94W?=
 =?iso-8859-1?Q?vAtvV0tHQ8z0JDgjGguFgsnrcvWmWGugrqs7tXY15CodrjT0rQkPkGeiM8?=
 =?iso-8859-1?Q?N57qnjwilZGdspatY5BNhaq+NORZTOYbgNXhD38Jq01fthR/w1XkT1e6Qy?=
 =?iso-8859-1?Q?9VNF4+IFSyCU1oBPghoiX+cNB2YrogFyJ157tbvW+pphAF9mp097gGcZzm?=
 =?iso-8859-1?Q?ztDYhe57h2NBekbSbn1VQG97Go9+Moey/En3Q72yT1Vz48Mi+bIoo2CM2R?=
 =?iso-8859-1?Q?A30H87A3BcGMxGLaEZ4LPejw7W73LaRi8nM1e/Ho72khecTB8kwkSTCQw8?=
 =?iso-8859-1?Q?I3/1TCDyv/93fRVSiWgm/ZoI58bJNvQuGkk8NeqQObdUwGn4/sY07rl5aX?=
 =?iso-8859-1?Q?ju2d2zWJvdMm8EmxK3ZtDMO/QYXzEu7tBSPpZ9aYcdYoqGeXHllKqKcDeU?=
 =?iso-8859-1?Q?x1MAGdOXc1Fvw6QM+Xs4CtmE8FCbGmkvEsTIyoAch0G8PNydM2W/tsczCx?=
 =?iso-8859-1?Q?drwZ0ciJzj/FHBhMsSoMGfP9IaI5PiFOMJieIHUmFp67ryFqOUFhAW7jxk?=
 =?iso-8859-1?Q?u0YUynAFRkxW5SaTSXxIbgUqysxvuK0hfkUaHcZwdwjQO3tnFyh+qefE9h?=
 =?iso-8859-1?Q?HIbYr7bz0HRbtKRNQzdWj6p7T6mrP5zVGBTdd1DsRt54zjJr1UjG+Pyqc4?=
 =?iso-8859-1?Q?4WIM7c/TgJXU6V/BX+M/G+zLTc87IG1IOccLy2Y06nNbIEARcQqvGFjreT?=
 =?iso-8859-1?Q?dacovt+ONfqwfIWe/QFCmWkkD7hinYr1Jnh7h9jzWbiMsCz5iKzBYiM//o?=
 =?iso-8859-1?Q?KxyZyd/++RfW5dJcS/ii5APJxGao041S6pWIJ0EbHYZkHMY0B4NX3jNaOv?=
 =?iso-8859-1?Q?boBvrA+GQdpZYDarzWmQJMfyINXgZk7rqvir8SBSKY6zBHRa7bWlh+nFJq?=
 =?iso-8859-1?Q?o0nytllPBF2u8Br9xXnrh0GyhlI+DjdUqF56kqAtG6rnjLzWc8PxHft6yf?=
 =?iso-8859-1?Q?YnRl0kMvdGQO7vnw5LF9p/UV7E8v6vsPczNTGtoGwGG5gb3P83Mf/Rq81J?=
 =?iso-8859-1?Q?0apGbq6mKS?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8129fcce-fc1f-4cd7-a117-08d8cf765d7b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 16:50:56.2294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QL9d4299MvImX8ykyALc+niwGmuuRhCoNCikRevV/NB1frofL36PMusmnMQ6W2baD2pbueZlKayHCDfDQvm2IVajyFLmmWTHETHIdfDS40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB3759
Received-SPF: pass client-ip=40.107.237.123;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

On Feb 12 16:04, Alex Bennée wrote:
> Do you see two stores or one store? I think I got the sense the wrong
> way around because the store is instrumented before the mmu code,
> hence should be skipped on a re-instrumented block.

I only see one store between the instruction callback for the store and
the instruction callback for the subsequent instruction.

-Aaron

> On Fri, 12 Feb 2021 at 15:41, Aaron Lindsay
> <aaron@os.amperecomputing.com> wrote:
> >
> > On Feb 12 14:43, Alex Bennée wrote:
> > > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > > > On Feb 10 22:10, Alex Bennée wrote:
> > > >> When icount is enabled and we recompile an MMIO access we end up
> > > >> double counting the instruction execution. To avoid this we introduce
> > > >> the CF_NOINSTR cflag which disables instrumentation for the next TB.
> > > >> As this is part of the hashed compile flags we will only execute the
> > > >> generated TB while coming out of a cpu_io_recompile.
> > > >
> > > > Unfortunately this patch works a little too well!
> > > >
> > > > With this change, the memory access callbacks registered via
> > > > `qemu_plugin_register_vcpu_mem_cb()` are never called for the
> > > > re-translated instruction making the IO access, since we've disabled all
> > > > instrumentation.
> > > >
> > > > Is it possible to selectively disable only instruction callbacks using
> > > > this mechanism, while still allowing others that would not yet have been
> > > > called for the re-translated instruction?
> > >
> > > Can you try the following fugly patch on top of this series:
> >
> > This patch does allow me to successfully observe memory callbacks for
> > stores in this case. It seems from looking at the patch that you
> > intentionally only allowed memory callbacks for stores in this case, and
> > I still don't see callbacks any for loads.
> >
> > -Aaron
> >
> > > --8<---------------cut here---------------start------------->8---
> > > diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
> > > index 4834a9e2f4..b1b72b5d90 100644
> > > --- a/include/exec/plugin-gen.h
> > > +++ b/include/exec/plugin-gen.h
> > > @@ -19,7 +19,7 @@ struct DisasContextBase;
> > >
> > >  #ifdef CONFIG_PLUGIN
> > >
> > > -bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb);
> > > +bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool supress);
> > >  void plugin_gen_tb_end(CPUState *cpu);
> > >  void plugin_gen_insn_start(CPUState *cpu, const struct DisasContextBase *db);
> > >  void plugin_gen_insn_end(void);
> > > @@ -41,7 +41,7 @@ static inline void plugin_insn_append(const void *from, size_t size)
> > >  #else /* !CONFIG_PLUGIN */
> > >
> > >  static inline
> > > -bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
> > > +bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool supress)
> > >  {
> > >      return false;
> > >  }
> > > diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
> > > index 841deed79c..2a26a2277f 100644
> > > --- a/include/qemu/plugin.h
> > > +++ b/include/qemu/plugin.h
> > > @@ -92,6 +92,7 @@ struct qemu_plugin_dyn_cb {
> > >      };
> > >  };
> > >
> > > +/* Internal context for instrumenting an instruction */
> > >  struct qemu_plugin_insn {
> > >      GByteArray *data;
> > >      uint64_t vaddr;
> > > @@ -99,6 +100,7 @@ struct qemu_plugin_insn {
> > >      GArray *cbs[PLUGIN_N_CB_TYPES][PLUGIN_N_CB_SUBTYPES];
> > >      bool calls_helpers;
> > >      bool mem_helper;
> > > +    bool store_only;
> > >  };
> > >
> > >  /*
> > > @@ -128,6 +130,7 @@ static inline struct qemu_plugin_insn *qemu_plugin_insn_alloc(void)
> > >      return insn;
> > >  }
> > >
> > > +/* Internal context for this TranslationBlock */
> > >  struct qemu_plugin_tb {
> > >      GPtrArray *insns;
> > >      size_t n;
> > > @@ -135,6 +138,7 @@ struct qemu_plugin_tb {
> > >      uint64_t vaddr2;
> > >      void *haddr1;
> > >      void *haddr2;
> > > +    bool store_only;
> > >      GArray *cbs[PLUGIN_N_CB_SUBTYPES];
> > >  };
> > >
> > > diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
> > > index 8a1bb801e0..137b91282e 100644
> > > --- a/accel/tcg/plugin-gen.c
> > > +++ b/accel/tcg/plugin-gen.c
> > > @@ -842,7 +842,7 @@ static void plugin_gen_inject(const struct qemu_plugin_tb *plugin_tb)
> > >      pr_ops();
> > >  }
> > >
> > > -bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
> > > +bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool store_only)
> > >  {
> > >      struct qemu_plugin_tb *ptb = tcg_ctx->plugin_tb;
> > >      bool ret = false;
> > > @@ -855,6 +855,7 @@ bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
> > >          ptb->vaddr2 = -1;
> > >          get_page_addr_code_hostp(cpu->env_ptr, tb->pc, &ptb->haddr1);
> > >          ptb->haddr2 = NULL;
> > > +        ptb->store_only = store_only;
> > >
> > >          plugin_gen_empty_callback(PLUGIN_GEN_FROM_TB);
> > >      }
> > > diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
> > > index 14d1ea795d..082f2c8ee1 100644
> > > --- a/accel/tcg/translator.c
> > > +++ b/accel/tcg/translator.c
> > > @@ -58,7 +58,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
> > >      ops->tb_start(db, cpu);
> > >      tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
> > >
> > > -    plugin_enabled = !(tb_cflags(db->tb) & CF_NOINSTR) && plugin_gen_tb_start(cpu, tb);
> > > +    plugin_enabled = plugin_gen_tb_start(cpu, tb, tb_cflags(db->tb) & CF_NOINSTR);
> > >
> > >      while (true) {
> > >          db->num_insns++;
> > > @@ -100,6 +100,8 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
> > >              gen_io_start();
> > >              ops->translate_insn(db, cpu);
> > >          } else {
> > > +            /* we should only see NOINSTR for io_recompile */
> > > +            g_assert(!(tb_cflags(db->tb) & CF_NOINSTR));
> > >              ops->translate_insn(db, cpu);
> > >          }
> > >
> > > diff --git a/plugins/api.c b/plugins/api.c
> > > index 5dc8e6f934..ac8475707d 100644
> > > --- a/plugins/api.c
> > > +++ b/plugins/api.c
> > > @@ -84,15 +84,19 @@ void qemu_plugin_register_vcpu_tb_exec_cb(struct qemu_plugin_tb *tb,
> > >                                            enum qemu_plugin_cb_flags flags,
> > >                                            void *udata)
> > >  {
> > > -    plugin_register_dyn_cb__udata(&tb->cbs[PLUGIN_CB_REGULAR],
> > > -                                  cb, flags, udata);
> > > +    if (!tb->store_only) {
> > > +        plugin_register_dyn_cb__udata(&tb->cbs[PLUGIN_CB_REGULAR],
> > > +                                      cb, flags, udata);
> > > +    }
> > >  }
> > >
> > >  void qemu_plugin_register_vcpu_tb_exec_inline(struct qemu_plugin_tb *tb,
> > >                                                enum qemu_plugin_op op,
> > >                                                void *ptr, uint64_t imm)
> > >  {
> > > -    plugin_register_inline_op(&tb->cbs[PLUGIN_CB_INLINE], 0, op, ptr, imm);
> > > +    if (!tb->store_only) {
> > > +        plugin_register_inline_op(&tb->cbs[PLUGIN_CB_INLINE], 0, op, ptr, imm);
> > > +    }
> > >  }
> > >
> > >  void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
> > > @@ -100,16 +104,20 @@ void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
> > >                                              enum qemu_plugin_cb_flags flags,
> > >                                              void *udata)
> > >  {
> > > -    plugin_register_dyn_cb__udata(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_REGULAR],
> > > -        cb, flags, udata);
> > > +    if (!insn->store_only) {
> > > +        plugin_register_dyn_cb__udata(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_REGULAR],
> > > +                                      cb, flags, udata);
> > > +    }
> > >  }
> > >
> > >  void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_insn *insn,
> > >                                                  enum qemu_plugin_op op,
> > >                                                  void *ptr, uint64_t imm)
> > >  {
> > > -    plugin_register_inline_op(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_INLINE],
> > > -                              0, op, ptr, imm);
> > > +    if (!insn->store_only) {
> > > +        plugin_register_inline_op(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_INLINE],
> > > +                                  0, op, ptr, imm);
> > > +    }
> > >  }
> > >
> > >
> > > @@ -120,8 +128,13 @@ void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
> > >                                        enum qemu_plugin_mem_rw rw,
> > >                                        void *udata)
> > >  {
> > > -    plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULAR],
> > > -                                cb, flags, rw, udata);
> > > +    if (insn->store_only && (rw & QEMU_PLUGIN_MEM_W)) {
> > > +        plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULAR],
> > > +                                    cb, flags, QEMU_PLUGIN_MEM_W, udata);
> > > +    } else {
> > > +        plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULAR],
> > > +                                    cb, flags, rw, udata);
> > > +    }
> > >  }
> > >
> > >  void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *insn,
> > > @@ -129,8 +142,10 @@ void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *insn,
> > >                                            enum qemu_plugin_op op, void *ptr,
> > >                                            uint64_t imm)
> > >  {
> > > -    plugin_register_inline_op(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_INLINE],
> > > -        rw, op, ptr, imm);
> > > +    if (!insn->store_only) {
> > > +        plugin_register_inline_op(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_INLINE],
> > > +                                  rw, op, ptr, imm);
> > > +    }
> > >  }
> > >
> > >  void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
> > > @@ -181,10 +196,13 @@ uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb)
> > >  struct qemu_plugin_insn *
> > >  qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx)
> > >  {
> > > +    struct qemu_plugin_insn *insn;
> > >      if (unlikely(idx >= tb->n)) {
> > >          return NULL;
> > >      }
> > > -    return g_ptr_array_index(tb->insns, idx);
> > > +    insn = g_ptr_array_index(tb->insns, idx);
> > > +    insn->store_only = tb->store_only;
> > > +    return insn;
> > >  }
> > >
> > >  /*
> > > --8<---------------cut here---------------end--------------->8---
> > >
> > > --
> > > Alex Bennée
> 
> 
> 
> -- 
> Alex Bennée
> KVM/QEMU Hacker for Linaro

