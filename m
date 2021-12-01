Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2819465956
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 23:35:25 +0100 (CET)
Received: from localhost ([::1]:38470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msYCC-0003Oh-C5
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 17:35:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msY9x-0001wD-BO
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 17:33:05 -0500
Received: from [2a00:1450:4864:20::329] (port=40550
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msY9v-0008DL-7O
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 17:33:05 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so894143wmj.5
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 14:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mj9lZ7gqkUw1Cr+nKPUfdX+IjUX4zFOLlyujuK8+hVE=;
 b=KMppG0Bqg5nOGgf6Z0ESG/Q3ZKhlQfYyt+vLZ9Wgn5NrVcZohZqhwitTXHKkkdGoln
 FApoXnAnr8SnjT/6LfsLXocyhUseWueWDTda2cY7qul+T7Km+izkOybhQ5BTEr6FNKyE
 kJqxVGUSRpv9PWwyN7MfJwYQhSzJmNtSuWt589wwcwo9vbkKzwV/saTSYQZ4Rwdl46FV
 etscUUL0WmH0WSt/3qmG1ZdefEwC125FgE78JDFXK860VdvHPkxusEN0Rx9fCI7poM7z
 MP8dBCrCeV+0iCn5HRpCzzX+dgAOdi6qP1dh691kuSN3jULEkPEPAtELLjEMPYRCYVqk
 3+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Mj9lZ7gqkUw1Cr+nKPUfdX+IjUX4zFOLlyujuK8+hVE=;
 b=BobSMkLZnOyCAvUixOp16sLw2NU6Y5z40ZjRTm9LiA45DtTZp5rHoteJriRKt7hY+s
 E26DkpwLDe5h5sR9wPiWX/KIXlDZYaGPH5QvQgKmxqkkXfzBb/h2wxUnfzQ26MENLMPo
 z+m0LLcaGEe0ehz0MqWzAhLYeCPVdRD0Np94LbMxxciUynqIR0KikQBwemi6tKfhdwqT
 tcrjZyFP+BDq0RciEfTbPOWaOtyLj1Xk3ZoMEw02ujj/LhrLK6v2FWivIVpDAzSxMb3G
 hdy/aPntWoRmEpiBtnNyt2hEHl+07V1PJHsXgB9gpw+PxXWkB7+kHS3VmFlMYPTasJvj
 VOZQ==
X-Gm-Message-State: AOAM531Vt0eq1KmEj0hOLOc/xYPULV+X1EYZIn6e5w9j8+hDaSQ98/Ga
 p8Ywhbf9ovgz8ErjKGEsQ9QQ0YkrvUQ=
X-Google-Smtp-Source: ABdhPJz60Kh7m98LGFE576B/yRABI3tF/VfbVMz7pH6c4UAPcJv2EXEqohpFpCkFP/ZAs4zGe/gvug==
X-Received: by 2002:a05:600c:4104:: with SMTP id
 j4mr1325815wmi.178.1638397980374; 
 Wed, 01 Dec 2021 14:33:00 -0800 (PST)
Received: from localhost.localdomain
 (abayonne-654-1-79-213.w86-222.abo.wanadoo.fr. [86.222.222.213])
 by smtp.gmail.com with ESMTPSA id p5sm906988wrd.13.2021.12.01.14.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:32:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/i386/vmmouse: Require 'i8042' property to be set
Date: Wed,  1 Dec 2021 23:32:53 +0100
Message-Id: <20211201223253.36080-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Calvin Buckley <calvin@cmpct.info>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
Amusingly 'qemu-system-x86_64 -device vmmouse,i8042=i8042' now works.
---
 hw/i386/vmmouse.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
index 3d663682863..a56c185f159 100644
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


