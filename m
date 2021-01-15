Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A6C2F88EF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 23:54:10 +0100 (CET)
Received: from localhost ([::1]:38070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Xyr-0001yN-A9
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 17:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xs6-0003Xw-T2
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:13 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:36033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xru-0005Dw-B0
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:09 -0500
Received: by mail-pl1-x62f.google.com with SMTP id e9so1287105plh.3
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BPFkHBCfiYE2/tooUwU3w49LVJJCP7NOmKVnwS50G54=;
 b=cVKi/EO5fMAfl0J+r2MBksBLyMqvCDyxcwuWFw/B7d/QyOp3jq6CjIqXBdd5qtgeYx
 BK6B3yOo23/ugG7c2INs0jNR0Vpgxfmg7X/dgJONJOwZG2EU6r/OyikYnND6l+kcHJwU
 Qg3VKh7366OMoeOzo9TXybPAhNh83PeG4OODSM/JKNzefTkMGK+gE6WKwTEc9FahaYhD
 tVR0sK2xp7+e9GKKOoT+cVQZRXJUDBgWQRPocHFn//aVL8gxsF7dokk5sAs1wSDKJ46v
 fKjaJZjyLVJ3LNZQTzeMbdA2H8kL1k+I0hGZsjiJYj+Yh3kjp701dDTMqDzebEQoKXRM
 4H1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BPFkHBCfiYE2/tooUwU3w49LVJJCP7NOmKVnwS50G54=;
 b=dpC368ri+fwTNwen1lv4zrIf0Vu6cY/43xVPSj1ZKAgvYbG5Fj0HSFYm9KYtDXQTzU
 blVG66alDBmjxaHQNLrDkI6AgPnIROeoIm4ppT82P3Xkb+o858jmIe59UsGYbx7UdrVR
 8BupONV/il6SMHzVtZqzk7iAsmvPne9JY1lc6J2urJY5rha3rWdd9jRq7t+0PveeoPfs
 7IrGc1fClhL3epElfhBUseJwYnTPvyb2Ktmi5Vzf/Jpy/g4gZrMPSkeOJ1K5npzvyAOK
 SUTXgW/WaSGVpB6NuXJKJrssTZRv7b3edh8DIHnCzHNUuXqyPUh5FBYAyOoTOufTSPFt
 eTMQ==
X-Gm-Message-State: AOAM532p+rQnqzT5QydetM2OCYz9qo8pEyRgsto3j6m2ECKRDiugnH7Z
 3IpZOJCiDAFkJZ+7Pv9GiFyDqsLhp3hCBJJS
X-Google-Smtp-Source: ABdhPJyBOpOsu6OBJWbBU/auhm1HBzyzQEWFRl2H0VnP6d/hHQRD/m3916MQp2cwnQkSEk+D/k/9fw==
X-Received: by 2002:a17:902:8d82:b029:dc:20b8:3c19 with SMTP id
 v2-20020a1709028d82b02900dc20b83c19mr14798262plo.29.1610750817019; 
 Fri, 15 Jan 2021 14:46:57 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:46:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/21] exec: Improve types for guest_addr_valid
Date: Fri, 15 Jan 2021 12:46:29 -1000
Message-Id: <20210115224645.1196742-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Return bool not int; pass abi_ulong not 'unsigned long'.
All callers use abi_ulong already, so the change in type
has no effect.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 3f9063aade..5e8878ee9b 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -79,7 +79,7 @@ typedef uint64_t abi_ptr;
 #endif
 #define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
 
-static inline int guest_range_valid(unsigned long start, unsigned long len)
+static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
 }
-- 
2.25.1


