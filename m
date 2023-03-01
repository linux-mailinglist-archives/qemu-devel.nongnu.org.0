Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EB96A6EA2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:43:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXNfV-0005uW-GL; Wed, 01 Mar 2023 09:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXNfR-0005to-4g
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:42:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXNfP-0005vD-Gg
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677681770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mUoL52djJHV4U6Q0AocUNXu5cOADzyGX1rCYcv947Vo=;
 b=KiyCyF2/CCbzAG4fUSYASFLnst8wlsxs/Y99NuOEDNklCsy/koKsNh4657oXSjK3HZsL9c
 lsMmRa6L+dgJiWK3WyxMO3JdJGfUOsy138M7+mMjlQBc5+ECE2prebI11MC+EK4qBVzRpV
 EfPbXMj30dmxe9YpYzqBLAvmlM6EteY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-r6ghfZFvPAWAAxfMpzxImw-1; Wed, 01 Mar 2023 09:42:48 -0500
X-MC-Unique: r6ghfZFvPAWAAxfMpzxImw-1
Received: by mail-wr1-f70.google.com with SMTP id
 c30-20020adfa31e000000b002c59b266371so2597943wrb.6
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 06:42:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677681767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mUoL52djJHV4U6Q0AocUNXu5cOADzyGX1rCYcv947Vo=;
 b=CADao6wYAd9wqq9qLxk2UEug2nDWuLiamG2OkcF66TgDgzwdxOLVzgWduzlxu1TTQ/
 aKFYC/QsA1uzi58Hl5RQWn4sc02QHCumFtf5Ip7BJQey1cpo18LuVzba+mXDQ9sRe/UE
 ndzEW9pZIlXxaQ3W0WahIzKR95CVpFX1e4f+WpKD4d7yyht/W4mJX2wBLgo011cf1p3B
 p0L1Ag7sFq8FdV449jiBNafNG82ZiPxdxO2ULpqZLcNX/XJuRjvhyo1KgTSd8ma+xODL
 GweqOlhH8VDQzllBxKeKLBb8qRlVctH7El9B4drl0zRp80gEJtbUCgi21GUuVc2riD++
 wwXg==
X-Gm-Message-State: AO0yUKV2tMwkosSxwvfH+h1siMNbtw2U7hCr7WdoHN/gMOgAkPF1Yn2g
 uagmMni1sxgvEJlxoC0Y+RT0USMvr8SuCLAxoaoz8Ifl7eMF3RLnGsprAdWT6w1gjImFgorkA67
 TIfK5GddZanjNmxY=
X-Received: by 2002:a5d:678e:0:b0:2c7:161e:702f with SMTP id
 v14-20020a5d678e000000b002c7161e702fmr4825439wru.47.1677681766990; 
 Wed, 01 Mar 2023 06:42:46 -0800 (PST)
X-Google-Smtp-Source: AK7set/zOgUuyvLnaJH6Hn9hIOpS/PNQuFvTdkBolnpXzzOnNSqCowCZQlhVB0SNPxoOnz+Bjh45ig==
X-Received: by 2002:a5d:678e:0:b0:2c7:161e:702f with SMTP id
 v14-20020a5d678e000000b002c7161e702fmr4825418wru.47.1677681766700; 
 Wed, 01 Mar 2023 06:42:46 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 n31-20020a05600c3b9f00b003e8dcc67bdesm21774453wms.30.2023.03.01.06.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 06:42:46 -0800 (PST)
Date: Wed, 1 Mar 2023 15:42:44 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, Peter
 Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, Samuel Thibault
 <samuel.thibault@ens-lyon.org>, Paolo Bonzini <pbonzini@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH 0/3] qdev: Introduce QDEV_DECLARE_DEV_BUS_TYPES() macro
Message-ID: <20230301154244.4f43aa6d@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230213105609.6173-1-philmd@linaro.org>
References: <20230213105609.6173-1-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 13 Feb 2023 11:56:06 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> Experiment after discussing with Thomas around qdev_get_parent_bus:
> https://lore.kernel.org/qemu-devel/ad356f64-dca0-8117-d22a-a530e620ddb0@r=
edhat.com/
>=20
> When a QDev plug on a QBus, we'll always use qdev_get_parent_bus()
> at least once with this type. Why not provide a consistent defined
> macro instead of:
>  1/ adding an inlined helper such usb_bus_from_device()
>     or scsi_bus_from_device() with different type checks,
>  2/ open-code calls to qdev_get_parent_bus() with unsafe casts
> ?
>=20
> This RFC series introduce a QDev-equivalent of QOM DECLARE_TYPES
> macro, to be used with a (device, bus) tuple, and declaring the
> equivalent device_GET_BUS() macro.
it's already bad having 2 ways to declare types (though SIMPLE was a huge L=
OC saving)
so question is where do we stop (API explosion ain't a good thing either).

I my opinion this is just code churn for nor tangible benefit,
given how qdev_get_parent_bus() is used.
Fixing unsafe casts and getting rid of DO_UPCAST you mentioned before,
would better use of resources.

> hw/usb/ is converted as an example.
>=20
> Philippe Mathieu-Daud=C3=A9 (3):
>   hw/qdev: Introduce QDEV_DECLARE_DEV_BUS_TYPES() macro
>   hw/usb: Declare QOM macros using QDEV_DECLARE_DEV_BUS_TYPES()
>   hw/usb: Use USB_DEVICE_GET_BUS() macro
>=20
>  hw/usb/bus.c           | 10 +++++-----
>  hw/usb/core.c          |  6 +++---
>  hw/usb/dev-hub.c       |  4 ++--
>  hw/usb/dev-serial.c    | 10 +++++-----
>  hw/usb/hcd-xhci.c      |  2 +-
>  include/hw/qdev-core.h | 28 ++++++++++++++++++++++++++++
>  include/hw/usb.h       | 13 ++++---------
>  7 files changed, 48 insertions(+), 25 deletions(-)
>=20


