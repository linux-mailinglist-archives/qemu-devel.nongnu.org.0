Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DAF5A0098
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:42:16 +0200 (CEST)
Received: from localhost ([::1]:56282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQuOM-0003Go-ML
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuEE-0001eR-EM
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:31:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuE7-0003iE-52
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661362295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NQF2WKzK0pG9dNSmEWDdGqDWFf35QSCd89aUSTUO8D0=;
 b=YKC9vP8FyPU1E2lD0he61E6p7XXy5kr5PmYfy3JpRh/5DqPjW9YesaIWdJ/xZWaCD5cM7k
 MPAYJCY1jIYA5KbNkx2xnIUR93BPZjrYbdxiUBimbgKl6AGn2A7bQeeShihu7ND3qk7/wr
 sW6bN+3wtuZZUdgLrRLvpnZVt0cS4us=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-aQeF47ScOOGSoWvAYStgbQ-1; Wed, 24 Aug 2022 13:31:28 -0400
X-MC-Unique: aQeF47ScOOGSoWvAYStgbQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 c22-20020adfa316000000b0022574c2dc1aso358028wrb.2
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 10:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=NQF2WKzK0pG9dNSmEWDdGqDWFf35QSCd89aUSTUO8D0=;
 b=68Lf/XAU5WO39oEDiXqRcI101mRARtQl6X4nMdIpUe6mRjM2JSlOc+AQX3rm2UXLoG
 KUolmZgClqZSuX+wN9h3tt+UoB6y21PaRUhUM3hF7go2WA5yJKN8ipLPisJYSva5eD64
 Cz6vQCnxXwRLbjxkSuPt+9b6ba/b50NLXIC1wUywL+2mkiFpXhoNszq3Q1wSuqYv/glh
 UMFgw8l+kbUJIf4pbbHBzr9JANKoxf8aOJhaNcHO5xYIj79eizUCnYG6GCaRUGBrkRCM
 hXBSvaZmkXmGgt1rhygM8U1RmodapYItgN8PMBsddvb+40CHRBbnKsoLu7eg68BMldoD
 xemg==
X-Gm-Message-State: ACgBeo2p5wRbKz/5y1asY0FftljchFDKbgT0qD3iEFMx92H6xNCSv3Ft
 OrE0UQmuvXR3bdjQiwz876rhCsIhpGzIVzxvB01vc1ewLbZ4HxalLJnzO250TvLc/IqJ+WZKeFZ
 Hla/1Guf8TFf/j3Dhz1xsx0e/+xikf8Z7ruG4kgqsr0CNHFSDTauFJGuVd3zowFUOVSk=
X-Received: by 2002:adf:eb4a:0:b0:223:9164:b5f6 with SMTP id
 u10-20020adfeb4a000000b002239164b5f6mr152199wrn.113.1661362285526; 
 Wed, 24 Aug 2022 10:31:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Do91ufQeD45nyVJXpiBX4O91Q/z3E0FMgt5SgFxljwFOUuFxjdWUlakGk1TfiaaqXkGjUJw==
X-Received: by 2002:adf:eb4a:0:b0:223:9164:b5f6 with SMTP id
 u10-20020adfeb4a000000b002239164b5f6mr152182wrn.113.1661362285165; 
 Wed, 24 Aug 2022 10:31:25 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 p15-20020adfcc8f000000b002252ec781f7sm17711744wrj.8.2022.08.24.10.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 10:31:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [RFC PATCH 00/17] (The beginning of) a new i386 decoder
Date: Wed, 24 Aug 2022 19:31:06 +0200
Message-Id: <20220824173123.232018-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
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

While looking again at Paul's patches for AVX, I came to the conclusion
that the x86 decoder is unsalvageable.  The encoding of x86 is simply too
messy for it to be decoded in code; huge tables, derived as much as possible
from the architecture reference, are the real way to go.

So here is a new, albeit partial decoder, that is based on three principles:

- use mostly table-driven decoding, using tables derived as much as possible
  from the Intel manual, keeping the code as "non-branchy" as possible

- keep address generation and (for ALU operands) memory loads and write back
  as much in common code as possible, to avoid code duplication (this
  is less relevant to non-ALU instructions because read-modify-write
  operations are rare)

- do minimal changes on the old decoder while allowing incremental
  replacement of the old decoder with the new one

So this series introduces the main decoder flow, integrates it with the
old decoder (which takes care of parsing prefixes and then optionally
drops to the new one based on the first byte of the opcode), and
implements three quarters of the one byte opcodes.

It is only lightly tested but it can boot to iPXE and run some 64-bit
coreutils just fine; Linux seems to trigger a bug in outsw/l/q emulation
that I haven't checked yet, but still it's enough to show the result of
a couple days of hacking.

The generated code is mostly the same, though marginally worse in some
cases because I privileged code simplicity.  For example, MOVSXD is not
able to use MO_SL and falls back to MO_UL + sign extension.  One notable
difference is that the new decoder always sign-extends 8-bit immediates,
so for example a "cmpb $e9, %dl" instruction will subtract $0xfff...fffe9
from the temporary value.  This is the way Intel intended "Ib" immediates
to work, and there's no difference between the two.

Anyay, porting these opcodes is really more of a validation for the
whole concept and a test for the common decoder code; it's probably more
efficient to focus on the SSE and VEX 2-byte and 3-byte opcodes as a path
towards enabling AVX in QEMU, and keep the existing decoder for non-VEX,
non-SSE opcodes.  Getting the conditions right for VEX.L, VEX.W etc. is
going to be, well, vexing because of the way Intel has decided to format
the exception tables in the manual, but it should be feasible to use a
more table-based decoding process for those operations as well.

The series is available at https://gitlab.com/bonzini/qemu.git, branch i386.

Paolo

Paolo Bonzini (17):
  target/i386: extract old decoder to a separate file
  target/i386: introduce insn_get_addr
  target/i386: add core of new i386 decoder
  target/i386: add ALU load/writeback core
  target/i386: add 00-07, 10-17 opcodes
  target/i386: add 08-0F, 18-1F opcodes
  target/i386: add 20-27, 30-37 opcodes
  target/i386: add 28-2f, 38-3f opcodes
  target/i386: add 40-47, 50-57 opcodes
  target/i386: add 48-4f, 58-5f opcodes
  target/i386: add 60-67, 70-77 opcodes
  target/i386: add 68-6f, 78-7f opcodes
  target/i386: add 80-87, 90-97 opcodes
  target/i386: add a0-a7, b0-b7 opcodes
  target/i386: do not clobber A0 in POP translation
  target/i386: add 88-8f, 98-9f opcodes
  target/i386: add a8-af, b8-bf opcodes

 target/i386/tcg/decode-new.c.inc | 1254 +++++++
 target/i386/tcg/decode-old.c.inc | 5707 +++++++++++++++++++++++++++++
 target/i386/tcg/emit.c.inc       |  684 ++++
 target/i386/tcg/translate.c      | 5822 +-----------------------------
 4 files changed, 7740 insertions(+), 5727 deletions(-)
 create mode 100644 target/i386/tcg/decode-new.c.inc
 create mode 100644 target/i386/tcg/decode-old.c.inc
 create mode 100644 target/i386/tcg/emit.c.inc

-- 
2.37.1


