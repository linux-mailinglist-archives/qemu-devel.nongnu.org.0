Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509E366A0CB
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:34:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMoj-0006ej-Oi; Fri, 13 Jan 2023 11:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pGMoi-0006eE-EV
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:22:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pGMog-0005m7-Md
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673626926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9s9HcbBYkdvJHIjHdwy17Qf0TCaHHdrBNaOyJ+OOTys=;
 b=Q3OrrUGKT82u0/b7EtU96JQYfxLvDejXgQ7Zj/gL6YFGMCLKuRMGHdysp6i5u1zYLT2+nR
 4Dl3etxvAhBdPaGykgSe2/RxkKZqBwMWHIVUroQP8IAxX3ASU86uzOEVCtwCajIoxORWhw
 R7tdsVGsPiYc/BOXxiMxbl4r+AKUbs8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-_v3HDrk7MviWUKrw6e_7dw-1; Fri, 13 Jan 2023 11:22:02 -0500
X-MC-Unique: _v3HDrk7MviWUKrw6e_7dw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1C1A100F91A;
 Fri, 13 Jan 2023 16:22:01 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1004640C2004;
 Fri, 13 Jan 2023 16:22:01 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 0/9] audio: remove deprecated QEMU_AUDIO env support
Date: Fri, 13 Jan 2023 11:21:51 -0500
Message-Id: <20230113162200.3010804-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

This removes much of the deprecated audio code, most
notably the QEMU_AUDIO env variables. The VNC server
will also stop accepting client requests for audio
streaming unless an audiodev is set.

I tried to make the use of 'audiodev' mandatory for
devices but that turned out to not be practical. Our
test suite assumes it can create any device type
without setting any properties. This is not possible
if 'audiodev' setting is enforced at realize() time.
Also there are several machihe boards with embedded
soundcards that provide no way to set audiodev AFAICT

Daniel P. Berrangé (9):
  audio: don't check qemu_add_vm_change_state_handler failure
  audio: remove special audio_calloc function
  audio: remove unused 'name' in QEMUSoundCard struct
  audio: remove QEMUSoundCard linked list
  audio: remove empty AUD_remove_card method
  docs: split the deprecation warning for soundcards vs VNC
  ui/vnc: don't accept VNC_ENCODING_AUDIO without audiodev
  audio: audio state is now mandatory for capture
  audio: remove support for QEMU_AUDIO_ env variables

 audio/alsaaudio.c               |   6 +-
 audio/audio.c                   |  71 +---
 audio/audio.h                   |   4 -
 audio/audio_int.h               |   2 -
 audio/audio_legacy.c            | 552 --------------------------------
 audio/audio_template.h          |  28 +-
 audio/meson.build               |   1 -
 audio/mixeng.c                  |   7 +-
 docs/about/deprecated.rst       |  16 +-
 docs/about/removed-features.rst |  14 +
 hw/audio/ac97.c                 |   1 -
 hw/audio/adlib.c                |   1 -
 hw/audio/es1370.c               |   1 -
 hw/audio/gus.c                  |   1 -
 hw/audio/hda-codec.c            |   1 -
 hw/audio/wm8750.c               |   1 -
 hw/usb/dev-audio.c              |   1 -
 softmmu/vl.c                    |   4 -
 tests/qtest/fuzz-sb16-test.c    |   6 +-
 tests/qtest/libqtest.c          |   3 -
 ui/vnc.c                        |  10 +-
 21 files changed, 53 insertions(+), 678 deletions(-)
 delete mode 100644 audio/audio_legacy.c

-- 
2.38.1


