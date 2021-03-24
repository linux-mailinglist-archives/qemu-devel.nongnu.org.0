Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6AB3475B7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 11:19:45 +0100 (CET)
Received: from localhost ([::1]:54116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP0c4-0003Kk-2G
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 06:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lP0ZU-0002Ll-IM
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 06:17:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lP0ZP-0000px-CI
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 06:17:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616581017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lb5fJjJnlAn4F2LVdXa7ev1PlvSUkXLuZ78548uW3VE=;
 b=Yc5m8yPyD2N4AdwoSyNN3BwePCyfQH5Pp/D7+/B45GwJpO5Orxve+Bdef9FQj24bwutyOO
 NPrnOvcajPPVJWrxmZdDC284m6ruZabQnYvBJY/NfUSocngwuQax1o/UrZXhygd3TYJGRF
 lBG583kCCkbvpNqQx4YVGVyqahTA/bs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-yPzMGuJuNG-90a0HGt5tmw-1; Wed, 24 Mar 2021 06:16:53 -0400
X-MC-Unique: yPzMGuJuNG-90a0HGt5tmw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE1861922020;
 Wed, 24 Mar 2021 10:16:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 640886A967;
 Wed, 24 Mar 2021 10:16:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7AD55180039A; Wed, 24 Mar 2021 11:16:50 +0100 (CET)
Date: Wed, 24 Mar 2021 11:16:50 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v2 7/7] ui/gtk: add clipboard support
Message-ID: <20210324101650.irnpfnklksfnejic@sirius.home.kraxel.org>
References: <20210318091647.3233178-1-kraxel@redhat.com>
 <20210318091647.3233178-8-kraxel@redhat.com>
 <CAJ+F1CJqhUX1vnbXOAo8adpkb=rNcJSzMpeGVQnTGT5UuuALJg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJqhUX1vnbXOAo8adpkb=rNcJSzMpeGVQnTGT5UuuALJg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

  Hi,

> > +    if (gd->cbowner[s]) {
> > +        /* ignore notifications about our own grabs */
> > +        return;
> > +    }
> > +
> > +
> > +    switch (event->owner_change.reason) {
> > +    case GDK_SETTING_ACTION_NEW:
> > +        info = qemu_clipboard_info_new(&gd->cbpeer, s);
> > +        if (gtk_clipboard_wait_is_text_available(clipboard)) {
> > +            info->types[QEMU_CLIPBOARD_TYPE_TEXT].available = true;
> > +        }
> >
> 
> Same comment as v1:
> So after gtk_clipboard_set_text() the client side is actually taking
> the ownership away from the guest clipboard I presume. That might have some
> weird interaction issues. Hopefully the other side isn't playing the same
> game...

The cbowner check above should avoid that ...

> > +    gd->gtkcb[QEMU_CLIPBOARD_SELECTION_CLIPBOARD] =
> > +        gtk_clipboard_get(gdk_atom_intern("CLIPBOARD", FALSE));
> 
> Why not use GDK_SELECTION_* ?

So I don't have to worry about converting GDK_SELECTION_* to
QEMU_CLIPBOARD_SELECTION_* ?

take care,
  Gerd


