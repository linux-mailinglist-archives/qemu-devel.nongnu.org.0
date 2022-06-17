Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536E254F4B4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 11:59:00 +0200 (CEST)
Received: from localhost ([::1]:34890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o28kl-0001x7-Cl
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 05:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o28i2-00005l-1u
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 05:56:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o28hy-0002fz-PJ
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 05:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655459764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=420+DkVFrTPyji5/7CRJV57rzTviFYoxIyOZD0ZfXGM=;
 b=b4MnVN0oClT3AN//2hizgyevSJEDfrH3jrGmgN6hM/PZf4p32PM6uqbWp6a5vOQVhQ25Kp
 zofx5sc1sHJCmL/r+aPsuLQcQGX0R/kdtTt1FGMsZesTqu7c8W9BpNbipgSZiudIk1jAB2
 RMBbq0wyHYo8g621DRzilUz0Ju5t4QE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-k2fbfR2CPFefoS4cZwaE3Q-1; Fri, 17 Jun 2022 05:56:01 -0400
X-MC-Unique: k2fbfR2CPFefoS4cZwaE3Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B1DF1C068C0;
 Fri, 17 Jun 2022 09:56:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 122632166B26;
 Fri, 17 Jun 2022 09:56:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 964BE1800995; Fri, 17 Jun 2022 11:55:58 +0200 (CEST)
Date: Fri, 17 Jun 2022 11:55:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: Corrupted display changing screen colour depth in
 qemu-system-ppc/MacOS
Message-ID: <20220617095558.xggyv6qk7igofii4@sirius.home.kraxel.org>
References: <e4c8ced1-3ef4-8956-ead5-91110d3cb38c@ilande.co.uk>
 <20220616120715.uksbwjynvb6usjhu@sirius.home.kraxel.org>
 <b93a1312-2272-d7b4-5a45-d04a7fd35840@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b93a1312-2272-d7b4-5a45-d04a7fd35840@ilande.co.uk>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

  Hi,

> > Can you try ditch the QEMU_ALLOCATED_FLAG check added by the commit?
> 
> Commit cb8962c146 drops the QEMU_ALLOCATED_FLAG check: if I add it back in
> with the following diff on top then everything works again:

Ah, the other way around.

> diff --git a/ui/console.c b/ui/console.c
> index 365a2c14b8..decae4287f 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -2400,11 +2400,12 @@ static void vc_chr_open(Chardev *chr,
> 
>  void qemu_console_resize(QemuConsole *s, int width, int height)
>  {
> -    DisplaySurface *surface;
> +    DisplaySurface *surface = qemu_console_surface(s);
> 
>      assert(s->console_type == GRAPHIC_CONSOLE);
> 
> -    if (qemu_console_get_width(s, -1) == width &&
> +    if (surface && (surface->flags & QEMU_ALLOCATED_FLAG) &&
> +        qemu_console_get_width(s, -1) == width &&
>          qemu_console_get_height(s, -1) == height) {
>          return;
>      }
> 
> > Which depth changes triggers this?  Going from direct color to a
> > paletted mode?
> 
> A quick test suggests anything that isn't 32-bit colour is affected.

Hmm, I think the commit should simply be reverted.

Short-cutting the qemu_console_resize() call is only valid in case the
current surface was created by qemu_console_resize() too.  When it is
something else -- typically a surface backed by vga vram -- it's not.
Looking at the QEMU_ALLOCATED_FLAG checks exactly that ...

take care,
  Gerd


