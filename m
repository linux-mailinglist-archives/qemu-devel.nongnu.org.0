Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691B62EA112
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 00:47:35 +0100 (CET)
Received: from localhost ([::1]:36222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwZZW-0003G4-1Y
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 18:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwZWQ-0002Hw-ST
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 18:44:22 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwZWP-0006dR-6Y
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 18:44:22 -0500
Received: by mail-pg1-x535.google.com with SMTP id z21so20091815pgj.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 15:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hpy2mlWlN/oidbwbRL2i/HdooqDBerw0squSX703kkY=;
 b=gjccSY16lnxfKQBwVokdwRB3FO3fbXp+DwDFmbnM7lFQlYI/vVDEL6U/prcQAb7p5j
 3ylRIJig8xdaLG8arakgmSVUs7m8Fw2BYLqm5TbmNQ+8w1DT6CszMaIymG7nf7aAgcjz
 Rt4MY/sghmlDY2SwkMeeP2fIl6eY3/VoqAtbVsxI0qmyY3EFzL0eFkcWr1yx1BOvFxeX
 ce2chfEGvCjBxV2CtpWaWQYN8V9toX4uZJR2x76KXJZJxVg8T9+zoHOHafqqveIeovC9
 EO8HZoEBTzS3idUJSzFtp1O8zNWFo1vpbi5DLR2Z4rzUFcYy5kFaK8oi+eU0QxrV6o7+
 H+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hpy2mlWlN/oidbwbRL2i/HdooqDBerw0squSX703kkY=;
 b=VJkT6JKuFBxJdnBpqJwzXq77HEjeFOm5i1VtYN2pWPjTPwp8OEtxL3v6rnr9A/zOG/
 C4dxAWKuBCORfRf6BM6tGXh7+VVrkbUsOrk7GNhY9bnVOZJhrvSJu4ip7/uaynEO5ckL
 /SsYUWpXNxasHMlYfHBHL8dH9cmAvvIndZvofwrlaZq3mBYB8DHg7+Ya6kwTW7ARgWTl
 uLTOyrA4hCU5V+ZBdmrVk5rpFFYHQLjtDDa3J/Ksxs5sdbi8XLE1lKdsuw1ovajBf5EZ
 gocmzw1uQDHRt0Z7nzSWbriZP8oyUC5re5nz5geFdCWTUossSa5LhMa9yJI1Gc+uHIX5
 92oA==
X-Gm-Message-State: AOAM533w5uJVXMVCfHUyIgiSGQh1bqyT5tCp+qBm40FT32b96ZHU1gla
 SXIWqKl0NmOiVMmHp8uOxeqIY7dHHIXIWQ==
X-Google-Smtp-Source: ABdhPJxa1X04AXiXOXDlmbHvY5Pj9icXpbYAk9TY9/AKICdXpDDmCae9/LAPpB6eLWfHYnumrZF3bQ==
X-Received: by 2002:a63:24c4:: with SMTP id
 k187mr26123773pgk.238.1609803859462; 
 Mon, 04 Jan 2021 15:44:19 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id 129sm56698346pfw.86.2021.01.04.15.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 15:44:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH, BUILD-FIX] linux-user: Conditionalize TUNSETVNETLE
Date: Mon,  4 Jan 2021 13:44:15 -1000
Message-Id: <20210104234415.405521-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: peter.maydell@linaro.org, Laurent Vivier <laurent@vivier.eu>,
 Shu-Chun Weng <scw@google.com>, Josh Kunz <jkz@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes the build for older ppc64 kernel headers.

Fixes: 6addf06a3c4
Cc: Josh Kunz <jkz@google.com>
Cc: Shu-Chun Weng <scw@google.com>
Cc: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/ioctls.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 661b5daa9f..7193c3b226 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -748,8 +748,10 @@
   IOCTL(TUNSETQUEUE,     IOC_W, MK_PTR(MK_STRUCT(STRUCT_short_ifreq)))
   IOCTL(TUNSETIFINDEX ,  IOC_W, MK_PTR(TYPE_INT))
   /* TUNGETFILTER is not supported: see TUNATTACHFILTER. */
+#ifdef TUNSETVNETLE
   IOCTL(TUNSETVNETLE,    IOC_W, MK_PTR(TYPE_INT))
   IOCTL(TUNGETVNETLE,    IOC_R, MK_PTR(TYPE_INT))
+#endif
 #ifdef TUNSETVNETBE
   IOCTL(TUNSETVNETBE,    IOC_W, MK_PTR(TYPE_INT))
   IOCTL(TUNGETVNETBE,    IOC_R, MK_PTR(TYPE_INT))
-- 
2.25.1


