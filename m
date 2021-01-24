Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C620301D6E
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 17:18:51 +0100 (CET)
Received: from localhost ([::1]:44248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3i6D-0003Pm-Mc
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 11:18:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3i5E-0002hu-NY; Sun, 24 Jan 2021 11:17:48 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3i5D-0007Qw-3W; Sun, 24 Jan 2021 11:17:48 -0500
Received: by mail-wm1-x333.google.com with SMTP id c128so8641086wme.2;
 Sun, 24 Jan 2021 08:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kD8KzrVpfg7ai+aQRKtTrPaMHh5YXbVVQamXihgDcyc=;
 b=vWPbe0ZsR/WmW92IUWqifW2SQFL3Ik4LM61R95kdZG4bINo8LqteQxsnhiglcbMhiR
 zGT7VFUcoXjP28mPkFHQAwGruh8bURZUpShZvsSwqQykdvWfVhd/BRpyWz24fL6lmUA0
 MkXKn5L6t54X6QFRoJT7m3HicXRMuvflEaKu2G1DtNM9U7SF1Kmg6aqB2VvHfBvQ/b5I
 pErVvyPS+Zw+YO8KxgyT5pck+pecfPZEBpyUHXGqveCxB0JJeMZ/sqwewue483cL2qH7
 Xa3ni0pD4gAAxenBU7ZoJp4MI+jYvYnPxYdGyD7ceFFzN2ZOTpovzX7NPlqJA1mCC3eS
 p8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=kD8KzrVpfg7ai+aQRKtTrPaMHh5YXbVVQamXihgDcyc=;
 b=I0ELARKwpWDr5pPHY9vvD74cMul6p70ZO8BVyrkismpZcUdNo+ZPzDVim/D7RDcLPr
 0jP2LXxJAcoG3NTqOoNXQDCza6uq0RF9M0VzhGCfLR1yv3rRo7oJODlEfekakJ9b0awx
 1UojJudRDlYBmAnIs8k2rTKP1jM2L6wgPO5i5lIij42Tm5pyFc39eZSS9/iCP6VVICBg
 4KmFMRV8RSeHtqPxC69E2pCY2dye0qp34MVqi8lsFX8U/oXo0lc5wIuytg7Yd/YjJrgz
 dVcYiFO31DTpkfzq4V5/JH/NrnRWHjKPq5eHJgc2KsXz2JLJ+7Ms7RV5o6Dy7Tj8J6IC
 YZjQ==
X-Gm-Message-State: AOAM530EMYLEzhnXLys6h9ZbTj0RNtsx2Lb8X9ZJlKev7764WNbsBgf7
 cZ0wAFBs8DgS2VKL8xX8le1emv9W/l0=
X-Google-Smtp-Source: ABdhPJw4j5UfKJPvb4CQHeTy+tN8XKV79+b+ECecGIV1oWlSWyeTnvgdHoBsAN4iYnxxHv3a9S6sbg==
X-Received: by 2002:a1c:9692:: with SMTP id y140mr4256017wmd.128.1611505063884; 
 Sun, 24 Jan 2021 08:17:43 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id y20sm1764372wmj.44.2021.01.24.08.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 08:17:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Only build s390-ccw BIOS for system emulation
Date: Sun, 24 Jan 2021 17:17:40 +0100
Message-Id: <20210124161740.2502786-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
emulation is built. Only build it when system mode emulation is
selected.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 6f6a319c2f6..d5e97ff2d52 100755
--- a/configure
+++ b/configure
@@ -5453,7 +5453,7 @@ if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
 fi
 
 # Only build s390-ccw bios if we're on s390x and the compiler has -march=z900
-if test "$cpu" = "s390x" ; then
+if test "$cpu" = "s390x" && test "$softmmu" = yes; then
   write_c_skeleton
   if compile_prog "-march=z900" ""; then
     roms="$roms s390-ccw"
-- 
2.26.2


