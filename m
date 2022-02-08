Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D6A4AE2BF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 22:04:07 +0100 (CET)
Received: from localhost ([::1]:37176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHXeg-0000uK-Jq
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 16:04:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHWnV-0002zU-6i
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:09:09 -0500
Received: from [2a00:1450:4864:20::429] (port=34428
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHWnS-00066Q-W6
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:09:08 -0500
Received: by mail-wr1-x429.google.com with SMTP id f17so398808wrx.1
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 12:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z+VPkWlVJWJ+y3JCtfJU1WOPIzwfrq68WHRFxBUsinw=;
 b=JB35W2PScoW4uuDNfIOr6jmSEMZPRkeX00s7G4mNyEjFQ7DJ/RCxOvmNsRSbSukgiv
 8LqLwCFxR+RJenff+h0lbuF2nqR9Cz4E9xGigRgxzQbE8gtCvPzV0M66FvGGuJyai2EE
 mgBbIvdsDanwvaPCkIRrvht1RIZsndTET4TeEgm7TAxd2S6CgiG/sUkIKrcjgPTDoN5H
 sfwL0cGOY1qy22V6ofvDev+g8nOP+ZdvDzyknwBk5Lu2OPH10quvKeKqBICaFDv+S4L9
 N/Kv4yx56/EwHGl/mtjdSaIWAA63cuKtuap6g9uD1ctvhnWpJ7WCiiippAU4H5gu7bwM
 eFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z+VPkWlVJWJ+y3JCtfJU1WOPIzwfrq68WHRFxBUsinw=;
 b=MKAwCv6vJ52HMN4OP1ARZg5HJ/zk3kfQurdQn59tw4TJf91BURkznpGf++RukqNkbE
 cjEwR7+Y6khxAbnroxQhvk/Mh9SjVJgm+YSbsum3rk0diJgT54UjH2YWZjB8vzf4s698
 FQ4vEx+pDG5249QdKETPwu1rFy3rUqWlqOJBBG7eXOqkxtQpH697j9rkT5Djk5uNq4qT
 HhVZX49YX3/VrmZBNSqIhoMjDwft4wbcelTj5bMY5y4ixWA01Og+7n2KDz6EiHtRfNMr
 URvkxQLefo+1kzO1CxQ7QwJlLv7QfKXXM0jrZYSDiOi3SvcVuXP52NxHHjiiZN6XfUxm
 yp/A==
X-Gm-Message-State: AOAM5328OZa9DDPXKBCt1eRQ2JjRY/IIqOqKkdgUmhllsKz9BwRuy+kX
 Wvr0dbTp6ybTS2PKMkQyE3zNK6QNdZ4h5A==
X-Google-Smtp-Source: ABdhPJydLtveYC/5ZcFkSsehancJKvBVg0Ifs42TicIHQZbVm3Uh4z48iCuHgqxhkPBcB8BiMhJM3g==
X-Received: by 2002:adf:e790:: with SMTP id n16mr4543064wrm.542.1644350938576; 
 Tue, 08 Feb 2022 12:08:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r2sm4098170wmq.24.2022.02.08.12.08.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 12:08:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] include: Trim some fat from osdep.h
Date: Tue,  8 Feb 2022 20:08:51 +0000
Message-Id: <20220208200856.3558249-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The osdep.h header is included by every C file we compile, so it helps
build times to keep it small. (As the comment at the top of the file
notes, in an ideal world this header would contain only things that
everybody needs and things where we need to apply a compatibility
workaround on some hosts.) This series trims more than 130 lines from
osdep.h (about 16% of its current size) by splitting some prototypes
that are used only in a few files out into new headers that are
included by those source files that need them.

(Looking at the size of osdep.h itself is not really the right metric,
because the real killer for compile time is going to be all the
system headers it pulls in; but it's easier to measure and looks
better for this series :-))

There's scope for more of this, I think, but there's no need to try to
do everything in one huge patchset.

thanks
-- PMM

Peter Maydell (5):
  include: Move qemu_madvise() and related #defines to new
    qemu/madvise.h
  include: Move qemu_mprotect_*() to new qemu/mprotect.h
  include: Move QEMU_MAP_* constants to mmap-alloc.h
  include: Move qemu_[id]cache_* declarations to new qemu/cacheinfo.h
  include: Move hardware version declarations to new qemu/hw-version.h

 include/qemu/cacheinfo.h   |  21 ++++++
 include/qemu/hw-version.h  |  27 ++++++++
 include/qemu/madvise.h     |  95 ++++++++++++++++++++++++++
 include/qemu/mmap-alloc.h  |  23 +++++++
 include/qemu/mprotect.h    |  14 ++++
 include/qemu/osdep.h       | 132 -------------------------------------
 accel/tcg/translate-all.c  |   1 +
 backends/hostmem-file.c    |   1 +
 backends/hostmem.c         |   1 +
 hw/arm/nseries.c           |   1 +
 hw/ide/core.c              |   1 +
 hw/scsi/megasas.c          |   1 +
 hw/scsi/scsi-bus.c         |   1 +
 hw/scsi/scsi-disk.c        |   1 +
 hw/virtio/virtio-balloon.c |   1 +
 migration/postcopy-ram.c   |   1 +
 migration/qemu-file.c      |   1 +
 migration/ram.c            |   1 +
 plugins/loader.c           |   1 +
 softmmu/physmem.c          |   1 +
 softmmu/vl.c               |   1 +
 target/i386/cpu.c          |   1 +
 target/s390x/cpu_models.c  |   1 +
 tcg/region.c               |   3 +
 tcg/tcg.c                  |   1 +
 util/atomic64.c            |   1 +
 util/cacheflush.c          |   1 +
 util/cacheinfo.c           |   1 +
 util/osdep.c               |   3 +
 util/oslib-posix.c         |   1 +
 30 files changed, 208 insertions(+), 132 deletions(-)
 create mode 100644 include/qemu/cacheinfo.h
 create mode 100644 include/qemu/hw-version.h
 create mode 100644 include/qemu/madvise.h
 create mode 100644 include/qemu/mprotect.h

-- 
2.25.1


