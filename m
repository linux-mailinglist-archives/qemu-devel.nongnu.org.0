Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5683A11AD63
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 15:26:08 +0100 (CET)
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if2wI-00072X-0i
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 09:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33239)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1if2tr-0005PM-61
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 09:23:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1if2tq-00037z-2i
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 09:23:35 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40860)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1if2tp-000366-Sd; Wed, 11 Dec 2019 09:23:34 -0500
Received: by mail-wm1-x344.google.com with SMTP id t14so7149638wmi.5;
 Wed, 11 Dec 2019 06:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zl8wJ/+eVF38FZiKYMZ2pcbwsnsvBSDZWndiffPRqXo=;
 b=ft5eIrs0OuO8yL8ZMvPVOhtaSvWZeSa47fn/CjVxkaExs3njpdBtbJLOpRKEd4UOuF
 n4zDuQ0ryaQ5y04f+oGTc54Ov4g/hCf4CjQgq40TikW7/Xwccs7n/8PRg3xqHPnsKx+l
 n5ozzInOTqLHtf/QLmkkNFJM4boOK8a+dnk+sdkcGh1Rsc18rjhwBXu80octz/YPbax3
 BB2wvS62cPySRpW9f/5i47VdMNNFxiqUkxORnX5ZNOBD8zn3eOmmZ+C9yErgtE0T3QUp
 yt5b1YdQ9PRTaxQk04mZJJsXwe6Qb7y3FiBLFBW/Mazpc4/6G1fVbQ7V+e94QRhDaqPo
 hbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zl8wJ/+eVF38FZiKYMZ2pcbwsnsvBSDZWndiffPRqXo=;
 b=cmHHbrKuP+HmDfVtruES+K6gkrYVeONW1TUKFdpSFN3dJi8CY4mpH8CXb3RvV98UG9
 FY9NLdlaXeT08GgwANLvR6OlnqfgORKTDVe4Lvd7wPUmY4LkYE/q7yEa9/N+wb7iJxky
 AVScIvEprzwyC1JiamZzPSKZkEO/t7vWPN+lAN6a1sbdvY5m8ELSa096uVLyqRAUIvO6
 bDOGrzR+om5iskLfW1Gkw32E8UgH6UdfqEuJUwbiRiLP7BV5QGJXvcWVKRvIcDTKEJY3
 rrsjH4wQcC4O8Qi4GygJe0JhdQx8u146D+H/6+yFfzM+V625Cup1h2aTuoAtGPVl60om
 HKpQ==
X-Gm-Message-State: APjAAAW8LClr75twTtNq3oMpQn/U4p+c9PzX6Y1g90nuluLSHXAHlTGz
 i/NGOU7IqBu0BETb0waCQgAiNbyi
X-Google-Smtp-Source: APXvYqy1NqYzAoJll19RJVnvT4ZvYNlPYBkM24RteR9g7nWHUuUUMwyMBDycL0nXMmDd6QnJ1x237g==
X-Received: by 2002:a7b:cf01:: with SMTP id l1mr71045wmg.86.1576074212126;
 Wed, 11 Dec 2019 06:23:32 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id g23sm2503783wmk.14.2019.12.11.06.23.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Dec 2019 06:23:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] build-sys: build vhost-user-gpu only if CONFIG_TOOLS
Date: Wed, 11 Dec 2019 15:23:22 +0100
Message-Id: <1576074210-52834-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

vhost-user-gpu is always built and installed, but it is not part of the emulator
proper.  Cut it if --disable-tools is specified.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 53823c2..8d921c6 100644
--- a/Makefile
+++ b/Makefile
@@ -321,14 +321,10 @@ HELPERS-y =
 
 HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) = qemu-bridge-helper$(EXESUF)
 
-ifdef CONFIG_LINUX
-ifdef CONFIG_VIRGL
-ifdef CONFIG_GBM
+ifeq ($(CONFIG_LINUX)$(CONFIG_VIRGL)$(CONFIG_GBM)$(CONFIG_TOOLS),yyyy)
 HELPERS-y += vhost-user-gpu$(EXESUF)
 vhost-user-json-y += contrib/vhost-user-gpu/50-qemu-gpu.json
 endif
-endif
-endif
 
 # Sphinx does not allow building manuals into the same directory as
 # the source files, so if we're doing an in-tree QEMU build we must
-- 
1.8.3.1


