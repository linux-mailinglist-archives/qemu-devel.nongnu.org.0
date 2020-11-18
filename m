Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257012B7A15
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:12:38 +0100 (CET)
Received: from localhost ([::1]:55540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJW1-0006Tr-79
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfJAV-0002rD-1d
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:50:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfJAS-0007Ra-Lo
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:50:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605689419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6jctG9VVZBChrUadXyHEIN4a5fZjuSL5KJtp2I43fjM=;
 b=QtGkA7fSoUzusRn6Avz7Zyoeq6APAbiYrz16tCZC1/PHET/hBbYlI3zum/xtIRuHJbmb13
 KlMN/f+y/0ZSax/jH0suFzHPoSgnKjyiPUO3MFAUlerzN/fqi56oDFVb/pNi5dmJpZ5PG/
 vyrfxMaeGtqTdf0P6fFqVnrGDPIQ8jY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-n-Mw1WB4PvS5gSRKpTIyKQ-1; Wed, 18 Nov 2020 03:50:17 -0500
X-MC-Unique: n-Mw1WB4PvS5gSRKpTIyKQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70CB8803652;
 Wed, 18 Nov 2020 08:50:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E68A51512;
 Wed, 18 Nov 2020 08:50:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 89D5011358BA; Wed, 18 Nov 2020 09:50:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Should bus-less devices default to .user_creatable = false? (was:
 [PATCH 13/13] bcm2835_cprman: put some peripherals of bcm2835 cprman into
 the 'misc' category)
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-14-ganqixin@huawei.com>
 <c2ca2185-4253-da71-eab4-f96b29067c96@amsat.org>
 <882df4ee-948c-7e00-d951-9b14ea40b2df@redhat.com>
 <877dqldyoh.fsf@dusky.pond.sub.org>
Date: Wed, 18 Nov 2020 09:50:14 +0100
In-Reply-To: <877dqldyoh.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Mon, 16 Nov 2020 18:00:30 +0100")
Message-ID: <875z63oxq1.fsf_-_@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Gan Qixin <ganqixin@huawei.com>,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

[...]
> qdev_device_add() looks like a bus-less device is usable if the machine
> provides a hotplug handler for it.  Commit 03fcbd9dc5 "qdev: Check for
> the availability of a hotplug controller before adding a device" seems
> to be pertinent.

Nope.  A hotplug handler is only required for hot plug (d'oh!), not for
cold plug.  

I wonder whether bus-less devices should default to .user_creatable =
false like sysbus devices, and for the same reasons.

To actually *do* something, a physical device requires some connection
to the rest of the world.  Same for a virtual device (at least the ones
that model physical devices).

sysbus_device_class_init():

    /*
     * device_add plugs devices into a suitable bus.  For "real" buses,
     * that actually connects the device.  For sysbus, the connections
     * need to be made separately, and device_add can't do that.  The
     * device would be left unconnected, and will probably not work
     *
     * However, a few machines can handle device_add/-device with
     * a few specific sysbus devices. In those cases, the device
     * subclass needs to override it and set user_creatable=true.
     */
    k->user_creatable = false;

The reasoning applies to bus-less devices just as well, doesn't it?

[...]


