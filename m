Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9623942020D
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 16:31:52 +0200 (CEST)
Received: from localhost ([::1]:52252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX2Wt-0005fY-CK
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 10:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2Ue-0004cF-Qo; Sun, 03 Oct 2021 10:29:32 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2Uc-0005vW-Ft; Sun, 03 Oct 2021 10:29:32 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v17so25316927wrv.9;
 Sun, 03 Oct 2021 07:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tf1HffZsun/ljYlvTFfDvOCkmO375AxDos8nRbn/Wkw=;
 b=UzRa+rl6AdAswQDUVGFxUsrsIF5u77R6GzN/DHcUeos/vByLv1nHbYsBhvSl0ycdiY
 pJg4XxNqxsn2MDmfYJ0CFb4ITxMthPFXaLoDD2gRHRhfQNddiZcZ5quOX9JmAPaHiCJ+
 WgDdA6NkGajJgfTvlWXfARauIQFCAQsoDCmV9AdxxYXvuz+vYKOpYlQLfDXgaJZIk5c4
 +gXq69de+HPhVVUry2UhsWJcKkjskJe6JlFWAYDm1A1m7s1lrUWWEb6DLos5qfiga6nc
 XkO4duNuU4rJnqWlKKpJKYfh+sb6xFeflS+giojosjDQ7n0awedLkWroZgWc0nM0kiqZ
 0p+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=tf1HffZsun/ljYlvTFfDvOCkmO375AxDos8nRbn/Wkw=;
 b=2ft/r7vaw5ITbkTf/sjgfWx1i3FaH4/Y4lxzdqXTP2AvP7Ge/EmRgBA3VH07xB4ArR
 C7O1dZN+sfa74Fyyp+m0cEenuy2giEQA31LCyq3z9VMlB/2BrZ4z6xMpYdPHsQGA2uUZ
 sqcEiH3eDMAq4K0SgHqpJv7e68/uOg9GvGan4h67Dfe6iVOJrv/QYkGRzNpgkCfL1nuo
 VrinsSQGobPM1gsth1bDQZ3RY0jHKgH028oEbqM5J/v5wmZukrj4R9fsY2M5Nq6GoN3k
 OCo4svvlPWsiDcM3s9pe6rZ3BqQjZlLfqQlWia2PlzvX5T/9lMnGy9MqiSqKWurHn9oi
 TcMA==
X-Gm-Message-State: AOAM531C6NxCmf5OuKU9VpwiKqLVjO3q2NhUQMECxxU0TIHce9cY4DB0
 kJpjj2zTzU7wNRoJwVVf9fg9rmyI+HE=
X-Google-Smtp-Source: ABdhPJxnk7uj5uq7NK+ids9rTyUqEv4Jz/1KqyEVv9lScFbBXME2T/IdaExIa0nJOciJY3ic0CKdgA==
X-Received: by 2002:adf:dd01:: with SMTP id a1mr8716524wrm.132.1633271364130; 
 Sun, 03 Oct 2021 07:29:24 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 p10sm11822158wmq.40.2021.10.03.07.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 07:29:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/s390x: Optimize save_link_info() using extract() TCG
 opcode
Date: Sun,  3 Oct 2021 16:29:22 +0200
Message-Id: <20211003142922.3678039-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running the scripts/coccinelle/tcg_gen_extract.cocci
Coccinelle semantic patch on target/s390x/, we get:

    [DBG] candidate at target/s390x/tcg/translate.c:1560

Manually inspect and replace combinations of (shri, andi)
opcodes by the extract opcode.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/s390x/tcg/translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index f284870cd2f..bfd805920c6 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1557,8 +1557,7 @@ static void save_link_info(DisasContext *s, DisasOps *o)
     tcg_gen_andi_i64(o->out, o->out, 0xffffffff00000000ull);
     tcg_gen_ori_i64(o->out, o->out, ((s->ilen / 2) << 30) | s->pc_tmp);
     t = tcg_temp_new_i64();
-    tcg_gen_shri_i64(t, psw_mask, 16);
-    tcg_gen_andi_i64(t, t, 0x0f000000);
+    tcg_gen_extract_i64(t, psw_mask, 40, 4);
     tcg_gen_or_i64(o->out, o->out, t);
     tcg_gen_extu_i32_i64(t, cc_op);
     tcg_gen_shli_i64(t, t, 28);
-- 
2.31.1


