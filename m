Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836FB47FDD7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 15:34:42 +0100 (CET)
Received: from localhost ([::1]:49230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1r5F-0001xY-I7
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 09:34:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n1qzN-0001hc-Sk
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 09:28:37 -0500
Received: from [2607:f8b0:4864:20::531] (port=40882
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n1qzH-00030D-5i
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 09:28:33 -0500
Received: by mail-pg1-x531.google.com with SMTP id l10so13662227pgm.7
 for <qemu-devel@nongnu.org>; Mon, 27 Dec 2021 06:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J+u58HAk1TScXtkb1on2YBkzpP66DXa2fL3EH4iJnEA=;
 b=rypHYMWFpfRk13U6vR8KIsaXSt+6JmmLGx1IYW8P6EWRX/YSsGDvH8W17SygtWJps2
 LPWpqUCF3QwmZLxVzLlga3e1/Ou7Ye6gMqUCk6kGwQmnNP26G94I2XmG3C68oE7tazbr
 +I0edIj5YANuzIB7MA3ehhqNt7AiUmfTpEXO9iaTZisLR7RCdj1yqHfcssRscYa+CNq0
 mprbdQbd/vku/5XiaLhHT1kCC1rZ4vOPqixOlwcAHL2scu4gWiDeX4jWNOUwR3B8PgOy
 nJ2/HXBdV8BEQ1wsqoiDQEGfNqgfzJYFQjJ6+Z0ZyrJ0ZJ+RLCdNQk8zILUTmIN9S+a4
 aYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J+u58HAk1TScXtkb1on2YBkzpP66DXa2fL3EH4iJnEA=;
 b=FQursZiH92fHKz5cB+TtzKQukBxotA4nDWkF5j+TO/XVkYv4p5DCK9N1v6I4KREcdk
 dz16J5HSrKMR5phYhpNMSK/ymbCSE3x5AuLT0NwHbMQD7ioQjsu4JgqIOUUvtWhUsbq2
 TpxjnwGWfYiIBxj7Ml8MDdr7zfxS50AvuhJMIkOrs1y2AUIaNAx4id5r/AMH2PZ5z6sz
 vr25gMNrz7E55t3fNfbQzXK9hhvm6+iXCaD93o0Nqyw27/Xd+K60PVeoLJerPUjoTBom
 gukJBnb7qCVg3xl8n653KNZ4nvaDTo+0Hi5RlRuFioTVwwRYwmSY4/VNfP1vjeO/fbs6
 9wLA==
X-Gm-Message-State: AOAM5326ZCkHwvpxr+jCZstKRef0ukfikmHxmqNWetV/BiF5iGeMhm4k
 tQcSxSbjxkzCi26Nyl2MNtcyMQ==
X-Google-Smtp-Source: ABdhPJydIX1Pe1IElJoTwNkXHSTHzMTJkWIza+UhIaeN0AHFL3te07yvroHDi2Jhu4JVHohO2MDeJQ==
X-Received: by 2002:a65:6411:: with SMTP id a17mr16047357pgv.203.1640615307667; 
 Mon, 27 Dec 2021 06:28:27 -0800 (PST)
Received: from libai.bytedance.net ([153.254.110.96])
 by smtp.gmail.com with ESMTPSA id p2sm15072916pgn.73.2021.12.27.06.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 06:28:27 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
 eblake@redhat.com, pbonzini@redhat.com
Subject: [PATCH 0/5] Introduce camera subsystem and USB video device
Date: Mon, 27 Dec 2021 22:27:29 +0800
Message-Id: <20211227142734.691900-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1, The full picture of this patch set:
   +---------+       +------------+     +---------------+
   |UVC(done)|       |virtio(TODO)|     |other HW device|
   +---------+       +------------+     +---------------+
         |                 |                     |
         |            +------------+             |
	 +------------+camera(done)+-------------+
                      +----+-------+
                           |
         +-----------------+---------------------+
         |                 |                     |
  +------+------+     +----+-----+        +------+------+
  |builtin(done)|     |v4l2(done)|        |other drivers|
  +-------------+     +----------+        +-------------+

With this patch set, We can run a desktop VM (Ex Ubuntu-2004), several camera
APPs(cheese, kamoso, guvcview and qcam) work fine.

Some works still in working:
  1, hot-plug
  2, compat with live migration
  3, several actions defined in UVC SPEC

Zhenwei Pi (5):
  camera: Introduce camera subsystem and builtin driver
  camera: v4l2: Introduce v4l2 camera driver
  usb: Introduce video&mescellaneous
  usb: allow max 8192 bytes for desc
  usb-video: Introduce USB video class

 camera/builtin.c        |  717 ++++++++++++++++++++
 camera/camera-int.h     |   19 +
 camera/camera.c         |  522 +++++++++++++++
 camera/meson.build      |   20 +
 camera/trace-events     |   28 +
 camera/trace.h          |    1 +
 camera/v4l2.c           |  637 ++++++++++++++++++
 hw/usb/Kconfig          |    5 +
 hw/usb/desc.c           |   15 +-
 hw/usb/desc.h           |    1 +
 hw/usb/dev-video.c      | 1395 +++++++++++++++++++++++++++++++++++++++
 hw/usb/meson.build      |    1 +
 hw/usb/trace-events     |   11 +
 include/camera/camera.h |  238 +++++++
 include/hw/usb.h        |    2 +
 include/hw/usb/video.h  |  303 +++++++++
 meson.build             |   20 +-
 meson_options.txt       |    3 +
 qapi/camera.json        |  101 +++
 qapi/meson.build        |    1 +
 qapi/qapi-schema.json   |    1 +
 qemu-options.hx         |   13 +
 softmmu/vl.c            |    4 +
 23 files changed, 4050 insertions(+), 8 deletions(-)
 create mode 100644 camera/builtin.c
 create mode 100644 camera/camera-int.h
 create mode 100644 camera/camera.c
 create mode 100644 camera/meson.build
 create mode 100644 camera/trace-events
 create mode 100644 camera/trace.h
 create mode 100644 camera/v4l2.c
 create mode 100644 hw/usb/dev-video.c
 create mode 100644 include/camera/camera.h
 create mode 100644 include/hw/usb/video.h
 create mode 100644 qapi/camera.json

-- 
2.25.1


