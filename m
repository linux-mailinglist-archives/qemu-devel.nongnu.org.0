Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D685877AA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 09:16:58 +0200 (CEST)
Received: from localhost ([::1]:44808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIm9B-0006lD-LU
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 03:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIm5L-00048r-KF
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:12:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIm5H-0001LJ-Pw
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659424374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MHFl283LnD2RcEw5G/oIOaVCbnuM2Nzgkfvr8MVvbCk=;
 b=N7khOLCf8kGVZwnSe2/Wur+EfLm8F2DTVG4QkaTotSnkmPsFVLWJf/szDu/zEZ6xnMCQaR
 oVSHmDiBYF7Rnf1i9BESQHM6AYJIHHHl0f7j74sZE8DKHjiErfxaYNIaRk5KUjhTPcf08L
 eDmpJwSWbDlpjExyDS1xuW09E/11mWs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-7DLjBpjpOP2SZdu1Hcz6qg-1; Tue, 02 Aug 2022 03:12:51 -0400
X-MC-Unique: 7DLjBpjpOP2SZdu1Hcz6qg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 954E6811E76;
 Tue,  2 Aug 2022 07:12:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 539C640CF916;
 Tue,  2 Aug 2022 07:12:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3092021E6930; Tue,  2 Aug 2022 09:12:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Hogan Wang <hogan.wang@huawei.com>
Cc: <kwolf@redhat.com>,  <berrange@redhat.com>,  <armbru@redhat.com>,
 <marcandre.lureau@redhat.com>,  <qemu-devel@nongnu.org>,
 <wangxinxin.wang@huawei.com>
Subject: Re: [PATCH v5 2/3] job: introduce dump guest memory job
References: <20220802025305.3452-1-hogan.wang@huawei.com>
 <20220802025305.3452-2-hogan.wang@huawei.com>
Date: Tue, 02 Aug 2022 09:12:50 +0200
In-Reply-To: <20220802025305.3452-2-hogan.wang@huawei.com> (Hogan Wang's
 message of "Tue, 2 Aug 2022 10:53:04 +0800")
Message-ID: <87fsif9kzx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
>  dump/dump-hmp-cmds.c |  7 ++++---
>  dump/dump.c          |  1 +
>  qapi/dump.json       | 11 +++++++++--
>  qapi/job.json        |  5 ++++-
>  4 files changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/dump/dump-hmp-cmds.c b/dump/dump-hmp-cmds.c
> index e5053b04cd..a77f31fd15 100644
> --- a/dump/dump-hmp-cmds.c
> +++ b/dump/dump-hmp-cmds.c
> @@ -21,6 +21,7 @@ void hmp_dump_guest_memory(Monitor *mon, const QDict *qdict)
>      bool lzo = qdict_get_try_bool(qdict, "lzo", false);
>      bool snappy = qdict_get_try_bool(qdict, "snappy", false);
>      const char *file = qdict_get_str(qdict, "filename");
> +    const char *job_id = qdict_get_str(qdict, "job-id");
>      bool has_begin = qdict_haskey(qdict, "begin");
>      bool has_length = qdict_haskey(qdict, "length");
>      bool has_detach = qdict_haskey(qdict, "detach");
> @@ -63,9 +64,9 @@ void hmp_dump_guest_memory(Monitor *mon, const QDict *qdict)
>      }
>  
>      prot = g_strconcat("file:", file, NULL);
> -
> -    qmp_dump_guest_memory(paging, prot, true, detach, has_begin, begin,
> -                          has_length, length, true, dump_format, &err);
> +    qmp_dump_guest_memory(paging, prot, !!job_id, job_id, true,
> +                          detach, has_begin, begin, has_length,
> +                          length, true, dump_format, &err);
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
> index 90859c5483..ca3bd720c6 100644
> --- a/qapi/dump.json
> +++ b/qapi/dump.json
> @@ -59,9 +59,15 @@
>  #            2. fd: the protocol starts with "fd:", and the following string
>  #               is the fd's name.
>  #
> +# @job-id: identifier for the newly-created memory dump job. If you want to
> +#          compatible with legacy dumping process, @job-id should omitted.
> +#          If @job-id specified, gain the ability to monitor and control dump
> +#          task with query-job, job-cancel, etc.(Since 7.2).

Space before "(Since 7.2)", please.



> +#
>  # @detach: if true, QMP will return immediately rather than
>  #          waiting for the dump to finish. The user can track progress
> -#          using "query-dump". (since 2.6).
> +#          using "query-dump". (since 2.6). If @job-id specified, @detach
> +#          argument value will be ignored (Since 7.2).

I think @detach should be rejected then.

>  #
>  # @begin: if specified, the starting physical address.
>  #
> @@ -88,7 +94,8 @@
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

I'd like to hear Kevin's opinion on the alternatives I sketched
yesterday in reply to his question regarding v1.


