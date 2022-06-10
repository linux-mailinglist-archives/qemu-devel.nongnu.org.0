Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE4D546888
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 16:40:46 +0200 (CEST)
Received: from localhost ([::1]:41256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzfoa-0004MR-6r
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 10:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzfn5-0003Ij-Kj
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 10:39:11 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzfn3-0002LZ-L2
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 10:39:11 -0400
Received: by mail-ej1-x62c.google.com with SMTP id o7so20589978eja.1
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 07:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lQXKo2MEbNEG3rTNGzTwuOJdxJfjTrkY07wuid3v4OM=;
 b=sGoNW8mrzWifUADG1EDHyKs4oY6qgWdpiC1INchx+C5yQwBOl/zJc7EegJm+VSNsd+
 W8ZpgAEesGSCa86rbN9WGLu/nuxeKkrThEJKyW24QA1Et4rpm7xN94Uz26/28ccScBT8
 bfu29MvJ15KhJBQInfnJviTPvuzjECZQdv8TVw3brnrt+kqfmpvyoCLPpzkBCHzXdPTo
 Mgo7Qqw2z0gKcI6wUf7drX1RtJeDSduo1Lgg8YRft1eMsAsdKOuKmctPehUg5kVp83ir
 zjPUL6XPMV5jzWP5zDaEVfv+d8FXhkvkgO9e2ZwIifsLpgHr/KJ9U2+3Am/AlTakkvT7
 fweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lQXKo2MEbNEG3rTNGzTwuOJdxJfjTrkY07wuid3v4OM=;
 b=RgjfxFuBjNPZEZR1/bp9kkKQ3BZ+t0ylcJgnNZM2MQL4k+yNc/DxMWfEnJxkAfgi9P
 GT5rwSWvH6nIOhhex/J4+6c8PWljq31rCExD9MOnmRvLcz70foqUcnz+k5I+UBgmLTB1
 9AowTBeeNFT9XSzohh6lOPAlre0+LL7cKNGv9xlgq8J4SZTwBObHTAEt8EQKzT9KC0r8
 TQEz6QYlQ1s4Sf2yOsKFO0+8MgqmO/Jmv2Y8OKj+xOt5kyasWBlWHo5h7G3VhLIa3xS5
 ghy8VGGGiC10eA6ARhQ44UHIQtCgiFLQavyws4db8FDX0FRpiyxrLwK2OTGHomdiabpr
 FQKg==
X-Gm-Message-State: AOAM5310KPEK1T7sGQh0FWuIMWpbhLeE3iiHG1hPjUGoPChEalvfmdg4
 CZuad/fIWnx7JrTtsWEV5lwT4A==
X-Google-Smtp-Source: ABdhPJzedI+f5diKZ8mlrmX+6/J0t63nNJSij65ug8L8crn0kfZNkHNyF3Y+wfyAk8YwSn6aiAV02g==
X-Received: by 2002:a17:906:fcd1:b0:70a:a374:905c with SMTP id
 qx17-20020a170906fcd100b0070aa374905cmr40980905ejb.583.1654871947340; 
 Fri, 10 Jun 2022 07:39:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 ck11-20020a0564021c0b00b0042de3d661d2sm16621027edb.1.2022.06.10.07.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 07:39:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A36381FFB7;
 Fri, 10 Jun 2022 15:39:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, thuth@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [RFC PATCH] linux-user: un-parent OBJECT(cpu) when closing thread
Date: Fri, 10 Jun 2022 15:38:55 +0100
Message-Id: <20220610143855.1211000-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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

While forcing the CPU to unrealize by hand does trigger the clean-up
code we never fully free resources because refcount never reaches
zero. This is because QOM automatically added objects without an
explicit parent to /unattached/, incrementing the refcount.

Instead of manually triggering unrealization just unparent the object
and let the device machinery deal with that for us.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/866
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f55cdebee5..c413d32311 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8566,7 +8566,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         if (CPU_NEXT(first_cpu)) {
             TaskState *ts = cpu->opaque;
 
-            object_property_set_bool(OBJECT(cpu), "realized", false, NULL);
+            object_unparent(OBJECT(cpu));
             object_unref(OBJECT(cpu));
             /*
              * At this point the CPU should be unrealized and removed
-- 
2.30.2


