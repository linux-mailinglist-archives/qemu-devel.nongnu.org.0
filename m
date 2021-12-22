Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F2547CE2E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 09:24:48 +0100 (CET)
Received: from localhost ([::1]:35374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzwvX-00078y-8z
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 03:24:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mzwtm-0006SL-BT
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 03:22:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mzwtj-0007QG-Hq
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 03:22:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640161374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WSXt0q+0/bzEZXpRU+cWS402sQ0NRnJcTbM9l8FpiHc=;
 b=jUEKV7thJboftPioaC2hy9nXqwlGDfIeQMOku9e5nh483SoQe2WwrW4XQHiU62+B4LhEhE
 2spuD29TSF6Fk9T3C4y20wZAOIPR17/z3OdNnPtngciAHeOqc4y8e8m+UODIiNa0NJLJEZ
 ZgXJ50Sb/Rx3Fmyh+YE4diSA8P9/SFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-1d5hOo78P36n2qETDh1z0Q-1; Wed, 22 Dec 2021 03:22:52 -0500
X-MC-Unique: 1d5hOo78P36n2qETDh1z0Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C35F880BCA8;
 Wed, 22 Dec 2021 08:22:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBF9B10A79BD;
 Wed, 22 Dec 2021 08:22:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0439C1800616; Wed, 22 Dec 2021 09:22:48 +0100 (CET)
Date: Wed, 22 Dec 2021 09:22:47 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] vl: Add -set options to device opts dict when using JSON
 syntax for -device
Message-ID: <20211222082247.epv27gxeq622d2ts@sirius.home.kraxel.org>
References: <20211221071818.34731-1-mkfssion@mkfssion.com>
 <877dbyjj0t.fsf@dusky.pond.sub.org>
 <87h7b2i07h.fsf@dusky.pond.sub.org>
 <1b8249e6-ffe1-86e4-a2e8-c85c794438e0@redhat.com>
 <871r26ge4z.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <871r26ge4z.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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
 MkfsSion <mkfssion@mkfssion.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 21, 2021 at 04:40:28PM +0100, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
> > On 12/21/21 13:58, Markus Armbruster wrote:
> >>> Is this a regression?  I suspect commit 5dacda5167 "vl: Enable JSON
> >>> syntax for -device" (v6.2.0).
> >> 
> >> Obviously not a regression: everything that used to work still works.
> >
> > FWIW I think -set should be deprecated.  I'm not aware of any
> > particularly useful use of it.  There are a couple in the QEMU tests
> > (in vhost-user-test and in qemu-iotests 068), but in both cases the
> > code would be easier to follow without; patches can be dusted off if
> > desired.
> 
> -set has its uses, but they're kind of obscure.  When you want to use
> some canned configuration with slight modifications, then -readconfig
> canned.cfg -set ... is nicer than editing a copy of canned.cfg.

Simliar: configure stuff not supported by libvirt:

  <qemu:commandline>
    <qemu:arg value='-set'/>
    <qemu:arg value='device.video0.guestdebug=1'/>
  </qemu:commandline>

There will always be a gap between qemu and libvirt, even if most of
them are temporary only (while developing a new feature).  I think we
need some way to deal with this kind of tweaks when moving to QAPI-based
machine setup.  Possibly not in qemu, maybe it's easier to add new
'<qemu:set device=... property=... value=...>' syntax to libvirt.

take care,
  Gerd


