Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702D52B7B20
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 11:23:58 +0100 (CET)
Received: from localhost ([::1]:36924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfKd3-00059t-E0
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 05:23:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfKZ4-00006J-5M
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:19:50 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:46820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfKZ2-0003fG-MA
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:19:49 -0500
Received: by mail-ed1-x529.google.com with SMTP id t11so1361471edj.13
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 02:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ro2xCmN/EJvdzHE9V9WTlpTshR3d4chs+wdaUY0VcCk=;
 b=hHcWkEnKjOrpBGsmEutclrdFlrEZym4eaPKLO4jAJRtPRW7weQ3VkJccdRvoKhPRVA
 TaDdORmwtsuKhpJQZhVqH5tEGiT300Uv8Qr0X0NCrnp3gOW5hKjn5N7vSd9N0bdKuxQ3
 XyrJBqTkees4Y4t+exKlo8+oURSPw6hcQd9OZp97bNpXeH9+Uv0mgM0MEeHnjJUQ60X2
 Y3d1EgWPj0U5LoysGEtejS0KYvbRhBaHhW0zUPXdhAtZfDTrfrJsFMEs+JDy4p9oNBqY
 /KTP9TENKjtNZtdK9+PvY9YtMOViWXdZLsoTh4dIsIAll4jr9G0U3OCaLZ+1nAPrzK6n
 2lJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ro2xCmN/EJvdzHE9V9WTlpTshR3d4chs+wdaUY0VcCk=;
 b=YJPFB/BxFTU0F1sA2ch3psa3vHKQLvDRPW73KNfbZuQU5wLGLS6s9HH0oLY00XE5PE
 IRFXvyu3zfEPCk3cOyyc/Z28KeyqcCJgQPUYTj9TbUcCfGu7MhB6DUkh4QgCVxlrSWSI
 dxELb/1kBX53QBUffx4eVvQwVnOKF2Lum8Od4Oa7IVlSS1+KgHq3uB1xvJ6LgOEtMhk1
 F2viyoQKShN6rcDw8FBSHyDWwRLEmbOWHKFxL8SRzT4VXgvOA0C/Lr2gRFAJ5aDeL2Lm
 K/BHaIMsMpx2gvHhkjdrjjPAAxTh80BWQqqKppK8xpl4p+hgnaRNas5CRp+n+IoEKvX1
 UUxg==
X-Gm-Message-State: AOAM532YwCb15W80PfXflpqbTOVh5FI4ULeap89dzu9mrYUkdNtyUe0A
 2MWd/Q8ndqA0fK/KZhcLB9WAvecQvAU=
X-Google-Smtp-Source: ABdhPJwbB+oqC783mUkRqH+qdUflEfLC/CAt+HC29yuU5fOknb4ANaRjIaT3uwS455B/iF+mlxUowA==
X-Received: by 2002:a05:6402:559:: with SMTP id
 i25mr27342744edx.128.1605694787083; 
 Wed, 18 Nov 2020 02:19:47 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f24sm13230052edx.90.2020.11.18.02.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 02:19:46 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] meson: Fixes curses detection on msys2
Date: Wed, 18 Nov 2020 11:19:37 +0100
Message-Id: <20201118101940.132594-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201118101940.132594-1-pbonzini@redhat.com>
References: <20201118101940.132594-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

Fixes regression on curses detection in msys2
by commit#925a40df2828d32d3aaaf022282cba81082fb263

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Message-Id: <20201116213106.589-1-luoyonggang@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index 7ddf983ff7..5062407c70 100644
--- a/meson.build
+++ b/meson.build
@@ -490,10 +490,15 @@ if have_system and not get_option('curses').disabled()
       return 0;
     }'''
 
-  curses = dependency((targetos == 'windows' ? 'ncurses' : 'ncursesw'),
-                      required: false,
-                      method: 'pkg-config',
-                      static: enable_static)
+  curses_dep_list = targetos == 'windows' ? ['ncurses', 'ncursesw'] : ['ncursesw']
+  foreach curses_dep : curses_dep_list
+    if not curses.found()
+      curses = dependency(curses_dep,
+                          required: false,
+                          method: 'pkg-config',
+                          static: enable_static)
+    endif
+  endforeach
   msg = get_option('curses').enabled() ? 'curses library not found' : ''
   if curses.found()
     if cc.links(curses_test, dependencies: [curses])
-- 
2.28.0



