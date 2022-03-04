Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03F54CD36D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 12:29:41 +0100 (CET)
Received: from localhost ([::1]:39342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ67w-00042c-Ok
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 06:29:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ606-0002VY-IN
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:21:34 -0500
Received: from [2a00:1450:4864:20::32c] (port=55870
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ603-0004dp-Gf
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:21:34 -0500
Received: by mail-wm1-x32c.google.com with SMTP id i66so4801346wma.5
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 03:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cYwUVlrJmDcCkID1J7elovzHQrM1WzQMevVmjItgLkU=;
 b=E0/lETEwDng8oU/bIrggCzAjDNa+5WY+MmzDgCZhqZMfhMwN9IVj1T3d4O8/qhwj1C
 ozZHwKLnUMyGC1XkGSCioE8EilCBLVzbobv0Jxqt0yvz4LR6rhjq9jcZ/v/i3PKSb70t
 P5o53BoKp+YxXBE6CfiYFFjDJJdsbsW4Ll3J77kHO1uabfkVpztG4hx5g58+I/bAaehU
 nsNDaxDDNBUd3O5HGMYkVfaDclFR5BplhX+k8MdmFt/r4rBnPb8KOhjbplpS54SyugJq
 FdPQeVzBKy5VYZWM12pIQdWSoJEUu8Yz3hykLggN94g43feAbTLoWy05LFea0bfQ0FG/
 qAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cYwUVlrJmDcCkID1J7elovzHQrM1WzQMevVmjItgLkU=;
 b=MTASEQSBn4c7dm2CbOAEhXMoTBGSsThkE3ZVvKkVHRd6OWXHVuuaZBNjAP85+sLXzz
 II9PMfd2YDWB94Rx9lXjhRjvX4jKM43KHtHW7WTR6mxJFDvogcK85spNwFSyW5S2OL1S
 Usf2HQLvtpa2VqHdp4VbodwVH9WzPfZooNvhxXJZcE5jyHvdwQVBZPlh7MHPBYzycRKL
 co1+4siNVOHdjcdTrlYm8hMIA3QzfM9iFsLf/GYaCrxRBQe5YArqBReFkH7wXwG9lyOP
 +4iyL8F7Vs6WfDFr+jHglcPAdwxKarGYbe6rtqoDkIQyuQNqzSzwRSrZp0db/QuVM8IT
 dURg==
X-Gm-Message-State: AOAM530eQG9qu+WgZHw5ARIj9tMVWUvJRaApxUgS0/cyThOrom7OaqK6
 GAgBC0c+NKgDE40S3jleMW4jI4QQ0qTeXg==
X-Google-Smtp-Source: ABdhPJwblEz+4lUx3wUwn1VAFWsY3T92JJpcBF7mE9oU2gKshKV/DXoWGPAa9AxbcFEQX6KoAUrFjA==
X-Received: by 2002:a05:600c:a06:b0:37b:fdd8:4f8 with SMTP id
 z6-20020a05600c0a0600b0037bfdd804f8mr7403607wmp.41.1646392889204; 
 Fri, 04 Mar 2022 03:21:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfed4e000000b001e3323611e5sm4148651wro.26.2022.03.04.03.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 03:21:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/9] Cleanup of qemu_oom_check() and qemu_memalign()
Date: Fri,  4 Mar 2022 11:21:17 +0000
Message-Id: <20220304112126.2261039-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series does some cleanup of the qemu_oom_check() and
qemu_memalign() functions; I started looking at the first of these and
found myself wanting to tidy some stuff relating to the second in the
process. The TLDR is that this series removes qemu_oom_check() (which
was mostly being misused), unifies the POSIX and Win32 versions of
qemu_memalign() and qemu_try_memalign(), and moves the prototypes out
of osdep.h.

Changes v1->v2:
 * Replacement patch 4, which takes the approach discussed in
   comments on v1 of making all our implementations handle
   size == 0 by doing a size 1 allocation
 * two #include lines accidentally added in patch 7 are
   moved to patch 6 where they belong (fixes compile failure
   during bisect)

Patch 4 is the only one needing review.

(When I came to make this change I decided that there was
just a bit more involved than I was happy making in passing
while assembling a pull request.)

thanks
-- PMM


Peter Maydell (9):
  hw/usb/redirect.c: Stop using qemu_oom_check()
  util: Make qemu_oom_check() a static function
  util: Unify implementations of qemu_memalign()
  util: Return valid allocation for qemu_try_memalign() with zero size
  meson.build: Don't misdetect posix_memalign() on Windows
  util: Share qemu_try_memalign() implementation between POSIX and
    Windows
  util: Use meson checks for valloc() and memalign() presence
  util: Put qemu_vfree() in memalign.c
  osdep: Move memalign-related functions to their own header

 meson.build                    |  7 ++-
 include/qemu-common.h          |  2 -
 include/qemu/memalign.h        | 61 ++++++++++++++++++++++
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
 util/memalign.c                | 92 ++++++++++++++++++++++++++++++++++
 util/oslib-posix.c             | 46 -----------------
 util/oslib-win32.c             | 35 -------------
 util/qht.c                     |  1 +
 util/meson.build               |  1 +
 59 files changed, 224 insertions(+), 107 deletions(-)
 create mode 100644 include/qemu/memalign.h
 create mode 100644 util/memalign.c

-- 
2.25.1


