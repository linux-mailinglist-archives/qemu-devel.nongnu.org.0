Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5D644E44A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 10:58:06 +0100 (CET)
Received: from localhost ([::1]:57328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlTJs-0006aY-UF
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 04:58:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mlTIa-0005Vt-SY
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 04:56:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mlTIY-0006Cu-JZ
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 04:56:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636711001;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L0E3VQ8yvvolO1cTFzzrDQHyUlah3aHUWglX08l+6m4=;
 b=SLMmbS9cUHHz0n0oDb0sLMQ9VfrbuDIo/AIno5KM8hvcy5QtLbkjUeCp+DdKU1Za5WbnFE
 hz1rWaQb6ew+mso2ddkT91q/JwlLwCqMvPTgvjriiT+4UZG9La4wbUq6+rxAdqi4gnf04K
 ByN6Y3Iw8DnYT8iBoKjqlICaaK9Re2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-ynlK6N6bP6u1uL5in_4B1Q-1; Fri, 12 Nov 2021 04:56:38 -0500
X-MC-Unique: ynlK6N6bP6u1uL5in_4B1Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B418E19057A1;
 Fri, 12 Nov 2021 09:56:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 015D25DF21;
 Fri, 12 Nov 2021 09:56:19 +0000 (UTC)
Date: Fri, 12 Nov 2021 09:56:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Roman Kagan <rvkagan@yandex-team.ru>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>, yc-core@yandex-team.ru,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 05/10] vhost-backend: avoid overflow on memslots_limit
Message-ID: <YY46QcVhFa2qEMcB@redhat.com>
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
 <20211111153354.18807-6-rvkagan@yandex-team.ru>
 <681e58cf-af57-3c5d-423d-49f32c86dfcf@redhat.com>
 <YY4b5rZLB9151ZSN@rvkaganb.lan>
MIME-Version: 1.0
In-Reply-To: <YY4b5rZLB9151ZSN@rvkaganb.lan>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 12, 2021 at 10:46:46AM +0300, Roman Kagan wrote:
> On Thu, Nov 11, 2021 at 06:59:43PM +0100, Philippe Mathieu-Daudé wrote:
> > On 11/11/21 16:33, Roman Kagan wrote:
> > > Fix the (hypothetical) potential problem when the value parsed out of
> > > the vhost module parameter in sysfs overflows the return value from
> > > vhost_kernel_memslots_limit.
> > > 
> > > Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> > > ---
> > >  hw/virtio/vhost-backend.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> > > index b65f8f7e97..44f7dbb243 100644
> > > --- a/hw/virtio/vhost-backend.c
> > > +++ b/hw/virtio/vhost-backend.c
> > > @@ -58,7 +58,7 @@ static int vhost_kernel_memslots_limit(struct vhost_dev *dev)
> > >      if (g_file_get_contents("/sys/module/vhost/parameters/max_mem_regions",
> > >                              &s, NULL, NULL)) {
> > >          uint64_t val = g_ascii_strtoull(s, NULL, 10);
> > 
> > Would using qemu_strtou64() simplify this?
> 
> I'm afraid not.  None of the existing strtoXX converting functions has
> the desired output range (0 < retval < INT_MAX), so the following
> condition will remain necessary anyway; then it doesn't seem to matter
> which particular parser is used to extract the value which is in the
> range, so I left the one that was already there to reduce churn.

If  qemu_strtou64() can't handle all values in (0 < retval < INT_MAX)
isn't that a bug in qemu_strtou64 ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


