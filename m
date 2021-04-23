Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3D73690FC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 13:18:30 +0200 (CEST)
Received: from localhost ([::1]:55646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZtpN-0002B7-OM
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 07:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZtms-0000Qd-Ue
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 07:15:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZtmr-0005JO-BC
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 07:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619176550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zz8n/8/z4bmvu0ZaOVtr1MwT8BuCfKJsUBKscIjipX8=;
 b=c9241WzIL9EQwqasxgR5fCPi+PXU9T0qVoYRO9H/A128pgtokfCk+TDBC3EnwZnxNfr/GQ
 QYQeRoPmOrKocvgdsQaebo6IeEQUPLa7+8z2xheVbe1nYYOBhsJrSP2wLl3RNMUZihUfNy
 NBVEU45w4/W5NMcjPwUptEasS14JLXA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-Ssn9pGfTM3atg8LR5btSVQ-1; Fri, 23 Apr 2021 07:15:46 -0400
X-MC-Unique: Ssn9pGfTM3atg8LR5btSVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 675341006706;
 Fri, 23 Apr 2021 11:15:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41A5E687CF;
 Fri, 23 Apr 2021 11:15:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BA0F5113525D; Fri, 23 Apr 2021 13:15:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 12/15] qmp: Include "share" property of memory backends
References: <20210421122624.12292-1-david@redhat.com>
 <20210421122624.12292-13-david@redhat.com>
Date: Fri, 23 Apr 2021 13:15:28 +0200
In-Reply-To: <20210421122624.12292-13-david@redhat.com> (David Hildenbrand's
 message of "Wed, 21 Apr 2021 14:26:21 +0200")
Message-ID: <875z0di75b.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

> Let's include the property, which can be helpful when debugging,
> for example, to spot misuse of MAP_PRIVATE which can result in some ugly
> corner cases (e.g., double-memory consumption on shmem).
>
> Use the same description we also use for describing the property.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/core/machine-qmp-cmds.c | 1 +
>  qapi/machine.json          | 3 +++
>  2 files changed, 4 insertions(+)
>
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index 68a942595a..d41db5b93b 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -174,6 +174,7 @@ static int query_memdev(Object *obj, void *opaque)
>          m->merge =3D object_property_get_bool(obj, "merge", &error_abort=
);
>          m->dump =3D object_property_get_bool(obj, "dump", &error_abort);
>          m->prealloc =3D object_property_get_bool(obj, "prealloc", &error=
_abort);
> +        m->share =3D object_property_get_bool(obj, "share", &error_abort=
);
>          m->policy =3D object_property_get_enum(obj, "policy", "HostMemPo=
licy",
>                                               &error_abort);
>          host_nodes =3D object_property_get_qobject(obj,
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 758b901185..32650bfe9e 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -796,6 +796,8 @@
>  #
>  # @prealloc: whether memory was preallocated
>  #
> +# @share: whether memory is private to QEMU or shared (since 6.1)
> +#
>  # @host-nodes: host nodes for its memory policy
>  #
>  # @policy: memory policy of memory backend
> @@ -809,6 +811,7 @@
>      'merge':      'bool',
>      'dump':       'bool',
>      'prealloc':   'bool',
> +    'share':      'bool',
>      'host-nodes': ['uint16'],
>      'policy':     'HostMemPolicy' }}

Reviewed-by: Markus Armbruster <armbru@redhat.com>


