Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46794ABFBC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 14:48:13 +0100 (CET)
Received: from localhost ([::1]:38104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH4NI-0000Zw-AT
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 08:48:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nH3j5-0004dZ-Pu
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 08:06:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nH3j0-0007zv-Pu
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 08:06:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644239165;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=JL40DXLtA6+/0er4jc+M9Z/bxjaZ5jWDU8/HL0xb6hQ=;
 b=IEcHKrDANulIFTT/nFUaP4qccccLUck8htmfobe8rSfKjycQgLy+CtKPJYWuAbXCDWGqNk
 jTleIMcbY19WZPxHxQtOlu57JyIKmXo2Pnc7bx/SC4UhbvTMaiI6ZtCqPj5bE0cAYXkMJI
 OgtU3wyHFO6l80TG3qU2BA49qiJQFow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-6ZedF9FxOJeD0Wg04ugyVA-1; Mon, 07 Feb 2022 08:05:59 -0500
X-MC-Unique: 6ZedF9FxOJeD0Wg04ugyVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C58A15A07E
 for <qemu-devel@nongnu.org>; Mon,  7 Feb 2022 13:05:58 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFC8C752DC;
 Mon,  7 Feb 2022 13:05:19 +0000 (UTC)
Date: Mon, 7 Feb 2022 13:05:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v5 0/9] virtiofsd: Add support for file security context
 at file creation
Message-ID: <YgEZDOcFr80tZGWd@redhat.com>
References: <20220202193935.268777-1-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220202193935.268777-1-vgoyal@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 02, 2022 at 02:39:26PM -0500, Vivek Goyal wrote:
> Hi,
> 
> This is V5 of the patches. I posted V4 here.
> 
> https://listman.redhat.com/archives/virtio-fs/2022-January/msg00041.html
> 
> These will allow us to support SELinux with virtiofs. This will send
> SELinux context at file creation to server and server can set it on
> file.

I've not entirely figured it out from the code, so easier for me
to ask...

How is the SELinux labelled stored on the host side ? It is stored
directly in the security.* xattr namespace, or is is subject to
xattr remapping that virtiofsd already supports.

Storing directly means virtiofsd has to run in an essentially
unconfined context, to let it do arbitrary  changes on security.*
xattrs without being blocked by SELinux) and has risk that guest
initiated changes can open holes in the host confinement if
the exported FS is generally visible to processes on the host.


Using remapping lets virtiofsd be strictly isolated by SELinux
policy on the host, and ensures that guest context changes
can't open up holes in the host.

Both are valid use cases, so I'd ultimately expect us to want
to support both, but my preference for a "default" behaviour
would be remapping.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


