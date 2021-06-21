Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281E73AE4E5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:31:55 +0200 (CEST)
Received: from localhost ([::1]:53094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvFLW-0003l4-8c
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lvFKT-00034W-JQ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:30:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lvFKQ-0000uM-Nd
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624264246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C2um6vRCfzfg+/47O0+EY1XMc9mJ+DbJSk2+rt4dICc=;
 b=G4D9pxLjQuJxSpfGlge89PkOtCxo78PdrjCC6wrpxWa+74YpQo+LcItIAPnpSWvP9cK/O9
 /qhTrzVdGhy5VyyJ48SSYsyQkd8OXGhkTsqDRH4Y61mBUVK2nxzP+jp7B8yDlKs0An0RBp
 /qd7xbCEht0shVahKh5nm7JHAeyyDXA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-c0IllLKROrq4ru7Jt0noHw-1; Mon, 21 Jun 2021 04:30:42 -0400
X-MC-Unique: c0IllLKROrq4ru7Jt0noHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CC7F9F92F;
 Mon, 21 Jun 2021 08:30:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-99.ams2.redhat.com
 [10.36.112.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AA405D9F0;
 Mon, 21 Jun 2021 08:30:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 23F42112D587; Mon, 21 Jun 2021 10:30:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] ui/gtk: Allow user to select monitor number to
 display qemu in full screen through new gtk display option
References: <20210617020609.18089-1-swee.aun.khor@intel.com>
 <8735tfsa79.fsf@dusky.pond.sub.org>
 <DM8PR11MB571712EDA6522BB50D192A63AF0A9@DM8PR11MB5717.namprd11.prod.outlook.com>
 <20210621065148.o7yggutrxgvdnpc7@sirius.home.kraxel.org>
Date: Mon, 21 Jun 2021 10:30:36 +0200
In-Reply-To: <20210621065148.o7yggutrxgvdnpc7@sirius.home.kraxel.org> (Gerd
 Hoffmann's message of "Mon, 21 Jun 2021 08:51:48 +0200")
Message-ID: <875yy739hv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: "Khor, Swee Aun" <swee.aun.khor@intel.com>, "Romli,
 Khairul Anuar" <khairul.anuar.romli@intel.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd Hoffmann <kraxel@redhat.com> writes:


[...]

>> sweeaun: Based on my observation, when specific monitor device disconnected after QEMU launched on it, QEMU application will not be visible but QEMU application still running and screen framebuffer size is not being changed at all. QEMU application will be visible once you connect back the monitor. 
>
> Well, that probably depends on the display server and might even be
> configurable.  I've seen different ways to handle that, most common ones
> being (a) do nothing or (b) trying move all windows to the monitor which
> is still connected.
>
> I don't think qemu has to worry much here, and trying to automatically
> adapt to hot-plugged monitors might even have bad interactions with
> whatever the display server is going to do.

I'm concerned there is a TOCTTOU issue:

    if (opts->u.gtk.has_monitor) {
        int n_monitor;
1.      n_monitor = gdk_display_get_n_monitors(window_display);

2.      if ((opts->u.gtk.monitor <= n_monitor) &&
            (opts->u.gtk.monitor > 0)) {
            GdkScreen *gdk_screen;
            gdk_screen = gdk_display_get_default_screen(window_display);
3.          gtk_window_fullscreen_on_monitor(GTK_WINDOW(s->window), gdk_screen,
                                             (opts->u.gtk.monitor - 1));
        } else {
            fprintf(stderr, "Invalid GTK monitor argument\n");
        }
    }

If monitors can go at any time, then the check 2. cannot ensure we pass
a valid monitor number at 3.

I asked what happens when we pass an invalid monitor number.  I'm not
sure I understand sweeaun's answer.

If what happens is sane, then why have check 2.?


