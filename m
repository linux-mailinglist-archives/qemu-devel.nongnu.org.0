Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD03A3CF6BD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 11:21:31 +0200 (CEST)
Received: from localhost ([::1]:54158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5lwQ-0005eL-Ow
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 05:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5lvC-0004pN-C0
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 05:20:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5lv8-0000j6-CH
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 05:20:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626772809;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hfo6oOqrXanOOCPU5uNByuM6JmEKdCB9thf2Q9lj1n4=;
 b=CI46baMwGKVbu4gu1ECtxr/FGqInAioArCBHXDL6vs4VSHXa3dreuvONPL2urtmGavW2wn
 ZuciJt1kjwUDORZd8GLy6Ck6jATJjqfqyEek4Hnd9gylobp3gWDcX+cb54uZUSzW4SSEUQ
 pHRDrNz3FwkViQGw/iGFN6EftWOjSng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-4RHKhJV9OBapWLSYxkjlKg-1; Tue, 20 Jul 2021 05:20:05 -0400
X-MC-Unique: 4RHKhJV9OBapWLSYxkjlKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CC69180FCA8;
 Tue, 20 Jul 2021 09:19:49 +0000 (UTC)
Received: from redhat.com (ovpn-114-189.ams2.redhat.com [10.36.114.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C6A260CC9;
 Tue, 20 Jul 2021 09:19:46 +0000 (UTC)
Date: Tue, 20 Jul 2021 10:19:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v1 2/9] s390x: toplogy: adding drawers and books to smp
 parsing
Message-ID: <YPaVL9hIL2ob9/Hv@redhat.com>
References: <0801e122-0e9c-e266-42e8-d5cddb16c237@linux.ibm.com>
 <87bl73df9y.fsf@dusky.pond.sub.org> <87y2a6bp5f.fsf@redhat.com>
 <YPFO/NPdyHjf1Cyu@redhat.com> <87pmvibkri.fsf@redhat.com>
 <YPFkJUgbE9ku0tI7@redhat.com> <87czre9uar.fsf@redhat.com>
 <ecb2932e-7595-c4a4-5480-9c77ecf3e34d@linux.ibm.com>
 <87wnpl8kgy.fsf@redhat.com>
 <49614371-1357-47dd-c000-c8ff6ff845b1@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <49614371-1357-47dd-c000-c8ff6ff845b1@linux.ibm.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: thuth@redhat.com, ehabkost@redhat.com, david@redhat.com,
 Cornelia Huck <cohuck@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 10:46:31AM +0200, Pierre Morel wrote:
> 
> 
> On 7/20/21 10:20 AM, Cornelia Huck wrote:
> > On Tue, Jul 20 2021, Pierre Morel <pmorel@linux.ibm.com> wrote:
> > 
> > > On 7/19/21 5:50 PM, Cornelia Huck wrote:
> > > > On Fri, Jul 16 2021, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > > Is the book/drawer thing architecture specific, or is it machine
> > > > > type / CPU specific. ie do /all/ the s390x machine types / CPUS
> > > > > QEMU support the book/drawer concept, or only a subset.
> > > > 
> > > > Should not be by machine type, but might be by cpu model (e.g. older
> > > > hardware lacking the needed support for exposing this to the guest.) IBM
> > > > folks, please correct me if I'm wrong.
> > > 
> > > 
> > > Looks correct to me this is an information indicated by a facility
> > > introduced with Z10 if I do not make an error.
> > 
> > Hm. Would that become a problem if we made availability of parameters
> > dependent upon a value in the machine (see the other thread I cc:ed you
> > on?)
> > 
> 
> Why?
> The parameter can always be there, it is just that with older cpu model we
> will not report the topology information to the guest.

I mostly see this as an error reporting problem, perhaps with an optional
capabilitty reporting facility.

eg if someone requests 'z9'  or older together with books > 1 or
drawers > 1, it would be ideal if QEMU reports an error message,
rather than silently ignoring it and not reporting this info to
the guest.

Taking it further, it some app queries CPU models  via QMP, it
could be desirable if the CPU model data returned indicates whether
drawers/books > 1 are conceptually available.  Likewise for dies
on x86, since I cna't imagine guest OS doing sensible things
with an i486 CPU and dies=2

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


