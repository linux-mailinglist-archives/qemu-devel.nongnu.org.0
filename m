Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F5847E2C7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 12:58:27 +0100 (CET)
Received: from localhost ([::1]:53982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Mjq-00076g-Es
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 06:58:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdJ-0004Hk-W0
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:44 -0500
Received: from [2a00:1450:4864:20::42d] (port=42920
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdH-0008OV-5D
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:41 -0500
Received: by mail-wr1-x42d.google.com with SMTP id w20so1959694wra.9
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LsebaxjK4X3kfi6gKUiYbbi2y0XGxqQY+SM4Dw2Hp9Y=;
 b=K2H/Gx4H9z6sT8uRrgexTMP4fQ9zGUb4Osy85e819eNh8vUkDaK3UvHLKJJntkOrbk
 i/Z12lXSMcfv7oyo7MSCCOWvOvYu/6zO+up/dPYzQ6Y9raiMmVaOXOioSzUwHpPZht7j
 l9HYq0vfY8n7qu/HcSHXvEUlk8yJSLP11D/TU//d6oW/+FOfiWSUTcOp2jdToydsUnaS
 +Eu9++d4/QDfvV7Cad1aT4ku64Uxmi9MVfiMIWRh7pby7i6/SYxMdrWb+yJSq4UH9pXg
 7yiMY6Zy2W3LHrweMio2PDyVnMtij8sqRC3ajJwG20v7HL9+GDB3EOBoVV0V2n1zgGMj
 zuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LsebaxjK4X3kfi6gKUiYbbi2y0XGxqQY+SM4Dw2Hp9Y=;
 b=EwNU1U+9hX2jwu9aXRe6bx0YWI1czvUjZkpSHe8EP6hcFir6S1kMBKoRy7IrtJfRdz
 PGJqTXuTjQIr5geGGabgzbdWaqN4aivqNkTdQxoYTLBHwpAmPqXy7GkX5+raffqGA8kN
 cvcZmS7EoJvlIOGQWZ20LXqoPvs2TTLQsz3NDf+yWCLYGlFlAH/4BU4WLHcE14l2X0NB
 GG1kxNeVjiTxY1ADloZJJNMTNr3cvrAYLQEiAl1yDQyzocZPv9PsH15VpQjtQVvX1rtY
 /w5fa80O6BG2EBUiXqP4dz5IaKkm5FdhB8FfwfKWMG36dAg80p97ZKiVEWl0axCctb7l
 EGVg==
X-Gm-Message-State: AOAM531DXXOO2YtjAN/OGC9gnUlmikAWr0owjAr3ChJw4KZhAQqXZQYj
 EkaZrKjrwNrCJjyZdSQzx2CdIEX60+0=
X-Google-Smtp-Source: ABdhPJwVhjEMhd4B4v7skS0O7QbGCrNAL8lcxyk+AJUaR5KQ5VAvo82pUPEHMu+PiunWhRAXxiRSWg==
X-Received: by 2002:a05:6000:1c7:: with SMTP id
 t7mr1577554wrx.656.1640260297808; 
 Thu, 23 Dec 2021 03:51:37 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o2sm4537106wru.109.2021.12.23.03.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:51:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/15] user: move common-user includes to a subdirectory of
 {bsd, linux}-user/
Date: Thu, 23 Dec 2021 12:51:22 +0100
Message-Id: <20211223115134.579235-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115134.579235-1-pbonzini@redhat.com>
References: <20211223115134.579235-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 bsd-user/{ => include}/special-errno.h              | 0
 bsd-user/meson.build                                | 2 +-
 linux-user/{ => include}/host/aarch64/host-signal.h | 0
 linux-user/{ => include}/host/alpha/host-signal.h   | 0
 linux-user/{ => include}/host/arm/host-signal.h     | 0
 linux-user/{ => include}/host/i386/host-signal.h    | 0
 linux-user/{ => include}/host/mips/host-signal.h    | 0
 linux-user/{ => include}/host/ppc/host-signal.h     | 0
 linux-user/{ => include}/host/ppc64/host-signal.h   | 0
 linux-user/{ => include}/host/riscv/host-signal.h   | 0
 linux-user/{ => include}/host/s390/host-signal.h    | 0
 linux-user/{ => include}/host/s390x/host-signal.h   | 0
 linux-user/{ => include}/host/sparc/host-signal.h   | 0
 linux-user/{ => include}/host/sparc64/host-signal.h | 0
 linux-user/{ => include}/host/x32/host-signal.h     | 0
 linux-user/{ => include}/host/x86_64/host-signal.h  | 0
 linux-user/{ => include}/special-errno.h            | 0
 linux-user/meson.build                              | 4 ++--
 18 files changed, 3 insertions(+), 3 deletions(-)
 rename bsd-user/{ => include}/special-errno.h (100%)
 rename linux-user/{ => include}/host/aarch64/host-signal.h (100%)
 rename linux-user/{ => include}/host/alpha/host-signal.h (100%)
 rename linux-user/{ => include}/host/arm/host-signal.h (100%)
 rename linux-user/{ => include}/host/i386/host-signal.h (100%)
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



