Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555E6587D4C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:42:05 +0200 (CEST)
Received: from localhost ([::1]:53468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIs9s-0002Xv-Do
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIs64-0003Wx-Ct
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:38:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIs62-0002a9-6g
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:38:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659447485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rIFiVb2GfidmNe4ePYB4kRWyvKdg6CUmBn9H5PDDUus=;
 b=SM+9cN3dIdv57usHWSfUN/wM9DHxpy66mGonIgw5SDGQS1ATICWQrTAmdAn1+atuDn8+lZ
 0TbGsKvP7C6HIVdixVIa3jXpZgH2rOsDe/qjQKbCTCIqlQ7a/gVXao6T2xEmfi+WBYrMzF
 OtwUhNza94kB5aW6hVpbelv3W4axJfg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-qBB6orLONRehet_JPRTGbA-1; Tue, 02 Aug 2022 09:38:02 -0400
X-MC-Unique: qBB6orLONRehet_JPRTGbA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14B48101A58D;
 Tue,  2 Aug 2022 13:38:02 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 655AC2166B26;
 Tue,  2 Aug 2022 13:38:01 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 0/7] Block layer patches
Date: Tue,  2 Aug 2022 15:37:50 +0200
Message-Id: <20220802133757.138016-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 60205b71421cbc529ca60b12c79e0eeace007319:

  Merge tag 'pull-aspeed-20220801' of https://github.com/legoater/qemu into staging (2022-08-01 13:55:11 -0700)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 21b1d974595b3986c68fe80a1f7e9b87886d4bae:

  main loop: add missing documentation links to GS/IO macros (2022-08-02 12:02:17 +0200)

----------------------------------------------------------------
Block layer patches

- libvduse: Coverity fixes
- hd-geometry: Fix ignored bios-chs-trans setting
- io_uring: Fix compiler warning (missing #include)
- main loop: add missing documentation links to GS/IO macros
- qemu-iotests: Discard stderr when probing devices

----------------------------------------------------------------
Cole Robinson (1):
      qemu-iotests: Discard stderr when probing devices

Emanuele Giuseppe Esposito (1):
      main loop: add missing documentation links to GS/IO macros

Jinhao Fan (1):
      block/io_uring: add missing include file

Lev Kujawski (1):
      hw/block/hd-geometry: Do not override specified bios-chs-trans

Xie Yongji (3):
      libvduse: Fix the incorrect function name
      libvduse: Replace strcpy() with strncpy()
      libvduse: Pass positive value to strerror()

 include/qemu/main-loop.h        | 18 +++++++++++++++---
 block/io_uring.c                |  1 +
 hw/block/hd-geometry.c          |  7 ++++++-
 subprojects/libvduse/libvduse.c | 13 +++++++------
 tests/qemu-iotests/common.rc    |  4 ++--
 5 files changed, 31 insertions(+), 12 deletions(-)


