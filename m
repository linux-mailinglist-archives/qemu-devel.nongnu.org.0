Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E728722792F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 09:06:32 +0200 (CEST)
Received: from localhost ([::1]:58544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxmMC-0005bz-1f
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 03:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jxmL9-0004p2-C5
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 03:05:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57449
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jxmL7-00017C-Qb
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 03:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595315125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kXIABjJzir6vJLp4Jsf94FB0ty9gB3NwlhdUDzO5hxY=;
 b=HisOa32HZrCQYVEsIOrnXXzKLAgSKwFcOvIZa7Kzv+vbzUHET3SeOI/jwtmSaLh6AXmNMC
 IYXYc9LmJvd0HNwf59cjsZL6rDV+weU/kaEMPlV0xJIqfQdHWNJPC39Ye3pKJFha9iTNZk
 9U9HT3ykwjrwrYYGLApGIz3vKAODolk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-oWCFghNnOJaMR5_HUdlOpA-1; Tue, 21 Jul 2020 03:05:21 -0400
X-MC-Unique: oWCFghNnOJaMR5_HUdlOpA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFFE618C63C0;
 Tue, 21 Jul 2020 07:05:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE11B60BF1;
 Tue, 21 Jul 2020 07:05:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7B4FC111CA27; Tue, 21 Jul 2020 09:05:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: Intended purpose of virtio-rng's QOM link "rng"?
References: <87d04qfco3.fsf@dusky.pond.sub.org>
 <20200720112838-mutt-send-email-mst@kernel.org>
Date: Tue, 21 Jul 2020 09:05:15 +0200
In-Reply-To: <20200720112838-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Mon, 20 Jul 2020 11:56:32 -0400")
Message-ID: <87mu3tbb6c.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 01:46:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Mon, Jul 20, 2020 at 05:07:08PM +0200, Markus Armbruster wrote:
>> What is the intended purpose of object_property_set_link() in
>> 
>>     static void virtio_rng_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>>     {
>>         VirtIORngPCI *vrng = VIRTIO_RNG_PCI(vpci_dev);
>>         DeviceState *vdev = DEVICE(&vrng->vdev);
>> 
>>         if (!qdev_realize(vdev, BUS(&vpci_dev->bus), errp)) {
>>             return;
>>         }
>> 
>>         object_property_set_link(OBJECT(vrng), "rng", OBJECT(vrng->vdev.conf.rng),
>>                                  NULL);
>>     }
>> 
>> ?
>> 
>> I'm asking because the function *always* fails.  I believe it's been
>> failing for years.
>> 
>> Similar code in the CCW buddy.  Also virtio-crypto-pci and
>> virtio-crypto-ccw link "cryptodev".
>> 
>> I tried moving it before qdev_realize(), where it doesn't fail.  But
>> then *I* fail, namely at finding any effect in QOM.
>
> I suspect that's because there's already a link with that name
> created by virtio core. Is that right?

Looks like it, in virtio_rng_device_realize():

    if (vrng->conf.rng == NULL) {
        ... make up @default_backend ...
        object_property_set_link(OBJECT(dev), "rng", default_backend,
                                 &error_abort);
    }

The object_property_set_link actually sets vrng->vdev.conf.rng (but it
takes quite some digging to see that; MICAHI[*] at work).

For virtio-crypto, the link is vcrypto->vdev.conf.cryptodev.
virtio_crypto_pci_realize() first checks its already set:

    if (vcrypto->vdev.conf.cryptodev == NULL) {
        error_setg(errp, "'cryptodev' parameter expects a valid object");
        return;
    }

>> If it's really useless, I'll send a patch to drop it.

All four are useless; will send patches.

>> If it has a use, tell me more, so I can test my patch to move it.

Thanks!


[*] Make It Complicated And Hide It.


