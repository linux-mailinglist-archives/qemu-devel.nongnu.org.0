Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81E9487E57
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:35:48 +0100 (CET)
Received: from localhost ([::1]:42596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5wtn-00085i-Lz
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:35:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqu-00057q-VY
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:50 -0500
Received: from [2607:f8b0:4864:20::635] (port=40494
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqt-0007lm-5E
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:48 -0500
Received: by mail-pl1-x635.google.com with SMTP id l15so5819796pls.7
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U/9jwibW8tpqJgzwOdU5uVnM75VsccZMKM1jZSwFQWw=;
 b=yBRP8ghuGGCYWIEhCksVtxmsOAVCIRAj0i/mNBr/xTVZhzq1YU91sg/tFUa1qmDUmt
 jAcN+N0nf8bkwiJPdmdQOyoKn6OsLHysTc1itGNoe+IxCuVz8Z569e3I9ZuQmGLld46R
 xrXTBjy52BPqjtrtxFzaiYC1ep87xYLTkKoAR2dq7ceuFjmE2OnOq2Mv8P2oc8vidYcy
 BnWmZ+1VUaGl9LlTk2KwiCtn+8G7vTKlvGdqXMAfnVo72Ema7WLt0JzDHdVYmNgFL6Xp
 nMtXQaiXn5F3022ViysPN63zAa/uCfXqGqfsi5c2425LUgexdZIltvRcMKmDFwd15GZj
 NsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U/9jwibW8tpqJgzwOdU5uVnM75VsccZMKM1jZSwFQWw=;
 b=7AC1ug22Ga+dSgCGlSDtZ47aOLB5SxxcBB4/rCYxd+BPqRdjYq/fT6jek44We5me0P
 9DV7o6mgxnaXQrHnAvjSNiddpxKlls9Gcqvn/ZemV2ki1ibG/gzwtiQunMNvxQg0VmDz
 e+p9fxcdsDVCca6M+gzZVw7I2noWiLQVvOnMJ4puAnIoMUYAMRcZWj7DCrnf0RqnUwj1
 OczRKcghPNSHg8wDjOW3QgyFLAE5ctiSYwrmGA5jeaV6YFhxJnNErodI69bpxCFpE0Gt
 MUTSsAuCKQ3DDeHcs/kcF6AoZ6hJdbrKlGhyrrTq+J11CrkKf01j+BgQruwjciU60WE+
 aOuA==
X-Gm-Message-State: AOAM533jSDEjCorpSFmg+kFF+DtLd801qAyker6eG/eVxBPLTcqJOdVn
 9NVKKYtVsPhWw43RMNawQ/XF1IVDykbuGA==
X-Google-Smtp-Source: ABdhPJwWslpQsQ160O24mN3KBkCFVgEhfwcF60t28hJq7Z+lT1+JF2vRMlMlqQpR4QmkpUHPA3Tr7A==
X-Received: by 2002:a17:90b:3b49:: with SMTP id
 ot9mr17887317pjb.110.1641591165919; 
 Fri, 07 Jan 2022 13:32:45 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/24] linux-user/alpha: Set FPE_FLTUNK for gentrap ROPRAND
Date: Fri,  7 Jan 2022 13:32:21 -0800
Message-Id: <20220107213243.212806-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This si_code was changed in 4cc13e4f6d441, for linux 4.17.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/cpu_loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 96466b23f9..caeea97b9d 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -151,7 +151,7 @@ void cpu_loop(CPUAlphaState *env)
                     info.si_code = TARGET_FPE_FLTRES;
                     break;
                 case TARGET_GEN_ROPRAND:
-                    info.si_code = 0;
+                    info.si_code = TARGET_FPE_FLTUNK;
                     break;
                 default:
                     info.si_signo = TARGET_SIGTRAP;
-- 
2.25.1


