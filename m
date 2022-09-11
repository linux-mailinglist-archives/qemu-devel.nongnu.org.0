Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3805D5B51D5
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:17:29 +0200 (CEST)
Received: from localhost ([::1]:43020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWCa-0001VP-Ey
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW08-0000EY-Ik
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:04:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW01-0006y6-I7
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:04:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NxT0OpNFMAVALLdB3PW5pp95QdHR+DIkndEAWftina0=;
 b=e/ZvvtV6CndJlJdhPjFd4PieztSy+14d69rxTzWzkRrR+zjmkhabHUS/R0qaRAMf6EkxYX
 uXdd1Veg5lmnNaKGotDdKc58Nw7SfG8DmS5fAq7TLVWt1lImtDTBhKV/6bGTXg9QipDIse
 dYjhPK0HAJg9a+7ZzICbShu31Vc8ftc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-55-TkQyM9IZP1Sx6fwzDUG0rg-1; Sun, 11 Sep 2022 19:04:22 -0400
X-MC-Unique: TkQyM9IZP1Sx6fwzDUG0rg-1
Received: by mail-ed1-f71.google.com with SMTP id
 z6-20020a05640240c600b0043e1d52fd98so5054353edb.22
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=NxT0OpNFMAVALLdB3PW5pp95QdHR+DIkndEAWftina0=;
 b=iWAlxbnGh7FBu1+T0Q2WO+Kg29o+Ik6pzBFA6OiY2PpocarOq2CC3g1fcPceUuVZkO
 IcXalE4Qa5AsBTjb0VDQCUoIi5Eq+9VBk3LoVx60CTyOCT3XPxA1xl1d6cigdrJhiTim
 niAfnL7Z+5wnSyQFgyEoaynAciomSXfaEZKwJXFTE6aekeirhxeayRIFQXhSW4eaOsan
 EhmOgAu893CzPbw0gQtVclxP+j600B7n18fg53ZsjdmdlqsnQNEgXFvtgoWxqLhmy0s7
 rmY9kvd8+ZqaiKJh4VGz7QNWszLJfsdV5BmjDALNTpSNZf/PpGE/KwQRWoKhZXtwlL0u
 OTQg==
X-Gm-Message-State: ACgBeo0NY1WW/FWsAg25FNDA9GviDbJggDo8pzKQYCcFNq84/ibiNmhJ
 pbl5oeXAfoIFu3aSVRWV27X8Lb2mAYEiiiCa0X+XG9ea+Sz58wU5Zpi+BiA75DyhqGHBmaj7Ryi
 zv/gvwP+of1QU9N3eEfljKbanJONCPNda7GJC7VfRfc7uVJHJze+ueYtiMjKeayZR/HY=
X-Received: by 2002:a17:907:843:b0:73a:5b0e:8352 with SMTP id
 ww3-20020a170907084300b0073a5b0e8352mr16935957ejb.438.1662937461511; 
 Sun, 11 Sep 2022 16:04:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR43SYMurGLCcizna+WWSJeLSl0rqLXiSRw6CDoRUjdeGm+mqTo0v8NhI5MrQMhZHIwEprEGgw==
X-Received: by 2002:a17:907:843:b0:73a:5b0e:8352 with SMTP id
 ww3-20020a170907084300b0073a5b0e8352mr16935941ejb.438.1662937461128; 
 Sun, 11 Sep 2022 16:04:21 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170906300d00b00770880dfc4fsm3454502ejz.29.2022.09.11.16.04.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:04:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/37] target/i386: new decoder + AVX implementation
Date: Mon, 12 Sep 2022 01:03:40 +0200
Message-Id: <20220911230418.340941-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This series fleshes out more of the prototype table-driven decoder
and uses it to implement SSE and AVX.

As expected, there's a lot more lines here than in Paul's version
(roughly twice as much), but in my opinion it is a price worth paying
for future maintainability and for easier code review.  Nevertheless,
I cannot even explain how much his work helped; the authorship in
the log below doesn't tell the whole story because a bunch of patches
were extracted from his post and somewhat redone, not to mention the
wonderful tests.  In other words, he did all the hard and important work
that allowed me to proceed piecewise (and fast).

Interestingly, this also found a bunch of errors in the Intel manual,
which I have noted in the source and have forwarded to the contacts I
have there.  But overall the manual proved to be very easy to convert
to source code.  About 10% of the instructions needed some kind of
special casing, most of them due to differences between register and
memory operands.

Inspired by Richard's series at
https://lore.kernel.org/qemu-devel/20220822223722.1697758-1-richard.henderson@linaro.org,
I also took the opportunity to use gvec here and there, especially for
moves.  However, helpers are not converted to gvec style.  Another
possible cleanup to be done on top entails checking which helpers really
need the cpu_env argument.  Most of the integer ones probably don't,
for example, because the separate generator functions of the new decoder
provide a little more flexibility there.

This is not quite ready for commit, mostly because I haven't yet tested
it on big-endian architectures and on system emulation, but I thought I'd
throw it out early.  SSE4a translation is not tested yet either, and I will
probably convert 3DNow to the new decoder too, because it seems trivial.

Compared to the very first post, of course the decoder core is more
fleshed out.  New features include: supporting MMX instructions without
having to write them down separately; 4-operand instructions; CPUID
feature testing; simplified handling of opcodes with mandatory 66/F3/F2
prefixes.  On the other hand I left out the implementation of the one
byte opcodes, focusing on MMX and SSE instead.  Some "specials" are
not needed (e.g. NoSeg which is used for LEA) so it's not included.

Patches 1-4 are cleanups to translate.c that come in handy with the new
decoder.

Patches 5-11 add the generic framework for x86 decoding.

Patches 12-13 move all existing VEX instructions to the new decoder.
While at it, it also add the other integer instructions in the 0F38 and
0F3A opcode range, because the corresponding patches for SSE and AVX
instructions are big enough.  As of patch 13, however, these non-VEX
instructions will still be translated by the old decoder.

Patches 14-19 extend the helpers to support AVX 3- and 4-operand
instructions.  Patch 15 is by far the nastiest but it's not really
possible to split it further; a consolation is that the translate.c
part of it goes away with the SSE reimplementation.

Unlike in Paul's AVX series, I chose to implement the "merging" behavior
of AVX 3-operand scalar operations (VADDSx, VSQRTSx, etc.) in the
helpers rather than in TCG ops, so that change is also introduced at
this step; for more information see patches 16 and 17.

Patches 20-31 implement SSE and AVX instruction translation in the new
decoder.  The patches generally operate on groups of 8 to 24 opcodes,
though there are a couple bigger ones for the 0F38 and 0F3A opcodes.

Patches 32-35 finally enable AVX, and patches 35-36 removes now-unused
translator and helper code.

Paolo

Paolo Bonzini (32):
  target/i386: make ldo/sto operations consistent with ldq
  target/i386: REPZ and REPNZ are mutually exclusive
  target/i386: introduce insn_get_addr
  target/i386: add core of new i386 decoder
  target/i386: add ALU load/writeback core
  target/i386: add CPUID[EAX=7,ECX=0].ECX to DisasContext
  target/i386: add CPUID feature checks to new decoder
  target/i386: validate VEX prefixes via the instructions' exception classes
  target/i386: validate SSE prefixes directly in the decoding table
  target/i386: add scalar 0F 38 and 0F 3A instruction to new decoder
  target/i386: remove scalar VEX instructions from old decoder
  target/i386: extend helpers to support VEX.V 3- and 4- operand encodings
  target/i386: support operand merging in binary scalar helpers
  target/i386: provide 3-operand versions of unary scalar helpers
  target/i386: implement additional AVX comparison operators
  target/i386: Introduce 256-bit vector helpers
  target/i386: reimplement 0x0f 0x60-0x6f, add AVX
  target/i386: reimplement 0x0f 0xd8-0xdf, 0xe8-0xef, 0xf8-0xff, add AVX
  target/i386: reimplement 0x0f 0x50-0x5f, add AVX
  target/i386: reimplement 0x0f 0x78-0x7f, add AVX
  target/i386: reimplement 0x0f 0x70-0x77, add AVX
  target/i386: reimplement 0x0f 0xd0-0xd7, 0xe0-0xe7, 0xf0-0xf7, add AVX
  target/i386: reimplement 0x0f 0x3a, add AVX
  target/i386: reimplement 0x0f 0x38, add AVX
  target/i386: reimplement 0x0f 0xc2, 0xc4-0xc6, add AVX
  target/i386: reimplement 0x0f 0x10-0x17, add AVX
  target/i386: reimplement 0x0f 0x28-0x2f, add AVX
  target/i386: implement XSAVE and XRSTOR of AVX registers
  target/i386: implement VLDMXCSR/VSTMXCSR
  tests/tcg: extend SSE tests to AVX
  target/i386: move 3DNow completely out of gen_sse
  target/i386: remove old SSE decoder

Paul Brook (3):
  target/i386: add AVX_EN hflag
  target/i386: Prepare ops_sse_header.h for 256 bit AVX
  target/i386: Enable AVX cpuid bits when using TCG

Richard Henderson (2):
  target/i386: Define XMMReg and access macros, align ZMM registers
  target/i386: Use tcg gvec ops for pmovmskb

 target/i386/cpu.c                |   10 +-
 target/i386/cpu.h                |   59 +-
 target/i386/helper.c             |   12 +
 target/i386/helper.h             |    9 +
 target/i386/ops_sse.h            |  655 ++++++---
 target/i386/ops_sse_header.h     |  339 +++--
 target/i386/tcg/decode-new.c.inc | 1694 ++++++++++++++++++++++
 target/i386/tcg/decode-new.h     |  242 ++++
 target/i386/tcg/emit.c.inc       | 2323 ++++++++++++++++++++++++++++++
 target/i386/tcg/fpu_helper.c     |  134 +-
 target/i386/tcg/translate.c      | 2071 ++------------------------
 tests/tcg/i386/Makefile.target   |    2 +-
 tests/tcg/i386/test-avx.c        |  201 +--
 tests/tcg/i386/test-avx.py       |    3 +-
 14 files changed, 5374 insertions(+), 2380 deletions(-)
 create mode 100644 target/i386/tcg/decode-new.c.inc
 create mode 100644 target/i386/tcg/decode-new.h
 create mode 100644 target/i386/tcg/emit.c.inc

-- 
2.37.2


