Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DDB35E2BD
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 17:24:57 +0200 (CEST)
Received: from localhost ([::1]:43610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWKuO-0005Ae-AI
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 11:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWKsa-0003j9-3V
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:23:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWKsX-0005Uf-D9
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:23:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618327376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7jYbUUx1yaFkvSogqtSYNBOkZoCGUp8B9J4HGSzd598=;
 b=bovEck8M79tCrYifPhrz17IpmCX6k0XyB7K6zvq+v06HMHmrv4lUOXGYCF+SQCjK5cUphl
 GB1SFzXUUO4eo7hRdI0rcKbtwW+f7JLEDX1zLI+8t46220dGPHDYjXBip8zcGff/K4lHZ/
 etjTN1KSHTYafTSGGXpuTVI3zQr0/aA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496--uNmXSidNJO8ADhsmOf5uw-1; Tue, 13 Apr 2021 11:22:54 -0400
X-MC-Unique: -uNmXSidNJO8ADhsmOf5uw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 112746D587;
 Tue, 13 Apr 2021 15:22:53 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-31.ams2.redhat.com
 [10.36.115.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE27360C04;
 Tue, 13 Apr 2021 15:22:48 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	antonkuchin@yandex-team.ru
Subject: [PULL 0/1] virtiofs queue for 6.0
Date: Tue, 13 Apr 2021 16:22:45 +0100
Message-Id: <20210413152246.72950-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit dce628a97fde2594f99d738883a157f05aa0a14f:

  Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.0-20210412' into staging (2021-04-13 13:05:07 +0100)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20210413

for you to fetch changes up to ace66791cd15657320b11b1a421afc055f28efca:

  vhost-user-fs: fix features handling (2021-04-13 16:13:41 +0100)

----------------------------------------------------------------
virtiofs: Fix feature negotiation (for 6.0)

A 6.0 fix for feature negotiation on vhost-user.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Anton Kuchin (1):
      vhost-user-fs: fix features handling

 hw/virtio/vhost-user-fs.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)


