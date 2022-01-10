Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D2E489BC1
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:04:16 +0100 (CET)
Received: from localhost ([::1]:45930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wDW-0000DO-QY
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:04:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqp-0001t3-4q
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:47 -0500
Received: from [2a00:1450:4864:20::52a] (port=45876
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqm-0000SM-23
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:46 -0500
Received: by mail-ed1-x52a.google.com with SMTP id z22so9368262edd.12
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sn12UEUc7Qk8/uEupR3XTclgJmwgV1UmJePL9srNWJA=;
 b=Nm8cbOfTkdpXDRvcQ2MNOdWE6nG8SHZcIMIVSEPWJVRA3qWMxbo4kA1gKglJBtA8Vj
 0OsuqEwpHCoFMPm5mXnn3/n1vJT40ieSJvY2qB2qEsujvvOnf27VzLJ97MvI/nlOsS8G
 JtnSEl9Hf7AeN5VZtXqi+VCVnsA504M/Pi+GunW3mSs3sJhhzH1o4KuJGQ82Jg+YpAxz
 UfQEwuu0lbvNwPgzMyzWg38xc4b74eqaGS/2XL7R0ebmxx7NiOM92nvdEJDluiZgzYRB
 ql39WdkyyE3OGuXEIFmQZUVqCLc5JhOmTqh71uyL1FSG8tlz2mXrmXFms/8QSMgNfbuP
 sVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sn12UEUc7Qk8/uEupR3XTclgJmwgV1UmJePL9srNWJA=;
 b=dpH1ngOKet7yNnWGGDorHRVni+AJfMCGRKBmjr0qb+5khdU3x2PBQvPUKYR4HhtPmI
 gAo11YqJI66+on6KhcI5zsFy9iXrqS8AmyKNjplTMhU822I/QEzVVqkmj+UboedBlWT9
 urqJvYhi5T2L5GwpeD5V+m93GGOiluhD6QvhtZoipWr/cCIIg/5oH9Bdm7gKjJ+cZcro
 tTpBh7Fkq3HJltKW0YtB4xFMulERvYQD/5SMM1E1Ypy/aoMio2ZwEhYQPwUpFMkpTug7
 E6WsK85SaGQVqqlYVRElCVVJKLqtlQFTg7C7/HplXztLqyMUCAlhgOaXPLDyYNbbec6K
 ek0A==
X-Gm-Message-State: AOAM533UqMUJ9eoU/7CTnRRGYYz41KrmSbz3cXTITeb0O3am7ubnhP6w
 Z28h8HRnHr8/Vpmo0UsmJYTFnRR5954=
X-Google-Smtp-Source: ABdhPJxXTG+SCohTSNPKQQv5+fJ9etc10idBS2gP7rEdkUanalwA5CrGE42wRowhwuO6v9KufdJLGA==
X-Received: by 2002:a50:f105:: with SMTP id w5mr23155186edl.222.1641825642790; 
 Mon, 10 Jan 2022 06:40:42 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k25sm2549498ejk.179.2022.01.10.06.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:40:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/18] user: move common-user includes to a subdirectory of
 {bsd, linux}-user/
Date: Mon, 10 Jan 2022 15:40:18 +0100
Message-Id: <20220110144034.67410-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110144034.67410-1-pbonzini@redhat.com>
References: <20220110144034.67410-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Avoid polluting the compilation of common-user/ with local include files;
making an include file available to common-user/ should be a deliberate
decision in order to keep a clear interface that can be used by both
bsd-user/ and linux-user/.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 bsd-user/{ => include}/special-errno.h                  | 0
 bsd-user/meson.build                                    | 2 +-
 linux-user/{ => include}/host/aarch64/host-signal.h     | 0
 linux-user/{ => include}/host/alpha/host-signal.h       | 0
 linux-user/{ => include}/host/arm/host-signal.h         | 0
 linux-user/{ => include}/host/i386/host-signal.h        | 0
 linux-user/{ => include}/host/loongarch64/host-signal.h | 0
 linux-user/{ => include}/host/mips/host-signal.h        | 0
 linux-user/{ => include}/host/ppc/host-signal.h         | 0
 linux-user/{ => include}/host/ppc64/host-signal.h       | 0
 linux-user/{ => include}/host/riscv/host-signal.h       | 0
 linux-user/{ => include}/host/s390/host-signal.h        | 0
 linux-user/{ => include}/host/s390x/host-signal.h       | 0
 linux-user/{ => include}/host/sparc/host-signal.h       | 0
 linux-user/{ => include}/host/sparc64/host-signal.h     | 0
 linux-user/{ => include}/host/x32/host-signal.h         | 0
 linux-user/{ => include}/host/x86_64/host-signal.h      | 0
 linux-user/{ => include}/special-errno.h                | 0
 linux-user/meson.build                                  | 4 ++--
 19 files changed, 3 insertions(+), 3 deletions(-)
 rename bsd-user/{ => include}/special-errno.h (100%)
 rename linux-user/{ => include}/host/aarch64/host-signal.h (100%)
 rename linux-user/{ => include}/host/alpha/host-signal.h (100%)
 rename linux-user/{ => include}/host/arm/host-signal.h (100%)
 rename linux-user/{ => include}/host/i386/host-signal.h (100%)
 rename linux-user/{ => include}/host/loongarch64/host-signal.h (100%)
 rename linux-user/{ => include}/host/mips/host-signal.h (100%)
 rename linux-user/{ => include}/host/ppc/host-signal.h (100%)
 rename linux-user/{ => include}/host/ppc64/host-signal.h (100%)
 rename linux-user/{ => include}/host/riscv/host-signal.h (100%)
 rename linux-user/{ => include}/host/s390/host-signal.h (100%)
 rename linux-user/{ => include}/host/s390x/host-signal.h (100%)
 rename linux-user/{ => include}/host/sparc/host-signal.h (100%)
 rename linux-user/{ => include}/host/sparc64/host-signal.h (100%)
 rename linux-user/{ => include}/host/x32/host-signal.h (100%)
 rename linux-user/{ => include}/host/x86_64/host-signal.h (100%)
 rename linux-user/{ => include}/special-errno.h (100%)

diff --git a/bsd-user/special-errno.h b/bsd-user/include/special-errno.h
similarity index 100%
rename from bsd-user/special-errno.h
rename to bsd-user/include/special-errno.h
diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 9fcb80c3fa..8380fa44c2 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -4,7 +4,7 @@ endif
 
 bsd_user_ss = ss.source_set()
 
-common_user_inc += include_directories('.')
+common_user_inc += include_directories('include')
 
 bsd_user_ss.add(files(
   'bsdload.c',
diff --git a/linux-user/host/aarch64/host-signal.h b/linux-user/include/host/aarch64/host-signal.h
similarity index 100%
rename from linux-user/host/aarch64/host-signal.h
rename to linux-user/include/host/aarch64/host-signal.h
diff --git a/linux-user/host/alpha/host-signal.h b/linux-user/include/host/alpha/host-signal.h
similarity index 100%
rename from linux-user/host/alpha/host-signal.h
rename to linux-user/include/host/alpha/host-signal.h
diff --git a/linux-user/host/arm/host-signal.h b/linux-user/include/host/arm/host-signal.h
similarity index 100%
rename from linux-user/host/arm/host-signal.h
rename to linux-user/include/host/arm/host-signal.h
diff --git a/linux-user/host/i386/host-signal.h b/linux-user/include/host/i386/host-signal.h
similarity index 100%
rename from linux-user/host/i386/host-signal.h
rename to linux-user/include/host/i386/host-signal.h
diff --git a/linux-user/host/loongarch64/host-signal.h b/linux-user/include/host/loongarch64/host-signal.h
similarity index 100%
rename from linux-user/host/loongarch64/host-signal.h
rename to linux-user/include/host/loongarch64/host-signal.h
diff --git a/linux-user/host/mips/host-signal.h b/linux-user/include/host/mips/host-signal.h
similarity index 100%
rename from linux-user/host/mips/host-signal.h
rename to linux-user/include/host/mips/host-signal.h
diff --git a/linux-user/host/ppc/host-signal.h b/linux-user/include/host/ppc/host-signal.h
similarity index 100%
rename from linux-user/host/ppc/host-signal.h
rename to linux-user/include/host/ppc/host-signal.h
diff --git a/linux-user/host/ppc64/host-signal.h b/linux-user/include/host/ppc64/host-signal.h
similarity index 100%
rename from linux-user/host/ppc64/host-signal.h
rename to linux-user/include/host/ppc64/host-signal.h
diff --git a/linux-user/host/riscv/host-signal.h b/linux-user/include/host/riscv/host-signal.h
similarity index 100%
rename from linux-user/host/riscv/host-signal.h
rename to linux-user/include/host/riscv/host-signal.h
diff --git a/linux-user/host/s390/host-signal.h b/linux-user/include/host/s390/host-signal.h
similarity index 100%
rename from linux-user/host/s390/host-signal.h
rename to linux-user/include/host/s390/host-signal.h
diff --git a/linux-user/host/s390x/host-signal.h b/linux-user/include/host/s390x/host-signal.h
similarity index 100%
rename from linux-user/host/s390x/host-signal.h
rename to linux-user/include/host/s390x/host-signal.h
diff --git a/linux-user/host/sparc/host-signal.h b/linux-user/include/host/sparc/host-signal.h
similarity index 100%
rename from linux-user/host/sparc/host-signal.h
rename to linux-user/include/host/sparc/host-signal.h
diff --git a/linux-user/host/sparc64/host-signal.h b/linux-user/include/host/sparc64/host-signal.h
similarity index 100%
rename from linux-user/host/sparc64/host-signal.h
rename to linux-user/include/host/sparc64/host-signal.h
diff --git a/linux-user/host/x32/host-signal.h b/linux-user/include/host/x32/host-signal.h
similarity index 100%
rename from linux-user/host/x32/host-signal.h
rename to linux-user/include/host/x32/host-signal.h
diff --git a/linux-user/host/x86_64/host-signal.h b/linux-user/include/host/x86_64/host-signal.h
similarity index 100%
rename from linux-user/host/x86_64/host-signal.h
rename to linux-user/include/host/x86_64/host-signal.h
diff --git a/linux-user/special-errno.h b/linux-user/include/special-errno.h
similarity index 100%
rename from linux-user/special-errno.h
rename to linux-user/include/special-errno.h
diff --git a/linux-user/meson.build b/linux-user/meson.build
index b2f4afd5e7..de4320af05 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -4,8 +4,8 @@ endif
 
 linux_user_ss = ss.source_set()
 
-common_user_inc += include_directories('host/' / host_arch)
-common_user_inc += include_directories('.')
+common_user_inc += include_directories('include/host/' / host_arch)
+common_user_inc += include_directories('include')
 
 linux_user_ss.add(files(
   'elfload.c',
-- 
2.33.1



