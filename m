Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D78459EE50
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 23:40:12 +0200 (CEST)
Received: from localhost ([::1]:58968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQbd5-0004uF-Jo
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 17:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbbC-0000jT-9z
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:38:14 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:41944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbbA-000617-Bj
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:38:14 -0400
Received: by mail-pl1-x62c.google.com with SMTP id p18so13962976plr.8
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 14:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=+L96YrL5vlt2Q3Y2tUcm/tGygoK05LHKMQNt/eOvkUg=;
 b=OUlqXMveUb6x9TzHuLBtapl+VJf+4CqHvWR6Mq/7az8xShV6xu6+9pWzkFFiAZqmH+
 z+T56DBgxExn+xmNEIjiJBlM3QJNZ29aOkzzShikg774+WM+lxoxDvdln61KxDtVv+F4
 H338OnTgfDye5n87sxoiYf/r6xIwBI8yzRqcFgPwpyY2EExb0fgTw68sDtXwtbsLk9LA
 ix/OTM6vsk2AydILxob8MzardArq66Cj7raHL6YXi0dvnBJNrN9+u7V/z2+C4bNKONX9
 7knJKRT/qBBSjvREmtkdLqOs65e4sJNEW/bPNYIvmpwZgac+xqcwPkZuLKMfuqu+ZkLC
 enKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=+L96YrL5vlt2Q3Y2tUcm/tGygoK05LHKMQNt/eOvkUg=;
 b=AZfWQ9Y14xhthjO1U3XsK9NDLXHdT9yYVu4/cvSQHpN0y19omXT3SUN8d3ZPyBcHfp
 NOhnXvpHyksb85J0/onVcYc21two9qYjYJZdZ1NwfrmzSYv0T+B0TKx/LfOrQ/9LV4OI
 FfaxL3O8Bv7MJYIe6N+TOqHro3UMofCJMDfaiayzbQMOwYcBo0QeEEr4PvxgZ2uQkotK
 xyfp+8MbJtcDebUyHbxL/s4uZpNhStD5I4AuXmMMhV2GBRjFHpw9ZZAyIzLC1Np1PYo2
 VYn0mZ1qPytDKCJxFKJ2oTpA7uBGhGjDbUWkQbccuRhNNssS2yijoNnED5gd2et8YY+7
 PAcw==
X-Gm-Message-State: ACgBeo1oh34q5K07s8RlLw2YHAhCmlcvoXQzXyr5up1vJq4c4J2TIcyg
 mzNI/J7fyN3iLx9flPxFcBm+M/YHBY9C+A==
X-Google-Smtp-Source: AA6agR40DQeAVHgQJgtJH5X2QHeF35noDc+KKGLTxdejLRWn3ETHafAffqm05C3kV8cIJYLzZsIXkw==
X-Received: by 2002:a17:902:f60f:b0:172:86f6:241b with SMTP id
 n15-20020a170902f60f00b0017286f6241bmr26015662plg.162.1661290690956; 
 Tue, 23 Aug 2022 14:38:10 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a635253000000b0040d75537824sm5366403pgl.86.2022.08.23.14.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 14:38:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: david@redhat.com,
	qemu-s390x@nongnu.org
Subject: [PATCH 2/2] target/s390x: Align __excp_addr in s390_probe_access
Date: Tue, 23 Aug 2022 14:38:05 -0700
Message-Id: <20220823213805.1970804-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823213805.1970804-1-richard.henderson@linaro.org>
References: <20220823213805.1970804-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Per the comment in s390_cpu_record_sigsegv, the saved address
is always page aligned.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 4c0f8baa39..19ea7d2f8d 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -147,7 +147,7 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
 #if defined(CONFIG_USER_ONLY)
     flags = page_get_flags(addr);
     if (!(flags & (access_type == MMU_DATA_LOAD ?  PAGE_READ : PAGE_WRITE_ORG))) {
-        env->__excp_addr = addr;
+        env->__excp_addr = addr & TARGET_PAGE_MASK;
         flags = (flags & PAGE_VALID) ? PGM_PROTECTION : PGM_ADDRESSING;
         if (nonfault) {
             return flags;
-- 
2.34.1


