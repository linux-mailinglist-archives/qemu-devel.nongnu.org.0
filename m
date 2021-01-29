Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDDE3088DB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:07:58 +0100 (CET)
Received: from localhost ([::1]:54108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SZB-0000BN-W2
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnP-0004aC-Jx
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:35 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnO-00061Q-47
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:35 -0500
Received: by mail-ej1-x633.google.com with SMTP id rv9so12390864ejb.13
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N1redxJJGMDjD8aDmJ5AuNIZ5p761sXDiGTCZxZj28U=;
 b=YHtJW/P02woH+bpIyTVUjjeTgMMKZb2chhYsLcxbEC0gwfAlqKRQufaNSSlgf/N/IY
 dZ0RxOBriUzupvgr/vCx9dnvKVuagdm4gkp74vVYQZpzRm2+KTPCV0MtqY1dpEpp/OLc
 sMNLDMRyNAKtjFuYNUdDztAqEWBeq4qNKQfC3pAK88p94prtffOQm0kheBhm751wghUd
 tq11+ln05KrWLVJyI+wgWRfxn5uQ76RJlVCCioQOPEHi6qSpvsgSKgQOqwiIuKH3DwIq
 W1TJpU1FzzbJCixxF/4ZZ3EAxPL41S6v+1tRcwy0tHhC40f5CYxFg6aIuQfURhDAiEIF
 v/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N1redxJJGMDjD8aDmJ5AuNIZ5p761sXDiGTCZxZj28U=;
 b=HxtboGgC029MtMNeomVlglvsY+zxfWPQKw7imW6RPcWw2DSPWSbrSdWou2BcOhDwfU
 8dJJNlSA2OaZPhI4rly6Iwb/MGDamjeR0CNm2TFmjafhBSLeMgZ+u6nKvUHxE+/lpu01
 GDWpiBz482KhSUyB8Zjp+t00d0LUR5D6mA0PjCz4WWYb/1EjE9+3Y4/3I5hhBmUu8Zfy
 iNVfD/xXL3nZfXEAFSJcf32dki1nKRBzmvR1RKkOntMJW92gZJRdPxC1w3VkgQH+IWvI
 ke9qjg9lp0pIiEnw1BglpDz8U/t4D2Ra9W/0zKHVM9pRsb5Ui/nFFmU9AEHIdW8CCB/S
 jTqw==
X-Gm-Message-State: AOAM530ZUvrJ5DPtSfxFWYO197JSuNA0IVt7Kq0IEA1qvnPuJ6XgVExy
 yRn5BR0aCdGkH3DyBb6M4XGPCUce2a4UsQ==
X-Google-Smtp-Source: ABdhPJx+9O6wkbjPfUl5SKcZxyZ1jRjf1F3KxmUTwD7Is1LqIVuVLzT9Uwryl1JggolOHPvFXi/Caw==
X-Received: by 2002:a17:906:1c0c:: with SMTP id
 k12mr4116341ejg.354.1611919112916; 
 Fri, 29 Jan 2021 03:18:32 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/36] configure: Fix --enable-tcg-interpreter
Date: Fri, 29 Jan 2021 12:17:57 +0100
Message-Id: <20210129111814.566629-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The configure option was backward, and we failed to
pass the value on to meson.

Fixes: 23a77b2d18b ("build-system: clean up TCG/TCI configury")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210124211119.35563-1-richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20210125144530.2837481-2-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 87de49e2c2..8f3c4a6a5c 100755
--- a/configure
+++ b/configure
@@ -1119,9 +1119,9 @@ for opt do
   ;;
   --enable-whpx) whpx="enabled"
   ;;
-  --disable-tcg-interpreter) tcg_interpreter="true"
+  --disable-tcg-interpreter) tcg_interpreter="false"
   ;;
-  --enable-tcg-interpreter) tcg_interpreter="false"
+  --enable-tcg-interpreter) tcg_interpreter="true"
   ;;
   --disable-cap-ng)  cap_ng="disabled"
   ;;
@@ -6367,6 +6367,7 @@ NINJA=$ninja $meson setup \
         -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
         -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf \
         -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
+        -Dtcg_interpreter=$tcg_interpreter \
         -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
-- 
2.29.2



