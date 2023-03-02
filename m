Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FFE6A7F92
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:06:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfpJ-0002Ij-DU; Thu, 02 Mar 2023 05:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXfpD-0002IO-DT
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:06:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXfp8-0006Pk-Ff
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:06:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677751565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=56fmUVNWcrxPPa5A5GUQMp0OQpe4iDVfH44vO/SYPZY=;
 b=g69zPle+yntaLJStTG67RuRNY1RQ6PMRjDr964Bwna/tqlA6QgnjIxSf6sn/gCP17ODRfk
 tC86KwzObklL3PgcIrM1nXlGcEVvFwjL6vAqjgt36n6d9dAtYM9DyTKkGlS2DWO3N3mUax
 AgijbqPBPg43srToKM7MJS+QFpQEFwQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-219-Z1MTDdSKPB2YAJvROjdtoA-1; Thu, 02 Mar 2023 05:06:03 -0500
X-MC-Unique: Z1MTDdSKPB2YAJvROjdtoA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n27-20020a05600c3b9b00b003e9ca0f4677so852459wms.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 02:06:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677751562;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=56fmUVNWcrxPPa5A5GUQMp0OQpe4iDVfH44vO/SYPZY=;
 b=mgjn603dGCwgDo45F3qyB163m3sDBp4L5QJNhZ6oxwtrzcygiyOshS/HF8Ibtu3lOf
 QfEmhwVK8c8SaZ82j2ijyCcaNDHkanWCSH95EEaCJWmGygVGSzp5y7vfbZdGQhIutVW/
 itWJ51N2sJxxhSpyIGV4Pv1M6eSqbsy/RJ/xZPxdCaieKRoYeV8L041/ie9iNIxz8ENw
 R6ebXEEwL/2kNZ9Xg43GZoTbEIyxuzEw0VzO5Zx34hiJTBfC9O5BkAnfSOLHVH8FXnJL
 h8kw/H5E3J5G+xEVzcXK7RqfFU3b6kZr+Fl+wNPQ2Rkt1pext628xlWPeTtvMTUITTFi
 KxJw==
X-Gm-Message-State: AO0yUKWCIMs/JMQ0uS4f3DTaKSpbXQ766qsX5+xSvYJ8lz8KAk3PshoT
 YyEXu81/3fXuVc39kjZbXubXOrlce6FLWAavmPy2fSe/kp1wQR0aNPYE9a3vBibJQ4TrXRMfFsZ
 HvUVNT/qQYm6oMDU=
X-Received: by 2002:a05:600c:164a:b0:3ea:a76a:4965 with SMTP id
 o10-20020a05600c164a00b003eaa76a4965mr7054613wmn.21.1677751562464; 
 Thu, 02 Mar 2023 02:06:02 -0800 (PST)
X-Google-Smtp-Source: AK7set+rCjkqSmh9BQzZB0RwjSWyzsVh1KzvgTPj7RtoLX4OFELk/LVxn4FeEPFuY11GsYzZiim6Xw==
X-Received: by 2002:a05:600c:164a:b0:3ea:a76a:4965 with SMTP id
 o10-20020a05600c164a00b003eaa76a4965mr7054585wmn.21.1677751562122; 
 Thu, 02 Mar 2023 02:06:02 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 bg37-20020a05600c3ca500b003dc4fd6e624sm2631935wmb.19.2023.03.02.02.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 02:06:01 -0800 (PST)
Date: Thu, 2 Mar 2023 05:05:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 eduardo@habkost.net, berrange@redhat.com, pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: Re: [PATCH v5 18/18] qapi: introduce DEVICE_ON event
Message-ID: <20230302050458-mutt-send-email-mst@kernel.org>
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
 <20230216180356.156832-19-vsementsov@yandex-team.ru>
 <20230302034409-mutt-send-email-mst@kernel.org>
 <6a50292f-df61-a689-47b9-20e0bce95e25@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a50292f-df61-a689-47b9-20e0bce95e25@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Thu, Mar 02, 2023 at 01:03:12PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 02.03.23 11:44, Michael S. Tsirkin wrote:
> > On Thu, Feb 16, 2023 at 09:03:56PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > We have DEVICE_DELETED event, that signals that device_del command is
> > > actually completed. But we don't have a counter-part for device_add.
> > > Still it's sensible for SHPC and PCIe-native hotplug, as there are time
> > > when the device in some intermediate state. Let's add an event that say
> > > that the device is finally powered on, power indicator is on and
> > > everything is OK for next manipulation on that device.
> > > 
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> > > ---
> > >   qapi/qdev.json | 10 ++++++++++
> > >   hw/pci/pcie.c  | 14 ++++++++++++++
> > >   hw/pci/shpc.c  | 12 ++++++++++++
> > >   3 files changed, 36 insertions(+)
> > > 
> > > diff --git a/qapi/qdev.json b/qapi/qdev.json
> > > index 6f2d8d6647..116a8a7de8 100644
> > > --- a/qapi/qdev.json
> > > +++ b/qapi/qdev.json
> > > @@ -348,3 +348,13 @@
> > >   { 'command': 'query-hotplug',
> > >     'data': { 'id': 'str' },
> > >     'returns': 'HotplugInfo' }
> > > +
> > > +##
> > > +# @DEVICE_ON:
> > > +#
> > > +# Emitted whenever the device insertion completion is acknowledged by the guest.
> > > +# For now only emitted for SHPC and PCIe-native hotplug.
> > > +#
> > > +# Since: 8.0
> > > +##
> > > +{ 'event': 'DEVICE_ON', 'data': 'DeviceAndPath' }
> > 
> > Same as any event, this has to be accompanied by a query.
> > Which query returns the "ON" status?
> > 
> 
> Hmm. Seems correct to add "ON" status into "hostplug state", to be returned by query-hotplug. And then, its change should be reported by HOTPLUG_STATE, and separate DEVICE_ON is not needed.
> 
> -- 
> Best regards,
> Vladimir

Given it can go on and off at any time ... I'm not that sure this makes
sense as a generic thing. one has to know about specifics of how shpc
behaves to understand and use it correctly.

-- 
MST


