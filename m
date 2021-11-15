Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0096D450793
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:53:50 +0100 (CET)
Received: from localhost ([::1]:44234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdMi-0001Tb-KV
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:53:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mmdLc-0008R0-CW
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:52:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mmdLa-0007aD-TZ
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:52:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636987956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UZYK/HIDJDh5ieHpUp40018sNJg/rqDAKGQbNj7b9N4=;
 b=SSnqyvd0YEJyRKmvj0D0dJdLEg/k4eYa7ppsX3vSq1+F2TuyqFrZenUFfSZstmw1MoaqJj
 F6UaK+FsqWvuM/i1R/UzFI69MNk6hEnJ/BfbMbeezvoWmB598grLZmGFn64XxiymcEEw10
 oK/euvyFm/XhqyFxqSCWmdkEu6RFx/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-vg_7KH6QOdqt3g0Wol9hww-1; Mon, 15 Nov 2021 09:52:35 -0500
X-MC-Unique: vg_7KH6QOdqt3g0Wol9hww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2BC6804142;
 Mon, 15 Nov 2021 14:52:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BB6B22719;
 Mon, 15 Nov 2021 14:52:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 80B0718000A9; Mon, 15 Nov 2021 15:52:32 +0100 (CET)
Date: Mon, 15 Nov 2021 15:52:32 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 3/6] pcie: add power indicator blink check
Message-ID: <20211115145232.2zl2wwsho4pisqyg@sirius.home.kraxel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211011120504.254053-4-kraxel@redhat.com>
 <20211115062728-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211115062728-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 15, 2021 at 06:29:18AM -0500, Michael S. Tsirkin wrote:
> On Mon, Oct 11, 2021 at 02:05:01PM +0200, Gerd Hoffmann wrote:
> > Refuse to push the attention button in case the guest is busy with some
> > hotplug operation (as indicated by the power indicator blinking).
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> Can't we do better and press the button later after
> indicator stops blinking?

I don't think this is a good idea.  acpi hotplug doesn't do automatic
retries either, and IMHO the behavior of acpi and native hotplug should
be as close as possible so management apps do not need to handle these
cases differently.

Specifically OpenStack will continue re-trying device_del commands
(mentioned by Daniel a few weeks ago) as long as it doesn't receive
the completion event, so things should work just fine as-is.

Beside that the typical workflow would be that the guest completes
device shutdown, then turns off power (-> qemu unplugs device and
sends completion event now), then turns off the power indicator led.
So in most cases the reason to press the button is gone when the
indicator stops blinking ...

take care,
  Gerd


