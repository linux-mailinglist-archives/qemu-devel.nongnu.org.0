Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CF234211B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 16:42:51 +0100 (CET)
Received: from localhost ([::1]:39452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNHH0-0004Io-DH
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 11:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNHEn-0003Ww-Hl
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 11:40:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNHEk-0007pY-01
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 11:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616168426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1kW8DS8ocqEjJeHBDKuYCxP2E/6F+x8HbwsmPfdNNkQ=;
 b=VhkC4dh5D17eNY1W50QZKbjzvjFQoNjO+y7hW1lWreg+WPnKmKI9Or5AyNGk5dAwPDyns8
 o9tdgAgXWB0vs97sxr/1T+duatiHAgTYFzTNElBmVUeZ1ZU0e+PI3fjRErIiNBQeQ8ppdQ
 CRrR8kz220RMWjxKvRx2k1pmF4aTNQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-UvDJvFzpN1Kyoo6y6g69ZQ-1; Fri, 19 Mar 2021 11:40:25 -0400
X-MC-Unique: UvDJvFzpN1Kyoo6y6g69ZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9430681431D;
 Fri, 19 Mar 2021 15:40:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7618A60CEB;
 Fri, 19 Mar 2021 15:40:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 045DA11386A7; Fri, 19 Mar 2021 16:40:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 13/14] qmp: Include "reserve" property of memory
 backends
References: <20210319101230.21531-1-david@redhat.com>
 <20210319101230.21531-14-david@redhat.com>
Date: Fri, 19 Mar 2021 16:40:08 +0100
In-Reply-To: <20210319101230.21531-14-david@redhat.com> (David Hildenbrand's
 message of "Fri, 19 Mar 2021 11:12:29 +0100")
Message-ID: <87ft0ri23r.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> writes:

> Let's include the new property.
>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/core/machine-qmp-cmds.c | 1 +
>  qapi/machine.json          | 6 ++++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index 68a942595a..bd2a7f2dd0 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -174,6 +174,7 @@ static int query_memdev(Object *obj, void *opaque)
>          m->merge = object_property_get_bool(obj, "merge", &error_abort);
>          m->dump = object_property_get_bool(obj, "dump", &error_abort);
>          m->prealloc = object_property_get_bool(obj, "prealloc", &error_abort);
> +        m->reserve = object_property_get_bool(obj, "reserve", &error_abort);
>          m->policy = object_property_get_enum(obj, "policy", "HostMemPolicy",
>                                               &error_abort);
>          host_nodes = object_property_get_qobject(obj,
> diff --git a/qapi/machine.json b/qapi/machine.json
> index c0c52aef10..12860a1f79 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -814,6 +814,11 @@
>  #
>  # @prealloc: enables or disables memory preallocation
>  #
> +# @reserve: enables or disables reservation of swap space (or huge pages
> +#           if applicable). If reservation is enabled (default), actual
> +#           reservation depends on underlying OS support. In contrast,
> +#           disabling reservation without OS support will bail out. (since 6.1)
> +#

Provides two settings: "enable reservation if possible", and "disable
reservation or else fail".

Does "enable reservation or else fail" make no sense, or is it merely
unimplemented?

>  # @host-nodes: host nodes for its memory policy
>  #
>  # @policy: memory policy of memory backend
> @@ -827,6 +832,7 @@
>      'merge':      'bool',
>      'dump':       'bool',
>      'prealloc':   'bool',
> +    'reserve':    'bool',
>      'host-nodes': ['uint16'],
>      'policy':     'HostMemPolicy' }}


