Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8237A6A439B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:02:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe59-0002ES-Pd; Mon, 27 Feb 2023 09:02:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4B-0000eA-S8
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:29 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe49-0007XC-U8
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:23 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so6627824wms.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FhwqGr42a8O7VHpaKqpcSkL5g78mGefM0X1jMjxurOQ=;
 b=yB5sAnZzMUf8BK4mQ6+/evWC0D4cShyIVQjzxTYHaettME7cOIVNuxwVpSBOsP2mAK
 LE8ybqYu5RvUOysW2f4reNejpKdqK8YAuyuo+BK1vnpozPEl4fS/J6QyoS3GDGmVi87e
 IfRX5inTknv9dKNpj42OMmDcZ7BRpKCHq37vyp7kKyqZ2s2NEp7v8ar8pJtssMFDllU8
 2NOHXIQv48yAB4DbpATL2nFxGV5bj4ITp8Ud3Cn9F1LEsJkIKwnFtWZ46HAv2RA4FJ5j
 EDUFhrvZAuBy4TcFXFg597L+gOmx0l+Knv7IxwkaToQATm0t7KVhrzjixFTmsWORE1XO
 zP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FhwqGr42a8O7VHpaKqpcSkL5g78mGefM0X1jMjxurOQ=;
 b=676MCe7ieC8twkQhApyJwAaqYkSxiOrjnHWGLN6sDoz3rmOK0ktrDo43R64zgPegX0
 UuhrOuaGJ0SYsmI5Sh7XQeMsn3mxHng9GLz9vu/w71T8nRgFZjxCxjsPs2ttW8ecokEl
 DmO+b0EwHGc3vTXoN4PP0pznphFmXRQo5WUG29SEj0iIkXDqsMLOvGfW+lDPgxaBMlwv
 BpnK4FDwl4JQT8mNN8hHJtFrUcjS5+tq+LTAzIYoltwjfzSj6SoOnlFxfBPpTSrF0yxo
 /uxGupgow4i1mUhdfYDfq68WsMVbKU7pQ1iPbzTWdtVd6ISwD78Yq8wmGu8b72MSXpSC
 h7qw==
X-Gm-Message-State: AO0yUKVGn7FPH+Cde7pW304OJTtSEFRcL6lqGSAGRdf7/aULyJ9yoibg
 17DEpjXiM5tcBQZBzptR+cWO19/VNr/iDR6u
X-Google-Smtp-Source: AK7set8wGZr3V94Zdzj9IZKsq2QhmLug8iA0bSTDQcKB+pwSjG+UOtQYA+LAPFB6dULWhI3fZ0Lzfg==
X-Received: by 2002:a05:600c:810:b0:3dc:557f:6123 with SMTP id
 k16-20020a05600c081000b003dc557f6123mr18705719wmp.1.1677506480195; 
 Mon, 27 Feb 2023 06:01:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/25] cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
Date: Mon, 27 Feb 2023 14:00:48 +0000
Message-Id: <20230227140102.3712344-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

From: Fabiano Rosas <farosas@suse.de>

This struct has no dependencies on TCG code and it is being used in
target/arm/ptw.c to simplify the passing around of page table walk
results. Those routines can be reached by KVM code via the gdbstub
breakpoint code, so take the structure out of CONFIG_TCG to make it
visible when building with --disable-tcg.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu-defs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 21309cf567a..d5a4f307178 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -135,6 +135,10 @@ typedef struct CPUTLBEntry {
 
 QEMU_BUILD_BUG_ON(sizeof(CPUTLBEntry) != (1 << CPU_TLB_ENTRY_BITS));
 
+
+#endif  /* !CONFIG_USER_ONLY && CONFIG_TCG */
+
+#if !defined(CONFIG_USER_ONLY)
 /*
  * The full TLB entry, which is not accessed by generated TCG code,
  * so the layout is not as critical as that of CPUTLBEntry. This is
@@ -176,7 +180,9 @@ typedef struct CPUTLBEntryFull {
     TARGET_PAGE_ENTRY_EXTRA
 #endif
 } CPUTLBEntryFull;
+#endif  /* !CONFIG_USER_ONLY */
 
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 /*
  * Data elements that are per MMU mode, minus the bits accessed by
  * the TCG fast path.
-- 
2.34.1


