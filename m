Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923922F6265
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:51:57 +0100 (CET)
Received: from localhost ([::1]:43410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l032a-0000m2-K4
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1l0300-0007RC-F4
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:49:17 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1l02zy-0002CC-TK
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:49:16 -0500
Received: by mail-wm1-x336.google.com with SMTP id g10so4749294wmh.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rmx4TdmD0MZ2eVuO2ekdHKsxNp6i3G8BEbLuvtvKoq4=;
 b=klJ7I+4LZ3+SSDUBgomSmxxe5KuKVSarJ0kI+qcoZf5egJ27FPIcXcrhLjEsoj5aEG
 pxqpZcObgpCRvZRqQjQ18OpCB9aeq5NqiznzHXee95q3dnYm3iAfXQ1iP7Vyv9H1STcc
 E+C617by2UIimKe/qT1CH3QmGjbG4BbMEk4y/uX0ErLg5jtRb+VroZTYcKB5v5qDTCT8
 z/AcETpM8cYvdnQRGWDGzGm1LezLSnd4clbQQRpSQlgEV6D7Q9k55CL5UNX7JOJ1zrf/
 z4DKaB/Cdw6P1AS4oUeDiOkKw6WxZllAj2933tBIK5W00PneDl8UOYZfjWAfTY+vIdA3
 ITBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rmx4TdmD0MZ2eVuO2ekdHKsxNp6i3G8BEbLuvtvKoq4=;
 b=BpmooBgjhdgIYW7lvC8xAYdHsnIthN/h1wr3OcaEB4BiCe+JlGFNbn/0bod6cchc1J
 tyKEkN7M8I+T4i7yF53ZSEUgn8JQwlqDTSn8LZWiuOBh53racq7utlIzgl9O8PTx1WNA
 kJ2S8+VUTTE0GtiafK9D99fLkhXJ0yqkBAShunNZOsmvz0PukTOa7TWRsflagYgqPMmr
 eI21xwo9Qote+MYoXZaCK3jtnsd58+TlEYjgWSz6wUhxiVnFH6XORkbkFGnggZQanJH7
 AlBSnjLkr0feNOT52k6pXqVcyd/9lAtd8UBa60Ejbp6Bpdxqphu/TaTAasPbYmkIEM3l
 U0cA==
X-Gm-Message-State: AOAM531Id2hpHqbIjWl9LhcYqMM/fUyGSGxtub/VUVUy69xT1I1UQ81s
 eobcJgbdd8330o1D2j7o/U8z+Uksz0xGZhT5
X-Google-Smtp-Source: ABdhPJwbyyluAHkg+w9epJdpCyvYdRk5hf4zVAGcTxwCQraVdWGj5YzR5Xxl3Mukgh7b+G5UCdu6QQ==
X-Received: by 2002:a1c:3286:: with SMTP id y128mr4059192wmy.104.1610632152581; 
 Thu, 14 Jan 2021 05:49:12 -0800 (PST)
Received: from localhost.localdomain ([213.91.86.150])
 by smtp.googlemail.com with ESMTPSA id q7sm3611465wmq.0.2021.01.14.05.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 05:49:11 -0800 (PST)
From: Nikola Pavlica <pavlica.nikola@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-devel@nongnu.com
Subject: [PATCH 2/2] ui/gtk: update monitor interval on egl displays
Date: Thu, 14 Jan 2021 14:48:51 +0100
Message-Id: <20210114134851.292767-3-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210114134851.292767-1-pavlica.nikola@gmail.com>
References: <20210114134851.292767-1-pavlica.nikola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=pavlica.nikola@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: r_qemu@t-online.de, philmd@redhat.com, kraxel@redhat.com,
 Nikola Pavlica <pavlica.nikola@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running QEMU's GTK UI without EGL or OGL, the
gd_monitor_update_interval function gets executed and the display refresh
rate gets updated accordingly. However, when using EGL or just regular
OGL, the function never gets executed.

Which is why I decided that the function should be in gd_egl_refresh
where the display output gets updated, in the same vain as how it's done
for normal GTK UIs (aka. those without EGL) - in it's display refresh
function.

Since the gd_monitor_update_interval function now is exposed, we are
going to use it to update the refresh rate.

Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
---
 ui/gtk-egl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 99231a3597..71c3d698b4 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -113,6 +113,9 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
+    vc->gfx.dcl.update_interval = gd_monitor_update_interval(
+            vc->window ? vc->window : vc->gfx.drawing_area);
+
     if (!vc->gfx.esurface) {
         gd_egl_init(vc);
         if (!vc->gfx.esurface) {
-- 
2.30.0


