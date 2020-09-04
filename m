Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4D925E1E5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 21:19:28 +0200 (CEST)
Received: from localhost ([::1]:48182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEHF9-0001eN-F5
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 15:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kEH5F-0002D6-Tf
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 15:09:13 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:38072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kEH5E-0000sF-As
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 15:09:13 -0400
Received: by mail-pf1-x443.google.com with SMTP id d22so5118930pfn.5
 for <qemu-devel@nongnu.org>; Fri, 04 Sep 2020 12:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MI85xgpGyBSBN9cbj9PllJj9cCeDay9VieIb0EKJa4A=;
 b=KLdQWUW1UV+GGbMLKgvyDi+K0dkS3KswCfGsc7nljvyB3Qhk/BC9hqLatG6iYSYc2X
 //fvodfGkI6rEDDpXf101xSNDpQBrYP9E0U4Ry4sMw7fMMMzGBa7mNI5+D9SU9M4XZCL
 I8bs53nY/tsg8of2F1qjLewXAIoIqnqOh2IvmSa2y8eTwXKjD6mhN28E6uz/H5XTjWRZ
 SvJLH4s1QudP49H7ATZPp/3lfbIYSNWh5MQbtzy+4zCul+OFaG2rTiMokw5AdUqhxu3Q
 Y1uQ1a7zZjekkNaRIZUypdmEFSy6SDbb5yKq115VHt8t0+hgmkMaJU+zaLwf/4gyVI/r
 t1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MI85xgpGyBSBN9cbj9PllJj9cCeDay9VieIb0EKJa4A=;
 b=V+oQTCpl8TTR2JOksWtvaZ/1+f5Yqi5rWgj8nj+QOwvVsOeGtSh9AycWMZrw2JlG9d
 MZaOQ65NdIjsF1HZ+YjKtcd1gVOCZBV/1jLeGzcPVDtLPfvwooYjNvYfzLjxhnUWRQYj
 LMmts1mMm8WRl+jDVs/vaJ5fF643vETaEUeFx5MQwX12+cMg8RA9zHUC4FO2x34a+Ofy
 lfRaYombGXkpgVmAimbJ93V4ElcPfBvyKkr071EFw9AmKGBB52Qe/Cnou3Ne8+cvhhVD
 LnNODAnNfs1eAvBRXUYbLkFbc4qey9tVEHeaI3EIoz9tIdZJLOarj6kS3gh68nBPg6Ea
 0INg==
X-Gm-Message-State: AOAM530ZL7z0dwroo+MzhIT/y2CDJYdrbODsuvfRFAJlVo8Eexd09SjP
 7GfvaWV7hy2V4yvEHm2IlgqInwY5ravmzA==
X-Google-Smtp-Source: ABdhPJz2D2R12i2qksXSprBlINT5XObh8bVnwKcySbr42tkT0kEgpUQ6baTmeaJtPJeeX8lnQZ0dDA==
X-Received: by 2002:a63:fe06:: with SMTP id p6mr8287927pgh.337.1599246550673; 
 Fri, 04 Sep 2020 12:09:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x19sm1897941pge.22.2020.09.04.12.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 12:09:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/19] configure: Do not set TARGET_ABI32 for microblaze
Date: Fri,  4 Sep 2020 12:08:42 -0700
Message-Id: <20200904190842.2282109-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200904190842.2282109-1-richard.henderson@linaro.org>
References: <20200904190842.2282109-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: edgar.iglesias@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In 19f27b6c2493 TARGET_ABI_LONG was reduced to 32 bits for
CONFIG_USER_ONLY.  There is no need to set this by hand; it will
now be set automatically by include/exec/user/abitypes.h.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index f555923311..fbe34dfbbc 100755
--- a/configure
+++ b/configure
@@ -7740,7 +7740,6 @@ case "$target_name" in
     TARGET_SYSTBL_ABI=common
     mttcg="yes"
     bflt="yes"
-    echo "TARGET_ABI32=y" >> $config_target_mak
   ;;
   mips|mipsel)
     mttcg="yes"
-- 
2.25.1


