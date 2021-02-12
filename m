Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4843D31A1EF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 16:43:51 +0100 (CET)
Received: from localhost ([::1]:54954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAabm-0001rD-A6
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 10:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lAaa0-0008RY-87
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 10:42:01 -0500
Received: from mail-eopbgr700092.outbound.protection.outlook.com
 ([40.107.70.92]:14688 helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lAaZp-0003jA-Uh
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 10:41:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GD8b4m8UzackITlIygJ0APu7XyUA6EUNx1DxzZUZGdkoV56lXFBIjFry3wkMahkfVO6lPHrq36NQUXVFbTlMVn5Pt4QGSp3RS04brFrpdfqklgDGAg5MJQDx2/jTkrdGTHD1UJqpe6zLckyteQACqFsoVYNi5TtsFOf+LCVH/Xbyv0MGEcSi2mduv5Uvu/D0IlIMRgEoY+Td5M28ZbNPGr813H6eE4A7l7/GVURBPNIzZdW5eKYgmZLo8rvaKypfOha7rpCVPiDrz7AP7UbTWAj5VoWaE0YmXvVDPCZ09qJXMRI5tpceVjU66V8fYI+iy3rornXPR2bZ/CZAUEiHlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IywFvBdfmB/eOvssQeMIRcg8BSLMEz85623HifCt4iA=;
 b=Eoxe4U0xaqMAoDYzlJL4rvJ3wIxfDb4tl8SuBs/0DGijBy7b3k8U2F+ByG20owQcPHVpNU8QtWgAPpM+r0vvN6puUmQynKr+sN0oiOtMI5brZfQp4jiRUAc770hklkIeh9cQlyq7TNHSvNFImVHpWVol/hGwMYnd2IfaOxyZw6S/vLk3quHSg2LA2cIbOAB08LfL3n2Z7sxoX3vJyfcx46pcE05uzEuuEb+PmTwGI78T2ghlLfB+FgJ27GXX0ldBLpDN5HMJhRfoRztbpaeKEgO5l1xIXjJqTAAbFLKmlLkasy4wgy2kVBOIa3pe5gcI+rUbVCH1qHajmbeYMyPScQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IywFvBdfmB/eOvssQeMIRcg8BSLMEz85623HifCt4iA=;
 b=TFyfrr1K6zun8OBTBszGqNUsW7w2EpAyPtWAI6iPEw3PwfUWWs1krhIC9Nb/CJJTrkI+sN6vTrrnItUfSkcHCMsbi7erQy3z/4rjFTIcZfdagopIQHO6qWWt5XcI9dbOfI2tPzemfke1GckdE8k04TEqDXlzTDmCjWn3/iNah0U=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB3933.prod.exchangelabs.com (2603:10b6:805:1b::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.27; Fri, 12 Feb 2021 15:41:45 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5%6]) with mapi id 15.20.3825.034; Fri, 12 Feb 2021
 15:41:45 +0000
Date: Fri, 12 Feb 2021 10:41:22 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH  v2 20/21] accel/tcg: allow plugin instrumentation to be
 disable via cflags
Message-ID: <YCahojKDngG997Xz@strawberry.localdomain>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-21-alex.bennee@linaro.org>
 <YCXRpCiekU+TgoAX@strawberry.localdomain>
 <877dndz6p7.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877dndz6p7.fsf@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: MN2PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:208:160::25) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 MN2PR13CA0012.namprd13.prod.outlook.com (2603:10b6:208:160::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.11 via Frontend
 Transport; Fri, 12 Feb 2021 15:41:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2799ff46-36eb-44c2-68b0-08d8cf6cb3c2
X-MS-TrafficTypeDiagnostic: SN6PR01MB3933:
X-Microsoft-Antispam-PRVS: <SN6PR01MB39332CD8E6E08EB72C08C7238A8B9@SN6PR01MB3933.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L/SqBazlgwhz7DL5d9aNvaMR1tbIXXy4Jbi2S1903wAslJCjAMlwUsOCHU3THQc3AQIKKFEGFGOMtQz5Ns96Fuxl4FJLcl9q5hOkRho3mIAQSYnhvswT0/TvuuL3XTL4VBc0WCeOjzr7KR7vkICryIPBHoTEajweH29xhtsjpMysARMDdDMK8SqAE+ZTCbNx8w0CKAxKNpawb7DnYU7+U5uuhWOvwrPlvlzBm5/bLi1iQ8HqbsABeGx80loHE0EdZ2AGAF+//V+DQGtXuAJvWlDWsC3eAWPJnRrHOeZefGyQDUFn1IKa+rFvEf056O8WWAxD7lD6QdkkSEsNBEsWgatNzpRUurkam21esgdT+/KnED2ZKVl6GAhJpzbt0fb0DHZHIRBCu9DDyWuBqwxgbuPb/LNTJIfLKH7k7PJRZrp9YuKNo0nJC/+b7fEXVmb3vaW+ulq54yHszofn7SHDN6e+uU0bFGuSvcdtIyySwWpaxuvl1NIJyXM/z5qImwLUalfgaYJGDyNpYJqsvXkuUOsCQgaLxAjnF7lUhAMDw6IZGgi2fMQE5UPKhDv2qb5epiDmzYnAPgdd6Svjdpu6GQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(396003)(346002)(136003)(366004)(5660300002)(316002)(83380400001)(54906003)(55016002)(34580700001)(66574015)(9686003)(8936002)(66556008)(66476007)(52116002)(2906002)(8676002)(26005)(6506007)(4326008)(956004)(6916009)(186003)(7696005)(66946007)(86362001)(16526019)(478600001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?+fnVmt27m9EcMiE6LQQ5vyh9NYajyS2jzafhhTRGEWrVBQeXwYTtiqNeAC?=
 =?iso-8859-1?Q?dYQIS4H9rae2lnOj18SIZ7Y0CCk4K71J2XcU5FAf9NYwH0sw0Xz3uvg/wG?=
 =?iso-8859-1?Q?dSHdrb6hF7wlgo6uw2Qg2M1hkqjbYqJnKZbO1J+PnAGAx5/h4ocxNROIV1?=
 =?iso-8859-1?Q?xoVvv19gxJ2cSrTdlM8yWcb3bbckheAqVyFoHY8y/S8+cD9063AWvzEEKn?=
 =?iso-8859-1?Q?BjHWFNkDJJmK+23PJ9Y4C0Pe5gUb3T9IMJiJnQX/pFqDv4E7eynQXrMoUU?=
 =?iso-8859-1?Q?TdzmGba5Tey5tnEkXoKcckN5TR3EMfMI8V/CMwZuD8BSKXWwdkB9QTToMz?=
 =?iso-8859-1?Q?gCkGvntlfdqnS7gvkj1Tom8v7rPvQ6UEbqLRmsWktgRqsUrHDMi2fzJCkK?=
 =?iso-8859-1?Q?zuKcUDchC2HaFIvNoq1fKO062Z2CmkYJtL8ezmLgJz1dPyuR1alqgLzhSa?=
 =?iso-8859-1?Q?Mtx/jknWArrbFh1y9c5wG+waiwCtrvUc5IbdKoOrYusnCt1XlJeXGd1aUJ?=
 =?iso-8859-1?Q?x/CA8LL8pMVf9qq7pEnxRLppk+mM9rxNnzIf851zEWn0Lt5Fp044LQUjV+?=
 =?iso-8859-1?Q?daiukwW/CzF1K6OhTFuelc+ltU6MnqGfVNmC8Cd3jJ7u8SghJSf1Tsog9l?=
 =?iso-8859-1?Q?/uIls3y3IIhpo3RfUm+3mLHubzsSmjLrYPYxKmf0JTsMX/NU2+B4zWPPrf?=
 =?iso-8859-1?Q?0SVbkLWOM5tdZiSVSnfzPGNoSXMeOWec44Ia0bCRm9YrDQQalGIv0RhsOl?=
 =?iso-8859-1?Q?r8F2pIH/WptS5vwZtIin+unBGYFyO3zCb6jYeP4Q/vVoHiqkRF5lsgp9ML?=
 =?iso-8859-1?Q?rn6imQO4UfkZdChwgmXrargmmNg6Io5zR0TOZaG6a/DhjHbC2B8eJa3epd?=
 =?iso-8859-1?Q?3C5ykBlib0fR5sYlr4AsksRIRawEVdzfoBPMjLh2/Udxh7vvaMsRT8ChzR?=
 =?iso-8859-1?Q?WeyxSWeh/02PTgSQe+k0sivYlrkvLGCYYQjA8s+m1vXA8HDOWLuj02kPeZ?=
 =?iso-8859-1?Q?2YvZkuPcQc8c5Hb3fHjiA6VkuP+LCZdR7H5JDpwjPEqeJnRzFAXInbY523?=
 =?iso-8859-1?Q?leIzotpTzKOnA6NpmJCyUX/tinqkcUL2P1JVzSCQNV3qJRkEC8cvRozkvq?=
 =?iso-8859-1?Q?pyyT5JpiwIt0wSc7YVdOCfyjesdzrG4IO38ijb+p5wPKoim2iT2ptUUwD9?=
 =?iso-8859-1?Q?IBgLdebUUECUmEI1IMc6HONJLaBVqOWKN+Z6OundYzfWUeoXvBDOJl1Imk?=
 =?iso-8859-1?Q?bCXSqDcsxzXnRsMVInG3jTClgYc+0axn/U7QuaMMC8FfZQQhL+gr6mxvZU?=
 =?iso-8859-1?Q?9TyvP35Oz+NRmuJg/1/fRoByEkLzNZMbohfNzyspw/MmeOehBXJk/oErMm?=
 =?iso-8859-1?Q?Mh/SqgcqOl?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2799ff46-36eb-44c2-68b0-08d8cf6cb3c2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 15:41:45.5673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPC9oHxhEJ/xQS9FzoaEyDTauRPOFJWhVWYPpOWoA1IZJ8xOrWstbXCF/g/BrlQcD+ku5iCXuyzTeCSRTBoJfGBYzNt6JVb9FjX3PfgpKzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB3933
Received-SPF: pass client-ip=40.107.70.92;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM04-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_MSPIKE_H2=-0.001,
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

On Feb 12 14:43, Alex Bennée wrote:
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > On Feb 10 22:10, Alex Bennée wrote:
> >> When icount is enabled and we recompile an MMIO access we end up
> >> double counting the instruction execution. To avoid this we introduce
> >> the CF_NOINSTR cflag which disables instrumentation for the next TB.
> >> As this is part of the hashed compile flags we will only execute the
> >> generated TB while coming out of a cpu_io_recompile.
> >
> > Unfortunately this patch works a little too well!
> >
> > With this change, the memory access callbacks registered via
> > `qemu_plugin_register_vcpu_mem_cb()` are never called for the
> > re-translated instruction making the IO access, since we've disabled all
> > instrumentation.
> >
> > Is it possible to selectively disable only instruction callbacks using
> > this mechanism, while still allowing others that would not yet have been
> > called for the re-translated instruction?
> 
> Can you try the following fugly patch on top of this series:

This patch does allow me to successfully observe memory callbacks for
stores in this case. It seems from looking at the patch that you
intentionally only allowed memory callbacks for stores in this case, and
I still don't see callbacks any for loads.

-Aaron

> --8<---------------cut here---------------start------------->8---
> diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
> index 4834a9e2f4..b1b72b5d90 100644
> --- a/include/exec/plugin-gen.h
> +++ b/include/exec/plugin-gen.h
> @@ -19,7 +19,7 @@ struct DisasContextBase;
>  
>  #ifdef CONFIG_PLUGIN
>  
> -bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb);
> +bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool supress);
>  void plugin_gen_tb_end(CPUState *cpu);
>  void plugin_gen_insn_start(CPUState *cpu, const struct DisasContextBase *db);
>  void plugin_gen_insn_end(void);
> @@ -41,7 +41,7 @@ static inline void plugin_insn_append(const void *from, size_t size)
>  #else /* !CONFIG_PLUGIN */
>  
>  static inline
> -bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
> +bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool supress)
>  {
>      return false;
>  }
> diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
> index 841deed79c..2a26a2277f 100644
> --- a/include/qemu/plugin.h
> +++ b/include/qemu/plugin.h
> @@ -92,6 +92,7 @@ struct qemu_plugin_dyn_cb {
>      };
>  };
>  
> +/* Internal context for instrumenting an instruction */
>  struct qemu_plugin_insn {
>      GByteArray *data;
>      uint64_t vaddr;
> @@ -99,6 +100,7 @@ struct qemu_plugin_insn {
>      GArray *cbs[PLUGIN_N_CB_TYPES][PLUGIN_N_CB_SUBTYPES];
>      bool calls_helpers;
>      bool mem_helper;
> +    bool store_only;
>  };
>  
>  /*
> @@ -128,6 +130,7 @@ static inline struct qemu_plugin_insn *qemu_plugin_insn_alloc(void)
>      return insn;
>  }
>  
> +/* Internal context for this TranslationBlock */
>  struct qemu_plugin_tb {
>      GPtrArray *insns;
>      size_t n;
> @@ -135,6 +138,7 @@ struct qemu_plugin_tb {
>      uint64_t vaddr2;
>      void *haddr1;
>      void *haddr2;
> +    bool store_only;
>      GArray *cbs[PLUGIN_N_CB_SUBTYPES];
>  };
>  
> diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
> index 8a1bb801e0..137b91282e 100644
> --- a/accel/tcg/plugin-gen.c
> +++ b/accel/tcg/plugin-gen.c
> @@ -842,7 +842,7 @@ static void plugin_gen_inject(const struct qemu_plugin_tb *plugin_tb)
>      pr_ops();
>  }
>  
> -bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
> +bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool store_only)
>  {
>      struct qemu_plugin_tb *ptb = tcg_ctx->plugin_tb;
>      bool ret = false;
> @@ -855,6 +855,7 @@ bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
>          ptb->vaddr2 = -1;
>          get_page_addr_code_hostp(cpu->env_ptr, tb->pc, &ptb->haddr1);
>          ptb->haddr2 = NULL;
> +        ptb->store_only = store_only;
>  
>          plugin_gen_empty_callback(PLUGIN_GEN_FROM_TB);
>      }
> diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
> index 14d1ea795d..082f2c8ee1 100644
> --- a/accel/tcg/translator.c
> +++ b/accel/tcg/translator.c
> @@ -58,7 +58,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
>      ops->tb_start(db, cpu);
>      tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
>  
> -    plugin_enabled = !(tb_cflags(db->tb) & CF_NOINSTR) && plugin_gen_tb_start(cpu, tb);
> +    plugin_enabled = plugin_gen_tb_start(cpu, tb, tb_cflags(db->tb) & CF_NOINSTR);
>  
>      while (true) {
>          db->num_insns++;
> @@ -100,6 +100,8 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
>              gen_io_start();
>              ops->translate_insn(db, cpu);
>          } else {
> +            /* we should only see NOINSTR for io_recompile */
> +            g_assert(!(tb_cflags(db->tb) & CF_NOINSTR));
>              ops->translate_insn(db, cpu);
>          }
>  
> diff --git a/plugins/api.c b/plugins/api.c
> index 5dc8e6f934..ac8475707d 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -84,15 +84,19 @@ void qemu_plugin_register_vcpu_tb_exec_cb(struct qemu_plugin_tb *tb,
>                                            enum qemu_plugin_cb_flags flags,
>                                            void *udata)
>  {
> -    plugin_register_dyn_cb__udata(&tb->cbs[PLUGIN_CB_REGULAR],
> -                                  cb, flags, udata);
> +    if (!tb->store_only) {
> +        plugin_register_dyn_cb__udata(&tb->cbs[PLUGIN_CB_REGULAR],
> +                                      cb, flags, udata);
> +    }
>  }
>  
>  void qemu_plugin_register_vcpu_tb_exec_inline(struct qemu_plugin_tb *tb,
>                                                enum qemu_plugin_op op,
>                                                void *ptr, uint64_t imm)
>  {
> -    plugin_register_inline_op(&tb->cbs[PLUGIN_CB_INLINE], 0, op, ptr, imm);
> +    if (!tb->store_only) {
> +        plugin_register_inline_op(&tb->cbs[PLUGIN_CB_INLINE], 0, op, ptr, imm);
> +    }
>  }
>  
>  void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
> @@ -100,16 +104,20 @@ void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
>                                              enum qemu_plugin_cb_flags flags,
>                                              void *udata)
>  {
> -    plugin_register_dyn_cb__udata(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_REGULAR],
> -        cb, flags, udata);
> +    if (!insn->store_only) {
> +        plugin_register_dyn_cb__udata(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_REGULAR],
> +                                      cb, flags, udata);
> +    }
>  }
>  
>  void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_insn *insn,
>                                                  enum qemu_plugin_op op,
>                                                  void *ptr, uint64_t imm)
>  {
> -    plugin_register_inline_op(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_INLINE],
> -                              0, op, ptr, imm);
> +    if (!insn->store_only) {
> +        plugin_register_inline_op(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_INLINE],
> +                                  0, op, ptr, imm);
> +    }
>  }
>  
>  
> @@ -120,8 +128,13 @@ void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
>                                        enum qemu_plugin_mem_rw rw,
>                                        void *udata)
>  {
> -    plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULAR],
> -                                cb, flags, rw, udata);
> +    if (insn->store_only && (rw & QEMU_PLUGIN_MEM_W)) {
> +        plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULAR],
> +                                    cb, flags, QEMU_PLUGIN_MEM_W, udata);
> +    } else {
> +        plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULAR],
> +                                    cb, flags, rw, udata);
> +    }
>  }
>  
>  void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *insn,
> @@ -129,8 +142,10 @@ void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *insn,
>                                            enum qemu_plugin_op op, void *ptr,
>                                            uint64_t imm)
>  {
> -    plugin_register_inline_op(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_INLINE],
> -        rw, op, ptr, imm);
> +    if (!insn->store_only) {
> +        plugin_register_inline_op(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_INLINE],
> +                                  rw, op, ptr, imm);
> +    }
>  }
>  
>  void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
> @@ -181,10 +196,13 @@ uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb)
>  struct qemu_plugin_insn *
>  qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx)
>  {
> +    struct qemu_plugin_insn *insn;
>      if (unlikely(idx >= tb->n)) {
>          return NULL;
>      }
> -    return g_ptr_array_index(tb->insns, idx);
> +    insn = g_ptr_array_index(tb->insns, idx);
> +    insn->store_only = tb->store_only;
> +    return insn;
>  }
>  
>  /*
> --8<---------------cut here---------------end--------------->8---
> 
> -- 
> Alex Bennée

