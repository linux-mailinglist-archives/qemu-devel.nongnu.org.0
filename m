Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192C55BC1DE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 05:56:27 +0200 (CEST)
Received: from localhost ([::1]:51056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa7tR-00064I-KH
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 23:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1oa7qm-0001ow-UM
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 23:53:40 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:33521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1oa7qh-0000me-IS
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 23:53:37 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 bu5-20020a17090aee4500b00202e9ca2182so5848147pjb.0
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 20:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=b1WWBu6jvIMsNskCS/m5aINhQ3iHOp/nBp84jF9BRvE=;
 b=7wkCaTCZzMl3oO0YREcPxmYA1NCoNsFSEGuB1bedUbxyGrrO1TIZvEfejHQ4Gu85O/
 lQvxnwcej9yvW+IrMEAd9nV3L/BzIYVDf4UdKkoXPuqCK+sU15XqZe8Y47k0bMFjoe3K
 +ST5IHnUIyVXf0l2rhDcNSIUiTcs4TEqk93zDr3/4y38LhLUarewMbkZFlWIaPv/rMmu
 PJVN5UXj5k5Fp+g797KsGeYZ1xO4N3vEXiblhPNwzmOvSOBWrZEo7LVc365ekHATQP8W
 WN61f7lvzlFDoV00QQATzTpB0RerOVRaPWvMhDckODhrC2qtFmkzihaRvu2EUjteE9t9
 /L3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=b1WWBu6jvIMsNskCS/m5aINhQ3iHOp/nBp84jF9BRvE=;
 b=cw+MZpzIa0rrwplr7XMucpDVIIM9XjbE06DxMmRh+p6B8Vt9LgVWLwu5GD1u1b/9/d
 o8ayt5m44SA9/RKoVTHrwscbgqoF4im7D00xsBxSDy7eDG30NQF5PJTmjsQ62wxym7vU
 0ey/JK2WdkkkPhp8JyCrkqhoG82PSF2YbOIYNdEmHCLDWQveBki0Nza/E08jXDKTndYW
 Pc90V8PxRbZ7OCkZZf80cPpc7ugCKYTtarYt3fPuxWVvWGdka4SLB/Y6NFW12qk+gtz+
 JdbaYS1gzOhWV6V4qOmZRLN6j0QZ97WieuzlKB3TnfN2RABz3rDRBrcoBt3eNz4CzgV2
 cU7g==
X-Gm-Message-State: ACrzQf3IJK3IbBBGufz2vwEEqgAltAWTBD5WQ0h9PrIscYJl2sM79+yf
 pI4rDnRHyCg6XbkNwwE5ELFvlDs7pPhDsg==
X-Google-Smtp-Source: AMsMyM6i0864yPmTEivjCmTZfclefHIX0cgJtZIJL3dx89mGtKSS7GE+AuYbKuxOIe/spl/HoR3Ukw==
X-Received: by 2002:a17:902:f78d:b0:174:f7aa:921b with SMTP id
 q13-20020a170902f78d00b00174f7aa921bmr10993813pln.37.1663559612515; 
 Sun, 18 Sep 2022 20:53:32 -0700 (PDT)
Received: from FVFDK26JP3YV.bytedance.net ([139.177.225.237])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a170902e1d300b0017865059c5dsm9014878pla.161.2022.09.18.20.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 20:53:32 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, arei.gonglei@huawei.com, mst@redhat.com,
 pizhenwei@bytedance.com, Lei He <helei.sig11@bytedance.com>
Subject: [PATCH 0/4] Add a new backend for cryptodev
Date: Mon, 19 Sep 2022 11:53:16 +0800
Message-Id: <20220919035320.84467-1-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds a new backend called LKCF to cryptodev, LKCF stands
for Linux Kernel Cryptography Framework. If a cryptographic
accelerator that supports LKCF is installed on the the host (you can
see which algorithms are supported in host's LKCF by executing
'cat /proc/crypto'), then RSA operations can be offloaded.
More background info can refer to: https://lwn.net/Articles/895399/,
'keyctl[5]' in the picture.

This patch:
1. Modified some interfaces of cryptodev and cryptodev-backend to
support asynchronous requests.
2. Extended the DER encoder in crypto, so that we can export the
RSA private key into PKCS#8 format and upload it to host kernel.
3. Added a new backend for cryptodev.

I tested the backend with a QAT card, the qps of RSA-2048-decryption
is about 25k/s, and the main-loop becomes the bottleneck. The qps
using OpenSSL directly is about 6k/s (with 6 vCPUs). We will support 
IO-thread for cryptodev in another series later.

Lei He (4):
  virtio-crypto: Support asynchronous mode
  crypto: Support DER encodings
  crypto: Support export akcipher to pkcs8
  cryptodev: Add a lkcf-backend for cryptodev

 backends/cryptodev-builtin.c    |  69 +++--
 backends/cryptodev-lkcf.c       | 620 ++++++++++++++++++++++++++++++++++++++++
 backends/cryptodev-vhost-user.c |  51 +++-
 backends/cryptodev.c            |  44 +--
 backends/meson.build            |   3 +
 crypto/akcipher.c               |  17 ++
 crypto/der.c                    | 307 ++++++++++++++++++--
 crypto/der.h                    | 211 +++++++++++++-
 crypto/rsakey.c                 |  42 +++
 crypto/rsakey.h                 |  11 +-
 hw/virtio/virtio-crypto.c       | 324 ++++++++++++---------
 include/crypto/akcipher.h       |  21 ++
 include/sysemu/cryptodev.h      |  61 ++--
 qapi/qom.json                   |   2 +
 tests/unit/test-crypto-der.c    | 126 ++++++--
 15 files changed, 1649 insertions(+), 260 deletions(-)
 create mode 100644 backends/cryptodev-lkcf.c

--
2.11.0


