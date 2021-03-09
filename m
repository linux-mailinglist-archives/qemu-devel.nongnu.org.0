Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7FF332233
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 10:40:31 +0100 (CET)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJYqs-0007jw-NU
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 04:40:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJYo2-0006m8-HK
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:37:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJYo0-00010w-05
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:37:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615282651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x6VqVhZmPKO6OAxZyXg1r4CUQMlH1kLy9P5mmJEAz1E=;
 b=RIdKSNO8K0XM52i0P5cSrEv/rCh65GC8urRhizrr8ysxd/muUtwPtRPloZMzmaGg7R4Dlj
 N53TkUKwkobJS8bQ+mGBuakHdnEn4bbXxMpan2kbHcOOnxelGQmaIghtP3kqboLeEasOP5
 PiW8T5sTniUqDZVyE0lY7+YRzKuT414=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-Akc0huDPOK-8M6IUpTTczA-1; Tue, 09 Mar 2021 04:37:29 -0500
X-MC-Unique: Akc0huDPOK-8M6IUpTTczA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 080021084D68;
 Tue,  9 Mar 2021 09:37:28 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-169.ams2.redhat.com [10.36.114.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E378D6062F;
 Tue,  9 Mar 2021 09:37:19 +0000 (UTC)
Date: Tue, 9 Mar 2021 10:37:18 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2] block/file-posix: Optimize for macOS
Message-ID: <20210309093718.GA5798@merkur.fritz.box>
References: <20210305121748.65173-1-akihiko.odaki@gmail.com>
 <YEY/9DyFk9U87JtM@stefanha-x1.localdomain>
 <CAMVc7JUSFsLovDAPOX1-6q6fimyrvq9wt51jb=hEQm+oB8RpUg@mail.gmail.com>
 <CAMVc7JXpP7twOzPWkFnSCgFtGBSNKG=iS95KNW8p7C_WCmEt6w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMVc7JXpP7twOzPWkFnSCgFtGBSNKG=iS95KNW8p7C_WCmEt6w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Fam Zheng <fam@euphon.net>, pkrempa@redhat.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Konstantin Nazarov <mail@knazarov.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.03.2021 um 05:52 hat Akihiko Odaki geschrieben:
> 2021年3月9日(火) 0:37 Akihiko Odaki <akihiko.odaki@gmail.com>:
> >
> > 2021年3月9日(火) 0:17 Stefan Hajnoczi <stefanha@redhat.com>:
> > >
> > > The live migration compatibility issue is still present. Migrating to
> > > another host might not work if the block limits are different.
> > >
> > > Here is an idea for solving it:
> > >
> > > Modify include/hw/block/block.h:DEFINE_BLOCK_PROPERTIES_BASE() to
> > > support a new value called "host". The default behavior remains
> > > unchanged for live migration compatibility but now you can use "host" if
> > > you know it's okay but don't care about migration compatibility.
> > >
> > > The downside to this approach is that users must explicitly say
> > > something like --drive ...,opt_io_size=host. But it's still better than
> > > the situation we have today where user must manually enter values for
> > > their disk.
> > >
> > > Does this sound okay to everyone?
> > >
> > > Stefan
> >
> > I wonder how that change affects other block drivers implementing
> > bdrv_probe_blocksizes. As far as I know, the values they report are
> > already used by default, which is contrary to the default not being
> > "host".
> >
> > Regards,
> > Akihiko Odaki
> 
> Let me suggest a variant of Stefan's approach:
> 
> Modify include/hw/block/block.h:DEFINE_BLOCK_PROPERTIES_BASE() to
> support a new value called "host". The default values for block size
> properties may be "host" or not, but they should be consistent. If
> they are "host" by default

I'm not sure if it's a good idea, but maybe we could make it so that the
default is "host" only as long as you didn't specify -nodefaults? Then
libvirt would automatically keep the old behaviour (because it always
sets -nodefaults) and manual invocations would usually get the new one.

Of course, when I start with "I'm not sure if it's a good idea", it's
usually not, but I wanted to share the thought anyway...

> add global properties which sets
> discard_granularity and opt_io_size to the old default to
> hw_compat_5_2 in hw/core/machine.c. Otherwise, add global properties
> which sets logical_block_size and physical_block_size to "host".

Would we have to do this for explicitly for every single block device in
the tree? That sounds like a lot of cases and therefore rather error
prone.

> Does it sound good? I'd also like to know others opinions for the
> default value ("host" or something else). I prefer "host" as the
> default a little because those who need live migration should be
> careful enough to set proper configurations for each device. We may
> also assist users who need live migration by adding a property which
> defaults all block size properties to something else "host".

Adding new requirements is always a bit problematic. Live migration
works fine today without specifying these properties, so users will
expect it to keep working. If live migration were a new feature and we
required the options from the start, it would be different.

Kevin


