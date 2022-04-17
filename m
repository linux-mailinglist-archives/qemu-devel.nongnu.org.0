Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D6C50491D
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:58:51 +0200 (CEST)
Received: from localhost ([::1]:38154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngA6l-00055v-0B
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fN-0000Qc-SV
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:37 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:45887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fL-0001kZ-FA
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:33 -0400
Received: by mail-pg1-x52f.google.com with SMTP id k29so15048675pgm.12
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KQ2Hs1fcPO+xNkXsj5Tr5G1f8x8slUJxiO5yDeUu3l4=;
 b=uj/+QHKh3aehRujbIQBGs/T46dzPhFubzTGAd6OekOk707Bu2p77gGl+oyxVrjr+Mr
 APC5NrpIf2bUrzG4VjPjl1sEZZ2p11UNUWYM1E6EBmeqMg7I+aKk9NU6L5Dd5mORBmxJ
 kppIXgf9lkkYUQ+UibOsBfvC/PbMSLFhy6bG07X0+ouXyYjR5TrSauY5gHC/+L6sHOzE
 /gbcpP3+xzXnahGYGZQQwp6gI6wuvLd9U1gdXr7Mq4yBK6s4sYdXBFWB44Eb/k/W6m8g
 WHD7HSdOWrIAJ9nRHgCX3Nggo/BMbZIpPUc42hKIooOmCn/7thohz8YwnTTlvVCuFi7V
 1ubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KQ2Hs1fcPO+xNkXsj5Tr5G1f8x8slUJxiO5yDeUu3l4=;
 b=Y4nRGSC0JOEB3CbigiPVhk6eBcQqi4A8n4rgAMw9RGW0f9baXOtJ3YBqK/wUNi5l3w
 LOB81NROXRJRt45SwlH5BGhEZNsEvnJOr10JML3OlH0gIWI0QJOwMA0GVX7TzmSdDvuV
 Ctc29te8L2P7IMd90cD0yHz6LiPrfz2wVcostmE9eo7HDGyW9LUmBUB2nRt/q4dfq9Lw
 K1+phOrn81EKm9DBJS1BiY+OJvCmz1BtgnaZIkqeJkjC4OV+/4tXx0jXT7De+1TmrKec
 ZAFVwGGJEqlaF5U3fejxW6Gne4DnF9t5GTC7CXdDmLOvuEMpxP+RsEe2unRcqJsANVCH
 0f2g==
X-Gm-Message-State: AOAM533Z3y3wXXtHAzqlBPMQ3pj7BbK9xUP4jA9SsKPf0BqkerPxxNtM
 /WlMwLqbab/d59bkcAYYL5hdmFQg2hCS4w==
X-Google-Smtp-Source: ABdhPJzbE1oHuJ3FovQLxuSh2Kv4dJKVis+7YR+v5oO+EUvnVqH65cUOCmMN5CrDwTPKex10YfdtmQ==
X-Received: by 2002:a63:fd43:0:b0:39c:d17a:62af with SMTP id
 m3-20020a63fd43000000b0039cd17a62afmr7155356pgj.450.1650220228897; 
 Sun, 17 Apr 2022 11:30:28 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/39] util/log: Remove qemu_log_vprintf
Date: Sun, 17 Apr 2022 11:29:50 -0700
Message-Id: <20220417183019.755276-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is no longer used.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/log.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index d090faf22a..2d9455dc85 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -72,21 +72,6 @@ void qemu_log_unlock(FILE *fd);
 
 /* Logging functions: */
 
-/* vfprintf-like logging function
- */
-static inline void G_GNUC_PRINTF(1, 0)
-qemu_log_vprintf(const char *fmt, va_list va)
-{
-    QemuLogFile *logfile;
-
-    rcu_read_lock();
-    logfile = qatomic_rcu_read(&qemu_logfile);
-    if (logfile) {
-        vfprintf(logfile->fd, fmt, va);
-    }
-    rcu_read_unlock();
-}
-
 /* log only if a bit is set on the current loglevel mask:
  * @mask: bit to check in the mask
  * @fmt: printf-style format string
-- 
2.25.1


