Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D46580095
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:18:53 +0200 (CEST)
Received: from localhost ([::1]:32974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFyv6-0000kR-5v
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiJ-00010W-Ol
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:41 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiI-0000HC-4n
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:39 -0400
Received: by mail-wr1-x42a.google.com with SMTP id l15so12068188wro.11
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 07:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QVFXqQSL3k1U0tR1HBqjNVeAN73t7swh868mXq6OAM8=;
 b=C1yuYhU5QO5UZVFdO3t6O30s8OBCLP1/aEPMBFOMsn6Y1qzoP+ytnBlPetAs+cTVFk
 OHti8eKnVkTUdqcpt151Q0d9pDpUw8TosckUFAKnBZ4Z3qCE5XzbF+Yrzo6w0MS+niDo
 eQdnjlppCuCPbRBxK6CV3PmTU2ks5dlkCLyfya88SOxC62mK1/Am3efPpOWVEtqVA9qC
 GFKF2eRvfVm0KsLD5Ch+v6AyzdXFEc+6xNuwdZF8QpR03/rCpUxcQcXETy9ox7jAUmsn
 f1Iv/Hjc/93Uu5WxNw+gpC89VgjotZHDlEdoqZ52cJgzUkDmZJt0dpJwd53p04yaoZEU
 +e2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QVFXqQSL3k1U0tR1HBqjNVeAN73t7swh868mXq6OAM8=;
 b=2kI9v/e9ZFul8fURxa7CdwcKFhV+1MyGATw2HfR8OpPR13J6RjRAthZtkFIxiWlbyQ
 z1hI7yUgpJynFylRYHmJUDAaTnEt4u5mTsDioj2bv9zlBRyMKrXv/vYkeHmzYWMS9nqv
 J6vpK7yelMMz/7WhDknJ2qxEWDMsM0jbK3B9K9i6tyaW8TIb43DO+a1/du4Uxok6U6EH
 UuC6UIh7V0lifmrjRyWqagq9mvl/+NB03PMoHkA+A0sV0g0ECKV8egBKHr/tlJQSbstF
 tfb9hjvTvpbrpEsp50bUdDlXkmhhjYwj3vAh+9xdoCOFrSsgly+QdqsdbVpwsoEmniWH
 jIkg==
X-Gm-Message-State: AJIora+Q/vrg5eCL7gVsyPB5HuQjRYBZNq4lboaHhxc05xMchhJ1gOke
 Q4LRtt5ajNtVzMQVfFKKff7+KA==
X-Google-Smtp-Source: AGRyM1s/NR691OUWsc+ofJX2ZMswuK+SurENAIYupx7f2PmnmB6KvdyW6HA4DmICnlV4oLawDWlylQ==
X-Received: by 2002:a05:6000:178f:b0:21e:98ee:f1e6 with SMTP id
 e15-20020a056000178f00b0021e98eef1e6mr324527wrg.405.1658757936685; 
 Mon, 25 Jul 2022 07:05:36 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bg42-20020a05600c3caa00b003a31b79dc0esm40292263wmb.1.2022.07.25.07.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 07:05:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8B9761FFC3;
 Mon, 25 Jul 2022 15:05:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 peter.maydell@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PATCH v1 11/13] tests/tcg/s390x: Test unaligned accesses to lowcore
Date: Mon, 25 Jul 2022 15:05:18 +0100
Message-Id: <20220725140520.515340-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220725140520.515340-1-alex.bennee@linaro.org>
References: <20220725140520.515340-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a small test to avoid regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220722233614.7254-3-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/s390x/Makefile.softmmu-target |  9 +++++++++
 tests/tcg/s390x/unaligned-lowcore.S     | 19 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 tests/tcg/s390x/Makefile.softmmu-target
 create mode 100644 tests/tcg/s390x/unaligned-lowcore.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
new file mode 100644
index 0000000000..a34fa68473
--- /dev/null
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -0,0 +1,9 @@
+S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
+VPATH+=$(S390X_SRC)
+QEMU_OPTS=-action panic=exit-failure -kernel
+
+%: %.S
+	$(CC) -march=z13 -m64 -nostartfiles -static -Wl,-Ttext=0 \
+		-Wl,--build-id=none $< -o $@
+
+TESTS += unaligned-lowcore
diff --git a/tests/tcg/s390x/unaligned-lowcore.S b/tests/tcg/s390x/unaligned-lowcore.S
new file mode 100644
index 0000000000..246b517f11
--- /dev/null
+++ b/tests/tcg/s390x/unaligned-lowcore.S
@@ -0,0 +1,19 @@
+    .org 0x1D0                         /* program new PSW */
+    .quad 0x2000000000000, 0           /* disabled wait */
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    lctlg %c0,%c0,_c0
+    vst %v0,_unaligned
+    lpswe quiesce_psw
+
+    .align 8
+quiesce_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+_c0:
+    .quad 0x10060000                   /* lowcore protection, AFP, VX */
+
+    .byte 0
+_unaligned:
+    .octa 0
-- 
2.30.2


