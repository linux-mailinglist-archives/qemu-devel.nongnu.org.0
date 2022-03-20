Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3794E1D1A
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:23:20 +0100 (CET)
Received: from localhost ([::1]:46650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzGx-0005zZ-Kx
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:23:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5r-0008PM-Di
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:51 -0400
Received: from [2607:f8b0:4864:20::42b] (port=35392
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5n-0003R7-9q
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:48 -0400
Received: by mail-pf1-x42b.google.com with SMTP id a5so13704330pfv.2
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SnloB92roRJjW2I8fqc6iuhCF5tiad3l4/Mv7JIcEjs=;
 b=aD6sl379pgxtG2JFd3jm4jd6gnwfnJsMebiguKUJ9iQKdXcEXQFi4wWbfq4IooTCbj
 l5PNrvZeVMuBj1jMErRWUAF8C3t9fIfvT8hno0A40rTWlS3aSgju6j9FN4Ht0hN86SzR
 wMWmPsuLY6v0HebKnjMmW5fosM/gF1T1uRo2mVjM/8MM6TUCM/4jyV+4HGsNpgnvBW+o
 svJ3/pkZEXXA56BjQRE4+MG78HWLxfoF6v5Xa7JBH8JEdxo0Zvl2/TQKA6Dh1XampEFa
 J7r4Vo8gClT68ufBLvGLl/G4/OXVzH2BPIRP1hr6tb62fJFOR3OSFWSdwI56D6yUOB8R
 rvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SnloB92roRJjW2I8fqc6iuhCF5tiad3l4/Mv7JIcEjs=;
 b=SrFBalrRD9OrU/tGCYLmXD5srDdt4SbUWHfH+rvvshr6PkvQePZTKHV9WXs0/2+dAT
 ea4MM995+j9+WRDl0BKokrUhTQ+YV8SyE2HzFf+1pIq7sWP1NOHW0GEcLZRBVRiygLLj
 gIGP5YuEbxxYyz+sThcnuiEdzDgBv/UMQfFADaWMvDgds70TpCO8g42kXHu5/XSwrUui
 Md2IdBU2bykP6fiaCU7x6D+SiWpv2gSkCZzQ9uV6P8jTRKu2DLvzbxXNPjIXK/w+4AID
 luDX03/2119BRULMsOVSnQ8sWFPGiWip+5o4yB5l3PcZK9E52N9MV+o7/Ss7Z+ViQFu/
 flTA==
X-Gm-Message-State: AOAM533/Wy3Xf6C+PzrfzB9Jwuuh4ZB+lPalQb1hgfVymc05d3CdwgIQ
 7JCZT//II8SEJZamfsmbs/Yd+YDKV/KhGw==
X-Google-Smtp-Source: ABdhPJwvBAUCrxqYe6gzrwwA8xacmBb4vMfOHn3JrbiufgO13qoTQbP+6AgQHNwVffMo4Vg4LVgi6A==
X-Received: by 2002:a63:4e5d:0:b0:381:f11:59f6 with SMTP id
 o29-20020a634e5d000000b003810f1159f6mr15333118pgl.565.1647796305154; 
 Sun, 20 Mar 2022 10:11:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 09/36] util/log: Remove qemu_log_vprintf
Date: Sun, 20 Mar 2022 10:11:08 -0700
Message-Id: <20220320171135.2704502-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

This function is no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/log.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 10e284291c..6e45b31253 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -72,21 +72,6 @@ void qemu_log_unlock(FILE *fd);
 
 /* Logging functions: */
 
-/* vfprintf-like logging function
- */
-static inline void GCC_FMT_ATTR(1, 0)
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


