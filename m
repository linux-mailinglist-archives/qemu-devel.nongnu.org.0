Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008904889DD
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 15:25:31 +0100 (CET)
Received: from localhost ([::1]:37138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Z8V-0005oW-4T
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 09:25:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsoref@gmail.com>) id 1n6RWc-00077f-NT
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 01:18:00 -0500
Received: from [2607:f8b0:4864:20::72a] (port=36358
 helo=mail-qk1-x72a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jsoref@gmail.com>) id 1n6RWb-0007TA-EU
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 01:17:54 -0500
Received: by mail-qk1-x72a.google.com with SMTP id i130so11317010qke.3
 for <qemu-devel@nongnu.org>; Sat, 08 Jan 2022 22:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YpPHJO76NGwkQfcliVNnzVfZW5RgZTwVc1uwIp2avFw=;
 b=I4HW43sr6xwgfmA8h4BhAws2sXL0d+xLvXQgsklqvfWdJrfbTTc3yxbJ6VFqN1vclp
 hVel5jv0z78ydRbM8WeUeuDCeBzrdRpoYBs9/NjuFKV0sLmSM7vKNGoKoqDYq330ESs+
 1Xs7aQUYXchqB4fqzrcM11kydAOEPwHFErjAVf4lzk/pi0TmPQQBzcRzlV5Pkb0r14yv
 qV9gbctcOqTRIIE19tGnE+gr9IHcU1JoDYAwvhS0Ne+xqzX7ZA/FDyRuErqXtt0BKO8F
 Ga+8/yCEvws4eXlB3ABbzCV/LOJggOj+ORSwXL+gHzHsTtfLrEYPf6gEEDvjxN1b8rE/
 c3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YpPHJO76NGwkQfcliVNnzVfZW5RgZTwVc1uwIp2avFw=;
 b=s+Bc02JxIs8Euai9VUiaXMcls4C4uva9uM2VLesYBY3WT3FWfdYD6+vM9Jhn07or7h
 M7fm6gfSZVMUIk3Z13asMJtWgtM9Wvlno3OSrIfVQwG5Erkp/9bUVKt4chv3nCTVFRvp
 WfIIeDw8VB6YtxD73h0c6o2SrcCBOhgqYqvEJNFM7TvFLBI7O8DhR3HkAsemr9MSA9ec
 2pYLxHcg2aimzRuMwnAFiKwzUX5v5V1LAfGXlbfvzDYGI8KOBmiK210V6VQuKiNsaod7
 AACD1pKr487502lTwEWKBtLAXSp+rgcjekwqIr3kGeXMiId7zRETwPgzw6vniLxL4CGm
 Kmuw==
X-Gm-Message-State: AOAM532WlxRdk3JoPx32+dcaR0W5aHDVScMCUGcUKUlB/4DPxkbcjlff
 ulK9C6ir+DsBcC6I8SZkhlS31hnAKTapxuU/
X-Google-Smtp-Source: ABdhPJwhpgZg3KyTM0I+paxt+QKjM/DPvIyti5gotMNGO6jOiwzDZ7CJgXI+W2Ttb3mqx6timNkM6g==
X-Received: by 2002:a37:755:: with SMTP id 82mr48928466qkh.89.1641709067322;
 Sat, 08 Jan 2022 22:17:47 -0800 (PST)
Received: from localhost.localdomain (199-255-11-35.static.celitofiber.net.
 [199.255.11.35])
 by smtp.gmail.com with ESMTPSA id w63sm2169705qkd.88.2022.01.08.22.17.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jan 2022 22:17:47 -0800 (PST)
From: Josh Soref <jsoref@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] Limit lockdown to qemu
Date: Sun,  9 Jan 2022 01:17:08 -0500
Message-Id: <20220109061708.21481-3-jsoref@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220109061708.21481-1-jsoref@gmail.com>
References: <20220109061708.21481-1-jsoref@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=jsoref@gmail.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 09 Jan 2022 09:21:14 -0500
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
Cc: Josh Soref <jsoref@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Josh Soref <jsoref@gmail.com>
---
 .github/workflows/lockdown.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.github/workflows/lockdown.yml b/.github/workflows/lockdown.yml
index 37c6065..b924b25 100644
--- a/.github/workflows/lockdown.yml
+++ b/.github/workflows/lockdown.yml
@@ -12,6 +12,7 @@ permissions:
 jobs:
   action:
     runs-on: ubuntu-latest
+    if: github.repository_owner == 'qemu'
     steps:
       - uses: dessant/repo-lockdown@v2
         with:
-- 
2.32.0 (Apple Git-132)


