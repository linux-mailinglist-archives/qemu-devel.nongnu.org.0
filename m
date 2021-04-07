Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625E2356DB0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 15:45:55 +0200 (CEST)
Received: from localhost ([::1]:48434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU8VG-0000xj-Fx
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 09:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lU8Ti-0000Tg-4i
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:44:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lU8Tg-0002KM-BZ
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617803054;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type; bh=zK30SnGpexdwQyfDW6OtHOT05hUXqowyScMk/KfHKl8=;
 b=CJylzeWI7ooNwZ7CKTdeDpQy4yE2n3YiYgYqp+rtcJCCaDnR3N7/hMgOjVXgfoILGjUpgk
 wzod2m2JgeEk34cwfMgiD8PNfttudK068gFiW7dVqd4OSE87NQ+SUsLe64Tuk2y3nXNTuY
 vuZIyzTkfkjvZ7TerfPQEGigoswmmuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-5p3OoLY_OcetJAPXoe0a8g-1; Wed, 07 Apr 2021 09:44:05 -0400
X-MC-Unique: 5p3OoLY_OcetJAPXoe0a8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E05CFE99CB
 for <qemu-devel@nongnu.org>; Wed,  7 Apr 2021 13:44:04 +0000 (UTC)
Received: from redhat.com (ovpn-115-28.ams2.redhat.com [10.36.115.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96BDA19C46;
 Wed,  7 Apr 2021 13:44:03 +0000 (UTC)
Date: Wed, 7 Apr 2021 14:44:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: QMP introspecting device props common to a bus type
Message-ID: <YG23ILea4H36TllU@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When introspecting properties for devices, libvirt issues a sequence of
QMP  'device-list-properties' commands, one for each device type we
need info for.  The result of this command tells us about all properties
possible on that specific device, which is generally just fine.

Every now and then though, there are properties that are inherited from
/ defined by the parent class, usually props that are common to all
devices attached to a given bus type.

The current case in point is the "acpi-index" property that was added to
the "PCI" bus type, that is a parent for any type that is a PCI dev.

Generally when libvirt adds support for a property, it will enable it
across all devices that can support the property. So we're enabling use
of "acpi-index" across all PCI devices.

The question thus becomes how should we probe for existence of the
"acpi-index" property. The qemu-system-x86_64 emulator has somewhere
around 150 user creatable PCI devices according to "-device help".

The existance of a class hierarchy is explicitly not exposed in QMP
because we consider that an internal impl detail, so we can't just
query "acpi-index" on the "PCI" parent type. 

We certainly don't want to issue 'device-list-properties' over and
over for all 147 devices.

If we just pick one device type, say virtio-blk-pci, and query that
for "acpi-index", then our code is fragile because anyone can make
a QEMU build that compiles-out a specific device. This is fairly
unlikely for virtio devices, but never say never.

For PCI, i'm tending towards probing for the "acpi-index" property on
both "pci-bridge" and "pcie-root-port", as it seems unlikely that both
of those will be compiled out of QEMU while still retaining PCI support.

I'm wondering if QEMU maintainers have a view on "best practice" to
probe for device props that are common to specific bus types ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


