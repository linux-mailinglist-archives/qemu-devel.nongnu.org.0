Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AF0591905
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 08:21:32 +0200 (CEST)
Received: from localhost ([::1]:57720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMkWY-0001CH-Uq
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 02:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oMkRi-0007CB-PC
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 02:16:31 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oMkRg-00016w-J7
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 02:16:30 -0400
Received: by mail-wr1-x429.google.com with SMTP id l4so3178548wrm.13
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 23:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:user-agent:from:to:cc;
 bh=J/yu8t65NuL3it7Gj/+Z69nS+R4m955LsB8cz2h6Gw4=;
 b=ARGCnlBaUIxYmgfDnXTN7BijtQCCeLvgt6DvmEknKsBxPBMrgKrbLl/HvAmi6cG5Yl
 SEfNfWj+TwZ7NR9yoP7aVc2YjxnDqXqvv84VFWQsqleZgYxoR7S7T9zpDok8Fj8H4duG
 hpjEkO4topD8Od6W30wAOOkxvX9B4idqnX5a6njt+eNOe8V9hpOWhBGKa23zmvQWIJ9A
 CXEE65RWFnQajY0ALtHveZ+yHmQg9nzfHfvcMnzCwMT9p6daP/+dqF40tR17byNcc8NU
 knZQD2kfUgQSHlOdQG3xulCctMP3BZPFJUL9Tcyibr8CVtA/r781yFvCCHJlypNOTCqc
 ekdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:user-agent:x-gm-message-state:from:to:cc;
 bh=J/yu8t65NuL3it7Gj/+Z69nS+R4m955LsB8cz2h6Gw4=;
 b=FLCwJ19JBIrq9LsvspeoGGk/fJzur0DSgYBCQHEMqe+T1Oty2ualNqdCSTbfA561xP
 uyc1AapMFLUhXYy9ef/Xse02ji5+x3byun4zYwlbtfDbaTHuyokE6zhMpeNSjtdDNRv7
 XjhkLyXAu3aNLUfgNBCZxNsCSr9CY2aF30k3ByFe/isPD2HvfE71E/yGV19iITfOk1Z4
 55hSIvuCVD5pt2aH1WwxGdbjYhPDg07w/zu9kif9808h9EGNTGnBQlAq3e6kF4kKG/Dr
 gv2vDdSPGtehr71jjc/N80m/RO4ziHTQgKgyy9ZR7Y+VdEd8J33IAweypQtiKdeHr0jE
 zt0w==
X-Gm-Message-State: ACgBeo06JrrzGbacgOMXhE+ZfGAuDxvTWJYdiV4oOBTROCOoJiK8kQmF
 qsm3EfLcEGOI5T4Ei3qWwJ0uOA==
X-Google-Smtp-Source: AA6agR6xm6L3RdD90D6p1ndDyTQrBJ4h5Xod2Dfx3p1+nfrumnW48VwuVwTOAXwxTx2I39DWzRvt/Q==
X-Received: by 2002:a5d:47c4:0:b0:21f:e92:7ba1 with SMTP id
 o4-20020a5d47c4000000b0021f0e927ba1mr3662631wrc.408.1660371386633; 
 Fri, 12 Aug 2022 23:16:26 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bg6-20020a05600c3c8600b003a308e9a192sm1787096wmb.30.2022.08.12.23.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 23:16:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 318C11FFB7;
 Sat, 13 Aug 2022 07:16:25 +0100 (BST)
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>
Subject: Info about the slowest avocado tcg tests (arm, s390x, ppc, replay)
Date: Sat, 13 Aug 2022 07:10:32 +0100
Message-ID: <87r11kpt1j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

[RESEND because the ML ate my email again]

Hi All,

In my investigations into our current Avocado tests I identified all
that ran for more than 30s for an --enable-debug build. They are:

  tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2: PASS( 7=
63.81 s)
  tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3: PASS( 7=
42.75 s)

The main slowness here is due to inefficient TB invalidation of code
generated during the firmware phase when the rest of the system boots.

  tests/avocado/boot_linux.py:BootLinuxS390X.test_s390_ccw_virtio_tcg:  PAS=
S( 433.48 s)

This looks like a very fat distro. A lot of slow delays waiting for
systemd units to come up. That said the positively svelte Alpine ISO
still takes about 4min30s to churn through it's userspace boot.

Looking at the callchains though it might be helped by the same fixes as
the ARM tcg GIC tests:

-   28.15%     0.16%  qemu-system-s39  qemu-system-s390x             [.] st=
ore_helper
   - 27.99% store_helper
      - 23.08% notdirty_write
         - 17.51% page_collection_lock
              2.76% page_trylock_add
              1.22% g_tree_lookup
              0.62% g_tree_find_node
         - 4.53% tb_invalidate_phys_page_fast
            - 4.37% tb_invalidate_phys_page_range__locked
               - 3.44% tb_phys_invalidate__locked
                  - 3.44% do_tb_phys_invalidate
                       3.40% tb_page_remove
           0.63% page_trylock_add
      - 4.25% tlb_fill
         - 4.21% s390_cpu_tlb_fill
            - 2.35% mmu_translate
               - 1.77% mmu_translate_asce
                  - 1.58% read_table_entry
                     - 1.39% address_space_read_full
                        - 1.11% flatview_read
                           - 0.62% flatview_translate
                                0.55% flatview_do_translate
            - 1.70% tlb_set_page
               - 1.64% tlb_set_page_with_attrs
                    0.52% cpu_physical_memory_is_clean
-   25.10%     0.02%  qemu-system-s39  qemu-system-s390x             [.] no=
tdirty_write
   - 25.08% notdirty_write
      - 18.14% page_collection_lock
           2.84% page_trylock_add
           1.25% g_tree_lookup
           0.64% g_tree_find_node
      - 5.86% tb_invalidate_phys_page_fast
         - 5.69% tb_invalidate_phys_page_range__locked
            - 4.62% tb_phys_invalidate__locked
               - 4.62% do_tb_phys_invalidate
                    4.57% tb_page_remove
        0.65% page_trylock_add

There might be some millage looking at the tb_jmp_cache utilisation
though because it looks like pretty much all tb_lookup falls through to
the full QHT lookup:

-   19.82%     1.65%  qemu-system-s39  qemu-system-s390x             [.] tb=
_lookup
   - 18.17% tb_lookup
      - 17.84% tb_htable_lookup
         - 9.94% get_page_addr_code
            - 9.66% get_page_addr_code_hostp
               - 5.55% tlb_fill
                  - 5.48% s390_cpu_tlb_fill
                     - 3.55% mmu_translate
                        - 2.73% mmu_translate_asce
                           - 2.44% read_table_entry
                              - 2.17% address_space_read_full
                                 - 1.72% flatview_read
                                    - 0.93% flatview_translate
                                       - 0.83% flatview_do_translate
                                            0.58% address_space_translate_i=
nternal
                        - 0.54% mmu_absolute_addr_valid
                             0.51% address_space_access_valid
                     - 1.73% tlb_set_page
                        - 1.64% tlb_set_page_with_attrs
                             0.54% tlb_flush_vtlb_page_locked
               - 1.56% qemu_ram_addr_from_host_nofail
                  - 1.40% qemu_ram_addr_from_host
                       1.17% qemu_ram_block_from_host
                 0.73% tlb_entry
         - 4.30% qht_lookup_custom
            - 1.90% qht_do_lookup
                 1.21% tb_lookup_cmp
              1.59% seqlock_read_begin
         - 2.82% tb_hash_func
            - 2.66% qemu_xxhash6
               - 2.35% qemu_xxhash7
                    rol32

  tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg: PASS( 341.90=
 s)
  tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg: PASS( 240.=
76 s)
  tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg: PASS( 221.70 =
s)

Nothing especially jumps out of perf (in fact it looks very similar to
s390x):

   6.40%  qemu-system-ppc  qemu-system-ppc64        [.] tb_lookup
   5.63%  qemu-system-ppc  qemu-system-ppc64        [.] check_regs
   4.87%  qemu-system-ppc  qemu-system-ppc64        [.] hreg_compute_hflags=
_value
   4.21%  qemu-system-ppc  qemu-system-ppc64        [.] pmu_increment_insns
   2.42%  qemu-system-ppc  qemu-system-ppc64        [.] helper_insns_inc
   2.26%  qemu-system-ppc  qemu-system-ppc64        [.] cpu_get_tb_cpu_state
   2.20%  qemu-system-ppc  qemu-system-ppc64        [.] type_get_parent
   2.07%  qemu-system-ppc  qemu-system-ppc64        [.] helper_lookup_tb_ptr
   1.96%  qemu-system-ppc  [kernel.kallsyms]        [k] list_lru_count_one
   1.63%  qemu-system-ppc  qemu-system-ppc64        [.] type_is_ancestor
   1.62%  qemu-system-ppc  qemu-system-ppc64        [.] helper_vsldoi
   1.49%  qemu-system-ppc  qemu-system-ppc64        [.] la_reset_pref
   1.14%  qemu-system-ppc  qemu-system-ppc64        [.] seqlock_read_begin
   1.02%  qemu-system-ppc  qemu-system-ppc64        [.] liveness_pass_1
   0.97%  qemu-system-ppc  [kernel.kallsyms]        [k] _raw_spin_lock
   0.81%  qemu-system-ppc  qemu-system-ppc64        [.] curr_cflags
   0.76%  qemu-system-ppc  libglib-2.0.so.0.5600.4  [.] g_hash_table_lookup
   0.75%  qemu-system-ppc  qemu-system-ppc64        [.] check_for_breakpoin=
ts
   0.75%  qemu-system-ppc  qemu-system-ppc64        [.] tb_jmp_cache_hash_f=
unc=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

which all looks fairly typical for --debug code with heavy computed
jumps (triggering a lot of tb_lookups).

  tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu: WARN( 91.80 s)
  tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_strict: WARN( 91=
.47 s)
  tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_pt: WARN( 91.36 =
s)
  tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_strict_cm: WARN(=
 88.56 s)

These all end with WARN so could be broken anyway and just timing out.
Didn't dig in too deeply.

  tests/avocado/replay_kernel.py:ReplayKernelNormal.test_arm_cubieboard_ini=
trd: PASS( 63.24 s)
  tests/avocado/replay_kernel.py:ReplayKernelNormal.test_sparc_ss20: PASS( =
59.36 s)

This could just be replay being inherently slow given it runs several
times under icount.

  tests/avocado/boot_xen.py:BootXen.test_arm64_xen_411_and_dom0: PASS( 57.1=
5 s)
  tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd=
: PASS( 55.00 s)
  tests/avocado/machine_aspeed.py:AST2x00Machine.test_arm_ast2500_romulus_o=
penbmc_v2_9_0: PASS( 52.73 s)
  tests/avocado/boot_linux_console.py:BootLinuxConsole.test_x86_64_pc: PASS=
( 51.08 s)
  tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_xlnx_ve=
rsal_virt: PASS( 47.98 s)
  tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_ast2600_deb=
ian: PASS( 47.48 s)
  tests/avocado/linux_initrd.py:LinuxInitrd.test_with_2gib_file_should_work=
_with_linux_v4_16: PASS( 45.29 s)
  tests/avocado/machine_aspeed.py:AST2x00Machine.test_arm_ast2400_palmetto_=
openbmc_v2_9_0: PASS( 44.54 s)
  tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_in=
itrd: PASS( 40.96 s)
  tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_exynos4210_=
initrd: PASS( 37.70 s)
  tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_cubieboard_=
initrd: PASS( 34.29 s)
  tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_cubieboard_=
sata: PASS( 33.19 s)

--=20
Alex Benn=C3=A9e

