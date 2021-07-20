Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E375E3CF103
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 02:56:10 +0200 (CEST)
Received: from localhost ([::1]:46612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5e3N-0007nK-Gp
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 20:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m5e26-00076g-0h
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 20:54:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m5e20-0004iO-6c
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 20:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626742482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jnP+BsQRPwGJ7H4Ux1uHrduoDF3MHnVG15kbrC/vqYo=;
 b=Wqzd+9rTnhVjc0wH1dQPPGHCopsSVxLgks7OzIGrR3amTycAJz1ycUcikXtck3yiFaTNTG
 40GpfIHxeepkcU3GvgfQZ16Z+On/Zk8GZF0XMn+OsNrQT2CR5rxyuRI1GIZxrSPTypauVy
 E2ztDvrWjFjl2/68PBF1yERMRL5VIhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-bCN9DrzlOyq-ZKE2kD2rQw-1; Mon, 19 Jul 2021 20:54:38 -0400
X-MC-Unique: bCN9DrzlOyq-ZKE2kD2rQw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36A6A10C1ADC
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 00:54:38 +0000 (UTC)
Received: from redhat.com (ovpn-112-216.phx2.redhat.com [10.3.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60A9C60CA0;
 Tue, 20 Jul 2021 00:54:35 +0000 (UTC)
Date: Mon, 19 Jul 2021 19:54:33 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/2] qapi: introduce forwarding visitor
Message-ID: <20210720005433.lgroglpa4jk4u4z2@redhat.com>
References: <20210719104033.185109-1-pbonzini@redhat.com>
 <20210719104033.185109-2-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210719104033.185109-2-pbonzini@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, alex.williamson@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 12:40:32PM +0200, Paolo Bonzini wrote:
> This new adaptor visitor takes a single field of the adaptee, and exposes it
> with a different name.
> 
> This will be used for QOM alias properties.  Alias targets can of course
> have a different name than the alias property itself (e.g. a machine's
> pflash0 might be an alias of a property named 'drive').  When the target's
> getter or setter invokes the visitor, it will use a different name than
> what the caller expects, and the visitor will not be able to find it
> (or will consume erroneously).

How does this differ from Kevin's attempt to add QMP aliasing,
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg04097.html

> 
> The solution is for alias getters and setters to wrap the incoming
> visitor, and forward the sole field that the target is expecting while
> renaming it appropriately.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

> diff --git a/include/qapi/forward-visitor.h b/include/qapi/forward-visitor.h
> new file mode 100644
> index 0000000000..c7002d53e6
> --- /dev/null
> +++ b/include/qapi/forward-visitor.h

> +
> +typedef struct ForwardFieldVisitor ForwardFieldVisitor;
> +
> +/*
> + * The forwarding visitor only expects a single name, @from, to be passed for
> + * toplevel fields.  It is converted to @to and forward to the @target visitor.

and forwarded

> + * Calls within a struct are forwarded without changing the name.
> + */
> +Visitor *visitor_forward_field(Visitor *target, const char *from, const char *to);
> +
> +#endif

> +++ b/qapi/qapi-forward-visitor.c
> @@ -0,0 +1,307 @@
> +/*
> + * Forward Visitor
> + *
> + * Copyright (C) 2021 Red Hat, Inc.
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
> + * See the COPYING.LIB file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include <math.h>

Did you really use math.h?


> +
> +static void forward_field_complete(Visitor *v, void *opaque)
> +{
> +    /*
> +     * Do nothing, the complete method will be called at due time

s/at/in/

> +     * on the target visitor.
> +     */
> +}
> +

> +++ b/tests/unit/test-forward-visitor.c
> @@ -0,0 +1,165 @@
> +/*
> + * QAPI Forwarding Visitor unit-tests.

Otherwise it looks like it does what it advertises.  I don't know if
Markus will have any opinions, but I'm comfortable with:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


