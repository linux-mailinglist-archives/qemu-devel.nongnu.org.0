Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B7957B99A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 17:29:58 +0200 (CEST)
Received: from localhost ([::1]:36792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEBe9-0006xg-J3
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 11:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEBaw-0002NQ-KH
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:26:38 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEBau-0005Bu-W2
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:26:38 -0400
Received: by mail-wr1-x42a.google.com with SMTP id n12so13771861wrc.8
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 08:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MscM+gZk5hsADKY0aO+LrAtG2rCxpG8OilnI2AQx9rg=;
 b=eVdr/7MwlooMP4xoBzBnBF1o3p74s1pJJ0+Soj4OZMapGWlu2u6cKhFVC8WQhR7yva
 qRRg9RYH/euRk1lnml7DdJW62mUZTGq5oIl+SObD0QlrpPEr6yMm15NzMs7pdL+HAwXS
 tz0bRFSDA09iemXYZHpqjZSQpNWiTsG7eQSdZvkcoIvhZs5WEsc7JIS7/LIQ5qH+06PM
 UpFz0Jkv56f3xq11TeJmz/z6MBI/sNrEmOdaIecB3vAyHDzdlCIwwlqb2H30IaM+NlfQ
 sNRNYdy/R2PiQrOFYXqGXBjy1ka71twlpoB9muQFpt5wru5qNf/I+WehHluCacp2GLaZ
 bxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MscM+gZk5hsADKY0aO+LrAtG2rCxpG8OilnI2AQx9rg=;
 b=65GNTTAhythsTVCuYsl2MgzD3BYZ0Er+vw7nCf5PcN9qQHR+pPG6wKJZuNZKsg0seZ
 ZjX6i06TZ91ih+S1HTlvQedt0ZJfOd0/XZzePgGrlJ1ulCKTvUY+sqT6FB/2WHBm+nRJ
 pdIAtPvSU18w71ID6tUIXWR14goYyEnUNEydq+BAK+sracwaMz1ixAID6La4SgqZbfl+
 HuMK2Qp6WU3uakHltKWp2V8nFeIpbgKqfCd/F50wgYGj/I+Z57aAPkhCtZxtfTND/AxJ
 4bSXWVe+Q7US61XNK1+MN2YfbBjwBrjh3GxS6EoWfSIEp4bvGt+VWBDXvrd7rmWmOYt0
 iuRQ==
X-Gm-Message-State: AJIora9OZxWxz0TcaG4ZpIZp6d8k193ru/gxJa2dVCVpRM/WLYLv9VL7
 0hfohiy8EDAAbsOcWE8OH2sExUyOXaTF/A==
X-Google-Smtp-Source: AGRyM1s+G7t52OeCIWGmXSy7dPuWCHJg7Kw8/Y++cXT7B012Mykaw826B7urhrM+fkxhyoFwcj/bow==
X-Received: by 2002:adf:f245:0:b0:21d:a39a:bed5 with SMTP id
 b5-20020adff245000000b0021da39abed5mr30087614wrp.508.1658330795649; 
 Wed, 20 Jul 2022 08:26:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a056000014a00b0021d68a504cbsm16395987wrx.94.2022.07.20.08.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:26:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 2/5] configure: Add braces to clarify intent of $emu[[:space:]]
Date: Wed, 20 Jul 2022 16:26:28 +0100
Message-Id: <20220720152631.450903-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720152631.450903-1-peter.maydell@linaro.org>
References: <20220720152631.450903-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In shell script syntax, $var[something] is not special for variable
expansion: $emu is expanded.  However, as it can look as if it were
intended to be an array element access (the correct syntax for which
is ${var[something]}), shellcheck recommends using explicit braces
around ${var} to clarify the intended expansion.

This fixes the warning:

In ./configure line 2346:
        if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*$emu[[:space:]]*$"; then
                                                              ^-- SC1087: Use braces when expanding arrays, e.g. ${array[idx]} (or ${var}[.. to quiet).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is our only 'error' level shellcheck warning, so it seems
worth suppressing even though it's not wrong as written.
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index dec6f030346..a56c3d921be 100755
--- a/configure
+++ b/configure
@@ -2343,7 +2343,7 @@ if test -n "$target_cc" &&
     # emulation. Linux and OpenBSD/amd64 use 'elf_i386'; FreeBSD uses the _fbsd
     # variant; OpenBSD/i386 uses the _obsd variant; and Windows uses i386pe.
     for emu in elf_i386 elf_i386_fbsd elf_i386_obsd i386pe; do
-        if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*$emu[[:space:]]*$"; then
+        if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*${emu}[[:space:]]*$"; then
             ld_i386_emulation="$emu"
             break
         fi
-- 
2.25.1


