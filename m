Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E0E508D02
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:16:53 +0200 (CEST)
Received: from localhost ([::1]:41232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhD0e-0000yi-CX
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCM1-00022N-9M
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:53 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLz-00010T-CJ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:52 -0400
Received: by mail-wr1-x433.google.com with SMTP id p18so2794134wru.5
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g1KejnVJLrfokiOJb3NlMQTXKsZ5iS+WOPbTY2BhmKU=;
 b=B/nCqM1PyrL3QG6AJIuMB9CpPwoQOri+MTqOBx+cV/9gsi94rUrdUkT/fFaLzXcpIl
 3lkLcHNZuBSaeMx3gDNoliA60BdRQ0qfY3rrhOq9DSa55cwTQ91S7p4E4/uD8KzEg13x
 zZR7yfaOjtXKM58Tg308W0CW5zijRCgbfS0PblUnR5DLUDBkUx/X3X+Fa7VAr8VmAIYA
 N4HJRGYW92qwO5mJ2ma2vdSwftMVfMpu6NXIt2DyuwjgiAL+fQxdmg2Jjq7uTp1H7/xs
 4rfEqO/ucAyxIN9O0ilNeu+MndrvhFWloxtNqmvPtjq4bqAMfhyaaHeeuET7kfSNwAhv
 601w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=g1KejnVJLrfokiOJb3NlMQTXKsZ5iS+WOPbTY2BhmKU=;
 b=UO+iyUhbpZ083D1euK8K1+XzpBTKNg5/JhoEsB1keUJIeggiq7VA+2DtKEWfiD8DAT
 l56q4USTQ/tAcIyeNLVLAr7Cy2B5Qaaxp/wJMegQDHVTyRywi22X1l8OB7/YeekfV6bZ
 JNyAeIDpDophOnYN2/T50M5SXDKvtI0Mmof09zmONUyvKQ8P7dLhPQ0gixta3kZdgffu
 meOdZBCSQruh3tWogwG1MSwBKLR3JiHH3wnJh+XoqrCGmdvc3kLpj0BEPYQypF/j3XcD
 j9sA6ApEPAiyRYA+necZaqUd/+jdkvpxH9f8N3urv2xnQgp5U9aKidow1l9zAiDnweMU
 ebKQ==
X-Gm-Message-State: AOAM532iwHeoBwr9HRONDkptaqSy7X1kLkDnAwF7Nlz6pU978bDGg5K6
 zxmUVC64Q5FY16KBN6KoBy+nREyQYtPmfw==
X-Google-Smtp-Source: ABdhPJwAwkRAoiMLfbD5ZeyfjrtyCHB+abD/pxyF6RgQ5OtmDuqJo3LxQHy3Z4bEDuWQie5+b6mN3A==
X-Received: by 2002:a5d:4d91:0:b0:207:ac32:cffb with SMTP id
 b17-20020a5d4d91000000b00207ac32cffbmr16166481wru.644.1650468890005; 
 Wed, 20 Apr 2022 08:34:50 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/34] configure: simplify vhost-net-{user, vdpa} configuration
Date: Wed, 20 Apr 2022 17:34:01 +0200
Message-Id: <20220420153407.73926-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Cleanup to ease review of the conversion to meson.  vhost_net_user and
vhost_net_vdpa are never assigned anything in the command line parsing
loop, so they are always equal to $vhost_user and $vhost_vdpa.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/configure b/configure
index 61b5acae10..2aa4dc3ce1 100755
--- a/configure
+++ b/configure
@@ -1554,10 +1554,6 @@ if test "$vhost_vsock" = "yes" && test "$vhost_kernel" != "yes"; then
 fi
 
 # vhost-user backends
-test "$vhost_net_user" = "" && vhost_net_user=$vhost_user
-if test "$vhost_net_user" = "yes" && test "$vhost_user" = "no"; then
-  error_exit "--enable-vhost-net-user requires --enable-vhost-user"
-fi
 test "$vhost_crypto" = "" && vhost_crypto=$vhost_user
 if test "$vhost_crypto" = "yes" && test "$vhost_user" = "no"; then
   error_exit "--enable-vhost-crypto requires --enable-vhost-user"
@@ -1566,16 +1562,11 @@ test "$vhost_user_fs" = "" && vhost_user_fs=$vhost_user
 if test "$vhost_user_fs" = "yes" && test "$vhost_user" = "no"; then
   error_exit "--enable-vhost-user-fs requires --enable-vhost-user"
 fi
-#vhost-vdpa backends
-test "$vhost_net_vdpa" = "" && vhost_net_vdpa=$vhost_vdpa
-if test "$vhost_net_vdpa" = "yes" && test "$vhost_vdpa" = "no"; then
-  error_exit "--enable-vhost-net-vdpa requires --enable-vhost-vdpa"
-fi
 
 # OR the vhost-kernel, vhost-vdpa and vhost-user values for simplicity
 if test "$vhost_net" = ""; then
-  test "$vhost_net_user" = "yes" && vhost_net=yes
-  test "$vhost_net_vdpa" = "yes" && vhost_net=yes
+  test "$vhost_user" = "yes" && vhost_net=yes
+  test "$vhost_vdpa" = "yes" && vhost_net=yes
   test "$vhost_kernel" = "yes" && vhost_net=yes
 fi
 
@@ -2104,10 +2095,10 @@ fi
 if test "$vhost_net" = "yes" ; then
   echo "CONFIG_VHOST_NET=y" >> $config_host_mak
 fi
-if test "$vhost_net_user" = "yes" ; then
+if test "$vhost_user" = "yes" ; then
   echo "CONFIG_VHOST_NET_USER=y" >> $config_host_mak
 fi
-if test "$vhost_net_vdpa" = "yes" ; then
+if test "$vhost_vdpa" = "yes" ; then
   echo "CONFIG_VHOST_NET_VDPA=y" >> $config_host_mak
 fi
 if test "$vhost_crypto" = "yes" ; then
-- 
2.35.1



