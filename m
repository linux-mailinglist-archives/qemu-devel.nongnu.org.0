Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E24332302
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:28:28 +0100 (CET)
Received: from localhost ([::1]:52616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZbG-0004To-TR
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJZZn-0002qK-K9
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:26:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJZZi-0004mW-Fy
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615285609;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7lFmPEXHuIdPeLZhc4N/39EKkEZEo1h2N2WS50iYrqU=;
 b=KohowiLHz/xucdXIzh6GKgGVokZFH7909tWf9kz//PbtP8XJuiTVRSDdWbqyGTNgKCXYaK
 XcF3iUJqsKQN4tx9mI6O5obQsDT0IN3b65QlhEF7RASb+V1cQeNTU94jYDs9hrVlpZMcOF
 2zWq9iIaRvZkkfwLOxyPyXpHb3dyUvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-3mPdEluSOROBQCBUoq0Ybw-1; Tue, 09 Mar 2021 05:26:42 -0500
X-MC-Unique: 3mPdEluSOROBQCBUoq0Ybw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93442800D55;
 Tue,  9 Mar 2021 10:26:41 +0000 (UTC)
Received: from redhat.com (ovpn-114-154.ams2.redhat.com [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5EC75D9DB;
 Tue,  9 Mar 2021 10:26:28 +0000 (UTC)
Date: Tue, 9 Mar 2021 10:26:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2] block/file-posix: Optimize for macOS
Message-ID: <YEdNUu5OGSJ/mIo+@redhat.com>
References: <20210305121748.65173-1-akihiko.odaki@gmail.com>
 <YEY/9DyFk9U87JtM@stefanha-x1.localdomain>
 <CAMVc7JUSFsLovDAPOX1-6q6fimyrvq9wt51jb=hEQm+oB8RpUg@mail.gmail.com>
 <CAMVc7JXpP7twOzPWkFnSCgFtGBSNKG=iS95KNW8p7C_WCmEt6w@mail.gmail.com>
 <20210309093718.GA5798@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210309093718.GA5798@merkur.fritz.box>
User-Agent: Mutt/2.0.5 (2021-01-21)
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, pkrempa@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Konstantin Nazarov <mail@knazarov.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 10:37:18AM +0100, Kevin Wolf wrote:
> Am 09.03.2021 um 05:52 hat Akihiko Odaki geschrieben:
> > 2021年3月9日(火) 0:37 Akihiko Odaki <akihiko.odaki@gmail.com>:
> > >
> > > 2021年3月9日(火) 0:17 Stefan Hajnoczi <stefanha@redhat.com>:
> > > >
> > > > The live migration compatibility issue is still present. Migrating to
> > > > another host might not work if the block limits are different.
> > > >
> > > > Here is an idea for solving it:
> > > >
> > > > Modify include/hw/block/block.h:DEFINE_BLOCK_PROPERTIES_BASE() to
> > > > support a new value called "host". The default behavior remains
> > > > unchanged for live migration compatibility but now you can use "host" if
> > > > you know it's okay but don't care about migration compatibility.
> > > >
> > > > The downside to this approach is that users must explicitly say
> > > > something like --drive ...,opt_io_size=host. But it's still better than
> > > > the situation we have today where user must manually enter values for
> > > > their disk.
> > > >
> > > > Does this sound okay to everyone?
> > > >
> > > > Stefan
> > >
> > > I wonder how that change affects other block drivers implementing
> > > bdrv_probe_blocksizes. As far as I know, the values they report are
> > > already used by default, which is contrary to the default not being
> > > "host".
> > >
> > > Regards,
> > > Akihiko Odaki
> > 
> > Let me suggest a variant of Stefan's approach:
> > 
> > Modify include/hw/block/block.h:DEFINE_BLOCK_PROPERTIES_BASE() to
> > support a new value called "host". The default values for block size
> > properties may be "host" or not, but they should be consistent. If
> > they are "host" by default
> 
> I'm not sure if it's a good idea, but maybe we could make it so that the
> default is "host" only as long as you didn't specify -nodefaults? Then
> libvirt would automatically keep the old behaviour (because it always
> sets -nodefaults) and manual invocations would usually get the new one.
> 
> Of course, when I start with "I'm not sure if it's a good idea", it's
> usually not, but I wanted to share the thought anyway...

Can you elaborate on what the actual live migration problem is, and
its impact ?  This patch is touching the block backends, so I'm
wondering how backend data ends up having an impact on the migration
stream which is all frontend device data ?  I'm especially concerned
by the mention that some block backends already have this problem,
and wondering if it already impacts libvirt ?

Using -nodefaults is good practice, but I'm still uncomfortable saying
that its use is a requirement if you want migration to work, as that
feels like a change in semantics for non-libvirt users (who can be
mgmt apps, nor merely human interactive users).

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


