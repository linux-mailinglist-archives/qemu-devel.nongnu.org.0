Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2414037FA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:38:03 +0200 (CEST)
Received: from localhost ([::1]:51132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuxu-00086g-L0
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuaQ-0001zN-22
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:13:46 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuaO-0001jU-A1
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:13:45 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso682667wme.4
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NeR77cPP8dHJ6y/NZzKUpgxfmomQXUZFqq15ts9MaO4=;
 b=Vi+Rsrp6GRi6Bm4dyvy2NuZedDaeAWvK/Xbrk8wKmMmIht5aVBHTtZM740IHXHXeCL
 qdQ+NZUgAk2NABjQYV1w9bOkwM341r0VRkwo+/30ExGETZAFyB7ZZLo6AYzmM+6Xjjx2
 Qe0ixS1BBEEWI99epmqjrPPGXBZ4Unm60gYwO//KfLEtLPp9YGSxLRWiwJuyIZm5+/tr
 DOo1ZKthu7uOmEKiKYxRIpCjAnbwMzn14rkd57tds5e2BcbgU1va7LfsMcJQS4zcyJ07
 hqy0UZKBEYGZ3FWPdaKgP7FWKBFB7yxdtUpuY5v4v28k+cdsOj6yDOarMDX4b9Khq1wm
 77kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=NeR77cPP8dHJ6y/NZzKUpgxfmomQXUZFqq15ts9MaO4=;
 b=DoAZ9AXdznMvkgVrDuNyyva+1NDiXVV0c9/8gIAiyEUDRdG6FdrsOWdsU/FHm+s6XA
 wzzNxtkN+orBS+MqPPJfSmj9bq3531q2zTq4WTe+Vw+WwQIatoM1LZgv0AT9609pSEUu
 537XPI5eJuy2Rjpn4ByzVDq+A+S/w/A9NyH97gyGk3T1ZOAmgjWfA/+3JieWM2e8mWzP
 6C6yAGTI0Axpror6h+dRViANL545rCuO83jFREB6oiCgc09UNdDGQH7xiAQ6WnNffZRG
 UNjTmyJRV4h/CSGdH+OdW9TOFUlfwm1YxbG/JvAaPSF09T+3PfXfoOgyl5axhOXZs5Y9
 gKiA==
X-Gm-Message-State: AOAM530TAnwJpYHg593+j6XtvdvMRlUsiglXPz6xvQ5+oF2o1tS+PIPM
 Ld2XW9kvtGsRkoSDiizTg4FQHnjC58Q=
X-Google-Smtp-Source: ABdhPJxb/V+/Zmbf0Nh2XyBUzRI7RfXUJq18HmiFhZQ7fyej6q7N3R1VmzrAXdHa5cnhFE6u5vu5rg==
X-Received: by 2002:a05:600c:b4e:: with SMTP id
 k14mr2825131wmr.139.1631096022663; 
 Wed, 08 Sep 2021 03:13:42 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w9sm1711370wrs.7.2021.09.08.03.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:13:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: do not use python.full_path() unnecessarily
Date: Wed,  8 Sep 2021 12:13:32 +0200
Message-Id: <20210908101332.272955-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "python" variable is an external program and can be passed
directly to custom_target.  This avoids the need to look it up
multiple times, which was previously silent but is now explicit
in recent Meson versions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 ui/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/meson.build b/ui/meson.build
index 7d25c1b95b..7faa42eb3f 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -134,7 +134,7 @@ if have_system or xkbcommon.found()
                   output: output,
                   capture: true,
                   input: files('keycodemapdb/data/keymaps.csv'),
-                  command: [python.full_path(), files('keycodemapdb/tools/keymap-gen'),
+                  command: [python, files('keycodemapdb/tools/keymap-gen'),
                             'code-map',
                             '--lang', 'glib2',
                             '--varname', 'qemu_input_map_@0@_to_@1@'.format(e[0], e[1]),
-- 
2.31.1


