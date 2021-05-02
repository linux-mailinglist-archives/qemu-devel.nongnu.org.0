Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5C0370FF6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 02:01:58 +0200 (CEST)
Received: from localhost ([::1]:36228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldM29-00043E-Hb
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 20:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxw-0007Xe-HJ
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:36 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:38654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxt-0000Xr-MO
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:36 -0400
Received: by mail-pl1-x62b.google.com with SMTP id y2so1893390plr.5
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uSGurxfI6VXxBzXiAREHINIQr8uowwdNrl8Mp3grGmI=;
 b=aWrqnq+A8RWWhDev8qRu/qEd3AMd2tYItPVC709RzYCY4gCPsQSo2Oa4fTn2NUYHGS
 sRGPXV2s54sEtHXL58yc61ZFwO4eJGshkc64z6bPRMY87q2bGvEZ+qeUbDzs+Hx8FLG0
 BCVqPHPD9xUFtfzfP1gDhFOCvlfmM0H3BXKljbdAvIJ5CqfMQE/SFWofF+Cpb53gq7Cl
 vHXyD9HQRpMr04wX5BRvdc2CGFozmtA5pvvT+zL9TLKrhoXnTE6eVPDdxB3f/A3WI9Xa
 PstZwD1WK5Sk9T0S75Tb/vGXZ4rOYdflJhgjOADZ+z4oPl5iRTWMhvjYtvEkYHZxDGAY
 mwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uSGurxfI6VXxBzXiAREHINIQr8uowwdNrl8Mp3grGmI=;
 b=l0SsMiNPMGStHDczmmUgcnJx4gKJA8NMmAp0HBZw2SAKjZM0jMap0G5oK+6r7x3+7f
 /CwhzpMmIWKb4180fttuQRPL8F3VKKX39f6KAjrmVL19npVvr87aFA1V5TtBEcvzTcne
 KZCoK+0JLwebB7tYgUWOMt222tagysNGR4+R8fbYelFMJhk3X/zvdVrx60p4UGYuE58L
 aJ23s29h6jkjXL2wGOdv7Pei1gzjGNOMpeSmp+6Rt+D0cbZafn7ld5AwIcYBY65vOSMF
 BD7Ugqmd4bYWtF77WdHVb8QdrKbs4t6xvzMLjQtFZdyyCTVPYVHQ0/T/ypvKV8Uci4zx
 F2Xw==
X-Gm-Message-State: AOAM530yvpw7r/uExBJOXEwqtCXuz5Aqa6U+iLZ0/J1TbhxBWb82zyGj
 BbTXdkzHtI9XsEhPwwP71ehBB8UHZGxN0w==
X-Google-Smtp-Source: ABdhPJz6VXaJqS/7rVCMXtki8lQtJZpIPA6xcX4eV0oeGZ7PrjZa7CldnQdU6aoEKpUdSJh+1FHkvA==
X-Received: by 2002:a17:902:ec87:b029:ee:910d:acf5 with SMTP id
 x7-20020a170902ec87b02900ee910dacf5mr17519204plg.66.1619999852444; 
 Sun, 02 May 2021 16:57:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/26] accel/tcg: Add tcg call flags to plugins helpers
Date: Sun,  2 May 2021 16:57:06 -0700
Message-Id: <20210502235727.1979457-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As noted by qemu-plugins.h, plugins can neither read nor write
guest registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-helpers.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/plugin-helpers.h b/accel/tcg/plugin-helpers.h
index 853bd21677..9829abe4a9 100644
--- a/accel/tcg/plugin-helpers.h
+++ b/accel/tcg/plugin-helpers.h
@@ -1,4 +1,4 @@
 #ifdef CONFIG_PLUGIN
-DEF_HELPER_2(plugin_vcpu_udata_cb, void, i32, ptr)
-DEF_HELPER_4(plugin_vcpu_mem_cb, void, i32, i32, i64, ptr)
+DEF_HELPER_FLAGS_2(plugin_vcpu_udata_cb, TCG_CALL_NO_RWG, void, i32, ptr)
+DEF_HELPER_FLAGS_4(plugin_vcpu_mem_cb, TCG_CALL_NO_RWG, void, i32, i32, i64, ptr)
 #endif
-- 
2.25.1


