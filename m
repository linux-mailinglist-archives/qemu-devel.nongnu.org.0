Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D88B602A1C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 13:28:29 +0200 (CEST)
Received: from localhost ([::1]:56836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okklo-0007bD-0q
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 07:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okka6-0000qN-8s
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 07:16:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54361)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1okkZx-00056f-2T
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 07:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666091432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vunsSPnFH7+WRxUxL/h09qP+fwg4slPVFoUS6UXNaQc=;
 b=U8rKqJqU3gopLzchmuTwlm5J5X5ggFXBnNcwSTYz43JqmsESk5LR5sep6Kb0183WJY0epm
 RKVLM1REuj44au6VGrtztI1Bv7a3VR/4gtUZPNmqcNScuA3+37r5j4M7ZZD9Di5CnX913D
 srw3ljLtrIDl+WmHqGBLd5qtIg7l5xo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-zS15Wh68PbyAyYRSgNhL9A-1; Tue, 18 Oct 2022 07:10:31 -0400
X-MC-Unique: zS15Wh68PbyAyYRSgNhL9A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F38C8101A528;
 Tue, 18 Oct 2022 11:10:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A82CE409AE3;
 Tue, 18 Oct 2022 11:10:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6265621E691D; Tue, 18 Oct 2022 13:10:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,  qemu-devel@nongnu.org,
 michael.roth@amd.com,  jsnow@redhat.com,  eblake@redhat.com
Subject: Re: [PATCH v2 15/28] qapi misc: Elide redundant has_FOO in generated C
References: <20221018062849.3420573-1-armbru@redhat.com>
 <20221018062849.3420573-16-armbru@redhat.com>
 <Y06AwNtiM1+bEKNo@work-vm>
Date: Tue, 18 Oct 2022 13:10:29 +0200
In-Reply-To: <Y06AwNtiM1+bEKNo@work-vm> (David Alan Gilbert's message of "Tue, 
 18 Oct 2022 11:32:32 +0100")
Message-ID: <87v8ohl74q.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> The has_FOO for pointer-valued FOO are redundant, except for arrays.
>> They are also a nuisance to work with.  Recent commit "qapi: Start to
>> elide redundant has_FOO in generated C" provided the means to elide
>> them step by step.  This is the step for qapi/misc.json.
>> 
>> Said commit explains the transformation in more detail.  The invariant
>> violations mentioned there do not occur here.
>> 
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  include/monitor/monitor.h |  3 +--
>>  monitor/hmp-cmds.c        |  2 +-
>>  monitor/misc.c            | 19 +++++--------------
>>  monitor/qmp-cmds.c        |  1 -
>>  softmmu/vl.c              |  2 +-
>>  util/qemu-config.c        | 17 +++++------------
>>  scripts/qapi/schema.py    |  1 -
>>  7 files changed, 13 insertions(+), 32 deletions(-)
>> 
>> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
>> index 737e750670..1e6f4c9bd7 100644
>> --- a/include/monitor/monitor.h
>> +++ b/include/monitor/monitor.h
>> @@ -46,8 +46,7 @@ int monitor_read_password(MonitorHMP *mon, ReadLineFunc *readline_func,
>>                            void *opaque);
>>  
>>  AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
>> -                                bool has_opaque, const char *opaque,
>> -                                Error **errp);
>> +                                const char *opaque, Error **errp);
>>  int monitor_fdset_dup_fd_add(int64_t fdset_id, int flags);
>>  void monitor_fdset_dup_fd_remove(int dup_fd);
>>  int64_t monitor_fdset_dup_fd_find(int dup_fd);
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 8077ed82c9..63baf3f8c6 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -104,7 +104,7 @@ void hmp_info_name(Monitor *mon, const QDict *qdict)
>>      NameInfo *info;
>>  
>>      info = qmp_query_name(NULL);
>> -    if (info->has_name) {
>> +    if (info->name) {
>>          monitor_printf(mon, "%s\n", info->name);
>>      }
>>      qapi_free_NameInfo(info);
>> diff --git a/monitor/misc.c b/monitor/misc.c
>> index a51f0996cb..2663007dbc 100644
>> --- a/monitor/misc.c
>> +++ b/monitor/misc.c
>> @@ -1131,7 +1131,7 @@ void monitor_fdsets_cleanup(void)
>>      }
>>  }
>>  
>> -AddfdInfo *qmp_add_fd(bool has_fdset_id, int64_t fdset_id, bool has_opaque,
>> +AddfdInfo *qmp_add_fd(bool has_fdset_id, int64_t fdset_id,
>>                        const char *opaque, Error **errp)
>>  {
>>      int fd;
>> @@ -1144,8 +1144,7 @@ AddfdInfo *qmp_add_fd(bool has_fdset_id, int64_t fdset_id, bool has_opaque,
>>          goto error;
>>      }
>>  
>> -    fdinfo = monitor_fdset_add_fd(fd, has_fdset_id, fdset_id,
>> -                                  has_opaque, opaque, errp);
>> +    fdinfo = monitor_fdset_add_fd(fd, has_fdset_id, fdset_id, opaque, errp);
>>      if (fdinfo) {
>>          return fdinfo;
>>      }
>> @@ -1213,12 +1212,7 @@ FdsetInfoList *qmp_query_fdsets(Error **errp)
>>  
>>              fdsetfd_info = g_malloc0(sizeof(*fdsetfd_info));
>>              fdsetfd_info->fd = mon_fdset_fd->fd;
>> -            if (mon_fdset_fd->opaque) {
>> -                fdsetfd_info->has_opaque = true;
>> -                fdsetfd_info->opaque = g_strdup(mon_fdset_fd->opaque);
>> -            } else {
>> -                fdsetfd_info->has_opaque = false;
>> -            }
>> +            fdsetfd_info->opaque = g_strdup(mon_fdset_fd->opaque);
>>  
>>              QAPI_LIST_PREPEND(fdset_info->fds, fdsetfd_info);
>>          }
>> @@ -1230,8 +1224,7 @@ FdsetInfoList *qmp_query_fdsets(Error **errp)
>>  }
>>  
>>  AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
>> -                                bool has_opaque, const char *opaque,
>> -                                Error **errp)
>> +                                const char *opaque, Error **errp)
>>  {
>>      MonFdset *mon_fdset = NULL;
>>      MonFdsetFd *mon_fdset_fd;
>> @@ -1299,9 +1292,7 @@ AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
>>      mon_fdset_fd = g_malloc0(sizeof(*mon_fdset_fd));
>>      mon_fdset_fd->fd = fd;
>>      mon_fdset_fd->removed = false;
>> -    if (has_opaque) {
>> -        mon_fdset_fd->opaque = g_strdup(opaque);
>> -    }
>> +    mon_fdset_fd->opaque = g_strdup(opaque);
>>      QLIST_INSERT_HEAD(&mon_fdset->fds, mon_fdset_fd, next);
>>  
>>      fdinfo = g_malloc0(sizeof(*fdinfo));
>> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
>> index 81c8fdadf8..2a0c919472 100644
>> --- a/monitor/qmp-cmds.c
>> +++ b/monitor/qmp-cmds.c
>> @@ -51,7 +51,6 @@ NameInfo *qmp_query_name(Error **errp)
>>      NameInfo *info = g_malloc0(sizeof(*info));
>>  
>>      if (qemu_name) {
>> -        info->has_name = true;
>>          info->name = g_strdup(qemu_name);
>>      }
>
> I think you can lose the if there and just always do the strdup.

Yes, that's better.

>>  
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index b464da25bc..e044979dfc 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -611,7 +611,7 @@ static int parse_add_fd(void *opaque, QemuOpts *opts, Error **errp)
>>      }
>>  
>>      /* add the duplicate fd, and optionally the opaque string, to the fd set */
>> -    fdinfo = monitor_fdset_add_fd(dupfd, true, fdset_id, !!fd_opaque, fd_opaque,
>> +    fdinfo = monitor_fdset_add_fd(dupfd, true, fdset_id, fd_opaque,
>>                                    &error_abort);
>>      g_free(fdinfo);
>>  
>> diff --git a/util/qemu-config.c b/util/qemu-config.c
>> index 5325f6bf80..95f61fc883 100644
>> --- a/util/qemu-config.c
>> +++ b/util/qemu-config.c
>> @@ -80,14 +80,8 @@ static CommandLineParameterInfoList *query_option_descs(const QemuOptDesc *desc)
>>              break;
>>          }
>>  
>> -        if (desc[i].help) {
>> -            info->has_help = true;
>> -            info->help = g_strdup(desc[i].help);
>> -        }
>> -        if (desc[i].def_value_str) {
>> -            info->has_q_default = true;
>> -            info->q_default = g_strdup(desc[i].def_value_str);
>> -        }
>> +        info->help = g_strdup(desc[i].help);
>> +        info->q_default = g_strdup(desc[i].def_value_str);
>>  
>>          QAPI_LIST_PREPEND(param_list, info);
>>      }
>> @@ -245,8 +239,7 @@ static QemuOptsList machine_opts = {
>>      }
>>  };
>>  
>> -CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
>> -                                                          const char *option,
>> +CommandLineOptionInfoList *qmp_query_command_line_options(const char *option,
>>                                                            Error **errp)
>>  {
>>      CommandLineOptionInfoList *conf_list = NULL;
>> @@ -254,7 +247,7 @@ CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
>>      int i;
>>  
>>      for (i = 0; vm_config_groups[i] != NULL; i++) {
>> -        if (!has_option || !strcmp(option, vm_config_groups[i]->name)) {
>> +        if (!option || !strcmp(option, vm_config_groups[i]->name)) {
>
> I think that can be g_strcmp0 if you can convince yourself ->name is
> non-null

vm_config_groups[i] must not be null.

However, replacing the whole condition by !g_strcmp0() would be wrong:

    option                             |  null   ->name  neither
    -----------------------------------+------------------------
    !option || !strcmp(option, ->name) |  true     true    false
    g_strcmp0(option, ->name)          | false     true    false

>>              info = g_malloc0(sizeof(*info));
>>              info->option = g_strdup(vm_config_groups[i]->name);
>>              if (!strcmp("drive", vm_config_groups[i]->name)) {
>> @@ -267,7 +260,7 @@ CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
>>          }
>>      }
>>  
>> -    if (!has_option || !strcmp(option, "machine")) {
>> +    if (!option || !strcmp(option, "machine")) {
>
> g_strcmp0(option, "machine")

Likewise.

>>          info = g_malloc0(sizeof(*info));
>>          info->option = g_strdup("machine");
>>          info->parameters = query_option_descs(machine_opts.desc);
>> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
>> index ad5b665212..a34e25fdd7 100644
>> --- a/scripts/qapi/schema.py
>> +++ b/scripts/qapi/schema.py
>> @@ -759,7 +759,6 @@ def need_has(self):
>>          assert self.type
>>          # Temporary hack to support dropping the has_FOO in reviewable chunks
>>          opt_out = [
>> -            'qapi/misc.json',
>>              'qapi/net.json',
>>              'qapi/pci.json',
>>              'qapi/qdev.json',
>> -- 
>> 2.37.2
>
> Still,
>
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks!


