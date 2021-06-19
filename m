Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47563AD775
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 05:45:24 +0200 (CEST)
Received: from localhost ([::1]:54490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luRv9-0002jk-He
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 23:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtT-00008A-6B
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:39 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtN-0007zy-Aj
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:38 -0400
Received: by mail-pf1-x430.google.com with SMTP id a127so9195607pfa.10
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 20:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9XGzMLM3vv6NxvkR/OUF5FXNULA4phEJC4Y6bmtF9U4=;
 b=Hm7VYj0eo82i9aT+B9NoLIjprIIwKTm9/qH+XVtgK8GBnmRl0ne2T3gasjKmxJhvz4
 kxSl0302G9umnuKOJ8XRvhAR+LcdiEmG/Ark+3gjzpLKcfkNwu7gzM4PnKpq0zSGaVSp
 V1JGGKXboAkfwU8e4xFtIWRCR9n3NPYm6qEJK5KU2+poSzsI9mQVVlYPC780nasSp+zh
 EpE7e7ltyb0ujrk1coQTgK66tO8l78X28XRIRKvSNSGHHGAxRpIRfNy3FJ87mGTNYBWS
 71XWh0LM7IDqOBmzgB3J+fp0WQHa4yOoexo2NE+pe8xm4X7tm1RpNDKttaQBP2B7GCeS
 RMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9XGzMLM3vv6NxvkR/OUF5FXNULA4phEJC4Y6bmtF9U4=;
 b=UggiKWLKY/ePxJSsKEbXuEw7nfnnxB7M8WvBkLiIB4hQwOBBSJJ3pFO3umePfbLEih
 mwA6ESG+PZmeX6H1R38pn7JhIofi35U2aeV9ZIcHaSmIr+RCExiumxrey2fgxvse3v3C
 kSAV9nwFs09L+4n7kqBDMLw3eqVWpnIv4KVzfxaUGO+E4Zcld1z5AheY5qKgySKkipVK
 zSzRlTOER7iY7nW4X2SkVlmFSyA4fJBTXVRU8yXTo3ycsVnoF0vye6pG1zOO0RoMVJd5
 thqsRYZ8AYQIKjN2EsY3krc5sH3JueoQJhBwXXTuH6hfekoPoyRROfvbiSMcGcQMGXNw
 PmtA==
X-Gm-Message-State: AOAM532yZMYjo+guTqJ/NQGndPFIbnXXV6Wxnzf9cl8tgU1PnCgLG6DI
 IA5rF74Sx/Fwe9iWezjfYJk0Dq4K/Qtt+w==
X-Google-Smtp-Source: ABdhPJxuadCf3s7esmWpZhED5F1u9fgwnOWIsjYhLiFdHpkdnM8iEPQfOFZXd5FHwaksIUT9C7vmOg==
X-Received: by 2002:aa7:9569:0:b029:2f8:2cf3:e9dd with SMTP id
 x9-20020aa795690000b02902f82cf3e9ddmr8635073pfq.10.1624074210716; 
 Fri, 18 Jun 2021 20:43:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z6sm10045154pgs.24.2021.06.18.20.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 20:43:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/12] linux-user: Load a vdso for x86_64 and hppa
Date: Fri, 18 Jun 2021 20:43:17 -0700
Message-Id: <20210619034329.532318-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Supersedes: 20200519194452.9009-1-richard.henderson@linaro.org
Based-on: 20210618192951.125651-1-richard.henderson@linaro.org
("[PATCH v2 00/23] linux-user: Move signal trampolines to new page")

Previous cover letter:
> The subject of AT_SYSINFO came up on launchpad recently.
> 
> There is definite room for improvement in all of this:
> 
> (1) We could build the vdso binary into qemu instead of really
>     loading it from the file system.  This would obviate the
>     several problems of locating the .so file.  It would also
>     mean that --static builds continue to create a standalone
>     qemu binary.
> 
> (2) We could use our cross-build system to build the vdso.
>     Though we'd still likely want to keep the image in git
>     along side the other rom images for when cross-build is
>     not available.
> 
> (3) There are some ??? comments where some decisions could be made,
>     and other ??? that are merely commenting on weirdness.
> 
> (4) It shouldn't take too much effort to create vdsos for the
>     other architectures.  But we should get this one as clean
>     as we can first.

Amusingly, this patch set has turned 11 years old.
First posted April 4, 2010.

Change since previous:

Point (1) has been addressed: the vdso binary pre-processed,
validating the VDSO image, emitting a C array for the image,
collecting the set of relocations required, and identifying
any signal return trampolines.

Point (2) is still an issue in that the cross-build system is
tied up in tests/ makefiles.  It might be time to bite the bullet
and convert it all to meson.

I think there are fewer ??? than before.


r~


Richard Henderson (12):
  linux-user: Fix style problems in linuxload.c
  linux-user: Introduce imgsrc_read, imgsrc_read_alloc
  linux-user: Tidy loader_exec
  linux-user: Do not clobber bprm_buf swapping ehdr
  linux-user: Use ImageSource in load_elf_image
  linux-user: Use ImageSource in load_symbols
  linux-user: Replace bprm->fd with bprm->src.fd
  linux-user: Introduce imgsrc_mmap
  linux-user: Load vdso image if available
  linux-user: Add gen-vdso tool
  linux-user/x86_64: Add vdso
  linux-user/hppa: Add vdso and use it for rt_sigreturn

 linux-user/qemu.h               |  60 ++++++-
 linux-user/elfload.c            | 305 ++++++++++++++++++--------------
 linux-user/flatload.c           |   8 +-
 linux-user/gen-vdso.c           | 168 ++++++++++++++++++
 linux-user/hppa/signal.c        |   8 +-
 linux-user/linuxload.c          | 171 +++++++++++++-----
 linux-user/gen-vdso-elfn.c.inc  | 299 +++++++++++++++++++++++++++++++
 linux-user/hppa/Makefile.vdso   |   4 +
 linux-user/hppa/meson.build     |   6 +
 linux-user/hppa/vdso.S          | 149 ++++++++++++++++
 linux-user/hppa/vdso.ld         |  75 ++++++++
 linux-user/hppa/vdso.so         | Bin 0 -> 5192 bytes
 linux-user/meson.build          |   6 +-
 linux-user/x86_64/Makefile.vdso |   3 +
 linux-user/x86_64/meson.build   |   6 +
 linux-user/x86_64/vdso.S        | 122 +++++++++++++
 linux-user/x86_64/vdso.ld       |  74 ++++++++
 linux-user/x86_64/vdso.so       | Bin 0 -> 5912 bytes
 18 files changed, 1272 insertions(+), 192 deletions(-)
 create mode 100644 linux-user/gen-vdso.c
 create mode 100644 linux-user/gen-vdso-elfn.c.inc
 create mode 100644 linux-user/hppa/Makefile.vdso
 create mode 100644 linux-user/hppa/vdso.S
 create mode 100644 linux-user/hppa/vdso.ld
 create mode 100755 linux-user/hppa/vdso.so
 create mode 100644 linux-user/x86_64/Makefile.vdso
 create mode 100644 linux-user/x86_64/vdso.S
 create mode 100644 linux-user/x86_64/vdso.ld
 create mode 100755 linux-user/x86_64/vdso.so

-- 
2.25.1


