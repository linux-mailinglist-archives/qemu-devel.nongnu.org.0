Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F07619CC4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:14:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzJI-0006ze-MY; Fri, 04 Nov 2022 12:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oqzJ3-0006ll-CE
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:12:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oqzJ1-00007U-RJ
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667578350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cmOVibxmTAn9wWvCNpZjrcHMCBtOJ7buNn+r6f/S4bg=;
 b=MdLDti3OlaIl6CZ5PFfNB1sOupl2o+WsUfbPa11rFN8Mv1zrto86yjYe3xzQp11JECGl8F
 nCdd1B4L6wWxmJWRTslGEtY7XmXFmmUJWzRe0Is5PH43oRIJ5xNrSfLkKkAb5vX1xXFiTE
 p8oZVDHfltl5b7abLvMThx/VtT6hrBs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-Qz8Ea9rkOsm6lCsGfIiqdA-1; Fri, 04 Nov 2022 12:12:29 -0400
X-MC-Unique: Qz8Ea9rkOsm6lCsGfIiqdA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B659E381496C
 for <qemu-devel@nongnu.org>; Fri,  4 Nov 2022 16:12:28 +0000 (UTC)
Received: from [172.30.42.193] (unknown [10.22.17.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89F3D4EA4C;
 Fri,  4 Nov 2022 16:12:28 +0000 (UTC)
Subject: [PULL 0/1] VFIO fix for v7.2-rc0
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com
Date: Fri, 04 Nov 2022 10:12:27 -0600
Message-ID: <166757797349.2504527.17538714015825495328.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit ece5f8374d0416a339f0c0a9399faa2c42d4ad6f:

  Merge tag 'linux-user-for-7.2-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-11-03 10:55:05 -0400)

are available in the Git repository at:

  https://gitlab.com/alex.williamson/qemu.git tags/vfio-fixes-v7.2-rc0.0

for you to fetch changes up to 2461e752199ca457bf0973b6c8a77dc30585809c:

  vfio/migration: Fix wrong enum usage (2022-11-03 15:57:31 -0600)

----------------------------------------------------------------
VFIO fixes for v7.2-rc0

 * Correct initial migration device state using correct v1
   protocol enum (Avihai Horon)

----------------------------------------------------------------
Avihai Horon (1):
      vfio/migration: Fix wrong enum usage

 hw/vfio/migration.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


