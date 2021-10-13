Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9E042BB88
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:28:33 +0200 (CEST)
Received: from localhost ([::1]:42354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaYq-0001o6-9i
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEm-0002Fz-My
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:48 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:37552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEj-0005ji-4J
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:48 -0400
Received: by mail-ed1-x533.google.com with SMTP id y12so7308498eda.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vGjhPX2QnJ6WPnhDf7oXeCULa6fTXtYSaHXPX/SXJjk=;
 b=HxEtpM2mZ/d7QtAw8FOlKlaHmfc7cEHCV33QJR2xGEuyQaOhQ0Ahb/YWnm/VjI/EuP
 8X00oy5CvNu5HvYH57A11aLceNdHImcEchVJXeTKwlkJw8c8WNGYPudZ9/2clsQ56jgC
 LiSudyDz/q+xh+VDIWtRm0dNz/LwH53nDG0hU5YPlaliZ9fritpq5RBCi1jxc2ZjdYAF
 WbK4pQKSJIjaQPpcUvPk36IfO/2ujSdlrGGfpBnjTymJCexewjKQJUDrbZresYZAj8fk
 8ZSXNNw9lOM9tg44m2aZZkfHYVxRIXPcFFE6pV8e6cj/i+ZUM6imsu6TKFTcEdCrqmIg
 9BPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vGjhPX2QnJ6WPnhDf7oXeCULa6fTXtYSaHXPX/SXJjk=;
 b=sAst0QqdkjMHeIV1opZruNbwCi+d3yS6EzAUfoih/FgsYy47khaeU3YhsZgP7F8Xs4
 Du5XPxIjKUo+FUT6kD5g4gSBroO2F3v73ZFKkA+mk8zujXwhkb+X6wpU4X2e8TsMOn72
 B55CBdA6n3ayTaZKwe6mLhK/cbfkN6HOJ6qdzJOos8D30mMJEqilik0b0x2/C3Y4YVuD
 h1svaf2BrrQQHHvVH1yYGHJrEaO71WRXFt2J2dX/Rd7CD85K7mejrF+OS/68EjLpzEPl
 8ytQrX/28P6oqcZU7KiCbk2/XrJPOuRz4qOsxAbcgSAgxiNTZd8hch7DCff0Bjg1Mtij
 tWzw==
X-Gm-Message-State: AOAM533EqnM0X/6Wl4bx33CzBldUeznW2xBBMyiqqeCWz3jTvsyvy405
 SCYqH11M5btfduOvd5Dv+RjMOHozMfI=
X-Google-Smtp-Source: ABdhPJwZgfuIFXvGcD8ZS4n8D6IsNK3DvYOEoBi+Sqd0aqEgfdVJvD7oPbTIzyeNWIo4zMdfxoreNQ==
X-Received: by 2002:aa7:c38b:: with SMTP id k11mr7864575edq.79.1634116060400; 
 Wed, 13 Oct 2021 02:07:40 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/40] target/i386/sev: Mark unreachable code with
 g_assert_not_reached()
Date: Wed, 13 Oct 2021 11:07:03 +0200
Message-Id: <20211013090728.309365-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The unique sev_encrypt_flash() invocation (in pc_system_flash_map)
is protected by the "if (sev_enabled())" check, so is not
reacheable.
Replace the abort() call in sev_es_save_reset_vector() by
g_assert_not_reached() which meaning is clearer.

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007161716.453984-11-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/sev-stub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index 20b1e18ec1..55f1ec7419 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -54,7 +54,7 @@ int sev_inject_launch_secret(const char *hdr, const char *secret,
 
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
 {
-    return 0;
+    g_assert_not_reached();
 }
 
 bool sev_es_enabled(void)
@@ -68,7 +68,7 @@ void sev_es_set_reset_vector(CPUState *cpu)
 
 int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
 {
-    abort();
+    g_assert_not_reached();
 }
 
 SevAttestationReport *
-- 
2.31.1



