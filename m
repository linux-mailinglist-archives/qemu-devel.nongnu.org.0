Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F0131FC4D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:44:07 +0100 (CET)
Received: from localhost ([::1]:36436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7ws-00059i-Qk
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD7Hm-00042Y-Em
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 10:01:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD7Hh-00015J-On
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 10:01:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613746889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DaEWDovmLFnjwT+gkgv4956oQJ2hQ7aJSgM8ZDHKKaU=;
 b=Oj1KEOf8XUdZVYdxSJP7xHwrPJqKt2Szqu3gSIUGgCXzYz647iQIO++jghkaI18Z2wzkKu
 wZAJ2UI6HfJw6Un7FnAKqd91Gy4fyy7p1CJQQIiNwOU2tNwK01aOP6a4x7yqz2LzEeF7GQ
 U+G3CNWYGCwchIhQQ9lYw6fQt/67dvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-qhCfP3hVM2GjOU-hlI1pxQ-1; Fri, 19 Feb 2021 10:01:23 -0500
X-MC-Unique: qhCfP3hVM2GjOU-hlI1pxQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B695384E251;
 Fri, 19 Feb 2021 15:01:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80B291750D;
 Fri, 19 Feb 2021 15:01:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0AF2118000A2; Fri, 19 Feb 2021 16:01:20 +0100 (CET)
Date: Fri, 19 Feb 2021 16:01:20 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] ui/cocoa: Do not exit immediately after shutdown
Message-ID: <20210219150120.sjxs463znn46i2oh@sirius.home.kraxel.org>
References: <20210219084618.90311-1-akihiko.odaki@gmail.com>
 <CAFEAcA_eKtZ--p=S9P7_9cEDxfvBVsb_aP4p6Luc+9XutGDxYA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_eKtZ--p=S9P7_9cEDxfvBVsb_aP4p6Luc+9XutGDxYA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Gerd: I notice that the only ui frontends that try to do this
> SHUTDOWN_CAUSE_HOST_UI thing are the Cocoa UI and the SDL2 UI.
> The GTK UI does
>         qmp_quit()
> instead; the SDL2 UI does
>         shutdown_action = SHUTDOWN_ACTION_POWEROFF;
>         qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
> (presumably to avoid the "maybe the user told us to 'pause'"
> issue I mention above).

Seems so, qemu hangs in "[paused]" indeed when started with
-no-shutdown.

> None of the other UI frontends have
> any shutdown related handling. Shouldn't we be consistent
> about how we do this ?

Makes sense.  Probably best with a little 3-line helper called by all
UIs so we are consistent.

take care,
  Gerd


