Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C166A696C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:04:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXINh-0000GT-7d; Wed, 01 Mar 2023 04:04:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXINY-0008PU-1A
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:04:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXINU-00030u-Hf
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:04:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677661439;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2ec62y5rmPPEejreLrPVmgfEODeVY/a3C63U1enBxJA=;
 b=YvKDhJWpWbpauU082UJQuIy03NNxzbcJoCePPu7aog6TFfO1BIxU6lm1b1/lGr/IrLm5/b
 nfitIo1zcmRvsi0qLly7n14n92KUdGho11j1cUitUq4HkRuTz1H2ACRKvtzfJTGXzR+gBf
 Hf3UZqopERhR4Z3q5mL7GE15gaNeT/4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-ttVWVNElME-FF4h5CQMAfw-1; Wed, 01 Mar 2023 04:03:57 -0500
X-MC-Unique: ttVWVNElME-FF4h5CQMAfw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39410101A55E;
 Wed,  1 Mar 2023 09:03:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0989B2026D68;
 Wed,  1 Mar 2023 09:03:55 +0000 (UTC)
Date: Wed, 1 Mar 2023 09:03:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: michael.roth@amd.com, kkostiuk@redhat.com, marcandre.lureau@gmail.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 3/4] qga: Add optional `merge-output` flag to
 guest-exec qapi
Message-ID: <Y/8U+QwEmm564GQJ@redhat.com>
References: <cover.1677617035.git.dxu@dxuuu.xyz>
 <1575b08b853385eeaec6159b88b8c66525baec65.1677617035.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1575b08b853385eeaec6159b88b8c66525baec65.1677617035.git.dxu@dxuuu.xyz>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 28, 2023 at 01:48:03PM -0700, Daniel Xu wrote:
> Currently, the captured output (via `capture-output`) is segregated into
> separate GuestExecStatus fields (`out-data` and `err-data`). This means
> that downstream consumers have no way to reassemble the captured data
> back into the original stream.
> 
> This is relevant for chatty and semi-interactive (ie. read only) CLI
> tools.  Such tools may deliberately interleave stdout and stderr for
> visual effect. If segregated, the output becomes harder to visually
> understand.
> 
> This commit adds a new optional flag to the guest-exec qapi to merge the
> output streams such that consumers can have a pristine view of the
> original command output.
> 
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> ---
>  qga/commands.c       | 28 ++++++++++++++++++++++++++--
>  qga/qapi-schema.json |  6 +++++-
>  2 files changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/qga/commands.c b/qga/commands.c
> index 172826f8f8..cfce13d034 100644
> --- a/qga/commands.c
> +++ b/qga/commands.c
> @@ -270,12 +270,26 @@ static void guest_exec_child_watch(GPid pid, gint status, gpointer data)
>      g_spawn_close_pid(pid);
>  }
>  
> -/** Reset ignored signals back to default. */
>  static void guest_exec_task_setup(gpointer data)
>  {
>  #if !defined(G_OS_WIN32)
> +    bool has_merge = *(bool *)data;
>      struct sigaction sigact;
>  
> +    if (has_merge) {
> +        /*
> +         * FIXME: When `GLIB_VERSION_MIN_REQUIRED` is bumped to 2.58+, use
> +         * g_spawn_async_with_fds() to be portable on windows. The current
> +         * logic does not work on windows b/c `GSpawnChildSetupFunc` is run
> +         * inside the parent, not the child.
> +         */
> +        if (dup2(STDOUT_FILENO, STDERR_FILENO) != 0) {
> +            slog("dup2() failed to merge stderr into stdout: %s",
> +                 strerror(errno));
> +        }
> +    }
> +
> +    /* Reset ignored signals back to default. */
>      memset(&sigact, 0, sizeof(struct sigaction));
>      sigact.sa_handler = SIG_DFL;
>  
> @@ -384,6 +398,7 @@ GuestExec *qmp_guest_exec(const char *path,
>                         bool has_env, strList *env,
>                         const char *input_data,
>                         bool has_capture_output, bool capture_output,
> +                       bool has_merge_output, bool merge_output,
>                         Error **errp)
>  {
>      GPid pid;
> @@ -397,6 +412,7 @@ GuestExec *qmp_guest_exec(const char *path,
>      GIOChannel *in_ch, *out_ch, *err_ch;
>      GSpawnFlags flags;
>      bool has_output = (has_capture_output && capture_output);
> +    bool has_merge = (has_merge_output && merge_output);
>      g_autofree uint8_t *input = NULL;
>      size_t ninput = 0;
>  
> @@ -410,6 +426,14 @@ GuestExec *qmp_guest_exec(const char *path,
>          }
>      }
>  
> +#if defined(G_OS_WIN32)
> +    /* FIXME: see comment in guest_exec_task_setup() */
> +    if (has_merge) {
> +        error_setg(errp, "merge-output unsupported on windows");
> +        return NULL;
> +    }
> +#endif
> +
>      argv = guest_exec_get_args(&arglist, true);
>      envp = has_env ? guest_exec_get_args(env, false) : NULL;
>  
> @@ -420,7 +444,7 @@ GuestExec *qmp_guest_exec(const char *path,
>      }
>  
>      ret = g_spawn_async_with_pipes(NULL, argv, envp, flags,
> -            guest_exec_task_setup, NULL, &pid, input_data ? &in_fd : NULL,
> +            guest_exec_task_setup, &has_merge, &pid, input_data ? &in_fd : NULL,
>              has_output ? &out_fd : NULL, has_output ? &err_fd : NULL, &gerr);
>      if (!ret) {
>          error_setg(errp, QERR_QGA_COMMAND_FAILED, gerr->message);
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 796434ed34..9c2367acdf 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -1211,6 +1211,9 @@
>  # @input-data: data to be passed to process stdin (base64 encoded)
>  # @capture-output: bool flag to enable capture of
>  #                  stdout/stderr of running process. defaults to false.
> +# @merge-output: bool flag to merge stdout/stderr of running process
> +#                into stdout. only effective if used with @capture-output.
> +#                not effective on windows guests. defaults to false. (since 8.0)
>  #
>  # Returns: PID on success.
>  #
> @@ -1218,7 +1221,8 @@
>  ##
>  { 'command': 'guest-exec',
>    'data':    { 'path': 'str', '*arg': ['str'], '*env': ['str'],
> -               '*input-data': 'str', '*capture-output': 'bool' },
> +               '*input-data': 'str', '*capture-output': 'bool',
> +               '*merge-output': 'bool' },
>    'returns': 'GuestExec' }

I feel like 'merge-output' is a somewhat specialized policy. What if
we want to capture only stderr, and discard stdout, or vica-verca ?
IMHO, the original 'capture-output' field was poorly designed and
should have been an enum. I believe we can retrofit greater
flexibility by using an enum plus and alternate thus:

 { 'enum': 'GuestExecCaptureOutputMode',
   'data': [ 'none', 'stdout', 'stderr', 'all' ] }

 { 'alternate': 'GuestExecCaptureOutput',
   'data': { 'flag': 'bool',
             'mode': 'GuestExecCaptureOutputMode'} }

And then change 'guest-exec':

    '*capture-output': 'GuestExecCaptureOutput'

the use of the alternate makes this backwards compatible, as we can
distinguish a JSON bool on the wire from an enum represented as a
string.

This should be easy to implement, as it just involves selectively
toggling G_SPAWN_STDOUT_TO_DEV_NULL / G_SPAWN_STDERR_TO_DEV_NULL
flags, instead of setting them both together.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


