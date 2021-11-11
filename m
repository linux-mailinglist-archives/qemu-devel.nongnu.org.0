Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71E244D295
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 08:40:49 +0100 (CET)
Received: from localhost ([::1]:55294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml4hV-00007Y-40
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 02:40:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ml4d4-0003ed-KM
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:36:14 -0500
Received: from [2a00:1450:4864:20::531] (port=35414
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ml4d2-000797-GO
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:36:14 -0500
Received: by mail-ed1-x531.google.com with SMTP id g14so20708428edz.2
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 23:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=etGpZnUH6+XeaKsMSHDhZquxTLfs/LFfqt5bm3WGGAM=;
 b=gelcG1ngOydzfjtwEYOUIGjdbIpb5N01vNeYGpj+qthVw47wfeN7dkFPgiQ9LoD2Y3
 H/oVrXLl0zBlL1h+4iKn85DCherPd1WL0WpTfVi1glA1edfSBiGg0TuABmF5zzYLlGhN
 vIhdxozxHfyaVRcVLNjtEiHIOVZwkNwRQfSwhU/6CPSjOeCxoQD6c+jA/MkVqL5bgqGp
 k6hrpjWt9KcAHuO14NvDd9sdT/SLSKI7eyj5AUSaIK78GYmdbGQhTlIhZicbghFteW+o
 Z5xuUfJPEWIlnGPUupIGmMzrh6rTuAHJl60uylZKjLQCe78Dkh0wIIUraw7msWDJWD45
 CSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=etGpZnUH6+XeaKsMSHDhZquxTLfs/LFfqt5bm3WGGAM=;
 b=YcjhYHRqW6pMvnk1AcXHqU7TfiYBB8c2KDFPcvrYsbTvgt6w98+QexGE7A8Gce89Im
 2nf+SKOQmKl8YbgBsjHzQL9V2+8+AeqmjK4yZC2a4LEHG1ZK1RMWrPmT67W8gEJ0OLnG
 +txpGQHNwC9NCqkOlTiQEeR8i0M2m9padfrKv/Az89S3oW7v9DNVaccHc/UgrWUU3upm
 xStFiPQsRL8eXn3T6X24qe4YPsuPE/TDtgkg6EFwn18fUhVHuOC6pmslJz5bhGsL79KU
 k+8debQ182L+xxGjB/T8wxxh2hDkkCJOJKLwHQTpM2F5MSsV5xyTYRry2/qfvvBJyNe2
 WyEA==
X-Gm-Message-State: AOAM532w53XQeg3f/dGj3eTBgRlkjOmOk6PiTLeqXeTNmL0mzVgFCtfG
 liOFCLwUauIn8izzNCwH0lubYmuzAHo=
X-Google-Smtp-Source: ABdhPJyEMNFafb5S5F1d+tQ7I8QFrBH63h/xwra5S8BDiIlY5NZQ2vzycD7s4lXl8jJgfVwcN1Se3w==
X-Received: by 2002:a17:906:c041:: with SMTP id
 bm1mr6991562ejb.280.1636616169202; 
 Wed, 10 Nov 2021 23:36:09 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id w1sm1062098edd.49.2021.11.10.23.36.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 23:36:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] x86, RCU/TCG patches for QEMU 6.2-rc1
Date: Thu, 11 Nov 2021 08:36:02 +0100
Message-Id: <20211111073607.195697-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 114f3c8cc427333dbae331dfd2ecae64676b087e:

  Merge remote-tracking branch 'remotes/philmd/tags/avocado-20211108' into staging (2021-11-08 18:50:09 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 2c3132279b9a962c27adaea53b4c8e8480385706:

  sgx: Reset the vEPC regions during VM reboot (2021-11-10 22:57:40 +0100)

----------------------------------------------------------------
* Fixes for SGX
* force_rcu notifiers

----------------------------------------------------------------
Greg Kurz (2):
      rcu: Introduce force_rcu notifier
      accel/tcg: Register a force_rcu notifier

Paolo Bonzini (2):
      target/i386: sgx: mark device not user creatable
      numa: avoid crash with SGX and "info numa"

Yang Zhong (1):
      sgx: Reset the vEPC regions during VM reboot

 accel/tcg/tcg-accel-ops-mttcg.c | 26 +++++++++++++++++++++
 accel/tcg/tcg-accel-ops-rr.c    | 10 +++++++++
 hw/core/numa.c                  |  7 ++++++
 hw/i386/sgx-epc.c               |  1 +
 hw/i386/sgx.c                   | 50 +++++++++++++++++++++++++++++++++++++++++
 include/qemu/rcu.h              | 15 +++++++++++++
 util/rcu.c                      | 19 ++++++++++++++++
 7 files changed, 128 insertions(+)
-- 
2.33.1


