Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D356B568511
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 12:18:29 +0200 (CEST)
Received: from localhost ([::1]:59528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9272-0005Pe-MN
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 06:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o91mI-000465-3e
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:57:02 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o91mF-0004PO-0v
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:57:01 -0400
Received: by mail-pl1-x62e.google.com with SMTP id b2so13226429plx.7
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 02:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=01Nyom6yoLGNGVnXTZeIAd8RiQBEHUb5nFzwalrIP40=;
 b=iOj5Drxgrd9V4FuMbVR/0R5WQhXHXoUXcyNZo+Vtg1GDNroPiVn6PeEAwqiwdutPvG
 ird0d8QRWhQQe4eWMepCuq99eniC1wZ9SCMARqqkRRfSOCR2IKk/TSkM1bnSuaHB1y/j
 O6NgPQ8d5zKfc5cBA37NCWjRBvLkM8VRp5HBXi4MS6VP8a2cPilBFDR4j2UiSeK3pgcM
 UtQdKMDZHglCoAhv0xQziiYOMQm1bPNGT7TVjrw3XNTgTnfRC6Q7zzEcHLQhmC09zSVn
 LrJDrTff7z2K7EpKGhTPoH/mt0Z+q3ZAk25rYhWhUdgPPBXkH910XrgJqup4EJ2CZCXY
 sKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=01Nyom6yoLGNGVnXTZeIAd8RiQBEHUb5nFzwalrIP40=;
 b=TBNjqaIdHKNAzD8QPlSIabCcPVscKmVsKwFkaC53OKk1F8jhnw7zUGRjQ8vcvOQbLY
 g20E9Lcw6eX1GXLnPp8srxnrWwZP8C1ba/R0U90yyBmO4riPL6RDfh+753x/AjJfVxMx
 fm+lrAq4OO+HlhrxyFJDBqxFpUZeGFpSLMDTQomRQi4E+SNVGnTv3Q0hZS9LYPnyZOUl
 F0EQyoM1Je4n2MCBrvCNRKwTduL0gy/+CM/eURkh9Z+X7KjFixvbJ3IlGlrhr6Pofjk1
 r/rSRwPUp1bzyz8siMA09vGmRKuWTmCXIA3N/yBhj+nzM7ueu6Pl9QGBrRNe9m1cgkPR
 Y9zg==
X-Gm-Message-State: AJIora85YZVedj3i+jJehAJeisvV5fsZ9+HZTm6U0zriJ8hA2CHtc6SO
 W4LPpK2IdXMwJ+Ppwfsj48rp
X-Google-Smtp-Source: AGRyM1vAPDrr29FVndfKi7m4aA9XQqgsmb2YNiXSUAIRSMHLuo80zFhH7uek6KQifS8GKpsa74iSuw==
X-Received: by 2002:a17:90b:2152:b0:1ef:9c75:66d8 with SMTP id
 kt18-20020a17090b215200b001ef9c7566d8mr9708325pjb.5.1657101416041; 
 Wed, 06 Jul 2022 02:56:56 -0700 (PDT)
Received: from localhost ([139.177.225.253]) by smtp.gmail.com with ESMTPSA id
 g2-20020a170902934200b001624965d83bsm24901318plp.228.2022.07.06.02.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 02:56:55 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com, stefanha@redhat.com, armbru@redhat.com,
 richard.henderson@linaro.org
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] Fix some coverity issues on VDUSE
Date: Wed,  6 Jul 2022 17:56:21 +0800
Message-Id: <20220706095624.328-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=xieyongji@bytedance.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fixes some issues reported by coverity.

Patch 1 fixes a incorrect function name.

Patch 2 fixes Coverity CID 1490224.

Patch 3 fixes Coverity CID 1490226, 1490223.

V1 to V2:
- Drop the patch to fix Coverity CID 1490222, 1490227 [Markus]
- Add some commit log to explain why we don't use g_strlcpy() [Markus]

Xie Yongji (3):
  libvduse: Fix the incorrect function name
  libvduse: Replace strcpy() with strncpy()
  libvduse: Pass positive value to strerror()

 subprojects/libvduse/libvduse.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

-- 
2.20.1


