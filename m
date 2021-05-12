Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4A237C535
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:38:49 +0200 (CEST)
Received: from localhost ([::1]:46638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqwi-0007xP-4n
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgqub-0005yi-VK
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:36:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgquZ-0003DS-LJ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620833794;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oe2RseuvS3c7iCYv1fxJ68r0oNItMyp9I6uxqBWSnA0=;
 b=BzFOMY8dkGW2EAfqLagxaQz941N9srRq5I4GjTUZ+7waAk4dF0JHrz7K6/cVdGbHYf0xrL
 e70WZDBVXueASzY72WYON6TKNa64JGVXf6cjc80KT2OnLnK8EvP4qaexhiQyMyu5mKbdpj
 CjZBmU7cf4t7e/sN66890ttWkSXLol8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-c8ekOx1SMeSrmSwtkiUUuA-1; Wed, 12 May 2021 11:36:32 -0400
X-MC-Unique: c8ekOx1SMeSrmSwtkiUUuA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFC9E1020C37
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 15:36:31 +0000 (UTC)
Received: from redhat.com (ovpn-114-167.ams2.redhat.com [10.36.114.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E38305D9D7;
 Wed, 12 May 2021 15:36:30 +0000 (UTC)
Date: Wed, 12 May 2021 16:36:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/2] net/tap: fix error reporting when bridge helper
 forgets to send an FD
Message-ID: <YJv1+040uquItA9O@redhat.com>
References: <20210505121236.532755-1-berrange@redhat.com>
 <20210505121236.532755-3-berrange@redhat.com>
 <d249a2d4-2155-b221-037d-22b82afc94f7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d249a2d4-2155-b221-037d-22b82afc94f7@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 05, 2021 at 02:32:04PM +0200, Philippe Mathieu-Daudé wrote:
> On 5/5/21 2:12 PM, Daniel P. Berrangé wrote:
> > The recv_fd() method returns -1 on error, 0 on end of file, or an FD
> > number on success.
> > 
> > Technically 0 is also a valid FD number, so the return value is
> > ambiguous.
> > 
> > The caller doesn't even consider the possibility of 0 meaning end
> > of file, so just blindly assume it is a valid FD.
> > 
> > IOW if the bridge helper exits with 0 status code and forgets to
> > send an FD, QEMU will accidentally try to use STDIN as a TAP FD.
> > 
> > Fortunately we get an error shortly thereafter
> > 
> >  $ qemu-system-x86_64 -netdev bridge,br=br99,helper=/bin/true,id=ns0
> >  qemu-system-x86_64: -netdev bridge,br=br99,helper=/bin/true,id=ns0:
> >    Unable to query TUNGETIFF on FD 0: Inappropriate ioctl for device
> > 
> > It is better if we correctly diagnose this broken bridge helper
> > though. To do this we need to return the FD in an output parameter
> > to remove the ambiguity and then fix the caller to check for the
> > end of file condition. With this done we now get
> > 
> >   $ qemu-system-x86_64 -netdev bridge,br=br99,helper=/bin/true,id=ns0
> >   qemu-system-x86_64: -netdev bridge,br=br99,helper=/bin/true,id=ns0:
> >     bridge helper did not send a file descriptor
> > 
> > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/166
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  net/tap.c | 32 ++++++++++++++++++++++----------
> >  1 file changed, 22 insertions(+), 10 deletions(-)
> 
> > +        /*
> > +         * ret == 0 means EOF, and if status == 0 then helper
> > +         * exited cleanly but forgot to send us an FD. Opps...
> 
> Opps or Oops?

Oops, it should be Oops :-)

> 
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


