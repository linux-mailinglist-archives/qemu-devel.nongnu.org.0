Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2774D48440D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:01:45 +0100 (CET)
Received: from localhost ([::1]:37848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4lJn-0000ay-OO
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:01:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGJ-0006tf-Fg
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:07 -0500
Received: from [2a00:1450:4864:20::535] (port=34751
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGH-0004Qo-Pv
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:07 -0500
Received: by mail-ed1-x535.google.com with SMTP id u25so28206702edf.1
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 06:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sn12UEUc7Qk8/uEupR3XTclgJmwgV1UmJePL9srNWJA=;
 b=eYsuJe0f9Q1Nkg2H1MOWFBS8DIdgxEjIh61Wh0wQebzzPxVqrF9frkfc4b138dOuch
 xsq2aE26ZMRPpypbhP9tRIQVsaZCnEsAYQOG5MJ6uDse9HbF1EkB3OhFe81HBPpJbhXC
 tlvTMiBun6zohWNEUCFPULqswo52RypxYplcAH8Hy97/BANcYX06l6K29vLsMClokUzK
 reNQU35UEHyfUjMmF4ZfJX68JIpH8uwPRaM/xKyu7udU6orJDr+2QSJZAGqG3ZnnsLNz
 Mt2qKVJ5TXkgiFZk9TQpLJ0Xi1WSOC5LlJtZ4tZxActAlmehq1Mnc9NN+bw5igK2d+hs
 9lbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sn12UEUc7Qk8/uEupR3XTclgJmwgV1UmJePL9srNWJA=;
 b=Q74x0z+xhPgrPEF3uS7P9dFIyEj7LbPixMpzw9eV7lzCghrvF774kLZG3+ODMPLOLh
 5wOcpmSGLMCHBTIU/l3Y9PJ9+3v2yrZ/Yi570mnUWxUfFn4e8gVwowOIHElJmmyZdQ/K
 +I5NeaPO7/152UG8/MydO1GPe9X6EiJIrPxsDOTIw2nkz1nHHFi8aH5W6yH+AeK64THf
 Kl4NBbf5+TAuZHTVIpeuBZT59K+6MXKVmz4qiB+X/VkoWSRK/+Si4uCX/r7cHZMygofK
 eCmPVpR96JPlCzydNtYhbKy7ZwYDmwoUbTZ/Ri1UyejxoZ1936ZFYK6Kfr95M6cm3qEW
 HM3A==
X-Gm-Message-State: AOAM532jMWSuuzpRiDaQE8teQnaLPt/4rVxfBVApfm7ldYhHczsTTt3E
 pq+rASY2BKdFzJgMRpa2S/EGz/V4nJY=
X-Google-Smtp-Source: ABdhPJwhFU4I6I2vRNKXchePw/yrau3A68VnpowexnVCSfr66Mx5ndQQHxlU3b5vuAqp/PNVQln3ew==
X-Received: by 2002:a05:6402:1d81:: with SMTP id
 dk1mr49438320edb.328.1641308284579; 
 Tue, 04 Jan 2022 06:58:04 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id j21sm11475964ejj.133.2022.01.04.06.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 06:58:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/15] user: move common-user includes to a subdirectory of
 {bsd, linux}-user/
Date: Tue,  4 Jan 2022 15:57:36 +0100
Message-Id: <20220104145749.417387-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104145749.417387-1-pbonzini@redhat.com>
References: <20220104145749.417387-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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



