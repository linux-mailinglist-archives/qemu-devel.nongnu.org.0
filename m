Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF10336BE76
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 06:25:49 +0200 (CEST)
Received: from localhost ([::1]:54340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbFIC-0001vN-7E
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 00:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uenobk@gmail.com>)
 id 1lbD42-0002S5-HY; Mon, 26 Apr 2021 22:03:02 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:33475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <uenobk@gmail.com>)
 id 1lbD40-0003Nk-Lw; Mon, 26 Apr 2021 22:03:02 -0400
Received: by mail-yb1-xb34.google.com with SMTP id p3so46753730ybk.0;
 Mon, 26 Apr 2021 19:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=x6ev/h+An1WJYWDmxr1+5dtgNa7FqFnjJ2Zvo68ft4s=;
 b=MyIiY24jjqKhk/6sdIVNtWxOWWHuDaS7EO/JC1Apcta+iy3P/1sJIcgyWeIs5RKDJz
 7g8UpzwCON284mG1hkERyeKDU+loaXdhDGUamu43Ea7J/HCw505cL73KIggGguVpPEZu
 Kkj/09yHvaBmtKBS2Carp57A+UGWg1EBBCy4VAol7mEEAOIsAcq/ALTsv2qxR6gIF1co
 vZuuaUXuiFjW6XFI80l1uwTdEFuCtaPEoJGI12jtDfLtIDXOwhJRNCtYMKY6FZPrJkgP
 J61UxHwZV2PBxFbxSZjNaOkp/anewWkF72zlg9XdFIZo+apSffxmGckyvxvm1Vh/hH06
 sCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=x6ev/h+An1WJYWDmxr1+5dtgNa7FqFnjJ2Zvo68ft4s=;
 b=rTfHznDH7V/J8fInJTMHQteCVfYHAjYe/MP1SqQYiPux6iDoM8UlEb5punlRup0iFB
 08hr+mLcli3lvEA6Nfw/q6S946Zvq4gmyX2+knzBsqZT6pq91Youk04BIH20f6WvbPsS
 tKve75vinppfZL5jlYfBC29ElbSc+feXJNKFi7LDO2OvYc+5Z2Jjf0jGowEYutVG/OLK
 DVuyJzV4Wr/louhsWPNAns80yDsC9y+36duLIIxavwy+stIsMf8TgVfUssN1CghVs7h0
 npKiEogmyfjXBmsoXRKrBw7tdqqeBA5nCfj0/6jiMUrSQ1CA1QkV3HirXwMA/h6i/dPB
 19Vg==
X-Gm-Message-State: AOAM530nTvqM7cV38NV0+wKezx2nkhNjRfZUWZX/Gx6f3Phb4UFRSehR
 H6b5TuQ18gjpmnp6mMj+EjXTJRUsrh8s1Njjdg+fusxY/VVn5HGT
X-Google-Smtp-Source: ABdhPJyn4L3YDN6eJ7RwOjws7HVhtOyrYpawpJOOt+mZJxGFeYX7E3BgbhfcWkS0qfvnt7hCIvpdRC5TsWJVhDAABNs=
X-Received: by 2002:a5b:44e:: with SMTP id s14mr30066311ybp.11.1619488977191; 
 Mon, 26 Apr 2021 19:02:57 -0700 (PDT)
MIME-Version: 1.0
From: Katsuhiro Ueno <uenobk@gmail.com>
Date: Tue, 27 Apr 2021 11:02:46 +0900
Message-ID: <CA+pCdY3iG+pKKQqEVknnWF-W0wK36S4U1jxPvxmGAPp6FFvz1Q@mail.gmail.com>
Subject: [PATCH] hw/input/hid: Add support for keys of jp106 keyboard.
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=uenobk@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 27 Apr 2021 00:24:49 -0400
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for the following keys: KATAKANAHIRAGANA, HENKAN, MUHENKAN,
RO, and YEN.  Before this commit, these keys did not work as expected
when a jp106 keyboard was connected to the guest as a usb-kbd device.

Signed-off-by: Katsuhiro Ueno <uenobk@gmail.com>
---
 hw/input/hid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/input/hid.c b/hw/input/hid.c
index e1d2e46083..8aab0521f4 100644
--- a/hw/input/hid.c
+++ b/hw/input/hid.c
@@ -51,8 +51,8 @@ static const uint8_t hid_usage_keys[0x100] = {
     0x45, 0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e,
     0xe8, 0xe9, 0x71, 0x72, 0x73, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x85, 0x00, 0x00, 0x00, 0x00,
-    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-    0x00, 0x00, 0x00, 0x00, 0x00, 0xe3, 0xe7, 0x65,
+    0x88, 0x00, 0x00, 0x87, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x8a, 0x00, 0x8b, 0x00, 0x89, 0xe7, 0x65,

     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-- 
2.24.3 (Apple Git-128)

