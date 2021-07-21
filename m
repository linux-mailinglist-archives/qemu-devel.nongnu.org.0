Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732843D0E10
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 13:47:17 +0200 (CEST)
Received: from localhost ([::1]:50044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Ah1-00006Y-SO
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 07:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6AeP-0006NB-S1
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 07:44:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6AeN-0008SU-8a
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 07:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626867869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CVfdFMoO4aaWBkLjCU/YT9P5y6seNOFAS7CCBRYCJQ8=;
 b=CtGzcNZOVF8cYP0myLjLDa74K6R31u07aKiCrD9UGrFXvBR+UTu478XYotr+rtNZEnCDf8
 UiPTGB3aWeWaE5BE3g3nzckkCrjldYip2KU73BUy5zKKJTzZOFweojW/m9nZV550hZTBqx
 xWrFxtsDokil7q3HnmAIy8T1nOUfPYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-oh99XMJ8PauZmsIWIeU9xw-1; Wed, 21 Jul 2021 07:44:27 -0400
X-MC-Unique: oh99XMJ8PauZmsIWIeU9xw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 967AF10086C6;
 Wed, 21 Jul 2021 11:44:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 617E960854;
 Wed, 21 Jul 2021 11:44:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C34D918000B2; Wed, 21 Jul 2021 13:44:24 +0200 (CEST)
Date: Wed, 21 Jul 2021 13:44:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Qiang Liu <cyruscyliu@gmail.com>
Subject: Re: [PATCH] hw/usb/hcd-dwc2: Enforce epnum to 0 for the control
 endpoint to avoid the assertion failure in usb_ep_get()
Message-ID: <20210721114424.73okxhz7ud5mj2on@sirius.home.kraxel.org>
References: <1624764506-19841-1-git-send-email-cyruscyliu@gmail.com>
 <CAAKa2jmWU=M8V9Lsjrjs-AV=RP6wVNb7mWBAM+MkT9HTdrwtzA@mail.gmail.com>
 <CADBGO78TVLf4qaJDhTvkJ61vPdzmAT1BFrCpDurgPOdmFyP1Og@mail.gmail.com>
 <CAAKa2jk9HS7cY1N6icRJJdZxBqhzcrxYPSCpdGVSm_OLwCcNbQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAKa2jk9HS7cY1N6icRJJdZxBqhzcrxYPSCpdGVSm_OLwCcNbQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Paul Zimmerman <pauldzim@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > > * https://gitlab.com/qemu-project/qemu/-/issues/119
> > > * https://gitlab.com/qemu-project/qemu/-/issues/303

> diff --git a/hw/usb/core.c b/hw/usb/core.c
> index 975f762..a29b378 100644
> --- a/hw/usb/core.c
> +++ b/hw/usb/core.c
> @@ -735,10 +735,11 @@ void usb_ep_dump(USBDevice *dev)
> 
>  struct USBEndpoint *usb_ep_get(USBDevice *dev, int pid, int ep)
>  {
>      struct USBEndpoint *eps;
> 
>      assert(dev != NULL);
> -    if (ep == 0) {
> +    if (ep == 0 || pid == USB_TOKEN_SETUP) {
>          return &dev->ep_ctl;
>      }

Looks sane to me, although I'm not sure it matches what
real hardware does.

Can you submit that as proper patch (including Resolves: for the gitlab
issues fixed)?

> > message and fail the operation? AFAIK there are no real-world devices
> > that have Control endpoints other than 0, although I believe it is allowed
> > by the USB spec.

IIRC control endpoint is zero by spec.

thanks & take care,
  Gerd


