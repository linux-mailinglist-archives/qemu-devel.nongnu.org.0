Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9351535A17B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 16:50:32 +0200 (CEST)
Received: from localhost ([::1]:57134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUsSt-00036G-KV
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 10:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lUsRe-0002BN-1s
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:49:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lUsRc-0002rk-DI
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617979751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=guBDhNAHRUy0YvcSWv5jq/4Hq5B9PECiLJXJrC/TUDg=;
 b=YqX3XfxFylijN1LcnFSGfR8j1gXciFeHUV1k3bQe8fKerDGeo77+Yd1dI9mipHIu9x2DRp
 n5IJ/NaP5IKF0hotFWaQemB/ZoGsJ5M33Afro02PwCypnJxflxaE6pCnF25mTXyeNLyIqI
 FjecSILqC/JDNuv8CqEoWrD++vPL2JU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-hXtkl_PwM_y0txN-sshGkg-1; Fri, 09 Apr 2021 10:49:07 -0400
X-MC-Unique: hXtkl_PwM_y0txN-sshGkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77DD283DD21;
 Fri,  9 Apr 2021 14:49:06 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-112.ams2.redhat.com
 [10.36.113.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7377C5C1D5;
 Fri,  9 Apr 2021 14:49:05 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL for-6.0 0/1] s390x fix
Date: Fri,  9 Apr 2021 16:48:57 +0200
Message-Id: <20210409144858.278553-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d8724020dd13c88a72fc391a6a2cf63abbd3dcca:

  Merge remote-tracking branch 'remotes/dgilbert/tags/pull-migration-20210407b' into staging (2021-04-08 14:00:57 +0100)

are available in the Git repository at:

  https://gitlab.com/cohuck/qemu.git tags/s390x-20210409

for you to fetch changes up to d895d25ae2bb8519aa715dd2a97f09d4a66b189d:

  s390x: css: report errors from ccw_dstream_read/write (2021-04-09 10:52:13 +0200)

----------------------------------------------------------------
One s390x fix:
- correctly handle the case where the guest ccw payload points to
  invalid memory areas

----------------------------------------------------------------

Pierre Morel (1):
  s390x: css: report errors from ccw_dstream_read/write

 hw/char/terminal3270.c | 11 +++++--
 hw/s390x/3270-ccw.c    |  5 +++-
 hw/s390x/css.c         | 14 +++++----
 hw/s390x/virtio-ccw.c  | 66 ++++++++++++++++++++++++++++++------------
 4 files changed, 69 insertions(+), 27 deletions(-)

-- 
2.26.3


