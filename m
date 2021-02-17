Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E0431DDA2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 17:48:32 +0100 (CET)
Received: from localhost ([::1]:47778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCQ06-0001vh-CP
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 11:48:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lCPxx-00017c-Ds
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:46:17 -0500
Received: from mail-eopbgr750127.outbound.protection.outlook.com
 ([40.107.75.127]:54147 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lCPxv-0002ac-5F
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:46:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/cLGLJz09KWW2s6o6e3jHz6tnMB7I+vynEauKCDP+ZI490+yEDRr6PDFa+zWgaMxiQdPaijVUCUdteHQWXMqC67tRSOG5lcCicm5B8xCMPs7xQ6oqMgue7Kp3TtO90/sF+NwY3+IvHjk8F8gtVporc2jPPbsnU4LW/JgLloX9QPqobTeIkSglSg3JI3PzzC+tG2l0b7j1JYZdLCiIMCnfnkHQlqjRfGK8TUG59IOXFZXxm5Tze49/ntwjD8co2L0Qi47I42M5n+fNFZPS4oK/EWg3O7kA6gtQ4Uts3egX/6xCmjSKACIOEgbzhTU7EmdmR9C5EbH2twcpj90SWjBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLQyHNb+CJ4hFZ3xGi6/YzrM9CL5uPuxlsk4gFIFZhQ=;
 b=am20Ow8Hv/khdPbxuPj3LoC0yUhDiOM2T8+mApcaA9oHle1VkZXhTuNWqJeCZOBWtwYDuigeY0vHzxsEui4CZkFaKAub3flcTwr1mX9u07++vtSMz4QNFrKenGmpyqj8utrHwsVvV2fuinLP/9SBF4scchwWQoYtXZngvp6XQvzVSmFA37tf5Dj5ZKmIEyznx9ZZe2rtQWJKXldVkGmjk/H5gweu4gTNnnzRT07FDze16QevE6OA4KiHr/rcrnPJ2uUnrjPfhThA1M4T5+MuRavBm5i6BxAUcm7Szv1XyrNoJlqzgOX/v9ayKr2migsKLv3gYDZ4U+vWJd7UDX4sww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLQyHNb+CJ4hFZ3xGi6/YzrM9CL5uPuxlsk4gFIFZhQ=;
 b=Y5Uo3v3rzUxNHbVnBeBMSl4b0jgHVi8O7OAzU66Wc5AMN0h1rm3hgP/J0jUI1mlOBViag7tmsnFZY0/dfOlMlWvEy2xjlY47Y7fIoggzOKXMu/mdGI0PvEER4f7Mutl3BDJdffF5nVrrtnPYHg4BBVFCGbUqFqn/17HrhDOliYg=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SA0PR01MB6411.prod.exchangelabs.com (2603:10b6:806:ed::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.26; Wed, 17 Feb 2021 16:31:10 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5%6]) with mapi id 15.20.3846.041; Wed, 17 Feb 2021
 16:31:10 +0000
Date: Wed, 17 Feb 2021 11:30:39 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH  v3 20/23] accel/tcg: allow plugin instrumentation to be
 disable via cflags
Message-ID: <YC1Er+9TB4h1QXgt@strawberry.localdomain>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
 <20210213130325.14781-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210213130325.14781-21-alex.bennee@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL1PR13CA0224.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::19) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL1PR13CA0224.namprd13.prod.outlook.com (2603:10b6:208:2bf::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.12 via Frontend
 Transport; Wed, 17 Feb 2021 16:31:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50b8adba-c091-4f54-eadb-08d8d3616eaf
X-MS-TrafficTypeDiagnostic: SA0PR01MB6411:
X-Microsoft-Antispam-PRVS: <SA0PR01MB64119741E7C56AF7F5C847F98A869@SA0PR01MB6411.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oXfINKmDCLWjNMI67GwDPu3zMlOe/oY89+RbNEg/WFGyeKQ/buChRc3eKieVSAu4y0ETpwRx/v9GNIe4aLiPoAHE0eFBBOJD7BY8pJghwgkev1ZDNlzdUsfCP2Dnu62+Hd/uvzi4rE8ai4Rqt5cEKw+iC49TBgdvIQZYr+W0E1jvkRm82mgtgtUJOZrCuIjFXtP1U5z0JJcGlycvOu2Sy0oHQJJyx9Y5aK+TrC5Rfl+zB/P/y9uRgubeCC2Z7SGYnYu8D8vhCtFKSm1gymsROuTDqbNZl8zvxCWuDoLOQJuFgo6x3fsTSKOxlfPnpbX0vTEDGECmmXyE22bhyNPaCGWUTWI3P4h2XkiI1hRTQuJGjSymzlUaZcX3W6dbIOZdw9Yur/BgVjBme1/VAKQlWxwRinAf+fwTJhNskzEVNgNUEhMHSBsZwPGMMgN3+o16SdjudtysHmnzCU6+YtbFuJhAZGqEP78UMCVL7NCqWpJg/B2qEqS/9oG92gcT6NblXiWJbCha/ilJ9o6ldZiHwcg9Tsx/SH81jwfX6ZKwjii3KDiClHD6tKZg7qpLnkDzNnQ1YC6WU5H6AaVfyALKknllX8aGmm4MvFegSOnoafM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39850400004)(366004)(346002)(376002)(16526019)(86362001)(186003)(66556008)(316002)(6916009)(5660300002)(2906002)(6506007)(26005)(4326008)(956004)(6666004)(30864003)(66476007)(66574015)(9686003)(55016002)(34580700001)(7696005)(83380400001)(52116002)(478600001)(8936002)(8676002)(54906003)(66946007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?5Y3QW/l92PbCdTXx9GvDizoYbimad01kD+CKF4thD7lSM2OF/3VB0ciROA?=
 =?iso-8859-1?Q?oqcT0lkjFK6FaAWiRrwGzPtrGBVM9RK6xvBYJxK+IXk04WAOHq3yLKLmOX?=
 =?iso-8859-1?Q?7n2B9cyK1LkeGjQcMJlPsYj8KHAkV+Tw5511agM91agN/fq3ZP/WAKxajM?=
 =?iso-8859-1?Q?gRh85DZVYQni0YFMQXDmWWMoIx/UhtebZgPjqkKSiODNW7HccsCyvkqVqq?=
 =?iso-8859-1?Q?q2SvyjEeNHm3Clt+1BjNY5yq4srAPoqguv2twB2rlZp/Y2Zez5/zG2fnvL?=
 =?iso-8859-1?Q?q6wuu7GfgAt12VNXTNPiCODnaV1qtxw4nHHz1GRrGvjmSMFp4bZs3nqFz7?=
 =?iso-8859-1?Q?CVKqQUH/4+vPzfeI0oCHhx8kalYEqIYcY5aEdjd7KIAzWT52jW8cfFxw7x?=
 =?iso-8859-1?Q?8oUWJRk3l+7ItbOJ3244iQXDzDnqTJ3421XYAXW9KtUQYXZnvZjgkAp1PR?=
 =?iso-8859-1?Q?pUhs49pEDkc3moNo0IG4CG2BxhElKVNbRioNumDe3+OO98P80UtugVXuX/?=
 =?iso-8859-1?Q?0DXg4Y5j6hfdf/rJN4jF24m7WFWcusUh9ztgn7Kk6W8IxJQVWDcpTtRHLN?=
 =?iso-8859-1?Q?ojbC4iUJu+Fr1kNVVp+laa7PQHwFAu2vVNYKYNnHc4dRyJPlXRr4QwOvHN?=
 =?iso-8859-1?Q?+zVkz9zFi7aSLH4LwoWwpvAVNBuPnrRfVe7+885dqN4BBHnLOmMy/kCiO9?=
 =?iso-8859-1?Q?I2zJOzguAEiZeWgMURCZ5iDO/d3YdFRVU8Sa0y9sioFDi9psveuHiy2vT8?=
 =?iso-8859-1?Q?FQBL0Evw+tugTB3lS6ASso/rILTXPU0ey4yG0EQFjN3dr2tH+hDwa9PTsX?=
 =?iso-8859-1?Q?tklkKhSutZl+Fq8gc1rN7ZmJ56kiNG+1wfpjw8CInMhcg8aRqBLtW5EjGX?=
 =?iso-8859-1?Q?DKMUGVce+8xB1PnIXYhzli698uLe+aaPlpJzP15QLMzLviaqKfXOMa4abV?=
 =?iso-8859-1?Q?jcLBnmu306IpXZc+8BZrSBJrogkIZ97wuklO2DaRySxVnJsaJBAFspMkCF?=
 =?iso-8859-1?Q?2S3Why+71pGZdrw+C1EKu+GpAwbv8WS74fRG9Nu20SUcYyQWJEFRZEEIjp?=
 =?iso-8859-1?Q?krqC0WLp+L6Ez8B/EaPxnmZ1OyzUmOg18wn/pmi4u0388jPkxtwyWZfMbG?=
 =?iso-8859-1?Q?65U1vZzJeAzhiNiR7+2moJGU1r/ZWSBd8yjR6oOu5ikjHNcxYVr8T1Mgkl?=
 =?iso-8859-1?Q?vxNwj1Ydoel/j1D8nmJCJGnrN9RxU9VZdlfNxpp5dosgduZ6s39N5BAoj3?=
 =?iso-8859-1?Q?PFdhJG0vXY7o2IT2jkJDWZg0uRTbQGU3nczNjkvBPZHPD2UcIOevi+21UJ?=
 =?iso-8859-1?Q?bZ9NFdnKgnoZANyonf99+CvvG2ywQnbw9cmeqi0lcy/yUKAZwr5ZkEtahu?=
 =?iso-8859-1?Q?8ln4gIyzcX?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b8adba-c091-4f54-eadb-08d8d3616eaf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 16:31:10.0162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjPoclrbL39Jo42rKt3CpI7x67a51b+zJJpcXZMjlU6MK88JI7Rg3wiGIi/QWJh8TpfS2zCnKZmRh5cclwVL4F+7tWm0qiOtP+y9C9METs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6411
Received-SPF: pass client-ip=40.107.75.127;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
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

On Feb 13 13:03, Alex Bennée wrote:
> When icount is enabled and we recompile an MMIO access we end up
> double counting the instruction execution. To avoid this we introduce
> the CF_MEMI cflag which only allows memory instrumentation for the
> next TB (which won't yet have been counted). As this is part of the
> hashed compile flags we will only execute the generated TB while
> coming out of a cpu_io_recompile.
> 
> While we are at it delete the old TODO. We might as well keep the
> translation handy as it's likely you will repeatedly hit it on each
> MMIO access.
> 
> Reported-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20210210221053.18050-21-alex.bennee@linaro.org>

This resolves the issue for me - I'm now seeing one instruction callback
and one memory callback for both MMIO load and store instructions, as
expected.

Tested-by: Aaron Lindsay <aaron@os.amperecomputing.com>

Thanks!

-Aaron

> 
> ---
> v3
>   - s/CF_NOINSTR/CF_MEMI_ONY/
>   - Limit instrumentation at API call sites instead of skipping altogether
>   - clean-up commit log message
> ---
>  include/exec/exec-all.h   |  6 +++---
>  include/exec/plugin-gen.h |  4 ++--
>  include/qemu/plugin.h     |  4 ++++
>  accel/tcg/plugin-gen.c    |  3 ++-
>  accel/tcg/translate-all.c | 18 +++++++++---------
>  accel/tcg/translator.c    |  5 ++++-
>  plugins/api.c             | 36 +++++++++++++++++++++++++-----------
>  7 files changed, 49 insertions(+), 27 deletions(-)
> 
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index e08179de34..77a2dc044d 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -454,14 +454,14 @@ struct TranslationBlock {
>      uint32_t cflags;    /* compile flags */
>  #define CF_COUNT_MASK  0x00007fff
>  #define CF_LAST_IO     0x00008000 /* Last insn may be an IO access.  */
> +#define CF_MEMI_ONLY   0x00010000 /* Only instrument memory ops */
>  #define CF_USE_ICOUNT  0x00020000
>  #define CF_INVALID     0x00040000 /* TB is stale. Set with @jmp_lock held */
>  #define CF_PARALLEL    0x00080000 /* Generate code for a parallel context */
>  #define CF_CLUSTER_MASK 0xff000000 /* Top 8 bits are cluster ID */
>  #define CF_CLUSTER_SHIFT 24
> -/* cflags' mask for hashing/comparison */
> -#define CF_HASH_MASK   \
> -    (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALLEL | CF_CLUSTER_MASK)
> +/* cflags' mask for hashing/comparison, basically ignore CF_INVALID */
> +#define CF_HASH_MASK   (~CF_INVALID)
>  
>      /* Per-vCPU dynamic tracing state used to generate this TB */
>      uint32_t trace_vcpu_dstate;
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
> index 841deed79c..c5a79a89f0 100644
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
> +    bool mem_only;
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
> +    bool mem_only;
>      GArray *cbs[PLUGIN_N_CB_SUBTYPES];
>  };
>  
> diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
> index 8a1bb801e0..c3dc3effe7 100644
> --- a/accel/tcg/plugin-gen.c
> +++ b/accel/tcg/plugin-gen.c
> @@ -842,7 +842,7 @@ static void plugin_gen_inject(const struct qemu_plugin_tb *plugin_tb)
>      pr_ops();
>  }
>  
> -bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
> +bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool mem_only)
>  {
>      struct qemu_plugin_tb *ptb = tcg_ctx->plugin_tb;
>      bool ret = false;
> @@ -855,6 +855,7 @@ bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
>          ptb->vaddr2 = -1;
>          get_page_addr_code_hostp(cpu->env_ptr, tb->pc, &ptb->haddr1);
>          ptb->haddr2 = NULL;
> +        ptb->mem_only = mem_only;
>  
>          plugin_gen_empty_callback(PLUGIN_GEN_FROM_TB);
>      }
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 0666f9ef14..fdf88dc1c3 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -2399,7 +2399,8 @@ void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
>  }
>  
>  #ifndef CONFIG_USER_ONLY
> -/* in deterministic execution mode, instructions doing device I/Os
> +/*
> + * In deterministic execution mode, instructions doing device I/Os
>   * must be at the end of the TB.
>   *
>   * Called by softmmu_template.h, with iothread mutex not held.
> @@ -2430,19 +2431,18 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
>          n = 2;
>      }
>  
> -    /* Generate a new TB executing the I/O insn.  */
> -    cpu->cflags_next_tb = curr_cflags() | CF_LAST_IO | n;
> +    /*
> +     * Exit the loop and potentially generate a new TB executing the
> +     * just the I/O insns. We also limit instrumentation to memory
> +     * operations only (which execute after completion) so we don't
> +     * double instrument the instruction.
> +     */
> +    cpu->cflags_next_tb = curr_cflags() | CF_MEMI_ONLY | CF_LAST_IO | n;
>  
>      qemu_log_mask_and_addr(CPU_LOG_EXEC, tb->pc,
>                             "cpu_io_recompile: rewound execution of TB to "
>                             TARGET_FMT_lx "\n", tb->pc);
>  
> -    /* TODO: If env->pc != tb->pc (i.e. the faulting instruction was not
> -     * the first in the TB) then we end up generating a whole new TB and
> -     *  repeating the fault, which is horribly inefficient.
> -     *  Better would be to execute just this insn uncached, or generate a
> -     *  second new TB.
> -     */
>      cpu_loop_exit_noexc(cpu);
>  }
>  
> diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
> index a49a794065..2dfc27102f 100644
> --- a/accel/tcg/translator.c
> +++ b/accel/tcg/translator.c
> @@ -58,7 +58,8 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
>      ops->tb_start(db, cpu);
>      tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
>  
> -    plugin_enabled = plugin_gen_tb_start(cpu, tb);
> +    plugin_enabled = plugin_gen_tb_start(cpu, tb,
> +                                         tb_cflags(db->tb) & CF_MEMI_ONLY);
>  
>      while (true) {
>          db->num_insns++;
> @@ -100,6 +101,8 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
>              gen_io_start();
>              ops->translate_insn(db, cpu);
>          } else {
> +            /* we should only see CF_MEMI_ONLY for io_recompile */
> +            tcg_debug_assert(!(tb_cflags(db->tb) & CF_MEMI_ONLY));
>              ops->translate_insn(db, cpu);
>          }
>  
> diff --git a/plugins/api.c b/plugins/api.c
> index 5dc8e6f934..0b04380d57 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -84,15 +84,19 @@ void qemu_plugin_register_vcpu_tb_exec_cb(struct qemu_plugin_tb *tb,
>                                            enum qemu_plugin_cb_flags flags,
>                                            void *udata)
>  {
> -    plugin_register_dyn_cb__udata(&tb->cbs[PLUGIN_CB_REGULAR],
> -                                  cb, flags, udata);
> +    if (!tb->mem_only) {
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
> +    if (!tb->mem_only) {
> +        plugin_register_inline_op(&tb->cbs[PLUGIN_CB_INLINE], 0, op, ptr, imm);
> +    }
>  }
>  
>  void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
> @@ -100,20 +104,27 @@ void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
>                                              enum qemu_plugin_cb_flags flags,
>                                              void *udata)
>  {
> -    plugin_register_dyn_cb__udata(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_REGULAR],
> -        cb, flags, udata);
> +    if (!insn->mem_only) {
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
> +    if (!insn->mem_only) {
> +        plugin_register_inline_op(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_INLINE],
> +                                  0, op, ptr, imm);
> +    }
>  }
>  
>  
> -
> +/*
> + * We always plant memory instrumentation because they don't finalise until
> + * after the operation has complete.
> + */
>  void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
>                                        qemu_plugin_vcpu_mem_cb_t cb,
>                                        enum qemu_plugin_cb_flags flags,
> @@ -121,7 +132,7 @@ void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
>                                        void *udata)
>  {
>      plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULAR],
> -                                cb, flags, rw, udata);
> +                                    cb, flags, rw, udata);
>  }
>  
>  void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *insn,
> @@ -130,7 +141,7 @@ void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *insn,
>                                            uint64_t imm)
>  {
>      plugin_register_inline_op(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_INLINE],
> -        rw, op, ptr, imm);
> +                              rw, op, ptr, imm);
>  }
>  
>  void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
> @@ -181,10 +192,13 @@ uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb)
>  struct qemu_plugin_insn *
>  qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx)
>  {
> +    struct qemu_plugin_insn *insn;
>      if (unlikely(idx >= tb->n)) {
>          return NULL;
>      }
> -    return g_ptr_array_index(tb->insns, idx);
> +    insn = g_ptr_array_index(tb->insns, idx);
> +    insn->mem_only = tb->mem_only;
> +    return insn;
>  }
>  
>  /*
> -- 
> 2.20.1
> 

