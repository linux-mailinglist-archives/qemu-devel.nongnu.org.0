Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFE048FEDE
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 21:46:58 +0100 (CET)
Received: from localhost ([::1]:52274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9CQT-0005gR-7Z
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 15:46:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n9COC-0004Ce-AX
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 15:44:36 -0500
Received: from [2607:f8b0:4864:20::12f] (port=37763
 helo=mail-il1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n9COA-0003zC-7n
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 15:44:35 -0500
Received: by mail-il1-x12f.google.com with SMTP id v17so5436009ilg.4
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 12:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5FnruuyT71sta5DTi1cTeawA0wmg9fd8cToXJkXTivI=;
 b=PQFVJ7PRMb5T4GhPTmWLFvgYhVHobR1QmhlKdZ/jMOcmbCIII8RPnkY1/fVq2SnIYH
 mxQqcOweK29UolBxDJRUlWVnjalBsG7/TPC9524WZz7RqrGhUCFeV2ODDinLwKwwYsVN
 9WlGoCFVRgBZeNYpAFJtghxC2oEXaRLTwKSW1uVupg0rBu/PoGyIvS2Ik17ynXABQ69z
 ZQtM4gcTC+p1wz5PguMWHVzvPMvJz4uiEhOxqeQsdBi4DO0QOQpPGQynpCtMQv0m0Zek
 6mChADwI3FjuY4zRv+AV7H4qyihUOe/O6ZoI94wo8p9Er69qtsLsMzso3T73LHFo8ghS
 aXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5FnruuyT71sta5DTi1cTeawA0wmg9fd8cToXJkXTivI=;
 b=AVyvQ269IO8HJ43rY3gKIaf3sEiYByFiRZdmV9cgDdmwc4B/DgayUWO2TPpSU23Q/F
 Af9VyXI1d6qSRbMzPMGIrSYQX0femP9+JkKATZyTP8Pc0JKMGcOF5ezl4TabhKh9Zf70
 ZzNX1Xx/gUAzpZCALfPrWC/1HZfv1dDyxP+tVlWInduR5O79Ji/0OjzI51G0y9tm5D0x
 AI6NHRDUMkadI8rykg8rrk9sAC+S194xX2O8HeRkcD7Zqfppu0z4tXd8t81ilNhSV0IK
 gnyEt+Zmm7k2YHSOzOzhi0sHAtBU+gds9DxJZfs476Olmx51xvl4xe29T/swu8Drc3c4
 2uJg==
X-Gm-Message-State: AOAM532y7YnzOQ6WAu3W2iBnmkWVGfCzoDvZ11hN9/gwXDqDkwaalwkW
 gteSY+F6e1cL88KrfcdJTuU6Ry4RQvsZThqf
X-Google-Smtp-Source: ABdhPJw7E68r54VI7ouDDm95huF1QdO4sQmXXeIfkayx2KO/JsrGt6zpZoyPCK64kHjFT6z42J0eMw==
X-Received: by 2002:a05:6e02:5d2:: with SMTP id
 l18mr9914666ils.294.1642365872541; 
 Sun, 16 Jan 2022 12:44:32 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id s6sm8275018ild.5.2022.01.16.12.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 12:44:32 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] linx-user: Remove MAX_SIGQUEUE_SIZE
Date: Sun, 16 Jan 2022 13:44:22 -0700
Message-Id: <20220116204423.16133-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220116204423.16133-1-imp@bsdimp.com>
References: <20220116204423.16133-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, richard.henderson@linaro.org,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's been unused for 7 years since 907f5fddaa67 when linux-user stopped
queueing any signals.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 linux-user/qemu.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 5c713fa8ab2..7910ce59cc8 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -89,8 +89,6 @@ struct vm86_saved_state {
 #include "nwfpe/fpa11.h"
 #endif
 
-#define MAX_SIGQUEUE_SIZE 1024
-
 struct emulated_sigtable {
     int pending; /* true if signal is pending */
     target_siginfo_t info;
-- 
2.33.1


