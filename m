Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74428260563
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 22:07:11 +0200 (CEST)
Received: from localhost ([::1]:45292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFNPy-000884-Gh
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 16:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kFNNq-0004o8-5w
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 16:04:58 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:44564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kFNNo-0008Mx-PV
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 16:04:57 -0400
Received: by mail-pg1-x542.google.com with SMTP id 7so8467737pgm.11
 for <qemu-devel@nongnu.org>; Mon, 07 Sep 2020 13:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b0+yDkPUAOPfrghGZz2GsdNXdMaVRYPMlhMxDHZVuTc=;
 b=Zy6OGhbZNcTQXJq8PT/O71NenYwRc9oGVlOIeGlbFzRqzxh82vI4Axu+uCrfvyfS+t
 Vp1PscEqSD/vHzMvXiJUV/TKNykvaKrS3Etf4HN7xVp2U9mxAMjm62fR5bEEqo9l/IJB
 C3rj+JYMvnwFklFTWfccmjMNE9qGXam6nsfW6dgY1oBhH2y39le5CBNAxUGnGdGG2qeA
 jeCT295p+m5QHn8N1FNGIQa3g8pHULj2T5Uyip3TKhKja4CBfqiXxmr9Q2H0ORWFmXTQ
 3Tqlr2CXFPbw436bF/VSOy3+Ul8N2O7FTHRVYKozR61oGOI33AF4C7YS9bXFnormu4K7
 xVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b0+yDkPUAOPfrghGZz2GsdNXdMaVRYPMlhMxDHZVuTc=;
 b=FmPwmHBVm86h8DrbOaYkuDI2sBcUdRRtOQMtO/OEqDMBahXRKHfmZU8mKcvYuR725f
 TfCCglw0mcESDahBNmVmx+SZ/BKw4QeghJX6fFo8CLTrciA+7OM1Cvea1Y30H+i1DGAz
 FzL07rusoZQSi4mN5iNTVBTwEJEHbk5pZvI4O435K7RgATGU3Mp1aHnIsMWCe2YkqUvR
 WKMmj2ZrO8xTMysAuKsNnCKgR1Px6hxLPWRu0kSSJXFrc/7glEOfbNyJDsezU14O5y0C
 Gr0ucNjRr5t5dCBG0Td18buhE2cDpUS7Hw3gESSJgA/b5Yrek/XQkAlez2ZNDqfN4Uer
 KkDA==
X-Gm-Message-State: AOAM530RfTNA3PvXx1q4SkOkbC0Mqay0wUzL/DUK7idDajr2Y7cfVsdy
 ENNs5n9SMTFF+TpGHXYBJqtMwhuA5GMzVBGS
X-Google-Smtp-Source: ABdhPJwqtsDNWYK8YRMJXhNt+SrQiP4j3ceKmeae/k/yq5Q+7R7EM3ldPdQxeTRa9nIrAQYeJldMkw==
X-Received: by 2002:a17:902:bd48:: with SMTP id
 b8mr20016949plx.139.1599509094965; 
 Mon, 07 Sep 2020 13:04:54 -0700 (PDT)
Received: from localhost.localdomain ([222.95.248.6])
 by smtp.googlemail.com with ESMTPSA id 204sm8713098pfc.200.2020.09.07.13.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 13:04:54 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] vmstate: Fixes test-vmstate.c on msys2/mingw
Date: Tue,  8 Sep 2020 04:04:31 +0800
Message-Id: <20200907200432.2418-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200907200432.2418-1-luoyonggang@gmail.com>
References: <20200907200432.2418-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=E8=8C=85?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vmstate are valid on win32, just need generate tmp path properly

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 tests/test-vmstate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/test-vmstate.c b/tests/test-vmstate.c
index f8de709a0b..4c453575bb 100644
--- a/tests/test-vmstate.c
+++ b/tests/test-vmstate.c
@@ -34,7 +34,6 @@
 #include "qemu/module.h"
 #include "io/channel-file.h"
 
-static char temp_file[] = "/tmp/vmst.test.XXXXXX";
 static int temp_fd;
 
 
@@ -1487,6 +1486,7 @@ static void test_tmp_struct(void)
 
 int main(int argc, char **argv)
 {
+    g_autofree char* temp_file = g_strdup_printf("%s/vmst.test.XXXXXX", g_get_tmp_dir());
     temp_fd = mkstemp(temp_file);
 
     module_call_init(MODULE_INIT_QOM);
-- 
2.28.0.windows.1


