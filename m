Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C5D3197A4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 01:56:15 +0100 (CET)
Received: from localhost ([::1]:45124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAMko-00068h-DQ
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 19:56:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lAMj8-0005gR-NE
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:54:30 -0500
Received: from mail-dm6nam10on2102.outbound.protection.outlook.com
 ([40.107.93.102]:47840 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lAMj6-0005gM-Nq
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:54:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCBMAKyGouKs5Q7sLVqRE+MVIOWAwYE8jX+Bck+OJQQSnMTKfMoHrWhZ35ii5Ha+VNOnzOGj7JIzOj/C10MITQdf7SHtOs1jV1Ck8tfS9pywsCsTd1aoALOWCRCayhbPn3yrwnerWK5/aBVdOCERJT3anfRrnTlyGagNhqfN0AU1OivADa2xKmieFI8IntsN2q+6aD9RNBfONpPeF3SwBcOteuyrHXGGDnCLaaWRRIdfyJl3kjg9bUhKBr2/gStc6dELIihJDB9WMr5SH/f8IOsLkvLZBWNG1sK2ZRXn0uloPzJtAjRNLacHZR1chWbLJpJeEKIXCO+BuNdTl0v6Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yH8XfKCSiZB3CAhqkxP/5rJQ1uKjCMJPwOu0sPjv6o=;
 b=X14V9DrFJ06b67GI72BP1xyQSlCwh9fWTxgkkjx8q2MMXq5h1th53RycWSaPEOBaE7PhfPankIDVpwYkzuW6ZfA4rNvF4P4M1dMgPt0ByoqwrAj7+2mTNuqKYnDCPRZ54Xdqm5fSFmo4bhHbJMjne5x+OFsksdwxH7wqJg120UlJiDLAdRyPHCiXCTiEn+XW7X7fKI0SK754lJuzpjcff90mFgeyq4bpyD1MzkPdbaglFGrISe4RGUHr+VLLUDqwCtahdSzTKsCBHd4yOEi/opefcNiUNMtkzcQ9dKbw79GmCV8RzXk22m3RK9JGRJ0TNoE2psqnXSUgLXxhi7C7TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yH8XfKCSiZB3CAhqkxP/5rJQ1uKjCMJPwOu0sPjv6o=;
 b=Yg9fBewNFwhBs2ULMCM65X4z/X3j4vYAMDFXE26N7wFvccqjpHecLwRSGjmi/Kd2MPbPNOx7el35adQfXxukevgukd5eKYtSailSo7lddQWF6ql/hYEBD9TzCmhPA2FIhGyCjfM3PnZ1r1ydB6UTRmI9T9onTySi3r7KpBIebRw=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN2PR01MB2064.prod.exchangelabs.com (2603:10b6:804:9::10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25; Fri, 12 Feb 2021 00:54:24 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5%6]) with mapi id 15.20.3825.025; Fri, 12 Feb 2021
 00:54:24 +0000
Date: Thu, 11 Feb 2021 19:53:56 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH  v2 20/21] accel/tcg: allow plugin instrumentation to be
 disable via cflags
Message-ID: <YCXRpCiekU+TgoAX@strawberry.localdomain>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210210221053.18050-21-alex.bennee@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BLAPR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:208:32e::31) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BLAPR03CA0146.namprd03.prod.outlook.com (2603:10b6:208:32e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend
 Transport; Fri, 12 Feb 2021 00:54:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e34d510-aa44-4106-b869-08d8cef0bd6b
X-MS-TrafficTypeDiagnostic: SN2PR01MB2064:
X-Microsoft-Antispam-PRVS: <SN2PR01MB2064252C31EB8630AD74C9B68A8B9@SN2PR01MB2064.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8zh+F4klxFCGj+CXBOm4r7oPx3bGv+UBomPw1sEE8ACGiPFDiGh7OLwHx3P/F9DkFNwR8NGXxw/S0HFPu37sOSD9dqTZdZbUm7iZU8KmioD60W4nh5I6xIf4untHt5Rojm7aww4eAU10oHYZsGGILdbwT0MuYTsHZRXX93JtNokCzqNry9iuJrldvB2Dt/OOvGmJlhqfsQqOsUTpxPAJzb4ZMwwFfdZkQ+gwaK4SZdfctjC0ovc/OrhTl4AFNehbOS7gmF7GZ0vZOYw3xKztCHMyEUEj4FILqSAF5EG8V7OpKCbE0ad7rsL5ajkU6LPK2MIwmcyNkboY4v1azf4nIqgndyOSw7xl7t+VIfYUSd7Zbr5qOCxx8s8wlrz1cWyJSjZ/xxqN8NjYUonFgoyvlw82scoz8odopxHj7/xpB9IouaZ4yn5jevHaLvji8jccxYpt7gf8mEA/ksnX4aY9yWt2vrK/nOWkkyyRYAdGQC6xG66aiHKOFHlbSx1eRDyvAii9k2pCwr1+wMOXimTDwVYYwZW3ZR8hpprjzt9zBt/h4JmIvMQqhYpxeHOoaAmsPqQ27Z3P1l3g6lBEhHUjpJFn6MXH53vK6ITXf+ZlKP8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(366004)(39850400004)(54906003)(4326008)(34580700001)(52116002)(7696005)(478600001)(316002)(8676002)(66574015)(66476007)(9686003)(5660300002)(6916009)(8936002)(26005)(86362001)(66946007)(186003)(16526019)(83380400001)(66556008)(6506007)(6666004)(956004)(2906002)(55016002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?/5MVlBcbXa6lDriRjq3EGSTWdPYKKgxoUZIBsMiG67EAYBSRyERwO2c2CP?=
 =?iso-8859-1?Q?kwBZgzzqE7utcik76yXSiCdh5aAj3+fwTHF0dFLf4KwaMSQQJ80+VddTzE?=
 =?iso-8859-1?Q?Zj5zb3VfuaYcQsaelQ+T6HufU/QDN9YCv+A6jqFYzLVjFB1ZiiF/OJ/Z2H?=
 =?iso-8859-1?Q?5Ev1uvCGpzZELWAA+Vv0laxUIw3trgUWwsSzEWrenUHoiBTIAoMU4TcWAb?=
 =?iso-8859-1?Q?dEFP9ClstNCZiMGbmZVig/OvWxH5u2mhSPc8BdmW8Uxl7VAtgU4zfr35RU?=
 =?iso-8859-1?Q?KOACOZzrKXZXX8g+BcBkoYOwaCu2n4x3YiWbR8aIEayZCj5OdvE0qbBhzF?=
 =?iso-8859-1?Q?O7fSd8iS/1A8AGN7dXo/8J0ofM1/HTg5rQBmOxCGmaxijaikhJu3Kex45O?=
 =?iso-8859-1?Q?RtiKklA/3jykuCy5hfhFdeKa/Ml2axWllVDmCflChY910WS3NZtJlfLf9/?=
 =?iso-8859-1?Q?99XDwVzgGZ14IKhlAuQBTl6W2hxahLDIobKBi1tX5L0Ku/REeV6OBhXkhR?=
 =?iso-8859-1?Q?kBlboIkjFKmzQ1K5uJC/rS+hCYMaXEzno4ayiCmEXv9ljAew+rgnLnw0KW?=
 =?iso-8859-1?Q?4sHK4dV3pcqoSARQtZ+gIFh+iUZ00O8Z14LgbDejpmA/ZXd2AzTxtGTGmB?=
 =?iso-8859-1?Q?3y+HGIPS/2PKbSlK9yITDe4v6EI5uk56TJUAkeM52a7z/CLawO8X5R1CG3?=
 =?iso-8859-1?Q?3UAAf091pkoiQuQK1SaSE0GENX89SQ6YZZHI8EwDJtXXv8VyW06hKq331X?=
 =?iso-8859-1?Q?4Zroqr6vrZn+wuhXCGu6EbHJKrgRr6XOiZCqvnMTcv2BBEqphEvNBunNuR?=
 =?iso-8859-1?Q?8kglats+u6YUs+bUwiSboHT5I16eoG9PhsxMpU3sgAUEObYcVu1PGqMdkJ?=
 =?iso-8859-1?Q?l/gYJy+waxHY7C0o/Riq1pITt6TCgZynbZ4GgNdUZc4VnBI13UQo2MQ2hJ?=
 =?iso-8859-1?Q?ug+D22roNN+XN460HpaTWIOhnhncQMg37XpGInaXXooQFpF2xfgsrgKU4z?=
 =?iso-8859-1?Q?+qLYOQCkD8ZvlRnDux0/DBQUR5ZifnZpkVzFm2ZOXIBcSAsfl0qgQnED4G?=
 =?iso-8859-1?Q?qdIOmXMeDfZz2M/PfFWLeWjikYF6phzUnSOUh/0kzlxQHh8Xfo1o5BSbV9?=
 =?iso-8859-1?Q?BuoQkfLENmTYVY/P8x2O0HX261mnr5ekpoxdbfwI2/bezWq1q3/EGhy56R?=
 =?iso-8859-1?Q?5xVB+ufMwoRxpEHxKLplmzrujNTxaoS8gW9z7roUnlLwCzSMkWU+J56Gr3?=
 =?iso-8859-1?Q?r7Av8fVwIgqEHU1Hr74Qr+f6Qv3gmn1sYxeNZN8LsPKixihhSale4RI3X8?=
 =?iso-8859-1?Q?0v7yPLCk2W+JK3R0I3OdxPrufoc3vsET21PpLRvVe+xxX5C9YA+1NFQJoc?=
 =?iso-8859-1?Q?s9SbozFxcd?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e34d510-aa44-4106-b869-08d8cef0bd6b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 00:54:24.0700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQoorrDHpZDZXUWWSjThjs8ZBYzenUgdo63oM5O0Td7D49BenxGjsaeIJsY7PwuHgB28ZYfA7G+RhZR67seRGoVxF3ihWom6Q6HCE7olps8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR01MB2064
Received-SPF: pass client-ip=40.107.93.102;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

On Feb 10 22:10, Alex Bennée wrote:
> When icount is enabled and we recompile an MMIO access we end up
> double counting the instruction execution. To avoid this we introduce
> the CF_NOINSTR cflag which disables instrumentation for the next TB.
> As this is part of the hashed compile flags we will only execute the
> generated TB while coming out of a cpu_io_recompile.

Unfortunately this patch works a little too well!

With this change, the memory access callbacks registered via
`qemu_plugin_register_vcpu_mem_cb()` are never called for the
re-translated instruction making the IO access, since we've disabled all
instrumentation.

Is it possible to selectively disable only instruction callbacks using
this mechanism, while still allowing others that would not yet have been
called for the re-translated instruction?

-Aaron

> While we are at it delete the old TODO. We might as well keep the
> translation handy as it's likely you will repeatedly hit it on each
> MMIO access.
> 
> Reported-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20210209182749.31323-12-alex.bennee@linaro.org>
> 
> ---
> v2
>   - squashed CH_HASHMASK to ~CF_INVALID
> ---
>  include/exec/exec-all.h   |  6 +++---
>  accel/tcg/translate-all.c | 17 ++++++++---------
>  accel/tcg/translator.c    |  2 +-
>  3 files changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index e08179de34..299282cc59 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -454,14 +454,14 @@ struct TranslationBlock {
>      uint32_t cflags;    /* compile flags */
>  #define CF_COUNT_MASK  0x00007fff
>  #define CF_LAST_IO     0x00008000 /* Last insn may be an IO access.  */
> +#define CF_NOINSTR     0x00010000 /* Disable instrumentation of TB */
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
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 0666f9ef14..32a3d8fe24 100644
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
> @@ -2430,19 +2431,17 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
>          n = 2;
>      }
>  
> -    /* Generate a new TB executing the I/O insn.  */
> -    cpu->cflags_next_tb = curr_cflags() | CF_LAST_IO | n;
> +    /*
> +     * Exit the loop and potentially generate a new TB executing the
> +     * just the I/O insns. We also disable instrumentation so we don't
> +     * double count the instruction.
> +     */
> +    cpu->cflags_next_tb = curr_cflags() | CF_NOINSTR | CF_LAST_IO | n;
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
> index a49a794065..14d1ea795d 100644
> --- a/accel/tcg/translator.c
> +++ b/accel/tcg/translator.c
> @@ -58,7 +58,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
>      ops->tb_start(db, cpu);
>      tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
>  
> -    plugin_enabled = plugin_gen_tb_start(cpu, tb);
> +    plugin_enabled = !(tb_cflags(db->tb) & CF_NOINSTR) && plugin_gen_tb_start(cpu, tb);
>  
>      while (true) {
>          db->num_insns++;
> -- 
> 2.20.1
> 

