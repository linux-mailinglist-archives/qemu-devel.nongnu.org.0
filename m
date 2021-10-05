Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECAC422F34
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:27:49 +0200 (CEST)
Received: from localhost ([::1]:40704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoEG-00077B-HF
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnYI-0007v3-42
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:26 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:38489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnYE-00040m-RR
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:24 -0400
Received: by mail-ed1-x531.google.com with SMTP id dj4so1218083edb.5
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UArhIR2Xzaj04yqObEvMGnbWPul/JgDRnUvix747Vb0=;
 b=BKU0auOVLE0NpSmkrnWKWuBZEH9q6y8rzxcEyd1Z3zQwlw7gMim4lEE6PIT1jvUMKP
 bmqdYyWHkwaSTBMo3NdnQ/aN7EpXawwRDozpDE9zRUQufvgY6o8Loo2bAqNPPG9Pmw51
 uDuGzXWXb833A4ooBmG4oE2I4IRVnr130r/s1luJkV1J2vYAyOYpCb72XbRHvaGYGWZk
 pUMAIQIeou8PUjdm0a4JZFqeg2LfHS/9esg3O3bELSpVKs9jA74YKDJOjxNxEmSneArU
 aZ25Tmf0S032r1GSLb+v+WD821iha4jSQm/lHvRciaKE4s4wbcp/xVnbESHDe78NxDgP
 i6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UArhIR2Xzaj04yqObEvMGnbWPul/JgDRnUvix747Vb0=;
 b=c5dcy1jMwTgwWxE5VR3PzNWRiy5eBFV42cveBAPQzNNU8gKZeIXKhoEk4by3BNSZRS
 tFNCebH8oGpduBu9AdbP+FHX7Dcr/OiC5Dbk6oQejifBZWeZVDkM7iydvHMjuM3aaUei
 iNs/By/ftPibkM/b7fEzi9ZBurhGst6W0RlF4Yvbfpi1DG1emtF2hObB5bllb0HH2Lgj
 x3VWMC3CoUG1Gz8MkJ81A9+WjsvIZR+N3bZNOFtufj77X++UXHH7ic0iYDnfYhk13I+I
 5CIGtVPcb2dD2bokbJlCRkPC0R4t/dw2PWC1VWRz4ddRbDTvn0Rg0WAfxKWe4GBM7VJN
 NVZA==
X-Gm-Message-State: AOAM533a4W/l5L65ROob1KmcfjKwGlmV2BXokc9wjZ0wJLJjab5c3JbI
 EOtqzjFdqlL9MYhg9axk7fZoRq8DA9I=
X-Google-Smtp-Source: ABdhPJzIATpR1/g4TSec7YkGqqIut3iW/QgTQXiG2nj9OCQmaLf4CN/LYiLffvac4iArmdvxxGcMAw==
X-Received: by 2002:a17:906:6dc1:: with SMTP id
 j1mr26195100ejt.324.1633452261521; 
 Tue, 05 Oct 2021 09:44:21 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x14sm6101392edd.25.2021.10.05.09.44.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:44:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/12] target/xtensa: list cores in a text file
Date: Tue,  5 Oct 2021 18:44:07 +0200
Message-Id: <20211005164408.288128-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005164408.288128-1-pbonzini@redhat.com>
References: <20211005164408.288128-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



