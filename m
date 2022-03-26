Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348764E8122
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:38:57 +0100 (CET)
Received: from localhost ([::1]:35272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6d6-000225-98
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:38:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qn-0007Ub-VT
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:20 -0400
Received: from [2607:f8b0:4864:20::332] (port=46628
 helo=mail-ot1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qm-0005To-Il
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:13 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 z9-20020a05683020c900b005b22bf41872so7440111otq.13
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ehH7VDCeW4WIVxtWVdIPmUT3p2JNkhZIJXr8A+U3FbU=;
 b=XlUfWle768YnLvhEfaiOFzfGBUbIrB5d1sgNsEMx6n0gxra81GShAMGC8tNYIjRXg0
 sFVaN/hj+cmcIcrcNlefDwGcUd4nU5d0oh7Ox8RLO6i2K0cjNaMZw4B24XTcjPJ5nKL8
 +ui7qDppQdU1Glsel0GMYPMuLgZHOkd4V25qq1SVtsNA+F/jhRYshrtmunIQSt+bnbRt
 QLG7egn9x7NtonrsQDgj1VzIarBNaUfKHBeApQcARTTJaXuukvwxlisa+Sqem7sXVkfP
 eviuMYsqIGJ15oq7vAnNZU2jdLdLiHwjfINUOZHY4PEu9q8ESGqLlRTsPpyuneTsN4OI
 IisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ehH7VDCeW4WIVxtWVdIPmUT3p2JNkhZIJXr8A+U3FbU=;
 b=SK+3JoVYpZjAsqP89C+QQcGdhySxRFBZOtFv/USSDLGuf0JKAoZoAhAes3j7Q34rIY
 FKWDGXFEfnkYDmQvxtQYjM76VEXe0Tv7sRSGdJOKgJVkV0GS0sM1ZRDhD1L6Ox51BTG8
 hrdz2KtUSz1D2bKQahQEkqBYaJ+/oBSUf9CmAkbj7CkIV8wfqKbd/MTLsPi6OkGOOa2f
 UqsTfaUVqs9IRPj0/Posg3qj9mdkwXGAFhfh/27Kfe4YU+z81mWvOfQaGqlF9J1kXet+
 Yxmocbjf7VxO6sLnJAO7CL/ptP9eW3gqDvID2pMnvM61ABzLFlyOI8gEtPqootYQwQhn
 0jNw==
X-Gm-Message-State: AOAM533bzNLPh+0lEYKguuHBlyslePvA+xms2gLcJxIh4Ywqm+FmXeUo
 /Y7vOXxt9/8J7uF/AQ6QS8O/64mvR7QeATvb
X-Google-Smtp-Source: ABdhPJwpw4+ypJ1gEwOuWsRZVLCfiZ+tdw/Yo7Wi5RFvkFTsSb3L2AClQELqIvUP+OtYrvTpjTRw2A==
X-Received: by 2002:a9d:7751:0:b0:5b2:49ae:76c6 with SMTP id
 t17-20020a9d7751000000b005b249ae76c6mr6272485otl.18.1648301171448; 
 Sat, 26 Mar 2022 06:26:11 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/39] exec/log: Remove log_disas and log_target_disas
Date: Sat, 26 Mar 2022 07:25:08 -0600
Message-Id: <20220326132534.543738-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::332
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

These functions are no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/log.h | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/include/exec/log.h b/include/exec/log.h
index 648f4d2263..06ab9841ee 100644
--- a/include/exec/log.h
+++ b/include/exec/log.h
@@ -43,30 +43,6 @@ static inline void log_cpu_state_mask(int mask, CPUState *cpu, int flags)
 }
 
 #ifdef NEED_CPU_H
-/* disas() and target_disas() to qemu_logfile: */
-static inline void log_target_disas(CPUState *cpu, target_ulong start,
-                                    target_ulong len)
-{
-    QemuLogFile *logfile;
-    rcu_read_lock();
-    logfile = qatomic_rcu_read(&qemu_logfile);
-    if (logfile) {
-        target_disas(logfile->fd, cpu, start, len);
-    }
-    rcu_read_unlock();
-}
-
-static inline void log_disas(const void *code, unsigned long size)
-{
-    QemuLogFile *logfile;
-    rcu_read_lock();
-    logfile = qatomic_rcu_read(&qemu_logfile);
-    if (logfile) {
-        disas(logfile->fd, code, size);
-    }
-    rcu_read_unlock();
-}
-
 #if defined(CONFIG_USER_ONLY)
 /* page_dump() output to the log file: */
 static inline void log_page_dump(const char *operation)
-- 
2.25.1


