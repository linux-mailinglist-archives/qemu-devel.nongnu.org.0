Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B552D6D511F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 21:17:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjPfe-0005jh-FY; Mon, 03 Apr 2023 15:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1pjPfc-0005jA-1l; Mon, 03 Apr 2023 15:16:48 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1pjPfa-0001Kg-9l; Mon, 03 Apr 2023 15:16:47 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so20493824wmq.4; 
 Mon, 03 Apr 2023 12:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680549403;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KtGeefx8eNnQOPdD5E0djsAwT6dYykWx7TqVYkfzahU=;
 b=BoZJjiCO7aeDrYp8beQD6wkuGlSuFXDigltrHvWzxGjNtokvDOeqpCqE3cvm4eATEv
 p/9jS7GTQblXfKEUgU9DhaeqT0/T1dAOgdUmu03cKct2QjAxXbz0Tix1iIfkKwf1dhsp
 QLBjOQhO3xwGsvVCkpOhrk9s1g7he5eC9Uzm/s7uA4OIcKeZr4rCa31Js+iWqQhtKBzB
 3Y32+141eoP/pOjsd+mQH2khmOiYhcZxIL7utqfELyaC64EudlFlMSRHCUf64OzN+B+k
 zdfy6nfcfixl27v73OCiSIYN/EdvGDfZnaVBTf8Y5V0bMylmg3icvei7iXO7rcum7mOS
 qt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680549403;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KtGeefx8eNnQOPdD5E0djsAwT6dYykWx7TqVYkfzahU=;
 b=F8TD3E4hgJ8lQ2EEPDV6HJPumTSCTQAAP0H2V37jxzEalLn0nFRNGwKepzl1b3eUYv
 vyu+Zuz6QhuL1ilSPg4mHYF5RRrxEv3CZm3truu4TSZHdRaM1lhUhnxaY2YDuZaBQHlJ
 lFEODgf6JeaILcuhLpSzFgwG8yd4HGcMVEQIY3gxRWqdwwsqyPPxmfGZKVD+SRkqi2un
 jT+/dx8z/PNHgfBcf88XEUp6ictQ9m59yKlIVTxIWLhIepc6GLG8x6Qm5WV2qNj+wcxm
 Y9wBt/WDh1fZzd5YJmbmHx2LeyoPNA/wm+I5FfbA0z7L6rwLEFSZqFCvxxj02sN9mgqQ
 CIdA==
X-Gm-Message-State: AAQBX9cozRLxzz9b0kkyDDJlWitO0O+ugfsyysIWJcarbp5+Y5ccSysr
 aEDtpSL7K3pZP9DZY6hjTr5JJwIu4nXeew==
X-Google-Smtp-Source: AKy350aUgSmgR3yt2L9hY7YJwPtM1fK/f0+IRCISYw32Z1fR7w0H0oTED8BRsr0bPktr1zsTKhL7fw==
X-Received: by 2002:a7b:ce10:0:b0:3eb:25ff:3446 with SMTP id
 m16-20020a7bce10000000b003eb25ff3446mr376540wmc.4.1680549403389; 
 Mon, 03 Apr 2023 12:16:43 -0700 (PDT)
Received: from omega.lan (233.87.95.79.rev.sfr.net. [79.95.87.233])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a7bc3c6000000b003ee1b2ab9a0sm12801051wmj.11.2023.04.03.12.16.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Apr 2023 12:16:42 -0700 (PDT)
From: francesco.cagnin@gmail.com
X-Google-Original-From: fcagnin@quarkslab.com
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk, dirty@apple.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com,
 alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Subject: [PATCH v4 0/2] Add gdbstub support to HVF
Date: Mon,  3 Apr 2023 21:15:58 +0200
Message-Id: <20230403191600.43487-1-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=francesco.cagnin@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Francesco Cagnin <fcagnin@quarkslab.com>

This patch series aims to add gdbstub support to HVF (the 'QEMU
accelerator on macOS that employs Hypervisor.framework') on Apple
Silicon hosts.

The proposed implementation, structured like the KVM counterpart,
handles single-stepping, software breakpoints, hardware breakpoints and
hardware watchpoints.

The patch has been most recently tested working on macOS Ventura 13.3
hosts and single-core Linux kernel 5.19 guests with the test script
'tests/guest-debug/test-gdbstub.py' (slightly updated to make it work
with Linux kernels compiled on macOS, see
https://gitlab.com/qemu-project/qemu/-/issues/1489).

The patch still has uninvestigated issues with multi-cores guests (see
thread https://www.mail-archive.com/qemu-devel@nongnu.org/msg932884.html).

v4:
* Add license and copyright comment in 'hyp_gdbstub.c'
* Fix build on x86 macos
* Add architecture specific functions to check guest debug support
* Move include to the top of the file in 'hvf.h'
* Merge patches 2 and 3 from previous patch series
* Re-inject EC_AA64_BKPT into the guest if unhandled
* Add comments explaining how debug registers are handled
* Minor refactor around debug registers for readability
* Other minor changes

Francesco Cagnin (2):
  arm: move KVM breakpoints helpers
  hvf: implement guest debugging on Apple Silicon hosts

 accel/hvf/hvf-accel-ops.c | 115 +++++++
 accel/hvf/hvf-all.c       |  23 ++
 include/sysemu/hvf.h      |  34 ++
 include/sysemu/hvf_int.h  |   1 +
 target/arm/hvf/hvf.c      | 709 +++++++++++++++++++++++++++++++++++++-
 target/arm/hyp_gdbstub.c  | 253 ++++++++++++++
 target/arm/internals.h    |  50 +++
 target/arm/kvm64.c        | 276 ---------------
 target/arm/meson.build    |   3 +-
 target/i386/hvf/hvf.c     |  33 ++
 10 files changed, 1218 insertions(+), 279 deletions(-)
 create mode 100644 target/arm/hyp_gdbstub.c

-- 
2.40.0


