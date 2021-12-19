Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27C647A0F6
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 15:31:28 +0100 (CET)
Received: from localhost ([::1]:43378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myxDj-0004t8-TS
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 09:31:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx2t-0003io-Nc
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:20:17 -0500
Received: from [2a00:1450:4864:20::529] (port=42712
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx2s-0006N5-3I
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:20:15 -0500
Received: by mail-ed1-x529.google.com with SMTP id j21so23421240edt.9
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 06:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NppSTb94GidqFoYp7M1h4NK2cjGP1OYoE31FoV7I3R0=;
 b=RlD6iZhg0qGuRCMNjH4Uma6gsw7WGYrd9+63ZZnc9amYGO1xcUWyU9gbUn1sMrdLsy
 P1xGQmweymnEkJXRff9OIa03oEvoO8Ooc7UyHAgdbfwtQnptlVtuiCHxwI0skSlIrs5N
 MuYeY5vsk6sAjg22AiJzoVLO+1FXbgMR9cu3JTLs8P47fneaUV80LZQKoN6SlIYhKMx4
 F/L9ERwYbIzTuxCm0seTMYYLK9md3/ibyZ0CZ+pRB3V3qGFlsFPM58dh8oV4pEI9QoWs
 wSJ236sYYuR7OrLnmSyzIr99xpOXKCTViiD8Ht6L64S8EGADeboPw/jy16fxV9FfZiTy
 gUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NppSTb94GidqFoYp7M1h4NK2cjGP1OYoE31FoV7I3R0=;
 b=uHLsP4ppzPRFGDC/twmwo0tdDLkpx/PzCe2gwqhezR/mqRqa6Yu1NU8gUPlDy96wk2
 p+MIPrrEOCdK4lQf3V6Xqx6EteJIOLl9XiNL9abNCOlhs4iO/vguVglCbjW2w7U6MTZS
 MLVb3xXEWgtm5VXeVKW3JMoY+/vmAi/YGmhU6XOTRGWaKKBixYNWDsqXU6rNjO/1cd8S
 WSgzFNWeyP3wpF3hkFIejVY4h/WdKISsTnoKD+FDzzWvEwsLbz9AYsOp3/+Liw+P3yob
 gi/Jan0HOhjleA2xBMSuruOKtwX7B954Ho/pHXKyrFsIZ2mI3zjJmf4+0rrydbbox3nx
 q+Nw==
X-Gm-Message-State: AOAM530x1Oi1P/kwotvkp+2lTgCHA3E89JX+DScTZYKJXubjkRXPje+p
 siK30L1lQu6XysUCuPQR/+lFNH55BIM=
X-Google-Smtp-Source: ABdhPJzipBAqpCxmXjB7AGGnGgQ8j19QPY+w78bwgxWSPsnbgvXBjM6g3qw8H9wfZmCQtZ33IvZoRw==
X-Received: by 2002:a17:906:6a90:: with SMTP id
 p16mr9416148ejr.342.1639923612862; 
 Sun, 19 Dec 2021 06:20:12 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y19sm5791584edc.17.2021.12.19.06.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 06:20:12 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/16] hw/i386/vmmouse: Require 'i8042' property to be set
Date: Sun, 19 Dec 2021 15:20:08 +0100
Message-Id: <20211219142008.248807-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211219141711.248066-1-pbonzini@redhat.com>
References: <20211219141711.248066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Calvin Buckley <calvin@cmpct.info>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

If the 'i8042' property is not set, mouse events handled by
vmmouse_mouse_event() end calling i8042_isa_mouse_fake_event()
with a NULL argument, resulting in ps2_mouse_fake_event() being
called with invalid PS2MouseState pointer. Fix by requiring
the 'i8042' property to be always set:

  $ qemu-system-x86_64 -device vmmouse
  qemu-system-x86_64: -device vmmouse: 'i8042' link is not set

Fixes: 91c9e09147b ("vmmouse: convert to qdev")
Reported-by: Calvin Buckley <calvin@cmpct.info>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/752
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211201223253.36080-1-f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/vmmouse.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
index 3d66368286..a56c185f15 100644
--- a/hw/i386/vmmouse.c
+++ b/hw/i386/vmmouse.c
@@ -286,6 +286,10 @@ static void vmmouse_realizefn(DeviceState *dev, Error **errp)
 
     DPRINTF("vmmouse_init\n");
 
+    if (!s->i8042) {
+        error_setg(errp, "'i8042' link is not set");
+        return;
+    }
     if (!object_resolve_path_type("", TYPE_VMPORT, NULL)) {
         error_setg(errp, "vmmouse needs a machine with vmport");
         return;
-- 
2.33.1


