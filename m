Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0C9620C1B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 10:24:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osKpB-0007Cl-Vo; Tue, 08 Nov 2022 04:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osKp7-0007CJ-4S
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:23:13 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osKp4-0005ma-Qa
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:23:12 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 t25-20020a1c7719000000b003cfa34ea516so538599wmi.1
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 01:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJNVaJjLpeOoA/tYgeBEMM428Ot0jBMszllCPaed65Q=;
 b=RNV0YmyyzjUMcdWEY3ASg1fae/c64knC2WKsg7gqvhGMfpImH+78H23RqRRZeNMs8P
 NYfrzo2tYheOBPS85PkpnVdoSnxkpUyJ27n0g/b25GuCHiSqKnyY1VQsupvDm3s9J6Al
 UPvu0SKKt1x5Tc/crDuR3445nC8ZHE1RVKM0D1HtulvujXS71KeWk+7mPFjbQ0frKLuu
 Ac/xNPpgagi/lRqhZnVs/8tj58e2vlTfU48uHLtwcyabZINZKuSFx3fk2qxS3FLsQQFq
 SOoo2eiQyTPUHBYmRKscg/wfFrvuOHSRou0HQKvAKfqpi0YMua2DERiidMkeXyPyn+sE
 VjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZJNVaJjLpeOoA/tYgeBEMM428Ot0jBMszllCPaed65Q=;
 b=1jGWocpdQDnvtiFFItu4hZduHcyZrVZXvxegH2TfoIiwEcCvCrXLG8x4C/rSnSTdQ9
 ckRzy99BRvxRGRg4hG50wBaWlVKfcKVpk+klzctpdfg3xFJOjjR8TBFEFGQnTw46HRPi
 FPnzcjnDOP5I7rmJt0+Ak2hPfg3VhMEzM/8UoWpe+mRIhQHGE7SrMTgogomh679KT7HL
 F2mh52P/IemNS5UKHzHYR/qwUthxvvdY+YC1CIVRDVtjjv0j/k+VgQRQ7YtaEKQAOEna
 +hKknJk6s62svOs18n8MLAPRguh6PXQpyB3DqQJiQ+bABEgrSMBlc9cJzYfK/sAn7V79
 VR1A==
X-Gm-Message-State: ACrzQf1l1dI7Z88t+9RtdJGepDRsI7YUoGZHffsarkBfbfHCKg8cClBG
 SLeppEPbVDgFsKd1Vp2IkVWoUA==
X-Google-Smtp-Source: AMsMyM56/o6XvChHX/ZJfcxFHLVvr9ow3/j538vTQFeCeyrEIa1JHMn5QNjgZP5WUUBzJ49zKhr/WA==
X-Received: by 2002:a05:600c:2c4b:b0:3cf:9cd9:a850 with SMTP id
 r11-20020a05600c2c4b00b003cf9cd9a850mr13323593wmg.135.1667899389137; 
 Tue, 08 Nov 2022 01:23:09 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a1c5403000000b003a3442f1229sm14162160wmb.29.2022.11.08.01.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 01:23:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 25AFA1FFB7;
 Tue,  8 Nov 2022 09:23:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 for 7.2 0/9] test and doc updates
Date: Tue,  8 Nov 2022 09:22:59 +0000
Message-Id: <20221108092308.1717426-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi,

Its freeze o'clock so I'm reverting to collecting fixes for the tree.
Most of these patches have been posted before as single patch RFCs. A
couple are already scheduled through other trees so will drop out in
due course. The docs update has included some feedback for the review
and should be good for an rc1.

The following have not been reviewed:

 - hw/virtio: introduce virtio_device_should_start
 - tests/docker: allow user to override check target
 - tests/avocado: improve behaviour waiting for login prompts

Alex Bennée (7):
  tests/avocado: improve behaviour waiting for login prompts
  tests/docker: allow user to override check target
  hw/virtio: introduce virtio_device_should_start
  docs/devel: add a maintainers section to development process
  docs/devel: make language a little less code centric
  docs/devel: simplify the minimal checklist
  docs/devel: try and improve the language around patch review

Cédric Le Goater (1):
  tests/avocado/machine_aspeed.py: Reduce noise on the console for SDK
    tests

Stefan Weil (1):
  Run docker probe only if docker or podman are available

 docs/devel/code-of-conduct.rst           |   2 +
 docs/devel/index-process.rst             |   1 +
 docs/devel/maintainers.rst               | 106 +++++++++++++++++++++++
 docs/devel/submitting-a-patch.rst        | 101 +++++++++++++--------
 docs/devel/submitting-a-pull-request.rst |  12 +--
 configure                                |   2 +-
 include/hw/virtio/virtio.h               |  18 ++++
 hw/block/vhost-user-blk.c                |   6 +-
 hw/virtio/vhost-user-fs.c                |   2 +-
 hw/virtio/vhost-user-gpio.c              |   2 +-
 hw/virtio/vhost-user-i2c.c               |   2 +-
 hw/virtio/vhost-user-rng.c               |   2 +-
 hw/virtio/vhost-user-vsock.c             |   2 +-
 hw/virtio/vhost-vsock.c                  |   2 +-
 tests/avocado/avocado_qemu/__init__.py   |  89 ++++++++++++++++++-
 tests/avocado/machine_aspeed.py          |  17 ++--
 tests/docker/Makefile.include            |   2 +
 tests/docker/common.rc                   |   6 +-
 18 files changed, 309 insertions(+), 65 deletions(-)
 create mode 100644 docs/devel/maintainers.rst

-- 
2.34.1


