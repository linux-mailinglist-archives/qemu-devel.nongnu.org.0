Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683EA4472E2
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Nov 2021 13:50:47 +0100 (CET)
Received: from localhost ([::1]:44066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjhdF-0004mI-6b
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 07:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mjhbM-00033A-SI
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 07:48:48 -0500
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:33783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mjhbL-000264-Ci
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 07:48:48 -0500
Received: by mail-qv1-xf35.google.com with SMTP id bu11so10314894qvb.0
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 04:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qbm5AknCqi5/JlcqT7Octf0A6tY4dKBmRkrVQp9thH8=;
 b=oRwVQAhJESGETjehjHcqJLJrrzuXOaANH3z8r3PpSJ5EkJSPqGT1/UWJHsScZPFWie
 LUutgfdD+YmXOJJzskOna2/cH7ZLIdbEDGTpmZbDO4ter6Kir0rZu1A6M2UlFyu16a4I
 rLzxTzyug2suCKGMO6Vub6FPZjyfqMkOctRbL6RUUpftu7+dFwFKnFo6VRWcTflK8EeL
 QjCm9PVlldj+5Uzeff3dUXfGGCrNlUJGTs46QVHNzID42EtVscT299szlLCs4uRMoKAe
 3tG8ds0XA42tyOwFXkmwUJYujU1lTkv62JgGY0nPYi8nQ/9h9zSk2wvY8FEgQxuIRNmS
 eTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qbm5AknCqi5/JlcqT7Octf0A6tY4dKBmRkrVQp9thH8=;
 b=oE3HjqKh/O8yVRbEQYqXVKX9xUClOqGOnQ0VjGYvLV6uPi3QgvArUR0pD/+FapnzWU
 xXkLrsgN5yAAtwvk7m0BG1uPjnXXDWHfVB4vLtq6aZt9I38XjZQU8AmuKiPKO383azd5
 wHdpINR2UhNbZBdVYYGRrejusoRsmwoo/RCkXasTbNIyYDzEXi11Q5bOGLPt2tdohIvZ
 gWRNCRq75IqdUrpc19xKQ3raArPVhesCJeERAz0a2OscU8A/iXKh2aCgD3aSQUQA6uDH
 EKC5SYqgAZBH9PEddiaay4aNQHAETh19bkhTTE01o562XUquS5SGdQrNNaw5wEPcAIgu
 yxpQ==
X-Gm-Message-State: AOAM53022znQtfCxbzpDW1woTWbh44kqaXz5S7DpBtU2XTuwXHDTDxKB
 1GcVRQOFFx0lx1jk5ZHITVAyFLTmtuyC6Q==
X-Google-Smtp-Source: ABdhPJywSm7odJHgm6R5DWQ63Qd4M3dqv+PYcDQWmFUSG09oW8iFf0Pa/cM7MmNOgw0MEnUwRSrvFQ==
X-Received: by 2002:a05:6214:2429:: with SMTP id
 gy9mr20687757qvb.36.1636289326192; 
 Sun, 07 Nov 2021 04:48:46 -0800 (PST)
Received: from localhost.localdomain ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id w19sm6917qkw.49.2021.11.07.04.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 04:48:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] linux-user: Fix getdents alignment issues (#704)
Date: Sun,  7 Nov 2021 07:48:41 -0500
Message-Id: <20211107124845.1174791-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: f4bug@amsat.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are a number of alignement issues flagged up by clang,
this attempts to fix only one of them: getdents.

r~

Richard Henderson (4):
  linux-user: Split out do_getdents, do_getdents64
  linux-user: Always use flexible arrays for dirent d_name
  linux-user: Fix member types of target_dirent64
  linux-user: Rewrite do_getdents, do_getdents64

 linux-user/syscall_defs.h |  12 +-
 linux-user/syscall.c      | 290 ++++++++++++++++++--------------------
 2 files changed, 141 insertions(+), 161 deletions(-)

-- 
2.25.1


