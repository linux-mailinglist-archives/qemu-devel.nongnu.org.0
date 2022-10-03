Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2E15F3101
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 15:14:48 +0200 (CEST)
Received: from localhost ([::1]:56730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofLHT-0005GZ-AE
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 09:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofKtk-0001JP-Vl
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 08:50:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofKtf-0001z6-14
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 08:50:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664801409;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7IOatH7JzJHbJ4qOhabJyaLvoiB7QliioDuLTl2MmiE=;
 b=VVYKW3glZmebdcnKT1v5EFTSvruqlKmAHooq7dKeGGuNioMNXMNLuXCd+njZKrPIZYxzbX
 eP9SHIKSzXUzezUIs/n1adzUhGV0LXr0mRValBfSnhe9L0KLxSeOLNZMq4pXJe05k1jiwa
 0eA27caS3cDIi4VSlul7A4+CgZnKEH8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-pi9CHbCSNriIsxeATELbDw-1; Mon, 03 Oct 2022 08:50:08 -0400
X-MC-Unique: pi9CHbCSNriIsxeATELbDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5756380206D;
 Mon,  3 Oct 2022 12:50:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E74740C6EC2;
 Mon,  3 Oct 2022 12:50:07 +0000 (UTC)
Date: Mon, 3 Oct 2022 13:50:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] net: improve error message for missing netdev backend
Message-ID: <YzrafHjJoFK/Orip@redhat.com>
References: <20221003100612.596845-1-berrange@redhat.com>
 <2257290.J6gMhxssjS@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2257290.J6gMhxssjS@silver>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 03, 2022 at 02:46:04PM +0200, Christian Schoenebeck wrote:
> On Montag, 3. Oktober 2022 12:06:12 CEST Daniel P. Berrangé wrote:
> > The current message when using '-net user...' with SLIRP disabled at
> > compile time is:
> > 
> >   qemu-system-x86_64: -net user: Parameter 'type' expects a net backend type
> > (maybe it is not compiled into this binary)
> 
> Is this intended as alternative to Marc-André's previous patch?

This is a patch that should be applied regardless of any other change,
because the error message we report here today is awful and needs
improving.

>                                                                  If yes, then 
> same applies here: what about people not passing any networking arg to QEMU? 
> They would not get any error message at all, right?

Yes, I mentioned that in the text that you've quoted below....

> > An observation is that we're using the 'netdev->type' field here which
> > is an enum value, produced after QAPI has converted from its string
> > form.
> > 
> > IOW, at this point in the code, we know that the user's specified
> > type name was a valid network backend. The only possible scenario that
> > can make the backend init function be NULL, is if support for that
> > backend was disabled at build time. Given this, we don't need to caveat
> > our error message with a 'maybe' hint, we can be totally explicit.
> > 
> > The use of QERR_INVALID_PARAMETER_VALUE doesn't really lend itself to
> > user friendly error message text. Since this is not used to set a
> > specific QAPI error class, we can simply stop using this pre-formatted
> > error text and provide something better.
> > 
> > Thus the new message is:
> > 
> >   qemu-system-x86_64: -net user: network backend 'user' is not compiled into
> > this binary
> 
> And why not naming the child, i.e. that QEMU was built without slirp?

There are several network backends that can be conditionally disabled
at build time, and IMHO its overkill to give a different message for
each one. This message is sufficient to show users where to go next.

> 
> > The case of passing 'hubport' for -net is also given a message reminding
> > people they should have used -netdev/-nic instead, as this backend type
> > is only valid for the modern syntax.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> > 
> > NB, this does not make any difference to people who were relying on the
> > QEMU built-in default hub that was created if you don't list any -net /
> > -netdev / -nic argument, only those using explicit args.

.... here.



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


