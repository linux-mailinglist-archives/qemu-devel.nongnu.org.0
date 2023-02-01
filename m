Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C14B68705E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 22:12:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNKNr-00076p-PP; Wed, 01 Feb 2023 16:11:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pNKNn-00076F-7O
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:11:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pNKNi-0003KP-I8
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:11:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675285860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j3rTidpfCZeSn61xGxTQTZmpilpYnns17P9e5f/Xxzk=;
 b=DWAxH034uWbYDBUNfd9mOloKjPGK/YMrKKsbEGyy7NvltswGwNsrSuYW3wvps+uJuNBUI5
 v8sxrfAPs9kTyGTCvZNGhZeG7bUV4RKmnouJNcuJYyzRFrYFeJwmD+2UAH6+0DhcFBszKN
 K03D4Kh6ZzrXQ117feKNiqzQ3DfP7rU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-202-LUpY1tFrNGqiGynZ0ExeLg-1; Wed, 01 Feb 2023 16:10:59 -0500
X-MC-Unique: LUpY1tFrNGqiGynZ0ExeLg-1
Received: by mail-qv1-f69.google.com with SMTP id
 w2-20020a0cc702000000b0055c8ef137ddso787035qvi.0
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 13:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j3rTidpfCZeSn61xGxTQTZmpilpYnns17P9e5f/Xxzk=;
 b=KZn1uoaOV4dpyvBYnlpxipE/yTWavK/FGL0tIivBhWaET2Iz8OpvxQrbcMWLrW2ELu
 Fg2CvvsvpGuLXeFRFP/em35M9ktovO3RP4TX+9sHIV+gUC2aL0TcjzfybzXHXOYb1rq6
 NqXCtPZF/JgdFWhs3oqd/OcpYONPHqLkjv2whML3lUHgFiGQVzl0JQQBVG2BuMMFRYjE
 DM765IwWoVhtnoYDtTF96DXHqBx/IXpcZVxAQKAqZEZqjTb/sk2h4PYq3YjeRmzSsScj
 k8igKz70uG7HI1ldsIDME6iCmpMqiE+OR0LNYBGIz1EQXnedrzIMF+TMT1kYdtEuw4dV
 jFtA==
X-Gm-Message-State: AO0yUKXEpR8mZPT/lhxoloWNH8T1/Vr1xb7I0TGoo/LFCEieucBnSwIj
 7xUJb5Nbn2uhayk2P2EcIFkdcOnSgN1z/Yxq2xkz/J/iiqoOFchMf+R1umerMXANjGBuSDx+2tm
 JeVp36+5lQnGRJl5hqqiXqS/DtN32qC4fMnYU/H3T76GKpJGNcpSeZFOIoUjmHAUa
X-Received: by 2002:ac8:70c6:0:b0:3b8:6d44:ca7e with SMTP id
 g6-20020ac870c6000000b003b86d44ca7emr6088245qtp.4.1675285858401; 
 Wed, 01 Feb 2023 13:10:58 -0800 (PST)
X-Google-Smtp-Source: AK7set+rr1gIty5lKHosM5Et7Kp/cJ5J3UyRjCwy4YVErRUGlvbluwZfMx95b2vZfXsqe0JCKTJA7g==
X-Received: by 2002:ac8:70c6:0:b0:3b8:6d44:ca7e with SMTP id
 g6-20020ac870c6000000b003b86d44ca7emr6088200qtp.4.1675285858140; 
 Wed, 01 Feb 2023 13:10:58 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 ea17-20020a05620a489100b007204305dee4sm6331403qkb.19.2023.02.01.13.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 13:10:56 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Michal=20Pr=C3=ADvozn=C3=ADk?= <mprivozn@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 peterx@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v2 0/3] util/userfaultfd: Support /dev/userfaultfd
Date: Wed,  1 Feb 2023 16:10:52 -0500
Message-Id: <20230201211055.649442-1-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

v2:
- Added R-bs for Phil
- Move open_mode into uffd_detect_open_mode() [Phil]
- Document uffd_open() in the header file [Phil]
- [Discussed with Daniel/Michal, decided to leave fd support for later]

The new /dev/userfaultfd handle is superior to the system call with a
better permission control and also works for a restricted seccomp
environment.

The new device was only introduced in v6.1 so we need a header update.

Please have a look, thanks.

Peter Xu (3):
  linux-headers: Update to v6.1
  util/userfaultfd: Add uffd_open()
  util/userfaultfd: Support /dev/userfaultfd

 include/qemu/userfaultfd.h                    |   8 +
 include/standard-headers/drm/drm_fourcc.h     |  34 ++++-
 include/standard-headers/linux/ethtool.h      |  63 +++++++-
 include/standard-headers/linux/fuse.h         |   6 +-
 .../linux/input-event-codes.h                 |   1 +
 include/standard-headers/linux/virtio_blk.h   |  19 +++
 linux-headers/asm-generic/hugetlb_encode.h    |  26 ++--
 linux-headers/asm-generic/mman-common.h       |   2 +
 linux-headers/asm-mips/mman.h                 |   2 +
 linux-headers/asm-riscv/kvm.h                 |   4 +
 linux-headers/linux/kvm.h                     |   1 +
 linux-headers/linux/psci.h                    |  14 ++
 linux-headers/linux/userfaultfd.h             |   4 +
 linux-headers/linux/vfio.h                    | 142 ++++++++++++++++++
 migration/postcopy-ram.c                      |  11 +-
 tests/qtest/migration-test.c                  |   3 +-
 util/trace-events                             |   1 +
 util/userfaultfd.c                            |  50 +++++-
 18 files changed, 362 insertions(+), 29 deletions(-)

-- 
2.37.3


