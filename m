Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835EB4BEA5D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 20:29:28 +0100 (CET)
Received: from localhost ([::1]:33762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMEND-0004Jr-LF
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 14:29:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMEFo-0007ik-5A
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:21:48 -0500
Received: from [2a00:1450:4864:20::32b] (port=37774
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMEFi-0002de-4Q
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:21:47 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 p14-20020a05600c1d8e00b0037f881182a8so67782wms.2
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 11:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FYwSuEjvQcSL/9thHK2sjrgtlkbwAqldrJkzTwEeRVg=;
 b=LVbumPSyaX7TrpD3kP5p4S/v9/R/teBm5aN9HJCEeQ5n3ogBXzFU0kiXJNokDn7UzU
 O3x9H3IVqA3jlxR5Tl9DDKJoVrcbQOlWwY5ymX7a9BAkpwRNPvFGJRtjuJlqCyIisxsM
 zN4VLc+tQL6C2Lb4ktpta4qnmBRFanQ18mKGDm2ayc5CMdkf0TbXUfhoTkWCeV/EGvBR
 2VdXB8LpTeqMriKKzhc84dmILW8k0aqJKJM/Isu0QwiyKTxpb+nImGMl+2IwI+zQ9Gce
 bdFUnzFvnM1pKlPewqCkzAE4CvqJmw7zjByFvjUsgfN1pbZNdHUHJPLJub32sRTaMguQ
 i0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FYwSuEjvQcSL/9thHK2sjrgtlkbwAqldrJkzTwEeRVg=;
 b=6U5qeVkUsvkwAbqkEqHPRtNwp18jpiByFVV8cuY5+CwUW2YMbchv6lcW5GreOlRWMI
 nWEwYtIiZwrLfNiLS3T3TWc8B2bBzAIPWes57HrJAfxZIKwro3wzwBRbLZsPcNpdoGvH
 3+sMjPKg0KaDgB50lBBmhk5V8r3E5y+DpAPc2ss38G3pQYYOLIQOeTbvZI2KpRoVSHkb
 grdzt+FJm3+jtU/N7QDLzl8860tjsqIu1yWWP3aDsEG9aJ9RgGD0s1gWj+XjgCysCI8u
 NvXLrEQSg5YZdS5fwp6x/z7Q2vmI/c3ozhwIZAA+MQ2DUTxZa+oU5272S6Qci6+y7ERe
 zNlQ==
X-Gm-Message-State: AOAM5317a3oSjDud/2KO8/KW3kIACE4nhv1URLTNZl9AyHanI1LCrZ/E
 ibAsj1O58OQH3gKLHi9wCQVDZw==
X-Google-Smtp-Source: ABdhPJyjNH7OqnZ1hQOub41nAN4tt0b546sUv2EQFIzbJLUGbIM6aR69qI0m763BSiCARFuPhB4r9w==
X-Received: by 2002:a1c:2742:0:b0:37b:b481:321f with SMTP id
 n63-20020a1c2742000000b0037bb481321fmr400745wmn.56.1645471288400; 
 Mon, 21 Feb 2022 11:21:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j6sm38958226wrt.70.2022.02.21.11.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 11:21:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] hw/rtc: Compile pl031 once-only
Date: Mon, 21 Feb 2022 19:21:23 +0000
Message-Id: <20220221192123.749970-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221192123.749970-1-peter.maydell@linaro.org>
References: <20220221192123.749970-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the RTC_CHANGE event is no longer target-specific,
we can move the pl031 back to a compile-once source file
rather than a compile-per-target one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/rtc/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/rtc/meson.build b/hw/rtc/meson.build
index 8fd8d8f9a71..7cecdee5ddb 100644
--- a/hw/rtc/meson.build
+++ b/hw/rtc/meson.build
@@ -2,7 +2,7 @@
 softmmu_ss.add(when: 'CONFIG_DS1338', if_true: files('ds1338.c'))
 softmmu_ss.add(when: 'CONFIG_M41T80', if_true: files('m41t80.c'))
 softmmu_ss.add(when: 'CONFIG_M48T59', if_true: files('m48t59.c'))
-specific_ss.add(when: 'CONFIG_PL031', if_true: files('pl031.c'))
+softmmu_ss.add(when: 'CONFIG_PL031', if_true: files('pl031.c'))
 softmmu_ss.add(when: 'CONFIG_TWL92230', if_true: files('twl92230.c'))
 softmmu_ss.add(when: ['CONFIG_ISA_BUS', 'CONFIG_M48T59'], if_true: files('m48t59-isa.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-rtc.c'))
-- 
2.25.1


