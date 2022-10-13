Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC375FE48A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 23:52:44 +0200 (CEST)
Received: from localhost ([::1]:33034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj68B-0008CA-Ei
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 17:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj62i-0002SS-Jz
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj62e-0005B5-GG
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xDdxiGONET2KJZxv2az42RAv/WtVx0DRgVDKpJ+003A=;
 b=FH808evFldxHlEq6ghS8YvO//RA87P7buX+yM4KN4B5zoakutQQnTKtMygiANyH5GUHSpp
 0bn5o0I8kbKdIK41vWRIyNLJUA45Sf7vudhwNl1+ZBzYkpe9CZVuIt64AkZAtt1ybGwFxZ
 mai1oipVgYu0LqUJHz1a5F2FuhUrNiI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-l1UXNn8ZPEaLsmhBIA53Rw-1; Thu, 13 Oct 2022 17:46:57 -0400
X-MC-Unique: l1UXNn8ZPEaLsmhBIA53Rw-1
Received: by mail-ej1-f71.google.com with SMTP id
 hp41-20020a1709073e2900b0078e07dbf280so1461796ejc.7
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xDdxiGONET2KJZxv2az42RAv/WtVx0DRgVDKpJ+003A=;
 b=ZboWMfk8Y4Q8lBQR/ivg6q9/+sgdEDotqv3sTaFeX8TUZXIsiwOay2FZlFlslE59F3
 FvzAs4ZhsdkbPG3TxZZdd6oTNjLBmtbaxnSnqoVW7deBK5RSvKjN265Nq4sc2D++qUst
 gfIiIxrbHNEQchms45H1jOMsPl91OlbTaMZEf51ZI+PwXdgnO5uVvDoca4uiOOXGkhpn
 4kTigZlQsQkYykCjGppkZPaoz+86wbkiXerL3/h7IeXxSyrmKcclJDHeFX/7+yaarugD
 G9a0WQmagWU0ncLARTqJ0gXhwsgxQPUPnE7CGmt8M6sPDG4YYbMSaoPxGchL/hScfPRI
 CZlA==
X-Gm-Message-State: ACrzQf3+y4b1osxmrGWhgNQs3t4tJ4/Dnt5nXYthsZ4HAohtE973DUzd
 OFQeVpNGFiJX+8w7K/ua0PwDdYas2NRT5Mg+Q8y1bjZug+BSELEY0qOmITgs1qcyyXYKZiCg0dZ
 bYgBHBE64Mke/0InLfyHBDTU5wCLJO9P3aCAjrvYcO83+k6+Eh4Y5XFpQhk1+loxVfmc=
X-Received: by 2002:a17:907:31c3:b0:770:852b:71a2 with SMTP id
 xf3-20020a17090731c300b00770852b71a2mr1289325ejb.557.1665697615848; 
 Thu, 13 Oct 2022 14:46:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5FkJIcmk/OBHkq63puqUm5QHvntDM0d+Y4hWjKCi4LoEC+yv6cCIzWbe63HaqNvEdZaHszDQ==
X-Received: by 2002:a17:907:31c3:b0:770:852b:71a2 with SMTP id
 xf3-20020a17090731c300b00770852b71a2mr1289313ejb.557.1665697615560; 
 Thu, 13 Oct 2022 14:46:55 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ky23-20020a170907779700b0078a86e013c4sm475416ejc.61.2022.10.13.14.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:46:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 00/35] target/i386: new decoder + AVX implementation
Date: Thu, 13 Oct 2022 23:46:16 +0200
Message-Id: <20221013214651.672114-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both PC-relative translation blocks and XSAVE state support in linux-user
signal handlers are in; as mentioned in the post of v2, this is the time
for a (mostly) final version of the AVX patches, with more review comments
addressed and a few more bugs fixed.

Paolo

v2->v3:
- removed patches that are now upstream
- change if to switch in gen_load_sse
- adjusted generic decoder code (e.g. gen_load_ea) for PC-relative TB changes
- fixed overlap checks for VSIB instructions
- changed vex_class from uint8_t:8 to unsigned:8
- changed gen_MOVD_to to use tcg_gen_st32_tl
- changed make_imm8u_xmm_vec to use cpu_env as base for xmm_t0 access
- changed gen_VZEROUPPER to not use maxsz=32 (for big-endian hosts)
- assume vece == MO_64 in gen_pmovmskb_vec
- fix #ifdef TARGET_I386 vs. #ifdef TARGET_X86_64 confusion
- change MOVNTDQA to use WM operand like LDDQU
- minor changes to fix qemu-i386 compilation (patches 27-29)
- removed dead helper_movq

Paolo Bonzini (30):
  target/i386: make ldo/sto operations consistent with ldq
  target/i386: add core of new i386 decoder
  target/i386: add ALU load/writeback core
  target/i386: add CPUID[EAX=7,ECX=0].ECX to DisasContext
  target/i386: add CPUID feature checks to new decoder
  target/i386: validate VEX prefixes via the instructions' exception
    classes
  target/i386: validate SSE prefixes directly in the decoding table
  target/i386: move scalar 0F 38 and 0F 3A instruction to new decoder
  target/i386: extend helpers to support VEX.V 3- and 4- operand
    encodings
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
  target/i386: clarify (un)signedness of immediates from 0F3Ah opcodes
  target/i386: reimplement 0x0f 0x3a, add AVX
  target/i386: reimplement 0x0f 0x38, add AVX
  target/i386: reimplement 0x0f 0xc2, 0xc4-0xc6, add AVX
  target/i386: reimplement 0x0f 0x10-0x17, add AVX
  target/i386: reimplement 0x0f 0x28-0x2f, add AVX
  target/i386: implement XSAVE and XRSTOR of AVX registers
  target/i386: implement VLDMXCSR/VSTMXCSR
  tests/tcg: extend SSE tests to AVX
  target/i386: move 3DNow to the new decoder
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
 target/i386/helper.h             |    3 +-
 target/i386/ops_sse.h            |  700 ++++++----
 target/i386/ops_sse_header.h     |  347 +++--
 target/i386/tcg/decode-new.c.inc | 1802 ++++++++++++++++++++++++
 target/i386/tcg/decode-new.h     |  249 ++++
 target/i386/tcg/emit.c.inc       | 2239 ++++++++++++++++++++++++++++++
 target/i386/tcg/fpu_helper.c     |   88 +-
 target/i386/tcg/translate.c      | 2078 ++-------------------------
 tests/tcg/i386/Makefile.target   |    2 +-
 tests/tcg/i386/test-avx.c        |  201 +--
 tests/tcg/i386/test-avx.py       |    5 +-
 14 files changed, 5286 insertions(+), 2509 deletions(-)
 create mode 100644 target/i386/tcg/decode-new.c.inc
 create mode 100644 target/i386/tcg/decode-new.h
 create mode 100644 target/i386/tcg/emit.c.inc

-- 
2.37.3


