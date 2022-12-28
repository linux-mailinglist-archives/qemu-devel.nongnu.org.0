Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D0265809B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 17:18:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAZ75-0003bM-5y; Wed, 28 Dec 2022 11:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pAZ6S-0003VX-Rl
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 11:16:57 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pAZ6Q-00005q-4e
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 11:16:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zPQdS+Wv7fnrvCn5w4dmKkkrou+/4MNR7T5ISU7tFLY=; b=VAZDNsOzEsIhwbD67vJk4E2qwh
 uN0ssyWX8+g3x3+0+mFz+bMY+bDi2tXutKUmXnBUk/YgPWSg/BmbdpdGw222/SIWDlv5j0vTnPJm5
 Oo0ogW40nov5k1T8gR+4y4YS7rhroxI9SLpemu0KH28XOEnGMmTx8yXVcvjhxehh4JE8=;
Date: Wed, 28 Dec 2022 17:16:17 +0100
To: qemu-devel@nongnu.org
Cc: Taylor Simpson <tsimpson@quicinc.com>, Philippe =?UTF-8?B?TWF0aGlldS1E?=
 =?UTF-8?B?YXVkw6k=?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>
Subject: [RFC] Reducing NEED_CPU_H usage
Message-ID: <20221228171617.059750c3@orange>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello everyone, this is a proposal in the libtcg direction, i.e.,
enabling building a single QEMU executable featuring multiple *targets*
(i.e., TCG frontends).
This follows what we discussed in recent KVM calls and originally at
the KVM Forum Emulation BoF.

Note that our commitment to this project is possible thanks to our
collaboration with the Qualcomm Innovation Center!

# Grand goal

The following is the core point where translation of input code to host
code takes place:

    TranslationBlock *tb_gen_code(CPUState *cpu,
                                  target_ulong pc, target_ulong cs_base,
                                  uint32_t flags, int cflags)
    {
        // ...

        gen_intermediate_code(cpu, tb, max_insns, pc, host_pc);
        
        // ...
    
        gen_code_size = tcg_gen_code(tcg_ctx, tb, pc);
    
        // ...
    }

    https://github.com/qemu/qemu/blob/4e4fa6c/accel/tcg/translate-all.c#L816

We want:

* `gen_intermediate_code` to be target-specific (provided by a shared
  library)
* `tb_gen_code` and `tcg_gen_code` to be target-agnostic

Result: the frontend just emits instructions into the
`TranslationBlock`, not much more.

But first we need to make sure that QEMU is neatly divided into
components that can make compile-time assumptions about the target and
components that don't, which is what this proposal is about.

This will be a large chunk of work affecting many parts of the code and
requiring some infrastructural changes.

# Strategy

The strategy to make this happen is primarily to have an out-of-tree
branch where the development of libtcg takes place. The main goal is to
be able to limit usage of `NEED_CPU_H` and some other macros only to
certain places (mainly `target/*` and `{bsd,linux}-user/*`).

Initially we will focus on getting a `--target-list=x86_64-linux-user`
configuration to build with reduced usage of `NEED_CPU_H`. This is just
for simplicity, we intend to tackle all other configurations
step-by-step.

At first, there will be lots of hacks to make it build and QEMU won't
be operational, but building it will enable us to identify all the core
issues.

Once all the core issues have been identified, we intend to prepare
fixes for each one of them and frequently send them upstream in a form
palatable for master. For instance, we expect to have a patch to move
from `TARGET_TB_PCREL` to `TranslationBlock.pc_rel`.

This way, we hope to be able to tackle the project in small bites and,
at a certain point, send a patch upstream where `NEED_CPU_H` is
actually disabled in many many places. Given the amount of work, doing
everything in a single shot does not seem feasible or beneficial.

# Core issues identifed so far

In the following we report some of the core issues we identified, why
they are problematic and what we intend to do to tackle them. Feedback
on each and every point is very welcome! :)

## `NEED_CPU_H`

`NEED_CPU_H` is a macro to decide whether a certain translation unit
needs `target/$ARCH/cpu.h` or not. In several headers, this macro is
used to guard target-specific code.

Problem: we need to build translation units out of the `target/`
and `*-user/` directories *without* this macro being defined.
This also means that many files will be compiled only once and not once
per target!

Solution: Fix all the issues caused by undefining it (main ones
are reported below). Sometimes a solution is to take headers that are
currently target-specific headers and introduce `#ifdef NEED_CPU_H` in
certain parts so that they become target-agnostic.

At a certain point it might make sense to count how many lines are
guarded by such macro and consider splitting headers into
target-agnostic and target-specific ones.

Note: currently, we plan to get rid of all usages of `TARGET_*`
macros in code that we want to become target agnostic but *not* of
`CONFIG_USER_ONLY` and `CONFIG_SOFTMMU`. At least initially, our goal
is just to decouple translation units out of `target/`/`*-user/` from
target-specific assumptions.

## `target_ulong`

`target_ulong` is `uint32_t` in 32-bit targets and `uint64_t` in 64-bit
targets.

Problem: This is used in many many places to represent addresses in
code that could become target-independent.

Proposed solution: we can convert it to:

    typedef uint64_t target_address;

The problem with this is that, if arithmetic operations are performed
on it, we might get undesired results:

    // Was: char load_data(target_ulong address)
    char load_data(target_address address) {
      char *base_address = get_base_address();
      // On a 32-bits target this would overflow, it doesn't with
      // uint64_t
      target_address real_address = address + 1;
      return *(base_address + real_address);
    }

    load_data(UINT32_MAX);

This is might be a source of subtle bugs.
We're using a rough `clang-query` invocation to see who performs
arithmetic on `target_ulong`:

    $ cd build
    $ cat compile_commands.json \
        | jq -r '.[] | .["file"]' \
        | grep -v 'target/' \
        | grep -v 'linux-user/' \
        | xargs -P$(nproc) -n1 \
          clang-query \
            --extra-arg='-Wno-error' \
            --extra-arg='-w' \
            -p . \
            -c 'match binaryOperator(anyOf(hasOperatorName("-"),
                                           hasOperatorName("+")),
                                     hasDescendant(expr(hasType(typedefDecl(anyOf(hasName("target_ulong"),
                                                                                  hasName("abi_ulong"))))))).bind("x")' \
        | grep -v '0 matches.' \
        | grep 'binds here' \
        | sort -u \
        | wc -l
    34

Not too bad.

An alternative would be to do some "data hiding" and have:

    struct target_address {
      uint64_t address;
    };

And then have `increment_address(target_address *, CPUState *)` in
order to perform safe arithmetic depending on the current target.
However this seems a bit excessive, we could rely on simply letting the
developer mask addresses in cases of arithmetic in target-independent
code.

## `abi_ulong`

Similar to `target_ulong`, but with alignment info.

The role of `abi_ulong` is not entirely clear to me. Some feedback on
this would be welcome.

## `TCGv`

`TCGv` is a macro for `TCGv_i32` for 32-bit targets and `TCGv_i64`
for 64-bit targets.

Problem: it makes `tcg-op.h` and, more importantly, `tcg-op.c`
target-specific.

Solution: transform current functions using them into target-specific
wrappers that dispatch to target-agnostic functions that accept
`TCGv_dyn` instead of `TCGv`:

    typedef struct {
        union {
            TCGv_i32 i32;
            TCGv_i64 i64;
        };
        bool is_64;
    } TCGv_dyn;

In the semi-last KVM call, it has been suggested that instead of having
a discriminated `union` we could stuff the address size in `MemOp`,
which is a common argument to functions taking a `TCGv`. However, that
would either require one of the following:

* still have `TCG_dyn` as a union, use `MemOp` instead of the `is_64`
  field; however I think the discriminated union is more suitable and
  it'd be a bit of an abuse to use `MemOp` since currently it describe
  *how* to perform the load but it says nothing about the size of the
  address;

* make `TCGv` become opaque (`typedef struct TCGv_d *TCGv`) and put a
  cast in `tcg-op.h` code, we'd lose type safety here;

* use `_Generic` but that, in turn, would require either moving all
  functions taking a `TCGv` to the header and turn them into macros
  *or* turn `tcg-op.c` into a template file where each function taking
  a `TCGv` is instantiated twice with different suffixes depending on
  the type of the argument;

The changeset for the `TCGv_dyn` solution, on the other hand, is rather
small:

    https://github.com/revng/qemu-hexagon/commit/f4098d84c241b86418e401396851d12f2fdbcf7a
    https://github.com/revng/qemu-hexagon/commit/251ef7631640e645a03b0ffa72fa96f3eb686129

## `TARGET_` macros

These are macros that provide target-specific information.

Problem: they need to be abandoned in translation units that need to
become target agnostic.

Solution: promote them to fields of a `struct`.
Current ideas:

    TARGET_TB_PCREL -> TranslationBlock.pc_rel
    TARGET_PAGE_BITS -> TranslationBlock.page_bits
    TARGET_PAGE_MASK -> TranslationBlock.page_mask
    TARGET_PAGE_ALIGN -> CPUArchState.page_align
                      -> DisasContextBase.page_align
    TARGET_LONG_BITS -> TCGContext.long_bits 
    TARGET_PAGE_SIZE -> ???
    TCG_OVERSIZED_GUEST -> ???
    TARGET_FMT_lx -> ???
    CPU_RESOLVING_TYPE -> ???

Sometimes, this is trivial, other times this means adding arguments to
functions that previously could rely on direct macro use.

## `CPUState`

`CPUState` is a target-agnostic `struct` representing common information
of `ArchCPU`.

Problem: given an (opaque) pointer to `CPU${Arch}State`,
target-agnostic code often wants to reach `CPUState`, but this requires
knowledge of the layout of `ArchCPU`, which is target-dependent.

Solution: have a target-specific function to obtain the pointer to
`CPUState` given `CPU${Arch}State`. Where this function would go, and
how it would be retrieved, needs more consideration.
I imagine a table of target-specific function pointers.

## `CPUNegativeOffsetState`

`CPUNegativeOffsetState` is a `struct` placed in `ArchCPU` before
`CPU${Arch}State`.

    struct ArchCPU {
        /*< private >*/
        CPUState parent_obj;
        /*< public >*/
    
        CPUNegativeOffsetState neg;
        CPUAlphaState env;
    
        /* This alarm doesn't exist in real hardware; we wish it did.
    */ QEMUTimer *alarm_timer;
    };

Problem: used in several parts of the code that need to become
target-agnostic.

Solution: make it target-agnostic and push it into `CPUState`, which is
the place for target-agnostic stuff.

I'm not sure why this isn't already the case. I'm probably missing
something here, so feedback is welcome.

# What's left out?

Quite a few minor things but.. you tell me!
There's probably *a lot* more stuff when we dig into system mode
emulation, but I'd postpone investigating those issues until we have
user mode in a decent shape.

Apart from this, let me know if there's something else we're missing.

# Current status

We currently have a branch where we can build (but not link nor run) a
`x86_64-linux-user` configuration where `NEED_CPU_H` is defined only
for translation units in `target/` and `linux-user/`.

It's the result of a (painful) journey. You can try it here:

    git clone https://github.com/revng/qemu-hexagon.git
    cd qemu-hexagon
    git checkout feature/multi-tcg
    mkdir build
    cd build
    ../configure --target-list=x86_64-linux-user
    ninja -k0 | grep FAILED
    # It should build but fail linking qemu-x86_64

This process required commenting a lot of code, it's not supposed to
work at all and it's quite ugly. However, it has been very useful since
it enabled us to use the compiler to discover what is problematic.

Sorry for the wall of text.

Enjoy the last few days of 2022!

-- 
Alessandro Di Federico
rev.ng Labs

