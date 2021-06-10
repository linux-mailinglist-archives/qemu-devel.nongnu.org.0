Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3BC3A2C7F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:07:55 +0200 (CEST)
Received: from localhost ([::1]:46546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKPa-000526-DM
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrKOh-0003a7-Nw
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:06:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrKOf-0003aE-T1
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623330417;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bOt/kt614U/ecPAqb38T8o3Hg2WlVe/B1lPGItRshds=;
 b=hFotlPoTAWsN+COxUVLF6ynRqIB7sx59u5BHLxlIQm0MFFzZpA1F2RCM8IdTAJdrEJ1cXc
 fYCaQEW/C30j55c6xzeBOOT0JGELKdBPxL80Sh7YwhDAAcQHL5xVais94s5dZVV4U0of+f
 Yxf7XdvU1XHMBy2Gk68khx0ca2fsMXA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-fWPh3W1vMXO8X14_twOteQ-1; Thu, 10 Jun 2021 09:06:43 -0400
X-MC-Unique: fWPh3W1vMXO8X14_twOteQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E405CC628;
 Thu, 10 Jun 2021 13:06:41 +0000 (UTC)
Received: from redhat.com (ovpn-115-203.ams2.redhat.com [10.36.115.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D194719D9D;
 Thu, 10 Jun 2021 13:06:12 +0000 (UTC)
Date: Thu, 10 Jun 2021 14:06:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 17/18] modules: check arch and block load on mismatch
Message-ID: <YMIOQNXkOoFekp8p@redhat.com>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-18-kraxel@redhat.com>
 <YMIHDKEGQWKtwEU5@redhat.com>
 <20210610125721.b27j6raf4h3qujt3@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210610125721.b27j6raf4h3qujt3@sirius.home.kraxel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 02:57:21PM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > >      for (modlist = modinfo->list; modlist != NULL; modlist = modlist->next) {
> > > +        if (modlist->value->has_arch) {
> > > +            if (strcmp(modlist->value->name, module_name) == 0) {
> > > +                if (!module_arch ||
> > > +                    strcmp(modlist->value->arch, module_arch) != 0) {
> > > +                    return false;
> > > +                }
> > > +            }
> > > +        }
> > 
> > I have a little hard time following the code paths, but IIUC, with this
> > change, instead of "module.so" we would have multiple copies of something
> > like "module-$arch.so" ?
> 
> Not yet with this series, but easily doable on top of this (see other
> patch series sent today).
> 
> > Then we load them all, read their modinfo section
> > and discard the ones with non-matching arch ?
> 
> No.  There is a utility reading the modinfo section (patch #2), write
> out the info as json (patch #2 has the schema), then qemu will read that
> json file (patch #13) ...

Ah ok, missed that.

Is the JSON file completely static, listing all modules that were built
regardless of whether they are currently installed, or would it need to
be refreshed when installing/uninstalling RPMs with modules ? I would
think we can do the former and simply handle missing modules on disk
fairly easily

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


