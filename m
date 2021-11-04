Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758994450B5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 09:57:53 +0100 (CET)
Received: from localhost ([::1]:45088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miYZE-0000Hx-3V
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 04:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1miYWm-0006Wr-3f
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:55:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1miYWi-0000Rm-Jw
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:55:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636016115;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OH89+NDm04SeFPGK34/Tocxlw60qdQoGpGsVtDMOv/g=;
 b=gj/jaRIlT9LujN69e6Lvy89mTDR+oxRBCyojcD+sFWeT8PN4fM8P7nHlDBJZarNibWIemf
 jQ8IDuFXM/ngiV9rsTGB/jDnQvp9ZF0EIwlaX9inq96HICfJntHZx2vLX3DfAbTVLhWMf4
 J6/GlZQEtW2l9Ir5gTvYFFDvAh6xKiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-paQHIlwiO8KKduGSpFwfNA-1; Thu, 04 Nov 2021 04:55:05 -0400
X-MC-Unique: paQHIlwiO8KKduGSpFwfNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E5CF1006AA2;
 Thu,  4 Nov 2021 08:55:03 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C8F1101E5BF;
 Thu,  4 Nov 2021 08:54:26 +0000 (UTC)
Date: Thu, 4 Nov 2021 08:54:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 03/19] docs/devel: document expectations for QAPI data
 modelling for QMP
Message-ID: <YYOfv0buHL/9UMiy@redhat.com>
References: <20210930132349.3601823-1-berrange@redhat.com>
 <20210930132349.3601823-4-berrange@redhat.com>
 <871r45p6er.fsf@dusky.pond.sub.org> <YXrAr3uTFchrH9+N@redhat.com>
 <YYKUKAJEveBv9FP+@redhat.com> <87ilx8h3wk.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87ilx8h3wk.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Thu, Nov 04, 2021 at 06:43:23AM +0100, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Thu, Oct 28, 2021 at 04:24:31PM +0100, Daniel P. Berrangé wrote:
> >> On Thu, Oct 28, 2021 at 04:31:40PM +0200, Markus Armbruster wrote:
> >> > This clashes with my "[PATCH v2 0/9] Configurable policy for handling
> >> > unstable interfaces", which replaces "you must give unstable stuff names
> >> > starting with 'x-'" by "you must give unstable stuff feature flag
> >> > 'unstable' (and may give it a name starting with 'x-')".
> >> 
> >> If your series goes in first, I'll update this to take account of it,
> >> but for now I'll leave it as is.
> >
> > This patch has now merged to git master.
> 
> Merge commit e86e00a2493, Nov 3.
> 
> > If you re-post your series feel free to update the new docs, or let
> > me know if you want me to do it afterwards.
> 
> The latter, because my series went in before yours, in merge commit
> dd61b91c080, Oct 29 :)

Sigh, I'm blind ! Dunno how i missed that.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


