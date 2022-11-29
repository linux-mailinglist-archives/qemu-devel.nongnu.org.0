Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA03F63C33B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 15:56:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0216-00040c-MP; Tue, 29 Nov 2022 09:55:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p020y-0003z0-Vn
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 09:55:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p020w-0003ls-Ds
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 09:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669733712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=f0H8wfWO5nJiNxd505VIY4Ee0qYHrLq/zcGtC/1OMtw=;
 b=BSTgZ8mLuFmuG/YWFjYiF9GkBgRyMofyJm4eaZaw9BFEJthf22VyvgtHSJPuYfUEP1IYOi
 3oILlkhxyOBsYOD0+zGx2KyXFCmOWZj7t5FIXYjNlD9DPsxS1ikB9xKRPXhidER0mFkHTE
 p31tQWmDjpbyANIWXFO3VllvfLXWMgQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-YAbAGSfaPp-i2kdyuTq_RQ-1; Tue, 29 Nov 2022 09:55:11 -0500
X-MC-Unique: YAbAGSfaPp-i2kdyuTq_RQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A6353810D53
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 14:55:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B02C40C2140;
 Tue, 29 Nov 2022 14:55:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EC58E21E6921; Tue, 29 Nov 2022 15:54:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Who / what uses QMP command add_client?
Date: Tue, 29 Nov 2022 15:54:56 +0100
Message-ID: <878rjtretb.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

QMP command add_client's schema:

    ##
    # @add_client:
    #
    # Allow client connections for VNC, Spice and socket based
    # character devices to be passed in to QEMU via SCM_RIGHTS.
    #
    # @protocol: protocol name. Valid names are "vnc", "spice", "@dbus-disp=
lay" or
    #            the name of a character device (eg. from -chardev id=3DXXX=
X)
    #
    # @fdname: file descriptor name previously passed via 'getfd' command
    #
    # @skipauth: whether to skip authentication. Only applies
    #            to "vnc" and "spice" protocols
    #
    # @tls: whether to perform TLS. Only applies to the "spice"
    #       protocol
    #
    # Returns: nothing on success.
    #
    # Since: 0.14
    #
    # Example:
    #
    # -> { "execute": "add_client", "arguments": { "protocol": "vnc",
    #                                              "fdname": "myclient" } }
    # <- { "return": {} }
    #
    ##
    { 'command': 'add_client',
      'data': { 'protocol': 'str', 'fdname': 'str', '*skipauth': 'bool',
                '*tls': 'bool' } }

Spot the design flaw!

It's overloaded @protocol.  Two issues.

One, character device IDs "vnc", "spice", "@dbus-display" don't work
here.  If we ever add another protocol, we make another device ID not
work.  Perhaps this is why Marc-Andr=C3=A9 chose "@dbus-display", which
otherwise looks like a typo :)

Two, introspection can't tell us what protocols are supported.

As far as I can tell, libvirt does not use this with character devices.
It does use the other three protocols.

Are there any known uses with character devices?

If not, any ideas why one would want to use the command with character
devices?


