Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 419CB6C5321
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 18:57:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf2hS-00008Z-3T; Wed, 22 Mar 2023 13:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UUEbZAYKCmgZOZaYXMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--titusr.bounces.google.com>)
 id 1pf2hP-00006h-PA
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:56:35 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UUEbZAYKCmgZOZaYXMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--titusr.bounces.google.com>)
 id 1pf2hO-0002Fn-Ar
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:56:35 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 j11-20020a25230b000000b00b6871c296bdso12952516ybj.5
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 10:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679507793;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=kSd+tzkdOJAC3FzLgq2ZSZ8SsB0RX5ytiYdlGTCKyFA=;
 b=N0xT4vOETnrFNGMRqljK9WP/cKl6H6zYW/fgDL86zMLz56KvJIulslJYzNPhC5TLdp
 /rMrCo3mLTJa4ghvc93LNfn9OTM4FVeu9GmwbgMQ+ZykTD/OT2eV6gxKnHMHjaWoi3pM
 UAxEjA0jYJoKBOswagoVfbHiiBziBXVBNY3q7fly4tFyy901mYmYV8wfUtXHJ+03d62D
 Q7aIhGXz3soQJ9xl8iJPzV0IchOqy+BROmcCIo19KMIcsmuh+vs3d7jmbpWy15ToPRa8
 UoZsbJbE+uz231zcxyodcDVN/gqSb2GjoHiGXlA3zTQVtXfhRMtRLo4ydU1ciozINAyz
 QqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679507793;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kSd+tzkdOJAC3FzLgq2ZSZ8SsB0RX5ytiYdlGTCKyFA=;
 b=ZcNYtcjYeL4YzgHpr8fO7QLBAARfKib1hB0jtaLcUUCt7GwNzrHTMUaHCjNx59M9sf
 mF73YHuzVDdJ+BzeZmHJRh8TQz/w8m+Us880Q1xuFfuAK6OunyDvhndacsPV7cPsPDdk
 /cK6D6jGJz6dOowehxOJ0tiFTDPS0yJh5Hw0DWmd3/o8pd+Tj66bqsRYehF95P7207qF
 KihmVEYG0UU/ICHXAWy2oiTfQ3TkQ9S+vq7hCS6TPGzHwJsO8hrsAhq1tCSiOwPWGV20
 dVDtu7pSju0D73pCf6H6Ys/li1cSW6BnhytYeFl3xKXLVRPZwQj33QHNitNJrZMFR0Ut
 v8og==
X-Gm-Message-State: AAQBX9ePKV5JaHuLz5dQURMLnA814A6Rwqna1/EKAEDhdyMCKK1PuhyO
 JZ9ymFqqDscHstdIvtdlW4VN8LtVZdM=
X-Google-Smtp-Source: AKy350bgETMJYe4YAJP6/wChva0VTgbXaNxBnQd1KzOn3l+sS2cPVdsb00oLtySGzYfjBgsoTV5a4u+Z23c=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a81:b611:0:b0:545:4133:fc40 with SMTP id
 u17-20020a81b611000000b005454133fc40mr357418ywh.9.1679507793108; Wed, 22 Mar
 2023 10:56:33 -0700 (PDT)
Date: Wed, 22 Mar 2023 17:55:10 +0000
In-Reply-To: <20230322175513.1550412-1-titusr@google.com>
Mime-Version: 1.0
References: <20230322175513.1550412-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230322175513.1550412-3-titusr@google.com>
Subject: [PATCH 2/5] hw/i2c: pmbus: add vout mode bitfields
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3UUEbZAYKCmgZOZaYXMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 include/hw/i2c/pmbus_device.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 7dc00cc4d9..2e95164aa1 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -444,6 +444,14 @@ typedef struct PMBusCoefficients {
     int32_t R;     /* exponent */
 } PMBusCoefficients;
 
+/**
+ * VOUT_Mode bit fields
+ */
+typedef struct PMBusVoutMode {
+    uint8_t  mode:3;
+    int8_t   exp:5;
+} PMBusVoutMode;
+
 /**
  * Convert sensor values to direct mode format
  *
-- 
2.40.0.rc1.284.g88254d51c5-goog


