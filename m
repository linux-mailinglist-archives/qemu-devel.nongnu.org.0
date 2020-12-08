Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19F52D23F9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 07:59:37 +0100 (CET)
Received: from localhost ([::1]:54418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmWyG-0000lW-Lt
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 01:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kmWwW-0008Us-TR
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 01:57:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kmWwU-0007Ai-Ap
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 01:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607410665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KK5I87YpZSvNSgcLyLLxjdj+tAnb1PnZM+fVtuhSY8E=;
 b=KMIWwk+UXkzzVZVbaxYZOi58SF+MXTO3ETMv9/OX51x8F2yDKKMbyGUFdTFAFmFJrzVhE9
 N6ymbYRLixd4cLTyhCcqZ+LBypLGC75AufYBjWhRanJJgISOfYExCaPHDV4ultWXS+A5p5
 IjEgpQS76RjtnZqCVYxgy8tOTQKoBZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-NYJUfpTeOAmB4-OebYkduQ-1; Tue, 08 Dec 2020 01:57:42 -0500
X-MC-Unique: NYJUfpTeOAmB4-OebYkduQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB7011005513;
 Tue,  8 Dec 2020 06:57:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 735945C1A1;
 Tue,  8 Dec 2020 06:57:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9A597A1E2; Tue,  8 Dec 2020 07:57:40 +0100 (CET)
Date: Tue, 8 Dec 2020 07:57:40 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH 7/9] vnc: force initial resize message
Message-ID: <20201208065740.njrxpvnjkofhpmxg@sirius.home.kraxel.org>
References: <20201203110806.13556-1-kraxel@redhat.com>
 <20201203110806.13556-8-kraxel@redhat.com>
 <CAJ+F1C+UFScS8_+fzRniYwKepxv4FQr0=TFTGsBhg22kfw7zRA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+UFScS8_+fzRniYwKepxv4FQr0=TFTGsBhg22kfw7zRA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 04, 2020 at 03:57:23PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Dec 3, 2020 at 3:12 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> > The vnc server should send desktop resize notifications unconditionally
> > on a new client connect, for feature negotiation reasons.  Add a bool
> > flag to vnc_desktop_resize() to force sending the message even in case
> > there is no size change.
> >
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> >
> 
> In principle, this looks harmless. But the spec says:
> 
> "The server should only send a *DesktopSize* pseudo-rectangle when an
> actual change of the framebuffer dimensions has occurred. Some clients
> respond to a *DesktopSize* pseudo-rectangle in a way that could send the
> system into an infinite loop if the server sent out the pseudo-rectangle
> for anything other than an actual change."
> (
> https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#server-semantics
> )
> 
> I can't say if sending desktop resize during the initial SetEncoding phase
> is really compliant with the specification. Also, it's unclear to me if the
> client is allowed to SetEncoding multiple times (in which there would be no
> dimension change occurring).
> 
> What did you fix with this? Is it worth a clarification in the
> specification?

Well, for ExtendedDesktopResize the spec explicitly asked for this.
But, yes, for DesktopResize this is not needed.  But it also shouldn't
cause much trouble.  It is sent before any actual display updates, so
concerns whenever the client should consider the screen content invalid
or not are moot.

I could squash this into patch #8 and do it for ExtendedDesktopResize
only ...

take care,
  Gerd


