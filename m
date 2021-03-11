Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA033371A4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:45:55 +0100 (CET)
Received: from localhost ([::1]:33526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJlK-0006i8-I5
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:45:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKJjR-0005kZ-R0
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:43:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKJjQ-0008SR-5e
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:43:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615463035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+neQnOzXanYRxmMccgA0a0/TL9WPtz7bFXR5BGNmLMQ=;
 b=jI/gC6GacA0nXnQeTuPrbfc6mZGCuOOlCxpHoLhJJmvYU/bKsed3fZV+gyHh9kgAQVkxjm
 2edGP8sTylN5AKZ/plNP3KJ2Z2vXrg+mf4F68ULkQiRScpZONUONP1klEqdnBN2Lcf7M/i
 ITM1x4xpQOUNzqOxLDeMPCs2sGzyEWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-nMzLdTMIOgCxzUezeQbmLw-1; Thu, 11 Mar 2021 06:43:53 -0500
X-MC-Unique: nMzLdTMIOgCxzUezeQbmLw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86D0881746C
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 11:43:52 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-85.ams2.redhat.com
 [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B318C60853;
 Thu, 11 Mar 2021 11:43:44 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] ui: add support for 'secret' object to provide
 VNC/SPICE passwords
Date: Thu, 11 Mar 2021 11:43:40 +0000
Message-Id: <20210311114343.439820-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: libvir-list@redhat.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes a long standing limitation of the VNC/SPICE code which was=0D
unable to securely accept passswords on the CLI, instead requiring use=0D
of separate monitor commands after startup.=0D
=0D
In v2:=0D
=0D
 - Dropped patch removing ACL commands, as it will move to a bigger=0D
   deprecation cleanup series=0D
 - Rebased and resolved conflicts=0D
=0D
Daniel P. Berrang=C3=A9 (3):=0D
  ui: introduce "password-secret" option for VNC servers=0D
  ui: introduce "password-secret" option for SPICE server=0D
  ui: deprecate "password" option for SPICE server=0D
=0D
 docs/system/deprecated.rst |  8 ++++++++=0D
 qemu-options.hx            | 18 ++++++++++++++++--=0D
 ui/spice-core.c            | 32 ++++++++++++++++++++++++++++++--=0D
 ui/vnc.c                   | 23 ++++++++++++++++++++++-=0D
 4 files changed, 76 insertions(+), 5 deletions(-)=0D
=0D
--=20=0D
2.29.2=0D
=0D


