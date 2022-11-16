Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BA962BB32
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 12:16:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovGO4-0004zL-Ez; Wed, 16 Nov 2022 06:15:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ovGO2-0004z2-3I
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 06:15:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ovGO0-0004iR-Dc
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 06:15:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668597319;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s1u7F3AALR0mkUUQUhPUq/G+IXRWSOEZhUmS0ypflS0=;
 b=N0i4Ov/oevwxObwL0FlVq2aZONMnAd5KbjoQB/VJZhXJOibP0DJrpxvop+1nMOVYjdFqUe
 kG8LRmrc1YLYIHtszho9KYqVg11PBjCjPBdNjMyLlcQoqxV92CrsV0H/BPLExzhRuylKGQ
 om3+xWxtJvWNQX6gXPbQ93MXT1zHA6w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-qmaa5Y8nP1uR4C3_vT-yag-1; Wed, 16 Nov 2022 06:15:14 -0500
X-MC-Unique: qmaa5Y8nP1uR4C3_vT-yag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8923833AEC;
 Wed, 16 Nov 2022 11:15:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD9061121325;
 Wed, 16 Nov 2022 11:15:12 +0000 (UTC)
Date: Wed, 16 Nov 2022 11:15:07 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Or Ozeri <ORO@il.ibm.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Danny Harnik <DANNYH@il.ibm.com>, "idryomov@gmail.com" <idryomov@gmail.com>
Subject: Re: [PATCH v3] block/rbd: Add support for layered encryption
Message-ID: <Y3TGO6AEAAOux8FH@redhat.com>
References: <20221115122527.2896476-1-oro@il.ibm.com>
 <Y3PQj/MBztn8SobQ@redhat.com>
 <MN2PR15MB34886DD5A9D0F5D64A248AA08A079@MN2PR15MB3488.namprd15.prod.outlook.com>
 <Y3S6OGqGFovAyRWw@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y3S6OGqGFovAyRWw@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 16, 2022 at 10:23:52AM +0000, Daniel P. Berrangé wrote:
> On Wed, Nov 16, 2022 at 09:03:31AM +0000, Or Ozeri wrote:
> > > -----Original Message-----
> > > From: Daniel P. Berrangé <berrange@redhat.com>
> > > Sent: 15 November 2022 19:47
> > > To: Or Ozeri <ORO@il.ibm.com>
> > > Cc: qemu-devel@nongnu.org; qemu-block@nongnu.org; Danny Harnik
> > > <DANNYH@il.ibm.com>; idryomov@gmail.com
> > > Subject: [EXTERNAL] Re: [PATCH v3] block/rbd: Add support for layered
> > > encryption
> > > 
> > > AFAICT, supporting layered encryption shouldn't require anything other than
> > > the 'parent' addition.
> > > 
> > 
> > Since the layered encryption API is new in librbd, we don't have to
> > support "luks" and "luks2" at all.
> > In librbd we are actually deprecating the use of "luks" and "luks2",
> > and instead ask users to use "luks-any".
> 
> Deprecating that is a bad idea. The security characteristics and
> feature set of LUKSv1 and LUKSv2 can be quite different. If a mgmt
> app is expecting the volume to be protected with LUKSv2, it should
> be stating that explicitly and not permit a silent downgrade if
> the volume was unexpectedly using LUKSv1.
> 
> > If we don't add "luks-any" here, we will need to implement
> > explicit cases for "luks" and "luks2" in the qemu_rbd_encryption_load2.
> > This looks like a kind of wasteful coding that won't be actually used
> > by users of the rbd driver in qemu.
> 
> It isn't wasteful - supporting the formats explicitly is desirable
> to prevent format downgrades.
> 
> > Anyhow, we need the "luks-any" option for our use-case, so if you
> > insist, I will first submit a patch to add "luks-any", before this
> > patch.
> 
> I'm pretty wary of any kind of automatic encryption format detection
> in QEMU. The automatic block driver format probing has been a long
> standing source of CVEs in QEMU and every single mgmt app above QEMU.

Having said that, normal linux LUKS tools like cryptsetup or systemd
LUKS integration will auto-detect  luks1 vs luks2. All cryptsetup
commands also have an option to explicitly specify the format version.

So with that precedent I guess it is ok to add 'luks-any'.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


