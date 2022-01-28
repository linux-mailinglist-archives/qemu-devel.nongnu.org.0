Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C81F49F714
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 11:18:12 +0100 (CET)
Received: from localhost ([::1]:37212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDOKY-0006VR-PR
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 05:18:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nDOHo-0003ZQ-LN
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 05:15:23 -0500
Received: from [2a00:1450:4864:20::52d] (port=40517
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nDOHl-00065a-Oy
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 05:15:20 -0500
Received: by mail-ed1-x52d.google.com with SMTP id w25so7998929edt.7
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 02:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y9HqWxQas/aoKdwYcCHD6AmZdXGUBEac1zGEyJSJejo=;
 b=pzLWVtpimmYVrTeenpEC9pI3OfFm6SneP8xZc/mxTUloX5qBc0pKei4FpFEPz6VsXf
 UXD7Vc5A1nMpzZvQmVCXUgKNTkEECRLCctwuVOW+Ad1r9y1qQb109C6VWCj3reno9VeN
 9kh9lYRqkmuPAEpYrCEojv5ScXbhybNSdksMCQH90QTBuvVCS4tMH4bngG+mAzSTc80n
 7j8J5q8ErQD1WGef0Xvhkeu7QG6uNTq5cbwtfthBWWIgStcx/5tXx6FRrwtFdWef2RcA
 KzUZjqqQQM3zwCbhP1Cegk3P04PJJKVl0wks+Yo/BgMbjnO/Gn1pdcaDTBlE1gKeBG8e
 LOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=y9HqWxQas/aoKdwYcCHD6AmZdXGUBEac1zGEyJSJejo=;
 b=NP01NaFMjR9wLVjdBIPQ9EgWNXXeb2InKhf8RUhmw/ib+lcUUZQogfHMSEd5JXkPAC
 KA65u0mBL0zhc8ftGRHx2Bt7Z5/1DTyRWMBBjkQfHqAVGA/WCyl8U2binhKzqhoUy9Et
 hEUHF6X0AAP79ucdoKo4kgsQgaABS1RnC25ue/tKmBjxvHn+mvEICOb+FJYTjnuRl/dy
 AqQ0kFHcCHMcgoFFU413mjr7xZZD2TsgQr5btqFqZEtvZmR8eqiSFXHI5sGNstY+LPGG
 kHTHTD9mjnztd2nOICMY35ekjUhD+YQXNIanB2T0ARamiNPRAMKobSvdVCCTD8vikZue
 2ukA==
X-Gm-Message-State: AOAM5308lPD37QfA0TtR6BX0M0WtlntOg5k6Lc4vMZG8ETF11soSXxXb
 yYq++Aj3CwSDoqDVD5dpME/dt/M0z7w=
X-Google-Smtp-Source: ABdhPJyxOtn7XSKY18r8DlH2RDKqvcY8iL11UfPac64Y44dBE6i0Pk51oYmBDqUMUWBflGbxZuyovQ==
X-Received: by 2002:a50:d0c4:: with SMTP id g4mr7634169edf.278.1643364916179; 
 Fri, 28 Jan 2022 02:15:16 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dk3sm12690738edb.33.2022.01.28.02.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 02:15:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 07/14] meson: Use find_program() to resolve the
 entitlement.sh script
Date: Fri, 28 Jan 2022 11:15:13 +0100
Message-Id: <20220128101513.646792-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128101513.646792-1-pbonzini@redhat.com>
References: <20220128101513.646792-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Using ../configure without any particular option generates 31 targets
on Darwin, and meson search for the entitlement.sh script 31 times:

  Program nm found: YES
  Program scripts/undefsym.py found: YES (/opt/homebrew/opt/python@3.9/bin/python3.9 /Code/qemu/scripts/undefsym.py)
  Program scripts/feature_to_c.sh found: YES (/bin/sh /Code/qemu/scripts/feature_to_c.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Configuring 50-edk2-i386-secure.json using configuration
  Configuring 50-edk2-x86_64-secure.json using configuration

Use find_program() which seems to cache the script path once found.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220122002052.83745-1-f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index 4429fd2041..c69fbbd0cb 100644
--- a/meson.build
+++ b/meson.build
@@ -3052,17 +3052,14 @@ foreach target : target_dirs
         install_input += meson.current_source_dir() / entitlements
       endif
 
+      entitlement = find_program('scripts/entitlement.sh')
       emulators += {exe['name'] : custom_target(exe['name'],
                    input: build_input,
                    output: exe['name'],
-                   command: [
-                     files('scripts/entitlement.sh'),
-                     '@OUTPUT@',
-                     '@INPUT@'
-                   ])
+                   command: [entitlement, '@OUTPUT@', '@INPUT@'])
       }
 
-      meson.add_install_script('scripts/entitlement.sh', '--install',
+      meson.add_install_script(entitlement, '--install',
                                get_option('bindir') / exe['name'],
                                install_input)
     else
-- 
2.34.1

