Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F075586B8E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 15:06:50 +0200 (CEST)
Received: from localhost ([::1]:46970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIV8C-0005od-UE
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 09:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIV3e-0002VU-Nb
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 09:02:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIV3Z-0005eV-NO
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 09:02:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659358919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RvrCxNBD80crSOZBmSpSF8xvJaOBHKWv1Z3CMR4ABt8=;
 b=cWCCW344tJ+zy8Zz4qup8ROnTq4Gdb5oqKLJiPIjBYBJnvhGKYc0r6lYB3K5vR8lswM0fu
 jkixVaV0CuRVr5rGZFpJqaJ1jvlw7EjZh40FbF6+jTS/5uRY9XQ1Z1V4tY4bpO4g3nfFPE
 Rnpfb/QIekbkywxa1lyaVLRxBdwa3GI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-qjAQn2tFOAiS_0lyEimR8w-1; Mon, 01 Aug 2022 09:01:58 -0400
X-MC-Unique: qjAQn2tFOAiS_0lyEimR8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EFD038173C3;
 Mon,  1 Aug 2022 13:01:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8C6F1121315;
 Mon,  1 Aug 2022 13:01:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 797DB21E6930; Mon,  1 Aug 2022 15:01:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Hogan Wang <hogan.wang@huawei.com>
Cc: <kwolf@redhat.com>,  <berrange@redhat.com>,
 <marcandre.lureau@redhat.com>,  <qemu-devel@nongnu.org>,
 <wangxinxin.wang@huawei.com>
Subject: Re: [PATCH v4 2/3] job: introduce dump guest memory job
References: <20220801080722.3318-1-hogan.wang@huawei.com>
 <20220801080722.3318-2-hogan.wang@huawei.com>
Date: Mon, 01 Aug 2022 15:01:56 +0200
In-Reply-To: <20220801080722.3318-2-hogan.wang@huawei.com> (Hogan Wang's
 message of "Mon, 1 Aug 2022 16:07:21 +0800")
Message-ID: <87o7x4dsmz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hogan Wang <hogan.wang@huawei.com> writes:

> There's no way to cancel the current executing dump process, lead to the
> virtual machine manager daemon((e.g. libvirtd) cannot restore the dump
> job after daemon restart.
>
> Introduce dump guest memory job type, and add an optional 'job-id'
> argument for dump-guest-memory QMP to make use of jobs framework.
>
> Signed-off-by: Hogan Wang <hogan.wang@huawei.com>
> ---
>  dump/dump-hmp-cmds.c | 12 ++++++++++--
>  dump/dump.c          |  1 +
>  qapi/dump.json       |  6 +++++-
>  qapi/job.json        |  5 ++++-
>  4 files changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/dump/dump-hmp-cmds.c b/dump/dump-hmp-cmds.c
> index e5053b04cd..ba28a5e631 100644
> --- a/dump/dump-hmp-cmds.c
> +++ b/dump/dump-hmp-cmds.c
> @@ -24,9 +24,11 @@ void hmp_dump_guest_memory(Monitor *mon, const QDict *qdict)
>      bool has_begin = qdict_haskey(qdict, "begin");
>      bool has_length = qdict_haskey(qdict, "length");
>      bool has_detach = qdict_haskey(qdict, "detach");
> +    bool has_job_id = qdict_haskey(qdict, "job-id");
>      int64_t begin = 0;
>      int64_t length = 0;
>      bool detach = false;
> +    const char *job_id = NULL;
>      enum DumpGuestMemoryFormat dump_format = DUMP_GUEST_MEMORY_FORMAT_ELF;
>      char *prot;
>  
> @@ -62,10 +64,16 @@ void hmp_dump_guest_memory(Monitor *mon, const QDict *qdict)
>          detach = qdict_get_bool(qdict, "detach");
>      }
>  
> +    if (has_job_id) {
> +        job_id = qdict_get_str(qdict, "job-id");
> +    }
> +

Simpler:

       const char *job_id = qdict_get_try_str(qdict, "job-id");

>      prot = g_strconcat("file:", file, NULL);
>  
> -    qmp_dump_guest_memory(paging, prot, true, detach, has_begin, begin,
> -                          has_length, length, true, dump_format, &err);
> +    qmp_dump_guest_memory(paging, prot, has_job_id, job_id,

This becomes

       qmp_dump_guest_memory(paging, prot, !!job_id, job_id,

then.

> +                          true, detach, has_begin, begin,
> +                          has_length, length, true, dump_format,
> +                          &err);
>      hmp_handle_error(mon, err);
>      g_free(prot);
>  }
> diff --git a/dump/dump.c b/dump/dump.c
> index a57c580b12..cec9be30b4 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -1895,6 +1895,7 @@ DumpQueryResult *qmp_query_dump(Error **errp)
>  }
>  
>  void qmp_dump_guest_memory(bool paging, const char *file,
> +                           bool has_job_id, const char *job_id,
>                             bool has_detach, bool detach,
>                             bool has_begin, int64_t begin, bool has_length,
>                             int64_t length, bool has_format,
> diff --git a/qapi/dump.json b/qapi/dump.json
> index 90859c5483..d162a9f028 100644
> --- a/qapi/dump.json
> +++ b/qapi/dump.json
> @@ -59,6 +59,9 @@
>  #            2. fd: the protocol starts with "fd:", and the following string
>  #               is the fd's name.
>  #
> +# @job-id: identifier for the newly-created memory dump job. To be compatible
> +#          with legacy dump process, @job-id should omitted. (Since 7.2)
> +#

I think we need to describe things in more detail.

What are the behavioral differences between dumping with and without 
@job-id?

Why would you want to pass @job-id?  I figure it's to gain the ability
to monitor and control dump task with query-job, job-cancel, ...

>  # @detach: if true, QMP will return immediately rather than
>  #          waiting for the dump to finish. The user can track progress
>  #          using "query-dump". (since 2.6).

Hmm, does "detach": false make any sense when "job-id" is present?

Preexisting: @detach's default is undocumented.

> @@ -88,7 +91,8 @@
>  #
>  ##
>  { 'command': 'dump-guest-memory',
> -  'data': { 'paging': 'bool', 'protocol': 'str', '*detach': 'bool',
> +  'data': { 'paging': 'bool', 'protocol': 'str',
> +            '*job-id': 'str', '*detach': 'bool',
>              '*begin': 'int', '*length': 'int',
>              '*format': 'DumpGuestMemoryFormat'} }
>  
> diff --git a/qapi/job.json b/qapi/job.json
> index d5f84e9615..e14d2290a5 100644
> --- a/qapi/job.json
> +++ b/qapi/job.json
> @@ -28,11 +28,14 @@
>  #
>  # @snapshot-delete: snapshot delete job type, see "snapshot-delete" (since 6.0)
>  #
> +# @dump-guest-memory: dump guest memory job type, see "dump-guest-memory" (since 7.2)
> +#
>  # Since: 1.7
>  ##
>  { 'enum': 'JobType',
>    'data': ['commit', 'stream', 'mirror', 'backup', 'create', 'amend',
> -           'snapshot-load', 'snapshot-save', 'snapshot-delete'] }
> +           'snapshot-load', 'snapshot-save', 'snapshot-delete',
> +           'dump-guest-memory'] }
>  
>  ##
>  # @JobStatus:


