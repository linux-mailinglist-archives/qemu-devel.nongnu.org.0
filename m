Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC31537C4E5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:36:29 +0200 (CEST)
Received: from localhost ([::1]:41776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgquS-0004W4-Um
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgqt0-00035M-JE
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:34:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgqsy-00026m-17
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620833695;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=etxX2GNctVn19Q7VM6d6tIyKZkt+BM6KVtlvmP90idQ=;
 b=HEgTXeyVsmpBhQrMeKspnJK4KmKjvwIJVDntIGmPXcEddReZ1P/L5o57klrow4cibolkjo
 srsw2PSAqUZVgyShvLgb5uB9+1XAN6aTZZo4OFwgHQnIv2kO/SE/6Z1oOQHc4NaaZbGpXz
 kyyGUDY7/Ad+AbOvs09lKJ0SiovMY6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-JYwvv0l8O3ijXCjWLoyMzA-1; Wed, 12 May 2021 11:34:53 -0400
X-MC-Unique: JYwvv0l8O3ijXCjWLoyMzA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FD96801B19
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 15:34:50 +0000 (UTC)
Received: from redhat.com (ovpn-114-167.ams2.redhat.com [10.36.114.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED0695D9D7;
 Wed, 12 May 2021 15:34:48 +0000 (UTC)
Date: Wed, 12 May 2021 16:34:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [PATCH 2/2] net/tap: fix error reporting when bridge helper
 forgets to send an FD
Message-ID: <YJv1lsg4R3yiyoAq@redhat.com>
References: <20210505121236.532755-1-berrange@redhat.com>
 <20210505121236.532755-3-berrange@redhat.com>
 <016fea53-3482-b85b-c5e0-9ea70d49aace@redhat.com>
MIME-Version: 1.0
In-Reply-To: <016fea53-3482-b85b-c5e0-9ea70d49aace@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
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

On Tue, May 11, 2021 at 01:53:39PM -0500, Connor Kuehl wrote:
> On 5/5/21 7:12 AM, Daniel P. Berrangé wrote:
> > [..]
> > The recv_fd() method returns -1 on error, 0 on end of file, or an FD
> >   $ qemu-system-x86_64 -netdev bridge,br=br99,helper=/bin/true,id=ns0
> >   qemu-system-x86_64: -netdev bridge,br=br99,helper=/bin/true,id=ns0:
> >     bridge helper did not send a file descriptor
> > [..]
> >          }
> > +
> > +        /*
> > +         * ret == 0 means EOF, and if status == 0 then helper
> > +         * exited cleanly but forgot to send us an FD. Opps...
> > +         */
> > +        if (ret == 0) {
> > +            error_setg(errp, "bridge helper did not send a file
> > descriptor");
> 
> Is it possible to include the name of the helper that's at fault here?
> Could be helpful for debugging if the command line includes multiple
> netdev opts with a helper parameter (unless that's literally impossible).

Yes, easy change.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


