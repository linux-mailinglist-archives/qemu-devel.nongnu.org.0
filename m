Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD742951D7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 19:54:19 +0200 (CEST)
Received: from localhost ([::1]:45408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVIJW-0005oR-41
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 13:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kVI3u-0006XS-Di
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 13:38:10 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:36108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kVI3n-0006SW-8v
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 13:38:10 -0400
Received: by mail-pj1-x1041.google.com with SMTP id kk5so1496722pjb.1
 for <qemu-devel@nongnu.org>; Wed, 21 Oct 2020 10:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cq0uFj4EPvaT7XIB2x7QEFAKMyx7fIErYUcL6pVPEzc=;
 b=po62ZWJ6LgSyaqPvF3x5MXfuM60Mjuv5Ee17slzQ/bZr+N7matQ3T04WsaEyfUI8Y8
 xdBsRovJnjo5Dmb/YJljo60fpnsuwmmQOzU8A2enOwQiGCq0yK3q5UXv5IaFHc7xfiQK
 3brDhkYNFiG1R7BFzvW9ayf6GF7IRtsQK0I59Erk3uefsVdH+pj+qTqHH8tFhvOYhWJ+
 EhjA56n7gyOXEEonAKLQLjVXVuweOWSwLQdtgSAnwY4/VdxGPajwweoRT/x8WzzuVOXQ
 raejHIA7fjgGh0HgnNCpEV0E57UZD+lUa4cGYrjTV/igD1z2MpweGkbQS5ESG4pM3xTu
 Uojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cq0uFj4EPvaT7XIB2x7QEFAKMyx7fIErYUcL6pVPEzc=;
 b=bNMl1BLOQsyl5RpvPSU+3K9no/tFcYcwpkViLEWnj1DDx/ZFwPFBo0qJ62J7prJq1D
 kR1c+LJlYyllNV0ZV1oXXTdJab15Jh/AMH7Ckdyx3hfrrtrIn/BQj+9FWbved0x3Mmw4
 6pEf5ebch7zdCTCRqUU6Y3drZI/iykBs4GgyBTm+mpCJCh1uHXkBNTCKKeCKuB9SUGm6
 7mWuQEFmyeoNYr5ospoLwoEPr8ahXHtEYJY39mHQvZ0F+PDhFyI2Id8JHR3KPuQ1ZSnq
 +wry8ySDmyfPD9XXhahI1g2zegOui4ymYgt6eBUwAa0eN5W5Kf735HNrdk+mgjmmwDW7
 vd6w==
X-Gm-Message-State: AOAM533hpM4SfXpmLTDzV9Srpg7qSlEfr0A5E06v1qMiJ9VKsUVrlhkp
 ct0XaH2EjrZxebYwjjZ9IzsVr/iS8gzgiw==
X-Google-Smtp-Source: ABdhPJwT9a36e/RjUA37+rDlhMgUUTttda8+JYppFpgYOcs4BIpMO30KV96l7FOFvfceqiU2fJgZfQ==
X-Received: by 2002:a17:902:7882:b029:d3:b3bc:9d8a with SMTP id
 q2-20020a1709027882b02900d3b3bc9d8amr4738555pll.46.1603301879987; 
 Wed, 21 Oct 2020 10:37:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id h5sm2928829pfh.9.2020.10.21.10.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 10:37:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 06/12] linux-user/elfload: Adjust iteration over phdr
Date: Wed, 21 Oct 2020 10:37:43 -0700
Message-Id: <20201021173749.111103-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201021173749.111103-1-richard.henderson@linaro.org>
References: <20201021173749.111103-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The second loop uses a loop induction variable, and the first
does not.  Transform the first to match the second, to simplify
a following patch moving code between them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 290ef70222..210592aa90 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2426,17 +2426,18 @@ static void load_elf_image(const char *image_name, int image_fd,
     loaddr = -1, hiaddr = 0;
     info->alignment = 0;
     for (i = 0; i < ehdr->e_phnum; ++i) {
-        if (phdr[i].p_type == PT_LOAD) {
-            abi_ulong a = phdr[i].p_vaddr - phdr[i].p_offset;
+        struct elf_phdr *eppnt = phdr + i;
+        if (eppnt->p_type == PT_LOAD) {
+            abi_ulong a = eppnt->p_vaddr - eppnt->p_offset;
             if (a < loaddr) {
                 loaddr = a;
             }
-            a = phdr[i].p_vaddr + phdr[i].p_memsz;
+            a = eppnt->p_vaddr + eppnt->p_memsz;
             if (a > hiaddr) {
                 hiaddr = a;
             }
             ++info->nsegs;
-            info->alignment |= phdr[i].p_align;
+            info->alignment |= eppnt->p_align;
         }
     }
 
-- 
2.25.1


