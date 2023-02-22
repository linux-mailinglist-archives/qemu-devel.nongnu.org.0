Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7800369ECEE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:38:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUexP-0007WT-3k; Tue, 21 Feb 2023 21:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexA-0007L6-2p
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:57 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUex8-0001XR-D2
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:55 -0500
Received: by mail-pl1-x634.google.com with SMTP id c1so7463799plg.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0zAr88doy4l35/U8kOUIKFNAL46N655Bwwt/mOy9kK4=;
 b=vAE0hyoLpcAzZ+66jQHG/RI//FDINCq6r7xYdlYqWVeK/KErV1uSa5x5YR+dsSC7ti
 K1ZaAmZvUUo1lvDa9es7zsZePW743U3IVZvYMJhT+a6dzzoCJfb7jHkTt13f8PZ/W/MM
 TwQlphHupr+Eig1uiaCmEybcBMCAe4mVU4rHXxPWUIrdg2kxwS/KJGhvUaMULPbnRQ6G
 OedEN+PaP4ERedfKjTDikVDD3hxYCAJOSfWJObn8hQtm7D+ixJbz1VlG2Gzi/iCNZXb5
 uNvEI6FCjcj13fd0SlRhGL02P3eSKnhftJxqabqo4vXo0fUXJL17tHQojiTWNaW3NVgO
 ggZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0zAr88doy4l35/U8kOUIKFNAL46N655Bwwt/mOy9kK4=;
 b=p6t71Or00dh9WxldjBTVSp/ukzlPHs4E17ftVQdpu2E4vd9p0yI0TlenBF7zutlecv
 bE5ZDO0PDVrrJ6hsFQK0y2FOBy7yvtSBZaU2ParfZLRPJn6fcy5ZCv8AVlh7/N2s2bqG
 Ay0tiqBKwdr99/oBx4OekgQat39KsMrHLj3hLXxNm3QLTJcwkLrOtOrrCqi363Ib7Gqt
 lcqgw4RlnRV15VdpY5TZnFDghq/HHMlEj8KhDYnD0tK7DtNWZQ7DUXjUMDWZs0bfG/N2
 qIRUI60RZKuDwMLY4mgBJaAewhJZFec81OW4qX5QzNalIwPVP+quGHkUeprzo2xqA7P7
 w2qg==
X-Gm-Message-State: AO0yUKW9VJRd9ChG/OrqKMmRh/nAXFJfF4srkI9dyNpMSrNo1MekvFSL
 jRv4X/quN5RXHS+pv6T1I24qbjp9TmR+GPzwyR8=
X-Google-Smtp-Source: AK7set/1vAi6F1WPLLZ6urPvrUQetmEnypxUpqtKOVw6UV3iDStcpUgP1Ch/rx5e39NByVmADwjHTw==
X-Received: by 2002:a17:902:ecc3:b0:19a:9880:1764 with SMTP id
 a3-20020a170902ecc300b0019a98801764mr9517722plh.59.1677033233683; 
 Tue, 21 Feb 2023 18:33:53 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:33:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 10/25] include/exec/memattrs: Add two bits of space to
 MemTxAttrs
Date: Tue, 21 Feb 2023 16:33:21 -1000
Message-Id: <20230222023336.915045-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

We will need 2 bits to represent ARMSecurityState.

Do not attempt to replace or widen secure, even though it
logically overlaps the new field -- there are uses within
e.g. hw/block/pflash_cfi01.c, which don't know anything
specific about ARM.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memattrs.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 9fb98bc1ef..d04170aa27 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -29,10 +29,17 @@ typedef struct MemTxAttrs {
      * "didn't specify" if necessary.
      */
     unsigned int unspecified:1;
-    /* ARM/AMBA: TrustZone Secure access
+    /*
+     * ARM/AMBA: TrustZone Secure access
      * x86: System Management Mode access
      */
     unsigned int secure:1;
+    /*
+     * ARM: ArmSecuritySpace.  This partially overlaps secure, but it is
+     * easier to have both fields to assist code that does not understand
+     * ARMv9 RME, or no specific knowledge of ARM at all (e.g. pflash).
+     */
+    unsigned int space:2;
     /* Memory access is usermode (unprivileged) */
     unsigned int user:1;
     /*
-- 
2.34.1


