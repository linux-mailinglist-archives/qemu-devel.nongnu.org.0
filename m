Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5BB6B3B9C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:03:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZaE-0002eC-LT; Fri, 10 Mar 2023 05:02:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1paZaB-0002dE-HH
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:02:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1paZa8-0005gh-1X
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678442555;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PHCWSVoziKc8g9betwc7umZYpVMsBEGN5VRCG6QolHk=;
 b=BZfJdWCHznNcgRPwvd9H8iaf8aYmTqTSqyEKDh2IjPhTUo2D1X6jsWEgyRUEVjpOq5vyLw
 Nybg3c+vNTuN3ToLVECiRkKisl96LnIoU08M0arGJnILqOeTdR/M6PZ2yXM6IOuZEgk3RE
 riLr8xKJ4Sdq+QEG9XN68jNrgWO5eKY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-6aViYrMuOqa8W7qV34R9MQ-1; Fri, 10 Mar 2023 05:02:34 -0500
X-MC-Unique: 6aViYrMuOqa8W7qV34R9MQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3056F811E6E;
 Fri, 10 Mar 2023 10:02:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE58840B40E4;
 Fri, 10 Mar 2023 10:02:32 +0000 (UTC)
Date: Fri, 10 Mar 2023 10:02:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 15/18] ui/sdl: try to instantiate the matching opengl
 renderer
Message-ID: <ZAsANUeVUbLehjPQ@redhat.com>
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
 <20230307115637.2464377-16-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307115637.2464377-16-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Mar 07, 2023 at 03:56:34PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> User can still bypass the QEMU choice with SDL_RENDER_DRIVER environment
> variable. (for some reason, specifying a driver disables batching and
> breaks rendering, so enable it explicitly)

What problem is this change actually fixing ?  Can you explain here.

> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  ui/sdl2.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/ui/sdl2.c b/ui/sdl2.c
> index 592eca3e1c..e83ea53628 100644
> --- a/ui/sdl2.c
> +++ b/ui/sdl2.c
> @@ -99,7 +99,18 @@ void sdl2_window_create(struct sdl2_console *scon)
>                                           surface_width(scon->surface),
>                                           surface_height(scon->surface),
>                                           flags);
> +    if (scon->opengl) {
> +        const char *driver = "opengl";
> +
> +        if (scon->opts->gl == DISPLAYGL_MODE_ES) {
> +            driver = "opengles2";
> +        }
> +
> +        SDL_SetHint(SDL_HINT_RENDER_DRIVER, driver);
> +        SDL_SetHint(SDL_HINT_RENDER_BATCHING, "1");
> +    }
>      scon->real_renderer = SDL_CreateRenderer(scon->real_window, -1, 0);
> +
>      if (scon->opengl) {
>          scon->winctx = SDL_GL_CreateContext(scon->real_window);
>      }
> -- 
> 2.39.2
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


