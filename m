Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8DC2F0B82
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 04:38:24 +0100 (CET)
Received: from localhost ([::1]:48348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyo2B-0006Qi-5v
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 22:38:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kyo1P-00061O-Ro
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 22:37:35 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kyo1M-0005s1-SR
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 22:37:35 -0500
Received: by mail-pl1-x62c.google.com with SMTP id q4so8792042plr.7
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 19:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5r9M5X/kNhkrnfNoi4kV8NyPHgwMBwUgcmxqqFXB7so=;
 b=MOmyeSToZFGOcrWPmHoKGUNcfo8ozhKIGtJIgeLVrHeUJbq+NXigkTvKt1t9Tb32Or
 YlUaTfcAVOUxdK+6yWXnYyHbPRFEc1Z7Gp9ekC6OX5XXe7hALiHRrzNwMWcTp+kADw5S
 F7kwpSyGl0el8O8ofbYtn+5+knm1LiSwysjMq5TbGf+/Vr47loF9QWqZ0GRC4PxRu6Sa
 YhYRahSV/cuIISoso9zcBFwTwmrJiwmuumLyd7Gxaa3+oDDFnPJAPBKKSnU6P3JoBZpo
 rbEVkH4keAUFGYkDz1tNHMOVtWvKugunxpuPjf7po9Y3X1GtMMBV5/e0iBbY64VwNyff
 lmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5r9M5X/kNhkrnfNoi4kV8NyPHgwMBwUgcmxqqFXB7so=;
 b=URGCs0IPau7H2K1OigClWK7DrLkS8byPa61tO/6XzmhCon2fP3rvR/qIfn6kW33+Gq
 w0L9tNkCbYkPqcxrUHzadPmWm3zADukyITXWlXhBodU+OVD5yLTfep62/pi9TCC7iokO
 Cu/W2i3CwBgbCv5ZzsAJXGLNvsd5TRVQwrsfrKvxFNHWsdnm6d+ScTI/Zx9mbIzAxNMS
 ssAohVg0jii95cauLh8kJFTzeMspItig9qUGUwmpn8S37Xyl7T0pZ6kv6Rsgms08C6tH
 iJ0YsmtZ0LHDuAyQKQuZaRlDZRiWmxyFPLHu/+6F8z2+SaeuJgAE3P7cazTzSlwBLD3J
 r4dA==
X-Gm-Message-State: AOAM531T3fdidypxTo38k7JgNUnKaX2rckP6pf6DLyU0+Nu6Komg6+V8
 wBWP2WLkQywn2mh1+CVT4CElardoKjJxhSx2
X-Google-Smtp-Source: ABdhPJx5z0HSq/rTU0ymcHPMAwsPjFeZl5k/iCofr/8YMBXU/+pJvszZanWaFUVqlUsfloBubz8mBw==
X-Received: by 2002:a17:90a:1bc7:: with SMTP id
 r7mr16263171pjr.33.1610336250977; 
 Sun, 10 Jan 2021 19:37:30 -0800 (PST)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id nm6sm15882605pjb.25.2021.01.10.19.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 19:37:30 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] util/oslib-win32: Fixes Use _aligned_malloc for
 qemu_try_memalign
Date: Sun, 10 Jan 2021 19:37:16 -0800
Message-Id: <20210111033716.1319-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x62c.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit dfbd0b873a85021c083d9b4b84630c3732645963, the use of
_aligned_malloc are called with wrong parameter order, fixed it.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 util/oslib-win32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 83b8e89330..33af8e2506 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -59,7 +59,7 @@ void *qemu_try_memalign(size_t alignment, size_t size)
 
     g_assert(size != 0);
     g_assert(is_power_of_2(alignment));
-    ptr = _aligned_malloc(alignment, size);
+    ptr = _aligned_malloc(size, alignment);
     trace_qemu_memalign(alignment, size, ptr);
     return ptr;
 }
-- 
2.29.2.windows.3


