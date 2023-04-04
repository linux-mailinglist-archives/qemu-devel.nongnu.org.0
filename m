Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217BF6D5AE6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 10:26:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjbyx-0001KT-87; Tue, 04 Apr 2023 04:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjbyv-0001Jk-Ao
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 04:25:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjbyt-0003at-Mu
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 04:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680596730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DMdnNvBpwMjQvlc69BcRpTgehzR+uLOlkASOA7cBrc8=;
 b=EbKc+EmhkHdBqVITcAkfY/d81XEKbNAOjAFJZ9ELa+R921v3EBvgosPBgQzHtcRjvQP7ob
 s1ivEPPdHUc7PfbTfUF/Z/zutBfgFvQZCDmukVEQuJFpOQPYfLaffJtu8yUu44LakkhTPP
 ZNpMX5Uaz8SQPT20IbVInUGDhTIHe7k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-e5hb-zAkNmCIKdQBX6kO0Q-1; Tue, 04 Apr 2023 04:25:27 -0400
X-MC-Unique: e5hb-zAkNmCIKdQBX6kO0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EED72814240;
 Tue,  4 Apr 2023 08:25:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1F9F1121314;
 Tue,  4 Apr 2023 08:25:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 85EC221E6926; Tue,  4 Apr 2023 10:25:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Warner Losh <imp@bsdimp.com>,  Kyle Evans
 <kevans@freebsd.org>,  libvir-list@redhat.com,  Markus Armbruster
 <armbru@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,  Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 10/10] hmp: Deprecate 'singlestep' member of StatusInfo
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-11-peter.maydell@linaro.org>
Date: Tue, 04 Apr 2023 10:25:25 +0200
In-Reply-To: <20230403144637.2949366-11-peter.maydell@linaro.org> (Peter
 Maydell's message of "Mon, 3 Apr 2023 15:46:37 +0100")
Message-ID: <87wn2s12bu.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In the title: "qmp:" 

Peter Maydell <peter.maydell@linaro.org> writes:

> The 'singlestep' member of StatusInfo has never done what
> the QMP documentation claims it does. What it actually
> reports is whether TCG is working in "one guest instruction
> per translation block" mode.
>
> Create a new 'one-insn-per-tb' member whose name matches
> what the field actually does and the new command line
> options. Deprecate the old 'singlestep' field.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/about/deprecated.rst   | 10 ++++++++++
>  docs/interop/qmp-intro.txt  |  1 +
>  qapi/run-state.json         | 17 ++++++++++++++---
>  softmmu/runstate-hmp-cmds.c |  2 +-
>  softmmu/runstate.c          |  6 ++++--
>  5 files changed, 30 insertions(+), 6 deletions(-)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 6f5e689aa45..dd36becdf3b 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -199,6 +199,16 @@ accepted incorrect commands will return an error. Users should make sure that
>  all arguments passed to ``device_add`` are consistent with the documented
>  property types.
>  
> +``StatusInfo`` member ``singlestep`` (since 8.1)
> +''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The ``singlestep`` member of the ``StatusInfo`` returned from
> +the ``query-status`` command is deprecated, because its name
> +is confusing and it never did what the documentation claimed
> +or what its name suggests. Use the ``one-insn-per-tb``
> +member instead, which reports the same information the old
> +``singlestep`` member did but under a clearer name.
> +
>  Human Monitor Protocol (HMP) commands
>  -------------------------------------
>  
> diff --git a/docs/interop/qmp-intro.txt b/docs/interop/qmp-intro.txt
> index 1c745a7af04..b22916b23df 100644
> --- a/docs/interop/qmp-intro.txt
> +++ b/docs/interop/qmp-intro.txt
> @@ -73,6 +73,7 @@ Escape character is '^]'.
>  { "execute": "query-status" }
>  {
>      "return": {
> +        "one-insn-per-tb": false,
>          "status": "prelaunch", 
>          "singlestep": false, 
>          "running": false
> diff --git a/qapi/run-state.json b/qapi/run-state.json
> index 9d34afa39e0..1de8c5c55d0 100644
> --- a/qapi/run-state.json
> +++ b/qapi/run-state.json
> @@ -104,16 +104,27 @@
>  #
>  # @running: true if all VCPUs are runnable, false if not runnable
>  #
> -# @singlestep: true if VCPUs are in single-step mode
> +# @one-insn-per-tb: true if using TCG with one guest instruction
> +#                   per translation block
> +#
> +# @singlestep: deprecated synonym for @one-insn-per-tb
>  #
>  # @status: the virtual machine @RunState
>  #
> +# Features:
> +# @deprecated: Member 'singlestep' is deprecated. Use @one-insn-per-tb instead.

Wrap this line, please.

> +#
>  # Since: 0.14
>  #
> -# Notes: @singlestep is enabled through the GDB stub
> +# Notes: @one-insn-per-tb is enabled on the command line with
> +#        '-accel tcg,one-insn-per-tb=on', or with the HMP
> +#        'one-insn-per-tb' command.
>  ##

Hmm.  We report it in query-status, which means it's relevant to QMP
clients.  We provide the command to control it only in HMP, which means
it's not relevant to QMP clients.

Why is reading it relevant to QMP clients, but not writing?

Use cases for reading it via QMP query-status?

Have you considered tacking feature 'unstable' to it?

>  { 'struct': 'StatusInfo',
> -  'data': {'running': 'bool', 'singlestep': 'bool', 'status': 'RunState'} }
> +  'data': {'running': 'bool',
> +           'singlestep': { 'type': 'bool', 'features': [ 'deprecated' ]},
> +           'one-insn-per-tb': 'bool',
> +           'status': 'RunState'} }
>  
>  ##
>  # @query-status:

I see a bunch of query-status results in
tests/qemu-iotests/{183,234,262,280}.out.  Do they need an update?

[...]


