Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 466C72CBB92
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:33:03 +0100 (CET)
Received: from localhost ([::1]:52946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQNa-0004dB-98
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkQI9-0001Kf-78
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:27:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkQI5-0003NJ-KV
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606908440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RxnjjR18gk0mt5xIalKlUpLiPI5xq8GgzKcqQXfviyE=;
 b=UMjQIo9I6Sn60wveadS5tAOVJrD+Ri7UIkq5AjyVEeIEHOiDrQQfKOrFBCNbUP7d04zpF8
 JWE+ZxI7wYFLCSFeddQFFxpDLt98KKRF77Vb7lqTxoQ9lBsguyZTbR/dfvQwbqNyC/8p/R
 J5vmXotDppoYNzLc3mObRzvpEFz0Ez8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-LbEWo6-HMH2KbQg2yTc3zQ-1; Wed, 02 Dec 2020 06:27:18 -0500
X-MC-Unique: LbEWo6-HMH2KbQg2yTc3zQ-1
Received: by mail-wm1-f70.google.com with SMTP id f12so3190723wmf.6
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 03:27:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RxnjjR18gk0mt5xIalKlUpLiPI5xq8GgzKcqQXfviyE=;
 b=LtZzM8jkWgs9KDt7KtTYJgjfJHXNYXL1vqg85r/apWXvp5uS7ZvYWLMZRSK+LZtHYN
 EfKmK5i6rakXKkAUHgJu293XrH2c3eoF9cDosqa1XMngS9HORTN2ETosueZNYseFqsmY
 50oMDvOm0RvN3DEXe/ghM/mBaDgMSvyr4e44zbPbTY4PMMeZSSscaIYkfNXebjl6IncZ
 tAwEvYvpmHzHn65/BprDj+2+z2vJ0m9z7guvBFB7w0CCI+hZHMb8RMjdpsO7149rMJYX
 /zYWFUDDqJgRuK1q1GIMq9ME4sdVr9Z/hOMsLEUJUIDpKiaH2SvB6ab95lOnGrfreEnB
 TqXQ==
X-Gm-Message-State: AOAM533wuPbg/udAfg2Zccmrb49skLZvOcfGt92JFZF0mKsUUbgDfmIZ
 go1duLvL/UEdr6cBdLwkl43i/M/eFzOxwBWaBvhozUbSkKoEClBlbux4O9fcYE70yW3tq8fHkvJ
 FXMcKGvQ6McHlmJeVRYRSRwFB2LSY991jVVWmyPK0ICE88yxK98JF0mOsYmB31Seu
X-Received: by 2002:a5d:4f90:: with SMTP id d16mr2920124wru.292.1606908437179; 
 Wed, 02 Dec 2020 03:27:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDo3cMDy8pdGI0AFvr6eyVz3myPouOauiOvAQKcTk7mgE8b38quGqmL2mrsFOTtT5pS+JP2g==
X-Received: by 2002:a5d:4f90:: with SMTP id d16mr2920084wru.292.1606908436854; 
 Wed, 02 Dec 2020 03:27:16 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id g192sm1695693wme.48.2020.12.02.03.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 03:27:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] accel/tcg: Remove deprecated '-tb-size' option
Date: Wed,  2 Dec 2020 12:27:14 +0100
Message-Id: <20201202112714.1223783-1-philmd@redhat.com>
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
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
Cc: libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The '-tb-size' option (replaced by '-accel tcg,tb-size') is
deprecated since 5.0 (commit fe174132478). Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/system/deprecated.rst | 12 +++++-------
 accel/tcg/translate-all.c  |  2 +-
 softmmu/vl.c               |  8 --------
 qemu-options.hx            |  8 --------
 4 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 565389697e8..70bdb62a6d6 100644
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
+'''''''''''''''''''''''''''''''
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


