Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508742262FD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 17:10:40 +0200 (CEST)
Received: from localhost ([::1]:53762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxXR9-0000rt-22
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 11:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jxXNv-00085j-Gs
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 11:07:19 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:38604
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jxXNt-0002IN-T3
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 11:07:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595257637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=+zugweuhuM2tST8MPnPp+NCc4GchPSJisId1KOV5NN8=;
 b=C/ajciAXSLuFaIpnkp45mMgIDOkFhocBwyNayg3eN3Z8N9QEDOtn/OYnpwiEJp/C3SY23A
 vbmWbZUwrL7lDY8LRTBRW0TWkjo1jhaVZixHvZ/APl3Ksp9DO58UMoFghXHDfTVhRD/2Pc
 O6ybHCa3HsAF85MH7R6tdJZXuPKmeW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-6yleU_kBOa2V8SgC-m5ZRw-1; Mon, 20 Jul 2020 11:07:13 -0400
X-MC-Unique: 6yleU_kBOa2V8SgC-m5ZRw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6702F800597;
 Mon, 20 Jul 2020 15:07:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BC035BAD5;
 Mon, 20 Jul 2020 15:07:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 13E691141C54; Mon, 20 Jul 2020 17:07:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Intended purpose of virtio-rng's QOM link "rng"?
Date: Mon, 20 Jul 2020 17:07:08 +0200
Message-ID: <87d04qfco3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 02:16:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

What is the intended purpose of object_property_set_link() in

    static void virtio_rng_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
    {
        VirtIORngPCI *vrng = VIRTIO_RNG_PCI(vpci_dev);
        DeviceState *vdev = DEVICE(&vrng->vdev);

        if (!qdev_realize(vdev, BUS(&vpci_dev->bus), errp)) {
            return;
        }

        object_property_set_link(OBJECT(vrng), "rng", OBJECT(vrng->vdev.conf.rng),
                                 NULL);
    }

?

I'm asking because the function *always* fails.  I believe it's been
failing for years.

Similar code in the CCW buddy.  Also virtio-crypto-pci and
virtio-crypto-ccw link "cryptodev".

I tried moving it before qdev_realize(), where it doesn't fail.  But
then *I* fail, namely at finding any effect in QOM.

If it's really useless, I'll send a patch to drop it.

If it has a use, tell me more, so I can test my patch to move it.


