Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23E930FA36
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:52:42 +0100 (CET)
Received: from localhost ([::1]:41652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7io6-0007nL-1h
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:52:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phillip.ennen@gmail.com>)
 id 1l7hS6-00021h-Fn
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:25:54 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phillip.ennen@gmail.com>)
 id 1l7hS2-0006Du-Ad
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:25:54 -0500
Received: by mail-wm1-x333.google.com with SMTP id m1so3519645wml.2
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 08:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DXmz56HpxTkIQHkz0PbVypcsiThKPZQ7arQwk98RXgk=;
 b=jSVeNpHNVmnY+JZXGbLJp14apcbgIEc32BZTToqDc4V/uv9Ne1CqaCx8jfv/I6HbGt
 ueXxNF0QA/lFUx271GQShQ3vi/TmW64EjOn9OLR1UpCQOpJOEFVISe8naBRXVWBTEpRb
 aPhac9/QmkKDxUPvdoK4SSF1Hp5uLZeYYGKrGQrHxwlQwpwXWYeGCdCRA0M18H3yxdP6
 wdXmxAunfkw9UqjXV6W8cpMK2pz8XeIWyx8AWItSpz7suOa5lB6xVhCtGZF6hHq1if+K
 Kh+g2ODiN7ihbAmBfB9vZ2ISd9TAky4ZXJtdOX2ucqh0MSh3Gs0+rKUQcajbh5dZP5ip
 S78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DXmz56HpxTkIQHkz0PbVypcsiThKPZQ7arQwk98RXgk=;
 b=C7IzKSqfaX2a1KLE69PRzppYi/ch119HoD8itlGpHQzUi9BW5YXyYQ4yUJ2lWEs78V
 WRhZx7KYCjR+BKb4F4z6K/g6Mj1t2gDQXYwmM44/B6MUdhtHha4ASSsYpnt60BhQL2zi
 wrs50gbRR7tUhv0JEyKooBOxO7EIsot0fqLsQVBrjU6ZWGMBmU8H+Z70xbqacY5Q50vl
 XxuqaKegrPolOZwHRX1ntzZzml5u8ujkxcOwJpQEw5hkOZdCnOWAd5QuScPo74nebv5/
 eQwoiSlVcXjPkNeit0UtXW3ikWaZ9QmIAw1DY/9C7WkmyH2fN3+DsnRI8yADkgMKvmiq
 L0FQ==
X-Gm-Message-State: AOAM532YIigqsHN0uiCUZnCW8HOZHH7nfgoy/DfFs+F24UROQBouRh4x
 X1ney30umLNbFO4VPOCXhfMD8L9tYMqJYQ==
X-Google-Smtp-Source: ABdhPJwL+TBzN9+vyanK4C1pWQqYEOwJcuv9LtIyPaKOo0t16o9unjICk4etCJwmhq+SJYSvYX6xGA==
X-Received: by 2002:a1c:a9d7:: with SMTP id s206mr17960wme.42.1612455947812;
 Thu, 04 Feb 2021 08:25:47 -0800 (PST)
Received: from localhost.localdomain ([2a01:e34:ec19:cd20:9163:769f:ccfe:9091])
 by smtp.gmail.com with ESMTPSA id l11sm8312273wrt.23.2021.02.04.08.25.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Feb 2021 08:25:46 -0800 (PST)
From: phillip.ennen@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] build: add configure flag to indicate when the host is
 Darwin
Date: Thu,  4 Feb 2021 17:25:43 +0100
Message-Id: <20210204162544.65439-2-phillip.ennen@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210204162544.65439-1-phillip.ennen@gmail.com>
References: <20210204162544.65439-1-phillip.ennen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=phillip.ennen@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 04 Feb 2021 12:43:24 -0500
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
Cc: stefanha@gmail.com, jasowang@redhat.com, phillip@axleos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Phillip Tennen <phillip@axleos.com>

Although we already have CONFIG_BSD, I added this flag to be sure that we could rely on various macOS-specific subsystems, such as vmnet.framework.

Signed-off-by: Phillip Tennen <phillip@axleos.com>
---
 configure | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index 87de49e2c2..4afd22bdf5 100755
--- a/configure
+++ b/configure
@@ -5825,6 +5825,10 @@ if [ "$bsd" = "yes" ] ; then
   echo "CONFIG_BSD=y" >> $config_host_mak
 fi
 
+if [ "$darwin" = "yes" ] ; then
+  echo "CONFIG_DARWIN=y" >> $config_host_mak
+fi
+
 if test "$qom_cast_debug" = "yes" ; then
   echo "CONFIG_QOM_CAST_DEBUG=y" >> $config_host_mak
 fi
-- 
2.24.3 (Apple Git-128)


