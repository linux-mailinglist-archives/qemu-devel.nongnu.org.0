Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F08347B3A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:57:42 +0100 (CET)
Received: from localhost ([::1]:37538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4x3-00059q-4N
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lP4mt-0001vx-Ud
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:47:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lP4mq-0007tW-VO
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616597227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=17oMIh3hVZ6PdGOCB+axxhpExDhs0VyIeeorXTDV28w=;
 b=Lgeb6lHJBAf/t71oR1R/nWmmCa3qKrNXLm2mfYFJs7vETN/pyHQ+R/bLSiuFvv4/MLwr84
 vTU2kdIAlKX816FPFtQGkBtEimlcMZ9A8OcbXsIJHlEo3mOQQPXMBJo57Hi1ICUc7z/XDj
 4k7XjtjFiTzi6bpXWlo2onA0wo4pRew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-XuBH_lQ7PhiyKJg_kql35A-1; Wed, 24 Mar 2021 10:47:03 -0400
X-MC-Unique: XuBH_lQ7PhiyKJg_kql35A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A2D8107ACCA;
 Wed, 24 Mar 2021 14:47:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F25605B4BC;
 Wed, 24 Mar 2021 14:47:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 56564180039A; Wed, 24 Mar 2021 15:47:00 +0100 (CET)
Date: Wed, 24 Mar 2021 15:47:00 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v2 7/7] ui/gtk: add clipboard support
Message-ID: <20210324144700.b7brdkrcwkfgq2vt@sirius.home.kraxel.org>
References: <20210318091647.3233178-1-kraxel@redhat.com>
 <20210318091647.3233178-8-kraxel@redhat.com>
 <CAJ+F1CJqhUX1vnbXOAo8adpkb=rNcJSzMpeGVQnTGT5UuuALJg@mail.gmail.com>
 <20210324101650.irnpfnklksfnejic@sirius.home.kraxel.org>
 <CAJ+F1C+HKdo_MK4rgw4pOpVzRnUu3Pu8O9YrjwFu8ZxGQCP+3A@mail.gmail.com>
 <20210324125743.zuivmbhje465bfne@sirius.home.kraxel.org>
 <CAJ+F1CK9x_-ni0Qx6qZpWruBQwptbR-O26oUSvj0JgyBgk3vMQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CK9x_-ni0Qx6qZpWruBQwptbR-O26oUSvj0JgyBgk3vMQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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

On Wed, Mar 24, 2021 at 05:26:24PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Mar 24, 2021 at 4:57 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> >   Hi,
> >
> > > I fail to see how that works, imagine the other end is the same code
> > (qemu
> > > in the guest), it will take clipboard ownership and it is in a endless
> > > loop, isn't it?
> >
> > Notifications on guest-triggered clipboard updates will not be sent back
> > to the guest, exactly to avoid that kind of loop.  See self_update
> > checks in vdagent_clipboard_notify().  gtk and vnc notify callbacks have
> > simliar checks for simliar reasons ;)

> That means the other side may have wrong clipboard expectations. It may ask
> for what was previously an image and that will fails.

Should not happen.  qemu keeps track of the clipboard source
(vnc/gtk/vdgent) and uses that to filter notifications.

So when the guest (i.e. vdagent source inside qemu) grabs the clipboard
the updates will not be propagated back to the guest to avoid loops, but
when some host applications updates the clipboard afterwards the changes
are sent to the guest because they come from gtk (or vnc).

Latest bits are here:
	https://git.kraxel.org/cgit/qemu/log/?h=sirius/vnc-clipboard

Feel free to try break it ;)

take care,
  Gerd


