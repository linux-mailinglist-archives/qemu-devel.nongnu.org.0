Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40540418B5F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:03:51 +0200 (CEST)
Received: from localhost ([::1]:34368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcFS-0000p0-76
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcCx-0007L5-R5; Sun, 26 Sep 2021 18:01:17 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:47016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcCw-0000SR-2C; Sun, 26 Sep 2021 18:01:15 -0400
Received: by mail-wr1-x429.google.com with SMTP id c21so16666238wrb.13;
 Sun, 26 Sep 2021 15:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cdB/rvCtSCkcR/jEEKmrrikvKmPhFYjvAhhgdjOkfg4=;
 b=NeopsCCYodOSPfsM9NswK1jC9GAaOrazMSCgj1LUHhrC92gPWdo/ZdLLafN5CMV45J
 Tn/uZ6Hn/mUlt2qsnn4HSP2Djbd7TT/Fvi89ReTIaBcYBKFlDhkJM4amlDybrJuhbCAf
 1LvIFC93NXNTUS7DFSYWFXscP4k+m/KeeW7r7RmTFQUl1y53+TuSt2xkcqLChXv1K+bS
 Bdw9nkBot+Z528QJ4Nrk9wgI3Y75tM9+lMmnkLL15E4wZ5DMKy8OOC6T0zeVoAeB+pVU
 TgtxA0IOBPCYg60/2xbtoCuk7XutUnEgdb5xDwIk0nPEJHtxNPYHAoZCiroECS3c45iP
 2sOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cdB/rvCtSCkcR/jEEKmrrikvKmPhFYjvAhhgdjOkfg4=;
 b=sQSWqMD88B4YfpwPFAF8GtuIIv8tCrdi4F/U57TsfAZ+x/At2RYCRYac29JGr7QAbV
 NHjbzu1PAbtz7S0PZ9unrOCJ104oraWvcMifmSw2UO1cFl8+0RQS14yr8crC8STQv833
 6z+zetaS7K6iYkCpPzDIYK9K0eeHrZq5IJaK7mIvXpKAf0Vo3mnhZ5UPgAfxrM5fMcts
 nii+N/v8DIsrcJZj7v2sHriKdLDvp8jJjEWeo47jLaKSDr2u0MfWkIv+Hru8PZRGRyaB
 qWt18tLBMSOyWeFY+pV06gn8WYZIc+HvLbIyJ7aoxc8XYioKZvutQhLbu2MuUKJPnXwM
 fq/A==
X-Gm-Message-State: AOAM530yP5AkXD+ah64/mMI7tPeFMdlyqlXHdB6ynjLHGD4WZctoXViB
 W0ziZLMhZGrbevTxq9YN9aMxCXTQnms=
X-Google-Smtp-Source: ABdhPJwlvAFsEib085mDzhSWUeOaPKChuBewsMP/FlraRIfKzgs0gEhVi+AnH7dS55EYAz3dDljG3g==
X-Received: by 2002:a5d:6450:: with SMTP id d16mr23480742wrw.40.1632693671040; 
 Sun, 26 Sep 2021 15:01:11 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 j21sm14575024wrd.48.2021.09.26.15.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:01:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
Date: Mon, 27 Sep 2021 00:01:02 +0200
Message-Id: <20210926220103.1721355-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926220103.1721355-1-f4bug@amsat.org>
References: <20210926220103.1721355-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reported-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 bsd-user/meson.build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 03695493408..a7607e1c884 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -1,3 +1,7 @@
+if not config_host.has_key('CONFIG_BSD')
+  subdir_done()
+endif
+
 bsd_user_ss.add(files(
   'bsdload.c',
   'elfload.c',
-- 
2.31.1


