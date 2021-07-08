Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076103C1639
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:43:47 +0200 (CEST)
Received: from localhost ([::1]:45204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WBm-00030u-12
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1VnF-0001CI-Px
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:25 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1VnB-0008LB-Sr
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:23 -0400
Received: by mail-ej1-x635.google.com with SMTP id i20so10271342ejw.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A95uj4QvdZxCq2Mbt0sTIgU9jFjNfQDHFeRPy6Yji4s=;
 b=tGonlcV/efciH86wuGUpVxDutjM2wut+hmSwTF6pg0y3gi8p6dZ/7/bJMgypm5yUuh
 7gXVdPsVVwX00Kl9hoWRzry1p9Wf3SeMUXNOH+iwQqLeVyxAGkpGPYvstDtUo82f4rO+
 +LT5Vqo90OB4Mg9kz53fJQB6uwNISNm8/c38MD0hz0JQbtVjLTNVVTskKfPrvA/0A7Jj
 DnHcbf8qLzgTWcZP+S7DeHpa1Rn1ZKt+8ZnxsvRWNxp8tDZqHumIS4fKfmPDgSdw4cpL
 f+o6fHNL2r777EHbPHaaE98xzU5oJVP5ggCdVNVHREpIfvVo6JblZIxx8qM8cWxOiTHS
 13jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A95uj4QvdZxCq2Mbt0sTIgU9jFjNfQDHFeRPy6Yji4s=;
 b=SDmsYgwjTc7UMUBdepJ/Phz1NUw6PIDBxSiKT0fPuFtv/2GOTQyIQLaFP41sas5dVH
 YC4kwaWkmYYkrF9P6aLoOqfxH1deMqvj6v2xuAU95/NaQanaReulnglhz6EFtXxHfzvY
 luTFR8wArxuuirIgNOTg6CgMhdbdhAjd3jPqj5lHWVBxTsWDBj/7D/T/QhNZeTHjCmBG
 2cc1/0IZgmUoF9LD4Va5i7QHgFjE8juj1Ae5AvvpFSB0o7f/LuTZSUXtt1MmocjFMtsO
 fwLVpo//u5xWjlX2rn0zvhkdDbuBlm3DfZ9tAWX2jtaPrGcZNKCjRauYTlWAZzpsIwi+
 sH4w==
X-Gm-Message-State: AOAM5320iRQCMZBWmroWTxndmJvfWWl5/gj3gB9beXUmioFKo8A1rcFZ
 myonJR9bYpjLnSbqDisjOs8PE8SyCXs=
X-Google-Smtp-Source: ABdhPJzPbzxY9fLGlXVswnpEdXuuL2F1Sw3EhwAF0yEZSLD5jL/zH1qfkYFBY06iSyZpYFuxPBT8oQ==
X-Received: by 2002:a17:906:3555:: with SMTP id
 s21mr12431152eja.394.1625757499990; 
 Thu, 08 Jul 2021 08:18:19 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 43/48] meson: switch function tests from compilation to linking
Date: Thu,  8 Jul 2021 17:17:43 +0200
Message-Id: <20210708151748.408754-44-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Zak <richard.j.zak@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some tests for glibc functions cause compilation to emit warnings but
still succeed even if the function is not there.  Therefore, change
from cc.compiles to cc.links.

Reported-by: Richard Zak <richard.j.zak@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meson.build b/meson.build
index d9aa2d7820..5a56e3fe2f 100644
--- a/meson.build
+++ b/meson.build
@@ -1340,10 +1340,10 @@ config_host_data.set('HAVE_STRUCT_STAT_ST_ATIM',
                      cc.has_member('struct stat', 'st_atim',
                                    prefix: '#include <sys/stat.h>'))
 
-config_host_data.set('CONFIG_EVENTFD', cc.compiles('''
+config_host_data.set('CONFIG_EVENTFD', cc.links('''
   #include <sys/eventfd.h>
   int main(void) { return eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC); }'''))
-config_host_data.set('CONFIG_FDATASYNC', cc.compiles(gnu_source_prefix + '''
+config_host_data.set('CONFIG_FDATASYNC', cc.links(gnu_source_prefix + '''
   #include <unistd.h>
   int main(void) {
   #if defined(_POSIX_SYNCHRONIZED_IO) && _POSIX_SYNCHRONIZED_IO > 0
@@ -1352,22 +1352,22 @@ config_host_data.set('CONFIG_FDATASYNC', cc.compiles(gnu_source_prefix + '''
   #error Not supported
   #endif
   }'''))
-config_host_data.set('CONFIG_MADVISE', cc.compiles(gnu_source_prefix + '''
+config_host_data.set('CONFIG_MADVISE', cc.links(gnu_source_prefix + '''
   #include <sys/types.h>
   #include <sys/mman.h>
   #include <stddef.h>
   int main(void) { return madvise(NULL, 0, MADV_DONTNEED); }'''))
-config_host_data.set('CONFIG_MEMFD', cc.compiles(gnu_source_prefix + '''
+config_host_data.set('CONFIG_MEMFD', cc.links(gnu_source_prefix + '''
   #include <sys/mman.h>
   int main(void) { return memfd_create("foo", MFD_ALLOW_SEALING); }'''))
-config_host_data.set('CONFIG_OPEN_BY_HANDLE', cc.compiles(gnu_source_prefix + '''
+config_host_data.set('CONFIG_OPEN_BY_HANDLE', cc.links(gnu_source_prefix + '''
   #include <fcntl.h>
   #if !defined(AT_EMPTY_PATH)
   # error missing definition
   #else
   int main(void) { struct file_handle fh; return open_by_handle_at(0, &fh, 0); }
   #endif'''))
-config_host_data.set('CONFIG_PIPE2', cc.compiles(gnu_source_prefix + '''
+config_host_data.set('CONFIG_PIPE2', cc.links(gnu_source_prefix + '''
   #include <unistd.h>
   #include <fcntl.h>
 
@@ -1376,16 +1376,16 @@ config_host_data.set('CONFIG_PIPE2', cc.compiles(gnu_source_prefix + '''
       int pipefd[2];
       return pipe2(pipefd, O_CLOEXEC);
   }'''))
-config_host_data.set('CONFIG_POSIX_MADVISE', cc.compiles(gnu_source_prefix + '''
+config_host_data.set('CONFIG_POSIX_MADVISE', cc.links(gnu_source_prefix + '''
   #include <sys/mman.h>
   #include <stddef.h>
   int main(void) { return posix_madvise(NULL, 0, POSIX_MADV_DONTNEED); }'''))
-config_host_data.set('CONFIG_SIGNALFD', cc.compiles(gnu_source_prefix + '''
+config_host_data.set('CONFIG_SIGNALFD', cc.links(gnu_source_prefix + '''
   #include <unistd.h>
   #include <sys/syscall.h>
   #include <signal.h>
   int main(void) { return syscall(SYS_signalfd, -1, NULL, _NSIG / 8); }'''))
-config_host_data.set('CONFIG_SPLICE', cc.compiles(gnu_source_prefix + '''
+config_host_data.set('CONFIG_SPLICE', cc.links(gnu_source_prefix + '''
   #include <unistd.h>
   #include <fcntl.h>
   #include <limits.h>
-- 
2.31.1



