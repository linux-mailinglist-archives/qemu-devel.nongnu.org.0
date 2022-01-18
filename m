Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 643954923CE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 11:33:30 +0100 (CET)
Received: from localhost ([::1]:34512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9lnt-0007jd-Ab
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 05:33:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n9llU-0006rp-HO
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 05:31:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n9llR-0008Pd-I5
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 05:30:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642501856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jYbw2ViRzIRWGDPEBwdjequ0jAGoS3h9mQBjoEDrHpM=;
 b=Vy+bFv07/4KuZq7cj/LCGFCa5XaWUmb/ZAAORSd8WUp6oqg9HHacvv/KIiMfAM7m5LMiD9
 PV6DaVmXXMW6BzKvgwlaOpKupassdNaNZJ2yazXEr2ziBGFaX3Xd/9rj+PgPa6rDVPMS6K
 EeLEUgVfxdu0VpimIDjU8mqkj/euf5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-rI1c8bBsOHqeH_RGXXQykQ-1; Tue, 18 Jan 2022 05:30:32 -0500
X-MC-Unique: rI1c8bBsOHqeH_RGXXQykQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95748814245;
 Tue, 18 Jan 2022 10:30:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E35B1F44A;
 Tue, 18 Jan 2022 10:30:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 087E211380A2; Tue, 18 Jan 2022 11:30:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 3/3] meson: generate trace events for qmp commands
References: <20220117201845.2438382-1-vsementsov@virtuozzo.com>
 <20220117201845.2438382-4-vsementsov@virtuozzo.com>
Date: Tue, 18 Jan 2022 11:30:30 +0100
In-Reply-To: <20220117201845.2438382-4-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Mon, 17 Jan 2022 21:18:45 +0100")
Message-ID: <871r15pc8p.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 hreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 1. Use --add-trace-events when generate qmp commands
> 2. Add corresponding .trace-events files as outputs in qapi_files
>    custom target
> 3. Define global qapi_trace_events list of .trace-events file targets,
>    to fill in trace/qapi.build and to use in trace/meson.build
> 4. In trace/meson.build use the new array as an additional source of
>    .trace_events files to be processed
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  meson.build       |  5 +++++
>  qapi/meson.build  |  9 ++++++++-
>  trace/meson.build | 11 ++++++++---
>  3 files changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 762d7cee85..effd66e4c2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -41,6 +41,7 @@ qemu_icondir = get_option('datadir') / 'icons'
>  
>  config_host_data = configuration_data()
>  genh = []
> +qapi_trace_events = []
>  
>  target_dirs = config_host['TARGET_DIRS'].split()
>  have_linux_user = false
> @@ -2554,6 +2555,10 @@ if 'CONFIG_VHOST_USER' in config_host
>    vhost_user = libvhost_user.get_variable('vhost_user_dep')
>  endif
>  
> +# Please keep ordering between 'qapi' and 'trace' subdirs:
> +# We should first handle 'qapi' subdir, so that all
> +# generated trace events be generated prior handling 'trace'
> +# subdir.

I naively expect explicit dependencies to be used for ordering, but I'm
a Meson noob.  I'd like an ACK from a non-noob on this one.

>  subdir('qapi')
>  subdir('qobject')
>  subdir('stubs')
> diff --git a/qapi/meson.build b/qapi/meson.build
> index c0c49c15e4..b48125f8da 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -114,6 +114,7 @@ foreach module : qapi_all_modules
>        'qapi-events-@0@.h'.format(module),
>        'qapi-commands-@0@.c'.format(module),
>        'qapi-commands-@0@.h'.format(module),
> +      'qapi-commands-@0@.trace-events'.format(module),
>      ]
>    endif
>    if module.endswith('-target')
> @@ -126,7 +127,7 @@ endforeach
>  qapi_files = custom_target('shared QAPI source files',
>    output: qapi_util_outputs + qapi_specific_outputs + qapi_nonmodule_outputs,
>    input: [ files('qapi-schema.json') ],
> -  command: [ qapi_gen, '-o', 'qapi', '-b', '@INPUT0@' ],
> +  command: [ qapi_gen, '-o', 'qapi', '-b', '@INPUT0@', '--add-trace-events' ],
>    depend_files: [ qapi_inputs, qapi_gen_depends ])
>  
>  # Now go through all the outputs and add them to the right sourceset.
> @@ -137,6 +138,9 @@ foreach output : qapi_util_outputs
>    if output.endswith('.h')
>      genh += qapi_files[i]
>    endif
> +  if output.endswith('.trace-events')
> +    qapi_trace_events += qapi_files[i]
> +  endif
>    util_ss.add(qapi_files[i])
>    i = i + 1
>  endforeach
> @@ -145,6 +149,9 @@ foreach output : qapi_specific_outputs + qapi_nonmodule_outputs
>    if output.endswith('.h')
>      genh += qapi_files[i]
>    endif
> +  if output.endswith('.trace-events')
> +    qapi_trace_events += qapi_files[i]
> +  endif
>    specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: qapi_files[i])
>    i = i + 1
>  endforeach
> diff --git a/trace/meson.build b/trace/meson.build
> index 573dd699c6..c4794a1f2a 100644
> --- a/trace/meson.build
> +++ b/trace/meson.build
> @@ -2,10 +2,15 @@
>  specific_ss.add(files('control-target.c'))
>  
>  trace_events_files = []
> -foreach dir : [ '.' ] + trace_events_subdirs
> -  trace_events_file = meson.project_source_root() / dir / 'trace-events'
> +foreach item : [ '.' ] + trace_events_subdirs + qapi_trace_events
> +  if item in qapi_trace_events
> +    trace_events_file = item
> +    group_name = item.full_path().split('/')[-1].underscorify()
> +  else
> +    trace_events_file = meson.project_source_root() / item / 'trace-events'
> +    group_name = item == '.' ? 'root' : item.underscorify()
> +  endif
>    trace_events_files += [ trace_events_file ]
> -  group_name = dir == '.' ? 'root' : dir.underscorify()
>    group = '--group=' + group_name
>    fmt = '@0@-' + group_name + '.@1@'


