Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF836595410
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 09:41:55 +0200 (CEST)
Received: from localhost ([::1]:49870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNrD0-000587-La
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 03:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oNr5V-0007Ol-B3
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 03:34:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oNr5R-0004SA-Ov
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 03:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660635244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TAZ+ZgD3MzRucJr3dHZf2Bqvz+rC0RLvN0x9m3G/Fhk=;
 b=Pq/bpzVps5mThdiENShKBmyA2yqowAsdiIyeWxARxqjFndb4fU5y6v+HLJooLz+1hxrI0+
 B//XTxtqoVGy0AQCBbjcem7kwjSe+uYPM5zjOIhDivpWLG+BXA02e9CyBhdD5mJcPbwlxu
 l2b4QpwTf2UjpHbdnMUFvFIjwLquy4Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-Eky7_b17MaG6bq60rRnpnQ-1; Tue, 16 Aug 2022 03:33:39 -0400
X-MC-Unique: Eky7_b17MaG6bq60rRnpnQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C0C93833286;
 Tue, 16 Aug 2022 07:33:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C5D32026D4C;
 Tue, 16 Aug 2022 07:33:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8A4BB18003A8; Tue, 16 Aug 2022 09:33:37 +0200 (CEST)
Date: Tue, 16 Aug 2022 09:33:37 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Subject: Re: [PATCH] ui/console: fix qemu_console_resize() regression
Message-ID: <20220816073337.frxo6r6ljuc4yqp4@sirius.home.kraxel.org>
References: <20220725115815.2461322-1-marcandre.lureau@redhat.com>
 <291cacc9-ac68-4a3e-edc0-fb226bdceaf3@ilande.co.uk>
 <ac00cbb9-e225-a7fa-ec43-d763fb985060@ilande.co.uk>
 <CAMxuvazx5GGUzo0n_TcgA0FxkFmaecVdAXY4mutRFW+M+CrJdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMxuvazx5GGUzo0n_TcgA0FxkFmaecVdAXY4mutRFW+M+CrJdQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

> > >> diff --git a/ui/console.c b/ui/console.c
> > >> index e139f7115e1f..765892f84f1c 100644
> > >> --- a/ui/console.c
> > >> +++ b/ui/console.c
> > >> @@ -2575,11 +2575,13 @@ static void vc_chr_open(Chardev *chr,
> > >>   void qemu_console_resize(QemuConsole *s, int width, int height)
> > >>   {
> > >> -    DisplaySurface *surface;
> > >> +    DisplaySurface *surface = qemu_console_surface(s);
> > >>       assert(s->console_type == GRAPHIC_CONSOLE);
> > >> -    if (qemu_console_get_width(s, -1) == width &&
> > >> +    if ((s->scanout.kind != SCANOUT_SURFACE ||
> > >> +         (surface && surface->flags & QEMU_ALLOCATED_FLAG)) &&
> > >> +        qemu_console_get_width(s, -1) == width &&
> > >>           qemu_console_get_height(s, -1) == height) {
> > >>           return;
> > >>       }

> Gerd, could you review the patch and let me send a MR ? (or do you
> have other UI patches queued already and take it?)

Patch looks good to me.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

[ just back from summer vacation, no pending queue atm, just started
  walking through my email backlog though ... ]

take care,
  Gerd


