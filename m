Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B3F206F86
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 10:56:49 +0200 (CEST)
Received: from localhost ([::1]:49696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo1D7-0008EO-2p
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 04:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jo18G-0001oB-Mn
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 04:51:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23018
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jo18D-0003La-QP
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 04:51:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592988704;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=YWvgCcvOL3sM9/lDFOfZ3HoxnYk9/ZHwRuRB1El36L0=;
 b=U4Afk0FXHdghrDl3nimu++m08u5NdU7u/WsLqqgv50QWc8cJUBgsZWGp7cDa9+zeVEobym
 Z07PLhOtD+wtxb7renGDRHnGDDQLIEve/ZNHrGEOdC5Wmv8ynM1yU+Ig/uGUhK/8kwy7j5
 Fk8A/KRG2idw+VrsqqpvGi7VWv2ZbGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-OhplbeVGPd2vsBJx1A4wAA-1; Wed, 24 Jun 2020 04:51:42 -0400
X-MC-Unique: OhplbeVGPd2vsBJx1A4wAA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75264805F13;
 Wed, 24 Jun 2020 08:51:41 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95D1A1A835;
 Wed, 24 Jun 2020 08:51:36 +0000 (UTC)
Date: Wed, 24 Jun 2020 09:51:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] qom: Allow object_property_add_child() to fail
Message-ID: <20200624085133.GC774096@redhat.com>
References: <20200623155452.30954-1-eric.auger@redhat.com>
 <87eeq4dgax.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87eeq4dgax.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.14.0 (2020-05-02)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 03:27:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, ehabkost@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 24, 2020 at 10:22:14AM +0200, Markus Armbruster wrote:
> Eric Auger <eric.auger@redhat.com> writes:
> 
> > object_property_add() does not allow object_property_try_add()
> > to gracefully fail as &error_abort is passed as an error handle.
> >
> > However such failure can easily be triggered from the QMP shell when,
> > for instance, one attempts to create an object with an id that already
> > exists:
> >
> > For instance, call twice:
> > object-add qom-type=memory-backend-ram id=mem1 props.size=1073741824
> > and QEMU aborts.
> >
> > This behavior is undesired as a user/management application mistake
> > in reusing a property ID shouldn't result in loss of the VM and live
> > data within.
> >
> > This patch introduces two new functions, object_property_add_err() and
> > object_property_add_child_err() whose prototype features an error handle.
> > object_property_add_child_err() now gets called from user_creatable_add_type.
> > This solution was chosen instead of changing the prototype of existing
> > functions because the number of existing callers is huge.
> >
> > The error now is returned gracefully to the QMP client.
> >
> > (QEMU) object-add qom-type=memory-backend-ram id=mem2  props.size=4294967296
> > {"return": {}}
> > (QEMU) object-add qom-type=memory-backend-ram id=mem2  props.size=4294967296
> > {"error": {"class": "GenericError", "desc": "attempt to add duplicate property
> > 'mem2' to object (type 'container')"}}
> >
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> Recent regression, my fault.  Please point that out, and add
> 
>   Fixes: d2623129a7dec1d3041ad1221dda1ca49c667532

I noticed tests/qtest/qmp-cmd-test.c exercises object-add. Probably a
good idea to extend that to test duplicate ID scenario, as that would
have caught the accidental regression.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


