Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592A45543B9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 10:02:26 +0200 (CEST)
Received: from localhost ([::1]:49320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3vJh-0006Tr-03
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 04:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3vID-0005DJ-NS
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 04:00:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3vHv-0003GK-Rx
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 04:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655884833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PYZSFEL8mVURu4RKkM7GG72lhqkTEZS7lM+3h72wQjw=;
 b=HpZSm1fjz12bkpy1GQtUOp3t2rTrbwjK7G9C+DcZZc+xB9Q6S2LpLlGJkJzDhlbSHZBwCH
 b53BuqOdps+sW8w6a3Df4tv3GMRJzTiv76Ey7UZlCa8UpQxMlzjlocDXnlzt4biLTOrcja
 G03iNzcIcvn50z6DV0XZPBObyMN4hXI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-ZnE9IWLBNSuMn-PS2JeMpQ-1; Wed, 22 Jun 2022 04:00:31 -0400
X-MC-Unique: ZnE9IWLBNSuMn-PS2JeMpQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CA6018013A2
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 08:00:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9A0F404E4C8;
 Wed, 22 Jun 2022 08:00:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7408421E690D; Wed, 22 Jun 2022 10:00:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Jason Wang
 <jasowang@redhat.com>
Subject: Re: [RFC PATCH v3 03/11] qapi: net: introduce a way to bypass
 qemu_opts_parse_noisily()
References: <20220620101828.518865-1-lvivier@redhat.com>
 <20220620101828.518865-4-lvivier@redhat.com>
Date: Wed, 22 Jun 2022 10:00:29 +0200
In-Reply-To: <20220620101828.518865-4-lvivier@redhat.com> (Laurent Vivier's
 message of "Mon, 20 Jun 2022 12:18:20 +0200")
Message-ID: <874k0dnn4y.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

Laurent Vivier <lvivier@redhat.com> writes:

> As qemu_opts_parse_noisily() flattens the QAPI structures ("type" field
> of Netdev structure can collides with "type" field of SocketAddress),
> we introduce a way to bypass qemu_opts_parse_noisily() and use directly
> visit_type_Netdev() to parse the backend parameters.
>
> More details from Markus:
>
> qemu_init() passes the argument of -netdev, -nic, and -net to
> net_client_parse().
>
> net_client_parse() parses with qemu_opts_parse_noisily(), passing
> QemuOptsList qemu_netdev_opts for -netdev, qemu_nic_opts for -nic, and
> qemu_net_opts for -net.  Their desc[] are all empty, which means any
> keys are accepted.  The result of the parse (a QemuOpts) is stored in
> the QemuOptsList.
>
> Note that QemuOpts is flat by design.  In some places, we layer non-flat
> on top using dotted keys convention, but not here.
>
> net_init_clients() iterates over the stored QemuOpts, and passes them to
> net_init_netdev(), net_param_nic(), or net_init_client(), respectively.
>
> These functions pass the QemuOpts to net_client_init().  They also do
> other things with the QemuOpts, which we can ignore here.
>
> net_client_init() uses the opts visitor to convert the (flat) QemOpts to
> a (non-flat) QAPI object Netdev.  Netdev is also the argument of QMP
> command netdev_add.
>
> The opts visitor was an early attempt to support QAPI in
> (QemuOpts-based) CLI.  It restricts QAPI types to a certain shape; see
> commit eb7ee2cbeb "qapi: introduce OptsVisitor".
>
> A more modern way to support QAPI is qobject_input_visitor_new_str().
> It uses keyval_parse() instead of QemuOpts for KEY=VALUE,... syntax, and
> it also supports JSON syntax.  The former isn't quite as expressive as
> JSON, but it's a lot closer than QemuOpts + opts visitor.
>
> This commit paves the way to use of the modern way instead.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  include/net/net.h |  1 +
>  net/net.c         | 60 +++++++++++++++++++++++++++++++++++++++++++++++
>  softmmu/vl.c      |  3 ++-
>  3 files changed, 63 insertions(+), 1 deletion(-)
>
> diff --git a/include/net/net.h b/include/net/net.h
> index c53c64ac18c4..4ae8ed480f73 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -214,6 +214,7 @@ extern NICInfo nd_table[MAX_NICS];
>  extern const char *host_net_devices[];
>  
>  /* from net.c */
> +int netdev_parse_modern(const char *optarg);
>  int net_client_parse(QemuOptsList *opts_list, const char *str);
>  void show_netdevs(void);
>  void net_init_clients(void);
> diff --git a/net/net.c b/net/net.c
> index 15958f881776..c337d3d753fe 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -54,6 +54,7 @@
>  #include "net/colo-compare.h"
>  #include "net/filter.h"
>  #include "qapi/string-output-visitor.h"
> +#include "qapi/qobject-input-visitor.h"
>  
>  /* Net bridge is currently not supported for W32. */
>  #if !defined(_WIN32)
> @@ -63,6 +64,16 @@
>  static VMChangeStateEntry *net_change_state_entry;
>  static QTAILQ_HEAD(, NetClientState) net_clients;
>  
> +typedef struct NetdevQueueEntry {
> +    Netdev *nd;
> +    Location loc;
> +    QSIMPLEQ_ENTRY(NetdevQueueEntry) entry;
> +} NetdevQueueEntry;
> +
> +typedef QSIMPLEQ_HEAD(, NetdevQueueEntry) NetdevQueue;
> +
> +static NetdevQueue nd_queue = QSIMPLEQ_HEAD_INITIALIZER(nd_queue);
> +
>  /***********************************************************/
>  /* network device redirectors */
>  
> @@ -1562,6 +1573,20 @@ out:
>      return ret;
>  }
>  
> +static void netdev_init_modern(void)
> +{
> +    while (!QSIMPLEQ_EMPTY(&nd_queue)) {
> +        NetdevQueueEntry *nd = QSIMPLEQ_FIRST(&nd_queue);
> +
> +        QSIMPLEQ_REMOVE_HEAD(&nd_queue, entry);
> +        loc_push_restore(&nd->loc);
> +        net_client_init1(nd->nd, true, &error_fatal);

Accepts malformed IDs:

    $ qemu-system-x86_64 -netdev type=stream,id=_,addr.type=inet,addr.host=localhost,addr.port=1234
    qemu-system-x86_64: warning: netdev _ has no peer

Compare:

    $ qemu-system-x86_64 -netdev type=user,id=_
    qemu-system-x86_64: -netdev type=user,id=_: Parameter 'id' expects an identifier
    Identifiers consist of letters, digits, '-', '.', '_', starting with a letter.

Calling qmp_netdev_add() instead catches the error.  It won't provide
the hint, though.  Some callers of id_wellformed() do, some don't.
Factoring out bool check_id_wellformed(const char *id, Error **errp)
could make sense.

> +        loc_pop(&nd->loc);
> +        qapi_free_Netdev(nd->nd);
> +        g_free(nd);
> +    }
> +}
> +

[...]


