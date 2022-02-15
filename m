Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A7C4B7401
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:16:24 +0100 (CET)
Received: from localhost ([::1]:34494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK1R9-0005iH-3t
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:16:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK1Cn-0004sU-6Z
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:01:37 -0500
Received: from [2607:f8b0:4864:20::102e] (port=54844
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK1Cl-0007TX-6l
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:01:32 -0500
Received: by mail-pj1-x102e.google.com with SMTP id b8so5980557pjb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 09:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JA5egnPXroF8uv1I7WQE/eczsZ4kx7R+gKv7d83yjNQ=;
 b=KF6s/8bpIcp2M1NToTKNu7PizdvhYaJUjri1REpyjqti9wT6XoRYd8Wu5oPCF3LwBD
 X21TIh8ir6cdN5DOmTnygUZ6/Y75KUR4OCf0HyYImeW8eeYAO2WVX0NwOtRTEM6F8WT/
 buChSCPrPoGEJBTkctwxH6WeoxIdgrl/mm8KLwUmPtgHkRKDoaqHzONoLDMPbIl47cFe
 cTnapxH+YCNSWhkiPmaBFdIJe/QYtASmbIbHMeaFKZUHyq46buH34PW1tyJFuVlooBez
 YFSuvNwl9n9JdTXEzt0WbftBUMrFKZlAkgCEMD1VuHarjt7TvzF/6Okd8KPi5ClXhlqd
 /Zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JA5egnPXroF8uv1I7WQE/eczsZ4kx7R+gKv7d83yjNQ=;
 b=eUXzEQOISRL/V6JFPH7m5rUw4m4V0jqAiB1W71TiaZpzr2SqIMWNH1tlNFpeYmaB91
 5iUTuZr1Td9svRQI9mbhfABKZT5PNIB6/WOqnw/zDLnv/70itYjQLcgRQRFuuud8noR8
 Z1NsfKUUUzKDmhgpU6EzV4DEncYKJIBhqXuHYAmWCu9n52zbz9OhwA8r6lmiFUwjFDI3
 NplFmHJoG2d+ytvNpPhNFFyEB1+njTGh9glcjM/OD9Or6KK970+Vu5MEPLFHY9bv02i8
 swDROcJ6bCjB0oWQSE5mi9zbEibu9hoXaV6yWYgcM37RQcxQdD92SYi0Rd9+a4v4Zy5Y
 QTNA==
X-Gm-Message-State: AOAM531pCY7xZoOaFNceIBOwyDjYgb3pGCPckh/k6V0ouRl0/82iXRUj
 lPyf69000c6FaSm4Lb6FvsAES3XVFWI=
X-Google-Smtp-Source: ABdhPJyOX8XsdOHzRaXgEg0DLbEQ74ch+ycjRjbK50/SGat/fuT6PFGG8VFjWDhTRbtCfqSwfr2z8Q==
X-Received: by 2002:a17:90a:d157:: with SMTP id
 t23mr5406234pjw.193.1644944489628; 
 Tue, 15 Feb 2022 09:01:29 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id k9sm42310839pfc.157.2022.02.15.09.01.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 09:01:29 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 2/8] osdep: Ignore 'unguarded-availability-new' warnings on
 macOS Catalina
Date: Tue, 15 Feb 2022 18:01:00 +0100
Message-Id: <20220215170106.95848-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215170106.95848-1-f4bug@amsat.org>
References: <20220215170106.95848-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

When building with GCC on macOS Catalina we get 2254 times:

  include/qemu/osdep.h:780:5: warning: 'pthread_jit_write_protect_np' is only available on macOS 11.0 or newer [-Wunguarded-availability-new]
      pthread_jit_write_protect_np(true);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fix by using a stricker toolchain version low range, replacing
MAC_OS_X_VERSION_MAX_ALLOWED by MAC_OS_X_VERSION_MIN_REQUIRED.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/osdep.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index aecd2f66ec..1e7a002339 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -774,7 +774,7 @@ size_t qemu_get_host_physmem(void);
  * for the current thread.
  */
 #if defined(MAC_OS_VERSION_11_0) && \
-    MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0
+    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
 static inline void qemu_thread_jit_execute(void)
 {
     pthread_jit_write_protect_np(true);
-- 
2.34.1


