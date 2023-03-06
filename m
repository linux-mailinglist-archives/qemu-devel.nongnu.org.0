Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F25C6AB3CA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:42:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyuX-0004eP-6h; Sun, 05 Mar 2023 19:41:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytd-0004PW-IA
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:09 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytb-0006a4-FV
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:09 -0500
Received: by mail-pl1-x629.google.com with SMTP id a9so8472282plh.11
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BsXc6Cmx7iuP3bN7OQpA2UDgKrcwbdd6ecVFTRW8v7k=;
 b=omO201Ag4i/K0jubwF1Jjx9BS+xCCS73t9tcsY5mGbPJ1Vo0PN4hZqQUKQ8ioSWDTR
 6o5J3baN91G9TE7EHRWXJC+8oQuGnN9ZjNgynYUJTbDo/E/UM07u+0J6TYA2HMHzQYFy
 hKWA7hvyTjJ5TUXIotLu93D7imKgwj5vfcolw7bkfyUIF5UCjVv+31Qwf6+18dvn1lHl
 nnGy8m0c7UytAVng0t+f+/NIJT2Mj0Hln2KE3BN0FNq7E94OTB3Lz1gLitqllPFu8yds
 0mp8TB5mXQvB22Z7OcSWHwle6x4dR21t1XoUoZBKPSsAow92roP6x0VjLLpHfjTDaoKf
 j7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BsXc6Cmx7iuP3bN7OQpA2UDgKrcwbdd6ecVFTRW8v7k=;
 b=WUCtKw5D0K9YkNWzDgm0PfZ8440M7K5wE7fTJsIBNT/L5bC23WXCrWQn+mcyvkA+yN
 hwDkbR30Ux0a416uzCb61k4p7VdoxTpfoN+/EJr5JZBUPyV4K3+aUSsA5P4/uUo5YYTk
 JIpyu936SgvYGzkhwQpqarVJA2FFpxfkgp5pzVsKVO7BZw9PNSpo35pKfKlr5RTtKEz1
 GfwQCi7R6F5n5o7AMKPZbQRuu4ijAL70uPK4ZLFu6GOWjUZyB1JBfiwLW2WXpvqUpTvX
 rkP9wZZbJossbeabJu9CmjafPTi+s0u3IpnCJvpann5CFMxACywajsGPl34a+Bs/AVWw
 bdEg==
X-Gm-Message-State: AO0yUKWNBZBlAoyDDrsKUec2GwnpFsQGu4yrRotyrwxtUhuQTO5nmISC
 lYaHBN4jX7AiBHXfV6n0oQ4VPea6MScC87x3QYF7HA==
X-Google-Smtp-Source: AK7set9G+g37JXcZrzst5PID5mty+xQv6FWtsfkQv283JJx5SCf4l68ZT2pJV64c6sfKOgGT70EATw==
X-Received: by 2002:a17:90a:190d:b0:230:7a31:b9a6 with SMTP id
 13-20020a17090a190d00b002307a31b9a6mr9852718pjg.7.1678063205539; 
 Sun, 05 Mar 2023 16:40:05 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 11/84] tcg: Decode the operand to INDEX_op_mb in dumps
Date: Sun,  5 Mar 2023 16:38:41 -0800
Message-Id: <20230306003954.1866998-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index cd8f356adb..f9e1afd926 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2192,6 +2192,85 @@ static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
                                   arg_label(op->args[k])->id);
                 i++, k++;
                 break;
+            case INDEX_op_mb:
+                {
+                    TCGBar membar = op->args[k];
+                    const char *b_op, *m_op;
+
+                    switch (membar & TCG_BAR_SC) {
+                    case 0:
+                        b_op = "none";
+                        break;
+                    case TCG_BAR_LDAQ:
+                        b_op = "acq";
+                        break;
+                    case TCG_BAR_STRL:
+                        b_op = "rel";
+                        break;
+                    case TCG_BAR_SC:
+                        b_op = "seq";
+                        break;
+                    default:
+                        g_assert_not_reached();
+                    }
+
+                    switch (membar & TCG_MO_ALL) {
+                    case 0:
+                        m_op = "none";
+                        break;
+                    case TCG_MO_LD_LD:
+                        m_op = "rr";
+                        break;
+                    case TCG_MO_LD_ST:
+                        m_op = "rw";
+                        break;
+                    case TCG_MO_ST_LD:
+                        m_op = "wr";
+                        break;
+                    case TCG_MO_ST_ST:
+                        m_op = "ww";
+                        break;
+                    case TCG_MO_LD_LD | TCG_MO_LD_ST:
+                        m_op = "rr+rw";
+                        break;
+                    case TCG_MO_LD_LD | TCG_MO_ST_LD:
+                        m_op = "rr+wr";
+                        break;
+                    case TCG_MO_LD_LD | TCG_MO_ST_ST:
+                        m_op = "rr+ww";
+                        break;
+                    case TCG_MO_LD_ST | TCG_MO_ST_LD:
+                        m_op = "rw+wr";
+                        break;
+                    case TCG_MO_LD_ST | TCG_MO_ST_ST:
+                        m_op = "rw+ww";
+                        break;
+                    case TCG_MO_ST_LD | TCG_MO_ST_ST:
+                        m_op = "wr+ww";
+                        break;
+                    case TCG_MO_LD_LD | TCG_MO_LD_ST | TCG_MO_ST_LD:
+                        m_op = "rr+rw+wr";
+                        break;
+                    case TCG_MO_LD_LD | TCG_MO_LD_ST | TCG_MO_ST_ST:
+                        m_op = "rr+rw+ww";
+                        break;
+                    case TCG_MO_LD_LD | TCG_MO_ST_LD | TCG_MO_ST_ST:
+                        m_op = "rr+wr+ww";
+                        break;
+                    case TCG_MO_LD_ST | TCG_MO_ST_LD | TCG_MO_ST_ST:
+                        m_op = "rw+wr+ww";
+                        break;
+                    case TCG_MO_ALL:
+                        m_op = "all";
+                        break;
+                    default:
+                        g_assert_not_reached();
+                    }
+
+                    col += ne_fprintf(f, "%s%s:%s", (k ? "," : ""), b_op, m_op);
+                    i++, k++;
+                }
+                break;
             default:
                 break;
             }
-- 
2.34.1


