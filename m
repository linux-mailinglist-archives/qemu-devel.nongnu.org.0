Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6F163D018
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 09:04:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0I3n-0002U9-JV; Wed, 30 Nov 2022 03:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0I3d-0002Tx-OG
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 03:03:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0I3b-0003Fa-Fu
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 03:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669795381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QV0ji9d0Qzur4i4sDCJhDmzaNnLpRPUbI2M2LxN2syM=;
 b=WhK1Z2n4Zk5MNmFuBAHBup1Dp6C7YTaA4BS7aA8zk6LqsFQ84r3uqYpNoMobrXgcPY+/6d
 qoZVd3cyr2S5LCfW3ohhx0ki2dIFkrKz03hqTgRW4MaQSsqKpjl3s1/UNFtO29aisSd7Mg
 xKtgSGdHckJ6r2qeiC/hS6X89RC3oS8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-3AeFbjQWOi6Sn4xvMMpUuA-1; Wed, 30 Nov 2022 03:03:00 -0500
X-MC-Unique: 3AeFbjQWOi6Sn4xvMMpUuA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B37A21C068CA
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 08:02:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BB47492B04;
 Wed, 30 Nov 2022 08:02:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4C65221E6921; Wed, 30 Nov 2022 09:02:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Monitor commands related to display server passwords
Date: Wed, 30 Nov 2022 09:02:56 +0100
Message-ID: <87mt88oonj.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

We have a couple of password-related commands, and I'm not sure about
which ones should be used.  In order of appearance:

* HMP change vnc

  Change a VNC server password.  Unlike set_password below, there's no
  way to select a display other than the first.

  Note: if change's second argument isn't "vnc", w're changing removable
  media.  If you call your block device "vnc", you cannot change its
  media.  Hilarious.

  Password prompting (with hidden user input) since commit 7084851534
  "VNC password authentication, by Daniel P. Berrange." (v0.9.1,
  2007-08-25).

  Password argument since commit 2569da0cb6 "Accept password as an
  argument to 'change vnc password' monitor command (Chris Webb)"
  (v0.10.0, 2008-12-10).

  Nowadays, this wraps around QMP change-vnc-password, discussed below.

* HMP and QMP set_password, expire_password

  Change a VNC or Spice server password.  For Spice, can optionally fail
  when connections exist, or disconnect them.

  HMP commands wrap around the respective QMP command, as they should.

  HMP set_password does not support password prompting like "change vnc"
  does.

  Commands are present even when both CONFIG_VNC and CONFIG_SPICE are
  off.  Attempts to use them are rejected manually.  Defeats
  introspection.

  Since commit 7572150c18 "vnc/spice: add set_passwd monitor command."
  (v0.14.0, 2010-12-09)

  Support for VNC displays other than the first since commit 675fd3c96b
  "qapi/monitor: allow VNC display id in set/expire_password" (v7.0.0,
  2022-03-02).

* QMP change-vnc-password

  Can only target the first VNC display, unlike set_password.

  Command present only with CONFIG_VNC.

  Since commit 270b243f91 "qapi: Introduce change-vnc-password" (v1.1,
  2012-01-18).

Do we really need / want both set_password and change-vnc-password in
QMP?

On the one hand, set_password feels outdated from a QAPI point of view:
it violates the naming rules, and it defeats introspection.  On the
other hand, it's more powerful.

Do we really need / want both set_password and "change vnc" in HMP?
set_password is more powerful, but only "change vnc" supports password
prompting.

Getting rid of "change vnc" would fix the "cannot change media for block
device named 'vnc'" wart.


Related: QCryptoSecret objects.

commit ac1d88784907c9603b3849b2c3043259f75ed2a5
Author: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Date:   Wed Oct 14 09:58:38 2015 +0100

    crypto: add QCryptoSecret object class for password/key handling
=20=20=20=20
    Introduce a new QCryptoSecret object class which will be used
    for providing passwords and keys to other objects which need
    sensitive credentials.
=20=20=20=20
    The new object can provide secret values directly as properties,
    or indirectly via a file. The latter includes support for file
    descriptor passing syntax on UNIX platforms. Ordinarily passing
    secret values directly as properties is insecure, since they
    are visible in process listings, or in log files showing the
    CLI args / QMP commands. It is possible to use AES-256-CBC to
    encrypt the secret values though, in which case all that is
    visible is the ciphertext.  For ad hoc developer testing though,
    it is fine to provide the secrets directly without encryption
    so this is not explicitly forbidden.
=20=20=20=20
    The anticipated scenario is that libvirtd will create a random
    master key per QEMU instance (eg /var/run/libvirt/qemu/$VMNAME.key)
    and will use that key to encrypt all passwords it provides to
    QEMU via '-object secret,....'.  This avoids the need for libvirt
    (or other mgmt apps) to worry about file descriptor passing.
=20=20=20=20
    It also makes life easier for people who are scripting the
    management of QEMU, for whom FD passing is significantly more
    complex.
=20=20=20=20
    Providing data inline (insecure, only for ad hoc dev testing)
=20=20=20=20
      $QEMU -object secret,id=3Dsec0,data=3Dletmein
=20=20=20=20
    Providing data indirectly in raw format
=20=20=20=20
      printf "letmein" > mypasswd.txt
      $QEMU -object secret,id=3Dsec0,file=3Dmypasswd.txt
=20=20=20=20
    Providing data indirectly in base64 format
=20=20=20=20
      $QEMU -object secret,id=3Dsec0,file=3Dmykey.b64,format=3Dbase64
=20=20=20=20
    Providing data with encryption
=20=20=20=20
      $QEMU -object secret,id=3Dmaster0,file=3Dmykey.b64,format=3Dbase64 \
            -object secret,id=3Dsec0,data=3D[base64 ciphertext],\
                       keyid=3Dmaster0,iv=3D[base64 IV],format=3Dbase64
=20=20=20=20
    Note that 'format' here refers to the format of the ciphertext
    data. The decrypted data must always be in raw byte format.
=20=20=20=20
    More examples are shown in the updated docs.
=20=20=20=20
    Reviewed-by: Eric Blake <eblake@redhat.com>
    Signed-off-by: Daniel P. Berrange <berrange@redhat.com>

Currently used by various block backends and the tls-creds-x509 object.

Would it make sense with display servers, too?


