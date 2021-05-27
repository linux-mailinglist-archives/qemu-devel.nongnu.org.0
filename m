Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4AC3929DC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 10:48:26 +0200 (CEST)
Received: from localhost ([::1]:46112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmBgn-0002pa-Ai
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 04:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lmBfh-0001eX-D0
 for qemu-devel@nongnu.org; Thu, 27 May 2021 04:47:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lmBfe-0003gD-MT
 for qemu-devel@nongnu.org; Thu, 27 May 2021 04:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622105232;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=obCSaUqWoPY8cB0S4SdXLBaF3ueMA+hF5AmaJtaqpnk=;
 b=dZEy2M8QKcd8krfJ3Re7FaCo17Iy4Q+nRgpcwippqJEdz+DVVK47rPmmGrOJJn9GlyOcyU
 iKs9iULNNmP6Vy0TrPeWSyd65D5JBm2cQPuFDQ1pNNcmbHpfUofRaRhp+pFq6PTZSjdg1T
 /Wm/8rTcX/Pp3RGipxil/VWP42qAeZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-ZfwvYy87OzqQXnWqBfIlQA-1; Thu, 27 May 2021 04:47:06 -0400
X-MC-Unique: ZfwvYy87OzqQXnWqBfIlQA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 937F56D5C0;
 Thu, 27 May 2021 08:47:05 +0000 (UTC)
Received: from redhat.com (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3BD067881;
 Thu, 27 May 2021 08:46:57 +0000 (UTC)
Date: Thu, 27 May 2021 09:46:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 1/1] yank: Unregister function when using TLS migration
Message-ID: <YK9cfiUx+vk/yxtf@redhat.com>
References: <20210526200540.1088333-1-leobras.c@gmail.com>
 <YK6yQ9EVNlVPDMaS@t490s> <20210526232103.39e2a7d0@gecko.fritz.box>
 <YK7EotQbx/F9avls@t490s>
MIME-Version: 1.0
In-Reply-To: <YK7EotQbx/F9avls@t490s>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras.c@gmail.com>,
 Lukas Straub <lukasstraub2@web.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 26, 2021 at 05:58:58PM -0400, Peter Xu wrote:
> On Wed, May 26, 2021 at 11:21:03PM +0200, Lukas Straub wrote:
> > On Wed, 26 May 2021 16:40:35 -0400
> > Peter Xu <peterx@redhat.com> wrote:
> > 
> > > On Wed, May 26, 2021 at 05:05:40PM -0300, Leonardo Bras wrote:
> > > > After yank feature was introduced, whenever migration is started using TLS,
> > > > the following error happens in both source and destination hosts:
> > > > 
> > > > (qemu) qemu-kvm: ../util/yank.c:107: yank_unregister_instance:
> > > > Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
> > > > 
> > > > This happens because of a missing yank_unregister_function() when using
> > > > qio-channel-tls.
> > > > 
> > > > Fix this by also allowing TYPE_QIO_CHANNEL_TLS object type to perform
> > > > yank_unregister_function() in channel_close() and multifd_load_cleanup().
> > > > 
> > > > Fixes: 50186051f ("Introduce yank feature")
> > > > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1964326
> > > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>  
> > > 
> > > Leo,
> > > 
> > > Thanks for looking into it!
> > > 
> > > So before looking int the fix... I do have a doubt on why we only enable yank
> > > on socket typed, as I think tls should also work with qio_channel_shutdown().
> > > 
> > > IIUC the confused thing here is we register only for qio-socket, however tls
> > > will actually call migration_channel_connect() twice, first with a qio-socket,
> > > then with the real tls-socket.  For tls I feel like we have registered with the
> > > wrong channel - instead of the wrapper socket ioc, we should register to the
> > > final tls ioc?
> > > 
> > > Lukas, is there a reason?
> > > 
> > 
> > Hi,
> > There is no specific reason. Both ways work equally well in preventing
> > qemu from hanging. shutdown() for tls-channel just makes it abort a
> > little sooner (by not attempting to encrypt and send data anymore).
> > 
> > I don't lean either way. I guess registering it on the tls-channel
> > makes is a bit more explicit and clearer.
> 
> Agreed, because IMHO logically the migration code should not be aware of
> internals of IOChannels, e.g., we shouldn't need to know ioc->master is the
> socket ioc of tls ioc to unregister.

I think it is atually better to ignore the TLS channel and *always* yank
on the undering socket IO channel. The yank functionality is intended to
be used in a scenario where we know the channels are broken.  If yank
calls the high level IO channel it is potentially going to try to do a
cleanup shutdown that we know will fail because of the broken network.

Conceptually we just want to yank out the socket channel and leave
everything above that to just deal with the fallout of the terminated
socket.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


