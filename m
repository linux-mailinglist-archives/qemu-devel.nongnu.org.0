Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531A53AB05A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:53:12 +0200 (CEST)
Received: from localhost ([::1]:46814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltohz-0007J0-Dj
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNg-0003IB-Md
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:12 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:44941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNe-0006S6-Mo
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:12 -0400
Received: by mail-ej1-x633.google.com with SMTP id gt18so8690176ejc.11
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ih1xddWmyW9WnFhSZ9eRiE6DF/hMjeq/MCb4afEYuBY=;
 b=IK2Zaum/1R3bz4w0YCSAYB1xPl3BAL3bv/jzV/qr8GZ3e4GgqE1zFA+fsl10B1hWGL
 tyomFaEfRxoL/69R0kBFbX2cZ7w0PMGJh7fp2Z54hiEqnsofE/ME1xDnrXrxzHkDJ8qc
 BcENH/nGv4RYXmLwM83vA9sGKvAi/J+/6SV96uvDT/lpnwV65rGqOlypkIrqm7oAxgG9
 GNpJhDJirvH5H+mz8oR8DgqaTftGMDMzgx1d0ej4DHyUB7Puq1fTJgUYNQnAunOuHFw6
 smwogOsW+8O1V6LKX/cxO21w/LdCXuYfLchIOP9noJE/3Am/um9jug/JK95boZwuklTt
 elpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ih1xddWmyW9WnFhSZ9eRiE6DF/hMjeq/MCb4afEYuBY=;
 b=nROjfuTyg6q29o7epfxzUqqAJqnGGCynl0sSjHsx+6DUFnHPf4e0fabib72/UN0Nm5
 YLuPlrQSmujwVYXN9a5ljm2vlsKLKv2Y85eiWvZawKSx2xwNWe7yDecZUSBZf1mgylkM
 XaQpJtJ1KxfjvGUvjTH/AcAjpN8VtuzY0QvnDtOuINBElI9qx8TEDE19a5scp7MIWDJ7
 kNl/KUPC6alxhs34AkL/zkEy2WS+uPNQTK+qgh9ljlSnnnTs2dfxw/nYM5a3KJtgs+Go
 fCghkGgK5l1wIlHB7nIK4hjiwWtYDUuNlfGmbU8OyDcb4SN4yVFejcc4FS+GdjW4T6w5
 soiw==
X-Gm-Message-State: AOAM531DqT3YDViZw3pjl36+rOCA0L0JKCwPErK1S0vdzGLjg8r2gqRV
 wNyX/4y8T4RsMK4df9ctqx1Ov2ky25U=
X-Google-Smtp-Source: ABdhPJwZU2hxN+vBE8WItKOUpqhAHst8eyd5aYr8s7qLE9dXiiubltDGg+AMwXt5nf2/K6k+rrRTLg==
X-Received: by 2002:a17:906:670c:: with SMTP id
 a12mr4118558ejp.249.1623922328333; 
 Thu, 17 Jun 2021 02:32:08 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:32:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 45/45] configure: Remove probe for _Static_assert
Date: Thu, 17 Jun 2021 11:31:34 +0200
Message-Id: <20210617093134.900014-46-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

_Static_assert is part of C11, which is now required.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210614233143.1221879-9-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure               | 18 ------------------
 include/qemu/compiler.h | 11 -----------
 2 files changed, 29 deletions(-)

diff --git a/configure b/configure
index ebc016111a..262ab71802 100755
--- a/configure
+++ b/configure
@@ -5090,20 +5090,6 @@ if compile_prog "" "" ; then
     have_sysmacros=yes
 fi
 
-##########################################
-# check for _Static_assert()
-
-have_static_assert=no
-cat > $TMPC << EOF
-_Static_assert(1, "success");
-int main(void) {
-    return 0;
-}
-EOF
-if compile_prog "" "" ; then
-    have_static_assert=yes
-fi
-
 ##########################################
 # check for utmpx.h, it is missing e.g. on OpenBSD
 
@@ -6035,10 +6021,6 @@ if test "$have_sysmacros" = "yes" ; then
   echo "CONFIG_SYSMACROS=y" >> $config_host_mak
 fi
 
-if test "$have_static_assert" = "yes" ; then
-  echo "CONFIG_STATIC_ASSERT=y" >> $config_host_mak
-fi
-
 if test "$have_utmpx" = "yes" ; then
   echo "HAVE_UTMPX=y" >> $config_host_mak
 fi
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 5766d61589..3baa5e3790 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -72,18 +72,7 @@
         int:(x) ? -1 : 1; \
     }
 
-/* QEMU_BUILD_BUG_MSG() emits the message given if _Static_assert is
- * supported; otherwise, it will be omitted from the compiler error
- * message (but as it remains present in the source code, it can still
- * be useful when debugging). */
-#if defined(CONFIG_STATIC_ASSERT)
 #define QEMU_BUILD_BUG_MSG(x, msg) _Static_assert(!(x), msg)
-#elif defined(__COUNTER__)
-#define QEMU_BUILD_BUG_MSG(x, msg) typedef QEMU_BUILD_BUG_ON_STRUCT(x) \
-    glue(qemu_build_bug_on__, __COUNTER__) __attribute__((unused))
-#else
-#define QEMU_BUILD_BUG_MSG(x, msg)
-#endif
 
 #define QEMU_BUILD_BUG_ON(x) QEMU_BUILD_BUG_MSG(x, "not expecting: " #x)
 
-- 
2.31.1


