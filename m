Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A925BEFF6
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:19:56 +0200 (CEST)
Received: from localhost ([::1]:33240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalat-00065U-12
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzf-00067U-L7
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:11 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:42968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagze-0001pC-3G
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:11 -0400
Received: by mail-ej1-x630.google.com with SMTP id sb3so7822486ejb.9
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=SwsloABj9l4c1j5XqayskjiIM16mHr6hEPOnkBWi5uQ=;
 b=XHZ9edWefWpq/w+E3WTfaeN+tmWMenqZFrL3a6ZIGuVLG5lwa/pAHE7zsrBPfAQbzQ
 +QR9FahwkOEMEijozVnlce2nJuK2K07CwrAjoDZCGNzcKO5eVEOpophGy039zWrcXc8+
 uLVjVTN+Ko/3xpw0AYDUgvOmhP5FZfdmXjmh6kvInAo9HzluI7at4y7WDKvvzbliyGlx
 9bCmurYpNusiWHn+5Jb2xX8lHYJHL+/wn1whHeCVyULcplEyWFiumSRR9gO3EHFc9iKV
 g1Xkmm/U3e7dnSrE9R/k8pAXM5mmNJtyfrDyU/5cuuhGQwHniXWFww/+NCXAxh4jP9rA
 m3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=SwsloABj9l4c1j5XqayskjiIM16mHr6hEPOnkBWi5uQ=;
 b=odXc70l06MadiHgSck9yJ9UBIrzZ/wwg4kLA4MqYd0QlMdJzp9QAC84s1b5WvnACnc
 o5v+qUQYYd4VcooFp6lRJQ32IjFFjH5FUAfwScRGmsg7eOtx51F8y3ORSzLePJhuUyQ4
 yh04M9srSJ9t4uuW2enPd3O71soK3GHiqhrZ7ssT/G7wgUVHi5lLn3zkE0IWk7KaPavN
 z8E2IJ8Sf6ZRGRa/tnBKLiZOC4w8AyRPE4YMPis30c4TiHRfKRHA6eXoHPGT4zTrC8cP
 Mx4j4ABqwupmSsLv8sVDUn210rrNl4F4867d6b6d57/8pi12Q1xkdFrg1czWRrxyCCpR
 pPNw==
X-Gm-Message-State: ACrzQf0guwDD0z4zD1kF/bAjHjvKq8Rz84fvH9VqL7xWudxxe/yAYPKn
 oJWfsxVxh2MTNlDMcKaeAlo3k0swj7yk1A==
X-Google-Smtp-Source: AMsMyM5cd2YoiWl8UMjtfi6Cfb/rLMlSHx+vxdB5IBkZgs7CR19p4H0Uf0oeEFIkMWk9z4iyEEQEPA==
X-Received: by 2002:a17:907:1c03:b0:77b:9d77:c5 with SMTP id
 nc3-20020a1709071c0300b0077b9d7700c5mr17510887ejc.225.1663694709314; 
 Tue, 20 Sep 2022 10:25:09 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a170906d10c00b0076f99055520sm146043ejz.137.2022.09.20.10.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 88AAB1FFCA;
 Tue, 20 Sep 2022 18:15:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 18/30] configure: explicitly set cflags for --disable-pie
Date: Tue, 20 Sep 2022 18:15:21 +0100
Message-Id: <20220920171533.1098094-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is working around current limitation of Meson's handling of
--disable-pie.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220914155950.804707-19-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 575dde1c1f..0bbf9d28af 100755
--- a/configure
+++ b/configure
@@ -1382,6 +1382,9 @@ elif test "$pie" = "no"; then
   if compile_prog "-Werror -fno-pie" "-no-pie"; then
     CONFIGURE_CFLAGS="-fno-pie $CONFIGURE_CFLAGS"
     CONFIGURE_LDFLAGS="-no-pie $CONFIGURE_LDFLAGS"
+    # Meson currently only handles pie as a boolean for now so if we have
+    # explicitly disabled PIE we need to extend our cflags because it wont.
+    QEMU_CFLAGS="-fno-pie -no-pie $QEMU_CFLAGS"
   fi
 elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
   CONFIGURE_CFLAGS="-fPIE -DPIE $CONFIGURE_CFLAGS"
-- 
2.34.1


