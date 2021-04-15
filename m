Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E95B361142
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 19:41:34 +0200 (CEST)
Received: from localhost ([::1]:37166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX5zh-00070H-Co
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 13:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lX5TW-0005zM-W9
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 13:08:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lX5TS-0003sw-En
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 13:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618506491;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIj4ugUpSC8viniZDgxL8VLDzZJ6vyj2/cGHAYubLdA=;
 b=eSW0PaYi4pP+MWcLzl8tiSP7GO32N2mBML0vXxm0+cURryKGYFIhQTAWDdOjFqmd/VG2Fm
 Sdw3d+bJcoKiPWwRDnpBgJ3CcKAw8RyjwBzr4Oi3zh+/E1LIxaNDrrd2TASg03A0Qh0bMq
 YRWG3C9hXRQ80yORR+q1f2X6JFiawWg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-JtuuHXD3OxanRDAtgAN9QQ-1; Thu, 15 Apr 2021 13:08:05 -0400
X-MC-Unique: JtuuHXD3OxanRDAtgAN9QQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49E0A107ACC7
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 17:08:04 +0000 (UTC)
Received: from redhat.com (ovpn-115-159.ams2.redhat.com [10.36.115.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 827F85C290;
 Thu, 15 Apr 2021 17:08:02 +0000 (UTC)
Date: Thu, 15 Apr 2021 18:07:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH RFC] migration: warn about non-migratable configurations
 unless '--no-migration' was specified
Message-ID: <YHhy7w4bOy39VznW@redhat.com>
References: <20210415154402.28424-1-vkuznets@redhat.com>
 <YHhj/bo883jJ9ocy@redhat.com>
 <CAOpTY_r-sSdNEWCqoAbSfOvnAAbgEAKgU=LfeVco65gD=k3uDQ@mail.gmail.com>
 <YHhsiK2GOAqQn8dK@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YHhsiK2GOAqQn8dK@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 15, 2021 at 05:40:40PM +0100, Daniel P. Berrangé wrote:
> On Thu, Apr 15, 2021 at 12:30:11PM -0400, Eduardo Habkost wrote:
> > On Thu, Apr 15, 2021 at 12:04 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > >
> > > Is it possible to query the migration blockers via QMP ?
> > 
> > I don't think it is, but we can add that if it's useful for libvirt.
> 
> I think it would be useful.

To expand on how it could be used by a libvirt client if we could wire
this up in our message reporting API.

A client app using libvirt python API would do:

    msgs = dom.getMessages(libvirt.VIR_DOMAIN_MESSAGES_MIGBLOCKERS)

    if len(msgs) > 0:
        print("Domain %s uses features that block migration" % dom.getName())
	for msg in msgs:
	   print("   >> %s" % msg)


Migration blockers change over time, as hardware is hotplugged/unplugged,
so this isn't a one-off thing. The list of blockers is only valid at the
point in time that it is queried.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


