Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530D642EA84
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:49:27 +0200 (CEST)
Received: from localhost ([::1]:57094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbHy2-0007dv-6Y
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvM-00050E-6O
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:46:40 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:36614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvJ-0001gr-CX
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:46:39 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 75so7874186pga.3
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UnajrcLsGVqhN+SJFdFWj8vkYMlelshM+jHBiJLI8YQ=;
 b=G3Ty819zQWhtxZ2e41olRxy+mJFymWhVW/jQsjzdFqTt3z2FmvFDxN4hXkvLAeVqq0
 rXi3tYUQ/8+TLljMEXT/nnwiQva0Amjw/ZIZtPkq/O1VVc8LoPTmbyStltfojNNLAz0W
 bjc4THd1c1/YYqOm5cD6DLo4ZK6RKOylRgX/iVgxXISSDghoDllJsNKvvnxHT0478XLF
 msPGfJa4ldr/TiYX7Cj9iDAiQ+8QJwMOoujrWtEyqUs2UDhnNT7YfeeofRtpNr91wzTP
 0WGvorV2xvaz9lyP67mKKFvAq69uL9UXhDCg+NZ7ZgCOkS750VkV1VsJWEawQxtM/eyh
 jQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UnajrcLsGVqhN+SJFdFWj8vkYMlelshM+jHBiJLI8YQ=;
 b=Qp2d5263m54EB39zxyPLDk9LfccjCa/wxQamhfwFZH0JoTVFf+Rdltb+mQmrwIe920
 Kfa6bSlhimxeWSdWo24eKv2cl6nNbqgPt4WVYFNlJTQ3ovADniGqdUXbNgzMvS1gLeqp
 /uzVBztJNbTlvxqMA6RB/71Ulvr7B0I95pVsnk68g3dFc4Z/+du0+yUdxNBh9a2Ji7Aq
 Rgdm/GuVf8djjV3ukfkgR6sxXDNvmtXbe8LkDS1jyK4oFeAABL3VbF7talLapmFFZLym
 9G6QIAgfDEB2MfdIT7gi7iy1RUTXhcCrE3kR8nMebNRVhNcRbJDYO5/5XSbk7OcctyVA
 s9oA==
X-Gm-Message-State: AOAM531MFi6vyGrMkm5HgbXhS3DD+vApyqpYif/mcY9QjzYJZQg2JpZg
 zAzPqTIt0AWXmbATbC/+aiKPDbwuH6cDs+rt
X-Google-Smtp-Source: ABdhPJz/6XtQ6RHu07t6eEMm1VjsLbWSamJep3s8QKdtfj/Un97hLbPmAcuyzmHmc/ClUSM1Y0tEEg==
X-Received: by 2002:a63:3606:: with SMTP id d6mr4739829pga.271.1634283995346; 
 Fri, 15 Oct 2021 00:46:35 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:46:35 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 00/78] support vector extension v1.0
Date: Fri, 15 Oct 2021 15:45:01 +0800
Message-Id: <20211015074627.3957162-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Frank Chang <frank.chang@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

This patchset implements the vector extension v1.0 for RISC-V on QEMU.

RVV v1.0 spec is now fronzen for public review:
https://github.com/riscv/riscv-v-spec/releases/tag/v1.0

The port is available here:
https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v8

RVV v1.0 can be enabled with -cpu option: v=true and specify vext_spec
option to v1.0 (i.e. vext_spec=v1.0)

Note: This patchset depends on other patchsets listed in Based-on
      section below so it is not able to be built unless those patchsets
      are applied.

Changelog:

v8
  * Use {get,dest}_gpr APIs.
  * remove vector AMO instructions.
  * rename vpopc.m to vcpop.m.
  * rename vle1.v and vse1.v to vlm.v and vsm.v.
  * rename vmandnot.mm and vmornot.mm to vmandn.mm and vmorn.mm.

v7
  * remove hardcoded GDB vector registers list.
  * add vsetivli instruction.
  * add vle1.v and vse1.v instructions.

v6
  * add vector floating-point reciprocal estimate instruction.
  * add vector floating-point reciprocal square-root estimate instruction.
  * update check rules for segment register groups, each segment register
    group has to follow overlap rules.
  * update viota.m instruction check rules.

v5
  * refactor RVV v1.0 check functions.
    (Thanks to Richard Henderson's bitwise tricks.)
  * relax RV_VLEN_MAX to 1024-bits.
  * implement vstart CSR's behaviors.
  * trigger illegal instruction exception if frm is not valid for
    vector floating-point instructions.
  * rebase on riscv-to-apply.next.

v4
  * remove explicit float flmul variable in DisasContext.
  * replace floating-point calculations with shift operations to
    improve performance.
  * relax RV_VLEN_MAX to 512-bits.

v3
  * apply nan-box helpers from Richard Henderson.
  * remove fp16 api changes as they are sent independently in another
    pathcset by Chih-Min Chao.
  * remove all tail elements clear functions as tail elements can
    retain unchanged for either VTA set to undisturbed or agnostic.
  * add fp16 nan-box check generator function.
  * add floating-point rounding mode enum.
  * replace flmul arithmetic with shifts to avoid floating-point
    conversions.
  * add Zvqmac extension.
  * replace gdbstub vector register xml files with dynamic generator.
  * bumped to RVV v1.0.
  * RVV v1.0 related changes:
    * add vl<nf>re<eew>.v and vs<nf>r.v vector whole register
      load/store instructions
    * add vrgatherei16 instruction.
    * rearranged bits in vtype to make vlmul bits into a contiguous
      field.

v2
  * drop v0.7.1 support.
  * replace invisible return check macros with functions.
  * move mark_vs_dirty() to translators.
  * add SSTATUS_VS flag for s-mode.
  * nan-box scalar fp register for floating-point operations.
  * add gdbstub files for vector registers to allow system-mode
    debugging with GDB.

Based-on: <20211015065500.3850513-1-frank.chang@sifive.com>
Based-on: <20211015070307.3860984-1-frank.chang@sifive.com>

Frank Chang (73):
  target/riscv: fix TB_FLAGS bits overlapping bug for rvv/rvh
  target/riscv: drop vector 0.7.1 and add 1.0 support
  target/riscv: Use FIELD_EX32() to extract wd field
  target/riscv: rvv-1.0: introduce writable misa.v field
  target/riscv: rvv-1.0: add translation-time vector context status
  target/riscv: rvv-1.0: remove rvv related codes from fcsr registers
  target/riscv: rvv-1.0: check MSTATUS_VS when accessing vector csr
    registers
  target/riscv: rvv-1.0: remove MLEN calculations
  target/riscv: rvv-1.0: add fractional LMUL
  target/riscv: rvv-1.0: add VMA and VTA
  target/riscv: rvv-1.0: update check functions
  target/riscv: introduce more imm value modes in translator functions
  target/riscv: rvv:1.0: add translation-time nan-box helper function
  target/riscv: rvv-1.0: remove amo operations instructions
  target/riscv: rvv-1.0: configure instructions
  target/riscv: rvv-1.0: stride load and store instructions
  target/riscv: rvv-1.0: index load and store instructions
  target/riscv: rvv-1.0: fix address index overflow bug of indexed
    load/store insns
  target/riscv: rvv-1.0: fault-only-first unit stride load
  target/riscv: rvv-1.0: load/store whole register instructions
  target/riscv: rvv-1.0: update vext_max_elems() for load/store insns
  target/riscv: rvv-1.0: take fractional LMUL into vector max elements
    calculation
  target/riscv: rvv-1.0: floating-point square-root instruction
  target/riscv: rvv-1.0: floating-point classify instructions
  target/riscv: rvv-1.0: count population in mask instruction
  target/riscv: rvv-1.0: find-first-set mask bit instruction
  target/riscv: rvv-1.0: set-X-first mask bit instructions
  target/riscv: rvv-1.0: iota instruction
  target/riscv: rvv-1.0: element index instruction
  target/riscv: rvv-1.0: allow load element with sign-extended
  target/riscv: rvv-1.0: register gather instructions
  target/riscv: rvv-1.0: integer scalar move instructions
  target/riscv: rvv-1.0: floating-point move instruction
  target/riscv: rvv-1.0: floating-point scalar move instructions
  target/riscv: rvv-1.0: whole register move instructions
  target/riscv: rvv-1.0: integer extension instructions
  target/riscv: rvv-1.0: single-width averaging add and subtract
    instructions
  target/riscv: rvv-1.0: single-width bit shift instructions
  target/riscv: rvv-1.0: integer add-with-carry/subtract-with-borrow
  target/riscv: rvv-1.0: narrowing integer right shift instructions
  target/riscv: rvv-1.0: widening integer multiply-add instructions
  target/riscv: rvv-1.0: single-width saturating add and subtract
    instructions
  target/riscv: rvv-1.0: integer comparison instructions
  target/riscv: rvv-1.0: floating-point compare instructions
  target/riscv: rvv-1.0: mask-register logical instructions
  target/riscv: rvv-1.0: slide instructions
  target/riscv: rvv-1.0: floating-point slide instructions
  target/riscv: rvv-1.0: narrowing fixed-point clip instructions
  target/riscv: rvv-1.0: single-width floating-point reduction
  target/riscv: rvv-1.0: widening floating-point reduction instructions
  target/riscv: rvv-1.0: single-width scaling shift instructions
  target/riscv: rvv-1.0: remove widening saturating scaled multiply-add
  target/riscv: rvv-1.0: remove vmford.vv and vmford.vf
  target/riscv: rvv-1.0: remove integer extract instruction
  target/riscv: rvv-1.0: floating-point min/max instructions
  target/riscv: introduce floating-point rounding mode enum
  target/riscv: rvv-1.0: floating-point/integer type-convert
    instructions
  target/riscv: rvv-1.0: widening floating-point/integer type-convert
  target/riscv: add "set round to odd" rounding mode helper function
  target/riscv: rvv-1.0: narrowing floating-point/integer type-convert
  target/riscv: rvv-1.0: relax RV_VLEN_MAX to 1024-bits
  target/riscv: rvv-1.0: implement vstart CSR
  target/riscv: rvv-1.0: trigger illegal instruction exception if frm is
    not valid
  target/riscv: rvv-1.0: set mstatus.SD bit when writing vector CSRs
  target/riscv: rvv-1.0: floating-point reciprocal square-root estimate
    instruction
  target/riscv: rvv-1.0: floating-point reciprocal estimate instruction
  target/riscv: set mstatus.SD bit when writing fp CSRs
  target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11
  target/riscv: rvv-1.0: add vsetivli instruction
  target/riscv: rvv-1.0: add evl parameter to vext_ldst_us()
  target/riscv: rvv-1.0: add vector unit-stride mask load/store insns
  target/riscv: rvv-1.0: rename vmandnot.mm and vmornot.mm to vmandn.mm
    and vmorn.mm
  target/riscv: rvv-1.0: update opivv_vadc_check() comment

Greentime Hu (1):
  target/riscv: rvv-1.0: add vlenb register

Hsiangkai Wang (1):
  target/riscv: gdb: support vector registers for rv64 & rv32

LIU Zhiwei (3):
  target/riscv: rvv-1.0: add mstatus VS field
  target/riscv: rvv-1.0: add sstatus VS field
  target/riscv: rvv-1.0: add vcsr register

 target/riscv/cpu.c                      |   12 +-
 target/riscv/cpu.h                      |   85 +-
 target/riscv/cpu_bits.h                 |   10 +
 target/riscv/cpu_helper.c               |   15 +-
 target/riscv/csr.c                      |   92 +-
 target/riscv/fpu_helper.c               |   17 +-
 target/riscv/gdbstub.c                  |  184 ++
 target/riscv/helper.h                   |  435 ++-
 target/riscv/insn32.decode              |  294 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 2423 +++++++++------
 target/riscv/internals.h                |   24 +-
 target/riscv/translate.c                |   74 +-
 target/riscv/vector_helper.c            | 3601 ++++++++++++-----------
 13 files changed, 4176 insertions(+), 3090 deletions(-)

--
2.25.1


