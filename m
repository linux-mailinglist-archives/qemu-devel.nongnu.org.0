Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797FB32B7C5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 13:21:51 +0100 (CET)
Received: from localhost ([::1]:41518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQVi-0000F5-AF
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 07:21:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHQUL-00088F-Eu
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:20:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHQUI-000791-Ss
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:20:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614774018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d6OgkVOI16L44vRKf4z5W6bUKm5wTDp70Lret3oPiO0=;
 b=LD0w0L2wwYi5rRglBK80HJE1bf/WHizn5/fIuJX8nknT+eKfeaC/P44eIaQi0kStqjhqrb
 19iKXf36m/UX70PwcdrkFzvZ7vCXd5cPVQQY6BS52oXTQ5QZs11h0ZLE9YBkACbYUIyLiP
 GQU9orJdAHlsd39Ukh3iT2zZfnC/gNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-hWWYf_AzPCWYKTcxZZ2Yyg-1; Wed, 03 Mar 2021 07:20:17 -0500
X-MC-Unique: hWWYf_AzPCWYKTcxZZ2Yyg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF70D1020C20;
 Wed,  3 Mar 2021 12:20:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-154.ams2.redhat.com
 [10.36.112.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4C666085D;
 Wed,  3 Mar 2021 12:20:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1B7EA180086F; Wed,  3 Mar 2021 13:20:14 +0100 (CET)
Date: Wed, 3 Mar 2021 13:20:14 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH 7/7] ui/gtk: add clipboard support
Message-ID: <20210303122014.gmgfgz462aa5vuya@sirius.home.kraxel.org>
References: <20210219131349.3993192-1-kraxel@redhat.com>
 <20210219131349.3993192-8-kraxel@redhat.com>
 <CAJ+F1C+7aZyDOGB+CD2CubxzTexJ0kBkMx76Zk4zpHiQZuEx9Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+7aZyDOGB+CD2CubxzTexJ0kBkMx76Zk4zpHiQZuEx9Q@mail.gmail.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

> > +    if (info != gd->cbinfo[s]) {
> > +        qemu_clipboard_info_put(gd->cbinfo[s]);
> > +        gd->cbinfo[s] = qemu_clipboard_info_get(info);
> > +        gd->cbpending[s] = 0;
> > +        if (!self_update) {
> > +            if (info->types[QEMU_CLIPBOARD_TYPE_TEXT].available) {
> > +                qemu_clipboard_request(info, QEMU_CLIPBOARD_TYPE_TEXT);
> 
> Always requesting the clipboard is a bit harsh, isn't it?
> 
> +            }
> > +        }
> > +        return;
> > +    }
> > +
> > +    if (self_update) {
> > +        return;
> > +    }
> > +
> > +    if (info->types[QEMU_CLIPBOARD_TYPE_TEXT].available &&
> > +        info->types[QEMU_CLIPBOARD_TYPE_TEXT].data) {
> > +        gtk_clipboard_set_text(gd->gtkcb[s],
> > +                               info->types[QEMU_CLIPBOARD_TYPE_TEXT].data,

Well, I want gtk deal with the compatibility stuff like all the
different target names we have for text ("STRING", "text/plain", ...),
and using gtk_clipboard_set_text() seems to be the only way to do that.

I'm open to better ideas.

take care,
  Gerd


