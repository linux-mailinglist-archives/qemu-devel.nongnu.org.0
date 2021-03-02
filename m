Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8647832A8A7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:59:18 +0100 (CET)
Received: from localhost ([::1]:55952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9Ij-000390-Gg
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:59:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lH9FA-00080I-FJ
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:55:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lH9F8-0007IE-67
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614707733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FhfRWNEpKhSAGBjXh5WB+HlOXyUhuS5v/4Quh2bCIvk=;
 b=C3+4B0cxoTP6UL+K/ZSkvCIsXPbIGRMojmf/FOOrBuxGMJ4p29cccUP4G02SIsBmcOkzg7
 ctYfcd+ADoQuMNrGz7aBuIH+U4ZLoqfjo1LpbXXqeK8vSyN64B/ou6QQa8LRlAmjH5Nt0Q
 RUCuBx+qj/jtqrAk/sFYZM6hq2XZAHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-Ba_6jhg3PiWtjPViCZTb1Q-1; Tue, 02 Mar 2021 12:55:31 -0500
X-MC-Unique: Ba_6jhg3PiWtjPViCZTb1Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C411F1009615;
 Tue,  2 Mar 2021 17:55:30 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-132.ams2.redhat.com
 [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE95F61F20;
 Tue,  2 Mar 2021 17:55:25 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] audio: make audiodev introspectable by mgmt apps
Date: Tue,  2 Mar 2021 17:55:21 +0000
Message-Id: <20210302175524.1290840-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Audiodev QAPI type is not introspectable via query-qmp-schema as=0D
nothing in QEMU uses it. -audiodev is not introspectable via=0D
query-command-line-options because it avoided legacy QemuOpts=0D
=0D
Even once that is fixed, the introspection lies about what is=0D
actually possible because nearly all the audio backends are compile=0D
time conditional, but the QAPI schema is fixed.=0D
=0D
The last patch is a trivial addition that aided my debugging while=0D
investigating the problems and not directly related/dependant.=0D
=0D
Daniel P. Berrang=C3=A9 (3):=0D
  qapi, audio: add query-audiodev command=0D
  qapi, audio: respect build time conditions in audio schema=0D
  qapi: provide a friendly string representation of QAPI classes=0D
=0D
 audio/audio.c          | 35 ++++++++++++++++++++++++++=0D
 audio/audio_legacy.c   | 41 +++++++++++++++++++++++++++++-=0D
 audio/audio_template.h | 16 ++++++++++++=0D
 qapi/audio.json        | 57 ++++++++++++++++++++++++++++++++++--------=0D
 scripts/qapi/schema.py |  3 +++=0D
 5 files changed, 141 insertions(+), 11 deletions(-)=0D
=0D
--=20=0D
2.29.2=0D
=0D


