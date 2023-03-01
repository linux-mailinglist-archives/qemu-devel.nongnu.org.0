Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44B46A6EF2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:04:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXNz8-0000vm-BP; Wed, 01 Mar 2023 10:03:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXNz6-0000vR-HT
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:03:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXNz4-0003RA-9x
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677682989;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8JW0RZSBvgSIMWB8egaCptwx/tOZYBBXFhyuAtJcN64=;
 b=BHMm8Yqq0CDbTJAsmEBeEOPpY9qSwWdZbmWnpddwnEHfZz8OHH8M5VMDbjl56sDM4OMvvQ
 JlS4XHOnC06gZp+0lfYjKd5eNliz82bGy9+Ch61HVWX1293yTlygP26TEo0N4rSChLNE7K
 r5Jg3zJiI/JMn1bMgbWuwyR3zMgXuKI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-6buQ-1akO0WE04--0400Qw-1; Wed, 01 Mar 2023 10:03:04 -0500
X-MC-Unique: 6buQ-1akO0WE04--0400Qw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45BB91C189A7;
 Wed,  1 Mar 2023 15:02:41 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFEBE18EC1;
 Wed,  1 Mar 2023 15:02:35 +0000 (UTC)
Date: Wed, 1 Mar 2023 15:02:25 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH 0/3] qdev: Introduce QDEV_DECLARE_DEV_BUS_TYPES() macro
Message-ID: <Y/9pAaV0QoTzGg4q@redhat.com>
References: <20230213105609.6173-1-philmd@linaro.org>
 <20230301154244.4f43aa6d@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230301154244.4f43aa6d@imammedo.users.ipa.redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

On Wed, Mar 01, 2023 at 03:42:44PM +0100, Igor Mammedov wrote:
> On Mon, 13 Feb 2023 11:56:06 +0100
> Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> 
> > Experiment after discussing with Thomas around qdev_get_parent_bus:
> > https://lore.kernel.org/qemu-devel/ad356f64-dca0-8117-d22a-a530e620ddb0@redhat.com/
> > 
> > When a QDev plug on a QBus, we'll always use qdev_get_parent_bus()
> > at least once with this type. Why not provide a consistent defined
> > macro instead of:
> >  1/ adding an inlined helper such usb_bus_from_device()
> >     or scsi_bus_from_device() with different type checks,
> >  2/ open-code calls to qdev_get_parent_bus() with unsafe casts
> > ?
> > 
> > This RFC series introduce a QDev-equivalent of QOM DECLARE_TYPES
> > macro, to be used with a (device, bus) tuple, and declaring the
> > equivalent device_GET_BUS() macro.
> it's already bad having 2 ways to declare types (though SIMPLE was a huge LOC saving)
> so question is where do we stop (API explosion ain't a good thing either).
> 
> I my opinion this is just code churn for nor tangible benefit,
> given how qdev_get_parent_bus() is used.

Right so in the USB conversion the only improvement is the elimination of
this method:

-static inline USBBus *usb_bus_from_device(USBDevice *d)
-{
-    return DO_UPCAST(USBBus, qbus, qdev_get_parent_bus(DEVICE(d)));
-}

It strikes me that we don't have especially many (bus-type, device-type)
pairs that would benefit from this macro.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


