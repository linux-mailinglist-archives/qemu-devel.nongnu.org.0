Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95214340558
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 13:17:56 +0100 (CET)
Received: from localhost ([::1]:43442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMrb9-0000z7-KV
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 08:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMrVd-0006rX-Nw
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 08:12:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMrVc-0000iy-6K
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 08:12:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616069531;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=4FZhVneuDhL/yvFcMR9W5399J8H+Fl9JON+RBeSr5gQ=;
 b=Oc5+TRsEdObuUmsBMWHbcFjjqWXT7KqtYxURMCOQSie2dxUDCmTCw0kWuEDVbaPG6ag3Ul
 jVzbTMnTaW380CuMJaDx3rc5my/oODpc18WCuN5wL/xZtf79iS6mdfF6NThOCSK7tr+jTA
 RO9h9pNO+Zmg1yUsgmhmC4uOMclVgK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-62QjWGHnO42hv-yCpkU8Sw-1; Thu, 18 Mar 2021 08:11:54 -0400
X-MC-Unique: 62QjWGHnO42hv-yCpkU8Sw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1859E18C89D9;
 Thu, 18 Mar 2021 12:11:52 +0000 (UTC)
Received: from redhat.com (ovpn-115-61.ams2.redhat.com [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24BC260622;
 Thu, 18 Mar 2021 12:11:43 +0000 (UTC)
Date: Thu, 18 Mar 2021 12:11:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PULL 00/11] emulated nvme updates and fixes
Message-ID: <YFNDfeymKdQN/XT2@redhat.com>
References: <20210316214753.399389-1-its@irrelevant.dk>
 <CAFEAcA8_rcfiYz4NSqY1QKA-FMPK7Hk3xcVvFbXGZnXw_HKuYA@mail.gmail.com>
 <YFM5MjqxwMiddbaB@apples.localdomain>
 <CAFEAcA9YZPbUVCgwaxsMjmkCbYN1uTv=N4P9VjUiktBD_0JRPQ@mail.gmail.com>
 <YFNBNjvRQgLh9Vh3@apples.localdomain>
MIME-Version: 1.0
In-Reply-To: <YFNBNjvRQgLh9Vh3@apples.localdomain>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 18, 2021 at 01:01:58PM +0100, Klaus Jensen wrote:
> On Mar 18 11:28, Peter Maydell wrote:
> > On Thu, 18 Mar 2021 at 11:27, Klaus Jensen <its@irrelevant.dk> wrote:
> > >
> > > On Mar 18 11:26, Peter Maydell wrote:
> > > > On Tue, 16 Mar 2021 at 21:47, Klaus Jensen <its@irrelevant.dk> wrote:
> > > > Hi. This tag includes a submodule update which is not mentioned
> > > > in the cover letter or listed in the cover letter diffstat:
> > > >
> > > >  roms/opensbi           |    2 +-
> > > >
> > > > so I suspect it was inadvertent. Please fix up and resend.
> > > >
> > >
> > > Oh crap. Sorry!
> > 
> > No worries -- git makes this a very easy mistake to make when
> > doing rebases. That's why I have a check for it in my 'apply
> > a pull request' scripts :-)
> > 
> 
> Out of curiosity, are there any obvious safe guards I can implement
> myself to stop this from happening?

AFAICT, latest versions of git no longer add a submodule when doing
"git add -u". You have to explicitly specify the submodule path
to stage it. So this prevent exactly this kind of accident.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


