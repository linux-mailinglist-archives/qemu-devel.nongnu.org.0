Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E69D2F3AD0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 20:46:50 +0100 (CET)
Received: from localhost ([::1]:38894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzPcv-0004IC-6P
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 14:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzPaG-0003Jv-UE
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 14:44:06 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzPaB-0005Ih-RD
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 14:44:04 -0500
Received: by mail-wm1-x32b.google.com with SMTP id i63so2956491wma.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 11:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Kc2GcM/sLFhQSKRuqGSwRh3UEu19QzlV6GSNYM5c8I0=;
 b=QOWGIYhv2TMPamVLmecuDcsjTkb/6cdWxEq1+48EAx7iBBPhDxR8CbHam0MHG6RvQi
 xmcHzrwV1rOvU/76YQoO/NmyFGYBe+S9AeBVBcvSRJSj7OMdobwGuGqYM40xfZ1xtRNp
 /kG0OYn7ooSfYYyfy6r+zyXpoZfIm66d36oMRgwMobo/GjK4//UIOe/WISSyBbIMjZAk
 /lm5uFlUeIqjIifrdbOuKHqDuFLVznvtKriGGZK4WcSEN7PgbdC7mrHxiliEPeVNtVYj
 40q3cZzFpzn1ygneJybnKlTSkiWBNWEyia5fiUbbWvlmGuJrrznqAStMr7c2Z+ytVlQm
 rEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Kc2GcM/sLFhQSKRuqGSwRh3UEu19QzlV6GSNYM5c8I0=;
 b=nTLkaXJVV1PRGapj9kWHHTts/j/CaT3dBVZvSxMASYnCSUoUkykYuDfbYyZP/+UVjp
 ySkHLtfPHqT9HUa3niQt3DNcL+Mpa0whJy5JRdE38zkuAGVaeUVOHs5fviPgYevtXojz
 y5MPJ+OEL25rcLoS7BB3E6oddMl8FKymUZCvLg9tr0Rf2YI6yQiqGfJE1J9o5V+BFotn
 8Vftl8KU1QlVbNtaklRJ279OS6Cg4XWdh5Lx1xwRXGnxmqRmbg8zqrEgYpszNZGzedL0
 Nnbyh6HfKe+DGLquKAkPBIh/s/WeBF+DWZDEUdLF1IeEN8CHBIryumBNZtVegtc++W/z
 Mvow==
X-Gm-Message-State: AOAM531Xsl5M+/LVL1p5O1lBw4kQI9AS8qG9GoPiBTzSHT1UPk/l4YAu
 cOx6czJVypPniLwCzp+5MrXgsA==
X-Google-Smtp-Source: ABdhPJwmdIM7xH0TMZE0ANCwoUrFpqaxHNxkTincV7rTAgzf0haRQ3nMrA1EbRVoXJ9kkrJ2XtIJPg==
X-Received: by 2002:a1c:e2c3:: with SMTP id z186mr440955wmg.144.1610480636305; 
 Tue, 12 Jan 2021 11:43:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n3sm6413071wrw.61.2021.01.12.11.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 11:43:54 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8CD121FF7E;
 Tue, 12 Jan 2021 19:43:53 +0000 (GMT)
References: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Taylor Simpson <tsimpson@quicinc.com>
Subject: Re: [PATCH v6 00/35] Hexagon patch series
Date: Tue, 12 Jan 2021 19:42:00 +0000
In-reply-to: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
Message-ID: <87eeiqlz46.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, laurent@vivier.eu, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Taylor Simpson <tsimpson@quicinc.com> writes:

> This series adds support for the Hexagon processor with Linux user support
>
> See patch 02/33 Hexagon README for detailed information.
>
> This series assumes int128_or() is implemented.
> https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg06004.html
>
> The series is also available at https://github.com/quic/qemu on branch
> small_series_v6.
>
>
> Once the series is applied, the Hexagon port will pass "make check-tcg".
> The series also includes Hexagon-specific tests in tcg/tests/hexagon.
>
> The final 3 patches in the series add docker support.  Thanks to Alessand=
ro
> Di Federico <ale@rev.ng> and Brian Cain <bcain@quicinc.com> for making th=
is
> happen.  The container files will build a Hexagon toolchain from source.
> Alternatively, this command will get a pre-built container
>     docker pull revng/qemu:debian-hexagon-cross
> Ultimately, we'll a method to create a container without building the too=
lchain.
>
> Once the container is set up, here are the commands to verify the code:
>     mkdir build
>     cd build
>     ../configure --target-list=3Dhexagon-linux-user
>     make
>     make check-tcg DOCKER_IMAGE=3Ddebian-hexagon-cross \
>         DOCKER_CROSS_CC_GUEST=3Dhexagon-unknown-linux-musl-clang

check-tcg should be picking up the DOCKER_IMAGE and
DOCKER_CROSS_CC_GUEST values from the configure.sh script settings which
get dumped in $BLDIR/tests/tcg/config-hexagon.mak

You can run just the hexagon tests with:

  make run-tcg-tests-hexagon-linux-user

>
>
> *** Known checkpatch issues ***
>
> The following are known checkpatch errors in the series
>     target/hexagon/reg_fields.h         Complex macro
>     target/hexagon/attribs.h            Complex macro
>     target/hexagon/decode.c             Complex macro
>     target/hexagon/q6v_decode.c         Macro needs do - while
>     target/hexagon/printinsn.c          Macro needs do - while
>     target/hexagon/gen_semantics.c      Suspicious ; after while (0)
>     target/hexagon/gen_dectree_import.c Complex macro
>     target/hexagon/gen_dectree_import.c Suspicious ; after while (0)
>     target/hexagon/opcodes.c            Complex macro
>     target/hexagon/iclass.h             Complex macro
>     configure.sh                        Line over 90 characters
>     tests/tcg/configure.sh              Line over 90 characters
>     scripts/qemu-binfmt-conf.sh         Line over 90 characters
>
> The following are known checkpatch warnings in the series
>     target/hexagon/fma_emu.c            Comments inside macro definition
>     target/hexagon/gen_tcg_funcs.py     Line over 80 characters
>     scripts/qemu-binfmt-conf.sh         Line over 80 characters
>
> *** Changes in v6 ***
> Correct QEMU_GENERATE implementations for fLSBNEW0/fLSBNEW1
> Change Python file handling to use with statement
> Change import hex_common to be explicit
> Generator cleanup
>     Change N?N (new value) to value instead of register number for consis=
tency
>     Fixed bud in reading control register pair
>     Add ctx_log_reg_write_pair
>     Clean up control reg offset from HEX_REG_SA0
> Fix errors in FP instructions uncovered by musl libc-tests
>     Added unit tests
>
> *** Changes in v5 ***
> Bug fixes
>     Properly implement circular addressing
>         memw(r1++I:circ(m0)) =3D r2
>     Make gen_cmpnd_cmp_jmp execute in 2 parts
>
> Address remaining blocker items from Richard Henderson's review.
>     Use qemu softfloat
>     Use const where appropriate
>     Break tcg_funcs_generated.h into two files - functions and table
>     Change struct and enum type names to CamelCase
>     Include packet in raw bytes in assembly
>     Use DEF_HELPER_FLAGS where possible
>     Fix merge_bytes endianness and overlap test by doing the store before=
 load
>     Use bitmask instead of string in decoding
>     Add comments to decoder
>     Use qemu/int128.h
>     Use qemu/bitops.h for instruction attributes
>     Add bitmask for ctx->reg_log
>         Note we still have the array/idx for iteration during gen_commit_=
packet
>     Change opcode_syntax to be created at compile time in gen_dectree_imp=
ort.c
>     Remove unused tmp variables
>     Isolate hex_arch_types to imported files
>     Fix git am whitespace warnings
>
> Address items from Philippe Mathieu-Daud=C3=A9's review
>     Split utility functions patch into 3 digestable patches
>     Fixed type "definition"
>     Change all exit codes to be either 0 or 1
>     Validated build with gcc 4.8, 5.5, and *****
>     Removed qemu/osdep.h and qemu/host-utils.h from macros.h
>
> Address items from Laurent Vivier's review
>     Don't filter out __NR_syscalls
>     Remove syscall_nr_generators from linux-user/hexagon/meson.build
>     Remove subdir('hexagon') from linux-user/meson.build
>     Generate syscall_nr.h from 5.5 Linux kernel
>=20=20=20=20=20
>
> *** Changes in v4 ***
> Convert target/hexagon/Makefile.objs to meson.build
>
> Address portions of feedback from Richard Henderson.  Here is the table
> of items from Richard's review.
> Patch   Item                                                 Blocker Stat=
us
>         Use qemu softfloat                                   Yes
>         Use qemu decodetree.py                               No
> Several Use const when appropriate                           Yes
> Several Remove anything after g_assert_not_reached           Yes     DONE
> Several Fix log_store32/64 add/remove/add in patch series    Yes     DONE
> Several Follow naming guidelines for structs and enums       Yes
> 4       Move decls to cpu-param.h                            Yes     DONE
> 4       Remove CONFIG_USER_ONLY ifdef's                      Yes     DONE
> 4       Remove DEBUG_HEXAGON                                 Yes     Part=
ially
> 4       Remove stack pointer modification hack               Yes     DONE
> 4       Add property x-lldb-compat to control output         Yes     DONE
> 6       Include instruction and raw bytes in disassembly     Yes
> 7       Use DEF_HELPER_FLAGS                                 No
> 07, 26  Endianness of merge_bytes                            Yes
> 7       Fix overlap test                                     Yes
> 7       Remove HELPER(debug_value)/HELPER(debug_value_i64)   Yes     DONE
> 9       Include "qemu/osdep.h" instead of <stdint.h>         Yes     DONE
> Several Stick with stdint.h types except in imported files   Yes     DONE
> 11      Remove description from reg field definitions        Yes     DONE
> 13      Move regmap.h into decode.c                          Yes     DONE
> 14, 27  Use bit mask instead of strings in decoding          No
> 14      Add comments to decoder                              Yes
> 16      Use qemu/int128.h                                    No
> 17      Squash patches dealing with imported files           Yes     DONE
> 24      Use qemu/bitops.h for instruction attributes         No
> 24      Fix initialization of opcode_short_semantics         Yes     DONE
> 24      Change if (p =3D=3D NULL) { g_assert_not_reached(); }
>         to assert(p !=3D NULL)                                 No      DO=
NE
> 25      Expand DECL/READ/WRITE/FREE macros in generator      Yes     DONE
> 26      Rewrite fINSERT*, fEXTRACT*, f?XTN macros            Yes     DONE
> 26      Investigate fRND macro                               No      DONE
> 26      Change REG =3D REG to (VOID)REG to suppress warning    Yes     DO=
NE
> 27      Remove multiple includes of imported/iclass.def      Yes     DONE
> 28      Move genptr_helpers.h into genptr.c                  Yes     DONE
> 28      Remove unneeded temps                                No      DONE
> 28      Use tcg_gen_deposit_tl and tcg_gen_extract_tl
>         when dealing with p3_0                               No      DONE
> 29      Size opcode_genptr[] properly and initialize
>         with [TAG] =3D generate_##TAG                          Yes     DO=
NE
> 30      Don't generate helpers for overridden instructions   Yes     DONE
>         Don't include "gen_tcg.h" in helper.h                Yes     DONE
> 31      Use bitmask for ctx->reg_log instead of an array     Yes
> 31      Use tcg_gen_extract_i32 for gen_slot_cancelled_check Yes     DONE
> 31      Properly deal with reading instructions across
>         a page boundary and too many instructions before
>         finding end-of-packet                                Yes     DONE
> 31      Don't set PC at the beginning of every packet        No
> 31      Don't set slot_cancelled unless needed               No
> 31      Don't set hex_pred_written unless needed             No
> 31      Change cancelled variable to not local               Yes     DONE
> 31      Remove unnecessary temp                              Yes     DONE
> 31      Let tcg_gen_addi_tl check for zero                   Yes     DONE
> 31      Move gen_exec_counters to end of TB                  No
> 31      Move end of TB handling to hexagon_tr_tb_stop        Yes     DONE
>         Generate two lists for TCG functions instead of
>         the DEF_TCG_FUNC macro                               Yes     DONE
>
>
> *** Changes in v3 ***
> Remove substantial portions of the code to facilitate review
> - Plan to submit subsequent patches
> - Hexagon Vector eXtensions (HVX)
> - Circular and bit-reverse addressiong
> - Add/sub-with-carry
> - Unused insn_t and pkt_t fields
> - Unused instruction attributes
> - All TCG overrides except instructions with multiple definitions
> - Unused macros
> - Unused reg fields
> - COUNT_HEX_HELPERS
> Use Laurent's gensyscall.sh script to generate linux-user/hexagon/syscall=
_nr.h
> Handle mem_noshuf
> Remove "RsV =3D RsV" per review feedback
> Simplify include file structure
> Add directed tests in <qemu>/tests/tcg/hexagon
> Change fWRAP_* macros to fGEN_TCG_*
>
> *** Changes in v2 ***
> - Use scripts/git.orderfile
> - Create a README with the code overview in patch 0001
> - Change #define's in hex_regs.h to an enum
> - Replace hard coded disassembly buffer length (1028) with #define
> - Move Hexagon architecture types patch earlier in series
> - Replace #include standard header files with #include "qemu/osdep.h"
> - Prefix all header file #ifndef's with HEXAGON_
> - Update python version to python3
> - #include "tcg/tcg.h" in genptr_helpers.h
> - Change target/hexagon/Makefile.objs to support out-of-tree build
> - Updated copyright to include year 2020
> - Bug fixes
>     Fix some problems with HEX_DEBUG output
>     Fix bug in circular addressing
> - Optimizations to reduce the amount of TCG code generated
>     Change pred_written from an array to a bit mask
>
>
>
> Alessandro Di Federico (3):
>   Add Dockerfile for hexagon
>   Auto-import Docker support files
>   Add newline when generating Dockerfile
>
> Taylor Simpson (32):
>   Hexagon Update MAINTAINERS file
>   Hexagon (target/hexagon) README
>   Hexagon (include/elf.h) ELF machine definition
>   Hexagon (target/hexagon) scalar core definition
>   Hexagon (disas) disassembler
>   Hexagon (target/hexagon) register names
>   Hexagon (target/hexagon) scalar core helpers
>   Hexagon (target/hexagon) GDB Stub
>   Hexagon (target/hexagon) architecture types
>   Hexagon (target/hexagon) instruction and packet types
>   Hexagon (target/hexagon) register fields
>   Hexagon (target/hexagon) instruction attributes
>   Hexagon (target/hexagon) instruction/packet decode
>   Hexagon (target/hexagon) instruction printing
>   Hexagon (target/hexagon/arch.[ch]) utility functions
>   Hexagon (target/hexagon/conv_emu.[ch]) utility functions
>   Hexagon (target/hexagon/fma_emu.[ch]) utility functions
>   Hexagon (target/hexagon/imported) arch import
>   Hexagon (target/hexagon) generator phase 1 - C preprocessor for
>     semantics
>   Hexagon (target/hexagon) generator phase 2 - generate header files
>   Hexagon (target/hexagon) generator phase 3 - C preprocessor for decode
>     tree
>   Hexagon (target/hexagon) generater phase 4 - decode tree
>   Hexagon (target/hexagon) opcode data structures
>   Hexagon (target/hexagon) macros
>   Hexagon (target/hexagon) instruction classes
>   Hexagon (target/hexagon) TCG generation
>   Hexagon (target/hexagon) TCG for instructions with multiple
>     definitions
>   Hexagon (target/hexagon) TCG for floating point instructions
>   Hexagon (target/hexagon) translation
>   Hexagon (linux-user/hexagon) Linux user emulation
>   Hexagon (tests/tcg/hexagon) TCG tests
>   Hexagon build infrastructure
>
>  default-configs/targets/hexagon-linux-user.mak     |    1 +
>  meson.build                                        |    1 +
>  include/disas/dis-asm.h                            |    1 +
>  include/elf.h                                      |    1 +
>  linux-user/hexagon/sockbits.h                      |   18 +
>  linux-user/hexagon/syscall_nr.h                    |  322 +++
>  linux-user/hexagon/target_cpu.h                    |   44 +
>  linux-user/hexagon/target_elf.h                    |   40 +
>  linux-user/hexagon/target_fcntl.h                  |   18 +
>  linux-user/hexagon/target_signal.h                 |   34 +
>  linux-user/hexagon/target_structs.h                |   46 +
>  linux-user/hexagon/target_syscall.h                |   36 +
>  linux-user/hexagon/termbits.h                      |   18 +
>  linux-user/qemu.h                                  |    2 +
>  linux-user/syscall_defs.h                          |   33 +
>  target/hexagon/arch.h                              |   35 +
>  target/hexagon/attribs.h                           |   30 +
>  target/hexagon/attribs_def.h                       |   97 +
>  target/hexagon/conv_emu.h                          |   31 +
>  target/hexagon/cpu-param.h                         |   29 +
>  target/hexagon/cpu.h                               |  159 ++
>  target/hexagon/cpu_bits.h                          |   59 +
>  target/hexagon/decode.h                            |   32 +
>  target/hexagon/fma_emu.h                           |   37 +
>  target/hexagon/gen_tcg.h                           |  319 +++
>  target/hexagon/genptr.h                            |   25 +
>  target/hexagon/helper.h                            |   85 +
>  target/hexagon/hex_arch_types.h                    |   38 +
>  target/hexagon/hex_regs.h                          |   83 +
>  target/hexagon/iclass.h                            |   50 +
>  target/hexagon/insn.h                              |   74 +
>  target/hexagon/internal.h                          |   39 +
>  target/hexagon/macros.h                            |  591 ++++++
>  target/hexagon/opcodes.h                           |   63 +
>  target/hexagon/printinsn.h                         |   28 +
>  target/hexagon/reg_fields.h                        |   36 +
>  target/hexagon/reg_fields_def.h                    |   41 +
>  target/hexagon/translate.h                         |   91 +
>  disas/hexagon.c                                    |   68 +
>  linux-user/elfload.c                               |   16 +
>  linux-user/hexagon/cpu_loop.c                      |   99 +
>  linux-user/hexagon/signal.c                        |  276 +++
>  target/hexagon/arch.c                              |  294 +++
>  target/hexagon/conv_emu.c                          |  177 ++
>  target/hexagon/cpu.c                               |  314 +++
>  target/hexagon/decode.c                            |  581 ++++++
>  target/hexagon/fma_emu.c                           |  701 +++++++
>  target/hexagon/gdbstub.c                           |   47 +
>  target/hexagon/gen_dectree_import.c                |  187 ++
>  target/hexagon/gen_semantics.c                     |   88 +
>  target/hexagon/genptr.c                            |  234 +++
>  target/hexagon/iclass.c                            |   73 +
>  target/hexagon/op_helper.c                         | 1016 ++++++++++
>  target/hexagon/opcodes.c                           |  142 ++
>  target/hexagon/printinsn.c                         |  158 ++
>  target/hexagon/q6v_decode.c                        |  385 ++++
>  target/hexagon/reg_fields.c                        |   27 +
>  target/hexagon/translate.c                         |  687 +++++++
>  tests/tcg/hexagon/atomics.c                        |  122 ++
>  tests/tcg/hexagon/clrtnew.c                        |   56 +
>  tests/tcg/hexagon/dual_stores.c                    |   60 +
>  tests/tcg/hexagon/fpstuff.c                        |  370 ++++
>  tests/tcg/hexagon/mem_noshuf.c                     |  328 +++
>  tests/tcg/hexagon/misc.c                           |  360 ++++
>  tests/tcg/hexagon/preg_alias.c                     |  106 +
>  tests/tcg/hexagon/pthread_cancel.c                 |   43 +
>  MAINTAINERS                                        |    8 +
>  disas/meson.build                                  |    1 +
>  scripts/gensyscalls.sh                             |    1 +
>  scripts/qemu-binfmt-conf.sh                        |    6 +-
>  target/hexagon/README                              |  235 +++
>  target/hexagon/dectree.py                          |  351 ++++
>  target/hexagon/gen_helper_funcs.py                 |  220 ++
>  target/hexagon/gen_helper_protos.py                |  150 ++
>  target/hexagon/gen_op_attribs.py                   |   40 +
>  target/hexagon/gen_op_regs.py                      |  111 +
>  target/hexagon/gen_opcodes_def.py                  |   37 +
>  target/hexagon/gen_printinsn.py                    |  174 ++
>  target/hexagon/gen_shortcode.py                    |   63 +
>  target/hexagon/gen_tcg_func_table.py               |   58 +
>  target/hexagon/gen_tcg_funcs.py                    |  532 +++++
>  target/hexagon/hex_common.py                       |  216 ++
>  target/hexagon/imported/allidefs.def               |   30 +
>  target/hexagon/imported/alu.idef                   | 1258 ++++++++++++
>  target/hexagon/imported/branch.idef                |  326 +++
>  target/hexagon/imported/compare.idef               |  619 ++++++
>  target/hexagon/imported/encode.def                 |  124 ++
>  target/hexagon/imported/encode_pp.def              | 2110 ++++++++++++++=
++++++
>  target/hexagon/imported/encode_subinsn.def         |  149 ++
>  target/hexagon/imported/float.idef                 |  312 +++
>  target/hexagon/imported/iclass.def                 |   51 +
>  target/hexagon/imported/ldst.idef                  |  286 +++
>  target/hexagon/imported/macros.def                 | 1526 ++++++++++++++
>  target/hexagon/imported/mpy.idef                   | 1208 +++++++++++
>  target/hexagon/imported/shift.idef                 | 1066 ++++++++++
>  target/hexagon/imported/subinsns.idef              |  149 ++
>  target/hexagon/imported/system.idef                |   65 +
>  target/hexagon/meson.build                         |  187 ++
>  target/meson.build                                 |    1 +
>  tests/docker/docker.py                             |   12 +-
>  .../debian-hexagon-cross.build-toolchain.sh        |  141 ++
>  .../docker/dockerfiles/debian-hexagon-cross.docker |   18 +
>  tests/tcg/configure.sh                             |    8 +-
>  tests/tcg/hexagon/Makefile.target                  |   48 +
>  tests/tcg/hexagon/first.S                          |   56 +
>  tests/tcg/hexagon/float_convs.ref                  |  748 +++++++
>  tests/tcg/hexagon/float_madds.ref                  |  768 +++++++
>  107 files changed, 23165 insertions(+), 6 deletions(-)
>  create mode 100644 default-configs/targets/hexagon-linux-user.mak
>  create mode 100644 linux-user/hexagon/sockbits.h
>  create mode 100644 linux-user/hexagon/syscall_nr.h
>  create mode 100644 linux-user/hexagon/target_cpu.h
>  create mode 100644 linux-user/hexagon/target_elf.h
>  create mode 100644 linux-user/hexagon/target_fcntl.h
>  create mode 100644 linux-user/hexagon/target_signal.h
>  create mode 100644 linux-user/hexagon/target_structs.h
>  create mode 100644 linux-user/hexagon/target_syscall.h
>  create mode 100644 linux-user/hexagon/termbits.h
>  create mode 100644 target/hexagon/arch.h
>  create mode 100644 target/hexagon/attribs.h
>  create mode 100644 target/hexagon/attribs_def.h
>  create mode 100644 target/hexagon/conv_emu.h
>  create mode 100644 target/hexagon/cpu-param.h
>  create mode 100644 target/hexagon/cpu.h
>  create mode 100644 target/hexagon/cpu_bits.h
>  create mode 100644 target/hexagon/decode.h
>  create mode 100644 target/hexagon/fma_emu.h
>  create mode 100644 target/hexagon/gen_tcg.h
>  create mode 100644 target/hexagon/genptr.h
>  create mode 100644 target/hexagon/helper.h
>  create mode 100644 target/hexagon/hex_arch_types.h
>  create mode 100644 target/hexagon/hex_regs.h
>  create mode 100644 target/hexagon/iclass.h
>  create mode 100644 target/hexagon/insn.h
>  create mode 100644 target/hexagon/internal.h
>  create mode 100644 target/hexagon/macros.h
>  create mode 100644 target/hexagon/opcodes.h
>  create mode 100644 target/hexagon/printinsn.h
>  create mode 100644 target/hexagon/reg_fields.h
>  create mode 100644 target/hexagon/reg_fields_def.h
>  create mode 100644 target/hexagon/translate.h
>  create mode 100644 disas/hexagon.c
>  create mode 100644 linux-user/hexagon/cpu_loop.c
>  create mode 100644 linux-user/hexagon/signal.c
>  create mode 100644 target/hexagon/arch.c
>  create mode 100644 target/hexagon/conv_emu.c
>  create mode 100644 target/hexagon/cpu.c
>  create mode 100644 target/hexagon/decode.c
>  create mode 100644 target/hexagon/fma_emu.c
>  create mode 100644 target/hexagon/gdbstub.c
>  create mode 100644 target/hexagon/gen_dectree_import.c
>  create mode 100644 target/hexagon/gen_semantics.c
>  create mode 100644 target/hexagon/genptr.c
>  create mode 100644 target/hexagon/iclass.c
>  create mode 100644 target/hexagon/op_helper.c
>  create mode 100644 target/hexagon/opcodes.c
>  create mode 100644 target/hexagon/printinsn.c
>  create mode 100644 target/hexagon/q6v_decode.c
>  create mode 100644 target/hexagon/reg_fields.c
>  create mode 100644 target/hexagon/translate.c
>  create mode 100644 tests/tcg/hexagon/atomics.c
>  create mode 100644 tests/tcg/hexagon/clrtnew.c
>  create mode 100644 tests/tcg/hexagon/dual_stores.c
>  create mode 100644 tests/tcg/hexagon/fpstuff.c
>  create mode 100644 tests/tcg/hexagon/mem_noshuf.c
>  create mode 100644 tests/tcg/hexagon/misc.c
>  create mode 100644 tests/tcg/hexagon/preg_alias.c
>  create mode 100644 tests/tcg/hexagon/pthread_cancel.c
>  create mode 100644 target/hexagon/README
>  create mode 100755 target/hexagon/dectree.py
>  create mode 100755 target/hexagon/gen_helper_funcs.py
>  create mode 100755 target/hexagon/gen_helper_protos.py
>  create mode 100755 target/hexagon/gen_op_attribs.py
>  create mode 100755 target/hexagon/gen_op_regs.py
>  create mode 100755 target/hexagon/gen_opcodes_def.py
>  create mode 100755 target/hexagon/gen_printinsn.py
>  create mode 100755 target/hexagon/gen_shortcode.py
>  create mode 100755 target/hexagon/gen_tcg_func_table.py
>  create mode 100755 target/hexagon/gen_tcg_funcs.py
>  create mode 100755 target/hexagon/hex_common.py
>  create mode 100644 target/hexagon/imported/allidefs.def
>  create mode 100644 target/hexagon/imported/alu.idef
>  create mode 100644 target/hexagon/imported/branch.idef
>  create mode 100644 target/hexagon/imported/compare.idef
>  create mode 100644 target/hexagon/imported/encode.def
>  create mode 100644 target/hexagon/imported/encode_pp.def
>  create mode 100644 target/hexagon/imported/encode_subinsn.def
>  create mode 100644 target/hexagon/imported/float.idef
>  create mode 100644 target/hexagon/imported/iclass.def
>  create mode 100644 target/hexagon/imported/ldst.idef
>  create mode 100755 target/hexagon/imported/macros.def
>  create mode 100644 target/hexagon/imported/mpy.idef
>  create mode 100644 target/hexagon/imported/shift.idef
>  create mode 100644 target/hexagon/imported/subinsns.idef
>  create mode 100644 target/hexagon/imported/system.idef
>  create mode 100644 target/hexagon/meson.build
>  create mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.build-t=
oolchain.sh
>  create mode 100644 tests/docker/dockerfiles/debian-hexagon-cross.docker
>  create mode 100644 tests/tcg/hexagon/Makefile.target
>  create mode 100644 tests/tcg/hexagon/first.S
>  create mode 100644 tests/tcg/hexagon/float_convs.ref
>  create mode 100644 tests/tcg/hexagon/float_madds.ref


--=20
Alex Benn=C3=A9e

