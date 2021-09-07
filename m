Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AA8402A3D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:53:50 +0200 (CEST)
Received: from localhost ([::1]:48674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbXp-0006ID-JJ
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNb3u-0001Dw-6J
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:22:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNb3o-0006Ui-K3
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631020967;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=i37mGLZkCZYCqIYZMR3W1Qm2oAbIxpdGns1EylMOKWY=;
 b=HPdLgXVhzdFqY8zX4qRGAKWoXbiQjJzeswB9cvdK1tFnCoS5p/7kbUHXCQnF+IS03z/HVv
 NYxxIXRwVQoNQC2Ii4K7aMWpVM/Bxkfg525xGiy4reWjZKIoYGDVrYAY4bVy6wEGZWmjEz
 JWKVwHGZU83LClY0lprP0xNlxzHndW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-wZuQ5l2nMaydyRIM7pXW2g-1; Tue, 07 Sep 2021 09:22:41 -0400
X-MC-Unique: wZuQ5l2nMaydyRIM7pXW2g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5B531940935;
 Tue,  7 Sep 2021 13:22:40 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A9B660C5F;
 Tue,  7 Sep 2021 13:22:27 +0000 (UTC)
Date: Tue, 7 Sep 2021 14:22:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] vhost-vsock: fix migration issue when seqpacket is
 supported
Message-ID: <YTdnkPR+LjNFXaeQ@redhat.com>
References: <20210907124935.147164-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210907124935.147164-1-sgarzare@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Jiang Wang <jiang.wang@bytedance.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 07, 2021 at 02:49:35PM +0200, Stefano Garzarella wrote:
> Commit 1e08fd0a46 ("vhost-vsock: SOCK_SEQPACKET feature bit support")
> enabled the SEQPACKET feature bit.
> This commit is released with QEMU 6.1, so if we try to migrate a VM where
> the host kernel supports SEQPACKET but machine type version is less than
> 6.1, we get the following errors:
> 
>     Features 0x130000002 unsupported. Allowed features: 0x179000000
>     Failed to load virtio-vhost_vsock:virtio
>     error while loading state for instance 0x0 of device '0000:00:05.0/virtio-vhost_vsock'
>     load of migration failed: Operation not permitted
> 
> Let's disable the feature bit for machine types < 6.1, adding a
> `features` field to VHostVSock to simplify the handling of upcoming
> features we will support.

IIUC, this will still leave migration broken for anyone migrating
a >= 6.1 machine type between a kernel that supports SEQPACKET and
a kernel lacking that, or vica-verca.  

If a feature is dependant on a host kernel feature we can't turn
that on automatically as part of the machine type, as we need
ABI stability across migration indepdant of kernel version.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


