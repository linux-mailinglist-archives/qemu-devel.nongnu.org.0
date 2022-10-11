Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9D95FAB3D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:38:42 +0200 (CEST)
Received: from localhost ([::1]:55458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi66L-00010f-Jh
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5o4-0002dd-BZ
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:49 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:36502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5o2-00037H-Sb
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:48 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 d7-20020a17090a2a4700b0020d268b1f02so5317921pjg.1
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eI+72a+zEZxV/Jolsa9Dnr52GdI9trlBieK7TxOdCAo=;
 b=EvvEwixPpytt52H1US8QZnrl4ptv/e3tjqhY1PZhjdzyARkzS7F6Hg6lMhTAMKwRjZ
 PYgKRZ/Lb5JMx80fPtRgOBaon2N4Mi7nz8QT8++SUgaRWDBUERYCMXMdH6nQhldHI0Eh
 5Z6LwRNEvh5OYcqBNmPhv1W4fmIbPozLd9fwpTje/6pG8BCeNqsDR6EgebV3XBqBv2ru
 7C5rILNL9hACqIOqruoNoX/ESGq1vQdSeOe1+Q/YY6wqfB0xGHVcIEZnlraRB+s4k9N+
 rDOwcPMzQKSo8zCkV+7d1NSTo32ylly2wvVw77QIrpX4irURekA8u1bdewCqGFWr/Olc
 tWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eI+72a+zEZxV/Jolsa9Dnr52GdI9trlBieK7TxOdCAo=;
 b=L8MYbq0PCwEZxeWYEAQLqJMTB8Vs+4abX4c5b4O20JCtDrdaJRYxE3UQzJTvAumvCv
 ZWUSSZpWboapbMFgEYu6B+uQnwsmjxuNYlmbeSnOo6L2U09++IcgEa3uDlnogBHP+3s9
 Mi22w/Z1fZOdWdPD/vD6ge5hvSKxg9ZmCHLkW8C9OhW4SI8zvEID5AF/5EbduXetDL70
 ffeEDLZYKgj7FmEkPwoRFlu3hY1CKaUdwdLR12KedEfNPaJAqrj9N0+SikbNDPuGTilU
 5PDQH0czLVeeX4YqOMqMf3nUeGUkRn6y+QSQCsxZGC+wRBlRkXvx0uF2keQLXfBijanu
 qRuw==
X-Gm-Message-State: ACrzQf2TQq5imclVRCb3fxcTbabPGjVcW4be/GRL9eiE3s1So6OUMxkC
 OBlCuu/jjKKcGtMvNQSRWEyz1k/4lMgFEw==
X-Google-Smtp-Source: AMsMyM4Qs3NADfsG5dp2W5hFh5pOTwjcUIpi8EK450wCxPu8E4oGMNq/GBgd3w1QxVoPye4CCWyEEw==
X-Received: by 2002:a17:902:724a:b0:177:fd96:37bf with SMTP id
 c10-20020a170902724a00b00177fd9637bfmr20897117pll.25.1665458385374; 
 Mon, 10 Oct 2022 20:19:45 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 17/24] target/arm: Add ARMFault_UnsuppAtomicUpdate
Date: Mon, 10 Oct 2022 20:19:04 -0700
Message-Id: <20221011031911.2408754-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fault type is to be used with FEAT_HAFDBS when
the guest enables hw updates, but places the tables
in memory where atomic updates are unsupported.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 76ec7ee8cc..e195d771e0 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -338,6 +338,7 @@ typedef enum ARMFaultType {
     ARMFault_AsyncExternal,
     ARMFault_Debug,
     ARMFault_TLBConflict,
+    ARMFault_UnsuppAtomicUpdate,
     ARMFault_Lockdown,
     ARMFault_Exclusive,
     ARMFault_ICacheMaint,
@@ -524,6 +525,9 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
     case ARMFault_TLBConflict:
         fsc = 0x30;
         break;
+    case ARMFault_UnsuppAtomicUpdate:
+        fsc = 0x31;
+        break;
     case ARMFault_Lockdown:
         fsc = 0x34;
         break;
-- 
2.34.1


