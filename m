Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4922F3026F0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 16:38:53 +0100 (CET)
Received: from localhost ([::1]:36518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l43x5-0003BZ-W6
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 10:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l43vi-0002Oc-Cg; Mon, 25 Jan 2021 10:37:26 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:42849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l43vg-0008Ja-Rn; Mon, 25 Jan 2021 10:37:26 -0500
Received: by mail-ej1-x631.google.com with SMTP id r12so18604724ejb.9;
 Mon, 25 Jan 2021 07:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tiWIFkE+/8HOYUlXMc+0S/RPGHnvCqTpi4m7t97iBog=;
 b=JD+Zn3xt3Act63rK7soE04EHETpDt529Kw5PD+72DNDTBRavnFC0PtT6uuMkIdK8u4
 /TlBsoiiyBDoQgY7++d4OCHCHUHj6RInI87KgXF1n9S/JwH/yW0GBTlpUWTJ7uh99+6x
 JtKZe77xIlQqW7mk9ZB5iWi2IwFvJsTEEj6LqwFJsIiRiOJmuKN4Rs6GfQ+O+utMft7u
 2zHvZ/z8JA/azx1xkFuBhZ8ylSYphjcJ9fm3UdhN5BwjK1B2bdu7V3q5BAhjpbWuTK+W
 Ik46VQcB1SbG5hQUVpDweWY9cHa1cb+5EowTLpF4I5pcjXxClS7ZHUaSiwI6dJ62EQRs
 UWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=tiWIFkE+/8HOYUlXMc+0S/RPGHnvCqTpi4m7t97iBog=;
 b=I4x1xzNpn9RsJZ/coRpH22JjAr2Vt5rU1kMqqkCQFD+AqpKdqzm4/tvlnMqA5HKZXt
 z4AM5OuBntDZ2baRYGthQuWV/z2y5klpUGiOQNuembwURvbgQRBGUp4X5M86t3I+VEff
 /GEBNGP53mL7bvvyLzbGcVGV4kkUxUZU+sBxUWWeiGJM8c6iPufPh8yR7J2et2ceRqpp
 kpQ92XD0bgL0H+nIjV0oK94iNSIv0o/PQlvkA4QaGyRmqKvpVfvz70J4UyBfmRsFMh9e
 F+ePLWqVmbUz/5aa/rcWxBrdvVkV0Sqb0Ych9EV96rjwrLfZFthO3mQGJYzT+IbdNBkQ
 IQUA==
X-Gm-Message-State: AOAM5303tTEBUtFpR/1QjGPGbi1MVVyQdOqBpxpLJsKk8OHM/iA+dbqk
 wU5ALQ5f22oqioIy/j37VaZoYSO8RLM=
X-Google-Smtp-Source: ABdhPJxQtmQ01eJDWUlgv+8EtbgjgCRqIIOIk1Vl76z0yIaTHahRn8oVmovWnvMMgDgaiP169a5sSg==
X-Received: by 2002:a17:906:e106:: with SMTP id
 gj6mr695625ejb.337.1611589042316; 
 Mon, 25 Jan 2021 07:37:22 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z2sm8586863ejd.44.2021.01.25.07.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 07:37:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] configure: Only build s390-ccw BIOS when system emulation
 is built
Date: Mon, 25 Jan 2021 16:37:19 +0100
Message-Id: <20210125153719.2863349-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is pointless to build the s390-ccw BIOS when only user-mode
emulation is built. Only build it when s390 system mode emulation
is selected.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Restrict to s390x-softmmu (thuth)

We could move the whole block into the case(), but
1/ it doesn't look nice
2/ it doesn't match the rest of this file code style

Supersedes: <20210124161740.2502786-1-f4bug@amsat.org>
---
 configure | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index dcc5ea7d630..997fb0761a5 100755
--- a/configure
+++ b/configure
@@ -461,6 +461,7 @@ skip_meson=no
 gettext="auto"
 fuse="auto"
 fuse_lseek="auto"
+s390_ccw_bios="no"
 
 malloc_trim="auto"
 
@@ -5373,7 +5374,11 @@ if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
 fi
 
 # Only build s390-ccw bios if we're on s390x and the compiler has -march=z900
-if test "$cpu" = "s390x" ; then
+case $target_list in
+  *"s390x-softmmu"*) s390_ccw_bios=yes
+  ;;
+esac
+if test "$s390_ccw_bios" = yes; then
   write_c_skeleton
   if compile_prog "-march=z900" ""; then
     roms="$roms s390-ccw"
-- 
2.26.2


