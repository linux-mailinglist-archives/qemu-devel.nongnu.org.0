Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3BB35DE65
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:13:03 +0200 (CEST)
Received: from localhost ([::1]:45270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWHug-0003ge-Km
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWHpn-0000Rj-Rp
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:07:59 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWHpl-0004gl-CJ
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:07:59 -0400
Received: by mail-wr1-x432.google.com with SMTP id e7so7236272wrs.11
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 05:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0DwG24uBdQRtPZtJXorqQ6XjIZeWaJljD2bW9Ttkeq8=;
 b=vZs0D9xm1Ki1XVjYZxZsGmOz1yvlpwDp1QB1DMoIc0oqB7NXz5w9vG1rKhAupa11tD
 xAXRJwEnAoOcAtHtxKXMVXoYxdiX/vVKodnQWvmIBiqDSTj5HJYNoIO8hU7gZx7L5YYS
 jq+NclxglwvSWIHa1hJXAfyqYblY2c0Lwwj5g05M+ttEm8ATrytWH9MpnH3yZRQjstzl
 RoNVLwg9Lf69KiCqZmDf9H6ycM3mnW2IY49j2Hngh1GbGNIHkkhYELVj63fUoOm7ZYYd
 6Gx76Txrz55R3IPYiw/MXdqBefYphmvnEq4z6jmo3Qazi0UrKz2ZtsgWKdQV0UVBoy1A
 YMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0DwG24uBdQRtPZtJXorqQ6XjIZeWaJljD2bW9Ttkeq8=;
 b=JCIoxDHWcHgyZ1cCLMk/nCFJBwF4Vb9Cvrr7KShxSP0/57knNiTFo6uP2Eg8hskSko
 6R+dlvHAXctpTHWOfh6htCZenNlPwke5TzSXwmE1KPFjaA6I0hIqTEtRqxKv7fzhnVaw
 gtau+oeJTYluIjmfI9WaNgFgzjFVAq9Psqg096PJumU1a+4oa5Yd6WYy9dydI3Z0v3NA
 4/Ur3n5lS72LsJhqUhLPo5V0TYtwmv59h0hy6brm+j07ibbYdErsWdMRqVk6mhg50Raz
 ZIjfITvbU1mzPOb17Rqrncbp6nrEW61kv/jzsvtVN4snjsi8FtaJ3NhS9bvmGPPrjgEt
 NNMA==
X-Gm-Message-State: AOAM530yYQGNm/WyWOLcHViKTEp7+dNGk9QakYTm8kgrYVf/FfKZr57y
 LX/iDZ1OJblezm8LsqIzU5dJFVFY41hdj7dC
X-Google-Smtp-Source: ABdhPJxWLn5ZLNsgKovQmW8WaOyLW5iOUDcLzY8YKSqQbZPiKzZMb+nOyyI1YfuykV5q/KEcvjMlcA==
X-Received: by 2002:a5d:4010:: with SMTP id n16mr37161032wrp.125.1618315676086; 
 Tue, 13 Apr 2021 05:07:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o2sm2245275wmc.23.2021.04.13.05.07.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 05:07:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] hw/arm/mps2-tz: Assert if more than one RAM is attached to
 an MPC
Date: Tue, 13 Apr 2021 13:07:51 +0100
Message-Id: <20210413120752.18699-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413120752.18699-1-peter.maydell@linaro.org>
References: <20210413120752.18699-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Each board in mps2-tz.c specifies a RAMInfo[] array providing
information about each RAM in the board.  The .mpc field of the
RAMInfo struct specifies which MPC, if any, the RAM is attached to.
We already assert if the array doesn't have any entry for an MPC, but
we don't diagnose the error of using the same MPC number twice (which
is quite easy to do by accident if copy-and-pasting structure
entries).

Enhance find_raminfo_for_mpc() so that it detects multiple entries
for the MPC as well as missing entries.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210409150527.15053-3-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 5ebd671bf83..25016e464d9 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -306,14 +306,18 @@ static const RAMInfo *find_raminfo_for_mpc(MPS2TZMachineState *mms, int mpc)
 {
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
     const RAMInfo *p;
+    const RAMInfo *found = NULL;
 
     for (p = mmc->raminfo; p->name; p++) {
         if (p->mpc == mpc && !(p->flags & IS_ALIAS)) {
-            return p;
+            /* There should only be one entry in the array for this MPC */
+            g_assert(!found);
+            found = p;
         }
     }
     /* if raminfo array doesn't have an entry for each MPC this is a bug */
-    g_assert_not_reached();
+    assert(found);
+    return found;
 }
 
 static MemoryRegion *mr_for_raminfo(MPS2TZMachineState *mms,
-- 
2.20.1


