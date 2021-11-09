Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B6F44AAD6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 10:49:42 +0100 (CET)
Received: from localhost ([::1]:37156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkNl7-0001PU-Ed
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 04:49:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkNjX-0000am-7w
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 04:48:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkNjR-0004Ui-1b
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 04:48:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636451276;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HKNpK8TUQ6oAbRugjF6lHkBuWDqc9jecLMFeKmt0HTc=;
 b=HtsG80jIdnqLZmljTuG1N9k6SXdFi1ZvBKEpZcH3GUzHRXn7Q9Mn6YJOgqlsc35Uhj+wLB
 n44Hv/uou/LzUpR32BiWxXHdYzideTxnZ0uSL4HXVLkJ+YPe4LaXzk/Dl5BfY8mSh/vH6W
 4N6A5GwoZnI7JdLpLje/aVy9De7+dTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-NxZ0wopHNDiB8UqsVOhFWg-1; Tue, 09 Nov 2021 04:47:42 -0500
X-MC-Unique: NxZ0wopHNDiB8UqsVOhFWg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B09B7425C8;
 Tue,  9 Nov 2021 09:47:40 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78D0461093;
 Tue,  9 Nov 2021 09:47:15 +0000 (UTC)
Date: Tue, 9 Nov 2021 09:47:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 03/19] docs/devel: document expectations for QAPI data
 modelling for QMP
Message-ID: <YYpDoHn7p4XeZ90f@redhat.com>
References: <20210930132349.3601823-1-berrange@redhat.com>
 <20210930132349.3601823-4-berrange@redhat.com>
 <871r45p6er.fsf@dusky.pond.sub.org> <YXrAr3uTFchrH9+N@redhat.com>
 <YYKUKAJEveBv9FP+@redhat.com> <87ilx8h3wk.fsf@dusky.pond.sub.org>
 <YYOfv0buHL/9UMiy@redhat.com> <87bl2tg7dq.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87bl2tg7dq.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 09, 2021 at 07:39:29AM +0100, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Thu, Nov 04, 2021 at 06:43:23AM +0100, Markus Armbruster wrote:
> >> Daniel P. Berrangé <berrange@redhat.com> writes:
> >> 
> >> > On Thu, Oct 28, 2021 at 04:24:31PM +0100, Daniel P. Berrangé wrote:
> >> >> On Thu, Oct 28, 2021 at 04:31:40PM +0200, Markus Armbruster wrote:
> >> >> > This clashes with my "[PATCH v2 0/9] Configurable policy for handling
> >> >> > unstable interfaces", which replaces "you must give unstable stuff names
> >> >> > starting with 'x-'" by "you must give unstable stuff feature flag
> >> >> > 'unstable' (and may give it a name starting with 'x-')".
> >> >> 
> >> >> If your series goes in first, I'll update this to take account of it,
> >> >> but for now I'll leave it as is.
> >> >
> >> > This patch has now merged to git master.
> >> 
> >> Merge commit e86e00a2493, Nov 3.
> >> 
> >> > If you re-post your series feel free to update the new docs, or let
> >> > me know if you want me to do it afterwards.
> >> 
> >> The latter, because my series went in before yours, in merge commit
> >> dd61b91c080, Oct 29 :)
> >
> > Sigh, I'm blind ! Dunno how i missed that.
> 
> I can do it for you (it's such a simple patch), but I'd rather not do it
> in addition to you :)

I've not started yet, so I'll let you do it since you probably have a
better idea of the preferred language to describe it. I'll promise my
review services in return.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


