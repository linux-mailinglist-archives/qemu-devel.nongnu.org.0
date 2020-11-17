Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEC12B686F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 16:16:08 +0100 (CET)
Received: from localhost ([::1]:52186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf2iF-0001Jg-7f
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 10:16:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kf2h7-0000pb-Tj
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:14:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kf2h0-0006li-Ob
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605626088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6SPwhFAz79Lrdw36vErQ4OtlEc/ZekepLOP+VMRQ9r0=;
 b=IInYFi125rA6p1YQirTHPWfkxDP8dnBDgccdtUUyI1PZMneyk6LCbsR7ZMiaIkGOITmZqR
 bdVRk3u8eVNGzuDsOgIT/+P1noLHHhtQpl7Jf+A2dj8IpTzpGgW64ho4Jz1prbL6jBeepH
 MmIjAVHiDgTLCezH1O11ulIg7xVOZ/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-zxY2Q1SAOxy56OTw5sVpVw-1; Tue, 17 Nov 2020 10:14:47 -0500
X-MC-Unique: zxY2Q1SAOxy56OTw5sVpVw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 486B680364D
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 15:14:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E95A119D6C;
 Tue, 17 Nov 2020 15:14:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 61F2B11358BA; Tue, 17 Nov 2020 16:14:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Use of g_return_if_fail(), g_return_val_if_fail()
Date: Tue, 17 Nov 2020 16:14:38 +0100
Message-ID: <87r1os6mn5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

g_return_if_fail(), g_return_val_if_fail() are for programming errors:

    If expr evaluates to FALSE, the current function should be
    considered to have undefined behaviour (a programmer error). The
    only correct solution to such an error is to change the module that
    is calling the current function, so that it avoids this incorrect
    call.

Unlike assert(), they continue regardless, undefined behavior be damned:

    To make this undefined behaviour visible, if expr evaluates to
    FALSE, the result is usually that a critical message is logged and
    the current function returns.

Except when you ask for abort():

    To debug failure of a g_return_if_fail() check, run the code under a
    debugger with G_DEBUG=3Dfatal-criticals or G_DEBUG=3Dfatal-warnings
    defined in the environment.

Like assert(), they can be compiled out:

    If G_DISABLE_CHECKS is defined then the check is not performed. You
    should therefore not depend on any side effects of expr .

There are just three uses outside contrib/:

* backends/dbus-vmstate.c:232:        g_return_val_if_fail(bytes_read =3D=
=3D len, -1);

  Marc-Andr=C3=A9, why is bytes_read !=3D len a programming error?

  Why is returning safe?

* block/export/vhost-user-blk-server.c:270:    g_return_val_if_fail(len <=
=3D sizeof(struct virtio_blk_config), -1);

  Stefan, why is len > sizeof(struct virtio_blk_config) a programming
  error?

  Why is returning safe?

* hw/display/vhost-user-gpu.c:335:    g_return_if_fail(msg !=3D NULL);

  This one is obviously dead code: g_malloc() cannot fail.

  If it could, I do doubt returning after reading a partial message
  would be safe.


