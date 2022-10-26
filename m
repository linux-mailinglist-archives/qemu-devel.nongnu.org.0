Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B21D60D920
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:16:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVu2-0004y3-Q1; Tue, 25 Oct 2022 22:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVu0-0004xt-Fi
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:20 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVty-0001Do-VD
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:20 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 z5-20020a17090a8b8500b00210a3a2364fso2719534pjn.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aSrzPFoUs5rHEO8b0TFpGYbIjtXPckikapFmH/dF2+g=;
 b=ypDTOC6fIscUE71M609XYpQx7RH5vKC9y8kQT9JUwgwwpcrqdj9mkooocHPMoahLv+
 kSy2KLkvM2tgRWe4R3mkDUgY9qzL20i3cT7m1kKVpDy+J8hq0UpFZMK8XeaVCVQnitkM
 gaT8q1o4cGwAszXHvq6342U9wrlVaMBc5KvnLWz/V+izRrm3WVMyeKI80A7oHvRG2jzg
 rqfKZ++9ryhaZWBESfJ8ugnjN7BillOuiQ+Zyf1JEKACgRXRBGV3BE++n+nXFR8bXnh/
 r8PzV3rzexh0bmtGn12HubMa/USvvuHJ6UqZhmW9xDTOgODLJEZpSYYT+oaPq2DhuZm8
 9+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aSrzPFoUs5rHEO8b0TFpGYbIjtXPckikapFmH/dF2+g=;
 b=yKBdeky0loln6PKRBqzYFsza1p34WC4ZljYmenQWI6J2wlN+aE8+RIy83mMSH8Fl7y
 XnyZQZplt99Pmk1pVEO1tbYRrjK5kPb2i52TeOtpbrmG8wxz1wy7gO6+KR5qcb1HrIwM
 DzpErHcDuT5SUwruKSyc/SY2KB9lZCSO0pi1iG/CGlyvtFi1+16NoW1H9yz4CeuTU5TY
 2r6uLm13PR+/lF2JgCYibMqdMUdilLnXmZDKXDGlIA4tVdY1gqOaVCpPWUgSe6KX0kj/
 rE3OpHLg8Yu+y4QO3f9E7DCK0jfEL1xVNk/3MVi2mnaIH9MDu7/dKVrQXkuTduS2HBDy
 6H4w==
X-Gm-Message-State: ACrzQf3kO8xh0GYjnm7MFr6CpahUiI+MiFQFUcoObkVneoZolmsv5vFr
 VTYsbkjKLf8zBfkyeFAVtGn2kylABeuf4ZI4
X-Google-Smtp-Source: AMsMyM68yRky23+zfv5rZaFU5cx5Cn0a4A1hMJPpk902v1ZOCCzx7zArFOBPt9FS6yk2M0GYDRhRNA==
X-Received: by 2002:a17:90b:4c86:b0:20d:402d:6155 with SMTP id
 my6-20020a17090b4c8600b0020d402d6155mr1425007pjb.229.1666750337547; 
 Tue, 25 Oct 2022 19:12:17 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 19/47] accel/tcg: Use tb_invalidate_phys_page in page_set_flags
Date: Wed, 26 Oct 2022 12:10:48 +1000
Message-Id: <20221026021116.1988449-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We do not require detection of overlapping TBs here,
so use the more appropriate function.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index aa8d213514..8d5233fa9e 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1382,7 +1382,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
         if (!(p->flags & PAGE_WRITE) &&
             (flags & PAGE_WRITE) &&
             p->first_tb) {
-            tb_invalidate_phys_page_unwind(addr, 0);
+            tb_invalidate_phys_page(addr);
         }
         if (reset_target_data) {
             g_free(p->target_data);
-- 
2.34.1


