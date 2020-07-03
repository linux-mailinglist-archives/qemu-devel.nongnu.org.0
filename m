Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4726E213C47
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 17:03:44 +0200 (CEST)
Received: from localhost ([::1]:44458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrNE7-0003xn-Ay
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 11:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrN74-0003oV-3C
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 10:56:26 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrN72-0006k3-9l
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 10:56:25 -0400
Received: by mail-wr1-x444.google.com with SMTP id z15so21730862wrl.8
 for <qemu-devel@nongnu.org>; Fri, 03 Jul 2020 07:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UfCAxzD4q2CqsaGVTTzt8XAhtxJV3NEqxhJ1Ol7/4DM=;
 b=DsdMiwH9LqfryecOQ76PfX133lT+fowNporgpemXS4dZXfQA1FwN8V7uCAxRCf4K+d
 8RYDgL9K3EkyzqEy5izdfW0O82RES96F68kxI/YE2bLhZWPGhDa5D/u1dFTFvJs7COql
 kqbHgVFOI0qELVhR9+yGzW5zlvuLlG8oYbt1R1PPhKX5mFw3TS4P96MvZwXVQ61reg9p
 J65dtd8JwlxJFS8T5YCZ1QC40EOQXHz+fbX4FDWPO6HBKhNZsypULLZ7e2/nA0fuwcSM
 EPyFZMorUdRuni3jUCL5dGThxQ3/9V4WRZ++BaMf5b0r2xnPN39iKdQVeXvdp5WP1+EY
 BkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UfCAxzD4q2CqsaGVTTzt8XAhtxJV3NEqxhJ1Ol7/4DM=;
 b=k2JDSVIifHSh9md8Il5tqU0VnfVVx6B/VgEvixl2/EBlu/eACSaPyaQwpqTt1e5r+6
 hqx3BWO2jyk6SAoNslyb/Jww3C6c03q8njCkZn7DYiMBHmw/ycux27kZdOknlTJla2vH
 aJhog2gvA28d7yr0hhZIS8XvPhkKDvU4FASHMsT5sRElTY15L+LRqeBunBWQkJMRmutk
 rt8Gg/uO8dukoOtz7tQ5+nvTco0pPl6q2Talc61YomnVbyH0JUqEusFg2tiLQY86vGvu
 TVzUg4f+P/KeNxkFe2hWnCtgRLqFjcGU8Wpu5W0vo4Nqko0KzFgPayrlR9yYj/H/8jz6
 80FQ==
X-Gm-Message-State: AOAM532rfOwmIaWXJaTG42Ni2yEplUYD8/UtyQiMwfAomb/iS75ON49B
 qr1MSb3yBYiJsw4xCuJ7+M8jq77257EqsQ==
X-Google-Smtp-Source: ABdhPJyPzOSOd4ewffKfcJiqpEG9f/97U+VyAkBhHIv08YxCiYDW4FGsRWwy+tPd7AMBDj2PLrMqHw==
X-Received: by 2002:adf:c542:: with SMTP id s2mr9780901wrf.132.1593788182511; 
 Fri, 03 Jul 2020 07:56:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s10sm14078347wme.31.2020.07.03.07.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 07:56:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/9] osdep.h: For Haiku,
 define SIGIO as equivalent to SIGPOLL
Date: Fri,  3 Jul 2020 15:56:10 +0100
Message-Id: <20200703145614.16684-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200703145614.16684-1-peter.maydell@linaro.org>
References: <20200703145614.16684-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: David Carlier <devnexen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David CARLIER <devnexen@gmail.com>

Haiku doesn't provide SIGIO; fix this up in osdep.h by defining it as
equal to SIGPOLL.

Signed-off-by: David Carlier <devnexen@gmail.com>
[PMM: Expanded commit message]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/osdep.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 6e0cf9132d9..e090ead8262 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -425,6 +425,10 @@ void qemu_anon_ram_free(void *ptr, size_t size);
 #define HAVE_CHARDEV_PARPORT 1
 #endif
 
+#if defined(__HAIKU__)
+#define SIGIO SIGPOLL
+#endif
+
 #if defined(CONFIG_LINUX)
 #ifndef BUS_MCEERR_AR
 #define BUS_MCEERR_AR 4
-- 
2.20.1


