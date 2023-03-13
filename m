Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78B66B7873
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 14:09:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbhtr-0006iP-3w; Mon, 13 Mar 2023 09:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pbhtn-0006Yu-Mj
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 09:07:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pbhtl-0002qN-Oj
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 09:07:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678712851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QVYRFzhHaoW5ZsP4j8zHsxcisFbazY0iok9f2q6pJMk=;
 b=C15MMNo3TXIfiytc74yv53slyNEbYuimowonsgKkX6VhRvzHMTtamtq4Q+dEjOLLTMHV5B
 xAb/Nz2ngTlBJZaDF6V0E/JviZ1gcDs5PMkzu2pUmR7tT6BtvH4hSSZHUNk0BnE+irW3iW
 lYTaNDkgjSheIljEAkjz2K55NJV3s9o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-W4f9tFq3PTOleMj5USIb_Q-1; Mon, 13 Mar 2023 09:07:30 -0400
X-MC-Unique: W4f9tFq3PTOleMj5USIb_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE904101A52E
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 13:07:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F5B9140E95F
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 13:07:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 45FD721E675B; Mon, 13 Mar 2023 14:07:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Eugenio
 Perez Martin <eperezma@redhat.com>,  Yalan Zhang <yalzhang@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC PATCH] qapi: net: fix -set parameter with modern style
References: <20230313114255.1206609-1-lvivier@redhat.com>
Date: Mon, 13 Mar 2023 14:07:28 +0100
In-Reply-To: <20230313114255.1206609-1-lvivier@redhat.com> (Laurent Vivier's
 message of "Mon, 13 Mar 2023 12:42:55 +0100")
Message-ID: <87h6uoer5b.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Laurent Vivier <lvivier@redhat.com> writes:

> With netdev modern style, parameters cannot be found using
> qemu_find_opts_err() and then qemu_set_option() cannot find
> them to update them with the new option.
>
> To fix that, update the code to manage the modern style by
> searching the parameter in nd_queue, and update the entry
> using visit_type_Netdev_members().
>
> Fixes: f3eedcddba36 ("qapi: net: introduce a way to bypass qemu_opts_parse_noisily()")
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Let me add Some more background.

A long time ago, configuration was a bunch of global variables in
various places, and CLI options and monitor commands to set them, all
using ad hoc parsers.

QemuOpts was an attempt at proper configuration infrastructure: a single
configuration repository with a rigid structure.  It is a set of named
"groups" (fixed at compile time, C type QemuOptsList).  Each group is a
set of QemuOpts.  A QemuOpts has a user-defined ID and a list of
QemuOpt.  A QemuOpt is essentially a key-value pair.  Values can be
string, uint64_t, or bool.

This is a *flat* design: GROUP.ID.NAME=VALUE.  Good enough back when it
was created in 2009, but we've long outgrown "flat".  More on that in a
jiffie.

-set operates on this repository.  -set GROUP.ID.NAME=VALUE selects the
QemuOptsList GROUP, within that the QemuOpts ID, and within that sets
the key NAME to value VALUE.

For -set to work, the QemuOpts must be created with a CLI option, and
used only after CLI parsing is complete.  This is how QemuOpts wants to
be used (but we use (and abuse) it in other ways, too).

The other way to configure a VM is of course the monitor.  QMP uses its
own infrastructure: the QAPI schema (since 2011).  Considerably more
expressive than QemuOpts: tree vs. flat, more scalar types.

There's another fundamental difference between a QemuOpts-based CLI and
the monitor.

With QemuOpts (when using it the intended way), we separate parsing from
acting.  First we parse the CLI entirely, populating the configuration
repository.  Only then do we actually create the things demanded by the
configuration.  Some errors get detected during parsing, and some during
acting.

In the monitor, however, each command acts immediately.  There is no
configuration repository.  There is simply no space for something like
-set.

There's also -readconfig: it parses a configuration file in a .INI
syntax into the configuration repository.

Over time, we grew bits of configurations QemuOpts can't express.  In
particular, QMP object-add could do things -object could not.  This led
to

commit 155b5f8b8d3d5dedd7c57e5223e822dc1b5295c8
Author: Kevin Wolf <kwolf@redhat.com>
Date:   Fri Mar 12 14:19:21 2021 +0100

    qom: Support JSON in HMP object_add and tools --object
    
    Support JSON for --object in all tools and in HMP object_add in the same
    way as it is supported in qobject_input_visitor_new_str().
    
    Signed-off-by: Kevin Wolf <kwolf@redhat.com>
    Message-Id: <20210312131921.421023-1-kwolf@redhat.com>
    Reviewed-by: Eric Blake <eblake@redhat.com>
    Reviewed-by: Markus Armbruster <armbru@redhat.com>
    Signed-off-by: Kevin Wolf <kwolf@redhat.com>

The commit message is arguably bad: it doesn't explain why.  The point
is to make -object to work like QMP object-add when the option argument
is JSON.  Full expressive power then, no QemuOpts, and therefore no
-set and no -readconfig.  This led to:

commit 49e987695a1873a769a823604f9065aa88e00c55
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Mon May 24 06:57:52 2021 -0400

    vl: plug -object back into -readconfig
    
    Commit bc2f4fcb1d ("qom: move user_creatable_add_opts logic to vl.c
    and QAPIfy it", 2021-03-19) switched the creation of objects from
    qemu_opts_foreach to a bespoke QTAILQ in preparation for supporting JSON
    syntax in -object.
    
    Unfortunately in doing so it lost support for [object] stanzas in
    configuration files and also for "-set object.ID.KEY=VAL".  The latter
    is hard to re-establish and probably best solved by deprecating -set.
    This patch uses the infrastructure introduced by the previous two
    patches in order to parse QOM objects correctly from configuration
    files.
    
    Cc: Markus Armbruster <armbru@redhat.com>
    Cc: qemu-stable@nongnu.org
    Reviewed-by: Kevin Wolf <kwolf@redhat.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
    Message-Id: <20210524105752.3318299-4-pbonzini@redhat.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

> ---
>  include/net/net.h |  2 ++
>  net/net.c         | 35 +++++++++++++++++++++++++++++++++++
>  softmmu/vl.c      |  8 ++++++++
>  3 files changed, 45 insertions(+)
>
> diff --git a/include/net/net.h b/include/net/net.h
> index 1448d00afbc6..be42ba96ee3d 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -246,6 +246,8 @@ extern const char *host_net_devices[];
>  extern NetClientStateList net_clients;
>  bool netdev_is_modern(const char *optarg);
>  void netdev_parse_modern(const char *optarg);
> +Netdev *netdev_find_modern(const char *id);
> +void netdev_set_modern(Netdev *net, const char *arg, Error **errp);
>  void net_client_parse(QemuOptsList *opts_list, const char *str);
>  void show_netdevs(void);
>  void net_init_clients(void);
> diff --git a/net/net.c b/net/net.c
> index 6492ad530e21..9c384187255b 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1624,6 +1624,41 @@ out:
>      return ret;
>  }
>  
> +Netdev *netdev_find_modern(const char *id)
> +{
> +    NetdevQueueEntry *e;
> +
> +    QSIMPLEQ_FOREACH(e, &nd_queue, entry) {
> +        if (strcmp(id, e->nd->id) == 0) {
> +            return e->nd;
> +        }
> +    }
> +    return NULL;
> +}
> +
> +void netdev_set_modern(Netdev *net, const char *arg, Error **errp)
> +{
> +    Visitor *v;
> +    char *id = net->id;
> +    char *opts = g_strdup_printf("type=%s,id=%s,%s",
> +                                 NetClientDriver_lookup.array[net->type],
> +                                 id, arg);
> +
> +    v = qobject_input_visitor_new_str(opts, NULL, errp);
> +    if (!visit_start_struct(v, NULL, NULL, 0, errp)) {
> +        goto out;
> +    }
> +    if (visit_type_Netdev_members(v, net, errp)) {
> +        g_free(id); /* re-allocated in visit_type_Netdev_members() */
> +        visit_check_struct(v, errp);
> +        visit_end_struct(v, NULL);
> +    }

This exploits the fact that visit_type_FOO_members() leaves alone the
members that are not in @opts.  It overwrites net->type and net->id with
identical values, and member NAME with VALUE, where NAME and value come
from -set netdev.ID.NAME=VALUE.

> +
> +out:
> +    visit_free(v);
> +    g_free(opts);
> +}
> +
>  static void netdev_init_modern(void)
>  {
>      while (!QSIMPLEQ_EMPTY(&nd_queue)) {
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 3340f63c3764..c063857867e2 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2162,6 +2162,14 @@ static void qemu_set_option(const char *str, Error **errp)
>      if (!is_qemuopts_group(group)) {
>          error_setg(errp, "-set is not supported with %s", group);
>      } else {
> +        if (strcmp(group, "netdev") == 0) {
> +            Netdev *net = netdev_find_modern(id);
> +            if (net) {
> +                netdev_set_modern(net, str + strlen(group) + strlen(id) + 2,
> +                                  errp);
> +                return;
> +            }
> +        }
>          list = qemu_find_opts_err(group, errp);
>          if (list) {
>              opts = qemu_opts_find(list, id);

Do we really want to special-case -set netdev... this way?


