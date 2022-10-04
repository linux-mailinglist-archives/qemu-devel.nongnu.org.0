Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024415F44E4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:56:45 +0200 (CEST)
Received: from localhost ([::1]:44780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiPc-0007jX-35
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgO-0007Ql-OA
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:00 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgM-00008v-PP
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:00 -0400
Received: by mail-wr1-x432.google.com with SMTP id bq9so21256454wrb.4
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=JNiearaQvDip8JsM9PGb/nIll+VrO2KHIn0XRGgSTuQ=;
 b=neXO3YFEdcl2gBA6Zme+NlHbDVlKkoRf3aAA+F4mIc6R/yWPS5vjOFlCGZgFCskmEM
 0mk4fP0U555eWZX+1cD1nQtztm+uBmGezF6FDk/QjUuTfDolV8xH9CEb6lkdO9jcGIYN
 YnuUaU2QX2oLbpYTp6dOl5FEI6oo/t7r4xn9YlJWgbct1GfoTLqbNLE5MFxJN7Ke9hRS
 ll4cMXh/ALzyke0Svl3Q6DJzNgSbpG8+t0jGSzeeQJF9jdfBqkefIzLYS8BFcd7KHHSv
 ZbGBZhoYi47uGvV4HXgpS0AO+ukgviCFi87n019cGYP7YrKKmfXJ4FUQmiEtVp0FdJVQ
 C4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JNiearaQvDip8JsM9PGb/nIll+VrO2KHIn0XRGgSTuQ=;
 b=L4VUd/cxEDrF27TTAMbYnDEIue4X8+J/hxw+z+aN5QwhBD4h3Z9ZbDT8y1BrzGqGT+
 +nw7soFaL+aln6VIrL6hbFma2WkZMxyEjaLaSfqaSc2qaAm2FGU0XRsAbDvbFCzmyj9z
 fZnzg5iVWVjdPQ88AhUnUDN6HHOaa/Zuca2zFf5rAwvSx1PAodhv7uyyyueTlqw0fMuD
 TgFPc/pcszItXgFiObZsqMn8E5EcxqJ3+AxMr/O8RkNru9+aXdkTk3LxN8goU7FiZLRo
 x+saXzQZYSZnliwSYTlPfhyuecLQf9AeUu2GmMREPu1A7hFTtzFu72b3WhtvDbMW5Wxz
 uxiQ==
X-Gm-Message-State: ACrzQf0dei1+FbluAu19X5/O88wEz3pHjiCRNjVKrCBIo1SPd8p/lcSK
 D4Id7kkdCfxlFlVvi4xC5il1ZjbQYmQfOg==
X-Google-Smtp-Source: AMsMyM5mfWAwy1De+JzrEG6AypGQQX6cuv3TwDAW8RHllQ2yAlIDNyUFCLnX9C6DIVAGuSoXpIaA1A==
X-Received: by 2002:a05:6000:184d:b0:22a:7428:3ae8 with SMTP id
 c13-20020a056000184d00b0022a74283ae8mr15286845wri.441.1664888997218; 
 Tue, 04 Oct 2022 06:09:57 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n41-20020a05600c3ba900b003b3401f1e24sm1723574wms.28.2022.10.04.06.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:09:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 347EA1FFBA;
 Tue,  4 Oct 2022 14:01:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 17/54] configure: return status code from probe_target_compiler
Date: Tue,  4 Oct 2022 14:01:01 +0100
Message-Id: <20221004130138.2299307-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

From: Paolo Bonzini <pbonzini@redhat.com>

For now, return 1 for container-based compilers.  This will change as
soon as ROMs will be buildable with them.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220929114231.583801-18-alex.bennee@linaro.org>

diff --git a/configure b/configure
index aaa09fb957..f3984bb193 100755
--- a/configure
+++ b/configure
@@ -2147,6 +2147,7 @@ probe_target_compiler() {
     target_ranlib=
     target_strip=
   fi
+  test -n "$target_cc"
 }
 
 write_target_makefile() {
@@ -2294,10 +2295,9 @@ done
 
 # Mac OS X ships with a broken assembler
 roms=
-probe_target_compiler i386-softmmu
-if test -n "$target_cc" &&
-        test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
-        test "$targetos" != "haiku" && test "$softmmu" = yes ; then
+if test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
+        test "$targetos" != "haiku" && test "$softmmu" = yes && \
+        probe_target_compiler i386-softmmu; then
     roms="pc-bios/optionrom"
     config_mak=pc-bios/optionrom/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
@@ -2305,8 +2305,7 @@ if test -n "$target_cc" &&
     write_target_makefile >> $config_mak
 fi
 
-probe_target_compiler ppc-softmmu
-if test -n "$target_cc" && test "$softmmu" = yes; then
+if test "$softmmu" = yes && probe_target_compiler ppc-softmmu; then
     roms="$roms pc-bios/vof"
     config_mak=pc-bios/vof/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
@@ -2316,8 +2315,7 @@ fi
 
 # Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
 # (which is the lowest architecture level that Clang supports)
-probe_target_compiler s390x-softmmu
-if test -n "$target_cc" && test "$softmmu" = yes; then
+if test "$softmmu" = yes && probe_target_compiler s390x-softmmu; then
   write_c_skeleton
   do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
   has_z900=$?
-- 
2.34.1


