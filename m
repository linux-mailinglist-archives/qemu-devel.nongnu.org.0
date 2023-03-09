Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4697A6B200B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 10:30:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paCap-0007AZ-HA; Thu, 09 Mar 2023 04:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1paCam-0007AN-VS
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:29:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1paCak-0004ue-ST
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:29:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678354181;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L+ko+N6qKHW+CYhYuxPF07axpZjNDoCLd4hsypgCdzE=;
 b=OGoD6n6yBhrkZzqtLgdZnmr4pTN3cAt0jczLT639BqY2XMu/Q/6iX3k1wpTvZ5bITQiwWK
 9WqaUitkdVw61J9bRl/st2CemM3oD2uu4+w0qqOkMokRh1KbvvkchOT7Ek8RTbRtFQyL1C
 jIJTFtL34j33EXKauMlYbRsygSQf7FI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-4mJ_7xEOPv2zQDfMhIrgyg-1; Thu, 09 Mar 2023 04:29:38 -0500
X-MC-Unique: 4mJ_7xEOPv2zQDfMhIrgyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B64AE2932492;
 Thu,  9 Mar 2023 09:29:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B944BC15BA0;
 Thu,  9 Mar 2023 09:29:36 +0000 (UTC)
Date: Thu, 9 Mar 2023 09:29:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: kkostiuk@redhat.com, michael.roth@amd.com, marcandre.lureau@gmail.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 1/3] qga: Refactor guest-exec capture-output to take
 enum
Message-ID: <ZAmm/p8t39c0b9XN@redhat.com>
References: <cover.1678314204.git.dxu@dxuuu.xyz>
 <59f4f17ac2cbe719fa4f571a1c373c36597b12a3.1678314204.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59f4f17ac2cbe719fa4f571a1c373c36597b12a3.1678314204.git.dxu@dxuuu.xyz>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

On Wed, Mar 08, 2023 at 03:49:39PM -0700, Daniel Xu wrote:
> Previously capture-output was an optional boolean flag that either
> captured all output or captured none. While this is OK in most cases, it
> lacks flexibility for more advanced capture cases, such as wanting to
> only capture stdout.
> 
> This commits refactors guest-exec qapi to take an enum for capture mode
> instead while preserving backwards compatibility.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> ---
>  qga/commands.c       | 37 ++++++++++++++++++++++++++++++++++---
>  qga/qapi-schema.json | 32 +++++++++++++++++++++++++++++++-
>  2 files changed, 65 insertions(+), 4 deletions(-)
> 
> diff --git a/qga/commands.c b/qga/commands.c
> index 172826f8f8..5504fc5b8c 100644
> --- a/qga/commands.c
> +++ b/qga/commands.c
> @@ -379,11 +379,23 @@ close:
>      return false;
>  }
>  
> +static GuestExecCaptureOutputMode ga_parse_capture_output(
> +        GuestExecCaptureOutput *capture_output)
> +{
> +    if (!capture_output)
> +        return GUEST_EXEC_CAPTURE_OUTPUT_MODE_NONE;
> +    else if (capture_output->type == QTYPE_QBOOL)
> +        return capture_output->u.flag ? GUEST_EXEC_CAPTURE_OUTPUT_MODE_ALL
> +                                      : GUEST_EXEC_CAPTURE_OUTPUT_MODE_NONE;
> +    else
> +        return capture_output->u.mode;
> +}
> +
>  GuestExec *qmp_guest_exec(const char *path,
>                         bool has_arg, strList *arg,
>                         bool has_env, strList *env,
>                         const char *input_data,
> -                       bool has_capture_output, bool capture_output,
> +                       GuestExecCaptureOutput *capture_output,
>                         Error **errp)
>  {
>      GPid pid;
> @@ -396,7 +408,8 @@ GuestExec *qmp_guest_exec(const char *path,
>      gint in_fd, out_fd, err_fd;
>      GIOChannel *in_ch, *out_ch, *err_ch;
>      GSpawnFlags flags;
> -    bool has_output = (has_capture_output && capture_output);
> +    bool has_output = false;
> +    GuestExecCaptureOutputMode output_mode;
>      g_autofree uint8_t *input = NULL;
>      size_t ninput = 0;
>  
> @@ -415,8 +428,26 @@ GuestExec *qmp_guest_exec(const char *path,
>  
>      flags = G_SPAWN_SEARCH_PATH | G_SPAWN_DO_NOT_REAP_CHILD |
>          G_SPAWN_SEARCH_PATH_FROM_ENVP;
> -    if (!has_output) {
> +
> +    output_mode = ga_parse_capture_output(capture_output);
> +    switch (output_mode) {
> +    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_NONE:
>          flags |= G_SPAWN_STDOUT_TO_DEV_NULL | G_SPAWN_STDERR_TO_DEV_NULL;
> +        break;
> +    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_STDOUT:
> +        has_output = true;
> +        flags |= G_SPAWN_STDERR_TO_DEV_NULL;
> +        break;
> +    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_STDERR:
> +        has_output = true;
> +        flags |= G_SPAWN_STDOUT_TO_DEV_NULL;
> +        break;
> +    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_ALL:
> +        has_output = true;
> +        break;
> +    case GUEST_EXEC_CAPTURE_OUTPUT_MODE__MAX:
> +        /* Silence warning; impossible branch */
> +        break;
>      }
>  
>      ret = g_spawn_async_with_pipes(NULL, argv, envp, flags,
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 796434ed34..4ef585da5d 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -1200,6 +1200,36 @@
>  { 'struct': 'GuestExec',
>    'data': { 'pid': 'int'} }
>  
> +##
> +# @GuestExecCaptureOutputMode:
> +#
> +# An enumeration of guest-exec capture modes.
> +#
> +# @none: do not capture any output
> +# @stdout: only capture stdout
> +# @stderr: only capture stderr
> +# @all: capture both stdout and stderr

Functionally fine. A minor naming thought.... How about we call
this '@separated' and tweak the docs

  @separated: capture both stdout and stderr separately

Then in your in next patch you introduce

  @merged: capture both stdout and stderr merged

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


