Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E33334194
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:34:01 +0100 (CET)
Received: from localhost ([::1]:58104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK0qW-0006jK-Kh
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:34:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lK0oj-0006Am-44
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:32:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lK0of-0004tI-W5
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:32:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615390323;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2XkvfGty/qw8XR3SllynFVQe8I7vq/gfa5bYhDAwOeM=;
 b=jP4l0KhISqOi5B4rtTDpmGtXKA+VzUAKQKhHomWjBWxznkRFffLmn0WZu2cCz0pbBPRN1X
 vgXoL2JSBP0NYzb6RmHo6HTPvacaXR/pasxWoOMwlD2JoV+8x7ubepFKI1Rm34iVNP/BEm
 Fqc8Ahd0kai89uJMHgDX8kp4GibPcqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-eLKJEbeUNgazsBaxtRTyUA-1; Wed, 10 Mar 2021 10:31:57 -0500
X-MC-Unique: eLKJEbeUNgazsBaxtRTyUA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6D8257;
 Wed, 10 Mar 2021 15:31:55 +0000 (UTC)
Received: from redhat.com (ovpn-115-24.ams2.redhat.com [10.36.115.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 822BF5C22A;
 Wed, 10 Mar 2021 15:31:51 +0000 (UTC)
Date: Wed, 10 Mar 2021 15:31:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] usb: Un-deprecate -usbdevice (except for -usbdevice
 audio which gets removed)
Message-ID: <YEjmZOoQJv6XRQc3@redhat.com>
References: <20210309165035.967853-1-thuth@redhat.com>
 <87y2ev2lmr.fsf@dusky.pond.sub.org>
 <20210310150209.nie5fifqi5od3r5u@begin>
 <5139e2b3-447e-2373-71b7-6fb5af020867@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5139e2b3-447e-2373-71b7-6fb5af020867@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Samuel Thibault <samuel.thibault@gnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 04:26:46PM +0100, Paolo Bonzini wrote:
> On 10/03/21 16:02, Samuel Thibault wrote:
> > > > When trying to remove the -usbdevice option, there were complaints that
> > > > "-usbdevice braille" is still a very useful shortcut for some people.
> > > Pointer?  I missed it.
> > 
> > For instance
> > https://lists.nongnu.org/archive/html/qemu-devel/2018-01/msg00693.html
> 
> In one sentence: "Braille is worth a special case because a subset of our
> user base (blind people) will use it 100% of the time, plus it is not
> supported by libvirt and hence virt-manager".

If simplicity of enabling braille support is critical, we could get
something even simpler than "-usbdevice braille", and just provide
a bare  "-braille" with no args required as a "do the right thing"
option ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


