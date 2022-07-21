Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8034B57C5FA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 10:16:13 +0200 (CEST)
Received: from localhost ([::1]:46386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oERLw-00057k-3W
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 04:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oERJt-0003ci-4Z
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 04:14:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oERJp-0003ge-QB
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 04:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658391240;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=01PG6uTOrUqDPjmhSNWLQBpfEjD6TJEt4jJ32eDgZbs=;
 b=b10fvpfP8gMCYp8VjbRg5bxS9dtyCOYNCn7zUab1h1AmgA78LofUc8WDqlcWcOmR09tV0V
 770TdEnhr74CgmPExCXyYe0Hp9OWytcdx3BfgRBpLy7l5in8Tw5zP+iHXtJvC0mu94pM/x
 wFizMT2cfFRUp8vWplI9jDbIy08qdEc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-WJXPPAToMD6dseukuZgtfg-1; Thu, 21 Jul 2022 04:13:57 -0400
X-MC-Unique: WJXPPAToMD6dseukuZgtfg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C444D8037AC;
 Thu, 21 Jul 2022 08:13:56 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D822F18ECB;
 Thu, 21 Jul 2022 08:13:55 +0000 (UTC)
Date: Thu, 21 Jul 2022 09:13:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Hogan Wang <hogan.wang@huawei.com>
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com,
 wangxinxin.wang@huawei.com
Subject: Re: [PATCH] dump: introduce dump-cancel QMP command
Message-ID: <YtkKwf7K6oev/3CP@redhat.com>
References: <20220721062118.2015-1-hogan.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220721062118.2015-1-hogan.wang@huawei.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 21, 2022 at 02:21:18PM +0800, Hogan Wang via wrote:
> There's no way to cancel the current executing dump process, lead to the
> virtual machine manager daemon((e.g. libvirtd) cannot restore the dump
> job after daemon restart.
> 
> Add the 'cancelling' and 'cancelled' dump states.
> 
> Use 'dump-cancel' qmp command Set the dump state as 'cancelling'.
> The dump process check the 'cancelling' state and break loops. 
> The 'cancelled' state mark the dump process cancelled success.

On the one hand this patch is fairly simple which is obviously
desirable.

On the other hand though, this feels like it is further re-inventing
the jobs concept.

IMHO ideally the 'dump' command probably ought to get a 'job-id'
parameter, and integrate with the generic background jobs  framework.
This would unlock the ability to use existing commands like
'job-cancel', 'job-pause', 'job-resume', 'queyr-jobs' to interact
with it.

> 
> ---
>  dump/dump.c               | 38 ++++++++++++++++++++++++++++++++++++--
>  include/sysemu/runstate.h |  1 +
>  qapi/dump.json            | 21 ++++++++++++++++++++-
>  3 files changed, 57 insertions(+), 3 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 4d9658ffa2..a0ac85aa02 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -118,6 +118,10 @@ static int fd_write_vmcore(const void *buf, size_t size, void *opaque)
>      DumpState *s = opaque;
>      size_t written_size;
>  
> +    if (qemu_system_dump_cancelling()) {
> +        return -ECANCELED;
> +    }
> +
>      written_size = qemu_write_full(s->fd, buf, size);
>      if (written_size != size) {
>          return -errno;
> @@ -627,6 +631,10 @@ static void dump_iterate(DumpState *s, Error **errp)
>  
>      do {
>          block = s->next_block;
> +        if (qemu_system_dump_cancelling()) {
> +            error_setg(errp, "dump: job cancelled");
> +            return;
> +        }
>  
>          size = block->target_end - block->target_start;
>          if (s->has_filter) {
> @@ -1321,6 +1329,11 @@ static void write_dump_pages(DumpState *s, Error **errp)
>       * first page of page section
>       */
>      while (get_next_page(&block_iter, &pfn_iter, &buf, s)) {
> +        if (qemu_system_dump_cancelling()) {
> +            error_setg(errp, "dump: job cancelled");
> +            goto out;
> +        }
> +
>          /* check zero page */
>          if (buffer_is_zero(buf, s->dump_info.page_size)) {
>              ret = write_cache(&page_desc, &pd_zero, sizeof(PageDescriptor),
> @@ -1540,6 +1553,22 @@ bool qemu_system_dump_in_progress(void)
>      return (qatomic_read(&state->status) == DUMP_STATUS_ACTIVE);
>  }
>  
> +bool qemu_system_dump_cancelling(void)
> +{
> +    DumpState *state = &dump_state_global;
> +    return (qatomic_read(&state->status) == DUMP_STATUS_CANCELLING);
> +}
> +
> +void qmp_dump_cancel(Error **errp)
> +{
> +    DumpState *state = &dump_state_global;
> +    if (!qemu_system_dump_in_progress()) {
> +        return;
> +    }
> +    qatomic_set(&state->status, DUMP_STATUS_CANCELLING);
> +}
> +
> +
>  /* calculate total size of memory to be dumped (taking filter into
>   * acoount.) */
>  static int64_t dump_calculate_size(DumpState *s)
> @@ -1838,8 +1867,13 @@ static void dump_process(DumpState *s, Error **errp)
>  
>      /* make sure status is written after written_size updates */
>      smp_wmb();
> -    qatomic_set(&s->status,
> -               (*errp ? DUMP_STATUS_FAILED : DUMP_STATUS_COMPLETED));
> +    if (qemu_system_dump_cancelling()) {
> +        qatomic_set(&s->status, DUMP_STATUS_CANCELLED);
> +    } else if (*errp) {
> +        qatomic_set(&s->status, DUMP_STATUS_FAILED);
> +    } else {
> +        qatomic_set(&s->status, DUMP_STATUS_COMPLETED);
> +    }
>  
>      /* send DUMP_COMPLETED message (unconditionally) */
>      result = qmp_query_dump(NULL);
> diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
> index f3ed52548e..a36c1d43f6 100644
> --- a/include/sysemu/runstate.h
> +++ b/include/sysemu/runstate.h
> @@ -76,6 +76,7 @@ void qemu_system_reset(ShutdownCause reason);
>  void qemu_system_guest_panicked(GuestPanicInformation *info);
>  void qemu_system_guest_crashloaded(GuestPanicInformation *info);
>  bool qemu_system_dump_in_progress(void);
> +bool qemu_system_dump_cancelling(void);
>  
>  #endif
>  
> diff --git a/qapi/dump.json b/qapi/dump.json
> index 90859c5483..6dfbb6b7de 100644
> --- a/qapi/dump.json
> +++ b/qapi/dump.json
> @@ -108,7 +108,7 @@
>  # Since: 2.6
>  ##
>  { 'enum': 'DumpStatus',
> -  'data': [ 'none', 'active', 'completed', 'failed' ] }
> +  'data': [ 'none', 'active', 'completed', 'failed', 'cancelling', 'cancelled' ] }
>  
>  ##
>  # @DumpQueryResult:
> @@ -200,3 +200,22 @@
>  ##
>  { 'command': 'query-dump-guest-memory-capability',
>    'returns': 'DumpGuestMemoryCapability' }
> +
> +##
> +# @dump-cancel:
> +#
> +# Cancel the current executing dump process.
> +#
> +# Returns: nothing on success
> +#
> +# Notes: This command succeeds even if there is no dump process running.
> +#
> +# Since: 7.2
> +#
> +# Example:
> +#
> +# -> { "execute": "dump-cancel" }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'dump-cancel' }
> -- 
> 2.33.0
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


