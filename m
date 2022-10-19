Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CBD604ADA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:12:45 +0200 (CEST)
Received: from localhost ([::1]:33822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olAkO-0001b3-EN
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1olAeJ-0000b4-9M
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:06:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1olAeF-0000Mk-G6
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:06:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666191981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kY8lF1H854K+H1cLslvbScV0C+6aiYEC/vxTLjIwwQ8=;
 b=U/F3gPudEh6NbhKbTbX6FvFb5hpmxQ9s0oLa+g3WILLMq/cDJUrNN3AgeEJUlLJgYxZW6K
 SrI7ml5MynTvPNVdVeaEFe95OLeKOtuH1XjsmmK4dDftIBxpCtKQN0VfxRQxZq739xKbVE
 tWYaVHZm3TdRrZ7pxi/1lk/PMRrRGZ4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-OcSPvYSCNoSHohzQb5rflg-1; Wed, 19 Oct 2022 11:06:19 -0400
X-MC-Unique: OcSPvYSCNoSHohzQb5rflg-1
Received: by mail-qk1-f200.google.com with SMTP id
 u6-20020a05620a430600b006e47fa02576so15188211qko.22
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 08:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kY8lF1H854K+H1cLslvbScV0C+6aiYEC/vxTLjIwwQ8=;
 b=NtuxqcBt8DNeyqFPx1T9Goib97TnxRP2qUJ1GQ64GJwrwsNMhHC/YflT/VqDnbYb9T
 sGMYlJecPvUD3Sk+o2s0e7E0oqNdk4YMq79nGk0PKWpOQZXUjARCuxbFnil+xs3+jq7x
 kWPpQJAHy2V/RvwFRDxS7EI555XKZuGGPvlM2ya794k0q2QoTkho9v+rAIychZV8t0qD
 H4vqWOFGFmFTJSQyUCN4qtguWl6RswuWAvcC7QxAVvP+r7jc5OI2Wlp8m1+zh6KHfx3T
 C/jbr0ZPqRhuShNiE0yzPLTmXx+mF4dsV04kAsvUVyLfAeBgwesATS4naXxq34LpNDb9
 8nQA==
X-Gm-Message-State: ACrzQf00KMpKYzDhPJfxxrRM/rxLJ1eK7LuDHUEsW8QnJQWZEy5fj9YF
 HyRuq9SOM+CY3mdgXSycnWkcbStQFAEcrYt1lvHRfTuaw3PjVE6Wg+v8BvBAIqpqGxLMVvaisQA
 aC+3D+J+LeRHUXwylSlUVQpyk3IwBUtdy2FsIBYTnq3SP+t4Xo8OT3hTAOVDaNrzy204=
X-Received: by 2002:a05:620a:1365:b0:6ee:d9ef:36b with SMTP id
 d5-20020a05620a136500b006eed9ef036bmr5731374qkl.364.1666191978740; 
 Wed, 19 Oct 2022 08:06:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7WosBsgbng/pfmP13qvr2fBcNDxSS1YbpwI+/XO1hd+mLuxT1HAA7itCz3131x3JUGA4UR6w==
X-Received: by 2002:a05:620a:1365:b0:6ee:d9ef:36b with SMTP id
 d5-20020a05620a136500b006eed9ef036bmr5731344qkl.364.1666191978377; 
 Wed, 19 Oct 2022 08:06:18 -0700 (PDT)
Received: from avogadro.local (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id
 m21-20020ac866d5000000b0039cbd3e4ed1sm4188301qtp.6.2022.10.19.08.06.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 08:06:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/i386: support x86_64-v3 for user mode applications
Date: Wed, 19 Oct 2022 17:06:12 +0200
Message-Id: <20221019150616.929463-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The v3 ISA for x86_64 includes F16C and FMA instructions in addition to
AVX2 that was just committed for QEMU 7.2.  This small series implements
these two features and terminates my excursion into x86 TCG. :)

Patch 1 is a bugfix for the new decoder (sob).

Patch 2 introduces a common function to convert an x86 2-bit rounding
mode (as specified in FSTCW, STMXCSR and VROUND instructions).  Since
the same operand is used by the F16C instruction VCVTPS2PH, it is time
to reduce the code duplication instead of adding more.

Patches 3 and 4 is the actual implementation, which includes all of
helpers, decoding, TCG op emission and tests.  Output from QEMU
matches that from native x86.

Paolo Bonzini (4):
  target/i386: decode-new: avoid out-of-bounds access to xmm_regs[-1]
  target/i386: introduce function to set rounding mode from FPCW or
    MXCSR bits
  target/i386: implement F16C instructions
  target/i386: implement FMA instructions

 target/i386/cpu.c                |   8 +-
 target/i386/cpu.h                |   3 +
 target/i386/ops_sse.h            | 152 +++++++++++++++++++------------
 target/i386/ops_sse_header.h     |  34 +++++++
 target/i386/tcg/decode-new.c.inc |  46 ++++++++++
 target/i386/tcg/decode-new.h     |   3 +
 target/i386/tcg/emit.c.inc       |  60 +++++++++++-
 target/i386/tcg/fpu_helper.c     |  60 +++++-------
 tests/tcg/i386/test-avx.c        |  17 ++++
 tests/tcg/i386/test-avx.py       |   8 +-
 10 files changed, 289 insertions(+), 102 deletions(-)

-- 
2.37.3


