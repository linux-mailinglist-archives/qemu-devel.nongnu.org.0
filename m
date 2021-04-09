Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0763599B4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 11:45:04 +0200 (CEST)
Received: from localhost ([::1]:35688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUnhH-0007mF-8O
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 05:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUndx-0004zA-F9
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:41:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUnds-0005IT-4V
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:41:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617961291;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=URnxvYvvI++nVa9G3TRdh1r8dDEd3viXFTsgqBlCJc0=;
 b=BMeDoZ+09rCEWEgN0EnkMet+g5EIArpYm315bedwVLP7wuxYd5T1cOvgH8dJ4ITHp1NTny
 kF/Oi6ox6MYgduocNwB4tg7Zaf2iy2p+s1hS+8eB/czKMONPKFJL3+QIEyV2AVZ5WI7oGj
 UOFpu9a4V8SOLDJC+mpVdO8PqKc7NRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-iLEHP0deP368MhxsbeBApA-1; Fri, 09 Apr 2021 05:41:29 -0400
X-MC-Unique: iLEHP0deP368MhxsbeBApA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEA5F1883534
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 09:41:28 +0000 (UTC)
Received: from redhat.com (ovpn-115-36.ams2.redhat.com [10.36.115.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 096CF19726;
 Fri,  9 Apr 2021 09:41:23 +0000 (UTC)
Date: Fri, 9 Apr 2021 10:41:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: QMP introspecting device props common to a bus type
Message-ID: <YHAhQWdX15V54U8G@redhat.com>
References: <YG23ILea4H36TllU@redhat.com> <87pmz5at1v.fsf@dusky.pond.sub.org>
 <YG77DnwTyCVPL3nw@redhat.com> <87o8eo9609.fsf@dusky.pond.sub.org>
 <20210409064642.ah2tz5vjz2ngfiyo@sirius.home.kraxel.org>
 <87czv34xzh.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87czv34xzh.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 09, 2021 at 11:18:42AM +0200, Markus Armbruster wrote:
> Gerd Hoffmann <kraxel@redhat.com> writes:
> 
> >   Hi,
> >
> >> device-list-properties uses module_object_class_by_name(), requires the
> >> result to be a concrete device type, iterates over QOM properties with
> >> object_property_iter_init() / object_property_iter_next(), skipping
> >> properties named "type", "realized", "hotpluggable", "hotplugged",
> >> "parent_bus", and any whose starts with "legacy-".
> >> 
> >> Paolo, can you remind us why we skip the "legacy-FOO" properties?
> >> 
> >> qom-list-properties uses object_class_by_name(), requires an object type
> >> (an interface won't do).  If it's abstract, it iterates with
> >> object_class_property_iter_init() / object_property_iter_next(), else
> >> with object_property_iter_init() / object_property_iter_next().  It
> >> doesn't skip properties.
> >> 
> >> Looks like device-list-properties has become[*] pretty much redundant
> >> *except* for the difference between module_object_class_by_name() and
> >> object_class_by_name().
> >> 
> >> Gerd, you changed device-list-properties from object_class_by_name() to
> >> module_object_class_by_name() in commit 7ab6e7fcce.  Should
> >> qom-list-properties be changed, too?
> >
> > Makes sense.  We already have non-device modular objects
> > (some chardevs).
> >
> >> If yes, is there any reason to use
> >> object_class_by_name() for looking up user-provided type names in QMP
> >> commands?
> >
> > I've tried to be conservative and call module_object_class_by_name()
> > only in places where it is actually needed.  Reason one being the extra
> > overhead.  But maybe this isn't too bad given the extra module code runs
> > only on lookup failures.  Reason two is to avoid modules being loaded by
> > accident even when not needed.  This needs checking when you try drop
> > object_class_by_name().  A VM without --for example -- qxl device should
> > not load the qxl module.
> 
> Yes, module load should be reasonably explicit, to avoid accidental
> loading.
> 
> Automatic load on use is explicit enough.
> 
> Automatic load on introspection could perhaps be surprising.  I figure
> it depends on how the introspection request is phrased.  Loading X on
> "tell me more about X" feels okay.  Loading X on "show me all the X that
> satisfy Y" feels iffy.

IIUC, the intention is that as designed today, the existance of modules
is supposed to be transparent to mgmt application.

IOW, to a mgmt app "qemu + installed qxl module" should behaviour
identically to "qemu + statically linked qxl".

Conversely "qemu + uninstalled qxl module" should behaviour identically
to "qemu + qxl disabled at buld time".

This implies that when a mgmt app introspects QEMU for features, then
QEMU must auto-load all modules that are needed to ensure introspection
results match those that would be reported in non-modular build.

If we not going to make introspetion results equivalent, then we may
need to make modules be an explicit concept so mgmt apps can find out
when introspection is incomplete and force loading when they need it.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


