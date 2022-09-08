Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABAD5B1F64
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 15:38:44 +0200 (CEST)
Received: from localhost ([::1]:43728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWHjs-00086O-Cg
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 09:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWHa8-0004Xp-62
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:28:37 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:34342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWHa6-0002bZ-Os
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:28:35 -0400
Received: by mail-pf1-x436.google.com with SMTP id e68so4880017pfe.1
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 06:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ufiJI7bNe+lQgV+yCFrf9iuYn0PLp3Pbem/SenhzEaI=;
 b=lUC4X/yvHoCbgZgzsoQIXpoLTrg/7AGNyT3G6VLnKLmEO4YJ5yUDsZwVu6OjBofMdN
 N126RVBBKQ2v3b2NvT1wVG/pRgnPdQPwkRRTaK6QMs1KinqUa0ymfM61xDo/ICVWcarj
 Udw8/dEoAomL0zMXtxf7rcUDNKJ4MnI0jagOXDmUlsqXaXRrIR+zzM4jWWsMNWkLR0GG
 sQyyYcPZpp7dDzJoQ32ssLV+n7/z9TqKLwbLYdjS/KIklyWMjYoaqP0o9Qr2zcuZBpWw
 1PKmv6SgwAu5hAtgJ4oa2DwjPAMHhI/DAL5Hv7kQGp3ZtW6dIOCWeGiyEzLxkbGG7+lc
 I70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ufiJI7bNe+lQgV+yCFrf9iuYn0PLp3Pbem/SenhzEaI=;
 b=JfBIc1kVHPFJwhYorFiiFus64uDxjeetHe8zFT5HMY8/oopFZU5lIdsR2LOYZDSOJx
 ipReIZum7EEvQiVFUTsponrMFG2JAkvRS+G0eDCm2XXXshhH9+KYyWo5WnjMxsaaEXIZ
 5OQ7O3Ynu5x0iTA6nj0uOLlxOQn/237Ir3FgZTPgNLnflJpbVMiOrkOBHKbWv2t1REmR
 fNfbA0jFVU/+Bgs17ragwG1sTYCVs8jz8PN0AA0HiWT5fk7aEflH+bld+LebHynQj90i
 lsIwGagbdiDD30s3I2e8zGLn2RFwsnJc74iiglyPVFzUDTg6HSbgmrT4E+m5HHH3nc4H
 iIPw==
X-Gm-Message-State: ACgBeo3yDol9QpzZpHeFnS6N+WGBWkYY8GTFJoFjFJIBhIIploK6nRML
 uo/kzs+AaQBw/ixBKp1Q+5mNeJVeW3U=
X-Google-Smtp-Source: AA6agR5D1uCKJmL08JxA5tgtAB/9dP0Dqbv9FE7s7QsHnk/d1Bortfr9POXn+vyzDD07HnLGpWkzZQ==
X-Received: by 2002:aa7:87d6:0:b0:53e:79bb:feb2 with SMTP id
 i22-20020aa787d6000000b0053e79bbfeb2mr7722973pfo.13.1662643712928; 
 Thu, 08 Sep 2022 06:28:32 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a170902be0800b001755ac7dd0asm1731693pls.290.2022.09.08.06.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 06:28:32 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 4/7] .gitlab-ci.d/windows.yml: Drop the sed processing in the
 64-bit build
Date: Thu,  8 Sep 2022 21:28:14 +0800
Message-Id: <20220908132817.1831008-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908132817.1831008-1-bmeng.cn@gmail.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

The sed processing of build/config-host.mak seems to be no longer
needed, and there is no such in the 32-bit build too. Drop it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 .gitlab-ci.d/windows.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index da6013904a..86a4339c48 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -60,7 +60,6 @@ msys2-64bit:
   - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
   - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
       --enable-capstone --without-default-devices'
-  - .\msys64\usr\bin\bash -lc "sed -i '/^ROMS=/d' build/config-host.mak"
   - .\msys64\usr\bin\bash -lc 'make'
   - .\msys64\usr\bin\bash -lc 'make check'
 
-- 
2.34.1


