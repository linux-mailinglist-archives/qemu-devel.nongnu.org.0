Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DF3309164
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 02:56:47 +0100 (CET)
Received: from localhost ([::1]:47136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5fVG-0003I0-SY
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 20:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fRH-0006ei-JL; Fri, 29 Jan 2021 20:52:40 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fRG-0008Sq-5z; Fri, 29 Jan 2021 20:52:39 -0500
Received: by mail-wr1-x430.google.com with SMTP id v15so10648515wrx.4;
 Fri, 29 Jan 2021 17:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TWOO2zfu8P4UM754zwKeQRqNcelSJ+Vi3BwaB87IrgI=;
 b=EZ4R0A6K45GJEpt3ikVxK/mZ5uOp/qSvLKwjO7LS5PbjeX+3sWdmNlr+4p56lnPtqL
 CUdY1yW1rTe7NWAKG6FtSRNNZKnZUAI2VEHfT9t/GySrE8ds9BQbysvGJYiW2faVZNpm
 DGZ+2ZzDYpOjHkDu0jST31KidNc+L9/fohOoZJZMRjKENmO2boj+1Bne8nOdoKsZZOk2
 hms4LiJZ9snctfQC29BzW0EhHYsmNCX7dzY+CxfZJyC29i8WBBxcI2hmd0NS7su5sU/F
 vCixTZjkQ3F8hOmBQQBzuo5d3mfiya1x/ZzCDk9XbkWe7CW7UiXUFmxJzINuRhOtpEh6
 vHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TWOO2zfu8P4UM754zwKeQRqNcelSJ+Vi3BwaB87IrgI=;
 b=jEywqhePV6AGM6PdtMPBs30MAn3rm1DrX0P+UiHZjTE2mRZoUETUsYXuKmDnJ+Tl/C
 QJ9pI89QRXduM5LPoEjM/WXzYN8UGqB5FuxkmWfCnaD8426nIne39rTSmMFFHUjIxs8N
 pqWqJan+Qc5mxHcWHGrMKyRT74mXBnPTIDVZWlW53M8tRAQijdRJuJnHgePyaoeHZlDU
 zwM7++Mhuvph2OhaVFdfFoRMmijI2Sk4Q4KjJC8i3C/Niuj9Uy2euFlCjNMtmiYtocJQ
 eAsPwzAJeu5kDx5AzNzPXsvsjr+jKLGHo+rbRMw004SllpEfsXLhwCK4ncj1prrEqgw5
 nGwg==
X-Gm-Message-State: AOAM530K47B2pG4JUILlLSV1SAG/pC9F/8GlGZyA+8HbSnmf4MyhVC9F
 mumEeoyWPc9Ml3yhgaZookWeFC8Etbs=
X-Google-Smtp-Source: ABdhPJwm3L7bSc0x4zKW4ljahz5/V9fkUWnJDpwudDy2IcbG2e/6dOTMtKI7Na8SK+4UY4kLg/lEbg==
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr7191301wrm.277.1611971555621; 
 Fri, 29 Jan 2021 17:52:35 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u14sm11707719wml.19.2021.01.29.17.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 17:52:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/11] exec: Restrict TCG specific headers
Date: Sat, 30 Jan 2021 02:52:17 +0100
Message-Id: <20210130015227.4071332-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015227.4071332-1-f4bug@amsat.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes when building with --disable-tcg:

  In file included from target/arm/helper.c:16:
  include/exec/helper-proto.h:42:10: fatal error: tcg-runtime.h: No such file or directory
     42 | #include "tcg-runtime.h"
        |          ^~~~~~~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/helper-proto.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
index 659f9298e8f..740bff3bb4d 100644
--- a/include/exec/helper-proto.h
+++ b/include/exec/helper-proto.h
@@ -39,8 +39,10 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
 
 #include "helper.h"
 #include "trace/generated-helpers.h"
+#ifdef CONFIG_TCG
 #include "tcg-runtime.h"
 #include "plugin-helpers.h"
+#endif /* CONFIG_TCG */
 
 #undef IN_HELPER_PROTO
 
-- 
2.26.2


