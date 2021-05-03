Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0048371EDF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:48:17 +0200 (CEST)
Received: from localhost ([::1]:42596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcg3-0003DV-Gl
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1ldcc3-0008Hi-7B; Mon, 03 May 2021 13:44:07 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1ldcc1-0004CY-IY; Mon, 03 May 2021 13:44:06 -0400
Received: by mail-ed1-x52e.google.com with SMTP id j28so7257476edy.9;
 Mon, 03 May 2021 10:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FWi+ACxcJkIqdwD0URM5fMKJES8hKpA4brj+oOKAjGc=;
 b=qONwxCtFhm0muB18c6BcJVWUERhFY+7IxGJg3Dz+rbbtjVsY5DA1kU5fWBgLIG5Rs9
 6Q627W1yIGO2NOTblsPw+tRIis6DuqN6Co94uKD2QiLBTvptDoe4kOkXO4ZiBTSdQANd
 0Qj0Cxv6/FyuzUp0r160dtdJ2RgRyWNs7MdUY5+nqQ9xUFhhACBUxN+32UPs7pqNtM0B
 VT3Wz3k3n8imAjWXJ6obYP8zldQ5fENsRtUESv/JOD3SzLTiPhtvS9NpOSuLKAVYnltL
 oTWvDlJvO6++5qbhw/QxrQLtDcAHEtrNEK0pxeXSQrqw6sxfyhJiWXYY4/RB+2Po3Xjh
 /WgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FWi+ACxcJkIqdwD0URM5fMKJES8hKpA4brj+oOKAjGc=;
 b=kCzh3ilTq8OJ4xTesT7RpvW8KX3nEguqh/RmNOxK6vqsEOxTXmOvYOJNbN7r2LCnNi
 vUyLhebVPmn3vbBCKQ0laVMMdzP2cRTkh/M+UT+s+6GMNTn1lp7ohLXHRc+P+B0t6sur
 cY8vDfOxZYXQcjcK/MnzOpq+r8tx51++Q2l0XkrEDXFayiw3KfsnpbotysYW5ZWy2CIi
 hUIamlgisiYr6BXqGAKzHSvxhxlGHOwDZ+Lk/54nmlRY18BRNs1BJO+ohfXcN7c/T8vH
 lZYHPprPfkMbKtLbiFgYS5blzNflHgEAkNaYSYGI0dowB2NbMPv64wGPNG39O5HAkrSj
 RlTg==
X-Gm-Message-State: AOAM533yCg8seordzAkVDOxAuXqa7I6pJEjNrN4KIbGkaR7XPXP/wvdX
 rPpSKiFPCRND8M1JEjwWyin++QaIdgA=
X-Google-Smtp-Source: ABdhPJw9FmXFAwJ+6+eyJS/05ymyn3yByQ3Eg/MgXWtM0EHA4AO5jdNkbBp9L1r+48rDDU8VkuFYpw==
X-Received: by 2002:a05:6402:4a:: with SMTP id
 f10mr21099214edu.85.1620063843881; 
 Mon, 03 May 2021 10:44:03 -0700 (PDT)
Received: from localhost.localdomain ([151.60.47.133])
 by smtp.gmail.com with ESMTPSA id x7sm155879ejc.116.2021.05.03.10.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 10:44:03 -0700 (PDT)
From: LemonBoy <thatlemon@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] linux-user: Add copy_file_range to strace.list
Date: Mon,  3 May 2021 19:41:58 +0200
Message-Id: <20210503174159.54302-2-thatlemon@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503174159.54302-1-thatlemon@gmail.com>
References: <20210503174159.54302-1-thatlemon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=thatlemon@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-ppc@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Giuseppe Musacchio <thatlemon@gmail.com>

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
---
 linux-user/strace.list | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 084048ab96..b81f9964e3 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1665,3 +1665,6 @@
 #ifdef TARGET_NR_statx
 { TARGET_NR_statx, "statx", NULL, print_statx, NULL },
 #endif
+#ifdef TARGET_NR_copy_file_range
+{ TARGET_NR_copy_file_range, "copy_file_range", "%s(%d,%p,%d,%p,"TARGET_ABI_FMT_lu",%u)", NULL, NULL },
+#endif
-- 
2.30.2


