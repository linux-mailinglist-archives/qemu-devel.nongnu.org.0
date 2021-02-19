Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5103731FEF2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 19:48:20 +0100 (CET)
Received: from localhost ([::1]:42604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDAp8-0008Ob-Pq
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 13:48:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lDAn9-000748-P5
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:46:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lDAn6-0007dF-9r
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613760369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gpO5sZV2dTD7IJxz7FwMTFtjbvi46CccfGCjvtjkRWU=;
 b=cwE43FRRKdQZOzKzTeydmg1XvzQsYRY1gcnsQcW3Ht6ZSLnuBC06CZOsC4+Flp5vwKEZgu
 E0ab3oMOM1Q1rm/ODdH5yUybGD5n5cDJnzLJPiqIuZvXgiRLU9EX/KVCSbUbclpnrjdmJs
 TD7OIJ87JsEc9oAfEKsrupYXVUvuE/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-T3qaU9ZiPR2WCK44hVgBtQ-1; Fri, 19 Feb 2021 13:46:07 -0500
X-MC-Unique: T3qaU9ZiPR2WCK44hVgBtQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62D50804023
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 18:46:06 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-33.ams2.redhat.com
 [10.36.112.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5981419D9B;
 Fri, 19 Feb 2021 18:45:57 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] ui: add support for 'secret' object to provide VNC/SPICE
 passwords
Date: Fri, 19 Feb 2021 18:45:52 +0000
Message-Id: <20210219184556.154972-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes a long standing limitation of the VNC/SPICE code which was=0D
unable to securely accept passswords on the CLI, instead requiring use=0D
of separate monitor commands after startup.=0D
=0D
This takes the opportunity to also remove previously deprecated ACL=0D
functionality from VNC.=0D
=0D
Daniel P. Berrang=C3=A9 (4):=0D
  ui: introduce "password-secret" option for VNC servers=0D
  ui: introduce "password-secret" option for SPICE server=0D
  ui: deprecate "password" option for SPICE server=0D
  ui, monitor: remove deprecated VNC ACL option and HMP commands=0D
=0D
 docs/system/deprecated.rst       |  24 ++--=0D
 docs/system/removed-features.rst |  13 +++=0D
 hmp-commands.hx                  |  76 -------------=0D
 monitor/misc.c                   | 187 -------------------------------=0D
 qemu-options.hx                  |  17 ++-=0D
 ui/spice-core.c                  |  32 +++++-=0D
 ui/vnc.c                         |  61 ++++------=0D
 7 files changed, 88 insertions(+), 322 deletions(-)=0D
=0D
--=20=0D
2.29.2=0D
=0D


