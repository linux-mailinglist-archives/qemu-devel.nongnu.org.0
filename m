Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CDA615464
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 22:41:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opyzg-0004q0-Nt; Tue, 01 Nov 2022 17:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1opyze-0004pY-TJ; Tue, 01 Nov 2022 17:40:22 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1opyzd-0002fL-82; Tue, 01 Nov 2022 17:40:22 -0400
Received: by mail-ed1-x530.google.com with SMTP id i21so23669126edj.10;
 Tue, 01 Nov 2022 14:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2agOtf6ogBRFpSmHOrrhq+VOA2+fYpa3KLoEuNbl2Ho=;
 b=Omly3Hpfp2I/fg7D8Ia/BqIpoR7L/vAgjXSt4zohLyO/bS8cIBRCQfmMMyCao58Cgw
 eoiHdHVjFJR4wIpRoGuC5MSXOkZ8KQmejxktCV1ItF3xXccacByOS4UgFP7XVXrjD/dp
 QBXMWBYYBNUkiCNiKS4r3WDq5thHG9TqChgT30kKrmK3qRMnX/h01suQkyB0nPgdb34Z
 4Y/t5v4q791lHy/87XvqfQV/6Dcf3rsuQ5Gt39F13WD+t27H92FVua63lYYRr393bO5f
 ZkUraRQhpQLWh8nsA8fGbxHSwu7wwnCvyKECIIdBGUYd/A2jaEigQEZKYTmyr1YWd+/Z
 pw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2agOtf6ogBRFpSmHOrrhq+VOA2+fYpa3KLoEuNbl2Ho=;
 b=ZM3DOQIiLtv/sXP+Vvc4pv66Hz6jVzKuCMcpuxOMFgxp8sgdUSBnlR0jsBPA61dWwK
 XGkDlq7HimzEFM05jWkjbHyXRvK2BTN5sZHipj501LZDy+xB4u+YNJHtSQAJ1w/H4GVi
 twW80Tfi3qwtjxzv5v28Bq5kjEfuGlK0E2RMoSDnNIWRo+pssstVZMql1DXHPSsjh+pc
 QeNGAEvGEGndQ8i3ZbGbi05XQTFKNWFdBQgWjqsd2LuvcSRab3o4fpMWDqV/50n3eScu
 LE72X5qC+yHWgNJ2kidVVtSCE3EGDbn6p4wmndtuGl5/IrQRsYM4FNfs+RzWEVZcX/8l
 Jfmw==
X-Gm-Message-State: ACrzQf1uO7euCynOWy2zhpAULf/+YJROfgzjt83Q7phX4K1tmJP4N0EE
 obm6gHwHW9iNdl5aXiIW0N9cCnI5a9H0JUE/
X-Google-Smtp-Source: AMsMyM7miUofX9lzzaGHzt5IQzwjEyyPwBxqXtYlFT4n/kvkECMUVABEhqBW1CDmjH+H2We3iCYFPQ==
X-Received: by 2002:a50:fa96:0:b0:463:56ff:4d3a with SMTP id
 w22-20020a50fa96000000b0046356ff4d3amr13484786edr.345.1667338817222; 
 Tue, 01 Nov 2022 14:40:17 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-156-150.77.183.pool.telefonica.de. [77.183.156.150])
 by smtp.gmail.com with ESMTPSA id
 cz13-20020a0564021cad00b00461816beef9sm1969553edb.14.2022.11.01.14.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 14:40:16 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH] tests/unit/test-io-channel-command: Silence GCC error
 "maybe-uninitialized"
Date: Tue,  1 Nov 2022 22:39:36 +0100
Message-Id: <20221101213937.21149-1-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

GCC issues a false positive warning, resulting in build failure with -Werror:

  In file included from /usr/lib/glib-2.0/include/glibconfig.h:9,
                   from /usr/include/glib-2.0/glib/gtypes.h:34,
                   from /usr/include/glib-2.0/glib/galloca.h:34,
                   from /usr/include/glib-2.0/glib.h:32,
                   from ../src/include/glib-compat.h:32,
                   from ../src/include/qemu/osdep.h:144,
                   from ../src/tests/unit/test-io-channel-command.c:21:
  /usr/include/glib-2.0/glib/gmacros.h: In function ‘test_io_channel_command_fifo’:
  /usr/include/glib-2.0/glib/gmacros.h:1333:105: error: ‘dstargv’ may be used uninitialized [-Werror=maybe-uninitialized]
   1333 |   static G_GNUC_UNUSED inline void _GLIB_AUTO_FUNC_NAME(TypeName) (TypeName *_ptr) { if (*_ptr != none) (func) (*_ptr); }     \
        |                                                                                                         ^
  ../src/tests/unit/test-io-channel-command.c:39:19: note: ‘dstargv’ was declared here
     39 |     g_auto(GStrv) dstargv;
        |                   ^~~~~~~
  /usr/include/glib-2.0/glib/gmacros.h:1333:105: error: ‘srcargv’ may be used uninitialized [-Werror=maybe-uninitialized]
   1333 |   static G_GNUC_UNUSED inline void _GLIB_AUTO_FUNC_NAME(TypeName) (TypeName *_ptr) { if (*_ptr != none) (func) (*_ptr); }     \
        |                                                                                                         ^
  ../src/tests/unit/test-io-channel-command.c:38:19: note: ‘srcargv’ was declared here
     38 |     g_auto(GStrv) srcargv;
        |                   ^~~~~~~
  cc1: all warnings being treated as errors

GCC version:

  $ gcc --version
  gcc (GCC) 12.2.0

Fixes: 68406d10859385c88da73d0106254a7f47e6652e ('tests/unit: cleanups for test-io-channel-command')
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 tests/unit/test-io-channel-command.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
index 43e29c8cfb..ba0717d3c3 100644
--- a/tests/unit/test-io-channel-command.c
+++ b/tests/unit/test-io-channel-command.c
@@ -35,8 +35,8 @@ static void test_io_channel_command_fifo(bool async)
     g_autofree gchar *fifo = g_strdup_printf("%s/%s", tmpdir, TEST_FIFO);
     g_autoptr(GString) srcargs = g_string_new(socat);
     g_autoptr(GString) dstargs = g_string_new(socat);
-    g_auto(GStrv) srcargv;
-    g_auto(GStrv) dstargv;
+    g_auto(GStrv) srcargv = NULL;
+    g_auto(GStrv) dstargv = NULL;
     QIOChannel *src, *dst;
     QIOChannelTest *test;
 
-- 
2.38.1


