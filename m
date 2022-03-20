Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D946D4E1D1C
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:23:21 +0100 (CET)
Received: from localhost ([::1]:46776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzGy-000645-U3
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:23:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5l-0008KR-TL
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:45 -0400
Received: from [2607:f8b0:4864:20::52b] (port=33514
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5j-0003Qe-O4
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:44 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 6so8741555pgg.0
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AiGXKmM5Cv0Fdfz4VnJTiU6gz9cUezs0SPdSZR5WJXA=;
 b=F160S3K/J48W+34HwvHGEi2w7IO1lXA6+C3AXYSIsvRVDt4Dx1nheHumuqD6Xh46fw
 pYnCdMRDC62bytTuEtjsMV5GIBiuqVVvNXtGb/6kL2BJwCGbfQW3BsbgzARHIvvOe0JN
 dQ6FE+6FelVt2t6SqrwAF89fYD9sfEJn9nLrurOrCzEsgtZMh6nfhRvScvwiKI9lWexz
 PrIVlu3XwtKdQxCj2qviGUDXKM1UQjNl+rnCwlDpqFaN3Nqr/KgiDQUIP3+1NwZmE6Bc
 dcUDSMGwhlGx2VLQRXGs7c06P+TcaOqK8/kBjtyY1aBgY4aevPWIXfmIVHqoXxf/POD5
 yd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AiGXKmM5Cv0Fdfz4VnJTiU6gz9cUezs0SPdSZR5WJXA=;
 b=SXZgwq0XDnfZa1USwuHl1pY6uRJ7dj+H0SH7qbsJB94sLXVb1vxYQ8Anprq9p9kXrm
 WgrwE0jB99Murdg6RKm/gr+sfNdESMk0KIe/C39zE5XOpOmA/EegkJ42ThGEl6ut9+Ip
 v9iccHyDMqoeKG/T2+vRf4orjgzzNuUhXshWgniI5wWHPNgKJ443kv7aeyWnqIEGG1Bm
 piDKjmcKsP8dA8mfwk5HJODSRISTN6vc8LZO/+zTWXcQDkXzZvRIJ+MALbthth9nmKMx
 CMY+2ZZwO03ROgf0v6R21xiOTAARFMtGOhikU2cRR9cxsb6d5y5bxd6nrOZGqm4Tz8Vp
 wTIA==
X-Gm-Message-State: AOAM530iG4buz8S6qU2ECZML32lIOxZnGl/n9MNL0O0nG/LG90Vhpljy
 RmXgB+BklmxIIpii6PwEPQCnsSHcNqMHSA==
X-Google-Smtp-Source: ABdhPJxMNrKHXmPFGKVT/MAvtb8fXSg/ab7TvxxVnJTKEhghqMl/B8sKE1nG5smllntRpigG9ZJTcg==
X-Received: by 2002:a05:6a00:814:b0:4f7:4c6:1227 with SMTP id
 m20-20020a056a00081400b004f704c61227mr20241967pfk.54.1647796302389; 
 Sun, 20 Mar 2022 10:11:42 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 06/36] util/log: Treat qemu_log_lock like trylock
Date: Sun, 20 Mar 2022 10:11:05 -0700
Message-Id: <20220320171135.2704502-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Do not require qemu_log_unlock to be called when
qemu_log_lock returns NULL.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/util/log.c b/util/log.c
index 248db6211e..b1651d8122 100644
--- a/util/log.c
+++ b/util/log.c
@@ -39,12 +39,14 @@ static GArray *debug_regions;
 FILE *qemu_log_lock(void)
 {
     QemuLogFile *logfile;
+
     rcu_read_lock();
     logfile = qatomic_rcu_read(&qemu_logfile);
     if (logfile) {
         qemu_flockfile(logfile->fd);
         return logfile->fd;
     } else {
+        rcu_read_unlock();
         return NULL;
     }
 }
@@ -53,8 +55,8 @@ void qemu_log_unlock(FILE *fd)
 {
     if (fd) {
         qemu_funlockfile(fd);
+        rcu_read_unlock();
     }
-    rcu_read_unlock();
 }
 
 /* Return the number of characters emitted.  */
-- 
2.25.1


