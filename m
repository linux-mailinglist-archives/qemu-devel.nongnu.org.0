Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3665327561
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:54:19 +0100 (CET)
Received: from localhost ([::1]:52572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVtC-0006iT-Jk
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:54:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPq-0005a7-4t
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:58 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:38892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPe-0007kX-Ak
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:57 -0500
Received: by mail-pj1-x102c.google.com with SMTP id l18so10481623pji.3
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jp1oxTR2VzQtOn8Dm1XpEq+MbBttOBriYtfiWssZL7A=;
 b=rf0/9ezECXmoPiHX5kVLdBBVzD2E9xwLtlRNcb0qVJE3Dbsz/XaS/yTwEQ+hwi/t8m
 vmKnQFGJ+euKvNQUofZjQSxDTx3pWXgxj3VPTxBgoeQbgVozd+K+dsy6+MO5mZTCGA3a
 Yp6aX9/yrRwYs1aN6hX+w3t3ccF6LVVYO6K9p/1BeSpy2Nz2vwAlHghTfQoU1yTGTn4G
 Pm1AD2LSkF4J9nxxj9VfBMujam+n7D0kUsnyJq0haQWtxdTWnLuY4t7glNnpnfFuCzGG
 eo9hlzPsfyDTicXisG0kCz4U4/cgMogx69WtTBn8KmK9a9WBD8pFHoQ38vsRsp/jXTQk
 NaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jp1oxTR2VzQtOn8Dm1XpEq+MbBttOBriYtfiWssZL7A=;
 b=deF8If7+Opl7EuapU1BMwgpINSlYvEQkZgKsAnJF934jZD64IVLlS2VPFPkK6k3ywS
 gMELiKspqvrMW3JCIPYEcftMgogj+Iq+Is5jVW1bsgGiyq8lfXuWhgeqBgR/NBCUE7vX
 +OmWZ2oN0Q6SZnP4u3Va/m3Tl24tB9ZDv5zZbYqvhpkxeCfncMDXC/QKDsCP1cRYk6Ue
 Rs1W0GUA9+So9hHpbpq939/iPk48V0ltft4Hfwv9AWnh/yZk6Kzfik5TI4LFpWmS5fWC
 BNJHGKhfg32YAw8DOcXwKDenh3iHJMTxQTWC2MwX58DTWfhvuuLbjcdncqEqyxFv0YIZ
 uOYg==
X-Gm-Message-State: AOAM533oPbqo5U0uomUXB8+GN042Ab+yYV3xJfEXtVGRZnhnZW/fU7nG
 QKxxE4VMjRAfyjFS2jj9SakgED8V5i2tXA==
X-Google-Smtp-Source: ABdhPJyUCvv5C62S1XdvxXLWqjTh7c+3ArmnVWLOnlPWAvpOgBXE6GDLr9Rqfeg7QF2nFTEussicjQ==
X-Received: by 2002:a17:902:eb11:b029:e4:a5c3:42e8 with SMTP id
 l17-20020a170902eb11b02900e4a5c342e8mr3857985plb.26.1614554624942; 
 Sun, 28 Feb 2021 15:23:44 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/50] target/i386: Reduce DisasContext popl_esp_hack and
 rip_offset to uint8_t
Date: Sun, 28 Feb 2021 15:22:55 -0800
Message-Id: <20210228232321.322053-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both of these fields store the size of a single memory access,
so the range of values is 0-8.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 3b7660a019..9004f83c52 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -106,8 +106,8 @@ typedef struct DisasContext {
     int repz_opt; /* optimize jumps within repz instructions */
     int mem_index; /* select memory access functions */
     uint32_t flags; /* all execution flags */
-    int popl_esp_hack; /* for correct popl with esp base handling */
-    int rip_offset; /* only used in x86_64, but left for simplicity */
+    uint8_t popl_esp_hack; /* for correct popl with esp base handling */
+    uint8_t rip_offset; /* only used in x86_64, but left for simplicity */
     int cpuid_features;
     int cpuid_ext_features;
     int cpuid_ext2_features;
-- 
2.25.1


