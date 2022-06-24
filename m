Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C491C5595F8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:03:41 +0200 (CEST)
Received: from localhost ([::1]:47250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fE4-0002iO-St
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o4exJ-0006MJ-Ry
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:46:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o4exF-0008BA-K8
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:46:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656060363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kJDKJA4vdZdzl5xKE4PzTneqkuurQIF+y524kLAFP9M=;
 b=ROfMbuOmRnDJszDMoFxltJeF9IW+6FGl5mOuzxsSoImlApl2fUXjxDSd/fWWQlF2rEWChB
 wYLsDqe/ppVYf74YWvoafNtYh+IS5Sejmj81wzNeEGBVwLIT9HPqSMULExX0ufXyFMbGK8
 u91WVSqBHBrjR8u4S/ICLNp0zCwiicI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-7pg_5RGeP4OpcZGVH_psDw-1; Fri, 24 Jun 2022 04:46:01 -0400
X-MC-Unique: 7pg_5RGeP4OpcZGVH_psDw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40ABF29324A6
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:46:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3CC01121314;
 Fri, 24 Jun 2022 08:46:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BB0D221E690D; Fri, 24 Jun 2022 10:45:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [RFC PATCH v4 03/11] qapi: net: introduce a way to bypass
 qemu_opts_parse_noisily()
References: <20220623155317.675932-1-lvivier@redhat.com>
 <20220623155317.675932-4-lvivier@redhat.com>
Date: Fri, 24 Jun 2022 10:45:59 +0200
In-Reply-To: <20220623155317.675932-4-lvivier@redhat.com> (Laurent Vivier's
 message of "Thu, 23 Jun 2022 17:53:09 +0200")
Message-ID: <87letmbgag.fsf@pond.sub.org>
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
>  include/net/net.h |  4 +++-
>  net/net.c         | 60 +++++++++++++++++++++++++++++++++++++++++++----
>  softmmu/vl.c      | 14 +++++------
>  3 files changed, 65 insertions(+), 13 deletions(-)
>
> diff --git a/include/net/net.h b/include/net/net.h
> index c53c64ac18c4..826e14a78734 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -214,7 +214,9 @@ extern NICInfo nd_table[MAX_NICS];
>  extern const char *host_net_devices[];
>  
>  /* from net.c */
> -int net_client_parse(QemuOptsList *opts_list, const char *str);
> +bool netdev_is_modern(const char *optarg);
> +void netdev_parse_modern(const char *optarg);
> +void net_client_parse(QemuOptsList *opts_list, const char *str);
>  void show_netdevs(void);
>  void net_init_clients(void);
>  void net_check_clients(void);
> diff --git a/net/net.c b/net/net.c
> index 15958f881776..531e6c5d2056 100644
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
> +        loc_pop(&nd->loc);
> +        qapi_free_Netdev(nd->nd);
> +        g_free(nd);
> +    }
> +}
> +
>  void net_init_clients(void)
>  {
>      net_change_state_entry =
> @@ -1569,6 +1594,8 @@ void net_init_clients(void)
>  
>      QTAILQ_INIT(&net_clients);
>  
> +    netdev_init_modern();
> +
>      qemu_opts_foreach(qemu_find_opts("netdev"), net_init_netdev, NULL,
>                        &error_fatal);
>  
> @@ -1579,13 +1606,38 @@ void net_init_clients(void)
>                        &error_fatal);
>  }
>  
> -int net_client_parse(QemuOptsList *opts_list, const char *optarg)
> +/*
> + * netdev_is_modern() returns true when the backend needs to bypass
> + * qemu_opts_parse_noisily()
> + */

Suggest

   /*
    * Does this -netdev argument use modern rather than traditional syntax?
    * Modern syntax is to be parsed with netdev_parse_modern().
    * Traditional syntax is to be parsed with net_client_parse().
    */

> +bool netdev_is_modern(const char *optarg)
> +{
> +    return false;
> +}
> +
> +/*
> + * netdev_parse_modern() uses modern, more expressive syntax than
> + * net_client_parse(), supports only the netdev option.

Suggest "but supports" or "and supports".

Suggest "the -netdev option".

Should we mention the difference in storing of the result?
netdev_parse_modern() appends to @nd_queue, whereas net_client_parse()
appends to @qemu_netdev_opts.

> + */
> +void netdev_parse_modern(const char *optarg)
> +{
> +    Visitor *v;
> +    NetdevQueueEntry *nd;
> +
> +    v = qobject_input_visitor_new_str(optarg, "type", &error_fatal);
> +    nd = g_new(NetdevQueueEntry, 1);
> +    visit_type_Netdev(v, NULL, &nd->nd, &error_fatal);
> +    visit_free(v);
> +    loc_save(&nd->loc);
> +
> +    QSIMPLEQ_INSERT_TAIL(&nd_queue, nd, entry);
> +}
> +
> +void net_client_parse(QemuOptsList *opts_list, const char *optarg)
>  {
>      if (!qemu_opts_parse_noisily(opts_list, optarg, true)) {
> -        return -1;
> +        exit(1);
>      }
> -
> -    return 0;
>  }

I'd put the change of net_client_parse() into its own patch.

>  
>  /* From FreeBSD */
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index c244e8afc4cc..f557e2d8cb8a 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2794,21 +2794,19 @@ void qemu_init(int argc, char **argv, char **envp)
>                  break;
>              case QEMU_OPTION_netdev:
>                  default_net = 0;
> -                if (net_client_parse(qemu_find_opts("netdev"), optarg) == -1) {
> -                    exit(1);
> +                if (netdev_is_modern(optarg)) {
> +                    netdev_parse_modern(optarg);
> +                } else {
> +                    net_client_parse(qemu_find_opts("netdev"), optarg);
>                  }
>                  break;
>              case QEMU_OPTION_nic:
>                  default_net = 0;
> -                if (net_client_parse(qemu_find_opts("nic"), optarg) == -1) {
> -                    exit(1);
> -                }
> +                net_client_parse(qemu_find_opts("nic"), optarg);
>                  break;
>              case QEMU_OPTION_net:
>                  default_net = 0;
> -                if (net_client_parse(qemu_find_opts("net"), optarg) == -1) {
> -                    exit(1);
> -                }
> +                net_client_parse(qemu_find_opts("net"), optarg);
>                  break;
>  #ifdef CONFIG_LIBISCSI
>              case QEMU_OPTION_iscsi:


