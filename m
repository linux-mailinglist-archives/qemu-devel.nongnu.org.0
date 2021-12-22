Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D739D47D04C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 11:49:38 +0100 (CET)
Received: from localhost ([::1]:59584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzzBh-00019Z-IL
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 05:49:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mzzAC-0000Se-Th
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 05:48:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mzzAA-00037w-DG
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 05:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640170080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CyixfSTpfp5xsjaG1O3NMEnfqc8larG27zV2+Wn2iF4=;
 b=U3fPgy7dciVkLl+wkRRhxBY8wm7t73c9tL4QyXcxRHaPW/fY6jhAoeUXJYDpT2Xv1zQoPY
 jehkzwW6sYAAcqQM5Oo40G7Z/wLsc55wMxg+XwE7YEmOnBtJkZQQXs6s98EGwpl6XwxPbN
 7fejlnWgCI2Ou1QccAro6TBWciRS73I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-sI0VBkcXOfy4026qe5P6AA-1; Wed, 22 Dec 2021 05:47:57 -0500
X-MC-Unique: sI0VBkcXOfy4026qe5P6AA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06DC61853028;
 Wed, 22 Dec 2021 10:47:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96B0F1036D00;
 Wed, 22 Dec 2021 10:47:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EFB071800616; Wed, 22 Dec 2021 11:47:52 +0100 (CET)
Date: Wed, 22 Dec 2021 11:47:52 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH] vl: Add -set options to device opts dict when using JSON
 syntax for -device
Message-ID: <20211222104752.zeictozjvpevelon@sirius.home.kraxel.org>
References: <20211221071818.34731-1-mkfssion@mkfssion.com>
 <877dbyjj0t.fsf@dusky.pond.sub.org>
 <87h7b2i07h.fsf@dusky.pond.sub.org>
 <1b8249e6-ffe1-86e4-a2e8-c85c794438e0@redhat.com>
 <871r26ge4z.fsf@dusky.pond.sub.org>
 <20211222082247.epv27gxeq622d2ts@sirius.home.kraxel.org>
 <bff1182f-3e49-6ba9-6a65-602a0f7c434a@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <bff1182f-3e49-6ba9-6a65-602a0f7c434a@greensocs.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 MkfsSion <mkfssion@mkfssion.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Simliar: configure stuff not supported by libvirt:
> > 
> >    <qemu:commandline>
> >      <qemu:arg value='-set'/>
> >      <qemu:arg value='device.video0.guestdebug=1'/>
> >    </qemu:commandline>
> > 
> > There will always be a gap between qemu and libvirt, even if most of
> > them are temporary only (while developing a new feature).  I think we
> > need some way to deal with this kind of tweaks when moving to QAPI-based
> > machine setup.  Possibly not in qemu, maybe it's easier to add new
> > '<qemu:set device=... property=... value=...>' syntax to libvirt.

> Can the set feature be handled by libvirt ?
> I mean, libvirt could do the merge itself because if I understand it
> correctly, the snippset just say:
> please add/override the "guestdebug=1" key/value pair to the 'video0' device
> command option.

Yes.  The above is the same as

	-device qxl,id=video0,${more-libvirt-opts},guestdebug=1

take care,
  Gerd


