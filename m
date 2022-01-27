Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49C349E140
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:37:33 +0100 (CET)
Received: from localhost ([::1]:39002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD35o-0000L5-PM
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:37:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fv-0006ls-KD
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:51 -0500
Received: from [2a00:1450:4864:20::32b] (port=56114
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fu-00067W-0Y
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:47 -0500
Received: by mail-wm1-x32b.google.com with SMTP id r7so1615446wmq.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IAVMsDJsaXOjswkyBD7Ia0E8Zsa510y7vP1ftZ1P6HE=;
 b=diskyPafenum2sVU+zGGPPOv0CeBuBRso/WCorgHGUhfWLNIa9bLN8/+xufOVCOg58
 1HhTmFZH0Y4VIv/HFx/5Xj534WfJBlhZBYD/yPPTWd94DVY/HTYjRNAByFmZMJeeo5JZ
 0BW71C3qoU6hUP92svbQ7VlyF9Cj+WkmaMcnUPJv2gFSD1TYnVLHnuSZfDmo52Qf/d5w
 H30igjLWlYETTBC+R5uKMCNAlpsB5KiR4L35gDVyXr5Wiv1cmox1ZeuDCLVlMoRRlA38
 PN/ALz/b8QHEgc54y5mThQeM+0513YKcqpfcDT5ulfQLEHXUWcRo6HliU7kDJv2Esc8T
 iWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IAVMsDJsaXOjswkyBD7Ia0E8Zsa510y7vP1ftZ1P6HE=;
 b=LRAVtqSaay+cVGzEwvvn7F4gRpxkPqrLnlRXWzh1MsDsUdmWXpOHXxGGRbfEs266U+
 55SSqQ/4swpq4RPQq6BEePEdAZbrXnYyj7JypdRz2EAbQl3FpFqHzr5r8XHTZSqWPlH9
 0GYiSzBxI+c1yKizA/ibvg6YCrYaXbHa0EaXKLVyrESuxFMadYdKEQpB/VjXKx1oVQBs
 ZfLXsMiWsLTt333pO5ZRydtbfmYsdDHJvLsh991ThuGUETlRT+6Xf9FiXtYO+prbpZns
 2Keu7GPTs0iOtEPorN8SLYx+1C1GQxRTS5wiq22MUBD3vQZwOemVTXFSx+leV7f31XXO
 lf4A==
X-Gm-Message-State: AOAM53209zfiJXFthGSYCNMEmo8LXNruEKwvKf3Nbn4omEdJpNvhimGi
 HAuGkni+Et/b6iS3DLRJYd5vztiENGY=
X-Google-Smtp-Source: ABdhPJyeh146kwnzuwyAA1oHYMYEJRUtEoVhZ4Lkzt1zPjwLVaL1eJ/eV3ApzG6VwC7AKltC3MOOMw==
X-Received: by 2002:a7b:c153:: with SMTP id z19mr11038989wmi.118.1643281843674; 
 Thu, 27 Jan 2022 03:10:43 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s17sm1825742wrm.62.2022.01.27.03.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:10:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/14] meson.build: Use a function from libfdt 1.5.1 for the
 library check
Date: Thu, 27 Jan 2022 12:10:28 +0100
Message-Id: <20220127111037.457901-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127111037.457901-1-pbonzini@redhat.com>
References: <20220127111037.457901-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The fdt version test in meson.build uses a function from libfdt v1.4.7,
but we require version 1.5.1 nowadays. Thus use a function that has
been introduced in that version instead.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/822
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220118170548.97288-1-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 833fd6bc4c..4429fd2041 100644
--- a/meson.build
+++ b/meson.build
@@ -2279,7 +2279,7 @@ if have_system
     if fdt.found() and cc.links('''
        #include <libfdt.h>
        #include <libfdt_env.h>
-       int main(void) { fdt_check_full(NULL, 0); return 0; }''',
+       int main(void) { fdt_find_max_phandle(NULL, NULL); return 0; }''',
          dependencies: fdt)
       fdt_opt = 'system'
     elif fdt_opt == 'system'
-- 
2.34.1



