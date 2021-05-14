Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E29238093C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:13:04 +0200 (CEST)
Received: from localhost ([::1]:60506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWgh-0004r8-IW
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhWZZ-0007p3-Nt
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:05:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhWZX-00071S-TH
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620993939;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=10f3OOVF2aB5XyPgGrypM2mVeITqE55I760zVMyuWOU=;
 b=cZF9EHYbpur4zUlEIo5IBccHzU2vHizV0svkK0o61gk8Oz/CKNV7NJSkn+PeCQ8OrgXUcW
 QpzZsHx03rn3xabUwnNYZwDAhd0uoCCiifh32+e+DEMeE1HfBBQTsJrQbcv0JAYA6pKC2Y
 /5Cs2CrLM6Iaiy7LGlxlpTKUO5umAJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-LVu__YJFN-6F7f9aqvh5lg-1; Fri, 14 May 2021 08:05:34 -0400
X-MC-Unique: LVu__YJFN-6F7f9aqvh5lg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97B98805EF2
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 12:05:33 +0000 (UTC)
Received: from redhat.com (ovpn-113-212.ams2.redhat.com [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55A575F9B8;
 Fri, 14 May 2021 12:05:32 +0000 (UTC)
Date: Fri, 14 May 2021 13:05:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 1/2] net/tap: fix FreeBSD portability problem
 receiving TAP FD
Message-ID: <YJ5niaz6w7BZz5BU@redhat.com>
References: <20210512153654.1178035-1-berrange@redhat.com>
 <20210512153654.1178035-2-berrange@redhat.com>
 <a647f9f7-05c7-4bcc-3b25-22e22f4727df@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a647f9f7-05c7-4bcc-3b25-22e22f4727df@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Connor Kuehl <ckuehl@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 12, 2021 at 06:35:57PM +0200, Philippe Mathieu-Daudé wrote:
> On 5/12/21 5:36 PM, Daniel P. Berrangé wrote:
> > The CMSG_LEN and CMSG_SPACE macros must not be assumed to return the
> > same value. The msg_controllen field must be initialized using
> > CMSG_SPACE when using SCM_RIGHTS.
> > 
> > This ought to fix any FD receive issues users might be hitting on
> > 64-bit FeeBSD / NetBSD platforms. The flaw was noticed first in
> > GNULIB
> > 
> >    https://lists.gnu.org/archive/html/bug-gnulib/2021-02/msg00066.html
> > 
> > and QEMU's code has the same logic bug.
> > 
> > Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  net/tap.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/net/tap.c b/net/tap.c
> > index bae895e287..276a9077fc 100644
> > --- a/net/tap.c
> > +++ b/net/tap.c
> > @@ -467,7 +467,7 @@ static int recv_fd(int c)
> >      cmsg->cmsg_level = SOL_SOCKET;
> >      cmsg->cmsg_type = SCM_RIGHTS;
> >      cmsg->cmsg_len = CMSG_LEN(sizeof(fd));
> > -    msg.msg_controllen = cmsg->cmsg_len;
> > +    msg.msg_controllen = CMSG_SPACE(sizeof(fd));
> >  
> >      iov.iov_base = req;
> >      iov.iov_len = sizeof(req);
> > 
> 
> Possibly more:

Ewwwww, yes :-(



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


