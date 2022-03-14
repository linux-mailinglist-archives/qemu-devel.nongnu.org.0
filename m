Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E997D4D7ED5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 10:40:47 +0100 (CET)
Received: from localhost ([::1]:40008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThC1-0001xY-Eq
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 05:40:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3i-0007oj-3Y; Mon, 14 Mar 2022 05:32:10 -0400
Received: from [2a00:1450:4864:20::42e] (port=45874
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3f-00082i-2F; Mon, 14 Mar 2022 05:32:08 -0400
Received: by mail-wr1-x42e.google.com with SMTP id p9so22807458wra.12;
 Mon, 14 Mar 2022 02:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q74Tt6XMSzyocwTWJcJ0diDImK8Yx4qOIuc3hBkglIQ=;
 b=N3g1m3iKCNDegKaE07FrpNFwj6/BxQpIV1F5RUZozP8Xuui1XdF95lKswIhkArVsci
 5PRnIjXTOKqjzEQuXOeK9iKKC8Ko8kBiMmxPgm0g5EhSvBy3wDRBwfZsu80FIrLklSXc
 V5X9ucC28i8D9gO6xH3+hs0YtUnE91YI2B+TtlXR0ybpbPkQsVlGRt31avEPUqU1mX5C
 qIgXUiyajVqIIVuSFvRoGFYTbkSoGlz0kzOjsOR8CA7cuf025ET2VfNiK2qoVLpymWTI
 6m/a9I1Ds1i6DMSp/ln29McFNFDUCGesaeQkOm9mrXfgxaz3d9tIBQqQIbuImElBAA+d
 OHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Q74Tt6XMSzyocwTWJcJ0diDImK8Yx4qOIuc3hBkglIQ=;
 b=zNpqT5W6t2GSM6ngxrzVjLuWyFTZvhRDEKweGUbtD9OwuUDxS5lUa3Lz/cClY5jZAw
 I1QQ5gHf+sONVc6Aeh/6uoFIHC5lYyX0klkZQcXaBpyf10kT8vqw7/VEjzFB9itZsae5
 IReNbd5y6X6msPZauZjAbu0RZgtq2jENZVe7wRm3H5WrUGOGCO8PBipheusYOTzUztxG
 UHVHGOZMAhiMHEvS++VNkO/Z/w12tIkddYfOB+ZncjoYEKa2RzksZxaQ9EoAyY038NWS
 ek6+WaFwlSNzDVFrTMrvBDvGL4lAU9gRjegmx8NHSm59EpDEskR6sXcLR2QtwCeMJgtA
 xSKg==
X-Gm-Message-State: AOAM532b7QSsUmZedRNhY/sWUTCNDwJqdv5/MRykK/2WR9E2AeDJAoEm
 R2ScHcUolA00x0/51jjnsRka+PVgNXc=
X-Google-Smtp-Source: ABdhPJwcq8zLIXFFjDoJ6iB/38uiE0Tjxs6FLnB8eK255gqKQ+4pScb3mJacsJyp7HlT2fmK9lb+Nw==
X-Received: by 2002:adf:ca08:0:b0:1ed:c0bc:c212 with SMTP id
 o8-20020adfca08000000b001edc0bcc212mr15457661wrh.577.1647250325013; 
 Mon, 14 Mar 2022 02:32:05 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfe9c7000000b001f06f8ec92dsm12707517wrn.30.2022.03.14.02.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 02:32:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH experiment 00/16] C++20 coroutine backend
Date: Mon, 14 Mar 2022 10:31:47 +0100
Message-Id: <20220314093203.1420404-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-block@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It turns out that going from a prototype C++ implementation of the QEMU
API, to something that could build tests/unit/test-coroutine, was just a
few hours work; and once it compiled, only one line had to be changed
for every test to pass.

Most of the differences between C and C++ already show up here:

- keywords such as "new" (or "class", which I didn't encounter yet)

- _Generic must be replaced by templates and/or overloading (QemuCoLockable
is implemented completely different from QemuLockable, in fact I spent
most of the time on that)

- PRI* functions must be separated with a space from string constants that
precede it

- void* casts must be explicit (g_new takes care of that most of the time,
but not for opaque pointers passed to coroutine).

There are 300 lines of hard-core C++ in the backend and in
coroutine.h.  I tried to comment it as much as possible (this
time I didn't include a big commit message on stackless coroutines
in general) but it still requires some knowledge of the basic C++
coroutine concepts of resumable types, promise types and awaiter types.
https://www.youtube.com/watch?v=ZTqHjjm86Bw is an excellent introduction
and it's where I learnt most of what was needed.

However, there  are no ramifications to actual coroutine code, except
for the template syntax "CoroutineFn<return_type>" for the function and
the mandatory co_await/co_return keywords... both of which are an
improvement, really: the fact that a single function cannot run either
inside or outside coroutines is checked by the compiler now, because
qemu_coroutine_create accepts a function that returns CoroutineFn<void>.
Therefore I had to disable some more code in util/ and qapi/ that used
qemu_in_coroutine() or coroutine_fn.

Here is the performance comparison of the three backends:

                   ucontext           stackless C       stackless C++
/perf/lifecycle    0.068 s            0.025 s           0.065 s
/perf/nesting      55 s               4.7 s             1.7 s
/perf/yield        6.0 s              1.3 s             1.3 s
/perf/cost         8 Mops/s (125ns)   35 ns             10000 Mops/s (99 ns)

One important difference is that C++ coroutines allocate frames on the
heap, and that explains why performance is better in /perf/nesting,
which has to do many large memory allocations for the stack in the other
two backends (and also a makecontext/swapcontext in the ucontext case).
C++ coroutines hardly benefit from the coroutine pool; OTOH that also
means the coroutine pool could be removed if we went this way.

I haven't checked why /perf/lifecycle (and therefore /perf/cost; they
are roughly the same test) is so much slower than the handwritten C code.
It's still comparable with the ucontext backend though.

Overall this was ~twice the amount of work of the C experiment, but
that's because the two are very different ways to achieve the same goal:

- the design work was substantially smaller in the C experiment, where
all the backend does is allocate stack frames and do a loop that invokes
a function pointer.  Here the backend has to map between the C++ concepts
and the QEMU API.  In the C case, most of the work was really in the
manual conversion which I had to do one function at a time.

- the remaining work is also completely different: a source-to-source
translator (and only build system work in QEMU) for the C experiment;
making ~100 files compile in C++ for this one (and relatively little
work as far as coroutines are concerned).

This was compiled with GCC 11 only.  Coroutine support was added in
GCC 10, released in 2020, which IIRC is much newer than the most recent
release we support.

Paolo

Paolo Bonzini (17):
  coroutine: add missing coroutine_fn annotations for CoRwlock functions
  coroutine: qemu_coroutine_get_aio_context is not a coroutine_fn
  coroutine: small code cleanup in qemu_co_rwlock_wrlock
  coroutine: introduce QemuCoLockable
  port atomic.h to C++
  use g_new0 instead of g_malloc0
  start porting compiler.h to C++
  tracetool: add extern "C" around generated headers
  start adding extern "C" markers
  add space between liter and string macro
  bump to C++20
  remove "new" keyword from trace-events
  disable some code
  util: introduce C++ stackless coroutine backend
  port QemuCoLockable to C++ coroutines
  port test-coroutine to C++ coroutines

 configure                                     |  48 +-
 include/block/aio.h                           |   5 +
 include/fpu/softfloat-types.h                 |   4 +
 include/qemu/atomic.h                         |   5 +
 include/qemu/bitops.h                         |   3 +
 include/qemu/bswap.h                          |  10 +-
 include/qemu/co-lockable.h                    |  93 ++++
 include/qemu/compiler.h                       |   4 +
 include/qemu/coroutine.h                      | 466 +++++++++++++-----
 include/qemu/coroutine_int.h                  |   8 +
 include/qemu/host-utils.h                     |   4 +
 include/qemu/lockable.h                       |  13 +-
 include/qemu/notify.h                         |   4 +
 include/qemu/osdep.h                          |   1 +
 include/qemu/qsp.h                            |   4 +
 include/qemu/thread.h                         |   4 +
 include/qemu/timer.h                          |   6 +-
 include/qemu/typedefs.h                       |   1 +
 meson.build                                   |   2 +-
 qapi/qmp-dispatch.c                           |   2 +
 scripts/tracetool/format/h.py                 |   8 +-
 tests/unit/meson.build                        |   8 +-
 .../{test-coroutine.c => test-coroutine.cc}   | 138 +++---
 util/async.c                                  |   2 +
 util/coroutine-stackless.cc                   | 145 ++++++
 util/meson.build                              |  14 +-
 ...oroutine-lock.c => qemu-coroutine-lock.cc} |  78 +--
 ...outine-sleep.c => qemu-coroutine-sleep.cc} |  10 +-
 util/{qemu-coroutine.c => qemu-coroutine.cc}  |  18 +-
 util/thread-pool.c                            |   2 +
 util/trace-events                             |  40 +-
 31 files changed, 805 insertions(+), 345 deletions(-)
 create mode 100644 include/qemu/co-lockable.h
 rename tests/unit/{test-coroutine.c => test-coroutine.cc} (81%)
 create mode 100644 util/coroutine-stackless.cc
 rename util/{qemu-coroutine-lock.c => qemu-coroutine-lock.cc} (86%)
 rename util/{qemu-coroutine-sleep.c => qemu-coroutine-sleep.cc} (89%)
 rename util/{qemu-coroutine.c => qemu-coroutine.cc} (93%)

-- 
2.35.1


