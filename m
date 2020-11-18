Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED672B7B13
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 11:19:46 +0100 (CET)
Received: from localhost ([::1]:52224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfKYz-000890-5P
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 05:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfKXl-0007hA-UP
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:18:31 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:40111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfKXj-0003Vb-PC
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:18:29 -0500
Received: by mail-ej1-x644.google.com with SMTP id oq3so1959220ejb.7
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 02:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sd+KbqAl/aGjUIBxAtEdS6RosH6j007HGWuav7Zz30I=;
 b=I6A+tXGRozIF9zh3JNhHtG5jg9BrLrqtyos8t9zZYZP2VSRq3V6re0/C5Mg09W4U/q
 qbiF/xnYGT2HDpO/vmvnrL5GrA3lI2R1skwq+kFmth8ORb4JZB2kr2qJ7rzuaojkuwJ7
 XU8USjqPAWKZ8nOSerYOPUcfSGVWHBZMK0vjiQeeEjWMu90Yhl0Tnho8siCMVe67fNo9
 L2SnZJ5MIC9LO9b1OKmoHlKZG03EC59+R+zKzly6BO8buCKqy2Sq2aw3v9/4BT5EjxPP
 +9I9Y7wJeccc1AzYQ34Mvamav8FZxPxh8ud8/xZyCSCDrvPkj2brHT9MShUF4mArWAd7
 omcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Sd+KbqAl/aGjUIBxAtEdS6RosH6j007HGWuav7Zz30I=;
 b=ZrNBnAMRIAmR8EWCpoI7zrqIXc0y4eH95CG3oZdBZD8dYf1DAM1Li3Wf+zCTgoAwOB
 paKVSXZSNcR+svLoSEDBve2MdYyFg/85syt5pBtwpConln1cUz0L3jHOe5/ypW8BwBbt
 9nmmY+b3LZLtb+ATTGVaXK7fNUZv/09KY3zwKiUBj0mkzb7HJvp0/X4UmMq5gakHwqZG
 AgRYTDiWyI6T9i1TwLzm1A3/bGkqpQXCOkdMKeiFFN6hbJ+UfUcvEleGDhPxMjvgkJST
 bkp+Gs6TMA9tdgbqCX5l30rZVcOAM+PFoNxChhEWuxW6t2svYnGSBvKFVF3mIRCfDBWe
 ODfw==
X-Gm-Message-State: AOAM5320jb6cneEKcNK73biWtTfCU5ozMlCdWpQsXsqZojfPJEs8rmdh
 YRWwZ39mrYP0rqSU1AwKQJ6hYdEAN8E=
X-Google-Smtp-Source: ABdhPJxmkWCoYgIXPAC0xitjuP8uHotJP8VdSoVz4/CGR5HiX7vnvaNnIowX6E58dxRDwpDny1eBgw==
X-Received: by 2002:a17:906:5fd6:: with SMTP id
 k22mr5050939ejv.333.1605694705006; 
 Wed, 18 Nov 2020 02:18:25 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s21sm13791021edc.42.2020.11.18.02.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 02:18:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] cirrus-ci: parallelize "make check"
Date: Wed, 18 Nov 2020 11:18:21 +0100
Message-Id: <20201118101821.132236-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Otherwise, the tests risk failing due to timeouts.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .cirrus.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index f0209b7a3e..111e19f1bf 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -29,7 +29,7 @@ macos_task:
                    --extra-cflags='-Wno-error=deprecated-declarations'
                    || { cat config.log meson-logs/meson-log.txt; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
-    - gmake check V=1
+    - gmake -j$(sysctl -n hw.ncpu) check V=1
 
 macos_xcode_task:
   osx_instance:
@@ -43,7 +43,7 @@ macos_xcode_task:
     - ../configure --extra-cflags='-Wno-error=deprecated-declarations' --enable-modules
                    --enable-werror --cc=clang || { cat config.log meson-logs/meson-log.txt; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
-    - gmake check V=1
+    - gmake -j$(sysctl -n hw.ncpu) check V=1
 
 windows_msys2_task:
   timeout_in: 90m
-- 
2.28.0


