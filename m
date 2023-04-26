Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CC46EF398
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 13:45:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prdZw-0007PH-6k; Wed, 26 Apr 2023 07:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1prdZs-0007Od-Kc
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 07:44:52 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1prdZp-0008BS-VU
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 07:44:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GSzGcCp6ShPQmw4AE9XOarM2UQw7LDwFmT3zdVyKZlE=; b=A46kixbMyLvKj1gkdLUa9YJ8os
 09t5BG3QaN4uiBYrqtnLnz2goqVa0+s1rqzq50tC7Zr2UFopa3MdZ4QfyZuyek+VBEEJoE8F/WkgR
 N2rjeds7z6kgHIRvvWBjXtqKuYXaFPS4+symiX4f2FoHM0QmT9dtok1Av7ufw2hOmfHE=;
Message-ID: <c15bdb47-611d-31f1-82ef-eefe6b7c24f9@rev.ng>
Date: Wed, 26 Apr 2023 13:44:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 00/21] Hexagon (target/hexagon) short-circuit and move to
 DisasContext
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230426003945.1318446-1-tsimpson@quicinc.com>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <20230426003945.1318446-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 4/26/23 02:39, Taylor Simpson wrote:
> This patch series achieves two major goals
> Goal 1:  Short-circuit packet semantics
>      In certain cases, we can avoid the overhead of writing to
>      hex_new_value and write directly to hex_gpr.
>
>      Here's a simple example of the TCG generated for
>      0x004000b4:  0x7800c020 {       R0 = #0x1 }
>
>      BEFORE:
>       ---- 004000b4
>       movi_i32 new_r0,$0x1
>       mov_i32 r0,new_r0
>
>      AFTER:
>       ---- 004000b4
>       movi_i32 r0,$0x1
> Goal 2:  Move bookkeeping items from CPUHexagonState to DisasContext
>      Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>      Several fields in CPUHexagonState are only used for bookkeeping
>      within the translation of a packet.  With recent changes to eliminate
>      the need to free TCGv variables, these make more sense to be
>      transient and kept in DisasContext.
>
>
> This patch series can be divided into 3 main parts
> Part 1:  Patches 1-9
>      Cleanup in preparation for parts 2 and 3
>      The main goal is to move functionality out of generated helpers
> Part 2:  Patches 10-15
>      Short-circuit packet semantics
> Part 3:  Patches 16-21
>      Move bookkeeping items from CPUHexagonState to DisasContext
>
>
>
> Taylor Simpson (21):
>    meson.build Add CONFIG_HEXAGON_IDEF_PARSER
>    Hexagon (target/hexagon) Add DisasContext arg to gen_log_reg_write
>    Hexagon (target/hexagon) Add overrides for loop setup instructions
>    Hexagon (target/hexagon) Add overrides for allocframe/deallocframe
>    Hexagon (target/hexagon) Add overrides for clr[tf]new
>    Hexagon (target/hexagon) Remove log_reg_write from op_helper.[ch]
>    Hexagon (target/hexagon) Eliminate uses of log_pred_write function
>    Hexagon (target/hexagon) Clean up pred_written usage
>    Hexagon (target/hexagon) Don't overlap dest writes with source reads
>    Hexagon (target/hexagon) Mark registers as read during packet analysis
>    Hexagon (target/hexagon) Short-circuit packet register writes
>    Hexagon (target/hexagon) Short-circuit packet predicate writes
>    Hexagon (target/hexagon) Short-circuit packet HVX writes
>    Hexagon (target/hexagon) Short-circuit more HVX single instruction
>      packets
>    Hexagon (target/hexagon) Add overrides for disabled idef-parser insns
>    Hexagon (target/hexagon) Make special new_value for USR
>    Hexagon (target/hexagon) Move new_value to DisasContext
>    Hexagon (target/hexagon) Move new_pred_value to DisasContext
>    Hexagon (target/hexagon) Move pred_written to DisasContext
>    Hexagon (target/hexagon) Move pkt_has_store_s1 to DisasContext
>    Hexagon (target/hexagon) Move items to DisasContext
>
>   meson.build                                 |   1 +
>   target/hexagon/cpu.h                        |  10 +-
>   target/hexagon/gen_tcg.h                    | 118 ++++++-
>   target/hexagon/gen_tcg_hvx.h                |  23 ++
>   target/hexagon/genptr.h                     |   6 +-
>   target/hexagon/helper.h                     |   6 +-
>   target/hexagon/macros.h                     |  57 ++--
>   target/hexagon/op_helper.h                  |  16 +-
>   target/hexagon/translate.h                  |  52 ++-
>   target/hexagon/attribs_def.h.inc            |   6 +-
>   target/hexagon/arch.c                       |   3 +-
>   target/hexagon/cpu.c                        |   5 +-
>   target/hexagon/genptr.c                     | 347 ++++++++++++++++----
>   target/hexagon/idef-parser/parser-helpers.c |   4 +-
>   target/hexagon/op_helper.c                  | 154 ++++++---
>   target/hexagon/translate.c                  | 274 +++++++++++-----
>   tests/tcg/hexagon/hvx_misc.c                |  21 ++
>   tests/tcg/hexagon/read_write_overlap.c      | 136 ++++++++
>   target/hexagon/README                       |   6 +-
>   target/hexagon/gen_analyze_funcs.py         |  51 ++-
>   target/hexagon/gen_helper_funcs.py          |   9 +-
>   target/hexagon/gen_helper_protos.py         |  10 +-
>   target/hexagon/gen_idef_parser_funcs.py     |   7 +
>   target/hexagon/gen_tcg_funcs.py             |  21 +-
>   target/hexagon/hex_common.py                |  16 +-
>   tests/tcg/hexagon/Makefile.target           |   1 +
>   26 files changed, 1066 insertions(+), 294 deletions(-)
>   create mode 100644 tests/tcg/hexagon/read_write_overlap.c

For some reason this patchset didn't arrive in one piece, see patchew:

https://patchew.org/QEMU/20230426003945.1318446-1-tsimpson@quicinc.com/

-- 
Anton Johansson,
rev.ng Labs Srl.


