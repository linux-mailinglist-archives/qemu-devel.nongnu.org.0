Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99D06009AA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 10:59:57 +0200 (CEST)
Received: from localhost ([::1]:48822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okLyW-00028F-Oo
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 04:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okLvD-0005j6-Mu
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 04:56:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okLv6-0006ej-Qj
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 04:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665996982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j6WkneK/ORy8nEpEZZ7DRB04oZMyP15KaLkm+dUnQ6E=;
 b=PtSivd3CMZoigMlUurk79na/2vdFPwa5AF5btYriR9OK2WhDfpi2/qTjP46ba+EfqFgmOM
 p5el/E7YhYxa3lIQR1seG0BPfkZ8Df2p9uIbXl+wJ9PAW9H4IYQopH4jpgm/VctRU5hSXe
 HRZiT4KIRd4QhyfIZXVa1+hEBwwUgTs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-oploxJg3P2yyXrWBebrPsg-1; Mon, 17 Oct 2022 04:56:19 -0400
X-MC-Unique: oploxJg3P2yyXrWBebrPsg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8F981C08798;
 Mon, 17 Oct 2022 08:56:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 520EC40C6F75;
 Mon, 17 Oct 2022 08:56:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1F9DA21E691D; Mon, 17 Oct 2022 10:56:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  Michal Privoznik <mprivozn@redhat.com>,  Igor
 Mammedov <imammedo@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v3 4/7] util: Add write-only "node-affinity" property
 for ThreadContext
References: <20221014134720.168738-1-david@redhat.com>
 <20221014134720.168738-5-david@redhat.com>
Date: Mon, 17 Oct 2022 10:56:14 +0200
In-Reply-To: <20221014134720.168738-5-david@redhat.com> (David Hildenbrand's
 message of "Fri, 14 Oct 2022 15:47:17 +0200")
Message-ID: <87lepe96c1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

David Hildenbrand <david@redhat.com> writes:

> Let's make it easier to pin threads created via a ThreadContext to
> all host CPUs currently belonging to a given set of host NUMA nodes --
> which is the common case.
>
> "node-affinity" is simply a shortcut for setting "cpu-affinity" manually
> to the list of host CPUs belonging to the set of host nodes. This property
> can only be written.
>
> A simple QEMU example to set the CPU affinity to host node 1 on a system
> with two nodes, 24 CPUs each, whereby odd-numbered host CPUs belong to
> host node 1:
>     qemu-system-x86_64 -S \
>       -object thread-context,id=tc1,node-affinity=1
>
> And we can query the cpu-affinity via HMP/QMP:
>     (qemu) qom-get tc1 cpu-affinity
>     [
>         1,
>         3,
>         5,
>         7,
>         9,
>         11,
>         13,
>         15,
>         17,
>         19,
>         21,
>         23,
>         25,
>         27,
>         29,
>         31,
>         33,
>         35,
>         37,
>         39,
>         41,
>         43,
>         45,
>         47
>     ]
>
> We cannot query the node-affinity:
>     (qemu) qom-get tc1 node-affinity
>     Error: Insufficient permission to perform this operation
>
> But note that due to dynamic library loading this example will not work
> before we actually make use of thread_context_create_thread() in QEMU
> code, because the type will otherwise not get registered. We'll wire
> this up next to make it work.
>
> Note that if the host CPUs for a host node change due do CPU hot(un)plug
> CPU onlining/offlining (i.e., lscpu output changes) after the ThreadContext
> was started, the CPU affinity will not get updated.
>
> Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  qapi/qom.json         |  9 ++++-
>  util/meson.build      |  2 +-
>  util/thread-context.c | 84 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 93 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 8013ba4b82..5a2db663f0 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -839,10 +839,17 @@
>  #                threads created in the thread context (default: QEMU main
>  #                thread CPU affinity)
>  #
> +# @node-affinity: the list of host node numbers that will be resolved to a list
> +#                 of host CPU numbers used as CPU affinity. This is a shortcut
> +#                 for specifying the list of host CPU numbers belonging to the
> +#                 host nodes manually by setting @cpu-affinity. (default: QEMU
> +#                 main thread affinity)

Would you mind breaking these lines a bit earlier, like you did for the
previous member?

> +#
>  # Since: 7.2
>  ##
>  { 'struct': 'ThreadContextProperties',
> -  'data': { '*cpu-affinity': ['uint16'] } }
> +  'data': { '*cpu-affinity': ['uint16'],
> +            '*node-affinity': ['uint16'] } }
>  
>  
>  ##

[...]


