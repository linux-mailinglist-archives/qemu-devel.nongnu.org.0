Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556193C2553
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 15:55:58 +0200 (CEST)
Received: from localhost ([::1]:43582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1qyz-0006dg-5u
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 09:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m1qxn-0005z9-L5
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 09:54:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m1qxj-0005Vp-8s
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 09:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625838877;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yDU/GjTUJQv4aQ6ZITCJHY6f9CVksz0DqdhDVvwtPdk=;
 b=bxpZuJ1Q9IP8wwNnh2SOozkFrJBNW5QUUxLUemUXZT0FxZ3wGjNXMspVIZTzdH8Fjv8+TK
 X8XaXXcx4NdwndfTVz5NXeCtCf55uMkX7RAuDa/q/GKi8nWzArt+7L7V+WKQpCxsH0jOeG
 5Fp3p5ufa5YOjovQHylVi4P0R5xiets=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-065iDWkhPoyA1XzGnq8bvA-1; Fri, 09 Jul 2021 09:54:33 -0400
X-MC-Unique: 065iDWkhPoyA1XzGnq8bvA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7913804300
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 13:54:32 +0000 (UTC)
Received: from redhat.com (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D2965D6A8;
 Fri,  9 Jul 2021 13:54:27 +0000 (UTC)
Date: Fri, 9 Jul 2021 14:53:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 08/18] crypto: add crypto tests for single block DES-ECB
 and DES-CBC
Message-ID: <YOhU9M9Tyn2KkN51@redhat.com>
References: <20210706095924.764117-1-berrange@redhat.com>
 <20210706095924.764117-9-berrange@redhat.com>
 <20210708185054.gec3r7novpn7ogzm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210708185054.gec3r7novpn7ogzm@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 01:50:54PM -0500, Eric Blake wrote:
> On Tue, Jul 06, 2021 at 10:59:14AM +0100, Daniel P. Berrangé wrote:
> > The GNUTLS crypto provider doesn't support DES-ECB, only DES-CBC.
> 
> I had to go research these terms; DES-ECB is weaker (each block
> encrypted on its own), DES-CBC is stronger (the encryption of later
> blocks depend on the earlier text).  Makes sense that GNUTLS has
> dropped support for the weaker form.
> 
> > We can use the latter to simulate the former, if we encrypt only
> > 1 block (8 bytes) of data at a time, using a all-zeros IV. This
> 
> using an all-zeros
> 
> > is a very inefficient way to use the QCryptoCipher APIs, but
> > since the VNC authentication challenge is only 16 bytes, this
> > is acceptable. No other part of QEMU should be using DES. This
> > test case demonstrates the equivalence of ECB and CBC for the
> > single-block case.
> 
> Agreed - both on the inefficiency (we're throwing away all the work
> spent on chaining the later blocks - thankfully there is only one such
> block in our 16-byte challenge), and on the fact that DES should be
> avoided where possible (our sole use is due to VNC's less-than-stellar
> "security").

Actually there isn't any work wasted chaining blocks, because we're
only writing one block of data.

The inefficiency is because we have to constantly re-create the
cipher context object after every 8 bytes. This massively dominates
over the cipher speed.

> 
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  tests/unit/test-crypto-cipher.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


