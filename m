Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA6B2D9D98
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 18:27:03 +0100 (CET)
Received: from localhost ([::1]:53272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1korcj-0000Zs-QM
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 12:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1koraP-00074s-6S
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:24:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1koraN-0001d1-MI
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607966674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tVrw542DX2KLO2TPzENouPrv7sTLbHUO9KuI1dV/ApQ=;
 b=bDXjI4abxFtwdC/tsW2nrfoKnVKVaD8YQsk5TWUNxcatxLh8Zx/c1pZ3TyFBXKwIygRQGL
 BqULqAv/Rzgjg8ZK+QKwQX+MRzxBzCzK1woMQy0UqjK+WXR6VdMHaM2GWaz17nkHh2CoNO
 LMdt3ocZ8QryqDiy5hmNtOhsVjihzwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-5mqhwgx1OAqCYa9M4ykgwA-1; Mon, 14 Dec 2020 12:24:31 -0500
X-MC-Unique: 5mqhwgx1OAqCYa9M4ykgwA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E043E107ACF5;
 Mon, 14 Dec 2020 17:24:28 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BE2410021AA;
 Mon, 14 Dec 2020 17:24:19 +0000 (UTC)
Date: Mon, 14 Dec 2020 12:24:18 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 23/32] qdev: Move dev->realized check to
 qdev_property_set()
Message-ID: <20201214172418.GK1289986@habkost.net>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-24-ehabkost@redhat.com>
 <20201214155530.55f80cd6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201214155530.55f80cd6@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, xen-devel@lists.xenproject.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 03:55:30PM +0100, Igor Mammedov wrote:
> On Fri, 11 Dec 2020 17:05:20 -0500
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > Every single qdev property setter function manually checks
> > dev->realized.  We can just check dev->realized inside
> > qdev_property_set() instead.
> > 
> > The check is being added as a separate function
> > (qdev_prop_allow_set()) because it will become a callback later.
> 
> is callback added within this series?
> and I'd add here what's the purpose of it.

It will be added in part 2 of the series.  See v3:
https://lore.kernel.org/qemu-devel/20201112214350.872250-35-ehabkost@redhat.com/

I don't know what else I could say about its purpose, in addition
to what I wrote above, and the comment below[1].

If you are just curious about the callback and confused because
it is not anywhere in this series, I can just remove the
paragraph above from the commit message.  Would that be enough?

> 
[...]
> > +/* returns: true if property is allowed to be set, false otherwise */

[1] ^^^

> > +static bool qdev_prop_allow_set(Object *obj, const char *name,
> > +                                Error **errp)
> > +{
> > +    DeviceState *dev = DEVICE(obj);
> > +
> > +    if (dev->realized) {
> > +        qdev_prop_set_after_realize(dev, name, errp);
> > +        return false;
> > +    }
> > +    return true;
> > +}
> > +

-- 
Eduardo


