Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E08599EC6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 17:47:12 +0200 (CEST)
Received: from localhost ([::1]:34612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4DH-00020s-KQ
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 11:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP46F-0005nG-Na
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:57 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP466-00065D-Pr
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:54 -0400
Received: by mail-wr1-x42f.google.com with SMTP id a4so5630379wrq.1
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 08:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=o0T9cbillLUVn1AQ53zgvfCfnDyIkISRz/FjBOjJIOk=;
 b=AJGNqIPFvRZh9dyOzh83lCOXDOdwJuJroY0ue4jamLmE4hhHBnIkcH/YjwBoZQN04h
 4FNbQqvml6gu45nz6SinqufrUu/lN/lVxmfZ6iYU9Pb0sNIkKAXE1YmjqUXE2mDG4CQA
 sJ6FVAEE6s1QY9yKdURXKQGJlZKvjwL9+zrIbQpF/43bX7AMcr6BcLl+y4xWTMnv9hgK
 327+ygnd9SrPz1Y4xyvZFYV4vCVoGHNUdIL1myzRylCHCZrUEwLyJOaGlGn8mi+6pk3T
 q4rL0laq5fqN2mS4YT/UT6HzEtRjvk/GzbsQR3/jm4/24Op3TKFvLwl3Hidk24Jwa3qo
 YLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=o0T9cbillLUVn1AQ53zgvfCfnDyIkISRz/FjBOjJIOk=;
 b=TdGYTeX6J3aIKsukaKHlNJhNn6Z0fcL7RsrslEom37qxMdPusoiRN4nG4KYNaOIYuB
 9Xf6MbF0EjoRUf1WnpWXWYK9Q95p22Aw/giravgxXJzn4oxVFb6/B3H32pezlDF2Mjvt
 8ggCMOHG6DhjsZnYBc7UhgLcUJZ+K8usEPWpkIQjW+n0ddAgaFCtH6FHdd97GnFdcTXi
 FYLi26Tge2ZTYkivRZD0I6yZ3jvnjEynac2+6ExMZjEkVq2YJ7tECDKpvbR2owi4kqst
 sc1iUGrtCQXwNOWKY1k/1WF4qZSf2zonzupTl3Ht8Xg58DnUVkibkoHP4IenjwkzNJjY
 ID7g==
X-Gm-Message-State: ACgBeo1VBFmZdAXE9Q7fA+Jzg5bLNpoGzDzPyY8LV/2Y6Ee+QHNqHTF/
 76VtIganl9Bchxh23Q5S/nrg0maRNtpM1Q==
X-Google-Smtp-Source: AA6agR6YJ4YKDT8h30zeUVPqRq86qt5YgiWufaFpDg1jORj8PKBChU+Kk9VbHqYsLSaPzKSGaCMYQw==
X-Received: by 2002:adf:d1ea:0:b0:220:6334:25e with SMTP id
 g10-20020adfd1ea000000b002206334025emr4903739wrd.32.1660923585325; 
 Fri, 19 Aug 2022 08:39:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b003a54109a6a0sm5558396wmb.3.2022.08.19.08.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:39:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 08/11] hw/i386/multiboot: Avoid dynamic stack allocation
Date: Fri, 19 Aug 2022 16:39:28 +0100
Message-Id: <20220819153931.3147384-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819153931.3147384-1-peter.maydell@linaro.org>
References: <20220819153931.3147384-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use autofree heap allocation instead of variable-length array on
the stack. Replace the snprintf() call by g_strdup_printf().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i386/multiboot.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
index 0a10089f14b..963e29362e4 100644
--- a/hw/i386/multiboot.c
+++ b/hw/i386/multiboot.c
@@ -163,6 +163,7 @@ int load_multiboot(X86MachineState *x86ms,
     uint8_t *mb_bootinfo_data;
     uint32_t cmdline_len;
     GList *mods = NULL;
+    g_autofree char *kcmdline = NULL;
 
     /* Ok, let's see if it is a multiboot image.
        The header is 12x32bit long, so the latest entry may be 8192 - 48. */
@@ -362,9 +363,7 @@ int load_multiboot(X86MachineState *x86ms,
     }
 
     /* Commandline support */
-    char kcmdline[strlen(kernel_filename) + strlen(kernel_cmdline) + 2];
-    snprintf(kcmdline, sizeof(kcmdline), "%s %s",
-             kernel_filename, kernel_cmdline);
+    kcmdline = g_strdup_printf("%s %s", kernel_filename, kernel_cmdline);
     stl_p(bootinfo + MBI_CMDLINE, mb_add_cmdline(&mbs, kcmdline));
 
     stl_p(bootinfo + MBI_BOOTLOADER, mb_add_bootloader(&mbs, bootloader_name));
-- 
2.25.1


