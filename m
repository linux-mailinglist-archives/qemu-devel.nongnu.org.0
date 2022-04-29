Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEAC514CA5
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:21:56 +0200 (CEST)
Received: from localhost ([::1]:58014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkRVM-0002L4-0H
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRr-0005fh-1D
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:19 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:46723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRp-0004YJ-CV
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:18 -0400
Received: by mail-ed1-x52c.google.com with SMTP id g23so9226603edy.13
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 07:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=me8ISCL6neguclxc7hWBzhsvmt/wVxZYSaYSvcuFxI4=;
 b=HToqcvGTOkFhRi97xJhmFRABvHMMV/cwRjJpIxwT76CapAS3gTyKgYTmIV9NidVG6p
 eC4+73tYTUOxiFkM+1eWRwEZB09rcqVXGIrDMxfRQMNspPTzR6fw9qXys37EUangxJrL
 YOa0Lt9+y/QKtdi1fs1LqlqVi3c1WVAv/yTWKEMMfFaXZNrZIFn3G5sZNtgAr+d0tbc7
 tcLqAEF+7apbrFSjDI/SxFH2gfCKkPzcl5o+dy87STpgJ9wvliLt/Dh7O7m6pwiw0FnX
 KxL9RcJAOu9Gcok7v6fN/ANMDeiuEWSAaNh6YNvCrBEw1pxG4GlsgZigSaykgzpQ8bVX
 prwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=me8ISCL6neguclxc7hWBzhsvmt/wVxZYSaYSvcuFxI4=;
 b=o/NFGg9CoLtTfssnxLHXQ2lJLXbaQrs+J2M1ZT4957kk7kQip/IljvdKj46mSmavyZ
 tTVjMzQmENEIuowG3bAJ4jIId7TedB7lSWdAI7/LfvBy/O8w/RkO6OSlLhw6Zi3yMGsy
 a9G21gteU9b/xwVlis8jORcsh1h72ZScXM6VSURfBIkk65fVmPK0ZLUbkDeGzpVnHkiJ
 w2xr8tLhkS28W0ZB0PWnk3Sqbu7/RbJSWejvHmM6gvuVfy0CW8CTDYQaF1SSPPQRcRxG
 VCmjX++sujrBpDawCqYYOOkZnnB1UCcP2PEDAkEgvX4/z3igX2hB5fl0C0fMcNIYwIQj
 pmdA==
X-Gm-Message-State: AOAM533JxT+jirJHOJCJDy4J0bMZywTCnHV4WHrYEbpH41o0DdRmVe2D
 SY//p70hsIZ+azQpHS3tJJxAQgNl+Qux8g==
X-Google-Smtp-Source: ABdhPJwTp3+mVbulEmU+Wc2VqEnP/f1myTBEepP3/YJbfigw1h2RfVw7R2b+tPmfasA1HD2LVhcJ/w==
X-Received: by 2002:a05:6402:400b:b0:425:f59a:c221 with SMTP id
 d11-20020a056402400b00b00425f59ac221mr23448196eda.307.1651241894987; 
 Fri, 29 Apr 2022 07:18:14 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b006f3ef214e27sm692298ejc.141.2022.04.29.07.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 07:18:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/12] Cross compilation of embedded firmware
Date: Fri, 29 Apr 2022 16:18:01 +0200
Message-Id: <20220429141813.328975-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the next part of the firmware cross compilation story, and
shows a little more the direction I would like for QEMU's configure
script.

It basically does half of half of the work: it only looks at firmware
that's distributed with QEMU (optionrom, s390-ccw, vof) and does not do
docker cross compilers yet.  However, the important part is taking
infrastructure from the recently-cleaned-up tests/tcg/configure.sh, and
moving it in the main configure script so that others can use it.

tests/tcg is actually very close to being buildable as a standalone
project, so I actually expect the compiler tests to move back to
tests/tcg, as a "configure" script of sorts which would run at Make time
after the docker images are built.  The "Cygnus" (GCC/binutils/gdb) tree
has a similar idea of "configure" doing only bare-bones tree-wide
configuration, with the rest left for Make time; so that's where I took
inspiration from.

Paolo


Paolo Bonzini (12):
  tests/tcg: merge configure.sh back into main configure script
  configure: add missing cross compiler fallbacks
  configure: handle host compiler in probe_target_compiler
  configure: introduce --cross-prefix-*=
  configure: include more binutils in tests/tcg makefile
  configure, meson: move symlinking of ROMs to meson
  configure: move symlink configuration earlier
  configure: enable cross-compilation of s390-ccw
  pc-bios/optionrom: detect -fno-pie
  pc-bios/optionrom: compile with -Wno-array-bounds
  configure: enable cross-compilation of optionrom
  configure: enable cross compilation of vof

 configure                    | 597 +++++++++++++++++++++++++++++++----
 pc-bios/meson.build          |  18 +-
 pc-bios/optionrom/Makefile   |   8 +-
 pc-bios/s390-ccw/Makefile    |   9 +-
 pc-bios/s390-ccw/netboot.mak |   2 +-
 pc-bios/vof/Makefile         |  17 +-
 tests/Makefile.include       |   3 +-
 tests/tcg/configure.sh       | 376 ----------------------
 8 files changed, 564 insertions(+), 466 deletions(-)
 delete mode 100755 tests/tcg/configure.sh

-- 
2.35.1


