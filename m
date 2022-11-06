Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D599461E111
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 09:52:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orbNI-0007KD-IZ; Sun, 06 Nov 2022 03:51:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbNG-0007Jr-2K
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:51:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbNE-0002r5-0n
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667724681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mn6Pp0tV+sG8nlGqWCyGkNRcDOiTtryHn9zYQhFEwIo=;
 b=Ru/yYBvsUon5nQ70ArrPYT+z3olgorZDW38pLOY+OXTLQu8siIVhvpmolwcvbbMvDsjtsW
 YY9AeAkKYrgkGG16Ble3+ngLEaUTpu+MLteOzg7WenvPf9n1GZwnokJ30ycVwWEEGsmABy
 fBwPpPgC4lb9YqBsEizBgGh6qzbOHDk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-493-yAS6WRVOO1uD77TdhuRjMw-1; Sun, 06 Nov 2022 03:51:19 -0500
X-MC-Unique: yAS6WRVOO1uD77TdhuRjMw-1
Received: by mail-wm1-f69.google.com with SMTP id
 l42-20020a05600c1d2a00b003cf8e70c1ecso3317892wms.4
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 01:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mn6Pp0tV+sG8nlGqWCyGkNRcDOiTtryHn9zYQhFEwIo=;
 b=Z/udKhgIkGVl3zA14+1t4Y+7gNuzN2X0oxJHoi90ULEMu0n0ldsjpmqpVGpWwFi6mM
 mkFReYqX7zOcticc0L2HbjE84Cll2RVLA45HcyU5KOFXrxcg/4HlabQNvnOCBSklKv6V
 LDKrYUJQmihCMXw9Ka8Fk0G6KUY+WhzUNyHxZM4R0XKQIYO50uTz3paaj/CXM9r1lIT3
 4mIc3O1QZJ7SHiFtD5TElYtP0XMQOznljyjUuOT2xbgb7GL2EMmLHfRgWEx1oDxYT+kL
 518DP3KySJi5wVN1PV585oSGhUMHFd5sY8tZjM/6Tue99f4ZHLvq3f7rw2Fs9Tt9MMpK
 l/vQ==
X-Gm-Message-State: ACrzQf1vK9xmOuhxQjNtnM/KPC2+z2BTaL3dCKXBP8y09lhy7MjSrKyb
 4H6NwDwEFTSlAcu3lEath3Z4NuXeTDkGPvrtaYFpwVH2krgb6OVroVjXXNRwdh74IchImhJzCU3
 iny8+YzeBMQQDz8huU8nd0kz/JnjotAjuHtlE7Wk1oVxxiYD6Q/0PEObYvjjHXHns4P0=
X-Received: by 2002:adf:f9c9:0:b0:236:9c40:c57c with SMTP id
 w9-20020adff9c9000000b002369c40c57cmr27620371wrr.47.1667724678459; 
 Sun, 06 Nov 2022 01:51:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM47AF3kj98bJo50uHZxDa8eiLOGMD3XLJjAtfPGDeIKDrO8JKy7Ayq8XOGHzhyu88RsCRNRzQ==
X-Received: by 2002:adf:f9c9:0:b0:236:9c40:c57c with SMTP id
 w9-20020adff9c9000000b002369c40c57cmr27620351wrr.47.1667724677850; 
 Sun, 06 Nov 2022 01:51:17 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 p14-20020adff20e000000b0022e344a63c7sm4169212wro.92.2022.11.06.01.51.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 01:51:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/12] Misc bugfix patches (+ improved module errors) for QEMU
 7.2
Date: Sun,  6 Nov 2022 09:51:03 +0100
Message-Id: <20221106085115.257018-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The following changes since commit 6295a58ad1b73985b9c32d184de7d2ed1fbe1774:

  Merge tag 'pull-target-arm-20221104' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-11-04 11:01:17 -0400)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 5141e9a23fc9a890d66a5700920a5ffd8885121f:

  accel: abort if we fail to load the accelerator plugin (2022-11-06 09:48:50 +0100)

----------------------------------------------------------------
* bug fixes for Win32 event loop
* bug fixes for -Wextra
* fix gdb XML for 32-bit x86
* improve error handling for module load
----------------------------------------------------------------

Kevin's patch below is a bugfix that Claudio picked up, and became part of
his series to improve error reporting for modules.

Thanks,

Paolo

Bin Meng (3):
      util/main-loop: Fix maximum number of wait objects for win32
      util/main-loop: Avoid adding the same HANDLE twice
      util/aio-win32: Correct the event array size in aio_poll()

Claudio Fontana (4):
      module: removed unused function argument "mayfail"
      module: rename module_load_one to module_load
      module: add Error arguments to module_load and module_load_qom
      accel: abort if we fail to load the accelerator plugin

Kevin Wolf (1):
      dmg: warn when opening dmg images containing blocks of unknown type

Paolo Bonzini (1):
      meson: avoid unused arguments of main() in compiler tests

Stefan Weil (2):
      Fix broken configure with -Wunused-parameter
      Add missing include statement for global xml_builtin

TaiseiIto (1):
      gdb-xml: Fix size of EFER register on i386 architecture when debugged by GDB

 accel/accel-softmmu.c    |   8 +-
 audio/audio.c            |  16 ++--
 block.c                  |  20 +++--
 block/dmg.c              |  33 +++++++-
 configure                |   8 +-
 gdb-xml/i386-32bit.xml   |   2 +-
 hw/core/qdev.c           |  17 +++-
 include/qemu/main-loop.h |   2 +
 include/qemu/module.h    |  37 +++++++--
 meson.build              |   8 +-
 qom/object.c             |  18 +++-
 scripts/feature_to_c.sh  |   1 +
 softmmu/qtest.c          |   8 +-
 ui/console.c             |  18 +++-
 util/aio-win32.c         |   5 +-
 util/main-loop.c         |  20 +++--
 util/module.c            | 211 ++++++++++++++++++++++++++---------------------
 17 files changed, 290 insertions(+), 142 deletions(-)
-- 
2.38.1


