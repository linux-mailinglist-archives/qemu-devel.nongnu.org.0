Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0CB4A5BA8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:59:25 +0100 (CET)
Received: from localhost ([::1]:44142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEroi-0002k9-QC
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:59:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7u-0005C7-BV
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:11 -0500
Received: from [2607:f8b0:4864:20::d31] (port=37836
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7r-0003cS-FS
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:10 -0500
Received: by mail-io1-xd31.google.com with SMTP id n17so20710666iod.4
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WSgxsk4XZw+x1Q4t0CNi+XkK/sSqSpLeA70Ph+1kBgk=;
 b=q4NghWYTfcezq/ItKfmY+Ha+mbFb9aMS1NtL1ku3+LVPBSTYHmS81x5p1vWW0sLUdz
 Ku9Kq7+++1v5wvdUTA3O4vwLQSe47pomTReQY8oooUC6CHMTIvDkDdcF9sAEY8AeuaD6
 XtDhxiQ4TtUgZa8uSFJP/0+PgIPY8QLrJqaW8nfg4oa9JLj+jdUc7ABqtkL7Kf0L5/zO
 fUJyRfDEVRJpd3T0bh+Jhe20euG5f8hmMy34J/FDABhauQWY6SMv1MbqfSdMmqzZS8Vi
 /3Lw2G05dAjR9SPMq1At8EceJ0nTB8kV1w8drFX6q8HIBttd5vACyJBsbnryOiaV93i0
 2A7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WSgxsk4XZw+x1Q4t0CNi+XkK/sSqSpLeA70Ph+1kBgk=;
 b=3kg5sqp4BkQAR0FBwrlwgIQ3h2y3EuB0nSdo4o/f7NOLj4+gZ6B1i8qvhxst9fWSVM
 2FAXFTNhz7zKx69XL6NprzqDEi3sTM8P3mtKLaPVc05fo2ITi0CBWAFr//lPfEOs+xnr
 m7xk2qqgT5vvO87T9TDbhvLyyrApt5wy5GZeDr4EJLTVCfiInhzydrMl3/MbSxe8dHqX
 hk0YLnuqAj05o8lS7xH1lVnfBej/3lwMeNnZxVxGfwdM5xYz5rQXB2Mf4hh6kLF+Z8hM
 T7yHY9gMaNCRZobEJl0LHNLBoKPw7N276eXfE4EHCbmxx1wOKqSL3JiD9LnjKan98PlL
 J/rg==
X-Gm-Message-State: AOAM533QLqqNJmHRffEIDSXlZWWLO6+H1biX41m0sHzF2inO9XQVS4VN
 0wTdn7urO2sH0kcVlsRptjT7MjJHRdCbug==
X-Google-Smtp-Source: ABdhPJyrIcnoQjf5kydZN7T8n2e9tqZFIeYMfOjy4b0gJltdPsD6cU++gTyeua/YH6CEkbaAShLq3A==
X-Received: by 2002:a05:6602:121a:: with SMTP id
 y26mr13550915iot.1.1643714106230; 
 Tue, 01 Feb 2022 03:15:06 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:15:05 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/22] bsd-user: Define target_arg64
Date: Tue,  1 Feb 2022 04:14:51 -0700
Message-Id: <20220201111455.52511-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 arrowd@FreeBSD.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

target_arg64 is a generic way to extract 64-bits from a pair of
arguments. On 32-bit platforms, it returns them joined together as
appropriate. On 64-bit platforms, it returns the first arg because it's
already 64-bits.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index a9efa807b78..af272c2a802 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -462,6 +462,19 @@ static inline void *lock_user_string(abi_ulong guest_addr)
 #define unlock_user_struct(host_ptr, guest_addr, copy)          \
     unlock_user(host_ptr, guest_addr, (copy) ? sizeof(*host_ptr) : 0)
 
+static inline uint64_t target_arg64(uint32_t word0, uint32_t word1)
+{
+#if TARGET_ABI_BITS == 32
+#ifdef TARGET_WORDS_BIGENDIAN
+    return ((uint64_t)word0 << 32) | word1;
+#else
+    return ((uint64_t)word1 << 32) | word0;
+#endif
+#else /* TARGET_ABI_BITS != 32 */
+    return word0;
+#endif /* TARGET_ABI_BITS != 32 */
+}
+
 #include <pthread.h>
 
 #include "user/safe-syscall.h"
-- 
2.33.1


