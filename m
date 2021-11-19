Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FE545725B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:05:31 +0100 (CET)
Received: from localhost ([::1]:50064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6OI-000410-7w
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:05:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mo6Lt-0003LQ-OJ
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:03:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mo6Lr-0003mg-59
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637337775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=86jOZtyp2G6oDkoyNFTYRnvpM/aG7tMpSiGzIZsSP5k=;
 b=dKMC3+g/BoQY0zGyqm2mLgctxyAkLdsI6TL+ryJFbEiRx/LGAxdP1JGg05EWELZMFZaxPY
 TOQGi5CDKlGn18z3LacfiqCK/wArNE7b9T08AmwCJi5sYGKBeGbf3l46C7t+s4zDnPFjP/
 /BuczKBMFTo0Mx2Cmx1Y4S2Rip4CHoM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-Qhkx2Qk5P9mNIME8W3uqfw-1; Fri, 19 Nov 2021 11:02:54 -0500
X-MC-Unique: Qhkx2Qk5P9mNIME8W3uqfw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1923880A5C3;
 Fri, 19 Nov 2021 16:02:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F19C5C1A1;
 Fri, 19 Nov 2021 16:02:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EB7EB11380A7; Fri, 19 Nov 2021 17:02:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH for 7.0 V10 6/6] net/net.c: Add handler for passthrough
 filter command
References: <20211112031112.9303-1-chen.zhang@intel.com>
 <20211112031112.9303-7-chen.zhang@intel.com>
Date: Fri, 19 Nov 2021 17:02:50 +0100
In-Reply-To: <20211112031112.9303-7-chen.zhang@intel.com> (Zhang Chen's
 message of "Fri, 12 Nov 2021 11:11:12 +0800")
Message-ID: <87wnl43zh1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is not review; I'm merely pointing out errors that caught my eye.

Zhang Chen <chen.zhang@intel.com> writes:

> Use the connection protocol,src port,dst port,src ip,dst ip as the key
> to passthrough certain network traffic in object with network packet
> processing function.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  net/net.c | 199 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 197 insertions(+), 2 deletions(-)
>
> diff --git a/net/net.c b/net/net.c
> index 5d0d5914fb..443e88d396 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -55,6 +55,8 @@
>  #include "net/colo-compare.h"
>  #include "net/filter.h"
>  #include "qapi/string-output-visitor.h"
> +#include "net/colo-compare.h"
> +#include "qom/object_interfaces.h"
>  
>  /* Net bridge is currently not supported for W32. */
>  #if !defined(_WIN32)
> @@ -1215,14 +1217,207 @@ void qmp_netdev_del(const char *id, Error **errp)
>      }
>  }
>  
> +static int check_addr(InetSocketAddressBase *addr)
> +{
> +    if (!addr || (addr->host && !qemu_isdigit(addr->host[0]))) {
> +        return -1;
> +    }
> +
> +    if (atoi(addr->port) > 65536 || atoi(addr->port) < 0) {
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +/* The initial version only supports colo-compare */
> +static CompareState *passthrough_filter_check(IPFlowSpec *spec, Error **errp)
> +{
> +    Object *container;
> +    Object *obj;
> +    CompareState *s;
> +
> +    if (!spec->object_name) {

How can spec->object_name ever be null?  It's not optional in the QAPI
schema.

> +        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "object-name",
> +                   "Need input object name");
> +        return NULL;
> +    }
> +
> +    container = object_get_objects_root();
> +    obj = object_resolve_path_component(container, spec->object_name);

As far as I can tell, object_resolve_path_component()'s second argument
is a property name, *not* a path.  I think you want

       s = (CompareState *)object_resolve_path_type(spec->object_name,
                                                    COLO_COMPARE, NULL);

This also takes care of ...

> +    if (!obj) {
> +        error_setg(errp, "object '%s' not found", spec->object_name);
> +        return NULL;
> +    }
> +
> +    s = COLO_COMPARE(obj);

... a probable bug here: when the object exists (@obj is not null), but
isn't a TYPE_COLO_COMPARE object, then @s is null here.  We can then
return null without setting an error.

> +
> +    if (!getprotobyname(spec->protocol)) {
> +        error_setg(errp, "Passthrough filter get wrong protocol");
> +        return NULL;
> +    }
> +
> +    if (spec->source) {
> +        if (check_addr(spec->source)) {
> +            error_setg(errp, "Passthrough filter get wrong source");
> +            return NULL;
> +        }
> +    }
> +
> +    if (spec->destination) {
> +        if (check_addr(spec->destination)) {
> +            error_setg(errp, "Passthrough filter get wrong destination");
> +            return NULL;
> +        }
> +    }
> +
> +    return s;
> +}
> +
> +/* The initial version only supports colo-compare */

Is there another version in the tree?  I guess not.  Recommend

   /* Supports only colo-compare so far */

Such limitations need to be clearly stated in the QAPI schema doc
comments.

> +static COLOPassthroughEntry *passthrough_filter_find(CompareState *s,
> +                                                     COLOPassthroughEntry *ent)
> +{
> +    COLOPassthroughEntry *next = NULL, *origin = NULL;
> +
> +    if (!QLIST_EMPTY(&s->passthroughlist)) {
> +        QLIST_FOREACH_SAFE(origin, &s->passthroughlist, node, next) {
> +            if ((ent->l4_protocol.p_proto == origin->l4_protocol.p_proto) &&
> +                (ent->src_port == origin->src_port) &&
> +                (ent->dst_port == origin->dst_port) &&
> +                (ent->src_ip.s_addr == origin->src_ip.s_addr) &&
> +                (ent->dst_ip.s_addr == origin->dst_ip.s_addr)) {
> +                return origin;
> +            }
> +        }
> +    }
> +
> +    return NULL;
> +}

[...]


