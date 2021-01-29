Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7046308906
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:20:57 +0100 (CET)
Received: from localhost ([::1]:53430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Slk-0003AV-UJ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:20:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5Rnd-0004yh-81
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:49 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:34265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5Rna-00067s-IX
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:48 -0500
Received: by mail-ed1-x52f.google.com with SMTP id d22so10136603edy.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sl3y6bEhy3bScnbFrCsAd6nm60IxHuqvmVxfBJKGBIE=;
 b=G1ivR2O7I5i6tBBLFV5xVQnD/MBFuW/0V3kDWEPX4GRBsosHuRTRKcuvbowlskeire
 OmhKygsRpeGnb5FtQL3EE/5eJSA+ClvhRukHzKwQsFtoRhKXarl4x0jRpRbx1+R39+Xe
 +13SiWIkbXNgbH3Z8lfwywwUpUctZpSdNtAXQmEdWOqlVWh9QJdztC+3NfR33kPI8IWt
 NnDzT8Y8hbuPx8kbHj10o4Xue6JMkhQOgHmBR8z9gPt3N83J0ihOsh8l4EjsGk9Yo6Xo
 ZQtqPQ0bpCHj6wtd1yMoYeiSTnscWs9Jc6oLoybWUIY72jRR+IP7IkUubfvN4RwS7s0N
 zW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sl3y6bEhy3bScnbFrCsAd6nm60IxHuqvmVxfBJKGBIE=;
 b=WshiB+TdfZs1OC4pfkpAiW1CEASzcqjwmgea7/BBPOiGgvOGoPOQP+WLoGZeapxk4P
 szK7+Ty0wJ+Pg+V2ymLVeQDyunOIHfQEc1wJJhyPnGiiGs2meFsvsQQtnRPcBCC4Cwwz
 gIeLQiqtbicd05gKiz7tCY55Q4RZrvXIcvaMb2PC5c6B4kHQ69PAv/CKAEIyjZqT4QE/
 PzX7FI66n2ImCD1LVUNZKLGAEQ1EtMCHN57F4P0FbyJA6xaPGPMFyOECiYjMZxifre3p
 rdCTd9YQ5ibGvRXfnqkzTNkDM4mZ6ZZ1YfvKmuNMkqWvGTtUDUr9qjnVz5w8k3yVeLSV
 1yTw==
X-Gm-Message-State: AOAM532dMa/Xhg396aeivo0TtG9pSSVo8TlKGCRLHPn30UsiXXE+4JQC
 LO56kDJPq7iMz0zEobyo9RUIsozuP1MdwQ==
X-Google-Smtp-Source: ABdhPJz5tLjpA6b/SLa+231Xht9LzKRdXPPjhwGvgtUj42vbldKJUDLCgLVBSmIxDRpe64p3CUGDdg==
X-Received: by 2002:a05:6402:2d1:: with SMTP id
 b17mr4462404edx.95.1611919125438; 
 Fri, 29 Jan 2021 03:18:45 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/36] qapi/meson: Restrict UI module to system emulation and
 tools
Date: Fri, 29 Jan 2021 12:18:12 +0100
Message-Id: <20210129111814.566629-35-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210122204441.2145197-13-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qapi/meson.build b/qapi/meson.build
index 7aca8d5048..0652569bc4 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -43,7 +43,6 @@ qapi_all_modules = [
   'sockets',
   'trace',
   'transaction',
-  'ui',
   'yank',
 ]
 if have_system
@@ -57,6 +56,11 @@ if have_system
     'tpm',
   ]
 endif
+if have_system or have_tools
+  qapi_all_modules += [
+    'ui',
+  ]
+endif
 
 qapi_storage_daemon_modules = [
   'block-core',
-- 
2.29.2



