Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36C26B3B5B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 10:53:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZQm-00051r-5b; Fri, 10 Mar 2023 04:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1paZQk-00051a-2P
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:52:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1paZQi-0003Nm-FB
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:52:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678441971;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pmrPItXqVywKVXBkxzIewPtAe1o/MEiPDX83nkQsuJg=;
 b=bR9Fxf5rBPcJRCYgvDCcrBvH92BXwHuEpf6nlKecb8AQZfhFyOGBHt+4Irvk/Ok5qlXfem
 V3Ir4jcQKFuVZSCFqTP6fFockbaG23n5zJmxIjAxj0/M4zpTr/chmYVBVaEsc4Sxrif2Sj
 dqzTeTGzIVOhHpFOSMjNuFdmFPMrMB0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-RGxDmvV-MqW4pAopm-RSnA-1; Fri, 10 Mar 2023 04:52:45 -0500
X-MC-Unique: RGxDmvV-MqW4pAopm-RSnA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E50FD185A794;
 Fri, 10 Mar 2023 09:52:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A2FCC15BAD;
 Fri, 10 Mar 2023 09:52:43 +0000 (UTC)
Date: Fri, 10 Mar 2023 09:52:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 07/18] ui: rename cursor_{get->ref}, return it
Message-ID: <ZAr96bjzg+/KhCo1@redhat.com>
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
 <20230307115637.2464377-8-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307115637.2464377-8-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Tue, Mar 07, 2023 at 03:56:26PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The naming is more conventional in QEMU code, and allows to simplify
> some code.

Nit-pick, this commit also changes the API design, so it
returns the input parameter, instead of void. This makes
sense as it simplifies usage, but please mentioned it in
the commit as this is more than just a rename commit.

> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/ui/console.h | 2 +-
>  ui/cursor.c          | 3 ++-
>  ui/dbus-listener.c   | 3 +--
>  ui/spice-display.c   | 4 ++--
>  ui/vnc.c             | 3 +--
>  5 files changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


> 
> diff --git a/include/ui/console.h b/include/ui/console.h
> index 3efd1f6b82..0b01df947e 100644
> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -151,7 +151,7 @@ typedef struct QEMUCursor {
>  } QEMUCursor;
>  
>  QEMUCursor *cursor_alloc(int width, int height);
> -void cursor_get(QEMUCursor *c);
> +QEMUCursor *cursor_ref(QEMUCursor *c);
>  void cursor_unref(QEMUCursor *c);
>  QEMUCursor *cursor_builtin_hidden(void);
>  QEMUCursor *cursor_builtin_left_ptr(void);
> diff --git a/ui/cursor.c b/ui/cursor.c
> index 31b09bf058..6fe67990e2 100644
> --- a/ui/cursor.c
> +++ b/ui/cursor.c
> @@ -106,9 +106,10 @@ QEMUCursor *cursor_alloc(int width, int height)
>      return c;
>  }
>  
> -void cursor_get(QEMUCursor *c)
> +QEMUCursor *cursor_ref(QEMUCursor *c)
>  {
>      c->refcount++;
> +    return c;
>  }
>  
>  void cursor_unref(QEMUCursor *c)
> diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
> index 906ab296ca..2e87ed7e9a 100644
> --- a/ui/dbus-listener.c
> +++ b/ui/dbus-listener.c
> @@ -339,14 +339,13 @@ static void dbus_cursor_define(DisplayChangeListener *dcl,
>      DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
>      GVariant *v_data = NULL;
>  
> -    cursor_get(c);
>      v_data = g_variant_new_from_data(
>          G_VARIANT_TYPE("ay"),
>          c->data,
>          c->width * c->height * 4,
>          TRUE,
>          (GDestroyNotify)cursor_unref,
> -        c);
> +        cursor_ref(c));
>  
>      qemu_dbus_display1_listener_call_cursor_define(
>          ddl->proxy,
> diff --git a/ui/spice-display.c b/ui/spice-display.c
> index 243a794638..5bee19a7f9 100644
> --- a/ui/spice-display.c
> +++ b/ui/spice-display.c
> @@ -460,7 +460,7 @@ void qemu_spice_cursor_refresh_bh(void *opaque)
>      if (ssd->cursor) {
>          QEMUCursor *c = ssd->cursor;
>          assert(ssd->dcl.con);
> -        cursor_get(c);
> +        cursor_ref(c);
>          qemu_mutex_unlock(&ssd->lock);
>          dpy_cursor_define(ssd->dcl.con, c);
>          qemu_mutex_lock(&ssd->lock);
> @@ -765,7 +765,7 @@ static void display_mouse_define(DisplayChangeListener *dcl,
>      SimpleSpiceDisplay *ssd = container_of(dcl, SimpleSpiceDisplay, dcl);
>  
>      qemu_mutex_lock(&ssd->lock);
> -    cursor_get(c);
> +    cursor_ref(c);
>      cursor_unref(ssd->cursor);
>      ssd->cursor = c;
>      ssd->hot_x = c->hot_x;
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 0bdcc3dfce..8aec5d751e 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -1032,8 +1032,7 @@ static void vnc_dpy_cursor_define(DisplayChangeListener *dcl,
>      cursor_unref(vd->cursor);
>      g_free(vd->cursor_mask);
>  
> -    vd->cursor = c;
> -    cursor_get(vd->cursor);
> +    vd->cursor = cursor_ref(vd->cursor);
>      vd->cursor_msize = cursor_get_mono_bpl(c) * c->height;
>      vd->cursor_mask = g_malloc0(vd->cursor_msize);
>      cursor_get_mono_mask(c, 0, vd->cursor_mask);
> -- 
> 2.39.2
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


