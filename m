Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001FB33E126
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:09:05 +0100 (CET)
Received: from localhost ([::1]:42346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHs9-0006fh-0L
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMHqn-0005e9-HJ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:07:41 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:42634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMHql-0002aq-T2
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:07:41 -0400
Received: by mail-qt1-x835.google.com with SMTP id l13so18083qtu.9
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 15:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7jz3fcXEB4BDzmBRZPOge0wYOIF8sZ5RLLGp4QiFaR4=;
 b=tRmeLBiVEv3NJjOFCG3IMGrvEyv/a9oib4yh+zcsn3i4t1+jeuu8ve0W2+18D1hNeP
 7uSVcQ3DyxE2FfbU8Pp4I4F9rRGpzIM3wcNuoRv75Wru4Y/DhYXXsknVmpEG8iHEFcwb
 NlMdG57guGCG9w9R+s0mtPUHbVcVpGQ7MyHHghiEYw9skWlmwpUkNwP6U+Dky6TincyU
 S75jR+miCjdeYdcI9nF4XDzhRDaeUhZI05kMB/wHjEZDDDkx4DN4lLdyIVeDT+vCHKfI
 CxNrRP0w7DkCuCbhYUfTC622M/6n+EI8nbX3gsCVDjjcIz+GHAesAhLuJmCKnDhdQh68
 c/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7jz3fcXEB4BDzmBRZPOge0wYOIF8sZ5RLLGp4QiFaR4=;
 b=leUMckdgUYDmgY2OeYJXzUEE6vj3Trxex7/CsXQ2RQOzM1T/D8xQSPggGTK3TvJvd4
 eEY6/CrCekNDosBLfzMPbE528TJNdoEzDGUdjlyWtG1/SOqqWu9IyHYzGfZRdHPbsW8k
 +WV7NL9yHDQq4MmjwFqhubdNgam24Unx1D4I6qqs9BToCFZorSo5gBQttBmQB0OYbYuY
 deTJfCpSQ4wM9e3mU/ETRJRJJAL5gRBj1UxMc7fPLQ1kjR6criB7fgVRNThNLlgNOdqo
 Hu2KxpB/+33Pid+7J/2EDLne4e4csaWQynjG8/G7f7tjkE/jCZzpyOvVumXDRyEN39e3
 EK+g==
X-Gm-Message-State: AOAM533VCf85RaprdZkaH3KNZU9sTNz6n5jRmPfWDBQkUjd/cX1ajIzi
 PJh+8Cw+W/EMtP5douPsFGOeGUNZdEW3bXEC
X-Google-Smtp-Source: ABdhPJwS8vfOdVlRvv76ABxxBpPM9un6k0LRr2DY/dNhigA9+pdGz1SKqVrDVJcIigRvdznXM/gvsw==
X-Received: by 2002:ac8:519a:: with SMTP id c26mr984625qtn.342.1615932458940; 
 Tue, 16 Mar 2021 15:07:38 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id n77sm16546918qkn.128.2021.03.16.15.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 15:07:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] tcg: Decode the operand to INDEX_op_mb in dumps
Date: Tue, 16 Mar 2021 16:07:31 -0600
Message-Id: <20210316220735.2048137-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316220735.2048137-1-richard.henderson@linaro.org>
References: <20210316220735.2048137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 2991112829..23a94d771c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2415,6 +2415,85 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
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
+                    col += qemu_log("%s%s:%s", (k ? "," : ""), b_op, m_op);
+                    i++, k++;
+                }
+                break;
             default:
                 break;
             }
-- 
2.25.1


