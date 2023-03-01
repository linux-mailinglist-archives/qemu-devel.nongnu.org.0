Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9126A6EEF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:00:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXNwO-0007gs-99; Wed, 01 Mar 2023 10:00:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXNwD-0007fF-Fn
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:00:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXNwB-0002Os-0Z
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:00:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677682809;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F5XBrRaa8Q9mXZgSFM6o7RA3XotC5vkLvx0iSoRlDlM=;
 b=fLfejUY5mAp7teNkUVwAklMbwmWhr5bBym4UE97Fsdvwzxkhl5NpeT48A2KvOG+3JnkEZu
 Drr3nvWx6k9nrY8JejGRZPPbo6sdCjHAKEZy/TxJz8/bRadaSlrutqKDbncMiFCpZxgV1k
 BTfDWysy41rgImyX0aQtwN8T/PMX1LU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-vMMUWLeMOESq_WbPVMJ5fw-1; Wed, 01 Mar 2023 10:00:04 -0500
X-MC-Unique: vMMUWLeMOESq_WbPVMJ5fw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E7F01C05154;
 Wed,  1 Mar 2023 15:00:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 368A9492C3E;
 Wed,  1 Mar 2023 14:59:59 +0000 (UTC)
Date: Wed, 1 Mar 2023 14:59:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH 1/3] hw/qdev: Introduce QDEV_DECLARE_DEV_BUS_TYPES()
 macro
Message-ID: <Y/9oap1KoVAmY8Wr@redhat.com>
References: <20230213105609.6173-1-philmd@linaro.org>
 <20230213105609.6173-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230213105609.6173-2-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

On Mon, Feb 13, 2023 at 11:56:07AM +0100, Philippe Mathieu-Daudé wrote:
> Similarly to QOM OBJECT_DECLARE_TYPE() equivalent, introduce
> a QDev macro to declare common helpers for device sitting on
> a bus.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/hw/qdev-core.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 93718be156..dc9909a2e7 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -717,6 +717,34 @@ void qdev_pass_gpios(DeviceState *dev, DeviceState *container,
>  
>  BusState *qdev_get_parent_bus(const DeviceState *dev);
>  
> +/**
> + * QDEV_DECLARE_DEV_BUS_TYPES:
> + * @DeviceInstanceType: device instance struct name
> + * @DeviceClassType: device class struct name
> + * @DEVICE_OBJ_NAME: the device name in uppercase with underscore separators
> + * @BusInstanceType: bus instance struct name
> + * @DeviceClassType: bus class struct name
> + * @BUS_OBJ_NAME: the bus name in uppercase with underscore separators
> + *
> + * This macro is typically used in a header file, and will:
> + *
> + *   - create the typedefs for the object and class structs
> + *   - register the type for use with g_autoptr
> + *   - provide four standard type cast functions
> + *
> + * The device state struct, device class struct, bus state struct need
> + * to be declared manually.
> + */
> +#define QDEV_DECLARE_DEV_BUS_TYPES(DeviceInstanceType, DeviceClassType, \
> +                                                       DEVICE_OBJ_NAME, \
> +                                   BusInstanceType, BUS_OBJ_NAME) \
> +    OBJECT_DECLARE_TYPE(DeviceInstanceType, DeviceClassType, DEVICE_OBJ_NAME) \
> +    OBJECT_DECLARE_SIMPLE_TYPE(BusInstanceType, BUS_OBJ_NAME) \

I'm not especially a fan of putting the declaration of two distinct
types behind one macro. This also makes it mismatch with the need
to use distinct OBJECT_DEFINE macros for each of the types.

> +    \
> +    static inline G_GNUC_UNUSED BusInstanceType * \
> +    DEVICE_OBJ_NAME##_GET_BUS(const DeviceInstanceType *dev) \
> +    { return BUS_OBJ_NAME(qdev_get_parent_bus(DEVICE(dev))); }
> +
>  /*** BUS API. ***/
>  
>  DeviceState *qdev_find_recursive(BusState *bus, const char *id);
> -- 
> 2.38.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


