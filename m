Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E522D639C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 18:34:00 +0100 (CET)
Received: from localhost ([::1]:43004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knPpH-0003Q5-Gn
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 12:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knPd9-00053W-Se
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:21:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knPd4-0002sN-7l
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:21:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607620878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TUB+tdqJVam0Ka2WQ7+iPmxajuOAWN6UWIthadc/vek=;
 b=ZmIJZddEmJk+RUp+/GGjOUUirEH0U6TSgnpP4rUORJLJeE/gS/LLB5JBmzxoHIuWSwLhrD
 z3YuBUtR+NDEly6CvGF4U1jXZFSHRyBa/uqJl5D06+O0jqusLpxdL93kV3JTRfuAmGaskp
 tfQiK+elHxj/c5VT/j/+wXeyIFk1PPY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-bIYg4mbdN1yjLWVl1GIM6Q-1; Thu, 10 Dec 2020 12:21:17 -0500
X-MC-Unique: bIYg4mbdN1yjLWVl1GIM6Q-1
Received: by mail-wr1-f70.google.com with SMTP id w8so2173212wrv.18
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:21:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TUB+tdqJVam0Ka2WQ7+iPmxajuOAWN6UWIthadc/vek=;
 b=PbVs61+R0jC1Rizd4bvz4wboXSMZ6Oa6ibd4FIf4Nd0nP7RPnDzozV+5JKM783leWN
 ARSVe0oN7ZhYKTl/vXCdOkwFxMh8SwIgwbVvMOR6p7mJvpzdE1ZyKVasOXA3yUwCgahn
 jn96VXcBkOspZoyTtSj4vzCgtfXj5CVqAZfRfwcsLrzAyGoyE26zyrkYNVaViZaYzFnE
 4ZXV2Ov6ygs1wyAUIHTEZkLgumvfnWR235D05AD54Su3lo4jckwKtcit5OSxpRBucobK
 LheGAME5Di5mYeeFoHqkohqupU3idlQEgstOpRLC3LfhTQfCHv/0e7GgzNg/hPDkFyKk
 4ywg==
X-Gm-Message-State: AOAM533VTe1OcuGtTSdjSPAhRP7EAWB3mnU0W1B2Urys8XpMCNv+yi9P
 07hpwG6TLGlIj3l/M66nRwaxDhMqDs2weaqDFd/BchR8b6bhz6snv7gcQTPEgHCy+p2qCbPU2Vd
 MAn810sVxxOroYM6Xh0JpayFLagJJaXIkBvTCLK3dRT1GYTd8f8BNP7g1YPCI+iaD
X-Received: by 2002:a1c:790f:: with SMTP id l15mr9390189wme.188.1607620875984; 
 Thu, 10 Dec 2020 09:21:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhmLKJ8/6opJK8jk7uu+wIWqCk/dQqmBbhpZoqL4HEaOEJWFqXp3RPaobXIHeJX7etDLh82g==
X-Received: by 2002:a1c:790f:: with SMTP id l15mr9390162wme.188.1607620875740; 
 Thu, 10 Dec 2020 09:21:15 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id y6sm10652342wmg.39.2020.12.10.09.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 09:21:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] accel/tcg: Remove deprecated '-tb-size' option
Date: Thu, 10 Dec 2020 18:21:13 +0100
Message-Id: <20201210172113.167640-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The '-tb-size' option (replaced by '-accel tcg,tb-size') is
deprecated since 5.0 (commit fe174132478). Remove it.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Ján Tomko <jtomko@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: fixed "Title underline too short." (Thomas)
---
 docs/system/deprecated.rst | 12 +++++-------
 accel/tcg/translate-all.c  |  2 +-
 softmmu/vl.c               |  8 --------
 qemu-options.hx            |  8 --------
 4 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 565389697e8..14326063e9a 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -100,13 +100,6 @@ QEMU 5.1 has three options:
       to the user to load all the images they need.
  3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmwrae.
 
-``-tb-size`` option (since 5.0)
-'''''''''''''''''''''''''''''''
-
-QEMU 5.0 introduced an alternative syntax to specify the size of the translation
-block cache, ``-accel tcg,tb-size=``.  The new syntax deprecates the
-previously available ``-tb-size`` option.
-
 ``-show-cursor`` option (since 5.0)
 '''''''''''''''''''''''''''''''''''
 
@@ -523,6 +516,11 @@ for the ``id`` parameter, which should now be used instead.
 
 The ``-no-kvm`` argument was a synonym for setting ``-machine accel=tcg``.
 
+``-tb-size`` option (removed in 6.0)
+''''''''''''''''''''''''''''''''''''
+
+QEMU 5.0 introduced an alternative syntax to specify the size of the translation
+block cache, ``-accel tcg,tb-size=``.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 4572b4901fb..b7d50a73d44 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2379,7 +2379,7 @@ void dump_exec_info(void)
     qemu_printf("Translation buffer state:\n");
     /*
      * Report total code size including the padding and TB structs;
-     * otherwise users might think "-tb-size" is not honoured.
+     * otherwise users might think "-accel tcg,tb-size" is not honoured.
      * For avg host size we use the precise numbers from tb_tree_stats though.
      */
     qemu_printf("gen code size       %zu/%zu\n",
diff --git a/softmmu/vl.c b/softmmu/vl.c
index e6e0ad5a925..3f052849d8c 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3639,14 +3639,6 @@ void qemu_init(int argc, char **argv, char **envp)
                     exit(1);
                 }
                 break;
-            case QEMU_OPTION_tb_size:
-#ifndef CONFIG_TCG
-                error_report("TCG is disabled");
-                exit(1);
-#endif
-                warn_report("The -tb-size option is deprecated, use -accel tcg,tb-size instead");
-                object_register_sugar_prop(ACCEL_CLASS_NAME("tcg"), "tb-size", optarg);
-                break;
             case QEMU_OPTION_icount:
                 icount_opts = qemu_opts_parse_noisily(qemu_find_opts("icount"),
                                                       optarg, true);
diff --git a/qemu-options.hx b/qemu-options.hx
index 104632ea343..7ce06290b68 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4080,14 +4080,6 @@ SRST
     Show cursor.
 ERST
 
-DEF("tb-size", HAS_ARG, QEMU_OPTION_tb_size, \
-    "-tb-size n      set TB size\n", QEMU_ARCH_ALL)
-SRST
-``-tb-size n``
-    Set TCG translation block cache size. Deprecated, use
-    '\ ``-accel tcg,tb-size=n``\ ' instead.
-ERST
-
 DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
     "-incoming tcp:[host]:port[,to=maxport][,ipv4][,ipv6]\n" \
     "-incoming rdma:host:port[,ipv4][,ipv6]\n" \
-- 
2.26.2


