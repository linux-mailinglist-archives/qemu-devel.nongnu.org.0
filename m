Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF022DAF18
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:40:39 +0100 (CET)
Received: from localhost ([::1]:40824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBVF-0002jK-Qo
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kpBFk-0000kD-Mp
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:24:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kpBFh-0002Zk-DV
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608042271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z+cQ0iEhkWfsQjRdH/t6R2th3kreynHohts1awCUh9o=;
 b=Ko4wtxjkfEZQpR7fbZDpPvPaHZKGNS7DdCcQ1zBCUGsboRiTqMDm3kSJPzpKxVjD+iVsT6
 ilgZaOCwUpUMPZKnLTDEto4zipOU/7xFKL0JasYgZSFzmu98KoqkbYA6ivoC4FhE748PGU
 fsE5WURd0IVmspMqw9Fv6BV8A8B7VYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-FIzfC_48MYiPhrV1QHKixw-1; Tue, 15 Dec 2020 09:24:28 -0500
X-MC-Unique: FIzfC_48MYiPhrV1QHKixw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D39810054FF;
 Tue, 15 Dec 2020 14:24:26 +0000 (UTC)
Received: from localhost (ovpn-113-127.ams2.redhat.com [10.36.113.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A633A179B3;
 Tue, 15 Dec 2020 14:24:20 +0000 (UTC)
Date: Tue, 15 Dec 2020 15:24:18 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v4 23/32] qdev: Move dev->realized check to
 qdev_property_set()
Message-ID: <20201215152418.0e8dff6b@redhat.com>
In-Reply-To: <20201214172418.GK1289986@habkost.net>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-24-ehabkost@redhat.com>
 <20201214155530.55f80cd6@redhat.com>
 <20201214172418.GK1289986@habkost.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, xen-devel@lists.xenproject.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 12:24:18 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Mon, Dec 14, 2020 at 03:55:30PM +0100, Igor Mammedov wrote:
> > On Fri, 11 Dec 2020 17:05:20 -0500
> > Eduardo Habkost <ehabkost@redhat.com> wrote:
> >   
> > > Every single qdev property setter function manually checks
> > > dev->realized.  We can just check dev->realized inside
> > > qdev_property_set() instead.
> > > 
> > > The check is being added as a separate function
> > > (qdev_prop_allow_set()) because it will become a callback later.  
> > 
> > is callback added within this series?
> > and I'd add here what's the purpose of it.  
> 
> It will be added in part 2 of the series.  See v3:
> https://lore.kernel.org/qemu-devel/20201112214350.872250-35-ehabkost@redhat.com/
> 
> I don't know what else I could say about its purpose, in addition
> to what I wrote above, and the comment below[1].
> 
> If you are just curious about the callback and confused because
> it is not anywhere in this series, I can just remove the
> paragraph above from the commit message.  Would that be enough?
lets remove it for now to avoid confusion

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> >   
> [...]
> > > +/* returns: true if property is allowed to be set, false otherwise */  
> 
> [1] ^^^
> 
> > > +static bool qdev_prop_allow_set(Object *obj, const char *name,
> > > +                                Error **errp)
> > > +{
> > > +    DeviceState *dev = DEVICE(obj);
> > > +
> > > +    if (dev->realized) {
> > > +        qdev_prop_set_after_realize(dev, name, errp);
> > > +        return false;
> > > +    }
> > > +    return true;
> > > +}
> > > +  
> 


