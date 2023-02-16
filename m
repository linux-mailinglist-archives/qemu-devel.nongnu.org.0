Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E4B699AF4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:14:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnT-0000Po-Dw; Thu, 16 Feb 2023 12:11:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnP-000098-Tq
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:48 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnO-0007yG-7r
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:47 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso2222032wms.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=X3rMKJZAHSn2N53RNjbN11WgeDbh222tQ0PpdvQC108=;
 b=RPl6tlOExMAOxcuVnbKf2igH3qJ9l1ZRYvhZuJxh9Eeyn/FmF3dYGv7tCANbJa0/bj
 gjw6HRAeucUwfzOxG2Hqm0996ok7c0hbMd5wnNXx1Inv9lLLbmBr/z4u2bu8AeyANWSI
 S2QWWz0bxdnU5RZrI7xEG93tQ4CefGd0emF/1GxRlOewmkOabR5hbrKT3HHoBuvEZfSd
 5ZevAoGCQVHCVg/84YAQnhTpRZOI3WHB6Nknn0+/rysRo7/VLwNpYX1tF7OQemFqS3gl
 fpm5eHkvx2A6+zVYLvLCXjdyw6t2EAWep1FG2CaXKZhg0ZEItoDwQv57nA5YDYE7XBP9
 vDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X3rMKJZAHSn2N53RNjbN11WgeDbh222tQ0PpdvQC108=;
 b=6j0Elt5hx/qCPcrm3lcKrMyd0HdnB5j05/jMYVnNRwizUytZVnvtAj/FNPG/ScqdZU
 GiLoNkAOOMPYyY77CDwqPqoTelBf91jfsYb1ISqDFNtXxmFldbo1KK6/BYX0qCdB0QNk
 iLcx9ufCjUTZRsHMFYhQhaFtE52EC2yVfvTlG6OM+ExhN5oAHzIa6mpJ+h4MdTjsVREt
 IcQtZf+zM8Oi7QxTfG8k2IaBUiJ3zVDXD7z4Yb62BgnLhyJpciN/B1OwAQWhwtA2wjq6
 I3IeKVhy+TQHFj6wO3gCC9IRVApBrrGOjErjZGU/UJZoh33Sft/Fqa6P+6upG9xMpCFJ
 A27w==
X-Gm-Message-State: AO0yUKVywtF6sKT5ZaoauwEDktZh5dE4LJ/G9nZVNueZUq2c2Ph8Gika
 Hw66YcDxsbCbuwtcar/C3PSnV6ErNHIAh//9
X-Google-Smtp-Source: AK7set8KCa7UIYCBaC93iKwCTt/tS3nSxgLXJyN2gyw6DN0ZxMvwaVP/4t64yig9DfnhMjtrPVLqaQ==
X-Received: by 2002:a05:600c:188a:b0:3e2:918:ecd4 with SMTP id
 x10-20020a05600c188a00b003e20918ecd4mr3354962wmp.37.1676567504983; 
 Thu, 16 Feb 2023 09:11:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/30] target/arm: wrap call to aarch64_sve_change_el in
 tcg_enabled()
Date: Thu, 16 Feb 2023 17:11:16 +0000
Message-Id: <20230216171123.2518285-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2d38c3ed7aa..07d41003654 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10827,11 +10827,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     unsigned int cur_el = arm_current_el(env);
     int rt;
 
-    /*
-     * Note that new_el can never be 0.  If cur_el is 0, then
-     * el0_a64 is is_a64(), else el0_a64 is ignored.
-     */
-    aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+    if (tcg_enabled()) {
+        /*
+         * Note that new_el can never be 0.  If cur_el is 0, then
+         * el0_a64 is is_a64(), else el0_a64 is ignored.
+         */
+        aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+    }
 
     if (cur_el < new_el) {
         /*
-- 
2.34.1


