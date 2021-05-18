Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB20C387737
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 13:14:36 +0200 (CEST)
Received: from localhost ([::1]:43088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixgK-0004Ix-2V
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 07:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lixII-0000zW-Ve
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:49:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lixIF-0006rk-PQ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621334982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8rbuWIxA7xnQODxjkkVqbj9uiSg9xCWOuHysUFjMmmQ=;
 b=ZC6lt6LNyOCqBeID0fNPVlfqvmB1VqTm2RI7bFYETToU20liIPIBW+iRfdRa47QQzxe53C
 esLTFhKlftTJGwgIZrL7DBPRfT6OkmvxCgs7buxPqsRFAqXN2tPYGJDAcrudTC6Bwqt7Zb
 BOMmxvj7eKbjFuTTbP6Jt0fRlUFl7JE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-6AdNQLzWMRyXx1mMrzHx_g-1; Tue, 18 May 2021 06:49:40 -0400
X-MC-Unique: 6AdNQLzWMRyXx1mMrzHx_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD09D818401;
 Tue, 18 May 2021 10:49:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-0.ams2.redhat.com
 [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 253EE2989F;
 Tue, 18 May 2021 10:49:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C3BAC180079B; Tue, 18 May 2021 12:49:34 +0200 (CEST)
Date: Tue, 18 May 2021 12:49:34 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH v3 05/11] pckbd: don't update OBF flags if KBD_STAT_OBF
 is set
Message-ID: <20210518104934.nfsjuztjg7clymw7@sirius.home.kraxel.org>
References: <d00ea6b1-43c7-78a2-8c0a-35e19efb5e46@t-online.de>
 <20210515113254.6245-5-vr_qemu@t-online.de>
MIME-Version: 1.0
In-Reply-To: <20210515113254.6245-5-vr_qemu@t-online.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

>  static const VMStateDescription vmstate_kbd = {
>      .name = "pckbd",
> -    .version_id = 3,
> +    .version_id = 4,
>      .minimum_version_id = 3,
>      .post_load = kbd_post_load,
>      .fields = (VMStateField[]) {
> @@ -435,6 +471,7 @@ static const VMStateDescription vmstate_kbd = {
>          VMSTATE_UINT8(status, KBDState),
>          VMSTATE_UINT8(mode, KBDState),
>          VMSTATE_UINT8(pending, KBDState),
> +        VMSTATE_UINT8_V(obdata, KBDState, 4),
>          VMSTATE_END_OF_LIST()
>      },
>      .subsections = (const VMStateDescription*[]) {
> @@ -512,12 +549,20 @@ void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out)
>      qdev_connect_gpio_out_named(DEVICE(dev), I8042_A20_LINE, 0, a20_out);
>  }

Unfortunately live migration isn't that easy.  Reason is we want able to
live-migrate both ways (old qemu -> new qemu but also new qemu -> old qemu).
With version ids we can do old qemu -> new qemu only.

So the usual way to deal with this is that new features which require
additional state information can be enabled/disabled at runtime using
device properties.  The feature is turned off for the compatibility
machine types.  The additional state is added using a conditional
subsection, which is only sent in case the feature is enabled.  That way
qemu with -- says -- "-machine pc-q35-5.0" will only enable features and
sent vmstate which qemu 5.0 is able to deal with.

I think there is no way around such a property for the ps2 fixes, even
if we use it for sending/not sending the additional ps2 state
information needed by the bugfixes.  Making the fixes itself conditional
should not be needed I think.

take care,
  Gerd


