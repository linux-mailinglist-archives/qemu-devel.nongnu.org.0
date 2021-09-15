Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BAD40CB7F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 19:16:50 +0200 (CEST)
Received: from localhost ([::1]:44984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQYWf-0002sV-VI
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 13:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mQY0X-0003Rp-Od
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:43:39 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:34593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mQY0V-0006ak-FN
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:43:37 -0400
Received: by mail-ed1-x52d.google.com with SMTP id i6so5936264edu.1
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 09:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UArhIR2Xzaj04yqObEvMGnbWPul/JgDRnUvix747Vb0=;
 b=m2Nia5sg+LD22AJ0b9c3iICcTN1cboe8n0BwnSHnBoJptCI8zT8g8xBh1LEhZg2g8A
 1gk0+/9M/0GOffQodsSdtti9A35rpQfhU+nRWAaw5co5NZF8kU3a7zJf2Gkx76ttwrk6
 pVKACJue5KkgvYG6T4h00CG1QeuGm9JR3IUao3lttPOOnBzTPg1NL46j84trx/qAD/oI
 l3neD0J/e1jQE1sMmBgTVgOVQtiuPZn/KhSaqZqk7BBQmNiEel1DyW7RFpbW1sAQuiNn
 BvD9LpAdaHgZWbUItRsKHNL2Z+JKqJ9x2N+safvRBTpCR1NwqmPROuK0YCHrzwAHwghG
 8DBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UArhIR2Xzaj04yqObEvMGnbWPul/JgDRnUvix747Vb0=;
 b=6x/cnIkaghY8Sle6pw3JmxO+hlh51eTEpUBsThqAmiIDMvzGNhaMnQyD3B0O2q/EYH
 9GURhIUiDMq1sdU94eLmpbFzWwrr5E53OM7EklkG2CyFJcdyLV/kH22hg/hV8uixq3Zd
 X+I8z0SnxFFW6oFsME3NGmhsJfYuevIzWZ3HgIO77BKHlll5zdy1+CwCPmwWzIQbLVFV
 2KJhGZFxcF9VrxW7S4PSC3I0opkZIP6TWCSFb7ObcZ16nGiNS+v7qIl1r8Nr8rGbBJNE
 MfMvylIoSlEqoLzVZ4k+9eakNmb+zpS3Zevdp4LxrMB6vyhnRgggBUO2fZhPmeghJ0ZB
 soow==
X-Gm-Message-State: AOAM533NgyFEuMv2b+alNGWPxjrmIdDsvBTKVbFKiLjkOe+QnpyItSls
 c91gv65e/FiYSQrXSR1KGR9UOLjacjg=
X-Google-Smtp-Source: ABdhPJzs39hzuNj0uWtRIEFyPDdl56aDVNhCqDmjT+xyB/rU4XK/dKafiMNfDRjL7+foUVyfEcnwfg==
X-Received: by 2002:a50:8589:: with SMTP id a9mr977490edh.124.1631724213511;
 Wed, 15 Sep 2021 09:43:33 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v1sm238319ejd.31.2021.09.15.09.43.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 09:43:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] target/xtensa: list cores in a text file
Date: Wed, 15 Sep 2021 18:43:29 +0200
Message-Id: <20210915164329.13815-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210915164329.13815-1-pbonzini@redhat.com>
References: <20210915164329.13815-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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


