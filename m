Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F6044F76C
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 11:37:10 +0100 (CET)
Received: from localhost ([::1]:51478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmCsn-00053N-8X
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 05:37:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmCrX-0003r6-UU
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 05:35:51 -0500
Received: from [2a00:1450:4864:20::431] (port=47039
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmCrW-0000gY-G8
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 05:35:51 -0500
Received: by mail-wr1-x431.google.com with SMTP id u1so24326793wru.13
 for <qemu-devel@nongnu.org>; Sun, 14 Nov 2021 02:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5YcFKE54Fp6GP0sd+t0790pJNxFlEy/WRU5mL/Y67tE=;
 b=Je/UJ+AckXhzpfc7wSXAG/PRE35b8gO4/EW8TUml7QCVrcgvdua8lyWFuorUzuhbV2
 hknhuDOdywo/ngWpJqu5lMEOHf4vvLOMxE5cFHCrt8RWWSsKjD+RAVg+9WoFQXm5aBJT
 cWplKBSW2VdlMW8D/sIETMcTKsZgZ0LP+b4DgZx4F7xGE5OrK9qzeAL5jAoaxX1upenI
 EjCNnalxV3293sheC1E/8TygmrmI0GKis+/Jh5Lz8WJm13u3r+pz5M1Vm/nUtSTm8LO2
 QpAKOym97gqNfJFBbl3cwxQaLJ0BzXxO9XGR4vJWRrz87Wk9bnz6g/YLXk/92iUvP4tM
 yy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5YcFKE54Fp6GP0sd+t0790pJNxFlEy/WRU5mL/Y67tE=;
 b=4pba/jATvglIBe4bHIKSzW8khlEZ15tYmUemy4mpNA0Q4vvVc6rYJGMNZwcOn/gypD
 yPK0GVmG6ZNwW9TQ6zsn0Q3mnOJb6cHFWuUKtIcH35FNbZq4Muuk4/B8bG7JQAOTDyZy
 T9F8O6vxPVUPhUYeACOlSIIHqiAWRbLwVqVnaI4WzLAFbIxvzEneMTch3irNI9j1TYuB
 DMYj+DkxkHy9sPZpRY+z5+dJ8CANbEGnOnGeZeFVnu+fRJs1p9y6Fo0dfK9eOAWCsz8C
 aViIidjZ3bE+NItYVEORNAiTSyq/Ya2Nf6SWE1+Ne0MSP3UJAGGN8Cn1pfLR2xaxSkbh
 DjzQ==
X-Gm-Message-State: AOAM5309zmkg1IGMx177Ip40WWRL++Y48RSBqfUW0B0fCovtDgUWJ8yu
 F2n27zsg7PLpWVXdLGT4zQcRXKbqK0csmEXnHRc=
X-Google-Smtp-Source: ABdhPJxBnm9u+FI3bSkHrM0ImNK0cj/sDVrEr1CPzfyAiLKqYdznS7L+PNhCad6Jw8HIVe4NWIdnOA==
X-Received: by 2002:a5d:648f:: with SMTP id o15mr35045298wri.381.1636886148446; 
 Sun, 14 Nov 2021 02:35:48 -0800 (PST)
Received: from localhost.localdomain (60.red-95-126-179.staticip.rima-tde.net.
 [95.126.179.60])
 by smtp.gmail.com with ESMTPSA id x1sm10638852wmc.22.2021.11.14.02.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 02:35:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] linux-user: Fix getdents alignment issues (#704)
Date: Sun, 14 Nov 2021 11:35:35 +0100
Message-Id: <20211114103539.298686-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are a number of alignement issues flagged up by clang,
this attempts to fix only one of them: getdents.

Changes for v2:
  * Do not QEMU_BUILD_BUG_ON for size mismatch,
    as this triggers for i386 host.


r~

Richard Henderson (4):
  linux-user: Split out do_getdents, do_getdents64
  linux-user: Always use flexible arrays for dirent d_name
  linux-user: Fix member types of target_dirent64
  linux-user: Rewrite do_getdents, do_getdents64

 linux-user/syscall_defs.h |  12 +-
 linux-user/syscall.c      | 314 +++++++++++++++++++-------------------
 2 files changed, 165 insertions(+), 161 deletions(-)

-- 
2.25.1


