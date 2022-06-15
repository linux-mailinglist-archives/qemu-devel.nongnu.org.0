Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E4E54D058
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 19:49:12 +0200 (CEST)
Received: from localhost ([::1]:44072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1X8h-0003aP-So
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 13:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1WuF-0007Zz-AV
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 13:34:15 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1WuD-0006rj-Mk
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 13:34:14 -0400
Received: by mail-pj1-x1035.google.com with SMTP id a10so11843240pju.3
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 10:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DY3QQ6VqXL3BswDg4+4GS0rzUG4ZftaMTDWMXVlycIA=;
 b=PzW9ehoV30XskywUjb4Hlk09Ru7ty2uZKNyK3RjXLE+Rs2NWY1fZzWqzhgSgmBTE9L
 ccYoy+n5r/0VmqVogsxnwnCzScqkA06JwpWBSzO26j+Utj2HfPzlOFQUvQ6i1iTAYb97
 M3AB5Ugi8A4FrhUw9h/arLtCN9Of9ZE9D2NtaTxxG6uaJL4FqHy5Wes4e+kunE/Putaj
 5xlFZkDN9/vcBVfhKeNAzA31kh6Y6S63cRI/gJv4QpOT3/rN2VbuolkdNN7RW7d3p2Oc
 rlm8Y5DXRSQpKnm5XTpoFVDFwpUiJ+zsxLvbBhLqWX/iWEih2/Noemaj8jPfjZYWYeWJ
 Z4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DY3QQ6VqXL3BswDg4+4GS0rzUG4ZftaMTDWMXVlycIA=;
 b=x0SvAT9FV4PrePhHlD8zf0ADoQJ8Ph8SOhtHyQW7Xii9JUQVEJBr8g7NABZ94LBpf2
 7R20qWikOdvJWOmR5Q+rMNo7Fgb299li9DZd0OJOsPFxTW3JJgBp9335C4xDtZViV2Qi
 SqVXrj+d3zuEK2ezrHPNMZMFvXZiVxyDdZ6YqR+lCsiTFDxIvtZgmfvXPGb6AQ6QFVWS
 3dbEydcQ73GcsinmAKL5UKPR9tNlnSE/B9g0R6Dj/V0CPnbAArZsJReNJBaTQP0aGslC
 iKmoSrPs8vw2DUwEKndinf3wlAD68oCvtpBqC/Z/e/Ks798ZxKzLR3u6g3WB3NUDcRDZ
 jf7g==
X-Gm-Message-State: AJIora/fFpiLbMHQLhkHZxtD/Fz0LWz1xzYkmchjQwWUlt5sKORSX2yA
 N2IVuKU82BYsQqQ9hIUWG5k=
X-Google-Smtp-Source: AGRyM1sm8EDuf0P4t3drdcXlPjlnzrir4VhC088vtes3Cx1RIPgKwH4gE5yOf4ZGZOGF9Ghg2MPBBw==
X-Received: by 2002:a17:903:3091:b0:167:885c:a15 with SMTP id
 u17-20020a170903309100b00167885c0a15mr424405plc.173.1655314452453; 
 Wed, 15 Jun 2022 10:34:12 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:4126:b1a8:8fce:1a8])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a633c4d000000b003fcf1279c84sm10171451pgn.33.2022.06.15.10.34.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jun 2022 10:34:11 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v7 6/6] net: Use bundle mechanism
Date: Thu, 16 Jun 2022 02:33:45 +0900
Message-Id: <20220615173345.32456-7-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220615173345.32456-1-akihiko.odaki@gmail.com>
References: <20220615173345.32456-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1035.google.com
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 meson.build | 2 ++
 net/tap.c   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 8961df266d1..5e0e08801c9 100644
--- a/meson.build
+++ b/meson.build
@@ -3574,6 +3574,8 @@ if have_tools
                dependencies: [authz, crypto, io, qom, qemuutil,
                               libcap_ng, mpathpersist],
                install: true)
+
+    bundles += { get_option('libexecdir') / 'qemu-bridge-helper': '../../qemu-bridge-helper' }
   endif
 
   if have_ivshmem
diff --git a/net/tap.c b/net/tap.c
index b3ddfd4a74b..5beba85fb22 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -507,7 +507,7 @@ static int net_bridge_run_helper(const char *helper, const char *bridge,
     sigprocmask(SIG_BLOCK, &mask, &oldmask);
 
     if (!helper) {
-        helper = default_helper = get_relocated_path(DEFAULT_BRIDGE_HELPER);
+        helper = default_helper = find_bundle(DEFAULT_BRIDGE_HELPER);
     }
 
     if (socketpair(PF_UNIX, SOCK_STREAM, 0, sv) == -1) {
-- 
2.32.1 (Apple Git-133)


