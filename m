Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD61364866
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:41:20 +0200 (CEST)
Received: from localhost ([::1]:38958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYWxb-0006JR-Vp
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lYWuR-0005ka-KP
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:38:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lYWuP-0000Tn-C3
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:38:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618850280;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UbwCOBrFfsbb2MbirR/wq1HGS/K+uZ/TSzlOdNhP+4k=;
 b=RPg5lGBXtDrwjymkL0l9Blskh751DN2S0yuxH+HlTu4VVewK7UcJT+cZTzfxtdZPQfLVDK
 iejlxv9iDVlZ/ERr01eJBjfa44pwHNmJDsvMoG5/JrQQtbLEOE9+oyB4Yp8Vgg3Ru+Qk4l
 VWYELS+H/zvf7gNcOdpAOrMd0Y93Uik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-dFOTPen_Oi-MVrHO7ZrhMg-1; Mon, 19 Apr 2021 12:37:59 -0400
X-MC-Unique: dFOTPen_Oi-MVrHO7ZrhMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 205FF100807F;
 Mon, 19 Apr 2021 16:37:37 +0000 (UTC)
Received: from redhat.com (ovpn-114-178.ams2.redhat.com [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BBC760C04;
 Mon, 19 Apr 2021 16:37:34 +0000 (UTC)
Date: Mon, 19 Apr 2021 17:37:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH RFC] migration: warn about non-migratable configurations
 unless '--no-migration' was specified
Message-ID: <YH2xzIlCfjwdVF2R@redhat.com>
References: <20210415154402.28424-1-vkuznets@redhat.com>
 <CAFEAcA-u0XDFBuTaw2AcoP1NLSYNCSAEutXi+gfhb-qU=_UBGg@mail.gmail.com>
 <CAOpTY_oCNcPjB6aHn6kp6Pb=TJSYKLuTOWyLD+1LP24w3F_c=A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOpTY_oCNcPjB6aHn6kp6Pb=TJSYKLuTOWyLD+1LP24w3F_c=A@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 12:28:04PM -0400, Eduardo Habkost wrote:
> On Sun, Apr 18, 2021 at 11:54 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Thu, 15 Apr 2021 at 16:46, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> > > When a migration blocker is added nothing is reported to the user,
> > > inability to migrate such guest may come as a late surprise. As a bare
> > > minimum, we can print a warning. To not pollute the output for those, who
> > > have no intention to migrate their guests, introduce '--no-migration'
> > > option which both block the migration and eliminates warning from
> >
> > I'm not a fan. For a lot of people and configurations this
> > is going to be "add an extra complaint from QEMU to a previously
> > working configuration". We add too many of those already.
> 
> I agree that warning with machine types that never supported live
> migration would be useless noise, but warning if using an explicit
> versioned machine type sounds like a reasonable default (as long as
> the warnings includes clear instructions on how to silence them).

Libvirt will always expand a machine type alias into a versioned
machine type, because stable ABI is useful even if never migrating,
because it ensures the guest OS doesn't see hardware changes that
may trigger license re-activation

At the same time a large portion of users will never care about
live migration/save/restore, or they do care but will hotunplug
the problems devices before attempting a migration.

IMHO tieing messages to versioned machine types is not desirable
as a strategy by default.

Warning about migration compatibility should be an explicit opt-in

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


