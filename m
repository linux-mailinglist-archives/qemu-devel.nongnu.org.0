Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC7F55FFBA
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 14:23:19 +0200 (CEST)
Received: from localhost ([::1]:45392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Wiz-00058e-RA
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 08:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o6Wgt-00048G-6h
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 08:21:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o6Wgo-0007ZG-AC
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 08:21:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656505261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JofIrOXkA7mmQsQoAaOnnHoQmDgTilzn60cZ+DgjY/A=;
 b=eLF/cQl+5rcsDtZbC5c9/o6/YLcS5J5uo5E6DXt8CNbW1xGzRJKJ4r62JpVlIH958ofajt
 B6TbVNOXF73QufIt2KaW6XQJLE5npUy7JS6HA+KzQ+fglBt10iPcx8SbIwbgHpUzsX92vN
 3h3qPT1pL8bUAncC0M41ev1e1/avVm8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-nQL5WK6WNcC-o-7EuEBHfg-1; Wed, 29 Jun 2022 08:20:52 -0400
X-MC-Unique: nQL5WK6WNcC-o-7EuEBHfg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E511811E76;
 Wed, 29 Jun 2022 12:20:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9758CC26E98;
 Wed, 29 Jun 2022 12:20:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 453C218007B7; Wed, 29 Jun 2022 14:20:50 +0200 (CEST)
Date: Wed, 29 Jun 2022 14:20:50 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH] microvm: turn off io reservations for pcie root ports
Message-ID: <20220629122050.yj7zp2xthtwmigzh@sirius.home.kraxel.org>
References: <20220603085920.604323-1-kraxel@redhat.com>
 <20220608120505-mutt-send-email-mst@kernel.org>
 <20220609072838.jcq4cdofpwvlew7j@sirius.home.kraxel.org>
 <20220627183724-mutt-send-email-mst@kernel.org>
 <20220629071023.2wfvs7utmx6w3p4o@sirius.home.kraxel.org>
 <20220629031527-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629031527-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 29, 2022 at 03:16:17AM -0400, Michael S. Tsirkin wrote:
> On Wed, Jun 29, 2022 at 09:10:23AM +0200, Gerd Hoffmann wrote:
> > On Mon, Jun 27, 2022 at 06:37:50PM -0400, Michael S. Tsirkin wrote:
> > > On Thu, Jun 09, 2022 at 09:28:38AM +0200, Gerd Hoffmann wrote:
> > > > On Wed, Jun 08, 2022 at 12:06:17PM -0400, Michael S. Tsirkin wrote:
> > > > > On Fri, Jun 03, 2022 at 10:59:20AM +0200, Gerd Hoffmann wrote:
> > > > > > The pcie host bridge has no io window on microvm,
> > > > > > so io reservations will not work.
> > > > > > 
> > > > > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > > > > 
> > > > > I don't much like overriding user like this. We end up users
> > > > > setting it to silly values and then if we do want to
> > > > > support this things just break. Thoughts?
> > > > 
> > > > Well, it just looked like the simplest way to tell the firmware that
> > > > io reservations are pointless.  Do you have a better idea?
> > > > 
> > > > take care,
> > > >   Gerd
> > > 
> > > Fail if user supplies values we can't support.
> > 
> > Well, it is the *default* value which doesn't work on microvm.
> > 
> > take care,
> >   Gerd
> 
> Changing defaults is ok of course. Let's just not override the user.

Ok, so I could use a compat property instead and change the default
for microvm that way.  That would allow the user set any value it
wants.

I still don't see the point though.  There is only a single value which
makes sense on microvm.  Which is zero.  The only effect the user could
archive is make the firmware throwing errors ...

take care,
  Gerd


