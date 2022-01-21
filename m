Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A803E4967C7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 23:21:40 +0100 (CET)
Received: from localhost ([::1]:39486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB2Hr-0002Yl-NG
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 17:21:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <svens@stackframe.org>)
 id 1nB2D2-0000Qq-5V
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 17:16:41 -0500
Received: from outbound5e.eu.mailhop.org ([52.28.168.19]:55995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <svens@stackframe.org>)
 id 1nB2Cz-0005u6-Qg
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 17:16:39 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1642803395; cv=none;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 b=aFIRkaBBoeATAM4cUVc9wHW/OAYQjnlbLg6XPGHY//turUSDVn3mySQ1uErjeY7GQME/H5hmTrh5K
 pOq4GkIdIi6Mf2vWz97AWflD94cgnkSXS2xzA5E9m8NEkzpP8fMxI85nnbq+2zyDAfysIMNBHW5Ril
 Bz+sqBDtXC0bFUxz693Yftpl1ggr85I5ZtBKGQfpO09FA8bsxH1i80tHGn7AVaJgISrR9f63nbW8p0
 KQECjkLPItzpYOAtPjLmX3jBYDX9qcjhODTExW6o4vFjdFVjEz50H/15okUweekUgoX0DpADzD97o+
 xVglXn5zlfWvfQJ657B5ICCRA3kYh7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:dkim-signature:dkim-signature:from;
 bh=6PEyNXfGvwTXvuk8p2qZS05e470CbGdR7y1iKL/ViJs=;
 b=M7GP1YYFmUZXeVyAG/GVfR47G3r3EVICrlNA2CrqTzhJ0FCPcskNPHEHBuTINbceBUb7+VhR89oll
 BhX6O5WdmH/X6ev11TZx+fYwhVJKpHS/KsDMlfxxemeRtvzsBibPol5CB/T7wpM2vxUx6amaU+GEYr
 hRQw5M42m+v67pJaew7knpIS4Nim0GNRbInLhNjpmNWzpYC1H+SUaMd8QvdXjj2wowQ7il+AW951YI
 xKQrnMxc3F5pUYvrL5XRa5T+QoO8CalcUs1jrpdiKrS/K8riAXCkq20/dWZJCjRxs8+lVONTUtkItm
 rhxrXNz9Hmw4zqgxgW+XQLvlYrUaduw==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
 spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
 dmarc=none header.from=stackframe.org;
 arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stackframe.org; s=duo-1634547266507-560c42ae;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=6PEyNXfGvwTXvuk8p2qZS05e470CbGdR7y1iKL/ViJs=;
 b=UGGvn4AyT8zA6ud7/LRrA5sXWoqaX1xnB6aNqr+EY0KnRafhn7XOkZw8q3WYwvtaACuRdu1bKiJ5p
 WnIa/ZUGm+NwwmTKF2+0V76ofhsdQee6yvqZjFqeNoEyROIwweb2JoLh2NXxzSm403mLPGcTZsx5ZC
 mkyI7inXVR0SbybQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=dkim-high;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=6PEyNXfGvwTXvuk8p2qZS05e470CbGdR7y1iKL/ViJs=;
 b=o37ryuJ2s7Zmk9NZEUYA3OkL1lLHTLZ3z2Ucg3+O4nIpl9Un2m+CvWU8EyyoTWRMvV5D3YtY2gUy+
 6fcCKuYD9gvktFHBiYvRW0EnNHIhParCCmF886Y/HvHF1f8TFgCzwVuaehK0DUlZMxdmK/CUXfXWF8
 bn/kshXNB4P4o9izRKtVshRwpJPncDxnCuB/17uq9Nbzq+QF6UH7qy2t1BRAo3OnRpHV5kcLfz853x
 hMl+SMC+CoAIsAUMsOlBXqzAFpylaU9sS3xU/a3aXLOwx/EQDJPZkJHZDTGBd3KKRr3c5nHyYvYi6y
 Ii8gLdoYen+eHyyS1oWbG3d7oBwWYdg==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: c9d01154-7b07-11ec-a077-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
 by outbound2.eu.mailhop.org (Halon) with ESMTPSA
 id c9d01154-7b07-11ec-a077-973b52397bcb;
 Fri, 21 Jan 2022 22:16:32 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de
 ([109.193.149.228] helo=x1.stackframe.org)
 by mail.duncanthrax.net with esmtpa (Exim 4.93)
 (envelope-from <svens@stackframe.org>)
 id 1nB2Ct-005WLL-Jf; Sat, 22 Jan 2022 00:16:31 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Helge Deller <deller@gmx.de>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 2/3] hw/display/artist: allow to disable/enable cursor
Date: Fri, 21 Jan 2022 23:16:18 +0100
Message-Id: <20220121221619.1069447-3-svens@stackframe.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121221619.1069447-1-svens@stackframe.org>
References: <20220121221619.1069447-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=52.28.168.19; envelope-from=svens@stackframe.org;
 helo=outbound5e.eu.mailhop.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow to disable/enable the cursor via the cursor control
register.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 hw/display/artist.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 7956a1a5c3..cfae92d3e8 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -80,6 +80,7 @@ struct ARTISTState {
     uint32_t line_pattern_skip;
 
     uint32_t cursor_pos;
+    uint32_t cursor_cntl;
 
     uint32_t cursor_height;
     uint32_t cursor_width;
@@ -1027,6 +1028,8 @@ static void artist_reg_write(void *opaque, hwaddr addr, uint64_t val,
         break;
 
     case CURSOR_CTRL:
+        combine_write_reg(addr, val, size, &s->cursor_cntl);
+        artist_invalidate_cursor(s);
         break;
 
     case IMAGE_BITMAP_OP:
@@ -1320,7 +1323,9 @@ static void artist_update_display(void *opaque)
                                s->width, s->width * 4, 0, 0, artist_draw_line,
                                s, &first, &last);
 
-    artist_draw_cursor(s);
+    if (s->cursor_cntl & 0x80) {
+        artist_draw_cursor(s);
+    }
 
     dpy_gfx_update(s->con, 0, 0, s->width, s->height);
 }
@@ -1419,7 +1424,7 @@ static int vmstate_artist_post_load(void *opaque, int version_id)
 
 static const VMStateDescription vmstate_artist = {
     .name = "artist",
-    .version_id = 1,
+    .version_id = 2,
     .minimum_version_id = 1,
     .post_load = vmstate_artist_post_load,
     .fields = (VMStateField[]) {
@@ -1440,6 +1445,7 @@ static const VMStateDescription vmstate_artist = {
         VMSTATE_UINT32(line_end, ARTISTState),
         VMSTATE_UINT32(line_xy, ARTISTState),
         VMSTATE_UINT32(cursor_pos, ARTISTState),
+        VMSTATE_UINT32(cursor_cntl, ARTISTState),
         VMSTATE_UINT32(cursor_height, ARTISTState),
         VMSTATE_UINT32(cursor_width, ARTISTState),
         VMSTATE_UINT32(plane_mask, ARTISTState),
-- 
2.34.1


