Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D01725A77B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 10:13:13 +0200 (CEST)
Received: from localhost ([::1]:55082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDNtI-0005Jc-H9
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 04:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kDNpv-0000NN-SZ
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 04:09:43 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45859
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kDNpu-0001xV-4P
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 04:09:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599034181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ACkZb7/sBYGQIeeygF5TfmTCRBtkDr0a9rYMr8stNs=;
 b=IzVC8JY55nQ3dVZzAxPcNVGU4VwQPHudhx1gvLhH3fF/JRZFnzuiCOdKxQ7X1Ocx4C14uV
 KnCvfLqicElZeM/n4UgTYC2fUqsHbYQeNINCTpFtTnEHiAZHfkoLYC3Vace930QM9gUFmX
 KUZJYNoqIZvzzoE65sO2m21mL8YMVfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-BZuxw14gObqBnczFK7qjcA-1; Wed, 02 Sep 2020 04:09:39 -0400
X-MC-Unique: BZuxw14gObqBnczFK7qjcA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0D3981CAFE;
 Wed,  2 Sep 2020 08:09:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FBE918B59;
 Wed,  2 Sep 2020 08:09:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1F87431E23; Wed,  2 Sep 2020 10:09:37 +0200 (CEST)
Date: Wed, 2 Sep 2020 10:09:37 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] usb-host: workaround libusb bug
Message-ID: <20200902080937.p6fweexn7cxzru5p@sirius.home.kraxel.org>
References: <20200824110057.32089-1-kraxel@redhat.com>
 <878sdt618f.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <878sdt618f.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 03:24:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > +#include <linux/usbdevice_fs.h>

> > +        int rc = ioctl(hostfd, USBDEVFS_GET_SPEED, NULL);
> 
> This (further) breaks a bunch of the Travis jobs - I assume because libusb doesn't
> always have this symbol:
> 
>   ../hw/usb/host-libusb.c:954:32: error: ‘USBDEVFS_GET_SPEED’ undeclared (first use in this function)

It isn't libusb, it is the kernel (linux/usbdevice_fs.h).

/me checks git ...
Added in 4.13, so available for quite a while.
I guess that is the prehistoric ubuntu version travis has?

Given that we only need that workaround with rather new libusb versions
(which have libusb_wrap_sys_device() support) which most likely isn't
present in that old ubuntu version we can probably just do this:

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index 08604f787fdf..c25102f3aca1 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -942,7 +942,7 @@ static int usb_host_open(USBHostDevice *s, libusb_device *dev, int hostfd)
     usb_host_ep_update(s);
 
     libusb_speed = libusb_get_device_speed(dev);
-#ifdef CONFIG_LINUX
+#if LIBUSB_API_VERSION >= 0x01000107 && defined(CONFIG_LINUX)
     if (hostfd && libusb_speed == 0) {
         /*
          * Workaround libusb bug: libusb_get_device_speed() does not


