Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43094545C28
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 08:22:18 +0200 (CEST)
Received: from localhost ([::1]:46344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzY2C-0001RR-Tk
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 02:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzXlt-0001td-74
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 02:05:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzXlo-0006IX-9O
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 02:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654841119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2dhbWvrLynoHvO2nW5mIMWMhRq6+qFlFCCJXi3bITFk=;
 b=b1M34P0t+OJnI1EtTpQh6kLIIsMRBFd/kUYRP1zaGgQ4TCOBlywAPQ2h/4B+ah4EhAr0En
 EkRhwje25RBuVRQkypsEOIbPbAK4zxtLIYet9NuKzO8cEOtbPpWW6bqHm4WUOhvzhZxski
 1T5nHUJUm+l4nRWBQGsjLKheaAVFH6E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-qkp8M5d4ODONh84_xkEEdQ-1; Fri, 10 Jun 2022 02:05:17 -0400
X-MC-Unique: qkp8M5d4ODONh84_xkEEdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B6503810D29;
 Fri, 10 Jun 2022 06:05:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3C7C2166B26;
 Fri, 10 Jun 2022 06:05:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B2A4618000A3; Fri, 10 Jun 2022 08:05:11 +0200 (CEST)
Date: Fri, 10 Jun 2022 08:05:11 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: qemu-devel@nongnu.org,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 1/2] ui/gtk: detach VCS for additional guest displays
Message-ID: <20220610060511.mmea2ulw6luuub6r@sirius.home.kraxel.org>
References: <20220531202327.14636-1-dongwon.kim@intel.com>
 <20220531202327.14636-2-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220531202327.14636-2-dongwon.kim@intel.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

On Tue, May 31, 2022 at 01:23:26PM -0700, Dongwon Kim wrote:
> Detaching any addtional guest displays in case there are multiple
> displays assigned to the guest OS (e.g. max_outputs=n) so that
> all of them are visible upon lauching.
> 
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  ui/gtk.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/ui/gtk.c b/ui/gtk.c
> index c57c36749e..abfcf48547 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -2304,6 +2304,8 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
>      GtkDisplayState *s = g_malloc0(sizeof(*s));
>      GdkDisplay *window_display;
>      GtkIconTheme *theme;
> +    int n_gfx_vcs = 0;
> +    int i;
>      char *dir;
>  
>      if (!gtkinit) {
> @@ -2374,7 +2376,14 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
>      gtk_widget_set_sensitive(s->copy_item,
>                               vc && vc->type == GD_VC_VTE);
>  #endif
> -
> +    for (i = 0; i < s->nb_vcs; i++) {
> +        if (qemu_console_is_graphic(s->vc[i].gfx.dcl.con)) {

Accessing vc[i].gfx without checking vc[i].type beforehand is wrong.

Also note that graphical consoles are sorted to the head of the list.
n_gfx_vcs should not be needed because the primary gfx display has
index 0 no matter what.

take care,
  Gerd


