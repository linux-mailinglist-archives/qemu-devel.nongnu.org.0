Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C88B355AD8
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 19:55:12 +0200 (CEST)
Received: from localhost ([::1]:55454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTpux-0001CH-8t
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 13:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTph4-0001z1-15
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:50 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:47096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTph0-0006Rf-NN
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:49 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so8031292pjg.5
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 10:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KoBTGUZmyMctY5haXIfN8TiPwOcc2SyNXLP6NLjWLR4=;
 b=ca6yD3KdlP5KFU0u/1D3iFM2QN7G3MjvEwrFRF8iha8PtBfAge2O/p93CLrpXj0eZk
 egGV14FHEq/Mkd4A8xss3iig3FBbSS+PURlN5U2fPFgUq6XzlVjhNZlwHlnARPhZURyG
 w3lDdmjnzIxS1Y39bPn0ILIqE7PXpmIyh6RISEgMJ1CHijW91Su/UxLAoY/Ij6pp7qRe
 HQ7eyEqa018XdG8x1fLe/nN2qlZ00zAJQMQguEfwit65bbW3bN5CyY4h8PKXGAwTK5ul
 yUqQ5LKIuNkYFQPjXF7uzBC2AwtYTUcMbcgoYhlMs2g9oJ8GRRv9Df027x95BpTzGPkR
 YLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KoBTGUZmyMctY5haXIfN8TiPwOcc2SyNXLP6NLjWLR4=;
 b=ojRuPosPon49XucMgK0fKpDZk5ZgKP4FCkIru68LsgBsNvCtu/FOR8BWOGya+C9r5e
 NUuCMim/cavTMdaRTiVNK967tcE9e5TSMrHwO6+8WuORIzG5C7nIq2Pae8pxBw1m7diS
 uvOCk/lF1z7GaneZgyxcHEUCINxz44DGOOXtBOWANPTAYA27aNFc36hFtVQfMyzg0Ewx
 bDb2GF/YHXARAytHjMaKGAG7dHgE8BpVnOnJ84nRVIEwdTkXFC68wtl0uvKOy79hBzOk
 v+EbG3GVr13EqM3dG0Q8qlKqUDixhlfUW+OmT/hcfqwd8jZtS3mhLZvxlkKg1OXlmhn2
 ZbVw==
X-Gm-Message-State: AOAM531ppcX5oMlg67P1b2DlPYmJ03/a8snA3WEQtkoZBDISNv9en2mR
 uURpFfKKJT1EykgZdJ7ulCB9nos1m6D1kA==
X-Google-Smtp-Source: ABdhPJwtu1+cU+MWe0K/CLaqal+QktIhFkgtONdrWzK7DVDw6muGRU6MzBsNldoYva80SqNtRgeoGQ==
X-Received: by 2002:a17:903:2306:b029:e7:1c8d:63fc with SMTP id
 d6-20020a1709032306b02900e71c8d63fcmr30115307plh.35.1617730845171; 
 Tue, 06 Apr 2021 10:40:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h15sm19148056pfo.20.2021.04.06.10.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:40:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/12] exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1
Date: Tue,  6 Apr 2021 10:40:31 -0700
Message-Id: <20210406174031.64299-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406174031.64299-1-richard.henderson@linaro.org>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unfortuately, the elements of PAGE_* were not in numerical
order and so PAGE_ANON was added to an "unused" bit.
As an arbitrary choice, move PAGE_TARGET_{1,2} together.

Cc: Laurent Vivier <laurent@vivier.eu>
Fixes: 26bab757d41b ("linux-user: Introduce PAGE_ANON")
Buglink: https://bugs.launchpad.net/bugs/1922617
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index d76b0b9e02..32cfb634c6 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -268,8 +268,8 @@ extern intptr_t qemu_host_page_mask;
 #define PAGE_RESERVED  0x0100
 #endif
 /* Target-specific bits that will be used via page_get_flags().  */
-#define PAGE_TARGET_1  0x0080
-#define PAGE_TARGET_2  0x0200
+#define PAGE_TARGET_1  0x0200
+#define PAGE_TARGET_2  0x0400
 
 #if defined(CONFIG_USER_ONLY)
 void page_dump(FILE *f);
-- 
2.25.1


