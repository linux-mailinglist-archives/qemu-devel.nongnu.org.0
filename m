Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBC18E7EA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 11:16:16 +0200 (CEST)
Received: from localhost ([::1]:39870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyBrj-0004cc-Ud
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 05:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43890)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1hyBqR-0003e5-Nq
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 05:14:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hyBqQ-00087f-6o
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 05:14:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59890)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hyBqP-00087I-UJ
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 05:14:54 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 419D061B1A;
 Thu, 15 Aug 2019 09:14:53 +0000 (UTC)
Received: from work-vm (ovpn-117-19.ams2.redhat.com [10.36.117.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDF5C83877;
 Thu, 15 Aug 2019 09:14:51 +0000 (UTC)
Date: Thu, 15 Aug 2019 10:14:49 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: vandersonmr <vandersonmr2@gmail.com>
Message-ID: <20190815091449.GC2841@work-vm>
References: <20190815021857.19526-1-vandersonmr2@gmail.com>
 <20190815021857.19526-10-vandersonmr2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815021857.19526-10-vandersonmr2@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 15 Aug 2019 09:14:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 09/10] monitor: adding new info cfg
 command
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* vandersonmr (vandersonmr2@gmail.com) wrote:
> Adding "info cfg id depth" commands to HMP.
> This command allow the exploration a TB
> neighbors by dumping [and opening] a .dot
> file with the TB CFG neighbors colorized
> by their hotness.
> 
> The goal of this command is to allow the dynamic exploration
> of TCG behavior and code quality. Therefore, for now, a
> corresponding QMP command is not worthwhile.
> 
> Signed-off-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
> ---
>  accel/tcg/tb-stats.c    | 177 ++++++++++++++++++++++++++++++++++++++++
>  hmp-commands-info.hx    |   7 ++
>  include/exec/tb-stats.h |   1 +
>  monitor/misc.c          |  22 +++++
>  4 files changed, 207 insertions(+)
> 
> diff --git a/accel/tcg/tb-stats.c b/accel/tcg/tb-stats.c
> index f5e519bdb7..5fda2bed9e 100644
> --- a/accel/tcg/tb-stats.c
> +++ b/accel/tcg/tb-stats.c
> @@ -637,6 +637,182 @@ void dump_tb_info(int id, int log_mask, bool use_monitor)
>      /* tbdi free'd by do_dump_tb_info_safe */
>  }
>  
> +/* TB CFG xdot/dot dump implementation */
> +#define MAX_CFG_NUM_NODES 1000
> +static int cfg_tb_id;
> +static GHashTable *cfg_nodes;
> +static uint64_t root_count;
> +
> +static void fputs_jump(TBStatistics *from, TBStatistics *to, FILE *dot)
> +{
> +    if (!from || !to) {
> +        return;
> +    }
> +
> +    int *from_id = (int *) g_hash_table_lookup(cfg_nodes, from);
> +    int *to_id   = (int *) g_hash_table_lookup(cfg_nodes, to);
> +
> +    if (!from_id || !to_id) {
> +        return;
> +    }
> +
> +    GString *line = g_string_new(NULL);
> +
> +    g_string_printf(line, "   node_%d -> node_%d;\n", *from_id, *to_id);
> +
> +    fputs(line->str, dot);
> +
> +    g_string_free(line, true);
> +}
> +
> +static void fputs_tbstats(TBStatistics *tbs, FILE *dot, int log_flags)
> +{
> +    if (!tbs) {
> +        return;
> +    }
> +
> +    GString *line = g_string_new(NULL);;
> +
> +    uint32_t color = 0xFF666;
> +    uint64_t count = tbs->executions.normal;
> +    if (count > 1.6 * root_count) {
> +        color = 0xFF000;
> +    } else if (count > 1.2 * root_count) {
> +        color = 0xFF333;
> +    } else if (count < 0.4 * root_count) {
> +        color = 0xFFCCC;
> +    } else if (count < 0.8 * root_count) {
> +        color = 0xFF999;
> +    }
> +
> +    GString *code_s = get_code_string(tbs, log_flags);
> +
> +    for (int i = 0; i < code_s->len; i++) {
> +        if (code_s->str[i] == '\n') {
> +            code_s->str[i] = ' ';
> +            code_s = g_string_insert(code_s, i, "\\l");
> +            i += 2;
> +        }
> +    }
> +
> +    g_string_printf(line,
> +            "   node_%d [fillcolor=\"#%xFF0000\" shape=\"record\" "
> +            "label=\"TB %d\\l"
> +            "-------------\\l"
> +            "PC:\t0x"TARGET_FMT_lx"\\l"
> +            "exec count:\t%lu\\l"
> +            "\\l %s\"];\n",
> +            cfg_tb_id, color, cfg_tb_id, tbs->pc,
> +            tbs->executions.normal, code_s->str);
> +
> +    fputs(line->str, dot);
> +
> +    int *id = g_new(int, 1);
> +    *id = cfg_tb_id;
> +    g_hash_table_insert(cfg_nodes, tbs, id);
> +
> +    cfg_tb_id++;
> +
> +    g_string_free(line, true);
> +    g_string_free(code_s, true);
> +}
> +
> +static void fputs_preorder_walk(TBStatistics *tbs, int depth, FILE *dot, int log_flags)
> +{
> +    if (tbs && depth > 0
> +            && cfg_tb_id < MAX_CFG_NUM_NODES
> +            && !g_hash_table_contains(cfg_nodes, tbs)) {
> +
> +        fputs_tbstats(tbs, dot, log_flags);
> +
> +        if (tbs->tb) {
> +            TranslationBlock *left_tb  = NULL;
> +            TranslationBlock *right_tb = NULL;
> +            if (tbs->tb->jmp_dest[0]) {
> +                left_tb = (TranslationBlock *) atomic_read(tbs->tb->jmp_dest);
> +            }
> +            if (tbs->tb->jmp_dest[1]) {
> +                right_tb = (TranslationBlock *) atomic_read(tbs->tb->jmp_dest + 1);
> +            }
> +
> +            if (left_tb) {
> +                fputs_preorder_walk(left_tb->tb_stats, depth - 1, dot, log_flags);
> +                fputs_jump(tbs, left_tb->tb_stats, dot);
> +            }
> +            if (right_tb) {
> +                fputs_preorder_walk(right_tb->tb_stats, depth - 1, dot, log_flags);
> +                fputs_jump(tbs, right_tb->tb_stats, dot);
> +            }
> +        }
> +    }
> +}
> +
> +struct PreorderInfo {
> +    TBStatistics *tbs;
> +    int depth;
> +    int log_flags;
> +};
> +
> +static void fputs_preorder_walk_safe(CPUState *cpu, run_on_cpu_data icmd)
> +{
> +    struct PreorderInfo *info = icmd.host_ptr;
> +
> +    GString *file_name = g_string_new(NULL);;
> +    g_string_printf(file_name, "/tmp/qemu-cfg-tb-%d-%d.dot", id, info->depth);

It's probably better to pass the filename in?

> +    FILE *dot = fopen(file_name->str, "w+");
> +
> +    fputs(
> +            "digraph G {\n"
> +            "   mclimit=1.5;\n"
> +            "   rankdir=TD; ordering=out;\n"
> +            "   graph[fontsize=10 fontname=\"Verdana\"];\n"
> +            "   color=\"#efefef\";\n"
> +            "   node[shape=box style=filled fontsize=8 fontname=\"Verdana\" fillcolor=\"#efefef\"];\n"
> +            "   edge[fontsize=8 fontname=\"Verdana\"];\n"

Does that display OK on all problems?

> +         , dot);
> +
> +    cfg_nodes = g_hash_table_new(NULL, NULL);
> +    fputs_preorder_walk(info->tbs, info->depth, dot, info->log_flags);
> +    g_hash_table_destroy(cfg_nodes);
> +
> +    fputs("}\n\0", dot);
> +    fclose(dot);
> +
> +#ifdef __linux__
> +    pid_t pid = fork();
> +    if (pid == 0) {
> +        char *args[] = {(char *) "xdot", file_name->str, NULL};
> +        execvp(args[0], args);
> +    }
> +#endif

That's a bit odd;  just dump it to the file; people can build scripts
around it.

> +
> +    qemu_log("CFG dumped: %s\n", file_name->str);
> +
> +    g_string_free(file_name, true);
> +    g_free(info);
> +}
> +
> +void dump_tb_cfg(int id, int depth, int log_flags)
> +{
> +    cfg_tb_id = 1;
> +    root_count = 0;
> +
> +    /* do a pre-order walk in the CFG with a limited depth */
> +    TBStatistics *root = get_tbstats_by_id(id);
> +    if (root) {
> +        root_count = root->executions.normal;
> +    }
> +
> +    struct PreorderInfo *info = g_new(struct PreorderInfo, 1);
> +    info->tbs = root;
> +    info->depth = depth + 1;
> +    info->log_flags = log_flags;
> +    async_safe_run_on_cpu(first_cpu, fputs_preorder_walk_safe,
> +            RUN_ON_CPU_HOST_PTR(info));
> +}
> +
> +/* TBStatistic collection controls */
> +
>  
>  void enable_collect_tb_stats(void)
>  {
> @@ -686,3 +862,4 @@ uint32_t get_default_tbstats_flag(void)
>  {
>      return default_tbstats_flag;
>  }
> +
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 6691303c59..afbc80d3b1 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -305,6 +305,13 @@ ETEXI
>                        "a dump flag can be used to set dump code level: out_asm in_asm op",
>          .cmd        = hmp_info_tb,
>      },
> +    {
> +        .name       = "cfg",
> +        .args_type  = "id:i,depth:i?,flags:s?",
> +        .params     = "id [depth flags]",
> +        .help       = "plot CFG around TB with the given id",
> +        .cmd        = hmp_info_cfg,
> +    },
>      {
>          .name       = "coverset",
>          .args_type  = "coverage:i?",
> diff --git a/include/exec/tb-stats.h b/include/exec/tb-stats.h
> index dc2a8155a0..d67f1966ec 100644
> --- a/include/exec/tb-stats.h
> +++ b/include/exec/tb-stats.h
> @@ -127,6 +127,7 @@ void dump_tbs_info(int count, int sort_by, bool use_monitor);
>   */
>  void dump_tb_info(int id, int log_mask, bool use_monitor);
>  
> +void dump_tb_cfg(int id, int depth, int log_flags);
>  
>  /* TBStatistic collection controls */
>  void enable_collect_tb_stats(void);
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 4af70dba92..da886e805c 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -556,6 +556,28 @@ static void hmp_info_tb(Monitor *mon, const QDict *qdict)
>      dump_tb_info(id, mask, true);
>  }
>  
> +static void hmp_info_cfg(Monitor *mon, const QDict *qdict)
> +{
> +    const int id = qdict_get_int(qdict, "id");
> +    const int depth = qdict_get_try_int(qdict, "depth", 3);
> +    const char *flags = qdict_get_try_str(qdict, "flags");
> +    int mask;
> +
> +    if (!tcg_enabled()) {
> +        error_report("TB information is only available with accel=tcg");
> +        return;
> +    }
> +
> +    mask = flags ? qemu_str_to_log_mask(flags) : CPU_LOG_TB_IN_ASM;
> +
> +    if (!mask) {
> +        error_report("Unable to parse log flags, see 'help log'");
> +        return;
> +    }
> +
> +    dump_tb_cfg(id, depth, mask);
> +}
> +
>  static void hmp_info_coverset(Monitor *mon, const QDict *qdict)
>  {
>      int coverage;
> -- 
> 2.22.0
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

