Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9CD444445
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:07:13 +0100 (CET)
Received: from localhost ([::1]:46850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHr7-0006X7-4A
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHoq-0003Cb-Gz
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:53 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHoo-0000PR-68
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:52 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso4858651wmd.3
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fQMQLqy90+/8kjHtBTUhHKPlUSsOwQHXZ5naIaYhI2A=;
 b=IyTvHi4ZXZ7uVn2JDlHUt36bIK00g6klFFdyfB/GJm1F1t0vJ80zJi085vqTzPesoa
 ZKIemJhc5cL68Hu3DPlx0SAB0ZxVK81R5uPiM61tt9uMC3v82YUzJFX6SfxKZ+gczMtR
 1VagNCktbD8/mDTtR+6At4L0aF93AIj4mAfJfBFbfwx2KYGydQ0zLcdpw4maVmXjxinX
 cCa5/cSD6jFoQ6oizTdjcqot8o7iHA+GD5rJRXAKrlne03JzPFDG6EK5mNgxWvZvOcak
 X2goS0d7Aio4mV8vrjAT4Dn6xq674qSE6rJevxdeAurnZr/DqMxDEV5eXgq/9Mm+KaKQ
 +phA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fQMQLqy90+/8kjHtBTUhHKPlUSsOwQHXZ5naIaYhI2A=;
 b=RgFG9z/MKfZ9bUOK/ihTPLFgb5EybTV4DsrN6Slvk5mJhKNuB0U3El3iyAXaDr/5Y1
 F6LPlO+EcDmok56oxfVC42Shgvqrh0/0r5JroZbDPnEXU8RwLX4wKMd08jj3tGz/JyOc
 kKnpEakibUyls5mvx/M2ozEL+i21tW2HPdP7t+OcMC9I0e8AsRelIOVZlCShzmKxKiYu
 QB/pqhL22o2mVBg+dbskbViJgyy7liS4SPr7MBQqZHXmwvRm3QO9Vvo4s5/q8gFpilau
 DYCs24Z5dJE9j47109rQ1LYhKzo2dOunYAVdejrO9+HnK5AocaLP/39BFOvo6efXh5/W
 TxEQ==
X-Gm-Message-State: AOAM53115WgBOJN2qjIQ6PcENRJdmSszjjdCd+ttvWeWVU1rY4suFWIA
 N2fmIMqQqhdslyW08h6e3WcBcNVn/eU=
X-Google-Smtp-Source: ABdhPJyuGns1ADmuC4SOVAsiDDl+OpJgESqPEZo+KKIulF73baRa34MDMpEwnPcLiRssyp/fEtU/MQ==
X-Received: by 2002:a05:600c:4fd4:: with SMTP id
 o20mr15523741wmq.175.1635951887586; 
 Wed, 03 Nov 2021 08:04:47 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:04:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/27] Makefile: Fix cscope issues on MacOS and soft links
Date: Wed,  3 Nov 2021 16:04:17 +0100
Message-Id: <20211103150442.387121-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

This patch fixes actually two issues with 'make cscope'.

Firstly, it fixes the command for MacOS "find" command as MacOS will append the
full path of "$(SRC_PATH)/" before each found entry, then after the final "./"
replacement trick it'll look like (e.g., "qapi/qmp-dispatch.c"):

  /qapi/qmp-dispatch.c

Which will point to the root directory instead.

Fix it by simply remove the "/" in "$(SRC_PATH)/" of "find-src-path", then
it'll work for at least both Linux and MacOS.

The other OS-independent issue is to start proactively ignoring soft links when
generating tags, otherwise by default on master branch we'll see this error
when "make cscope":

cscope: cannot find file subprojects/libvhost-user/include/atomic.h

This patch should fix the two issues altogether.

Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210804132328.41353-3-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1b36bf2af4..74c5b46d38 100644
--- a/Makefile
+++ b/Makefile
@@ -235,7 +235,8 @@ distclean: clean
 	rm -f linux-headers/asm
 	rm -Rf .sdk
 
-find-src-path = find "$(SRC_PATH)/" -path "$(SRC_PATH)/meson" -prune -o \( -name "*.[chsS]" -o -name "*.[ch].inc" \)
+find-src-path = find "$(SRC_PATH)" -path "$(SRC_PATH)/meson" -prune -o \
+	-type l -prune -o \( -name "*.[chsS]" -o -name "*.[ch].inc" \)
 
 .PHONY: ctags
 ctags:
-- 
2.31.1



