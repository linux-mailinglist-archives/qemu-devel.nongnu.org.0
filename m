Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD63518F57
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:50:37 +0200 (CEST)
Received: from localhost ([::1]:56348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzTg-0002Cd-2F
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZg-0008U3-S2
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:44 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:38538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZf-0006Lg-CQ
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:44 -0400
Received: by mail-pl1-x62f.google.com with SMTP id n18so15889581plg.5
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GB8QwFJfH3hlfZTD3yMvfbRrCq2bQTobhy4HeZnGERI=;
 b=GtB5nMVsrNEpXCWZbCWF8g/W3EwF/Mua1oY9+ap3mkiUKWdwvq4ombMwk+6j2YfWxc
 LxyJ2hvCXet9+doyYlNi+O4KohOIpAOYg+hj8TN0qA5QCOrLTK0k8EN729Wxvl7VXh3J
 uA+Q50VankCW1YKTUzXrIb/BS97Iq2wBCSckHFUxo6Bri0dTWW53q8m8HbnfAVyeKzUt
 9ameLXqrl13WaeKwCn87sh6+Tmq8NFKoeP7qZ7oizOhOeV3xmcp/4XtJIcxtYtrwc7Be
 a+rL2d7WmlxdPJCm90wj7vCeNwtEgf8RVAlipnCY8X9XzYALAqIPw+zpazktfICZwk/Y
 WlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GB8QwFJfH3hlfZTD3yMvfbRrCq2bQTobhy4HeZnGERI=;
 b=IY+MJZIJ23lf+pyrQIenENyvVVFioiObx+rKAzbX+vHybeXROc7nRxiqpPNnlkMYu/
 1lYYp0A1dBUysi+J0Q9bAsX9zy4LtjWIzIbyaOUj1rdl+/IH4tOc9+IrEgpsMpfJV99e
 usUywUaeDTOW3OLHt16QEZ1iYbbqlepLWqxfADNO1gOn9TrpTeZUbmNFwDjInAHwhgik
 UCd8WKGpCYd7Vm0bLsVVWPR7DFo/zezPCWDYTU4Ir6eG0aL4O+NcaaGJx7kq8f50iBTX
 Q4tlTAb+kVeKaUtJa5hjyDP+s5yUZYIiVZNfcI97M88qUeV6WsepxF9QG4KmTNDXqcej
 H5uQ==
X-Gm-Message-State: AOAM533iZDIKZ+1/CcVuPIwscFpXmJxfEolPpD3GJE2gtVbg0fCqcH4M
 PUv2DBkqzOkYm5cSUltMO/8mXlFhUe/g4Q==
X-Google-Smtp-Source: ABdhPJxD9+15+DjqAjJWoSG1IDKZ7HPmnHzFVdkcKyBIEBkmkahugMEYiEG8Kf7ARA30cumdp5uABg==
X-Received: by 2002:a17:902:f652:b0:156:701b:9a2a with SMTP id
 m18-20020a170902f65200b00156701b9a2amr18143826plg.14.1651607562018; 
 Tue, 03 May 2022 12:52:42 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 57/74] target/mips: Drop link syscall from semihosting
Date: Tue,  3 May 2022 12:48:26 -0700
Message-Id: <20220503194843.1379101-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

We don't implement it with _WIN32 hosts, and the syscall
is missing from the gdb remote file i/o interface.
Since we can't implement it universally, drop it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 33221444e1..254c7fad9a 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -387,15 +387,6 @@ void mips_semihosting(CPUMIPSState *env)
         gpr[2] = write_to_file(env, gpr[4], gpr[5], gpr[6], gpr[7]);
         gpr[3] = errno_mips(errno);
         break;
-#ifndef _WIN32
-    case UHI_link:
-        GET_TARGET_STRINGS_2(p, gpr[4], p2, gpr[5]);
-        gpr[2] = link(p, p2);
-        gpr[3] = errno_mips(errno);
-        FREE_TARGET_STRING(p2, gpr[5]);
-        FREE_TARGET_STRING(p, gpr[4]);
-        break;
-#endif
     default:
         error_report("Unknown UHI operation %d", op);
         abort();
-- 
2.34.1


