Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3231039498
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 20:47:36 +0200 (CEST)
Received: from localhost ([::1]:50798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZJtn-0000DB-2n
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 14:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59350)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hZIZB-0000oL-J1
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 13:22:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hZIZ4-00020N-K3
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 13:22:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57836)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>)
 id 1hZIYi-0001Q9-HE; Fri, 07 Jun 2019 13:21:46 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9CBC32E97DE;
 Fri,  7 Jun 2019 17:21:40 +0000 (UTC)
Received: from work-vm (ovpn-116-24.ams2.redhat.com [10.36.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA910611AC;
 Fri,  7 Jun 2019 17:21:37 +0000 (UTC)
Date: Fri, 7 Jun 2019 18:21:35 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Message-ID: <20190607172133.GT2631@work-vm>
References: <20190607135430.22149-1-kwolf@redhat.com>
 <20190607135430.22149-10-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190607135430.22149-10-kwolf@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Fri, 07 Jun 2019 17:21:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC PATCH 09/10] monitor: Split out monitor/hmp.c
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Kevin Wolf (kwolf@redhat.com) wrote:
> Move HMP infrastructure from monitor/misc.c to monitor/hmp.c. This is
> code that can be shared for all targets, so compile it only once.
> 
> The amount of function and particularly extern variables in
> monitor_int.h is probably a bit larger than it needs to be, but this way
> no non-trivial code modifications are needed. The interfaces between HMP
> and the monitor core can be cleaned up later.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

(The target_long change was well hidden!)

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  include/monitor/monitor.h |    1 +
>  monitor/monitor_int.h     |   31 +
>  monitor/hmp.c             | 1351 +++++++++++++++++++++++++++++++++++++
>  monitor/misc.c            | 1338 +-----------------------------------
>  monitor/Makefile.objs     |    2 +-
>  5 files changed, 1390 insertions(+), 1333 deletions(-)
>  create mode 100644 monitor/hmp.c
> 
> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
> index 7bbab05320..8547529e49 100644
> --- a/include/monitor/monitor.h
> +++ b/include/monitor/monitor.h
> @@ -22,6 +22,7 @@ bool monitor_cur_is_qmp(void);
>  void monitor_init_globals(void);
>  void monitor_init(Chardev *chr, int flags);
>  void monitor_init_qmp(Chardev *chr, int flags);
> +void monitor_init_hmp(Chardev *chr, int flags);
>  void monitor_cleanup(void);
>  
>  int monitor_suspend(Monitor *mon);
> diff --git a/monitor/monitor_int.h b/monitor/monitor_int.h
> index 487618392f..8c5d95f942 100644
> --- a/monitor/monitor_int.h
> +++ b/monitor/monitor_int.h
> @@ -27,6 +27,7 @@
>  
>  #include "qemu-common.h"
>  #include "monitor/monitor.h"
> +#include "qemu/cutils.h"
>  
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/json-parser.h"
> @@ -153,6 +154,29 @@ static inline bool monitor_is_qmp(const Monitor *mon)
>      return (mon->flags & MONITOR_USE_CONTROL);
>  }
>  
> +/**
> + * Is @name in the '|' separated list of names @list?
> + */
> +static inline int compare_cmd(const char *name, const char *list)
> +{
> +    const char *p, *pstart;
> +    int len;
> +    len = strlen(name);
> +    p = list;
> +    for(;;) {
> +        pstart = p;
> +        p = qemu_strchrnul(p, '|');
> +        if ((p - pstart) == len && !memcmp(pstart, name, len)) {
> +            return 1;
> +        }
> +        if (*p == '\0') {
> +            break;
> +        }
> +        p++;
> +    }
> +    return 0;
> +}
> +
>  typedef QTAILQ_HEAD(MonitorList, Monitor) MonitorList;
>  extern IOThread *mon_iothread;
>  extern QEMUBH *qmp_dispatcher_bh;
> @@ -161,6 +185,8 @@ extern QemuMutex monitor_lock;
>  extern MonitorList mon_list;
>  extern int mon_refcount;
>  
> +extern mon_cmd_t mon_cmds[];
> +
>  int monitor_puts(Monitor *mon, const char *str);
>  void monitor_data_init(Monitor *mon, int flags, bool skip_flush,
>                         bool use_io_thread);
> @@ -172,4 +198,9 @@ void qmp_send_response(MonitorQMP *mon, const QDict *rsp);
>  void monitor_data_destroy_qmp(MonitorQMP *mon);
>  void monitor_qmp_bh_dispatcher(void *data);
>  
> +void monitor_data_init_hmp(MonitorHMP *mon, int flags, bool skip_flush);
> +int get_monitor_def(int64_t *pval, const char *name);
> +void help_cmd(Monitor *mon, const char *name);
> +void handle_hmp_command(MonitorHMP *mon, const char *cmdline);
> +
>  #endif
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> new file mode 100644
> index 0000000000..2bc464a7fc
> --- /dev/null
> +++ b/monitor/hmp.c
> @@ -0,0 +1,1351 @@
> +/*
> + * QEMU monitor
> + *
> + * Copyright (c) 2003-2004 Fabrice Bellard
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "monitor_int.h"
> +
> +#include "qapi/error.h"
> +#include "qapi/qmp/qnum.h"
> +
> +#include "qemu/config-file.h"
> +#include "qemu/log.h"
> +#include "qemu/option.h"
> +#include "qemu/units.h"
> +#include "sysemu/block-backend.h"
> +#include "sysemu/sysemu.h"
> +
> +#include "trace-root.h"
> +
> +static int get_str(char *buf, int buf_size, const char **pp)
> +{
> +    const char *p;
> +    char *q;
> +    int c;
> +
> +    q = buf;
> +    p = *pp;
> +    while (qemu_isspace(*p)) {
> +        p++;
> +    }
> +    if (*p == '\0') {
> +    fail:
> +        *q = '\0';
> +        *pp = p;
> +        return -1;
> +    }
> +    if (*p == '\"') {
> +        p++;
> +        while (*p != '\0' && *p != '\"') {
> +            if (*p == '\\') {
> +                p++;
> +                c = *p++;
> +                switch (c) {
> +                case 'n':
> +                    c = '\n';
> +                    break;
> +                case 'r':
> +                    c = '\r';
> +                    break;
> +                case '\\':
> +                case '\'':
> +                case '\"':
> +                    break;
> +                default:
> +                    printf("unsupported escape code: '\\%c'\n", c);
> +                    goto fail;
> +                }
> +                if ((q - buf) < buf_size - 1) {
> +                    *q++ = c;
> +                }
> +            } else {
> +                if ((q - buf) < buf_size - 1) {
> +                    *q++ = *p;
> +                }
> +                p++;
> +            }
> +        }
> +        if (*p != '\"') {
> +            printf("unterminated string\n");
> +            goto fail;
> +        }
> +        p++;
> +    } else {
> +        while (*p != '\0' && !qemu_isspace(*p)) {
> +            if ((q - buf) < buf_size - 1) {
> +                *q++ = *p;
> +            }
> +            p++;
> +        }
> +    }
> +    *q = '\0';
> +    *pp = p;
> +    return 0;
> +}
> +
> +#define MAX_ARGS 16
> +
> +static void free_cmdline_args(char **args, int nb_args)
> +{
> +    int i;
> +
> +    assert(nb_args <= MAX_ARGS);
> +
> +    for (i = 0; i < nb_args; i++) {
> +        g_free(args[i]);
> +    }
> +
> +}
> +
> +/*
> + * Parse the command line to get valid args.
> + * @cmdline: command line to be parsed.
> + * @pnb_args: location to store the number of args, must NOT be NULL.
> + * @args: location to store the args, which should be freed by caller, must
> + *        NOT be NULL.
> + *
> + * Returns 0 on success, negative on failure.
> + *
> + * NOTE: this parser is an approximate form of the real command parser. Number
> + *       of args have a limit of MAX_ARGS. If cmdline contains more, it will
> + *       return with failure.
> + */
> +static int parse_cmdline(const char *cmdline,
> +                         int *pnb_args, char **args)
> +{
> +    const char *p;
> +    int nb_args, ret;
> +    char buf[1024];
> +
> +    p = cmdline;
> +    nb_args = 0;
> +    for (;;) {
> +        while (qemu_isspace(*p)) {
> +            p++;
> +        }
> +        if (*p == '\0') {
> +            break;
> +        }
> +        if (nb_args >= MAX_ARGS) {
> +            goto fail;
> +        }
> +        ret = get_str(buf, sizeof(buf), &p);
> +        if (ret < 0) {
> +            goto fail;
> +        }
> +        args[nb_args] = g_strdup(buf);
> +        nb_args++;
> +    }
> +    *pnb_args = nb_args;
> +    return 0;
> +
> + fail:
> +    free_cmdline_args(args, nb_args);
> +    return -1;
> +}
> +
> +/*
> + * Can command @cmd be executed in preconfig state?
> + */
> +static bool cmd_can_preconfig(const mon_cmd_t *cmd)
> +{
> +    if (!cmd->flags) {
> +        return false;
> +    }
> +
> +    return strchr(cmd->flags, 'p');
> +}
> +
> +static void help_cmd_dump_one(Monitor *mon,
> +                              const mon_cmd_t *cmd,
> +                              char **prefix_args,
> +                              int prefix_args_nb)
> +{
> +    int i;
> +
> +    if (runstate_check(RUN_STATE_PRECONFIG) && !cmd_can_preconfig(cmd)) {
> +        return;
> +    }
> +
> +    for (i = 0; i < prefix_args_nb; i++) {
> +        monitor_printf(mon, "%s ", prefix_args[i]);
> +    }
> +    monitor_printf(mon, "%s %s -- %s\n", cmd->name, cmd->params, cmd->help);
> +}
> +
> +/* @args[@arg_index] is the valid command need to find in @cmds */
> +static void help_cmd_dump(Monitor *mon, const mon_cmd_t *cmds,
> +                          char **args, int nb_args, int arg_index)
> +{
> +    const mon_cmd_t *cmd;
> +    size_t i;
> +
> +    /* No valid arg need to compare with, dump all in *cmds */
> +    if (arg_index >= nb_args) {
> +        for (cmd = cmds; cmd->name != NULL; cmd++) {
> +            help_cmd_dump_one(mon, cmd, args, arg_index);
> +        }
> +        return;
> +    }
> +
> +    /* Find one entry to dump */
> +    for (cmd = cmds; cmd->name != NULL; cmd++) {
> +        if (compare_cmd(args[arg_index], cmd->name) &&
> +            ((!runstate_check(RUN_STATE_PRECONFIG) ||
> +                cmd_can_preconfig(cmd)))) {
> +            if (cmd->sub_table) {
> +                /* continue with next arg */
> +                help_cmd_dump(mon, cmd->sub_table,
> +                              args, nb_args, arg_index + 1);
> +            } else {
> +                help_cmd_dump_one(mon, cmd, args, arg_index);
> +            }
> +            return;
> +        }
> +    }
> +
> +    /* Command not found */
> +    monitor_printf(mon, "unknown command: '");
> +    for (i = 0; i <= arg_index; i++) {
> +        monitor_printf(mon, "%s%s", args[i], i == arg_index ? "'\n" : " ");
> +    }
> +}
> +
> +void help_cmd(Monitor *mon, const char *name)
> +{
> +    MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
> +    char *args[MAX_ARGS];
> +    int nb_args = 0;
> +
> +    /* 1. parse user input */
> +    if (name) {
> +        /* special case for log, directly dump and return */
> +        if (!strcmp(name, "log")) {
> +            const QEMULogItem *item;
> +            monitor_printf(mon, "Log items (comma separated):\n");
> +            monitor_printf(mon, "%-10s %s\n", "none", "remove all logs");
> +            for (item = qemu_log_items; item->mask != 0; item++) {
> +                monitor_printf(mon, "%-10s %s\n", item->name, item->help);
> +            }
> +            return;
> +        }
> +
> +        if (parse_cmdline(name, &nb_args, args) < 0) {
> +            return;
> +        }
> +    }
> +
> +    /* 2. dump the contents according to parsed args */
> +    help_cmd_dump(mon, hmp_mon->cmd_table, args, nb_args, 0);
> +
> +    free_cmdline_args(args, nb_args);
> +}
> +
> +/*******************************************************************/
> +
> +static const char *pch;
> +static sigjmp_buf expr_env;
> +
> +static void GCC_FMT_ATTR(2, 3) QEMU_NORETURN
> +expr_error(Monitor *mon, const char *fmt, ...)
> +{
> +    va_list ap;
> +    va_start(ap, fmt);
> +    monitor_vprintf(mon, fmt, ap);
> +    monitor_printf(mon, "\n");
> +    va_end(ap);
> +    siglongjmp(expr_env, 1);
> +}
> +
> +static void next(void)
> +{
> +    if (*pch != '\0') {
> +        pch++;
> +        while (qemu_isspace(*pch))
> +            pch++;
> +    }
> +}
> +
> +static int64_t expr_sum(Monitor *mon);
> +
> +static int64_t expr_unary(Monitor *mon)
> +{
> +    int64_t n;
> +    char *p;
> +    int ret;
> +
> +    switch(*pch) {
> +    case '+':
> +        next();
> +        n = expr_unary(mon);
> +        break;
> +    case '-':
> +        next();
> +        n = -expr_unary(mon);
> +        break;
> +    case '~':
> +        next();
> +        n = ~expr_unary(mon);
> +        break;
> +    case '(':
> +        next();
> +        n = expr_sum(mon);
> +        if (*pch != ')') {
> +            expr_error(mon, "')' expected");
> +        }
> +        next();
> +        break;
> +    case '\'':
> +        pch++;
> +        if (*pch == '\0')
> +            expr_error(mon, "character constant expected");
> +        n = *pch;
> +        pch++;
> +        if (*pch != '\'')
> +            expr_error(mon, "missing terminating \' character");
> +        next();
> +        break;
> +    case '$':
> +        {
> +            char buf[128], *q;
> +            int64_t reg = 0;
> +
> +            pch++;
> +            q = buf;
> +            while ((*pch >= 'a' && *pch <= 'z') ||
> +                   (*pch >= 'A' && *pch <= 'Z') ||
> +                   (*pch >= '0' && *pch <= '9') ||
> +                   *pch == '_' || *pch == '.') {
> +                if ((q - buf) < sizeof(buf) - 1)
> +                    *q++ = *pch;
> +                pch++;
> +            }
> +            while (qemu_isspace(*pch))
> +                pch++;
> +            *q = 0;
> +            ret = get_monitor_def(&reg, buf);
> +            if (ret < 0)
> +                expr_error(mon, "unknown register");
> +            n = reg;
> +        }
> +        break;
> +    case '\0':
> +        expr_error(mon, "unexpected end of expression");
> +        n = 0;
> +        break;
> +    default:
> +        errno = 0;
> +        n = strtoull(pch, &p, 0);
> +        if (errno == ERANGE) {
> +            expr_error(mon, "number too large");
> +        }
> +        if (pch == p) {
> +            expr_error(mon, "invalid char '%c' in expression", *p);
> +        }
> +        pch = p;
> +        while (qemu_isspace(*pch))
> +            pch++;
> +        break;
> +    }
> +    return n;
> +}
> +
> +static int64_t expr_prod(Monitor *mon)
> +{
> +    int64_t val, val2;
> +    int op;
> +
> +    val = expr_unary(mon);
> +    for(;;) {
> +        op = *pch;
> +        if (op != '*' && op != '/' && op != '%')
> +            break;
> +        next();
> +        val2 = expr_unary(mon);
> +        switch(op) {
> +        default:
> +        case '*':
> +            val *= val2;
> +            break;
> +        case '/':
> +        case '%':
> +            if (val2 == 0)
> +                expr_error(mon, "division by zero");
> +            if (op == '/')
> +                val /= val2;
> +            else
> +                val %= val2;
> +            break;
> +        }
> +    }
> +    return val;
> +}
> +
> +static int64_t expr_logic(Monitor *mon)
> +{
> +    int64_t val, val2;
> +    int op;
> +
> +    val = expr_prod(mon);
> +    for(;;) {
> +        op = *pch;
> +        if (op != '&' && op != '|' && op != '^')
> +            break;
> +        next();
> +        val2 = expr_prod(mon);
> +        switch(op) {
> +        default:
> +        case '&':
> +            val &= val2;
> +            break;
> +        case '|':
> +            val |= val2;
> +            break;
> +        case '^':
> +            val ^= val2;
> +            break;
> +        }
> +    }
> +    return val;
> +}
> +
> +static int64_t expr_sum(Monitor *mon)
> +{
> +    int64_t val, val2;
> +    int op;
> +
> +    val = expr_logic(mon);
> +    for(;;) {
> +        op = *pch;
> +        if (op != '+' && op != '-')
> +            break;
> +        next();
> +        val2 = expr_logic(mon);
> +        if (op == '+')
> +            val += val2;
> +        else
> +            val -= val2;
> +    }
> +    return val;
> +}
> +
> +static int get_expr(Monitor *mon, int64_t *pval, const char **pp)
> +{
> +    pch = *pp;
> +    if (sigsetjmp(expr_env, 0)) {
> +        *pp = pch;
> +        return -1;
> +    }
> +    while (qemu_isspace(*pch))
> +        pch++;
> +    *pval = expr_sum(mon);
> +    *pp = pch;
> +    return 0;
> +}
> +
> +static int get_double(Monitor *mon, double *pval, const char **pp)
> +{
> +    const char *p = *pp;
> +    char *tailp;
> +    double d;
> +
> +    d = strtod(p, &tailp);
> +    if (tailp == p) {
> +        monitor_printf(mon, "Number expected\n");
> +        return -1;
> +    }
> +    if (d != d || d - d != 0) {
> +        /* NaN or infinity */
> +        monitor_printf(mon, "Bad number\n");
> +        return -1;
> +    }
> +    *pval = d;
> +    *pp = tailp;
> +    return 0;
> +}
> +
> +/*
> + * Store the command-name in cmdname, and return a pointer to
> + * the remaining of the command string.
> + */
> +static const char *get_command_name(const char *cmdline,
> +                                    char *cmdname, size_t nlen)
> +{
> +    size_t len;
> +    const char *p, *pstart;
> +
> +    p = cmdline;
> +    while (qemu_isspace(*p))
> +        p++;
> +    if (*p == '\0')
> +        return NULL;
> +    pstart = p;
> +    while (*p != '\0' && *p != '/' && !qemu_isspace(*p))
> +        p++;
> +    len = p - pstart;
> +    if (len > nlen - 1)
> +        len = nlen - 1;
> +    memcpy(cmdname, pstart, len);
> +    cmdname[len] = '\0';
> +    return p;
> +}
> +
> +/**
> + * Read key of 'type' into 'key' and return the current
> + * 'type' pointer.
> + */
> +static char *key_get_info(const char *type, char **key)
> +{
> +    size_t len;
> +    char *p, *str;
> +
> +    if (*type == ',')
> +        type++;
> +
> +    p = strchr(type, ':');
> +    if (!p) {
> +        *key = NULL;
> +        return NULL;
> +    }
> +    len = p - type;
> +
> +    str = g_malloc(len + 1);
> +    memcpy(str, type, len);
> +    str[len] = '\0';
> +
> +    *key = str;
> +    return ++p;
> +}
> +
> +static int default_fmt_format = 'x';
> +static int default_fmt_size = 4;
> +
> +static int is_valid_option(const char *c, const char *typestr)
> +{
> +    char option[3];
> +
> +    option[0] = '-';
> +    option[1] = *c;
> +    option[2] = '\0';
> +
> +    typestr = strstr(typestr, option);
> +    return (typestr != NULL);
> +}
> +
> +static const mon_cmd_t *search_dispatch_table(const mon_cmd_t *disp_table,
> +                                              const char *cmdname)
> +{
> +    const mon_cmd_t *cmd;
> +
> +    for (cmd = disp_table; cmd->name != NULL; cmd++) {
> +        if (compare_cmd(cmdname, cmd->name)) {
> +            return cmd;
> +        }
> +    }
> +
> +    return NULL;
> +}
> +
> +/*
> + * Parse command name from @cmdp according to command table @table.
> + * If blank, return NULL.
> + * Else, if no valid command can be found, report to @mon, and return
> + * NULL.
> + * Else, change @cmdp to point right behind the name, and return its
> + * command table entry.
> + * Do not assume the return value points into @table!  It doesn't when
> + * the command is found in a sub-command table.
> + */
> +static const mon_cmd_t *monitor_parse_command(MonitorHMP *hmp_mon,
> +                                              const char *cmdp_start,
> +                                              const char **cmdp,
> +                                              mon_cmd_t *table)
> +{
> +    Monitor *mon = &hmp_mon->common;
> +    const char *p;
> +    const mon_cmd_t *cmd;
> +    char cmdname[256];
> +
> +    /* extract the command name */
> +    p = get_command_name(*cmdp, cmdname, sizeof(cmdname));
> +    if (!p) {
> +        return NULL;
> +    }
> +
> +    cmd = search_dispatch_table(table, cmdname);
> +    if (!cmd) {
> +        monitor_printf(mon, "unknown command: '%.*s'\n",
> +                       (int)(p - cmdp_start), cmdp_start);
> +        return NULL;
> +    }
> +    if (runstate_check(RUN_STATE_PRECONFIG) && !cmd_can_preconfig(cmd)) {
> +        monitor_printf(mon, "Command '%.*s' not available with -preconfig "
> +                            "until after exit_preconfig.\n",
> +                       (int)(p - cmdp_start), cmdp_start);
> +        return NULL;
> +    }
> +
> +    /* filter out following useless space */
> +    while (qemu_isspace(*p)) {
> +        p++;
> +    }
> +
> +    *cmdp = p;
> +    /* search sub command */
> +    if (cmd->sub_table != NULL && *p != '\0') {
> +        return monitor_parse_command(hmp_mon, cmdp_start, cmdp, cmd->sub_table);
> +    }
> +
> +    return cmd;
> +}
> +
> +/*
> + * Parse arguments for @cmd.
> + * If it can't be parsed, report to @mon, and return NULL.
> + * Else, insert command arguments into a QDict, and return it.
> + * Note: On success, caller has to free the QDict structure.
> + */
> +static QDict *monitor_parse_arguments(Monitor *mon,
> +                                      const char **endp,
> +                                      const mon_cmd_t *cmd)
> +{
> +    const char *typestr;
> +    char *key;
> +    int c;
> +    const char *p = *endp;
> +    char buf[1024];
> +    QDict *qdict = qdict_new();
> +
> +    /* parse the parameters */
> +    typestr = cmd->args_type;
> +    for(;;) {
> +        typestr = key_get_info(typestr, &key);
> +        if (!typestr) {
> +            break;
> +        }
> +        c = *typestr;
> +        typestr++;
> +        switch(c) {
> +        case 'F':
> +        case 'B':
> +        case 's':
> +            {
> +                int ret;
> +
> +                while (qemu_isspace(*p))
> +                    p++;
> +                if (*typestr == '?') {
> +                    typestr++;
> +                    if (*p == '\0') {
> +                        /* no optional string: NULL argument */
> +                        break;
> +                    }
> +                }
> +                ret = get_str(buf, sizeof(buf), &p);
> +                if (ret < 0) {
> +                    switch(c) {
> +                    case 'F':
> +                        monitor_printf(mon, "%s: filename expected\n",
> +                                       cmd->name);
> +                        break;
> +                    case 'B':
> +                        monitor_printf(mon, "%s: block device name expected\n",
> +                                       cmd->name);
> +                        break;
> +                    default:
> +                        monitor_printf(mon, "%s: string expected\n", cmd->name);
> +                        break;
> +                    }
> +                    goto fail;
> +                }
> +                qdict_put_str(qdict, key, buf);
> +            }
> +            break;
> +        case 'O':
> +            {
> +                QemuOptsList *opts_list;
> +                QemuOpts *opts;
> +
> +                opts_list = qemu_find_opts(key);
> +                if (!opts_list || opts_list->desc->name) {
> +                    goto bad_type;
> +                }
> +                while (qemu_isspace(*p)) {
> +                    p++;
> +                }
> +                if (!*p) {
> +                    break;
> +                }
> +                if (get_str(buf, sizeof(buf), &p) < 0) {
> +                    goto fail;
> +                }
> +                opts = qemu_opts_parse_noisily(opts_list, buf, true);
> +                if (!opts) {
> +                    goto fail;
> +                }
> +                qemu_opts_to_qdict(opts, qdict);
> +                qemu_opts_del(opts);
> +            }
> +            break;
> +        case '/':
> +            {
> +                int count, format, size;
> +
> +                while (qemu_isspace(*p))
> +                    p++;
> +                if (*p == '/') {
> +                    /* format found */
> +                    p++;
> +                    count = 1;
> +                    if (qemu_isdigit(*p)) {
> +                        count = 0;
> +                        while (qemu_isdigit(*p)) {
> +                            count = count * 10 + (*p - '0');
> +                            p++;
> +                        }
> +                    }
> +                    size = -1;
> +                    format = -1;
> +                    for(;;) {
> +                        switch(*p) {
> +                        case 'o':
> +                        case 'd':
> +                        case 'u':
> +                        case 'x':
> +                        case 'i':
> +                        case 'c':
> +                            format = *p++;
> +                            break;
> +                        case 'b':
> +                            size = 1;
> +                            p++;
> +                            break;
> +                        case 'h':
> +                            size = 2;
> +                            p++;
> +                            break;
> +                        case 'w':
> +                            size = 4;
> +                            p++;
> +                            break;
> +                        case 'g':
> +                        case 'L':
> +                            size = 8;
> +                            p++;
> +                            break;
> +                        default:
> +                            goto next;
> +                        }
> +                    }
> +                next:
> +                    if (*p != '\0' && !qemu_isspace(*p)) {
> +                        monitor_printf(mon, "invalid char in format: '%c'\n",
> +                                       *p);
> +                        goto fail;
> +                    }
> +                    if (format < 0) {
> +                        format = default_fmt_format;
> +                    }
> +                    if (format != 'i') {
> +                        /* for 'i', not specifying a size gives -1 as size */
> +                        if (size < 0) {
> +                            size = default_fmt_size;
> +                        }
> +                        default_fmt_size = size;
> +                    }
> +                    default_fmt_format = format;
> +                } else {
> +                    count = 1;
> +                    format = default_fmt_format;
> +                    if (format != 'i') {
> +                        size = default_fmt_size;
> +                    } else {
> +                        size = -1;
> +                    }
> +                }
> +                qdict_put_int(qdict, "count", count);
> +                qdict_put_int(qdict, "format", format);
> +                qdict_put_int(qdict, "size", size);
> +            }
> +            break;
> +        case 'i':
> +        case 'l':
> +        case 'M':
> +            {
> +                int64_t val;
> +
> +                while (qemu_isspace(*p))
> +                    p++;
> +                if (*typestr == '?' || *typestr == '.') {
> +                    if (*typestr == '?') {
> +                        if (*p == '\0') {
> +                            typestr++;
> +                            break;
> +                        }
> +                    } else {
> +                        if (*p == '.') {
> +                            p++;
> +                            while (qemu_isspace(*p)) {
> +                                p++;
> +                            }
> +                        } else {
> +                            typestr++;
> +                            break;
> +                        }
> +                    }
> +                    typestr++;
> +                }
> +                if (get_expr(mon, &val, &p))
> +                    goto fail;
> +                /* Check if 'i' is greater than 32-bit */
> +                if ((c == 'i') && ((val >> 32) & 0xffffffff)) {
> +                    monitor_printf(mon, "\'%s\' has failed: ", cmd->name);
> +                    monitor_printf(mon, "integer is for 32-bit values\n");
> +                    goto fail;
> +                } else if (c == 'M') {
> +                    if (val < 0) {
> +                        monitor_printf(mon, "enter a positive value\n");
> +                        goto fail;
> +                    }
> +                    val *= MiB;
> +                }
> +                qdict_put_int(qdict, key, val);
> +            }
> +            break;
> +        case 'o':
> +            {
> +                int ret;
> +                uint64_t val;
> +                const char *end;
> +
> +                while (qemu_isspace(*p)) {
> +                    p++;
> +                }
> +                if (*typestr == '?') {
> +                    typestr++;
> +                    if (*p == '\0') {
> +                        break;
> +                    }
> +                }
> +                ret = qemu_strtosz_MiB(p, &end, &val);
> +                if (ret < 0 || val > INT64_MAX) {
> +                    monitor_printf(mon, "invalid size\n");
> +                    goto fail;
> +                }
> +                qdict_put_int(qdict, key, val);
> +                p = end;
> +            }
> +            break;
> +        case 'T':
> +            {
> +                double val;
> +
> +                while (qemu_isspace(*p)) {
> +                    p++;
> +                }
> +                if (*typestr == '?') {
> +                    typestr++;
> +                    if (*p == '\0') {
> +                        break;
> +                    }
> +                }
> +                if (get_double(mon, &val, &p) < 0) {
> +                    goto fail;
> +                }
> +                if (p[0] && p[1] == 's') {
> +                    switch (*p) {
> +                    case 'm':
> +                        val /= 1e3; p += 2; break;
> +                    case 'u':
> +                        val /= 1e6; p += 2; break;
> +                    case 'n':
> +                        val /= 1e9; p += 2; break;
> +                    }
> +                }
> +                if (*p && !qemu_isspace(*p)) {
> +                    monitor_printf(mon, "Unknown unit suffix\n");
> +                    goto fail;
> +                }
> +                qdict_put(qdict, key, qnum_from_double(val));
> +            }
> +            break;
> +        case 'b':
> +            {
> +                const char *beg;
> +                bool val;
> +
> +                while (qemu_isspace(*p)) {
> +                    p++;
> +                }
> +                beg = p;
> +                while (qemu_isgraph(*p)) {
> +                    p++;
> +                }
> +                if (p - beg == 2 && !memcmp(beg, "on", p - beg)) {
> +                    val = true;
> +                } else if (p - beg == 3 && !memcmp(beg, "off", p - beg)) {
> +                    val = false;
> +                } else {
> +                    monitor_printf(mon, "Expected 'on' or 'off'\n");
> +                    goto fail;
> +                }
> +                qdict_put_bool(qdict, key, val);
> +            }
> +            break;
> +        case '-':
> +            {
> +                const char *tmp = p;
> +                int skip_key = 0;
> +                /* option */
> +
> +                c = *typestr++;
> +                if (c == '\0')
> +                    goto bad_type;
> +                while (qemu_isspace(*p))
> +                    p++;
> +                if (*p == '-') {
> +                    p++;
> +                    if(c != *p) {
> +                        if(!is_valid_option(p, typestr)) {
> +                            monitor_printf(mon, "%s: unsupported option -%c\n",
> +                                           cmd->name, *p);
> +                            goto fail;
> +                        } else {
> +                            skip_key = 1;
> +                        }
> +                    }
> +                    if(skip_key) {
> +                        p = tmp;
> +                    } else {
> +                        /* has option */
> +                        p++;
> +                        qdict_put_bool(qdict, key, true);
> +                    }
> +                }
> +            }
> +            break;
> +        case 'S':
> +            {
> +                /* package all remaining string */
> +                int len;
> +
> +                while (qemu_isspace(*p)) {
> +                    p++;
> +                }
> +                if (*typestr == '?') {
> +                    typestr++;
> +                    if (*p == '\0') {
> +                        /* no remaining string: NULL argument */
> +                        break;
> +                    }
> +                }
> +                len = strlen(p);
> +                if (len <= 0) {
> +                    monitor_printf(mon, "%s: string expected\n",
> +                                   cmd->name);
> +                    goto fail;
> +                }
> +                qdict_put_str(qdict, key, p);
> +                p += len;
> +            }
> +            break;
> +        default:
> +        bad_type:
> +            monitor_printf(mon, "%s: unknown type '%c'\n", cmd->name, c);
> +            goto fail;
> +        }
> +        g_free(key);
> +        key = NULL;
> +    }
> +    /* check that all arguments were parsed */
> +    while (qemu_isspace(*p))
> +        p++;
> +    if (*p != '\0') {
> +        monitor_printf(mon, "%s: extraneous characters at the end of line\n",
> +                       cmd->name);
> +        goto fail;
> +    }
> +
> +    return qdict;
> +
> +fail:
> +    qobject_unref(qdict);
> +    g_free(key);
> +    return NULL;
> +}
> +
> +void handle_hmp_command(MonitorHMP *mon, const char *cmdline)
> +{
> +    QDict *qdict;
> +    const mon_cmd_t *cmd;
> +    const char *cmd_start = cmdline;
> +
> +    trace_handle_hmp_command(mon, cmdline);
> +
> +    cmd = monitor_parse_command(mon, cmdline, &cmdline, mon->cmd_table);
> +    if (!cmd) {
> +        return;
> +    }
> +
> +    qdict = monitor_parse_arguments(&mon->common, &cmdline, cmd);
> +    if (!qdict) {
> +        while (cmdline > cmd_start && qemu_isspace(cmdline[-1])) {
> +            cmdline--;
> +        }
> +        monitor_printf(&mon->common, "Try \"help %.*s\" for more information\n",
> +                       (int)(cmdline - cmd_start), cmd_start);
> +        return;
> +    }
> +
> +    cmd->cmd(&mon->common, qdict);
> +    qobject_unref(qdict);
> +}
> +
> +static void cmd_completion(MonitorHMP *mon, const char *name, const char *list)
> +{
> +    const char *p, *pstart;
> +    char cmd[128];
> +    int len;
> +
> +    p = list;
> +    for(;;) {
> +        pstart = p;
> +        p = qemu_strchrnul(p, '|');
> +        len = p - pstart;
> +        if (len > sizeof(cmd) - 2)
> +            len = sizeof(cmd) - 2;
> +        memcpy(cmd, pstart, len);
> +        cmd[len] = '\0';
> +        if (name[0] == '\0' || !strncmp(name, cmd, strlen(name))) {
> +            readline_add_completion(mon->rs, cmd);
> +        }
> +        if (*p == '\0')
> +            break;
> +        p++;
> +    }
> +}
> +
> +static void file_completion(MonitorHMP *mon, const char *input)
> +{
> +    DIR *ffs;
> +    struct dirent *d;
> +    char path[1024];
> +    char file[1024], file_prefix[1024];
> +    int input_path_len;
> +    const char *p;
> +
> +    p = strrchr(input, '/');
> +    if (!p) {
> +        input_path_len = 0;
> +        pstrcpy(file_prefix, sizeof(file_prefix), input);
> +        pstrcpy(path, sizeof(path), ".");
> +    } else {
> +        input_path_len = p - input + 1;
> +        memcpy(path, input, input_path_len);
> +        if (input_path_len > sizeof(path) - 1)
> +            input_path_len = sizeof(path) - 1;
> +        path[input_path_len] = '\0';
> +        pstrcpy(file_prefix, sizeof(file_prefix), p + 1);
> +    }
> +
> +    ffs = opendir(path);
> +    if (!ffs)
> +        return;
> +    for(;;) {
> +        struct stat sb;
> +        d = readdir(ffs);
> +        if (!d)
> +            break;
> +
> +        if (strcmp(d->d_name, ".") == 0 || strcmp(d->d_name, "..") == 0) {
> +            continue;
> +        }
> +
> +        if (strstart(d->d_name, file_prefix, NULL)) {
> +            memcpy(file, input, input_path_len);
> +            if (input_path_len < sizeof(file))
> +                pstrcpy(file + input_path_len, sizeof(file) - input_path_len,
> +                        d->d_name);
> +            /* stat the file to find out if it's a directory.
> +             * In that case add a slash to speed up typing long paths
> +             */
> +            if (stat(file, &sb) == 0 && S_ISDIR(sb.st_mode)) {
> +                pstrcat(file, sizeof(file), "/");
> +            }
> +            readline_add_completion(mon->rs, file);
> +        }
> +    }
> +    closedir(ffs);
> +}
> +
> +static const char *next_arg_type(const char *typestr)
> +{
> +    const char *p = strchr(typestr, ':');
> +    return (p != NULL ? ++p : typestr);
> +}
> +
> +static void monitor_find_completion_by_table(MonitorHMP *mon,
> +                                             const mon_cmd_t *cmd_table,
> +                                             char **args,
> +                                             int nb_args)
> +{
> +    const char *cmdname;
> +    int i;
> +    const char *ptype, *old_ptype, *str, *name;
> +    const mon_cmd_t *cmd;
> +    BlockBackend *blk = NULL;
> +
> +    if (nb_args <= 1) {
> +        /* command completion */
> +        if (nb_args == 0)
> +            cmdname = "";
> +        else
> +            cmdname = args[0];
> +        readline_set_completion_index(mon->rs, strlen(cmdname));
> +        for (cmd = cmd_table; cmd->name != NULL; cmd++) {
> +            if (!runstate_check(RUN_STATE_PRECONFIG) ||
> +                 cmd_can_preconfig(cmd)) {
> +                cmd_completion(mon, cmdname, cmd->name);
> +            }
> +        }
> +    } else {
> +        /* find the command */
> +        for (cmd = cmd_table; cmd->name != NULL; cmd++) {
> +            if (compare_cmd(args[0], cmd->name) &&
> +                (!runstate_check(RUN_STATE_PRECONFIG) ||
> +                 cmd_can_preconfig(cmd))) {
> +                break;
> +            }
> +        }
> +        if (!cmd->name) {
> +            return;
> +        }
> +
> +        if (cmd->sub_table) {
> +            /* do the job again */
> +            monitor_find_completion_by_table(mon, cmd->sub_table,
> +                                             &args[1], nb_args - 1);
> +            return;
> +        }
> +        if (cmd->command_completion) {
> +            cmd->command_completion(mon->rs, nb_args, args[nb_args - 1]);
> +            return;
> +        }
> +
> +        ptype = next_arg_type(cmd->args_type);
> +        for(i = 0; i < nb_args - 2; i++) {
> +            if (*ptype != '\0') {
> +                ptype = next_arg_type(ptype);
> +                while (*ptype == '?')
> +                    ptype = next_arg_type(ptype);
> +            }
> +        }
> +        str = args[nb_args - 1];
> +        old_ptype = NULL;
> +        while (*ptype == '-' && old_ptype != ptype) {
> +            old_ptype = ptype;
> +            ptype = next_arg_type(ptype);
> +        }
> +        switch(*ptype) {
> +        case 'F':
> +            /* file completion */
> +            readline_set_completion_index(mon->rs, strlen(str));
> +            file_completion(mon, str);
> +            break;
> +        case 'B':
> +            /* block device name completion */
> +            readline_set_completion_index(mon->rs, strlen(str));
> +            while ((blk = blk_next(blk)) != NULL) {
> +                name = blk_name(blk);
> +                if (str[0] == '\0' ||
> +                    !strncmp(name, str, strlen(str))) {
> +                    readline_add_completion(mon->rs, name);
> +                }
> +            }
> +            break;
> +        case 's':
> +        case 'S':
> +            if (!strcmp(cmd->name, "help|?")) {
> +                monitor_find_completion_by_table(mon, cmd_table,
> +                                                 &args[1], nb_args - 1);
> +            }
> +            break;
> +        default:
> +            break;
> +        }
> +    }
> +}
> +
> +static void monitor_find_completion(void *opaque,
> +                                    const char *cmdline)
> +{
> +    MonitorHMP *mon = opaque;
> +    char *args[MAX_ARGS];
> +    int nb_args, len;
> +
> +    /* 1. parse the cmdline */
> +    if (parse_cmdline(cmdline, &nb_args, args) < 0) {
> +        return;
> +    }
> +
> +    /* if the line ends with a space, it means we want to complete the
> +       next arg */
> +    len = strlen(cmdline);
> +    if (len > 0 && qemu_isspace(cmdline[len - 1])) {
> +        if (nb_args >= MAX_ARGS) {
> +            goto cleanup;
> +        }
> +        args[nb_args++] = g_strdup("");
> +    }
> +
> +    /* 2. auto complete according to args */
> +    monitor_find_completion_by_table(mon, mon->cmd_table, args, nb_args);
> +
> +cleanup:
> +    free_cmdline_args(args, nb_args);
> +}
> +
> +static void monitor_read(void *opaque, const uint8_t *buf, int size)
> +{
> +    MonitorHMP *mon;
> +    Monitor *old_mon = cur_mon;
> +    int i;
> +
> +    cur_mon = opaque;
> +    mon = container_of(cur_mon, MonitorHMP, common);
> +
> +    if (mon->rs) {
> +        for (i = 0; i < size; i++) {
> +            readline_handle_byte(mon->rs, buf[i]);
> +        }
> +    } else {
> +        if (size == 0 || buf[size - 1] != 0) {
> +            monitor_printf(cur_mon, "corrupted command\n");
> +        } else {
> +            handle_hmp_command(mon, (char *)buf);
> +        }
> +    }
> +
> +    cur_mon = old_mon;
> +}
> +
> +static void monitor_event(void *opaque, int event)
> +{
> +    Monitor *mon = opaque;
> +    MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
> +
> +    switch (event) {
> +    case CHR_EVENT_MUX_IN:
> +        qemu_mutex_lock(&mon->mon_lock);
> +        mon->mux_out = 0;
> +        qemu_mutex_unlock(&mon->mon_lock);
> +        if (mon->reset_seen) {
> +            readline_restart(hmp_mon->rs);
> +            monitor_resume(mon);
> +            monitor_flush(mon);
> +        } else {
> +            atomic_mb_set(&mon->suspend_cnt, 0);
> +        }
> +        break;
> +
> +    case CHR_EVENT_MUX_OUT:
> +        if (mon->reset_seen) {
> +            if (atomic_mb_read(&mon->suspend_cnt) == 0) {
> +                monitor_printf(mon, "\n");
> +            }
> +            monitor_flush(mon);
> +            monitor_suspend(mon);
> +        } else {
> +            atomic_inc(&mon->suspend_cnt);
> +        }
> +        qemu_mutex_lock(&mon->mon_lock);
> +        mon->mux_out = 1;
> +        qemu_mutex_unlock(&mon->mon_lock);
> +        break;
> +
> +    case CHR_EVENT_OPENED:
> +        monitor_printf(mon, "QEMU %s monitor - type 'help' for more "
> +                       "information\n", QEMU_VERSION);
> +        if (!mon->mux_out) {
> +            readline_restart(hmp_mon->rs);
> +            readline_show_prompt(hmp_mon->rs);
> +        }
> +        mon->reset_seen = 1;
> +        mon_refcount++;
> +        break;
> +
> +    case CHR_EVENT_CLOSED:
> +        mon_refcount--;
> +        monitor_fdsets_cleanup();
> +        break;
> +    }
> +}
> +
> +
> +/* These functions just adapt the readline interface in a typesafe way.  We
> + * could cast function pointers but that discards compiler checks.
> + */
> +static void GCC_FMT_ATTR(2, 3) monitor_readline_printf(void *opaque,
> +                                                       const char *fmt, ...)
> +{
> +    MonitorHMP *mon = opaque;
> +    va_list ap;
> +    va_start(ap, fmt);
> +    monitor_vprintf(&mon->common, fmt, ap);
> +    va_end(ap);
> +}
> +
> +static void monitor_readline_flush(void *opaque)
> +{
> +    MonitorHMP *mon = opaque;
> +    monitor_flush(&mon->common);
> +}
> +
> +void monitor_data_init_hmp(MonitorHMP *mon, int flags, bool skip_flush)
> +{
> +    monitor_data_init(&mon->common, flags, skip_flush, false);
> +
> +    /* Use *mon_cmds by default. */
> +    mon->cmd_table = mon_cmds;
> +}
> +
> +void monitor_init_hmp(Chardev *chr, int flags)
> +{
> +    MonitorHMP *mon = g_malloc0(sizeof(*mon));
> +    bool use_readline = flags & MONITOR_USE_READLINE;
> +
> +    monitor_data_init_hmp(mon, flags, false);
> +    qemu_chr_fe_init(&mon->common.chr, chr, &error_abort);
> +
> +    if (use_readline) {
> +        mon->rs = readline_init(monitor_readline_printf,
> +                                monitor_readline_flush,
> +                                mon,
> +                                monitor_find_completion);
> +        monitor_read_command(mon, 0);
> +    }
> +
> +    qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read, monitor_read,
> +                             monitor_event, NULL, &mon->common, NULL, true);
> +    monitor_list_append(&mon->common);
> +}
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 6c67f0978c..408d11e1fe 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -24,7 +24,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "monitor_int.h"
> -#include "qemu/units.h"
>  #include <dirent.h>
>  #include "cpu.h"
>  #include "hw/hw.h"
> @@ -155,7 +154,6 @@ static QLIST_HEAD(, MonFdset) mon_fdsets;
>  
>  int mon_refcount;
>  
> -static mon_cmd_t mon_cmds[];
>  static mon_cmd_t info_cmds[];
>  
>  __thread Monitor *cur_mon;
> @@ -540,8 +538,6 @@ static void monitor_qapi_event_init(void)
>                                                  qapi_event_throttle_equal);
>  }
>  
> -static void handle_hmp_command(MonitorHMP *mon, const char *cmdline);
> -
>  static void monitor_iothread_init(void);
>  
>  void monitor_data_init(Monitor *mon, int flags, bool skip_flush,
> @@ -558,14 +554,6 @@ void monitor_data_init(Monitor *mon, int flags, bool skip_flush,
>      mon->flags = flags;
>  }
>  
> -static void monitor_data_init_hmp(MonitorHMP *mon, int flags, bool skip_flush)
> -{
> -    monitor_data_init(&mon->common, flags, skip_flush, false);
> -
> -    /* Use *mon_cmds by default. */
> -    mon->cmd_table = mon_cmds;
> -}
> -
>  static void monitor_data_destroy(Monitor *mon)
>  {
>      g_free(mon->mon_cpu_path);
> @@ -619,248 +607,6 @@ out:
>      return output;
>  }
>  
> -static int compare_cmd(const char *name, const char *list)
> -{
> -    const char *p, *pstart;
> -    int len;
> -    len = strlen(name);
> -    p = list;
> -    for(;;) {
> -        pstart = p;
> -        p = qemu_strchrnul(p, '|');
> -        if ((p - pstart) == len && !memcmp(pstart, name, len))
> -            return 1;
> -        if (*p == '\0')
> -            break;
> -        p++;
> -    }
> -    return 0;
> -}
> -
> -static int get_str(char *buf, int buf_size, const char **pp)
> -{
> -    const char *p;
> -    char *q;
> -    int c;
> -
> -    q = buf;
> -    p = *pp;
> -    while (qemu_isspace(*p)) {
> -        p++;
> -    }
> -    if (*p == '\0') {
> -    fail:
> -        *q = '\0';
> -        *pp = p;
> -        return -1;
> -    }
> -    if (*p == '\"') {
> -        p++;
> -        while (*p != '\0' && *p != '\"') {
> -            if (*p == '\\') {
> -                p++;
> -                c = *p++;
> -                switch (c) {
> -                case 'n':
> -                    c = '\n';
> -                    break;
> -                case 'r':
> -                    c = '\r';
> -                    break;
> -                case '\\':
> -                case '\'':
> -                case '\"':
> -                    break;
> -                default:
> -                    printf("unsupported escape code: '\\%c'\n", c);
> -                    goto fail;
> -                }
> -                if ((q - buf) < buf_size - 1) {
> -                    *q++ = c;
> -                }
> -            } else {
> -                if ((q - buf) < buf_size - 1) {
> -                    *q++ = *p;
> -                }
> -                p++;
> -            }
> -        }
> -        if (*p != '\"') {
> -            printf("unterminated string\n");
> -            goto fail;
> -        }
> -        p++;
> -    } else {
> -        while (*p != '\0' && !qemu_isspace(*p)) {
> -            if ((q - buf) < buf_size - 1) {
> -                *q++ = *p;
> -            }
> -            p++;
> -        }
> -    }
> -    *q = '\0';
> -    *pp = p;
> -    return 0;
> -}
> -
> -#define MAX_ARGS 16
> -
> -static void free_cmdline_args(char **args, int nb_args)
> -{
> -    int i;
> -
> -    assert(nb_args <= MAX_ARGS);
> -
> -    for (i = 0; i < nb_args; i++) {
> -        g_free(args[i]);
> -    }
> -
> -}
> -
> -/*
> - * Parse the command line to get valid args.
> - * @cmdline: command line to be parsed.
> - * @pnb_args: location to store the number of args, must NOT be NULL.
> - * @args: location to store the args, which should be freed by caller, must
> - *        NOT be NULL.
> - *
> - * Returns 0 on success, negative on failure.
> - *
> - * NOTE: this parser is an approximate form of the real command parser. Number
> - *       of args have a limit of MAX_ARGS. If cmdline contains more, it will
> - *       return with failure.
> - */
> -static int parse_cmdline(const char *cmdline,
> -                         int *pnb_args, char **args)
> -{
> -    const char *p;
> -    int nb_args, ret;
> -    char buf[1024];
> -
> -    p = cmdline;
> -    nb_args = 0;
> -    for (;;) {
> -        while (qemu_isspace(*p)) {
> -            p++;
> -        }
> -        if (*p == '\0') {
> -            break;
> -        }
> -        if (nb_args >= MAX_ARGS) {
> -            goto fail;
> -        }
> -        ret = get_str(buf, sizeof(buf), &p);
> -        if (ret < 0) {
> -            goto fail;
> -        }
> -        args[nb_args] = g_strdup(buf);
> -        nb_args++;
> -    }
> -    *pnb_args = nb_args;
> -    return 0;
> -
> - fail:
> -    free_cmdline_args(args, nb_args);
> -    return -1;
> -}
> -
> -/*
> - * Can command @cmd be executed in preconfig state?
> - */
> -static bool cmd_can_preconfig(const mon_cmd_t *cmd)
> -{
> -    if (!cmd->flags) {
> -        return false;
> -    }
> -
> -    return strchr(cmd->flags, 'p');
> -}
> -
> -static void help_cmd_dump_one(Monitor *mon,
> -                              const mon_cmd_t *cmd,
> -                              char **prefix_args,
> -                              int prefix_args_nb)
> -{
> -    int i;
> -
> -    if (runstate_check(RUN_STATE_PRECONFIG) && !cmd_can_preconfig(cmd)) {
> -        return;
> -    }
> -
> -    for (i = 0; i < prefix_args_nb; i++) {
> -        monitor_printf(mon, "%s ", prefix_args[i]);
> -    }
> -    monitor_printf(mon, "%s %s -- %s\n", cmd->name, cmd->params, cmd->help);
> -}
> -
> -/* @args[@arg_index] is the valid command need to find in @cmds */
> -static void help_cmd_dump(Monitor *mon, const mon_cmd_t *cmds,
> -                          char **args, int nb_args, int arg_index)
> -{
> -    const mon_cmd_t *cmd;
> -    size_t i;
> -
> -    /* No valid arg need to compare with, dump all in *cmds */
> -    if (arg_index >= nb_args) {
> -        for (cmd = cmds; cmd->name != NULL; cmd++) {
> -            help_cmd_dump_one(mon, cmd, args, arg_index);
> -        }
> -        return;
> -    }
> -
> -    /* Find one entry to dump */
> -    for (cmd = cmds; cmd->name != NULL; cmd++) {
> -        if (compare_cmd(args[arg_index], cmd->name) &&
> -            ((!runstate_check(RUN_STATE_PRECONFIG) ||
> -                cmd_can_preconfig(cmd)))) {
> -            if (cmd->sub_table) {
> -                /* continue with next arg */
> -                help_cmd_dump(mon, cmd->sub_table,
> -                              args, nb_args, arg_index + 1);
> -            } else {
> -                help_cmd_dump_one(mon, cmd, args, arg_index);
> -            }
> -            return;
> -        }
> -    }
> -
> -    /* Command not found */
> -    monitor_printf(mon, "unknown command: '");
> -    for (i = 0; i <= arg_index; i++) {
> -        monitor_printf(mon, "%s%s", args[i], i == arg_index ? "'\n" : " ");
> -    }
> -}
> -
> -static void help_cmd(Monitor *mon, const char *name)
> -{
> -    MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
> -    char *args[MAX_ARGS];
> -    int nb_args = 0;
> -
> -    /* 1. parse user input */
> -    if (name) {
> -        /* special case for log, directly dump and return */
> -        if (!strcmp(name, "log")) {
> -            const QEMULogItem *item;
> -            monitor_printf(mon, "Log items (comma separated):\n");
> -            monitor_printf(mon, "%-10s %s\n", "none", "remove all logs");
> -            for (item = qemu_log_items; item->mask != 0; item++) {
> -                monitor_printf(mon, "%-10s %s\n", item->name, item->help);
> -            }
> -            return;
> -        }
> -
> -        if (parse_cmdline(name, &nb_args, args) < 0) {
> -            return;
> -        }
> -    }
> -
> -    /* 2. dump the contents according to parsed args */
> -    help_cmd_dump(mon, hmp_mon->cmd_table, args, nb_args, 0);
> -
> -    free_cmdline_args(args, nb_args);
> -}
> -
>  static void do_help_cmd(Monitor *mon, const QDict *qdict)
>  {
>      help_cmd(mon, qdict_get_try_str(qdict, "name"));
> @@ -2510,30 +2256,16 @@ static mon_cmd_t info_cmds[] = {
>  };
>  
>  /* mon_cmds and info_cmds would be sorted at runtime */
> -static mon_cmd_t mon_cmds[] = {
> +mon_cmd_t mon_cmds[] = {
>  #include "hmp-commands.h"
>      { NULL, NULL, },
>  };
>  
> -/*******************************************************************/
> -
> -static const char *pch;
> -static sigjmp_buf expr_env;
> -
> -
> -static void GCC_FMT_ATTR(2, 3) QEMU_NORETURN
> -expr_error(Monitor *mon, const char *fmt, ...)
> -{
> -    va_list ap;
> -    va_start(ap, fmt);
> -    monitor_vprintf(mon, fmt, ap);
> -    monitor_printf(mon, "\n");
> -    va_end(ap);
> -    siglongjmp(expr_env, 1);
> -}
> -
> -/* return 0 if OK, -1 if not found */
> -static int get_monitor_def(target_long *pval, const char *name)
> +/*
> + * Set @pval to the value in the register identified by @name.
> + * return 0 if OK, -1 if not found
> + */
> +int get_monitor_def(int64_t *pval, const char *name)
>  {
>      const MonitorDef *md = target_monitor_defs();
>      CPUState *cs = mon_get_cpu();
> @@ -2576,829 +2308,6 @@ static int get_monitor_def(target_long *pval, const char *name)
>      return ret;
>  }
>  
> -static void next(void)
> -{
> -    if (*pch != '\0') {
> -        pch++;
> -        while (qemu_isspace(*pch))
> -            pch++;
> -    }
> -}
> -
> -static int64_t expr_sum(Monitor *mon);
> -
> -static int64_t expr_unary(Monitor *mon)
> -{
> -    int64_t n;
> -    char *p;
> -    int ret;
> -
> -    switch(*pch) {
> -    case '+':
> -        next();
> -        n = expr_unary(mon);
> -        break;
> -    case '-':
> -        next();
> -        n = -expr_unary(mon);
> -        break;
> -    case '~':
> -        next();
> -        n = ~expr_unary(mon);
> -        break;
> -    case '(':
> -        next();
> -        n = expr_sum(mon);
> -        if (*pch != ')') {
> -            expr_error(mon, "')' expected");
> -        }
> -        next();
> -        break;
> -    case '\'':
> -        pch++;
> -        if (*pch == '\0')
> -            expr_error(mon, "character constant expected");
> -        n = *pch;
> -        pch++;
> -        if (*pch != '\'')
> -            expr_error(mon, "missing terminating \' character");
> -        next();
> -        break;
> -    case '$':
> -        {
> -            char buf[128], *q;
> -            target_long reg=0;
> -
> -            pch++;
> -            q = buf;
> -            while ((*pch >= 'a' && *pch <= 'z') ||
> -                   (*pch >= 'A' && *pch <= 'Z') ||
> -                   (*pch >= '0' && *pch <= '9') ||
> -                   *pch == '_' || *pch == '.') {
> -                if ((q - buf) < sizeof(buf) - 1)
> -                    *q++ = *pch;
> -                pch++;
> -            }
> -            while (qemu_isspace(*pch))
> -                pch++;
> -            *q = 0;
> -            ret = get_monitor_def(&reg, buf);
> -            if (ret < 0)
> -                expr_error(mon, "unknown register");
> -            n = reg;
> -        }
> -        break;
> -    case '\0':
> -        expr_error(mon, "unexpected end of expression");
> -        n = 0;
> -        break;
> -    default:
> -        errno = 0;
> -        n = strtoull(pch, &p, 0);
> -        if (errno == ERANGE) {
> -            expr_error(mon, "number too large");
> -        }
> -        if (pch == p) {
> -            expr_error(mon, "invalid char '%c' in expression", *p);
> -        }
> -        pch = p;
> -        while (qemu_isspace(*pch))
> -            pch++;
> -        break;
> -    }
> -    return n;
> -}
> -
> -
> -static int64_t expr_prod(Monitor *mon)
> -{
> -    int64_t val, val2;
> -    int op;
> -
> -    val = expr_unary(mon);
> -    for(;;) {
> -        op = *pch;
> -        if (op != '*' && op != '/' && op != '%')
> -            break;
> -        next();
> -        val2 = expr_unary(mon);
> -        switch(op) {
> -        default:
> -        case '*':
> -            val *= val2;
> -            break;
> -        case '/':
> -        case '%':
> -            if (val2 == 0)
> -                expr_error(mon, "division by zero");
> -            if (op == '/')
> -                val /= val2;
> -            else
> -                val %= val2;
> -            break;
> -        }
> -    }
> -    return val;
> -}
> -
> -static int64_t expr_logic(Monitor *mon)
> -{
> -    int64_t val, val2;
> -    int op;
> -
> -    val = expr_prod(mon);
> -    for(;;) {
> -        op = *pch;
> -        if (op != '&' && op != '|' && op != '^')
> -            break;
> -        next();
> -        val2 = expr_prod(mon);
> -        switch(op) {
> -        default:
> -        case '&':
> -            val &= val2;
> -            break;
> -        case '|':
> -            val |= val2;
> -            break;
> -        case '^':
> -            val ^= val2;
> -            break;
> -        }
> -    }
> -    return val;
> -}
> -
> -static int64_t expr_sum(Monitor *mon)
> -{
> -    int64_t val, val2;
> -    int op;
> -
> -    val = expr_logic(mon);
> -    for(;;) {
> -        op = *pch;
> -        if (op != '+' && op != '-')
> -            break;
> -        next();
> -        val2 = expr_logic(mon);
> -        if (op == '+')
> -            val += val2;
> -        else
> -            val -= val2;
> -    }
> -    return val;
> -}
> -
> -static int get_expr(Monitor *mon, int64_t *pval, const char **pp)
> -{
> -    pch = *pp;
> -    if (sigsetjmp(expr_env, 0)) {
> -        *pp = pch;
> -        return -1;
> -    }
> -    while (qemu_isspace(*pch))
> -        pch++;
> -    *pval = expr_sum(mon);
> -    *pp = pch;
> -    return 0;
> -}
> -
> -static int get_double(Monitor *mon, double *pval, const char **pp)
> -{
> -    const char *p = *pp;
> -    char *tailp;
> -    double d;
> -
> -    d = strtod(p, &tailp);
> -    if (tailp == p) {
> -        monitor_printf(mon, "Number expected\n");
> -        return -1;
> -    }
> -    if (d != d || d - d != 0) {
> -        /* NaN or infinity */
> -        monitor_printf(mon, "Bad number\n");
> -        return -1;
> -    }
> -    *pval = d;
> -    *pp = tailp;
> -    return 0;
> -}
> -
> -/*
> - * Store the command-name in cmdname, and return a pointer to
> - * the remaining of the command string.
> - */
> -static const char *get_command_name(const char *cmdline,
> -                                    char *cmdname, size_t nlen)
> -{
> -    size_t len;
> -    const char *p, *pstart;
> -
> -    p = cmdline;
> -    while (qemu_isspace(*p))
> -        p++;
> -    if (*p == '\0')
> -        return NULL;
> -    pstart = p;
> -    while (*p != '\0' && *p != '/' && !qemu_isspace(*p))
> -        p++;
> -    len = p - pstart;
> -    if (len > nlen - 1)
> -        len = nlen - 1;
> -    memcpy(cmdname, pstart, len);
> -    cmdname[len] = '\0';
> -    return p;
> -}
> -
> -/**
> - * Read key of 'type' into 'key' and return the current
> - * 'type' pointer.
> - */
> -static char *key_get_info(const char *type, char **key)
> -{
> -    size_t len;
> -    char *p, *str;
> -
> -    if (*type == ',')
> -        type++;
> -
> -    p = strchr(type, ':');
> -    if (!p) {
> -        *key = NULL;
> -        return NULL;
> -    }
> -    len = p - type;
> -
> -    str = g_malloc(len + 1);
> -    memcpy(str, type, len);
> -    str[len] = '\0';
> -
> -    *key = str;
> -    return ++p;
> -}
> -
> -static int default_fmt_format = 'x';
> -static int default_fmt_size = 4;
> -
> -static int is_valid_option(const char *c, const char *typestr)
> -{
> -    char option[3];
> -  
> -    option[0] = '-';
> -    option[1] = *c;
> -    option[2] = '\0';
> -  
> -    typestr = strstr(typestr, option);
> -    return (typestr != NULL);
> -}
> -
> -static const mon_cmd_t *search_dispatch_table(const mon_cmd_t *disp_table,
> -                                              const char *cmdname)
> -{
> -    const mon_cmd_t *cmd;
> -
> -    for (cmd = disp_table; cmd->name != NULL; cmd++) {
> -        if (compare_cmd(cmdname, cmd->name)) {
> -            return cmd;
> -        }
> -    }
> -
> -    return NULL;
> -}
> -
> -/*
> - * Parse command name from @cmdp according to command table @table.
> - * If blank, return NULL.
> - * Else, if no valid command can be found, report to @mon, and return
> - * NULL.
> - * Else, change @cmdp to point right behind the name, and return its
> - * command table entry.
> - * Do not assume the return value points into @table!  It doesn't when
> - * the command is found in a sub-command table.
> - */
> -static const mon_cmd_t *monitor_parse_command(MonitorHMP *hmp_mon,
> -                                              const char *cmdp_start,
> -                                              const char **cmdp,
> -                                              mon_cmd_t *table)
> -{
> -    Monitor *mon = &hmp_mon->common;
> -    const char *p;
> -    const mon_cmd_t *cmd;
> -    char cmdname[256];
> -
> -    /* extract the command name */
> -    p = get_command_name(*cmdp, cmdname, sizeof(cmdname));
> -    if (!p)
> -        return NULL;
> -
> -    cmd = search_dispatch_table(table, cmdname);
> -    if (!cmd) {
> -        monitor_printf(mon, "unknown command: '%.*s'\n",
> -                       (int)(p - cmdp_start), cmdp_start);
> -        return NULL;
> -    }
> -    if (runstate_check(RUN_STATE_PRECONFIG) && !cmd_can_preconfig(cmd)) {
> -        monitor_printf(mon, "Command '%.*s' not available with -preconfig "
> -                            "until after exit_preconfig.\n",
> -                       (int)(p - cmdp_start), cmdp_start);
> -        return NULL;
> -    }
> -
> -    /* filter out following useless space */
> -    while (qemu_isspace(*p)) {
> -        p++;
> -    }
> -
> -    *cmdp = p;
> -    /* search sub command */
> -    if (cmd->sub_table != NULL && *p != '\0') {
> -        return monitor_parse_command(hmp_mon, cmdp_start, cmdp, cmd->sub_table);
> -    }
> -
> -    return cmd;
> -}
> -
> -/*
> - * Parse arguments for @cmd.
> - * If it can't be parsed, report to @mon, and return NULL.
> - * Else, insert command arguments into a QDict, and return it.
> - * Note: On success, caller has to free the QDict structure.
> - */
> -
> -static QDict *monitor_parse_arguments(Monitor *mon,
> -                                      const char **endp,
> -                                      const mon_cmd_t *cmd)
> -{
> -    const char *typestr;
> -    char *key;
> -    int c;
> -    const char *p = *endp;
> -    char buf[1024];
> -    QDict *qdict = qdict_new();
> -
> -    /* parse the parameters */
> -    typestr = cmd->args_type;
> -    for(;;) {
> -        typestr = key_get_info(typestr, &key);
> -        if (!typestr)
> -            break;
> -        c = *typestr;
> -        typestr++;
> -        switch(c) {
> -        case 'F':
> -        case 'B':
> -        case 's':
> -            {
> -                int ret;
> -
> -                while (qemu_isspace(*p))
> -                    p++;
> -                if (*typestr == '?') {
> -                    typestr++;
> -                    if (*p == '\0') {
> -                        /* no optional string: NULL argument */
> -                        break;
> -                    }
> -                }
> -                ret = get_str(buf, sizeof(buf), &p);
> -                if (ret < 0) {
> -                    switch(c) {
> -                    case 'F':
> -                        monitor_printf(mon, "%s: filename expected\n",
> -                                       cmd->name);
> -                        break;
> -                    case 'B':
> -                        monitor_printf(mon, "%s: block device name expected\n",
> -                                       cmd->name);
> -                        break;
> -                    default:
> -                        monitor_printf(mon, "%s: string expected\n", cmd->name);
> -                        break;
> -                    }
> -                    goto fail;
> -                }
> -                qdict_put_str(qdict, key, buf);
> -            }
> -            break;
> -        case 'O':
> -            {
> -                QemuOptsList *opts_list;
> -                QemuOpts *opts;
> -
> -                opts_list = qemu_find_opts(key);
> -                if (!opts_list || opts_list->desc->name) {
> -                    goto bad_type;
> -                }
> -                while (qemu_isspace(*p)) {
> -                    p++;
> -                }
> -                if (!*p)
> -                    break;
> -                if (get_str(buf, sizeof(buf), &p) < 0) {
> -                    goto fail;
> -                }
> -                opts = qemu_opts_parse_noisily(opts_list, buf, true);
> -                if (!opts) {
> -                    goto fail;
> -                }
> -                qemu_opts_to_qdict(opts, qdict);
> -                qemu_opts_del(opts);
> -            }
> -            break;
> -        case '/':
> -            {
> -                int count, format, size;
> -
> -                while (qemu_isspace(*p))
> -                    p++;
> -                if (*p == '/') {
> -                    /* format found */
> -                    p++;
> -                    count = 1;
> -                    if (qemu_isdigit(*p)) {
> -                        count = 0;
> -                        while (qemu_isdigit(*p)) {
> -                            count = count * 10 + (*p - '0');
> -                            p++;
> -                        }
> -                    }
> -                    size = -1;
> -                    format = -1;
> -                    for(;;) {
> -                        switch(*p) {
> -                        case 'o':
> -                        case 'd':
> -                        case 'u':
> -                        case 'x':
> -                        case 'i':
> -                        case 'c':
> -                            format = *p++;
> -                            break;
> -                        case 'b':
> -                            size = 1;
> -                            p++;
> -                            break;
> -                        case 'h':
> -                            size = 2;
> -                            p++;
> -                            break;
> -                        case 'w':
> -                            size = 4;
> -                            p++;
> -                            break;
> -                        case 'g':
> -                        case 'L':
> -                            size = 8;
> -                            p++;
> -                            break;
> -                        default:
> -                            goto next;
> -                        }
> -                    }
> -                next:
> -                    if (*p != '\0' && !qemu_isspace(*p)) {
> -                        monitor_printf(mon, "invalid char in format: '%c'\n",
> -                                       *p);
> -                        goto fail;
> -                    }
> -                    if (format < 0)
> -                        format = default_fmt_format;
> -                    if (format != 'i') {
> -                        /* for 'i', not specifying a size gives -1 as size */
> -                        if (size < 0)
> -                            size = default_fmt_size;
> -                        default_fmt_size = size;
> -                    }
> -                    default_fmt_format = format;
> -                } else {
> -                    count = 1;
> -                    format = default_fmt_format;
> -                    if (format != 'i') {
> -                        size = default_fmt_size;
> -                    } else {
> -                        size = -1;
> -                    }
> -                }
> -                qdict_put_int(qdict, "count", count);
> -                qdict_put_int(qdict, "format", format);
> -                qdict_put_int(qdict, "size", size);
> -            }
> -            break;
> -        case 'i':
> -        case 'l':
> -        case 'M':
> -            {
> -                int64_t val;
> -
> -                while (qemu_isspace(*p))
> -                    p++;
> -                if (*typestr == '?' || *typestr == '.') {
> -                    if (*typestr == '?') {
> -                        if (*p == '\0') {
> -                            typestr++;
> -                            break;
> -                        }
> -                    } else {
> -                        if (*p == '.') {
> -                            p++;
> -                            while (qemu_isspace(*p))
> -                                p++;
> -                        } else {
> -                            typestr++;
> -                            break;
> -                        }
> -                    }
> -                    typestr++;
> -                }
> -                if (get_expr(mon, &val, &p))
> -                    goto fail;
> -                /* Check if 'i' is greater than 32-bit */
> -                if ((c == 'i') && ((val >> 32) & 0xffffffff)) {
> -                    monitor_printf(mon, "\'%s\' has failed: ", cmd->name);
> -                    monitor_printf(mon, "integer is for 32-bit values\n");
> -                    goto fail;
> -                } else if (c == 'M') {
> -                    if (val < 0) {
> -                        monitor_printf(mon, "enter a positive value\n");
> -                        goto fail;
> -                    }
> -                    val *= MiB;
> -                }
> -                qdict_put_int(qdict, key, val);
> -            }
> -            break;
> -        case 'o':
> -            {
> -                int ret;
> -                uint64_t val;
> -                const char *end;
> -
> -                while (qemu_isspace(*p)) {
> -                    p++;
> -                }
> -                if (*typestr == '?') {
> -                    typestr++;
> -                    if (*p == '\0') {
> -                        break;
> -                    }
> -                }
> -                ret = qemu_strtosz_MiB(p, &end, &val);
> -                if (ret < 0 || val > INT64_MAX) {
> -                    monitor_printf(mon, "invalid size\n");
> -                    goto fail;
> -                }
> -                qdict_put_int(qdict, key, val);
> -                p = end;
> -            }
> -            break;
> -        case 'T':
> -            {
> -                double val;
> -
> -                while (qemu_isspace(*p))
> -                    p++;
> -                if (*typestr == '?') {
> -                    typestr++;
> -                    if (*p == '\0') {
> -                        break;
> -                    }
> -                }
> -                if (get_double(mon, &val, &p) < 0) {
> -                    goto fail;
> -                }
> -                if (p[0] && p[1] == 's') {
> -                    switch (*p) {
> -                    case 'm':
> -                        val /= 1e3; p += 2; break;
> -                    case 'u':
> -                        val /= 1e6; p += 2; break;
> -                    case 'n':
> -                        val /= 1e9; p += 2; break;
> -                    }
> -                }
> -                if (*p && !qemu_isspace(*p)) {
> -                    monitor_printf(mon, "Unknown unit suffix\n");
> -                    goto fail;
> -                }
> -                qdict_put(qdict, key, qnum_from_double(val));
> -            }
> -            break;
> -        case 'b':
> -            {
> -                const char *beg;
> -                bool val;
> -
> -                while (qemu_isspace(*p)) {
> -                    p++;
> -                }
> -                beg = p;
> -                while (qemu_isgraph(*p)) {
> -                    p++;
> -                }
> -                if (p - beg == 2 && !memcmp(beg, "on", p - beg)) {
> -                    val = true;
> -                } else if (p - beg == 3 && !memcmp(beg, "off", p - beg)) {
> -                    val = false;
> -                } else {
> -                    monitor_printf(mon, "Expected 'on' or 'off'\n");
> -                    goto fail;
> -                }
> -                qdict_put_bool(qdict, key, val);
> -            }
> -            break;
> -        case '-':
> -            {
> -                const char *tmp = p;
> -                int skip_key = 0;
> -                /* option */
> -
> -                c = *typestr++;
> -                if (c == '\0')
> -                    goto bad_type;
> -                while (qemu_isspace(*p))
> -                    p++;
> -                if (*p == '-') {
> -                    p++;
> -                    if(c != *p) {
> -                        if(!is_valid_option(p, typestr)) {
> -                  
> -                            monitor_printf(mon, "%s: unsupported option -%c\n",
> -                                           cmd->name, *p);
> -                            goto fail;
> -                        } else {
> -                            skip_key = 1;
> -                        }
> -                    }
> -                    if(skip_key) {
> -                        p = tmp;
> -                    } else {
> -                        /* has option */
> -                        p++;
> -                        qdict_put_bool(qdict, key, true);
> -                    }
> -                }
> -            }
> -            break;
> -        case 'S':
> -            {
> -                /* package all remaining string */
> -                int len;
> -
> -                while (qemu_isspace(*p)) {
> -                    p++;
> -                }
> -                if (*typestr == '?') {
> -                    typestr++;
> -                    if (*p == '\0') {
> -                        /* no remaining string: NULL argument */
> -                        break;
> -                    }
> -                }
> -                len = strlen(p);
> -                if (len <= 0) {
> -                    monitor_printf(mon, "%s: string expected\n",
> -                                   cmd->name);
> -                    goto fail;
> -                }
> -                qdict_put_str(qdict, key, p);
> -                p += len;
> -            }
> -            break;
> -        default:
> -        bad_type:
> -            monitor_printf(mon, "%s: unknown type '%c'\n", cmd->name, c);
> -            goto fail;
> -        }
> -        g_free(key);
> -        key = NULL;
> -    }
> -    /* check that all arguments were parsed */
> -    while (qemu_isspace(*p))
> -        p++;
> -    if (*p != '\0') {
> -        monitor_printf(mon, "%s: extraneous characters at the end of line\n",
> -                       cmd->name);
> -        goto fail;
> -    }
> -
> -    return qdict;
> -
> -fail:
> -    qobject_unref(qdict);
> -    g_free(key);
> -    return NULL;
> -}
> -
> -static void handle_hmp_command(MonitorHMP *mon, const char *cmdline)
> -{
> -    QDict *qdict;
> -    const mon_cmd_t *cmd;
> -    const char *cmd_start = cmdline;
> -
> -    trace_handle_hmp_command(mon, cmdline);
> -
> -    cmd = monitor_parse_command(mon, cmdline, &cmdline, mon->cmd_table);
> -    if (!cmd) {
> -        return;
> -    }
> -
> -    qdict = monitor_parse_arguments(&mon->common, &cmdline, cmd);
> -    if (!qdict) {
> -        while (cmdline > cmd_start && qemu_isspace(cmdline[-1])) {
> -            cmdline--;
> -        }
> -        monitor_printf(&mon->common, "Try \"help %.*s\" for more information\n",
> -                       (int)(cmdline - cmd_start), cmd_start);
> -        return;
> -    }
> -
> -    cmd->cmd(&mon->common, qdict);
> -    qobject_unref(qdict);
> -}
> -
> -static void cmd_completion(MonitorHMP *mon, const char *name, const char *list)
> -{
> -    const char *p, *pstart;
> -    char cmd[128];
> -    int len;
> -
> -    p = list;
> -    for(;;) {
> -        pstart = p;
> -        p = qemu_strchrnul(p, '|');
> -        len = p - pstart;
> -        if (len > sizeof(cmd) - 2)
> -            len = sizeof(cmd) - 2;
> -        memcpy(cmd, pstart, len);
> -        cmd[len] = '\0';
> -        if (name[0] == '\0' || !strncmp(name, cmd, strlen(name))) {
> -            readline_add_completion(mon->rs, cmd);
> -        }
> -        if (*p == '\0')
> -            break;
> -        p++;
> -    }
> -}
> -
> -static void file_completion(MonitorHMP *mon, const char *input)
> -{
> -    DIR *ffs;
> -    struct dirent *d;
> -    char path[1024];
> -    char file[1024], file_prefix[1024];
> -    int input_path_len;
> -    const char *p;
> -
> -    p = strrchr(input, '/');
> -    if (!p) {
> -        input_path_len = 0;
> -        pstrcpy(file_prefix, sizeof(file_prefix), input);
> -        pstrcpy(path, sizeof(path), ".");
> -    } else {
> -        input_path_len = p - input + 1;
> -        memcpy(path, input, input_path_len);
> -        if (input_path_len > sizeof(path) - 1)
> -            input_path_len = sizeof(path) - 1;
> -        path[input_path_len] = '\0';
> -        pstrcpy(file_prefix, sizeof(file_prefix), p + 1);
> -    }
> -
> -    ffs = opendir(path);
> -    if (!ffs)
> -        return;
> -    for(;;) {
> -        struct stat sb;
> -        d = readdir(ffs);
> -        if (!d)
> -            break;
> -
> -        if (strcmp(d->d_name, ".") == 0 || strcmp(d->d_name, "..") == 0) {
> -            continue;
> -        }
> -
> -        if (strstart(d->d_name, file_prefix, NULL)) {
> -            memcpy(file, input, input_path_len);
> -            if (input_path_len < sizeof(file))
> -                pstrcpy(file + input_path_len, sizeof(file) - input_path_len,
> -                        d->d_name);
> -            /* stat the file to find out if it's a directory.
> -             * In that case add a slash to speed up typing long paths
> -             */
> -            if (stat(file, &sb) == 0 && S_ISDIR(sb.st_mode)) {
> -                pstrcat(file, sizeof(file), "/");
> -            }
> -            readline_add_completion(mon->rs, file);
> -        }
> -    }
> -    closedir(ffs);
> -}
> -
> -static const char *next_arg_type(const char *typestr)
> -{
> -    const char *p = strchr(typestr, ':');
> -    return (p != NULL ? ++p : typestr);
> -}
> -
>  static void add_completion_option(ReadLineState *rs, const char *str,
>                                    const char *option)
>  {
> @@ -3829,127 +2738,6 @@ void loadvm_completion(ReadLineState *rs, int nb_args, const char *str)
>      }
>  }
>  
> -static void monitor_find_completion_by_table(MonitorHMP *mon,
> -                                             const mon_cmd_t *cmd_table,
> -                                             char **args,
> -                                             int nb_args)
> -{
> -    const char *cmdname;
> -    int i;
> -    const char *ptype, *old_ptype, *str, *name;
> -    const mon_cmd_t *cmd;
> -    BlockBackend *blk = NULL;
> -
> -    if (nb_args <= 1) {
> -        /* command completion */
> -        if (nb_args == 0)
> -            cmdname = "";
> -        else
> -            cmdname = args[0];
> -        readline_set_completion_index(mon->rs, strlen(cmdname));
> -        for (cmd = cmd_table; cmd->name != NULL; cmd++) {
> -            if (!runstate_check(RUN_STATE_PRECONFIG) ||
> -                 cmd_can_preconfig(cmd)) {
> -                cmd_completion(mon, cmdname, cmd->name);
> -            }
> -        }
> -    } else {
> -        /* find the command */
> -        for (cmd = cmd_table; cmd->name != NULL; cmd++) {
> -            if (compare_cmd(args[0], cmd->name) &&
> -                (!runstate_check(RUN_STATE_PRECONFIG) ||
> -                 cmd_can_preconfig(cmd))) {
> -                break;
> -            }
> -        }
> -        if (!cmd->name) {
> -            return;
> -        }
> -
> -        if (cmd->sub_table) {
> -            /* do the job again */
> -            monitor_find_completion_by_table(mon, cmd->sub_table,
> -                                             &args[1], nb_args - 1);
> -            return;
> -        }
> -        if (cmd->command_completion) {
> -            cmd->command_completion(mon->rs, nb_args, args[nb_args - 1]);
> -            return;
> -        }
> -
> -        ptype = next_arg_type(cmd->args_type);
> -        for(i = 0; i < nb_args - 2; i++) {
> -            if (*ptype != '\0') {
> -                ptype = next_arg_type(ptype);
> -                while (*ptype == '?')
> -                    ptype = next_arg_type(ptype);
> -            }
> -        }
> -        str = args[nb_args - 1];
> -        old_ptype = NULL;
> -        while (*ptype == '-' && old_ptype != ptype) {
> -            old_ptype = ptype;
> -            ptype = next_arg_type(ptype);
> -        }
> -        switch(*ptype) {
> -        case 'F':
> -            /* file completion */
> -            readline_set_completion_index(mon->rs, strlen(str));
> -            file_completion(mon, str);
> -            break;
> -        case 'B':
> -            /* block device name completion */
> -            readline_set_completion_index(mon->rs, strlen(str));
> -            while ((blk = blk_next(blk)) != NULL) {
> -                name = blk_name(blk);
> -                if (str[0] == '\0' ||
> -                    !strncmp(name, str, strlen(str))) {
> -                    readline_add_completion(mon->rs, name);
> -                }
> -            }
> -            break;
> -        case 's':
> -        case 'S':
> -            if (!strcmp(cmd->name, "help|?")) {
> -                monitor_find_completion_by_table(mon, cmd_table,
> -                                                 &args[1], nb_args - 1);
> -            }
> -            break;
> -        default:
> -            break;
> -        }
> -    }
> -}
> -
> -static void monitor_find_completion(void *opaque,
> -                                    const char *cmdline)
> -{
> -    MonitorHMP *mon = opaque;
> -    char *args[MAX_ARGS];
> -    int nb_args, len;
> -
> -    /* 1. parse the cmdline */
> -    if (parse_cmdline(cmdline, &nb_args, args) < 0) {
> -        return;
> -    }
> -
> -    /* if the line ends with a space, it means we want to complete the
> -       next arg */
> -    len = strlen(cmdline);
> -    if (len > 0 && qemu_isspace(cmdline[len - 1])) {
> -        if (nb_args >= MAX_ARGS) {
> -            goto cleanup;
> -        }
> -        args[nb_args++] = g_strdup("");
> -    }
> -
> -    /* 2. auto complete according to args */
> -    monitor_find_completion_by_table(mon, mon->cmd_table, args, nb_args);
> -
> -cleanup:
> -    free_cmdline_args(args, nb_args);
> -}
> -
>  int monitor_can_read(void *opaque)
>  {
>      Monitor *mon = opaque;
> @@ -3957,28 +2745,6 @@ int monitor_can_read(void *opaque)
>      return !atomic_mb_read(&mon->suspend_cnt);
>  }
>  
> -static void monitor_read(void *opaque, const uint8_t *buf, int size)
> -{
> -    MonitorHMP *mon;
> -    Monitor *old_mon = cur_mon;
> -    int i;
> -
> -    cur_mon = opaque;
> -    mon = container_of(cur_mon, MonitorHMP, common);
> -
> -    if (mon->rs) {
> -        for (i = 0; i < size; i++)
> -            readline_handle_byte(mon->rs, buf[i]);
> -    } else {
> -        if (size == 0 || buf[size - 1] != 0)
> -            monitor_printf(cur_mon, "corrupted command\n");
> -        else
> -            handle_hmp_command(mon, (char *)buf);
> -    }
> -
> -    cur_mon = old_mon;
> -}
> -
>  static void monitor_command_cb(void *opaque, const char *cmdline,
>                                 void *readline_opaque)
>  {
> @@ -4043,58 +2809,6 @@ void monitor_resume(Monitor *mon)
>      trace_monitor_suspend(mon, -1);
>  }
>  
> -static void monitor_event(void *opaque, int event)
> -{
> -    Monitor *mon = opaque;
> -    MonitorHMP *hmp_mon = container_of(cur_mon, MonitorHMP, common);
> -
> -    switch (event) {
> -    case CHR_EVENT_MUX_IN:
> -        qemu_mutex_lock(&mon->mon_lock);
> -        mon->mux_out = 0;
> -        qemu_mutex_unlock(&mon->mon_lock);
> -        if (mon->reset_seen) {
> -            readline_restart(hmp_mon->rs);
> -            monitor_resume(mon);
> -            monitor_flush(mon);
> -        } else {
> -            atomic_mb_set(&mon->suspend_cnt, 0);
> -        }
> -        break;
> -
> -    case CHR_EVENT_MUX_OUT:
> -        if (mon->reset_seen) {
> -            if (atomic_mb_read(&mon->suspend_cnt) == 0) {
> -                monitor_printf(mon, "\n");
> -            }
> -            monitor_flush(mon);
> -            monitor_suspend(mon);
> -        } else {
> -            atomic_inc(&mon->suspend_cnt);
> -        }
> -        qemu_mutex_lock(&mon->mon_lock);
> -        mon->mux_out = 1;
> -        qemu_mutex_unlock(&mon->mon_lock);
> -        break;
> -
> -    case CHR_EVENT_OPENED:
> -        monitor_printf(mon, "QEMU %s monitor - type 'help' for more "
> -                       "information\n", QEMU_VERSION);
> -        if (!mon->mux_out) {
> -            readline_restart(hmp_mon->rs);
> -            readline_show_prompt(hmp_mon->rs);
> -        }
> -        mon->reset_seen = 1;
> -        mon_refcount++;
> -        break;
> -
> -    case CHR_EVENT_CLOSED:
> -        mon_refcount--;
> -        monitor_fdsets_cleanup();
> -        break;
> -    }
> -}
> -
>  static int
>  compare_mon_cmd(const void *a, const void *b)
>  {
> @@ -4137,25 +2851,6 @@ void monitor_init_globals(void)
>                                     NULL);
>  }
>  
> -/* These functions just adapt the readline interface in a typesafe way.  We
> - * could cast function pointers but that discards compiler checks.
> - */
> -static void GCC_FMT_ATTR(2, 3) monitor_readline_printf(void *opaque,
> -                                                       const char *fmt, ...)
> -{
> -    MonitorHMP *mon = opaque;
> -    va_list ap;
> -    va_start(ap, fmt);
> -    monitor_vprintf(&mon->common, fmt, ap);
> -    va_end(ap);
> -}
> -
> -static void monitor_readline_flush(void *opaque)
> -{
> -    MonitorHMP *mon = opaque;
> -    monitor_flush(&mon->common);
> -}
> -
>  /*
>   * Print to current monitor if we have one, else to stderr.
>   */
> @@ -4198,27 +2893,6 @@ void monitor_list_append(Monitor *mon)
>      }
>  }
>  
> -static void monitor_init_hmp(Chardev *chr, int flags)
> -{
> -    MonitorHMP *mon = g_malloc0(sizeof(*mon));
> -    bool use_readline = flags & MONITOR_USE_READLINE;
> -
> -    monitor_data_init_hmp(mon, flags, false);
> -    qemu_chr_fe_init(&mon->common.chr, chr, &error_abort);
> -
> -    if (use_readline) {
> -        mon->rs = readline_init(monitor_readline_printf,
> -                                monitor_readline_flush,
> -                                mon,
> -                                monitor_find_completion);
> -        monitor_read_command(mon, 0);
> -    }
> -
> -    qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read, monitor_read,
> -                             monitor_event, NULL, &mon->common, NULL, true);
> -    monitor_list_append(&mon->common);
> -}
> -
>  void monitor_init(Chardev *chr, int flags)
>  {
>      if (flags & MONITOR_USE_CONTROL) {
> diff --git a/monitor/Makefile.objs b/monitor/Makefile.objs
> index d04d58b583..48c73eed51 100644
> --- a/monitor/Makefile.objs
> +++ b/monitor/Makefile.objs
> @@ -1,2 +1,2 @@
>  obj-y += misc.o
> -common-obj-y += qmp.o
> +common-obj-y += qmp.o hmp.o
> -- 
> 2.20.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

