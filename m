Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BF34D06E8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:51:43 +0100 (CET)
Received: from localhost ([::1]:37240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRISM-0007HT-Ap
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:51:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRIPl-00054w-Nx
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:49:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRIPi-0001X8-Ai
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646678936;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZM6asNfd5Geo220pY1pPJSQ382x5LYZk+22PK9wBsyU=;
 b=avoJw+A7Cwo5YZsAwFYEMF+GLeLe9oI0geE3twK7HK7Y+ccROKqfeQwO3X0tQOvAcOWvFz
 NbcM8lgC//Zozi2X6KlK9ecvFFgm6FYZKNZgX+bi+1MYD4LlvFmoTgbWR2d6plyxuER3+q
 3kZdTyfMsFeQABNkMS2l9NbF5RV6cxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-JpjL0GtXPG66u2-i1nUD1g-1; Mon, 07 Mar 2022 13:48:51 -0500
X-MC-Unique: JpjL0GtXPG66u2-i1nUD1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F9C251DF;
 Mon,  7 Mar 2022 18:48:50 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 090B280FD8;
 Mon,  7 Mar 2022 18:48:37 +0000 (UTC)
Date: Mon, 7 Mar 2022 18:48:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/avocado: Cancel BootLinux tests in case there is
 no free port
Message-ID: <YiZTggnk26UymcVY@redhat.com>
References: <20220228114325.818294-1-thuth@redhat.com>
 <YiX/kzf7cW+YcNN5@redhat.com>
 <82a2233a-8bd2-66ef-b8f0-d44c039eeb52@redhat.com>
MIME-Version: 1.0
In-Reply-To: <82a2233a-8bd2-66ef-b8f0-d44c039eeb52@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
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
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 07, 2022 at 07:31:50PM +0100, Thomas Huth wrote:
> On 07/03/2022 13.50, Daniel P. Berrangé wrote:
> > On Mon, Feb 28, 2022 at 12:43:25PM +0100, Thomas Huth wrote:
> > > The BootLinux tests are currently failing with an ugly python
> > > stack trace on my RHEL8 system since they cannot get a free port
> > > (likely due to the firewall settings on my system). Let's properly
> > > check the return value of find_free_port() instead and cancel the
> > > test gracefully if it cannot get a free port.
> > > 
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > ---
> > >   Unfortunately, it still takes > 70 seconds for each and every
> > >   tests from tests/avocado/boot_linux.py to get canceled, so
> > >   tests/avocado/boot_linux.py still renders "make check-avocado"
> > >   for me pretty unusable... looking at the implementation of
> > >   find_free_port() in Avocado, I wonder whether there isn't a
> > >   better way to get a free port number in Python? Brute-forcing
> > >   all ports between 1024 and 65536 seems just quite cumbersome
> > >   to me...
> > 
> > Even in the worst case of testing every single port,
> > for INET and INET6 and for STREAM and DGRAM sockets,
> > that find_free_port port completes in a couple of
> > seconds.
> 
> Weird, on my system, the test runs for 70 seconds, just to finally
> discovered that there was no free port available.

Incidentally I'm really suprised you even hit the 'no free port'
scenario. I've never seen that happen unless the machine was
basically doomed due to something leaking open sockets by the
10's of 1000's.

You mention firewall settings above, but I don't think that's
relevant. The find_free_port() call is with no args, so it
gets set to 'address=localhost' which means is_port_free
takes the bind() codepath. The firewall has no interaction
with the bind() codepath in the kernel AFAIK. 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


