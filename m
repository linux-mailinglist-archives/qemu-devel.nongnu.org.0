Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BC2199B2F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 18:17:33 +0200 (CEST)
Received: from localhost ([::1]:41358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJJa0-0000Bw-SD
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 12:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41625)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1jJJZ1-0008Cc-L9
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 12:16:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1jJJZ0-0006Ak-9n
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 12:16:31 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44078
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1jJJYz-00069a-TE
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 12:16:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585671388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GiXG3zhbYA1Fw/oC+f6t/9egqad7Lp/pTd/7to79jzU=;
 b=aw/dW20eiIgMSoyRrU9YIx+w+9+2appFaHJYli4ifzUJocpPZe9Pgf2xhNSjSfjVkSSoE6
 R0qEXe7b+z9VK2C95jo4sx+CuqXEqvsPnp9r5LMIgzOd6QoJiSF12E9FJAU/fTdY/BB/OK
 WGCEbN4MKYLJAYmYKLYFYaZFFwf9T3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-HX2Gd_GRMK-humOSRGNa7g-1; Tue, 31 Mar 2020 12:16:26 -0400
X-MC-Unique: HX2Gd_GRMK-humOSRGNa7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2B83107ACC7
 for <qemu-devel@nongnu.org>; Tue, 31 Mar 2020 16:16:25 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08A645D9C5;
 Tue, 31 Mar 2020 16:16:24 +0000 (UTC)
Message-ID: <7302c0b9f2327b9b61b4adb465f166e339e46ac1.camel@redhat.com>
Subject: Question about scsi device hotplug (e.g scsi-hd)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 31 Mar 2020 19:16:23 +0300
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

I recently investigated an interesting issue related to repeated scsi-hd hotplug/hotunplug.
The bugzilla for it is here:
https://bugzilla.redhat.com/show_bug.cgi?id=1812399

In nutshell the issue that I think that I found and I would like to ask your opinion on it,
since I don't have enough experience to be 100% sure that I didn't miss something  is this:

When a new device is hotplugged via monitor, the qdev_device_add first puts the device on
the bus where the user requested it to be, and then calls the device's .realize.

However for scsi bus, each time a new request is sent from the guest, the scsi adapter drivers
(e.g virtio-scsi) call scsi_device_find to find the LUN's driver to dispatch the request to,
and scsi_device_find will return the added device as soon as it is placed on the bus.

Thus between the point when the new device is placed on the bus and until the end of the .realize,
the device can be accessed by the guest when it is not yet realized or partially realized as
happens in the bugreport.

What do you think about it?

Best regards,
	Maxim Levitsky


