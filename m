Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B1B4C5743
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 19:09:44 +0100 (CET)
Received: from localhost ([::1]:60514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO1Vn-0008N0-F1
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 13:09:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1Th-0005Yc-Pr
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:34 -0500
Received: from [2a00:1450:4864:20::335] (port=42499
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1Tc-0004N9-C9
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:31 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 r187-20020a1c2bc4000000b003810e6b192aso3610381wmr.1
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 10:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uLHa+nT92JeIejSVDLTnljZQl9EsZLPID9y2RXR7+Tw=;
 b=i5uCqHcuyI+LJh5ABnitxpWpbbCRzk6cuRL2fgASvz+GBc6L1TYmSbUNaKaW0neZUL
 env3gc/5nzpEi3kQ9hQatWYGLkEoBbP/b2HDqY7q4zyw4Dmup0hFTl7w0kraISvWfktK
 yDs3BLty7s8MP68iSf5fK7UFzBt+KgdZIA4CCRoU3g4N3yCiVKV4p8nKNoJuTMMqmage
 7OYNyCR8B1g9Ln1+SU27jN0BFH0kVrmAeL8mxdu53pSQfAjfkMZOhFB8wgS8oWJkrXVb
 UW513miT+hZ1YDuLXjB6spa14ZaPyRI3WrY0twQhUeUBEWb2E/9ukpTqRyvGT+gISKDh
 jY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uLHa+nT92JeIejSVDLTnljZQl9EsZLPID9y2RXR7+Tw=;
 b=LjLz+evL/FyOe2FeXm3xJ2D1ynneFe1C2cOqm8JP/7kK29F9cEMXU6MO/wL36vE0oj
 9GEkA/KQ+ppIAhSAc/8Veo7Ay/C6cjzp7VKI6MPtjWsfpScdleLc1YtEEuioiiUit7Jr
 BMhrPVAt0LUce8zaKlpbyWGydNOM1FirrUo4WBD2WQYo1cEmFK+PdwvF/EnwX8F2blmM
 dZvNmDXPDcpByBlKL3hplgTZQgjlFHgiXCSPA7fWLnbQcM1y7pc3+V+4rzNGKptK7CWW
 jwagqUXKJ8PhiN+Myk37MTDSC0q2McYw8E53Q9zcasmS9bFOwAE+eKM/7+WMrFVRmAY2
 922A==
X-Gm-Message-State: AOAM532BFvkUpCoOiK87z/K25kZhkGIALdZ2BjaFVizW8i/Ev3XNaRGf
 nG3eJyUnPf1BN6hUkyy5jNuslzt4xAq8Zw==
X-Google-Smtp-Source: ABdhPJzh4X3C7AX2iRE9Ld13mtEFKd0BL+e4PmUMhp3nIaNNVoMx58TdlucG+3eNA1zwyborJj9v9g==
X-Received: by 2002:a7b:c8d1:0:b0:381:4eb9:8084 with SMTP id
 f17-20020a7bc8d1000000b003814eb98084mr1878112wml.120.1645898846341; 
 Sat, 26 Feb 2022 10:07:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adfe64f000000b001e60965a5d4sm5622409wrn.44.2022.02.26.10.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 10:07:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] Cleanup of qemu_oom_check() and qemu_memalign()
Date: Sat, 26 Feb 2022 18:07:14 +0000
Message-Id: <20220226180723.1706285-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series does some cleanup of the qemu_oom_check() and
qemu_memalign() functions; I started looking at the first of these and
found myself wanting to tidy some stuff relating to the second in the
process. The TLDR is that this series removes qemu_oom_check() (which
was mostly being misused), unifies the POSIX and Win32 versions of
qemu_memalign() and qemu_try_memalign(), and moves the prototypes out
of osdep.h.

qemu_oom_check() is a function which essentially says "if you pass me
a NULL pointer then print a message and abort()".  On POSIX systems
the message includes strerror(errno); on Windows it includes the
GetLastError() error value printed as an integer.  Other than in the
implementation of qemu_memalign(), we use this function only in
hw/usb/redirect.c, for three checks:
 * on a call to usbredirparser_create()
 * on a call to usberedirparser_serialize()
 * on a call to malloc()

The usbredir library API functions make no guarantees that they will
set errno on errors, let alone that they might set the
Windows-specific GetLastError string. So in 2/3 of the cases using
qemu_oom_check() is definitely wrong, and in the third it's dubious
given that Windows malloc() doesn't set GetLastError (more on that
later). So we start by switching these 3 calls to simple in-line error
checking code, which means we can make qemu_oom_check() not a public
global function.

So now we have a qemu_oom_check() which is used only in
qemu_memalign() and whose major difference between the Windows and
POSIX versions is that the former prints the GetLastError error number
value. This is actually a bug -- in commit dfbd0b873a85021 in 2020 we
changed the implementation of qemu_try_memalign() from using
VirtualAlloc() without noticing that this also should imply changing
what we print in the error case. So we can switch to a single
shared qemu_memalign() which does the error check directly itself
and always prints errno (and the requested size and alignment,
which seem more useful if anybody needs to diagnose the problem).

qemu_try_memalign() also is very similar between POSIX and Windows
versions (it used to be less so, but we have gradually ended up
with the two versions quite similar). The POSIX version already
has an ifdef ladder for different kinds of "allocate aligned
memory" host functions, so it seems neater to just have Windows'
_aligned_malloc() be another ladder in that ifdef rather than
a totally separate function.

Finally, I put the qemu_memalign() and related function prototypes
into a new memalign.h header, because that gets them out of osdep.h
and into somewhere that only the files that care about these functions
need to include.

thanks
--PMM

Peter Maydell (9):
  hw/usb/redirect.c: Stop using qemu_oom_check()
  util: Make qemu_oom_check() a static function
  util: Unify implementations of qemu_memalign()
  util/oslib-win32: Return NULL on qemu_try_memalign() with zero size
  meson.build: Don't misdetect posix_memalign() on Windows
  util: Share qemu_try_memalign() implementation between POSIX and
    Windows
  util: Use meson checks for valloc() and memalign() presence
  util: Put qemu_vfree() in memalign.c
  osdep: Move memalign-related functions to their own header

 meson.build                    |  7 ++-
 include/qemu-common.h          |  2 -
 include/qemu/memalign.h        | 61 +++++++++++++++++++++++
 include/qemu/osdep.h           | 18 -------
 block/blkverify.c              |  1 +
 block/block-copy.c             |  1 +
 block/commit.c                 |  1 +
 block/crypto.c                 |  1 +
 block/dmg.c                    |  1 +
 block/export/fuse.c            |  1 +
 block/file-posix.c             |  1 +
 block/io.c                     |  1 +
 block/mirror.c                 |  1 +
 block/nvme.c                   |  1 +
 block/parallels-ext.c          |  1 +
 block/parallels.c              |  1 +
 block/qcow.c                   |  1 +
 block/qcow2-cache.c            |  1 +
 block/qcow2-cluster.c          |  1 +
 block/qcow2-refcount.c         |  1 +
 block/qcow2-snapshot.c         |  1 +
 block/qcow2.c                  |  1 +
 block/qed-l2-cache.c           |  1 +
 block/qed-table.c              |  1 +
 block/qed.c                    |  1 +
 block/quorum.c                 |  1 +
 block/raw-format.c             |  1 +
 block/vdi.c                    |  1 +
 block/vhdx-log.c               |  1 +
 block/vhdx.c                   |  1 +
 block/vmdk.c                   |  1 +
 block/vpc.c                    |  1 +
 block/win32-aio.c              |  1 +
 hw/block/dataplane/xen-block.c |  1 +
 hw/block/fdc.c                 |  1 +
 hw/ide/core.c                  |  1 +
 hw/ppc/spapr.c                 |  1 +
 hw/ppc/spapr_softmmu.c         |  1 +
 hw/scsi/scsi-disk.c            |  1 +
 hw/tpm/tpm_ppi.c               |  2 +-
 hw/usb/redirect.c              | 17 +++++--
 nbd/server.c                   |  1 +
 net/l2tpv3.c                   |  2 +-
 plugins/loader.c               |  1 +
 qemu-img.c                     |  1 +
 qemu-io-cmds.c                 |  1 +
 qom/object.c                   |  1 +
 softmmu/physmem.c              |  1 +
 target/i386/hvf/hvf.c          |  1 +
 target/i386/kvm/kvm.c          |  1 +
 tcg/region.c                   |  1 +
 tests/bench/atomic_add-bench.c |  1 +
 tests/bench/qht-bench.c        |  1 +
 util/atomic64.c                |  1 +
 util/memalign.c                | 88 ++++++++++++++++++++++++++++++++++
 util/oslib-posix.c             | 46 ------------------
 util/oslib-win32.c             | 35 --------------
 util/qht.c                     |  1 +
 util/meson.build               |  1 +
 59 files changed, 220 insertions(+), 107 deletions(-)
 create mode 100644 include/qemu/memalign.h
 create mode 100644 util/memalign.c

-- 
2.25.1


