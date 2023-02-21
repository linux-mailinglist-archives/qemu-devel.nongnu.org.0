Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C5869EB3A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 00:27:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUc1F-0005Lg-2G; Tue, 21 Feb 2023 18:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc19-0005HZ-B3
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:25:51 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc16-0002hr-O7
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:25:51 -0500
Received: by mail-wm1-x333.google.com with SMTP id j3so2476555wms.2
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 15:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cOPVh2gJbusm2XsmCeCaqslHPbfLfSgGJBWGPz8N7FE=;
 b=lPbMzBd3uLSLD6hbU4KVIqKOa34CIa5lGYUtsBxbhnJ/5QDmFrb2P0ue6CToAkUfjM
 HyIj2gRr/SxacC9XmxvtqfDJhCRNxw9L39Ctv3x+PU7eUQ1NqnPmj0TDhC08Vseqwl7r
 pKQtFHTcZOTDPHDboDZ6N4N0+cv4SnNFEh56NIy0wdtQmeY9juCmhH1gvd0+5PyJkk3F
 tYUbKOzVkOQFTb91wILMf4wGz5HO9ufZbiNhCXMWI85WFpaBrAUBt2efTCGDfmAAzm9Z
 wxR4uC9L//iLK4Suzi2qiDUCQgho6BLr48dKDGrsD94CWSCr0v7l+LcFy9k1KovvEjdj
 Etyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cOPVh2gJbusm2XsmCeCaqslHPbfLfSgGJBWGPz8N7FE=;
 b=TLNvGEVQaSpMkeVQ2LCFo7wkqfHFldlqTRbKRjw3y1w8LRxLRbdJymiDAkNk6A6ihI
 W1ObzOc9tLr4+WVQv556VoWScTCmCvkxwPqxXph9aI8HOBXvi7bPRApuTPtOSDqi4FrQ
 hNA+/uaYxGDQP5aiSfhIREEtQI3M5jzY6qVdhjgshZ4ioxsfgjQtNfzzDawX3pzI6DE+
 qi9dy+taPCWtsIwY+bOIX6pJc8HRJSjrMEjVDwEPZjIL0HjpvUQI1CMdARxsIbssgvma
 UQ1fnm1cmj5H9jmMJwsouVi//4/MMhe74Z/8I1gEJYDNyfIDu+5iTz9T26j07+TkhsER
 9ZJw==
X-Gm-Message-State: AO0yUKWaDU+ZU4EL3dqAcDrMGDX4VticHWCUd72ua1M2OYVLYJ9s9/0C
 yOrt+pcd2KDDm3qnCJfwgctxtQCiwhH9s+sq
X-Google-Smtp-Source: AK7set8Oa0nK7D79P6HYfLhZYcSH5VvVspCejAKAYa7t8JpeC/wRlvepUz7mJVQV+cpWP1uxzutTUw==
X-Received: by 2002:a05:600c:198e:b0:3df:9858:c037 with SMTP id
 t14-20020a05600c198e00b003df9858c037mr4903370wmq.12.1677021945596; 
 Tue, 21 Feb 2023 15:25:45 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b003db0ad636d1sm17942737wms.28.2023.02.21.15.25.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Feb 2023 15:25:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 4/5] block/vvfat: Remove pointless check of NDEBUG
Date: Wed, 22 Feb 2023 00:25:19 +0100
Message-Id: <20230221232520.14480-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230221232520.14480-1-philmd@linaro.org>
References: <20230221232520.14480-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since commit 262a69f428 ("osdep.h: Prohibit disabling
assert() in supported builds") 'NDEBUG' can not be defined,
so '#ifndef NDEBUG' is dead code. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 block/vvfat.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index d7d775bd2c..fd45e86416 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -2784,13 +2784,10 @@ static int handle_commits(BDRVVVFATState* s)
             fail = -2;
             break;
         case ACTION_WRITEOUT: {
-#ifndef NDEBUG
-            /* these variables are only used by assert() below */
             direntry_t* entry = array_get(&(s->directory),
                     commit->param.writeout.dir_index);
             uint32_t begin = begin_of_direntry(entry);
             mapping_t* mapping = find_mapping_for_cluster(s, begin);
-#endif
 
             assert(mapping);
             assert(mapping->begin == begin);
-- 
2.38.1


