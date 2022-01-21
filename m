Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 703EB4967C6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 23:21:40 +0100 (CET)
Received: from localhost ([::1]:39412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB2Hr-0002W2-1I
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 17:21:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <svens@stackframe.org>)
 id 1nB2D0-0000Qh-Oa
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 17:16:38 -0500
Received: from outbound5i.eu.mailhop.org ([35.156.234.212]:55838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <svens@stackframe.org>)
 id 1nB2Cy-0005tz-Rg
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 17:16:38 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1642803395; cv=none;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 b=TKpv3DABgGUOiCBnem+06K1DCfhBdnbHDzA5v3xklYCV4Aix9qY9w0BNfyGC+OpbC5R4Tako1fMun
 uKshYhz5IbZIZOresEGBlyEvmS7G1l96mf3uZXevQaOA4K3+6u6k985SV0DbXoiRABukxcTdqWXWDX
 HxH0ff2SGTy8PHtkPBo8m6tSIv1TsX/MnugT4z2cALli1fsCzkfVtF78ZPvRN7WxDi1OqgRSxwYiBl
 9LL4r/oKfNbGrFiP8C/S3oIxKya1JjRJLuGRAlbYsktQgxeyKMb4gpPpIokYGyrr8ebEj9VWwYwUPM
 LEAuj8AqtWiPl7pRHpzL4X2trCrHVfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:dkim-signature:dkim-signature:from;
 bh=+TFtKvGbpFMj5aBwp88gHv/RtxEy+AzLV1ymRJ96KAs=;
 b=HEaxpA+diwmZjqoGTv5MPxixKoEbW3qN4cm0HJwlAsfrHozkK/dEfLIhEy+T9wMwuiX0PEstIfMQN
 bDbXPpmFDqYed+8OXKRgLlbbIJg1UjJDYWq0Qy9ms2UxpZsum9beWnrkFG4cE0ZDisVJ8N9FXTAXCj
 qjE+9uN7qR873PyGErKP2/j75r9HJ5sONDJsvjsj5nOlWxaXvqVRvOTnN1YAuXq2y4iDWRAJIYlcTd
 fg5MMVUdH2rVa/Nujgjms5giXYxRloSWKl+KAmONt5EaODobVxhLCXWgFH1HB8FpkCO5SI7WxZggPl
 ydwcy6aQPSUnHcFtCmFiy8bKlNSZWAA==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
 spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
 dmarc=none header.from=stackframe.org;
 arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stackframe.org; s=duo-1634547266507-560c42ae;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=+TFtKvGbpFMj5aBwp88gHv/RtxEy+AzLV1ymRJ96KAs=;
 b=ZqBZdDIEFEYb5OW5UtyBNYvdM+EBOqzQoW8SDoYawKDi3bxWj0HNTmJSIAMMGdzmEXxARkH8CToyH
 /dytDKtTZPxItnflxVii1VSQ+m/UQminn3nOJKYiHYFLVtZER32HAJPWOmm/DBSAonmGtis0Z9C/V1
 iXF1zSdfSup6peDI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=dkim-high;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=+TFtKvGbpFMj5aBwp88gHv/RtxEy+AzLV1ymRJ96KAs=;
 b=IOsMYKPPJ9UYFdrw5hWUEe1kVlEtfXz6aAAC3nHqB60p9m0liGmRWmnq2Ws1OEv0zPXnOmGFz4i9S
 Xna5Uw1dj2H2pqr6Lbcv34YrwayscJCH5eacfDYKVS5fMutdbzkgXN524WC3fsohyDgYvNcPnhOVzv
 yc00zfGjVH59ikl3PGv+KDQNu/giUPZkr+SNeBYe+n6ScjV0mfqxOWFLQS0GsxYCsO1bYljTjEKrGW
 hlLRxjnbXovLI9O88bhPWD0VM7IvKvQMdwR6oNrLftX0h585Xqi6MRplWhJ7MdQZLGSLW6EXBxnQYZ
 yL2MkOP8uk2WWGGByEzBofeps58ac/w==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: c8ee0656-7b07-11ec-a077-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
 by outbound2.eu.mailhop.org (Halon) with ESMTPSA
 id c8ee0656-7b07-11ec-a077-973b52397bcb;
 Fri, 21 Jan 2022 22:16:31 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de
 ([109.193.149.228] helo=x1.stackframe.org)
 by mail.duncanthrax.net with esmtpa (Exim 4.93)
 (envelope-from <svens@stackframe.org>)
 id 1nB2Cs-005WLL-38; Sat, 22 Jan 2022 00:16:30 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Helge Deller <deller@gmx.de>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 1/3] hw/display/artist: fix cursor position
Date: Fri, 21 Jan 2022 23:16:17 +0100
Message-Id: <20220121221619.1069447-2-svens@stackframe.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121221619.1069447-1-svens@stackframe.org>
References: <20220121221619.1069447-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=35.156.234.212; envelope-from=svens@stackframe.org;
 helo=outbound5i.eu.mailhop.org
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

Register 0x300200 and 0x300208 seems to be used as scratch register
by HP-UX for cursor offset data. It writes a calculated value on X
startup, and later reads it back and uses this as offset for all
cursor movements. I couldn't figure how this number is calculated,
but forcing it to a fixed value fixes the cursor position problems
for all HP-UX versions.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 hw/display/artist.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 21b7fd1b44..7956a1a5c3 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -326,15 +326,8 @@ static void artist_rop8(ARTISTState *s, struct vram_buffer *buf,
 
 static void artist_get_cursor_pos(ARTISTState *s, int *x, int *y)
 {
-    /*
-     * Don't know whether these magic offset values are configurable via
-     * some register. They are the same for all resolutions, so don't
-     * bother about it.
-     */
-
-    *y = 0x47a - artist_get_y(s->cursor_pos);
-    *x = ((artist_get_x(s->cursor_pos) - 338) / 2);
-
+    *y = 0x400 - artist_get_y(s->cursor_pos);
+    *x = (artist_get_x(s->cursor_pos) + 16) / 2;
     if (*x > s->width) {
         *x = 0;
     }
@@ -1122,11 +1115,15 @@ static uint64_t artist_reg_read(void *opaque, hwaddr addr, unsigned size)
         break;
 
     case 0x300200:
-        val = s->reg_300200;
-        break;
-
     case 0x300208:
-        val = s->reg_300208;
+        /*
+         * Seems to be relevant to cursor position, likely a scratch register.
+         * HP-UX initializes this with different values depending on version.
+         * Best guess is that this number is generated from STI data or other
+         * registers. I couldn't figure out how this number is generated. For
+         * now hardcode it to a number generating a zero cursor offset.
+         */
+        val = 0x00f01000;
         break;
 
     case 0x300218:
-- 
2.34.1


