Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF90487792
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 13:24:01 +0100 (CET)
Received: from localhost ([::1]:56442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5oHo-0005v3-MS
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 07:24:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n5o1T-0001lU-Oq
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 07:07:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n5o1R-0006M2-4d
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 07:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641557216;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xcX9DS3XTMm6lHh/fqd+Jcbqe2SgNhOXfIlc7q05Rmk=;
 b=V8BCgJ9Q7z01VtSSw2dCltB/lYkwL0AHcYGFZ8PgE9UrTPLZagd8xNm8Pmj/ul0BweXVXF
 Gc55qlipXA//yKi7Rwf0c9BG2ez0eKQtrpEpLtxKbX8LvW44JuaQJE4UCjMogqSLbFjOXa
 vkcVNp7dPfh3lHUVjrc/d5POOyiYuX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-GadSQ3tTNga5XuAc_vr25Q-1; Fri, 07 Jan 2022 07:06:53 -0500
X-MC-Unique: GadSQ3tTNga5XuAc_vr25Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49832344AF;
 Fri,  7 Jan 2022 12:06:52 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.155])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DFA01079749;
 Fri,  7 Jan 2022 12:06:50 +0000 (UTC)
Date: Fri, 7 Jan 2022 12:06:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] configure: Add pkg-config handling for
 libgcrypt
Message-ID: <Ydgs18kw3Ettwmro@redhat.com>
References: <1567068782-371028-1-git-send-email-zhe.he@windriver.com>
 <20190829091505.GB17141@redhat.com>
 <CABJz62M1o7Vof3LSG0BNY506jEdB1S110mMOVbu-ZpQfPJCWfQ@mail.gmail.com>
 <8fc873a8-9bda-09f2-4344-24f8331dba7c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8fc873a8-9bda-09f2-4344-24f8331dba7c@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: zhe.he@windriver.com, qemu-devel@nongnu.org,
 Andrea Bolognani <abologna@redhat.com>, pbonzini@redhat.com, philmd@redhat.com,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 07, 2022 at 12:55:42PM +0100, Thomas Huth wrote:
> On 07/01/2022 12.43, Andrea Bolognani wrote:
> > On Thu, Aug 29, 2019 at 10:15:05AM +0100, Daniel P. Berrangé wrote:
> > > On Thu, Aug 29, 2019 at 04:53:02PM +0800, zhe.he@windriver.com wrote:
> > > > libgcrypt may also be controlled by pkg-config, this patch adds pkg-config
> > > > handling for libgcrypt.
> > > 
> > > Where are you seeing pkg-config files for libgcrypt ?
> > > 
> > > The upstream project has (frustratingly) been hostile to any proposal to
> > > add pkg-config support saying people should stick with their custom
> > > libgcrypt-config tool
> > > 
> > >     https://dev.gnupg.org/T2037
> > > 
> > > Even if this is something added by some distro downstream, what is the
> > > benefit in using it, compared with libgcrypt-confg which should already
> > > work & is portable.
> > 
> > Resurrecting an old thread to point out that the upstream stance
> > seems to have changed since that discussion:
> > 
> >    https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=97194b422bc89a6137f4e218d4cdee118c63e96e
> > 
> > libgcrypt 1.9.0, released almost exactly a year ago, comes with a
> > pkg-config file out of the box. With that in mind, I think it would
> > make sense to re-evaluate this patch for inclusion.
> 
> Maybe ... but we switched to Meson in between, so the patch needs to be
> rewritten to use meson.build instead, I think. Also it seems like version
> 1.9 is not available in all distros yet, so someone needs to do an
> assessment whether the distros that use an older version of libgrypt provide
> a .pc file or not...

Comes back to my question of what is the benefit of using the .pc file
when what we have already works and is known to be portable.

When using meson there is essentially zero burden to using the
libgcrypt-config approach, because that's all handled transparently
by meson.  This is different from the situation with configure,
where libgcrypt-config required extra work on our side.

Overall I don't see any need to change it.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


