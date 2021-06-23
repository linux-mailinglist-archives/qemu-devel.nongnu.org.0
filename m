Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672603B2005
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 20:06:41 +0200 (CEST)
Received: from localhost ([::1]:38678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw7Gq-0006aO-FY
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 14:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7BZ-0006fE-DX; Wed, 23 Jun 2021 14:01:13 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7BX-0003MY-Mv; Wed, 23 Jun 2021 14:01:13 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 t11-20020a1cc30b0000b02901cec841b6a0so3653678wmf.0; 
 Wed, 23 Jun 2021 11:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bvvltpFHHIakja7A6e7DrMPQs+uPi37tyIhnL/FQ1GQ=;
 b=OzFhtNg3GoJw2qJF+nyo7M2yJWFxnRGsHxQ8HMxpkuwaCzgr2N7FlbCbqlRp5gr9VG
 4r2C6KKa+JQqabCBwQHTRRVFE2gVDtAjAWIcsZHSw3wZtrzBESAToLOA40LbkunA5Z26
 5K1HGzQfQa3WBlIo5oFsErcQWTmIRbX1Tj1Frtuh8a/OQC4T+HfDPjI+TtnzWrlug7WM
 HFRP1+g9dhoJeSfSVueX/sP3rCZnZpCPnCGKrVM2MPvNh1W3mlcMdoTZmpQgU9kkpqwK
 zWQkzyoSWpdjfxKZRbny8x0KeDWzDe1KS3SXlStPBnlhRy7NZvMF2L62HqWp546yiDBD
 WPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bvvltpFHHIakja7A6e7DrMPQs+uPi37tyIhnL/FQ1GQ=;
 b=HWPF4fkeZ2yQ7ubsvpdJOBcAW9ZlYTQjEL4U89ggIcTwmkNvrbsCkXmL/2DL2ealh0
 H10E7wjNznEMzKWzQsegRB+vVeCtUkRVOBtDhRGH/u3jvjsLifETbog5Z6d8tEOE9leZ
 CuebdQ6csNVVgKLyzfNQDtQvrxMbIiDla7YD9d/BYwddZtbc1bupdgoXwZhtCzcBtvrB
 HItedq2mejJxLUivxcgqmUdJlRTA6L7o9Z4G024roHb4uZD604Tt80an3hta9mzYB5vq
 D++P8E2W+Go30uoVFj3B5U/TJ1jt0Hl5wHmOH+TKoTO+Tb2KAOSWw5LXcjCZI7d+R2KL
 2OfQ==
X-Gm-Message-State: AOAM533DSrZvkAaeXmsYVRVXPUMebDm0Kab79pUkuVO45xOnqk+CoTzS
 kz+5xDv3o8BywBY5I+gjaGc+EoAJ8+VTNA==
X-Google-Smtp-Source: ABdhPJxLy3noP+8UkajLYRmMta6hCURhrdFG+JhgTr/lkX0NrsJLhaeBuOvbBVBDrwCOjZK3RQagjQ==
X-Received: by 2002:a1c:98d5:: with SMTP id a204mr1054668wme.43.1624471269873; 
 Wed, 23 Jun 2021 11:01:09 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 62sm768793wrm.1.2021.06.23.11.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 11:01:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 9/9] hw/sd: Allow card size not power of 2 again
Date: Wed, 23 Jun 2021 20:00:21 +0200
Message-Id: <20210623180021.898286-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623180021.898286-1-f4bug@amsat.org>
References: <20210623180021.898286-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Tom Yan <tom.ty89@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit a9bcedd15a5 ("hw/sd/sdcard: Do not allow invalid SD card
sizes") we tried to protect us from CVE-2020-13253 by only allowing
card with power-of-2 sizes. However doing so we disrupted valid user
cases. As a compromise, allow any card size, but warn only power of 2
sizes are supported, still suggesting the user how to increase a
card with 'qemu-img resize'.

Cc: Tom Yan <tom.ty89@gmail.com>
Cc: Warner Losh <imp@bsdimp.com>
Buglink: https://bugs.launchpad.net/qemu/+bug/1910586
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 9c8dd11bad1..cab4aab1475 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2131,23 +2131,16 @@ static void sd_realize(DeviceState *dev, Error **errp)
         blk_size = blk_getlength(sd->blk);
         if (blk_size > 0 && !is_power_of_2(blk_size)) {
             int64_t blk_size_aligned = pow2ceil(blk_size);
-            char *blk_size_str;
+            g_autofree char *blk_size_s = size_to_str(blk_size);
+            g_autofree char *blk_size_aligned_s = size_to_str(blk_size_aligned);
 
-            blk_size_str = size_to_str(blk_size);
-            error_setg(errp, "Invalid SD card size: %s", blk_size_str);
-            g_free(blk_size_str);
-
-            blk_size_str = size_to_str(blk_size_aligned);
-            error_append_hint(errp,
-                              "SD card size has to be a power of 2, e.g. %s.\n"
-                              "You can resize disk images with"
-                              " 'qemu-img resize <imagefile> <new-size>'\n"
-                              "(note that this will lose data if you make the"
-                              " image smaller than it currently is).\n",
-                              blk_size_str);
-            g_free(blk_size_str);
-
-            return;
+            warn_report("SD card size is not a power of 2 (%s). It might work"
+                        " but is not supported by QEMU. If possible, resize"
+                        " your disk image to %s with:",
+                        blk_size_s, blk_size_aligned_s);
+            warn_report(" 'qemu-img resize <imagefile> <new-size>'");
+            warn_report("(note that this will lose data if you make the"
+                        " image smaller than it currently is).");
         }
 
         ret = blk_set_perm(sd->blk, BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE,
-- 
2.31.1


