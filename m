Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C0B3FCCB0
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:56:45 +0200 (CEST)
Received: from localhost ([::1]:41838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL7zv-0003YA-BQ
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mL7vZ-0001O1-Tq
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:52:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mL7vV-0005Kh-5w
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:52:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630432320;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FdOnnHWzjinBIiO4mRD7fgf5WuOUyeKHqx82vrOORtU=;
 b=YEDST/d/RESI1MVEaG8K6sV2HcMauLLsPUchJdUbtbwX9ntm3aE2U0cPX8c6T8APUKLL/A
 doQntkwQXG8YhsW5BYTC88RgjKok3cemi58UEpFFgJJZ0zfxq0o6H5en3UEzQMgGR5dwAb
 pmy8YDGg7TUPqchFY64PXYnKxo3iArU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-26nCyXiFNn6P1nsmMOJg6Q-1; Tue, 31 Aug 2021 13:51:54 -0400
X-MC-Unique: 26nCyXiFNn6P1nsmMOJg6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05609107B7C6;
 Tue, 31 Aug 2021 17:51:54 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1931E18A5B;
 Tue, 31 Aug 2021 17:51:48 +0000 (UTC)
Date: Tue, 31 Aug 2021 18:51:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: qemu-sockets: account for trailing \0 byte in unix socket pathname
Message-ID: <YS5sMr746Bvz2hw+@redhat.com>
References: <20210830225449.1509719-1-mjt@msgid.tls.msk.ru>
 <c5887473-1df2-5827-e9c7-e6f0470ab332@msgid.tls.msk.ru>
 <CAMxuvawU2d6fFBczkDcPAJzYP4dSoin7UnesX2idHfd1WAyTOA@mail.gmail.com>
 <YS5pLKxTjguyUAlR@redhat.com>
 <5826ad07-380d-b84a-4d16-507312baff08@msgid.tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <5826ad07-380d-b84a-4d16-507312baff08@msgid.tls.msk.ru>
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 31, 2021 at 08:47:43PM +0300, Michael Tokarev wrote:
> 31.08.2021 20:38, Daniel P. Berrangé wrote:
> ...
> > > > So it looks like libvirt provides an unnamed socket there, --
> > > > maybe from a socketpair(2)?
> > > > 
> > > 
> > > Yes
> > 
> > No, libvirt binds to a named socket path and passes in a pre-opened
> > FD for the listener socket. There shouldn't be any socketpair involved.
> 
> Here's some more info from the original bugreport:
> 
> 31.08.2021 00:20, dann frazier wrote:
> > Aha! It seems that the important difference is whether or not the
> > virt-manager GUI window for the VM is active. If it is active, the VM
> > crashes regardless of how it is started (virsh console start/clicking
> > "play" button). If the GUI is not active, the VM always works.
> >
> > With this knowledge I am able to confidently say that reverting
> > 4cfd970ec1 *does* reliably avoid the problem.
> 
> We'll try to figure out the calltrace, where this socket is coming from..

Oh, it is probably from the graphical console connection to SPICE or VNC.
For those virt-manager will pass in a socket creted with socketpair()
via libvirt, in order to bypass the need for authentication when running
locally.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


