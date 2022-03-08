Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680864D1BD3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 16:36:37 +0100 (CET)
Received: from localhost ([::1]:51090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRbt6-0000E3-AZ
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 10:36:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRbrq-0007ya-AP
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:35:18 -0500
Received: from [2607:f8b0:4864:20::b2c] (port=39703
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRbro-0007rH-AT
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:35:17 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id x200so38489738ybe.6
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 07:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=WbeGTH27QxiUcBNcRS0+Kj5hYrJcN/a9xpEVq/XH79Q=;
 b=SmEVVv95keftov8VueCM7hbtRnDr43dG3RwqaM6RV4vT03w9PtvH/UbP3PvtBG/igq
 inWWA8K+GDdtzhGHmO3OIzf7mGcVSYDZPFZqNRcmKnJGlsH6Ni9hCvElnYR+vz1q0OOX
 iSP+2nwLaNwpbh+A5YUqd8J88peQ8JRJW7kKcbFnbnhV5ls2xmsf/mZ58ycJ/kWPWkC2
 OTZ5nvQVvx4rZfGCM0pgUZ6/iUFMLih57OV8eC9XL8W5njpn4Lh1gxMH1/R6KDqd0V/y
 FLJwTmEXpGwZPokD98cTMH5CVUXDzkWa7NfsC875LvBKPxB21opSSDv8xI1JF7wri/rc
 RLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=WbeGTH27QxiUcBNcRS0+Kj5hYrJcN/a9xpEVq/XH79Q=;
 b=oH5RK2dOlV/F6E0iN6/NhqBe7DHPgAGVVtvrwVwXCCu+bTZTzlaQT4XEC2If21mUDW
 A4qtNdSQK4bwU0z40RhFEwGhIa/EW1KTZV78WfL8gSVz+LxXUQte0SB/90kB8wk7+73/
 zgGOiI5T/pr5sCwdYZtgUjmR0DEwrz3xnuCwIBAjM/2PWB4ILDOt+uk37RZVvwJH9FCj
 GRnl5IFxatG/AwA5k/NdpXVefArG+pEE0GYL2pt9vcG7Vj772rwoqDFnKzX2rbEQ5paX
 4yfE1RXaSYMb2QM33S3s/bjEF1UfUWffZt1SMyYpb8NTSW8K1/1URniDV2xouZBuLrR6
 i9hQ==
X-Gm-Message-State: AOAM530B6KmJc4tP0YXhJdtMBW8wsI8nBRPMhwtNTO1ipdvAFuP5Jr7k
 Y3l/nt7ivbplh8TjmRo81r9Dk/DZAbrEx7zCRrLXiDFlPQ22j2ti
X-Google-Smtp-Source: ABdhPJxaXNbIbmJVLOfw3szgy85qesTyCCG6Y0NirSMUOrMnjxKryvE0z2n1eVNB4z/ou9sWxs61zt2uEWzFIudgk9U=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr12232603ybp.39.1646753712555; Tue, 08
 Mar 2022 07:35:12 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 15:35:01 +0000
Message-ID: <CAFEAcA82N5JE+yihXMaaVC1HHBcPekamrMPOCSD2viuDjzzwNg@mail.gmail.com>
Subject: compile failure in cputlb.c when building with clang sanitizer
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you build on Ubuntu with

'../../configure' '--cc=clang' '--cxx=clang++' '--enable-sanitizers'
'--enable-debug' '--extra-cflags=-O1 -fno-omit-frame-pointer
-fno-optimize-sibling-calls'

(which is something like what the clang documentation recommends)

then you get a compile error in cputlb.c:

/usr/bin/ld: /usr/lib/llvm-10/lib/clang/10.0.0/lib/linux/libclang_rt.asan-x86_64.a(asan_interceptors_vfork.S.o):
warning: common of `__interception::real_vfork' overridden by
definition from
/usr/lib/llvm-10/lib/clang/10.0.0/lib/linux/libclang_rt.asan-x86_64.a(asan_interceptors.cpp.o)
/usr/bin/ld: libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: in
function `load_memop':
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../accel/tcg/cputlb.c:1902:
undefined reference to `qemu_build_not_reached_always'
/usr/bin/ld: libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: in
function `store_memop':
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../accel/tcg/cputlb.c:2228:
undefined reference to `qemu_build_not_reached_always'
/usr/bin/ld: libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: in
function `load_memop':
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../accel/tcg/cputlb.c:1902:
undefined reference to `qemu_build_not_reached_always'


It looks like somebody's encountered this before, because
scripts/oss-fuzz/build.sh contains a hacky wokraround for it
involving undefining __OPTIMIZE__.

How can we deal with this in a way that works for everybody
compiling QEMU ? I guess we could just drop the
qemu_build_not_reached() lines...

thanks
-- PMM

