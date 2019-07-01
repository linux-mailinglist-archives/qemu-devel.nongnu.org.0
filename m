Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7F345769
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 10:24:47 +0200 (CEST)
Received: from localhost ([::1]:49249 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbhVs-0000eC-0d
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 04:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53737)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hbhV1-0000Aq-I9
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 04:23:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hbhUz-0005vx-Pm
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 04:23:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48994)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hbhUw-0005qK-5T; Fri, 14 Jun 2019 04:23:46 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0EBF381F0F;
 Fri, 14 Jun 2019 08:23:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
 [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A73219833;
 Fri, 14 Jun 2019 08:23:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2208B11386A6; Fri, 14 Jun 2019 10:23:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <20190613153405.24769-1-kwolf@redhat.com>
 <20190613153405.24769-12-kwolf@redhat.com>
Date: Fri, 14 Jun 2019 10:23:38 +0200
In-Reply-To: <20190613153405.24769-12-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 13 Jun 2019 17:34:01 +0200")
Message-ID: <87y324fud1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Fri, 14 Jun 2019 08:23:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 11/15] monitor: Split out monitor/hmp.c
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Move HMP infrastructure from monitor/misc.c to monitor/hmp.c. This is
> code that can be shared for all targets, so compile it only once.
>
> The amount of function and particularly extern variables in
> monitor_int.h is probably a bit larger than it needs to be, but this way
> no non-trivial code modifications are needed. The interfaces between HMP
> and the monitor core can be cleaned up later.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
[...]
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> new file mode 100644
> index 0000000000..3621b195ed
> --- /dev/null
> +++ b/monitor/hmp.c
> @@ -0,0 +1,1415 @@
[...]
> +static int64_t expr_unary(Monitor *mon)
> +{
> +    int64_t n;
> +    char *p;
> +    int ret;
> +
> +    switch (*pch) {
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
> +        if (*pch == '\0') {
> +            expr_error(mon, "character constant expected");
> +        }
> +        n = *pch;
> +        pch++;
> +        if (*pch != '\'') {
> +            expr_error(mon, "missing terminating \' character");
> +        }
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
> +                if ((q - buf) < sizeof(buf) - 1) {
> +                    *q++ = *pch;
> +                }
> +                pch++;
> +            }
> +            while (qemu_isspace(*pch)) {
> +                pch++;
> +            }
> +            *q = 0;
> +            ret = get_monitor_def(&reg, buf);
> +            if (ret < 0) {
> +                expr_error(mon, "unknown register");
> +            }
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

checkpatch.pl gripes:

    ERROR: consider using qemu_strtoull in preference to strtoull


Let's add a TODO comment.  

> +        if (errno == ERANGE) {
> +            expr_error(mon, "number too large");
> +        }
> +        if (pch == p) {
> +            expr_error(mon, "invalid char '%c' in expression", *p);
> +        }
> +        pch = p;
> +        while (qemu_isspace(*pch)) {
> +            pch++;
> +        }
> +        break;
> +    }
> +    return n;
> +}
[...]
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
> +     * next arg */

checkpatch.pl again:

    WARNING: Block comments use a leading /* on a separate line
    WARNING: Block comments use a trailing */ on a separate line

Can touch up in my tree.

> +    len = strlen(cmdline);
> +    if (len > 0 && qemu_isspace(cmdline[len - 1])) {
> +        if (nb_args >= MAX_ARGS) {
> +            goto cleanup;
> +        }
> +        args[nb_args++] = g_strdup("");
> +    }
> +
> +    /* 2. auto complete according to args */
> +    monitor_find_completion_by_table(mon, hmp_cmds, args, nb_args);
> +
> +cleanup:
> +    free_cmdline_args(args, nb_args);
> +}
[...]
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 368b8297d4..c8289959c0 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
[...]
> @@ -612,245 +580,27 @@ out:
>      return output;
>  }
>  
> -static int compare_cmd(const char *name, const char *list)
> +/**
> + * Is @name in the '|' separated list of names @list?
> + */
> +int hmp_compare_cmd(const char *name, const char *list)
>  {
>      const char *p, *pstart;
>      int len;
>      len = strlen(name);
>      p = list;
> -    for(;;) {
> +    for (;;) {
>          pstart = p;
>          p = qemu_strchrnul(p, '|');
> -        if ((p - pstart) == len && !memcmp(pstart, name, len))
> +        if ((p - pstart) == len && !memcmp(pstart, name, len)) {
>              return 1;

The diff gets confusing here.  The function remains unchanged.  Good.

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
>          }
>          if (*p == '\0') {
>              break;
>          }
> -        if (nb_args >= MAX_ARGS) {
> -            goto fail;
> -        }
> -        ret = get_str(buf, sizeof(buf), &p);
> -        if (ret < 0) {
> -            goto fail;
> -        }
> -        args[nb_args] = g_strdup(buf);
> -        nb_args++;
> +        p++;
>      }
> -    *pnb_args = nb_args;
>      return 0;
> -
> - fail:
> -    free_cmdline_args(args, nb_args);
> -    return -1;
> -}
> -
> -/*
> - * Can command @cmd be executed in preconfig state?
> - */
> -static bool cmd_can_preconfig(const HMPCommand *cmd)
> -{
> -    if (!cmd->flags) {
> -        return false;
> -    }
> -
> -    return strchr(cmd->flags, 'p');
> -}
> -
> -static void help_cmd_dump_one(Monitor *mon,
> -                              const HMPCommand *cmd,
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
> -static void help_cmd_dump(Monitor *mon, const HMPCommand *cmds,
> -                          char **args, int nb_args, int arg_index)
> -{
> -    const HMPCommand *cmd;
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
> -    help_cmd_dump(mon, hmp_cmds, args, nb_args, 0);
> -
> -    free_cmdline_args(args, nb_args);
>  }
[...]

Reviewed-by: Markus Armbruster <armbru@redhat.com>

