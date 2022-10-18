Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F6A602981
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 12:42:20 +0200 (CEST)
Received: from localhost ([::1]:47908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okk36-000376-4l
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 06:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1okjtq-00077J-BX
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:32:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1okjto-000694-7a
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666089158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0AIMDKVyXHbqUnhcgOGdNhaH86fedN8l1V4SuFmVERg=;
 b=SV/Vn1V4LK/AHTTUPqCSfcX3A3sT3cV1jYzGShkus0QHFxbWKLS3ovKxmgywzIVBxg24J/
 G1cDLc9GDosYufh+A51cIOnKHolwlQHlhjLOMZLDNqZcy4iSpL6SqM7IXF0gnYnCXlzz14
 NJDtZ9ktNEpmii3lMPRUABLONTeyNk8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-300-fLTOs9esMqeN5NGBVD-_EA-1; Tue, 18 Oct 2022 06:32:37 -0400
X-MC-Unique: fLTOs9esMqeN5NGBVD-_EA-1
Received: by mail-wm1-f71.google.com with SMTP id
 p42-20020a05600c1daa00b003c6ee394f0dso5932896wms.5
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 03:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0AIMDKVyXHbqUnhcgOGdNhaH86fedN8l1V4SuFmVERg=;
 b=ugBCGnAR7Ir9Ulere3MJnsGyZ8xNuIiRFLs6fco4PuZ9KFSQzVyN5fAveoMWTFex+q
 CeuYVqOqeedbmgoHgt15/TWdm4P0FPyghcC1c1YO0324Y4AMFI0IH7oNMQiiH6MOqdOR
 y4WQ/QvaYibtBj8YHS1WYiHAD6y4ja5OkDh2Fp+jnzORmpP9gJ6gUgBq/ib4I+A94g7w
 wMoE+9HYGqWCPPeh5yw+VmWODjRjQh8vr34DgHXEkzuQmjz+QY98cnf5VdWNjhKJp3nT
 6+/zW6dqcbGYsCCcBaxVZjoSQcCwdPRnXqUXr9iiUQAI5W2Kd1bS+c1uPX0m0CH5q/WC
 7tRA==
X-Gm-Message-State: ACrzQf1Ctz9DsXChCUleza3RO3DxD//A8HqJLSISgZ4TXZyCgoAI34Ox
 kE/bcERnKhgrcuenD/hJ2zN7HCePL77G2QexfRxLNEW1I1T+6PGBWTPlKM2I12DE8rF9hWqsSow
 GaJNE5T8pJlZSifY=
X-Received: by 2002:a05:6000:184e:b0:22e:4612:496d with SMTP id
 c14-20020a056000184e00b0022e4612496dmr1448812wri.91.1666089155345; 
 Tue, 18 Oct 2022 03:32:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6QtnFDLRjCNlBaiRFbZVq5jQ0tmIUw6pTAi7R6aEgxRSz9VbbhO642Oq9fN4N1OQe7QW5iQQ==
X-Received: by 2002:a05:6000:184e:b0:22e:4612:496d with SMTP id
 c14-20020a056000184e00b0022e4612496dmr1448794wri.91.1666089155056; 
 Tue, 18 Oct 2022 03:32:35 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c001100b003c6bbe910fdsm21131777wmc.9.2022.10.18.03.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 03:32:34 -0700 (PDT)
Date: Tue, 18 Oct 2022 11:32:32 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com, jsnow@redhat.com,
 eblake@redhat.com
Subject: Re: [PATCH v2 15/28] qapi misc: Elide redundant has_FOO in generated C
Message-ID: <Y06AwNtiM1+bEKNo@work-vm>
References: <20221018062849.3420573-1-armbru@redhat.com>
 <20221018062849.3420573-16-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018062849.3420573-16-armbru@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qapi/misc.json.
> 
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
> 
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/monitor/monitor.h |  3 +--
>  monitor/hmp-cmds.c        |  2 +-
>  monitor/misc.c            | 19 +++++--------------
>  monitor/qmp-cmds.c        |  1 -
>  softmmu/vl.c              |  2 +-
>  util/qemu-config.c        | 17 +++++------------
>  scripts/qapi/schema.py    |  1 -
>  7 files changed, 13 insertions(+), 32 deletions(-)
> 
> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
> index 737e750670..1e6f4c9bd7 100644
> --- a/include/monitor/monitor.h
> +++ b/include/monitor/monitor.h
> @@ -46,8 +46,7 @@ int monitor_read_password(MonitorHMP *mon, ReadLineFunc *readline_func,
>                            void *opaque);
>  
>  AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
> -                                bool has_opaque, const char *opaque,
> -                                Error **errp);
> +                                const char *opaque, Error **errp);
>  int monitor_fdset_dup_fd_add(int64_t fdset_id, int flags);
>  void monitor_fdset_dup_fd_remove(int dup_fd);
>  int64_t monitor_fdset_dup_fd_find(int dup_fd);
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 8077ed82c9..63baf3f8c6 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -104,7 +104,7 @@ void hmp_info_name(Monitor *mon, const QDict *qdict)
>      NameInfo *info;
>  
>      info = qmp_query_name(NULL);
> -    if (info->has_name) {
> +    if (info->name) {
>          monitor_printf(mon, "%s\n", info->name);
>      }
>      qapi_free_NameInfo(info);
> diff --git a/monitor/misc.c b/monitor/misc.c
> index a51f0996cb..2663007dbc 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -1131,7 +1131,7 @@ void monitor_fdsets_cleanup(void)
>      }
>  }
>  
> -AddfdInfo *qmp_add_fd(bool has_fdset_id, int64_t fdset_id, bool has_opaque,
> +AddfdInfo *qmp_add_fd(bool has_fdset_id, int64_t fdset_id,
>                        const char *opaque, Error **errp)
>  {
>      int fd;
> @@ -1144,8 +1144,7 @@ AddfdInfo *qmp_add_fd(bool has_fdset_id, int64_t fdset_id, bool has_opaque,
>          goto error;
>      }
>  
> -    fdinfo = monitor_fdset_add_fd(fd, has_fdset_id, fdset_id,
> -                                  has_opaque, opaque, errp);
> +    fdinfo = monitor_fdset_add_fd(fd, has_fdset_id, fdset_id, opaque, errp);
>      if (fdinfo) {
>          return fdinfo;
>      }
> @@ -1213,12 +1212,7 @@ FdsetInfoList *qmp_query_fdsets(Error **errp)
>  
>              fdsetfd_info = g_malloc0(sizeof(*fdsetfd_info));
>              fdsetfd_info->fd = mon_fdset_fd->fd;
> -            if (mon_fdset_fd->opaque) {
> -                fdsetfd_info->has_opaque = true;
> -                fdsetfd_info->opaque = g_strdup(mon_fdset_fd->opaque);
> -            } else {
> -                fdsetfd_info->has_opaque = false;
> -            }
> +            fdsetfd_info->opaque = g_strdup(mon_fdset_fd->opaque);
>  
>              QAPI_LIST_PREPEND(fdset_info->fds, fdsetfd_info);
>          }
> @@ -1230,8 +1224,7 @@ FdsetInfoList *qmp_query_fdsets(Error **errp)
>  }
>  
>  AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
> -                                bool has_opaque, const char *opaque,
> -                                Error **errp)
> +                                const char *opaque, Error **errp)
>  {
>      MonFdset *mon_fdset = NULL;
>      MonFdsetFd *mon_fdset_fd;
> @@ -1299,9 +1292,7 @@ AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
>      mon_fdset_fd = g_malloc0(sizeof(*mon_fdset_fd));
>      mon_fdset_fd->fd = fd;
>      mon_fdset_fd->removed = false;
> -    if (has_opaque) {
> -        mon_fdset_fd->opaque = g_strdup(opaque);
> -    }
> +    mon_fdset_fd->opaque = g_strdup(opaque);
>      QLIST_INSERT_HEAD(&mon_fdset->fds, mon_fdset_fd, next);
>  
>      fdinfo = g_malloc0(sizeof(*fdinfo));
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 81c8fdadf8..2a0c919472 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -51,7 +51,6 @@ NameInfo *qmp_query_name(Error **errp)
>      NameInfo *info = g_malloc0(sizeof(*info));
>  
>      if (qemu_name) {
> -        info->has_name = true;
>          info->name = g_strdup(qemu_name);
>      }

I think you can lose the if there and just always do the strdup.

>  
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index b464da25bc..e044979dfc 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -611,7 +611,7 @@ static int parse_add_fd(void *opaque, QemuOpts *opts, Error **errp)
>      }
>  
>      /* add the duplicate fd, and optionally the opaque string, to the fd set */
> -    fdinfo = monitor_fdset_add_fd(dupfd, true, fdset_id, !!fd_opaque, fd_opaque,
> +    fdinfo = monitor_fdset_add_fd(dupfd, true, fdset_id, fd_opaque,
>                                    &error_abort);
>      g_free(fdinfo);
>  
> diff --git a/util/qemu-config.c b/util/qemu-config.c
> index 5325f6bf80..95f61fc883 100644
> --- a/util/qemu-config.c
> +++ b/util/qemu-config.c
> @@ -80,14 +80,8 @@ static CommandLineParameterInfoList *query_option_descs(const QemuOptDesc *desc)
>              break;
>          }
>  
> -        if (desc[i].help) {
> -            info->has_help = true;
> -            info->help = g_strdup(desc[i].help);
> -        }
> -        if (desc[i].def_value_str) {
> -            info->has_q_default = true;
> -            info->q_default = g_strdup(desc[i].def_value_str);
> -        }
> +        info->help = g_strdup(desc[i].help);
> +        info->q_default = g_strdup(desc[i].def_value_str);
>  
>          QAPI_LIST_PREPEND(param_list, info);
>      }
> @@ -245,8 +239,7 @@ static QemuOptsList machine_opts = {
>      }
>  };
>  
> -CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
> -                                                          const char *option,
> +CommandLineOptionInfoList *qmp_query_command_line_options(const char *option,
>                                                            Error **errp)
>  {
>      CommandLineOptionInfoList *conf_list = NULL;
> @@ -254,7 +247,7 @@ CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
>      int i;
>  
>      for (i = 0; vm_config_groups[i] != NULL; i++) {
> -        if (!has_option || !strcmp(option, vm_config_groups[i]->name)) {
> +        if (!option || !strcmp(option, vm_config_groups[i]->name)) {

I think that can be g_strcmp0 if you can convince yourself ->name is
non-null

>              info = g_malloc0(sizeof(*info));
>              info->option = g_strdup(vm_config_groups[i]->name);
>              if (!strcmp("drive", vm_config_groups[i]->name)) {
> @@ -267,7 +260,7 @@ CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
>          }
>      }
>  
> -    if (!has_option || !strcmp(option, "machine")) {
> +    if (!option || !strcmp(option, "machine")) {

g_strcmp0(option, "machine")

>          info = g_malloc0(sizeof(*info));
>          info->option = g_strdup("machine");
>          info->parameters = query_option_descs(machine_opts.desc);
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index ad5b665212..a34e25fdd7 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -759,7 +759,6 @@ def need_has(self):
>          assert self.type
>          # Temporary hack to support dropping the has_FOO in reviewable chunks
>          opt_out = [
> -            'qapi/misc.json',
>              'qapi/net.json',
>              'qapi/pci.json',
>              'qapi/qdev.json',
> -- 
> 2.37.2

Still,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


