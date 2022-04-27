Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BE9511666
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 13:50:30 +0200 (CEST)
Received: from localhost ([::1]:37356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njgBi-0001yZ-0v
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 07:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1njg2g-0005Dg-F7
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:41:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1njg2a-00033V-Ck
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:41:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651059663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZQXm4zcJA/kN6im/ZTrqTje6yQRo4n5ymXyM62cLAbY=;
 b=beQ80H8sdMQAK+cevSoPLq/qAbW3LrMQ+RMoesSWISO3A4jfSDI4LsSEALnokRMfnEXw5G
 0OuqBrf0V/Q94SHGz6DSuQJ//9nGQdB6SSrvQTeY6l6ZJunoe/RIKyhVLsPSxCnOvlFrTw
 pyOTWgY7RQUf9xREtllVoRzk0DJKVcQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-3AgXNwcfObaHBEkmCrRCdg-1; Wed, 27 Apr 2022 07:41:00 -0400
X-MC-Unique: 3AgXNwcfObaHBEkmCrRCdg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57E7483397E;
 Wed, 27 Apr 2022 11:40:59 +0000 (UTC)
Received: from localhost (unknown [10.39.193.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F2D440E80F3;
 Wed, 27 Apr 2022 11:40:58 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/4] Revert "main-loop: Disable GLOBAL_STATE_CODE() assertions"
Date: Wed, 27 Apr 2022 13:40:53 +0200
Message-Id: <20220427114057.36651-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This assertion was disabled in commit
b1c073490553f80594b903ceedfc7c1aef6b1b19.  We wanted to re-enable it
once the 7.1 tree has opened (which is now), but to do so, we should
also fix the bug reported in
https://gitlab.com/qemu-project/qemu/-/issues/945 .

Patches 1 and 2 fix that problem (I hope), patch 3 re-enables the
assertion, and patch 4 adds a regression test for issue 945.


Hanna Reitz (4):
  block: Classify bdrv_get_flags() as I/O function
  qcow2: Do not reopen data_file in invalidate_cache
  Revert "main-loop: Disable GLOBAL_STATE_CODE() assertions"
  iotests: Add regression test for issue 945

 include/block/block-global-state.h            |   1 -
 include/block/block-io.h                      |   1 +
 include/qemu/main-loop.h                      |   3 +-
 block.c                                       |   2 +-
 block/qcow2.c                                 | 104 +++++++++++-------
 .../tests/export-incoming-iothread            |  81 ++++++++++++++
 .../tests/export-incoming-iothread.out        |   5 +
 7 files changed, 151 insertions(+), 46 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/export-incoming-iothread
 create mode 100644 tests/qemu-iotests/tests/export-incoming-iothread.out

-- 
2.35.1


