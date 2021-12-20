Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB8947B4BA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:08:07 +0100 (CET)
Received: from localhost ([::1]:56782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPt8-000355-2h
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:08:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqi-000085-2r
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:36 -0500
Received: from [2607:f8b0:4864:20::530] (port=38859
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqf-0005ss-Gf
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:34 -0500
Received: by mail-pg1-x530.google.com with SMTP id y9so10429642pgj.5
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BCE1WlXmmaCtgHYc/C0kxl+XaSWrlWSBPlh1JjzXRMo=;
 b=Dm1X5WKMOXNquFVBuVxVXF6DOg8qZnudQh71/Vigv5FSTGalEqVjY80RjQSUL5F9FY
 GEU1xuNEedw7T4emEFdhv8M0SgbiUg6q4yMBnC+4AEpkbaiw4d3n3ahF/pNtnSj3UgcM
 oCi2H4wrbhNSwruUKZWDyFhXqB+1phn9OhG4tOBY9VMef0tDT8BSrS8Qqie31WgIrDOZ
 /ZjkKTy+qR6JuTUrE0dmQ/o5mjHxWDQfuhJN60lhA1w0mue2LxQ6FPlKN1lpXj+SzvGW
 wO+JOEBjAa56a2/870OaqfCR9UdHIrifbIzeLfTTN7bsSCPqUW1VFR/1KDRpOodlRsVn
 /L8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BCE1WlXmmaCtgHYc/C0kxl+XaSWrlWSBPlh1JjzXRMo=;
 b=C+WZm3mxbz7yPzdcivGaqMHbhRlosQj33Xndv2R/HTCsD6xZSsetZ8ZK9u/lexvlT3
 BO142CSENjqdXL668Bjjug6MdlOVkJhHQMzYSr5aHNrqirOqeLkjKo+GrQWM2bZCF1A9
 FgVvzxytr+2Fgx26Dg0CQln4bBEKsJOsS+LjOInZx38fAstuX3mpbFpd5KwuaZvgSwgL
 11uJ3LATJq2+xTLcKZa2x7C34/26f1u2WeZuncl/Ozx9iFfSSTD1AaXyOJCdjK4ZDeMi
 3NMkHZqD/U+WXQb/cRBeCLIzuW3wEtPBnxdvBudD8kElX2vjS7F7iMCsqZ0hjz9aZpN5
 qlsQ==
X-Gm-Message-State: AOAM530yRb1b74KQl6Nj8/NipUlOYYSgek/m1V7ODHmDWf/xoWx946g9
 FNzYwkvvloQQzasJ0yoCYS2ieU+yh5UuSQ==
X-Google-Smtp-Source: ABdhPJws2DRkcCRVvyZLr05orop/ARjNDe4+gVSrwhp3/Rowc9JATSEIWsrg3m+BIYskaOz9wPoLng==
X-Received: by 2002:a05:6a00:168b:b0:4a8:d88:9cd with SMTP id
 k11-20020a056a00168b00b004a80d8809cdmr17943787pfc.11.1640034332092; 
 Mon, 20 Dec 2021 13:05:32 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/24] linux-user/alpha: Set FPE_FLTUNK for gentrap ROPRAND
Date: Mon, 20 Dec 2021 13:05:06 -0800
Message-Id: <20211220210529.150423-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This si_code was changed in 4cc13e4f6d441, for linux 4.17.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/cpu_loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index b039369198..92de2a4424 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -151,7 +151,7 @@ void cpu_loop(CPUAlphaState *env)
                     info.si_code = TARGET_FPE_FLTRES;
                     break;
                 case TARGET_GEN_ROPRAND:
-                    info.si_code = 0;
+                    info.si_code = TARGET_FPE_FLTUNK;
                     break;
                 default:
                     info.si_signo = TARGET_SIGTRAP;
-- 
2.25.1


