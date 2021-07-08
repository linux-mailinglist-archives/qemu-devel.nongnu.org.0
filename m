Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64763C15D1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:19:53 +0200 (CEST)
Received: from localhost ([::1]:43310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Voe-0002zg-Mm
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vml-0008SD-RK
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:17:55 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmh-000887-RI
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:17:54 -0400
Received: by mail-ed1-x532.google.com with SMTP id m1so9028936edq.8
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PFonQRkqzl281GZ7rTAUyH8nUwjUVSVQflBGRmaPz2c=;
 b=VsE0n5NcFwm93ucJTrAvGVhLQKZb9bh6238CIfmWHDmu0+UYLB6XYax13QoLLCDBEo
 QdwNXbuKJmzRLI0dgKQpCr8aVIaADQMjIq1QB0sp7wP0ohRIUZPQNn89k0Une1K13CUB
 MQRGHmhfb6B1LbzvVg+C/vqQ+BQuv0ludjmW93dd604sD4QQgghdabYwhCSrpDc1soC9
 gPUrMtxYgs821mOIoUtnUto0Iw6HaUtaD/pmSH5PWBTS+o6TNKuWAzdvemikA4uVUxzG
 FTZ8GEudiOrrwb1x2NSGey3hyh7yX0UBiTmY4/ySNDBOliHcwVr9CkfFUk2KhkShZ32p
 J8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PFonQRkqzl281GZ7rTAUyH8nUwjUVSVQflBGRmaPz2c=;
 b=LqvBTUuA0sU5FpvoehEnz2Pal9OamwUBAzwghxCcS8itGoDwMgW2g1WyLQhqyJRdZa
 tsXA2fHn0ZEvhnQqaedkCBn/0PEdN8J4Qx+olsGXknJZHaamC4Af727BSR1Yu1/BEJU9
 ynIElmmnkeYaDwvmOfnuMXcX8HVx6ihPvxEqdTsLIeB0Z6ntE8sUVB9BnJ9u3KrDpgqp
 6Nl0v9f277X6wCrBLLtrJGgzv9YhK3JTyXj9GTkUra6jdNFFSVm5X/UV4wCHtzWG5E4t
 GXZw72d5yEbd7EP7///k3szjUaGioMlK1tlECZUs+wG1b1orvOpPTczDB+0zOuvASxtT
 efgA==
X-Gm-Message-State: AOAM531JoTQEH/BV9dUzDdsgnXk/UwPir9arElAwaj1WRiHcOgmK/z3A
 2qE+Kb3mjuJl58GMJ//RYv8Edg7ls5w=
X-Google-Smtp-Source: ABdhPJzoV5p2zGSSQH1B/icEf7AoexE+p+RYD7nI3EZnh1kUbtMsj7z6UXtiAxI0FAMsEF7Bx9kqWg==
X-Received: by 2002:a50:e79b:: with SMTP id b27mr33129526edn.267.1625757470501; 
 Thu, 08 Jul 2021 08:17:50 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:17:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/48] configure: fix libdaxctl options
Date: Thu,  8 Jul 2021 17:17:01 +0200
Message-Id: <20210708151748.408754-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Miroslav Rezanina <mrezanin@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Miroslav Rezanina <mrezanin@redhat.com>

For some reason, libdaxctl option setting was set to work in an opposite
way (--enable-libdaxctl disabled it and vice versa). Fixing this so
configuration works properly.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210707063124.81954-1-mrezanin@redhat.com>
Fixes: 83ef16821a ("configure, meson: convert libdaxctl detection to meson", 2021-07-06)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 650d9c0735..4f51528a77 100755
--- a/configure
+++ b/configure
@@ -1531,9 +1531,9 @@ for opt do
   ;;
   --disable-keyring) secret_keyring="no"
   ;;
-  --enable-libdaxctl) libdaxctl=disabled
+  --enable-libdaxctl) libdaxctl="enabled"
   ;;
-  --disable-libdaxctl) libdaxctl=enabled
+  --disable-libdaxctl) libdaxctl="disabled"
   ;;
   --enable-fuse) fuse="enabled"
   ;;
-- 
2.31.1



