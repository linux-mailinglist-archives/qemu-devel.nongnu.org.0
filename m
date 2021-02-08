Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40003314282
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:04:39 +0100 (CET)
Received: from localhost ([::1]:40038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ee6-0001QG-8L
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCP-00037y-HE
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:49 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCO-00067N-0U
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:49 -0500
Received: by mail-wm1-x32b.google.com with SMTP id i9so69391wmq.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C8pY6ef/gvyMoBxKzaS6s9owrZc+gVZ4zdWQxqRNCqM=;
 b=Lg5aVtxd+pXASqhBnzwMTpz7NHTCV+QDuZ+AZSn0FXBgQlxaXHKuMc0Aw9B+NeoDK7
 aPhuVijsp1MAQ5SbcU6AMYdEEdB7rnNI9wik/f8gev0AKa4p4mHFRoZGl4HOMBWacpVd
 YPTTHCRPIznShJD5//MSW2Hm9fBSLn8trROf1r60OZi7I7+ZrrmHik2P6ZRG5bdpdwJ2
 NM7BEHmFx6Gz+ywVtPmcfrc31e+ZRi4/kV8V17q5Ht/c60vwMxLtfdu7WyCGTveX7uTL
 P8d6xrwABut0hM6v3QagwxiGFdh7Dm/didBL5nvb8VqVOsh6xZUh3CH+RveXv2zp1ypJ
 PnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=C8pY6ef/gvyMoBxKzaS6s9owrZc+gVZ4zdWQxqRNCqM=;
 b=Tg1KlGjq9O2cfokNxvoGZ3pj/OmSdRsvLvWgr6NnioXciCiYOwiPrjqPJUXH1oi3ov
 yHX/iFucsqrtYZ6KDWvofu0Ov9Fn6B4F5deY/vPcWM8YHhLk0Kxfl81+oHZCd7m+oeoO
 dxZReUBe4T945KvZuPxiHDtT1mGcYgLFC/PPOdzWx4UpY12t25DFu88Mz7u3F1OF4A0R
 51byMCY+DJ7lqElfYwjjOJGGkli+x1mZUr3sK18qeTNds8rDoCgf9g6Bh391WAKcn/bZ
 SeaO4Y8s5D1a7N+KrXtzrVJDKF7MqyBZRj6f7DM8JE+QNNPyt6V7vPH1slDRpefJ2DVf
 KDPg==
X-Gm-Message-State: AOAM532VQ/ydADRq4RChazFHM+vlaSnonwfJ6vHJXq4KOYiz9fiWgt5Z
 I4dpbwL8dXnIWiC4rXrYgCifz+6KS8qDwg==
X-Google-Smtp-Source: ABdhPJztnVW1YIFUlQFbLYkn8D7QetBtNxbEQUuqnViR/6cedBjLYXYbiClAKTpMIZZY6TnjDek+Gg==
X-Received: by 2002:a7b:c5cc:: with SMTP id n12mr40617wmk.123.1612808626648;
 Mon, 08 Feb 2021 10:23:46 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:46 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/46] docs: don't install corresponding man page if guest
 agent is disabled
Date: Mon,  8 Feb 2021 19:22:59 +0100
Message-Id: <20210208182331.58897-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Stefan Reiter <s.reiter@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Reiter <s.reiter@proxmox.com>

No sense outputting the qemu-ga and qemu-ga-ref man pages when the guest
agent binary itself is disabled. This mirrors behaviour from before the
meson switch.

Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
Message-Id: <20210128145801.14384-1-s.reiter@proxmox.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/meson.build b/docs/meson.build
index bb14eaebd3..f84306ba7e 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -46,9 +46,11 @@ if build_docs
                           meson.source_root() / 'docs/sphinx/qmp_lexer.py',
                           qapi_gen_depends ]
 
+  have_ga = have_tools and config_host.has_key('CONFIG_GUEST_AGENT')
+
   man_pages = {
-        'qemu-ga.8': (have_tools ? 'man8' : ''),
-        'qemu-ga-ref.7': 'man7',
+        'qemu-ga.8': (have_ga ? 'man8' : ''),
+        'qemu-ga-ref.7': (have_ga ? 'man7' : ''),
         'qemu-qmp-ref.7': 'man7',
         'qemu-storage-daemon-qmp-ref.7': (have_tools ? 'man7' : ''),
         'qemu-img.1': (have_tools ? 'man1' : ''),
-- 
2.29.2



