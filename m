Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC8737A708
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 14:47:32 +0200 (CEST)
Received: from localhost ([::1]:37506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgRnP-00058J-RE
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 08:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgRlR-0003GQ-MW
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:45:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgRlO-0007e8-4j
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:45:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620737124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=GDNLfqgOD6nf7S60kE8Squ7rOSjvvalXtCkUoK0HsEs=;
 b=OKdv3mSz0gkO/mpJBPYDXQDkJr8RX3hPv4IseHajNt7JLilUEfU8XbxKKtQXlek+nCreRC
 tBtjyWBf+soO2NFGhYW8ZcEDTihVdd+sMkXUnIBVlvqTjzal4EfzpSsAxEaYLgIOwoPFzl
 QXX46Qj0E9SIQeQ4ZHQ3iz8aQ/w8WKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-z58O_oetMF6_YlmjSLA2Ug-1; Tue, 11 May 2021 08:45:20 -0400
X-MC-Unique: z58O_oetMF6_YlmjSLA2Ug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA2375B364;
 Tue, 11 May 2021 12:45:18 +0000 (UTC)
Received: from localhost (ovpn-112-6.ams2.redhat.com [10.36.112.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0517C54351;
 Tue, 11 May 2021 12:45:14 +0000 (UTC)
Date: Tue, 11 May 2021 13:45:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sebastien Boeuf <sebastien.boeuf@intel.com>
Subject: vhost-user reconnection and crash recovery
Message-ID: <YJp8WbMaf3Y8/F7l@stefanha-x1.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9aaZjKXeq39h++GG"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--9aaZjKXeq39h++GG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sebastien,
On #virtio-fs IRC you asked:

 I have a vhost-user question regarding disconnection/reconnection. How
 should this be handled? Let's say the vhost-user backend disconnects,
 and reconnects later on, does QEMU reset the virtio device by notifying
 the guest? Or does it simply reconnects to the backend without letting
 the guest know about what happened?

The vhost-user protocol does not have a generic reconnection solution.
Reconnection is handled on a case-by-case basis because device-specific
and implementation-specific state is involved.

The vhost-user-fs-pci device in QEMU has not been tested with
reconnection as far as I know.

The ideal reconnection behavior is to resume the device from its
previous state without disrupting the guest. Device state must survive
reconnection in order for this to work. Neither QEMU virtiofsd nor
virtiofsd-rs implement this today.

virtiofs has a lot of state, making it particularly difficult to support
either DEVICE_NEEDS_RESET or transparent vhost-user reconnection. We
have discussed virtiofs crash recovery on the bi-weekly virtiofs call
(https://etherpad.opendev.org/p/virtiofs-external-meeting). If you want
to work on this then joining the call would be a good starting point to
coordinate with others.

One approach for transparent crash recovery is for virtiofsd to keep its
state in tmpfs (e.g. inode/fd mappings) and open fds shared with a
clone(2) process via CLONE_FILES. This way the virtiofsd process can
terminate but its state persists in memory thanks to its clone process.
The clone can then be used to launch the new virtiofsd process from the
old state. This would allow the device to resume transparently with QEMU
only reconnecting the vhost-user UNIX domain socket. This is an idea
that we discussed in the bi-weekly virtiofs call.

You mentioned device reset. VIRTIO 1.1 has the Device Status Field
DEVICE_NEEDS_RESET flat that the device can use to tell the driver that
a reset is necessary. This feature is present in the specification but
not implemented in the Linux guest drivers. Again the reason is that
handling it requires driver-specific logic for restoring state after
reset...otherwise the device reset would be visible to userspace.

Stefan

--9aaZjKXeq39h++GG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCafFkACgkQnKSrs4Gr
c8g+GQf5AblITnCMGNDRgZvNrDQbCXjzNGRCVFJvebOMl/Ssqosn0IuJncHCEPe1
UOOzT3M7uMALEIkBG3UOzQOpq5B1i1d6stkGPEaeQuRT408GYi2RuznqKhkGhV9R
B7ZCylqGY0tQ4s69FCYKxty8G+c9MDPQ6nFyT8MODqcV3tMqT5qc/oB9da5CjKJB
320mJ0WjqjK3m8zYHhmKzfCAZeZSQzpHqmyOhVrqJ6lIMfXN46K6zmB7OFCHK+/O
mSzLvQZBVusn3eDUw8Ag5+Ul0J1K5uCOzQQNB7zvO9aZQNeqDIvToRj4iGTI8TkP
nA5RokQvQ/09PAvwU8q5IYPPIxDfOg==
=4ZGn
-----END PGP SIGNATURE-----

--9aaZjKXeq39h++GG--


