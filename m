Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DAC4208F2
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 12:04:39 +0200 (CEST)
Received: from localhost ([::1]:41038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKpq-0001w2-BM
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 06:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXKKU-0001M3-Qd
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:32:16 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXKKS-0007mt-IV
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:32:14 -0400
Received: by mail-ed1-x52a.google.com with SMTP id v18so61335790edc.11
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 02:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UArhIR2Xzaj04yqObEvMGnbWPul/JgDRnUvix747Vb0=;
 b=YEHX6z3jYLlwMbQnpL7rnTmf4ttGHMXngGK3oaqLMcaRM+kWqzN21dxvyyH+FFm5gp
 VmraJXU9dy+mhkITBhdo6an7xpGU/SSvjHuJv3TKuMjuAqDUXwF7phX4lg+n3GJ/REGv
 t1hSpSSW0nb3c2V7KeQ8kvlOqEU63UqJtNakzs52iwuDC88k6mJQC4zL8gt5DVcdV2it
 xP1rOos/2usMkSWwO1BsD/ZibduseaAKJEuEIpnGvEjkZFNqhKYT6XglTU6KQDu7YBpX
 ndWgmxwwPuIvIpa3EZ//wVPcZzy5b+0RhQOPr9l9VWwf7JigPORYkCarq7rGgvgKsVG6
 X9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UArhIR2Xzaj04yqObEvMGnbWPul/JgDRnUvix747Vb0=;
 b=eExjS6avoRA+RSA9atSLkfFTWFEAzEKa/ijXWWUBVWiboWxEkY1o6CEFhEcjHnV3fB
 fLPs1DLSCMIWJqqVYpZP6hjtW7/Oe12tTIekeEVwvKn44Owc9iS3NGDyJBDKXulpklx8
 2xAls5/rAjCIvWF/RfncQlfLBujOhv7wacCZIENLEa4WZTl2UteTQhOXRMplBilAb1ev
 u+pGxShMxvIkAu3X4KyShN5hNnxALqgR0/EucXO5VuJqw2YIT85Qvxz0YfyVZpJr1HYn
 XrCxhotBzO40CVQ4KvF7sdxObJQMkPYl3rYUmtXaoxqv0vKrrnTD2RA8sNIDkM/ZTVZm
 am3A==
X-Gm-Message-State: AOAM5318PLgn7oLeJA5kbJ3fhijYE5YC4fivrIIRm2vURBoD9kv08ekp
 qaKQtsEeVgfWWmdW4WprXR0j1+29VDc=
X-Google-Smtp-Source: ABdhPJx2CbFCaHBPzMDidwyIdNU52Th47N5fwrvINDIcJRPH2q+wvR/fFQEBUOwDL8hE5wgot1T8/A==
X-Received: by 2002:a17:906:1749:: with SMTP id
 d9mr15252796eje.178.1633339928725; 
 Mon, 04 Oct 2021 02:32:08 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id d21sm5007143edp.27.2021.10.04.02.32.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 02:32:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] target/xtensa: list cores in a text file
Date: Mon,  4 Oct 2021 11:30:52 +0200
Message-Id: <20211004093053.87883-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004093053.87883-1-pbonzini@redhat.com>
References: <20211004093053.87883-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid that leftover files affect the build; instead, use the same
mechanism that was in place before the Meson transition of updating
a file from import_core.sh.  Starting with Meson 0.57, the file
can be easily read from the filesystem module, so do that instead
of using run_command.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/xtensa/cores.list     | 9 +++++++++
 target/xtensa/import_core.sh | 3 +++
 target/xtensa/meson.build    | 4 ++--
 3 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 target/xtensa/cores.list

diff --git a/target/xtensa/cores.list b/target/xtensa/cores.list
new file mode 100644
index 0000000000..5772a00ab2
--- /dev/null
+++ b/target/xtensa/cores.list
@@ -0,0 +1,9 @@
+core-dc232b.c
+core-dc233c.c
+core-de212.c
+core-de233_fpu.c
+core-dsp3400.c
+core-fsf.c
+core-sample_controller.c
+core-test_kc705_be.c
+core-test_mmuhifi_c3.c
diff --git a/target/xtensa/import_core.sh b/target/xtensa/import_core.sh
index 396b264be9..df66d09393 100755
--- a/target/xtensa/import_core.sh
+++ b/target/xtensa/import_core.sh
@@ -66,3 +66,6 @@ static XtensaConfig $NAME __attribute__((unused)) = {
 
 REGISTER_CORE($NAME)
 EOF
+
+grep -qxf core-${NAME}.c "$BASE"/cores.list || \
+    echo core-${NAME}.c >> "$BASE"/cores.list
diff --git a/target/xtensa/meson.build b/target/xtensa/meson.build
index 7c4efa6c62..20bbf9b335 100644
--- a/target/xtensa/meson.build
+++ b/target/xtensa/meson.build
@@ -1,7 +1,7 @@
 xtensa_ss = ss.source_set()
 
-xtensa_cores = run_command('sh', '-c', 'cd $MESON_SOURCE_ROOT/$MESON_SUBDIR ; ls -1 core-*.c')
-xtensa_ss.add(files(xtensa_cores.stdout().strip().split('\n')))
+xtensa_cores = fs.read('cores.list')
+xtensa_ss.add(files(xtensa_cores.strip().split('\n')))
 
 xtensa_ss.add(files(
   'cpu.c',
-- 
2.31.1



