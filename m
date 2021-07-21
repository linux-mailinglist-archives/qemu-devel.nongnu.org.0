Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC25B3D0C9D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:59:16 +0200 (CEST)
Received: from localhost ([::1]:54592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69wZ-0003yd-W5
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m69vJ-0001ip-Ll
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:57:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m69vD-0001qc-Kq
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626865070;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=g5c3R01aFj93JWP6SUgk3mIk3oKSDYA7Yb7PKq77ukg=;
 b=NRSa4FhdVSG3tN0sJGZjDilVIBnEzIdQ93CkxF/Vt9KdMGhWhwZhWMQO9wRKkeF6J5FRVb
 aWBnQbKXtHGHSutX7FENx09fgTeuDOcqVof+iuOu1s5uSej+YTjMbosF2VBkRwgOeGs9eF
 nqojxAoBGOkpU1ww8Guksu0l1kTki44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-Znj_B02gNu2X1L8wu1YP4g-1; Wed, 21 Jul 2021 06:57:48 -0400
X-MC-Unique: Znj_B02gNu2X1L8wu1YP4g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6FD05A064;
 Wed, 21 Jul 2021 10:57:47 +0000 (UTC)
Received: from redhat.com (ovpn-114-135.ams2.redhat.com [10.36.114.135])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A6C35453A;
 Wed, 21 Jul 2021 10:57:42 +0000 (UTC)
Date: Wed, 21 Jul 2021 11:57:39 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 4/5] migration: Teach QEMUFile to be QIOChannel-aware
Message-ID: <YPf9oxwq7U42RZVp@redhat.com>
References: <20210721012134.792845-1-peterx@redhat.com>
 <20210721012134.792845-5-peterx@redhat.com>
 <YPf2oCUmObpCkMeG@work-vm>
MIME-Version: 1.0
In-Reply-To: <YPf2oCUmObpCkMeG@work-vm>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 21, 2021 at 11:27:44AM +0100, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > migration uses QIOChannel typed qemufiles.  In follow up patches, we'll need
> > the capability to identify this fact, so that we can get the backing QIOChannel
> > from a QEMUFile.
> > 
> > We can also define types for QEMUFile but so far since we only need to be able
> > to identify QIOChannel, introduce a boolean which is simpler.
> > 
> > No functional change.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> This is messy but I can't see another quick way; the better way would be
> to add an OBJECT or QIOCHannel wrapper for BlockDriverState.

I looked at making a QIOChannel for BlockDriverState but it was not
as easy as it might seem.  The problem is that the QEMUFile
get_buffer / write_buffer methods take a offset at which the
I/O operation is required to be applied.

For the existing QIOChannel impl for migration, we simply ignore
the 'pos' argument entirely, since it is irrelevant for the main
migration channel doing streaming.

For a BlockDriverState based impl though I think we need to
honour "pos" in some manner.

I think it ought to be possible to rewrite the savevm code
so that it uses 'seek' in the few places it needs to, and
then we can drop "pos" from get_buffer/write_buffer, but
that requires careful consideration.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


