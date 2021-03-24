Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9828C347500
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 10:49:09 +0100 (CET)
Received: from localhost ([::1]:59996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP08S-0000hJ-H7
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 05:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lP06a-0007rh-PA
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 05:47:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lP06T-0000KG-39
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 05:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616579222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cb0xfEyTABFJ45LqPrWF3ixGSFKbGUCYoBjK7RZ8XQE=;
 b=hXbnp5p4yfU8w89+n4D6oqBZr88l3kM0hEHsBtsXL2XU4GqHi/MQv5wccViJOkpikjMUx5
 nczkLnOAoq5xskn93fd00d1NrmQ0xh91EJkGa+bYrcmOLx2dMOflH5d9CjLkGokgxUmTqA
 20mJx5R4wdzwM7GWbCMXOXBTDd564vA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-yhT8MHZ6MDWHDiq_l-ddxg-1; Wed, 24 Mar 2021 05:47:01 -0400
X-MC-Unique: yhT8MHZ6MDWHDiq_l-ddxg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D328801FCE;
 Wed, 24 Mar 2021 09:47:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5D5D6727A;
 Wed, 24 Mar 2021 09:46:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 486A7180039A; Wed, 24 Mar 2021 10:46:58 +0100 (CET)
Date: Wed, 24 Mar 2021 10:46:58 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v2 2/7] ui/vdagent: core infrastructure
Message-ID: <20210324094658.nfnuufvqm7cqseww@sirius.home.kraxel.org>
References: <20210318091647.3233178-1-kraxel@redhat.com>
 <20210318091647.3233178-3-kraxel@redhat.com>
 <CAJ+F1CL2mR1BwHfV7FzjV5Dh-nq-4CGP74ptxJgS75LN-6DdpQ@mail.gmail.com>
 <20210322102717.xakx5rfg3gdekjfk@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210322102717.xakx5rfg3gdekjfk@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 11:27:17AM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > > +    if (vd->msgsize != msg->size + sizeof(*msg)) {
> > > +        /* FIXME: handle parse messages splitted into multiple chunks */
> > > +        fprintf(stderr, "%s: size mismatch: chunk %d, msg %d (+%zd)\n",
> > > +                __func__, vd->msgsize, msg->size, sizeof(*msg));
> > >
> > 
> > Not fixing? You handle chunking on sending but not on receiving?
> 
> linux vdagent doesn't do chunking on send, so no need (and also no
> testcase) so far.
> 
> Didn't try windows guests (yet), but that is next on my clipboard
> todo list.

Hmm, windows guest agent doesn't has VD_AGENT_CAP_CLIPBOARD_SELECTION,
so I have to deal with that.

Windows guests do actually send large messages in chunks, so I have
something to test with, good.

What are VD_AGENT_CAP_GUEST_LINEEND_LF + VD_AGENT_CAP_GUEST_LINEEND_CRLF
are good for btw?  Are linefeeds converted automatically between dos and
unix conventions?  If so, who is supposed to handle that?

take care,
  Gerd


