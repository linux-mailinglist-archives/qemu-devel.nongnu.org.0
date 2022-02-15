Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0BE4B73F6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:06:55 +0100 (CET)
Received: from localhost ([::1]:44988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK1Hw-00023c-Nt
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:06:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK1D3-0004vf-VM
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:01:51 -0500
Received: from [2607:f8b0:4864:20::434] (port=34463
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK1D1-0007av-SY
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:01:49 -0500
Received: by mail-pf1-x434.google.com with SMTP id g1so16080443pfv.1
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 09:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qKNx/hUMMdUpgOrn9IAyD8EGaw4inpSUg6uvueEzEgo=;
 b=QDVWbauedMl0PiLjTuqHq5MmapM8vtr6ey4yTCvODJZYF6Kgz0qd8RMtleF14zF4Pu
 BWxovG92MFkkjk63ohottThOf/Xo3/ze/UiUgKvWc+MHKDrCZZGT3HfhGESG+6foabd9
 BOIZvBcx/jEz7fco/dDHip5DnoMrJXPnRaPCKTOntwK9fU6n8Ew4lavNvzZgj6/2Gi7j
 n4N/cUugIbw9HQwt2uUZ8SAnligAlLz1eDoTLhR4Ch1nWpqyLfpXSbG4xVOLilxhwZhM
 14IZMrJYTJEBmgsC16kWMLNMAlFn6xwk5aAASrPTt3WDwfENmwIhiG2cqXcidNqtN8cA
 kt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qKNx/hUMMdUpgOrn9IAyD8EGaw4inpSUg6uvueEzEgo=;
 b=7Ogjex6jvfE0bT9rbAhAOQ2aVktzba0zbvk5mLe8Hzpzcjk/wF1nVYzg+qnMEjDOIY
 uSB3DftsWz1eEBFz1reEJb9lNp9bByv352gxEP1lOFgmHVsdaFLSEKViDGexZr13GSF7
 NPio9HD89uH5p3/Ytz60Xb0VOBNYSob3otIhY3+ROWxgwdZm39EViWUO36+B4Mr9Bqv6
 RyUsnnYrZ6g6ZxREMvS7qd1VB9RU4ueKQ738rA4Mx1yySEF5ltnVP8PxfST6xn4L/fvI
 Z9BF6iDJHxrkJYUQib8iQXKJUA4VjH+LZ5XCDTNfRMsUxch6ztOc+FjSkL3cNfCfda99
 b1Rg==
X-Gm-Message-State: AOAM533GuyKNZjbYrq41I1U1RzhwYOBbVx7ECvzEVFAaOogW0v2cBQTF
 y7eEDlMqFDiHaihf5UQLWpn2lbUD5jc=
X-Google-Smtp-Source: ABdhPJzW48Aswjn3DBCKzbkvewuinWMDL9CWZaB/Tcj7JuLCo2a2hFQeiMGbfV3Xzc/R/ytiziYYlA==
X-Received: by 2002:a63:101a:: with SMTP id f26mr4161408pgl.563.1644944506354; 
 Tue, 15 Feb 2022 09:01:46 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id 16sm17650365pje.34.2022.02.15.09.01.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 09:01:46 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 4/8] configure: Disable out-of-line atomic operations on
 Aarch64
Date: Tue, 15 Feb 2022 18:01:02 +0100
Message-Id: <20220215170106.95848-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215170106.95848-1-f4bug@amsat.org>
References: <20220215170106.95848-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

GCC 10.1 introduced the -moutline-atomics option on Aarch64.
This options is enabled by default, and triggers a link failure:

  Undefined symbols for architecture arm64:
    "___aarch64_cas1_acq_rel", referenced from:
        _qmp_migrate_recover in migration_migration.c.o
        _cpu_atomic_cmpxchgb_mmu in accel_tcg_cputlb.c.o
        _cpu_atomic_fetch_sminb_mmu in accel_tcg_cputlb.c.o
        _cpu_atomic_fetch_uminb_mmu in accel_tcg_cputlb.c.o
        _cpu_atomic_fetch_smaxb_mmu in accel_tcg_cputlb.c.o
        _cpu_atomic_fetch_umaxb_mmu in accel_tcg_cputlb.c.o
        _cpu_atomic_smin_fetchb_mmu in accel_tcg_cputlb.c.o
        ...
    "___aarch64_ldadd4_acq_rel", referenced from:
        _multifd_recv_new_channel in migration_multifd.c.o
        _monitor_event in monitor_hmp.c.o
        _handle_hmp_command in monitor_hmp.c.o
        _colo_compare_finalize in net_colo-compare.c.o
        _flatview_unref in softmmu_memory.c.o
        _virtio_scsi_hotunplug in hw_scsi_virtio-scsi.c.o
        _tcg_register_thread in tcg_tcg.c.o
        ...
    "___aarch64_swp4_acq", referenced from:
        _qemu_spin_lock in softmmu_cpu-timers.c.o
        _cpu_get_ticks in softmmu_cpu-timers.c.o
        _qemu_spin_lock in softmmu_icount.c.o
        _cpu_exec in accel_tcg_cpu-exec.c.o
        _page_flush_tb_1.isra.0 in accel_tcg_translate-all.c.o
        _page_entry_lock in accel_tcg_translate-all.c.o
        _do_tb_phys_invalidate in accel_tcg_translate-all.c.o
        ...

QEMU implements its own atomic operations using C11 builtin helpers.
Disable the GCC out-of-line atomic ops.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>

Clearly out of my understanding, but at least it links and the qtests
pass.
---
 configure | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/configure b/configure
index 06c03cebd3..3217aa22cb 100755
--- a/configure
+++ b/configure
@@ -2826,6 +2826,18 @@ else
   avx512f_opt="no"
 fi
 
+#########################################
+# Disable out-of-line atomic operations.
+
+case "$cpu" in
+  aarch64)
+    write_c_skeleton;
+    if compile_prog "$CPU_CFLAGS -Werror -mno-outline-atomics" "" ; then
+      CPU_CFLAGS="-mno-outline-atomics $CPU_CFLAGS"
+    fi
+    ;;
+esac
+
 ########################################
 # check if __[u]int128_t is usable.
 
-- 
2.34.1


