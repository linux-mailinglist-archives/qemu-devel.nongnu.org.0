Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C61332396
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:04:59 +0100 (CET)
Received: from localhost ([::1]:51624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJaAb-0006Zq-Qy
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJZts-0006K9-2W
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:47:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJZto-0007EO-RG
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615286855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M81XwExSiooxNUVq2R0z54bIdT81N8nuLLiIVntzLp8=;
 b=ODmNgeAjcV4s2lWSzAhuundDvpCZLAILwLhhtTp3Hz8dWgk8RJkbvf6nc6WYH2BDhuU5He
 xY2c1nhcEcitcE5gYDJn2PVdFUCzt5eo3qTvGy6t1nUjzq+OwJN/ZXaViFq4pgCZACgPbV
 kpGHkv2UGAwp+U41se+l8FI7cgedyy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-SGBQQ56fO0CHTNb2qOFELg-1; Tue, 09 Mar 2021 05:47:34 -0500
X-MC-Unique: SGBQQ56fO0CHTNb2qOFELg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A97D800C78;
 Tue,  9 Mar 2021 10:47:32 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-169.ams2.redhat.com [10.36.114.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D368919C97;
 Tue,  9 Mar 2021 10:47:26 +0000 (UTC)
Date: Tue, 9 Mar 2021 11:47:25 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2] block/file-posix: Optimize for macOS
Message-ID: <20210309104725.GB5798@merkur.fritz.box>
References: <20210305121748.65173-1-akihiko.odaki@gmail.com>
 <YEY/9DyFk9U87JtM@stefanha-x1.localdomain>
 <CAMVc7JUSFsLovDAPOX1-6q6fimyrvq9wt51jb=hEQm+oB8RpUg@mail.gmail.com>
 <CAMVc7JXpP7twOzPWkFnSCgFtGBSNKG=iS95KNW8p7C_WCmEt6w@mail.gmail.com>
 <20210309093718.GA5798@merkur.fritz.box>
 <YEdNUu5OGSJ/mIo+@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YEdNUu5OGSJ/mIo+@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, pkrempa@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Konstantin Nazarov <mail@knazarov.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.03.2021 um 11:26 hat Daniel P. Berrangé geschrieben:
> On Tue, Mar 09, 2021 at 10:37:18AM +0100, Kevin Wolf wrote:
> > Am 09.03.2021 um 05:52 hat Akihiko Odaki geschrieben:
> > > 2021年3月9日(火) 0:37 Akihiko Odaki <akihiko.odaki@gmail.com>:
> > > >
> > > > 2021年3月9日(火) 0:17 Stefan Hajnoczi <stefanha@redhat.com>:
> > > > >
> > > > > The live migration compatibility issue is still present. Migrating to
> > > > > another host might not work if the block limits are different.
> > > > >
> > > > > Here is an idea for solving it:
> > > > >
> > > > > Modify include/hw/block/block.h:DEFINE_BLOCK_PROPERTIES_BASE() to
> > > > > support a new value called "host". The default behavior remains
> > > > > unchanged for live migration compatibility but now you can use "host" if
> > > > > you know it's okay but don't care about migration compatibility.
> > > > >
> > > > > The downside to this approach is that users must explicitly say
> > > > > something like --drive ...,opt_io_size=host. But it's still better than
> > > > > the situation we have today where user must manually enter values for
> > > > > their disk.
> > > > >
> > > > > Does this sound okay to everyone?
> > > > >
> > > > > Stefan
> > > >
> > > > I wonder how that change affects other block drivers implementing
> > > > bdrv_probe_blocksizes. As far as I know, the values they report are
> > > > already used by default, which is contrary to the default not being
> > > > "host".
> > > >
> > > > Regards,
> > > > Akihiko Odaki
> > > 
> > > Let me suggest a variant of Stefan's approach:
> > > 
> > > Modify include/hw/block/block.h:DEFINE_BLOCK_PROPERTIES_BASE() to
> > > support a new value called "host". The default values for block size
> > > properties may be "host" or not, but they should be consistent. If
> > > they are "host" by default
> > 
> > I'm not sure if it's a good idea, but maybe we could make it so that the
> > default is "host" only as long as you didn't specify -nodefaults? Then
> > libvirt would automatically keep the old behaviour (because it always
> > sets -nodefaults) and manual invocations would usually get the new one.
> > 
> > Of course, when I start with "I'm not sure if it's a good idea", it's
> > usually not, but I wanted to share the thought anyway...
> 
> Can you elaborate on what the actual live migration problem is, and
> its impact ?  This patch is touching the block backends, so I'm
> wondering how backend data ends up having an impact on the migration
> stream which is all frontend device data ?  I'm especially concerned
> by the mention that some block backends already have this problem,
> and wondering if it already impacts libvirt ?

The part that modifies the backend is the boring part (I haven't even
looked at the code for that one yet).

The interesting part is the change to hw/block/block.c, which modifies
the defaults for some qdev properties of block devices. The reason why
it does so is that it wants to let them default to autodetecting
whatever is optimal on the host.

The potential conflict between autodetecting qdev property defaults in
the backend and live migration should be obvious.

> Using -nodefaults is good practice, but I'm still uncomfortable saying
> that its use is a requirement if you want migration to work, as that
> feels like a change in semantics for non-libvirt users (who can be
> mgmt apps, nor merely human interactive users).

We can make live migration work in a way, by including these properties
in the VM state and then overriding whatever was set on the command line
with the values from the VM state. (This patch doesn't do this yet, nor
does it disable live migration, but it just lets the device magically
change its properties during migration, which is incorrect.)

Of course, this would still mean that the old value is only preserved on
the destination host as long as the QEMU instance runs. On the next
boot, the guest visible disk will change.

So if you want stable guest devices, you can't really have any of this
autodetection. If you set the properties explicitly instead of relying
on the defaults (which is what you should be doing ideally), you don't
have the problem, but I'm not sure if we can expect that users are
actually doing that. Considering -nodefaults would be just another
attempt to cover most users who care about a stable guest view, but
don't specify the value for each qdev property.

Kevin


