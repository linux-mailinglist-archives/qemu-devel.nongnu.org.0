Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7C16EAFDA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:58:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppu59-00018S-91; Fri, 21 Apr 2023 12:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu57-00016o-2k
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:57:57 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu55-0005cs-Jf
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:57:56 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e2f7so1253634f8f.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682096273; x=1684688273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7jgiE25TkQPb7QKZwOmBGpdrqCl81qjrHt2UK3yyPZ4=;
 b=N7PhqGiKUQSfFOhxZu+kgIN4sR11CxY/RoOfN8Whe9pTTAukZu7dsxNbGcRyKkWys/
 y5Q6ShSqrD7+MKsq3zXG+FxK1WC4gqEhCmf+n04pzYJPH0DSNWo5DsPMonbIjZnzTKq3
 UfCKK2yLVd+d9tVVZUBQh4OXc1dvwParyA7q5EznslvJkVsAahPYUKQ9j4uJDBP57Ug1
 7P2qB53sXgiLA5m3WnnT1PP6rSfacQpk0u8m8oAtWACYl+IpChAGoarKHmCKpmGqJryY
 Fmmg+03KkNp7IDVWLbLb9mFYwfZbb0POSXX8xaBfGxisOcp3rm6+/eyoeItDpy1aiQe4
 0a5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682096273; x=1684688273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7jgiE25TkQPb7QKZwOmBGpdrqCl81qjrHt2UK3yyPZ4=;
 b=UN5yNP4/rYXEpTBfC9NKnRZzPZukt3WxLceOV8bDG2sYVyLhyE9GJq+hMK63fU+pbL
 cKuXHhdiXMemKFYAgQ5PHHHrhuoTwPfB+mRFaZlPmchfkOEicu5bqgVhfAxeiEl2SAUN
 cYcJeGEWiH9AloNGEPw3JzD5MTa/+ecA3leOvp4IRBalbHYVCnIH+jSy+GvqeDE4jI+Z
 Pe+ckbSoQR1kzJ3gYufuhsqqqkal/ZfUpHbuyQl5XR/5ZUksIuMKclmhhwLhVAH+zAGj
 /nuQihXNLRimwNXSMDIapLyEb6+O9+2STRK6pgknq8fFkCumO1XQRe1WH2gQ8FXgx4Oh
 i4JA==
X-Gm-Message-State: AAQBX9eqZfTwXL6LdscnrC+Uv3yXpCWtWVPPspXgwC6zxG9RNnG12qCm
 +ZkDmIzAG3OwPCGzePk3fsgcr1PsaIs=
X-Google-Smtp-Source: AKy350ZUArUla304U741yNe1HwCGo3Vulf6vaka+/JznS5UtIN8byFTan7XK3/JsDPpEkrl1qm+ZbQ==
X-Received: by 2002:adf:e381:0:b0:2f9:a75:b854 with SMTP id
 e1-20020adfe381000000b002f90a75b854mr4465377wrm.59.1682096273671; 
 Fri, 21 Apr 2023 09:57:53 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5305000000b002cf1c435afcsm4820581wrv.11.2023.04.21.09.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:57:53 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v4 06/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:53:46 +0200
Message-Id: <20230421165351.3177-7-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
References: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Build bsd-user/bsd-socket.c.

Add bsd-user/bsd-socket.c to meson.build.

Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
---
 bsd-user/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 5243122fc5..f648bd3554 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -7,6 +7,7 @@ bsd_user_ss = ss.source_set()
 common_user_inc += include_directories('include')
 
 bsd_user_ss.add(files(
+  'bsd-socket.c',
   'bsdload.c',
   'elfload.c',
   'main.c',
-- 
2.40.0


