Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADF73DDD70
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 18:19:46 +0200 (CEST)
Received: from localhost ([::1]:48046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAafJ-000148-B0
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 12:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mAabV-0000xP-4K
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:15:52 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mAabS-0006pR-TL
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:15:48 -0400
Received: by mail-ed1-x52a.google.com with SMTP id d6so17602030edt.7
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 09:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uKkyh3OYQ0mfw6Y9gyrWs6boJPfL3KQaIy+v+IFJpNM=;
 b=VuJjfKvsI8/T0P7XW2BhCywq/76rNm2HssiGQh9JdQr/km6lPqzrvm8/4/Id9/KbXe
 mV1NTHv7BSHQtjSOpOet2sWKfccgZU8ZCdmohFA9Rp0tQ+GKHOnZWT/Z1ZaI6+EmLZL/
 QR2qkVeIR/9At4p72S0AscOW6gft5di1FrsAFMJJRZkkSLQ14tuHBkjv6HCpx7SuvblM
 8OSLgQI67KTjUD5uy+l2i3BDHZwC3x405LC4az/1xQRtbYOabQoR+iTGdkobkk4KQnnq
 XhGV7QqduMzmpV/bP24TL0g/VVXVmXPuz3gBMMQLxNzYxwPFsQTAo8/cG+cSlfmbOiOZ
 4+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uKkyh3OYQ0mfw6Y9gyrWs6boJPfL3KQaIy+v+IFJpNM=;
 b=dYjLEx9RqI4TdT2P/tBAe5Mnj5uY40Kdh9YCGyDnOnXs19fqQrMJYOauGGBDLcEANK
 AJ59pgCCOD5eIciVlKD3WERqW0IsqnapZAN8kyzDJz1EgHKF83vlbuqSoAkCWVT5sJZ8
 aYdkVZ+IXc8/msOX9VmzfwzF9l3QnY9O6wgdLwmwkGy/i1c/GRorg34944IGzYMkSjws
 3PJPIPIsgrityBJzzDm+eNisLzjWrddHWsrU63tNmbN7bRbg9TRQklmn6l991g17x81L
 nKe6gV21XrNlvnfPUoYBm5vnZg4t6V9QxT7y6U/XgFbXDHz+Xn/WE9TC2SV7w6B95IrY
 FaVg==
X-Gm-Message-State: AOAM5337LYe3ydKB18tW2Oe6yGbe0l8kYezb9K+BTb3kJxh0ycomJ2q2
 LX1Im09/ZMWMwAZ0Dlex4hfZ/VrQPPZymA==
X-Google-Smtp-Source: ABdhPJyJ+tiU0SuY2TaJepC34/Iw2HFFqaX1m++MHe/YjOXV6w58kHb5rSdg8UxEfacqROIWGSQJ3Q==
X-Received: by 2002:a50:d71e:: with SMTP id t30mr19977187edi.72.1627920944036; 
 Mon, 02 Aug 2021 09:15:44 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f15sm4835144ejb.125.2021.08.02.09.15.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 09:15:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/8] vl: introduce machine_merge_property
Date: Mon,  2 Aug 2021 18:15:35 +0200
Message-Id: <20210802161542.381976-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210802161542.381976-1-pbonzini@redhat.com>
References: <20210802161542.381976-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It will be used to parse smp-opts config groups from configuration
files.  The point to note is that it does not steal a reference
from the caller.  This is better because this function will be called
from qemu_config_foreach's callback; qemu_config_foreach does not cede
its reference to the qdict to the callback, and wants to free it.  To
balance that extra reference, machine_parse_property_opt now needs
a qobject_unref.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4dee472c79..93aef8e747 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1534,23 +1534,36 @@ static void machine_help_func(const QDict *qdict)
     }
 }
 
+static void
+machine_merge_property(const char *propname, QDict *prop, Error **errp)
+{
+    QDict *opts;
+
+    opts = qdict_new();
+    /* Preserve the caller's reference to prop.  */
+    qobject_ref(prop);
+    qdict_put(opts, propname, prop);
+    keyval_merge(machine_opts_dict, opts, errp);
+    qobject_unref(opts);
+}
+
 static void
 machine_parse_property_opt(QemuOptsList *opts_list, const char *propname,
                            const char *arg, Error **errp)
 {
-    QDict *opts, *prop;
+    QDict *prop = NULL;
     bool help = false;
-    ERRP_GUARD();
 
     prop = keyval_parse(arg, opts_list->implied_opt_name, &help, errp);
     if (help) {
         qemu_opts_print_help(opts_list, true);
         exit(0);
     }
-    opts = qdict_new();
-    qdict_put(opts, propname, prop);
-    keyval_merge(machine_opts_dict, opts, errp);
-    qobject_unref(opts);
+    if (!prop) {
+        return;
+    }
+    machine_merge_property(propname, prop, errp);
+    qobject_unref(prop);
 }
 
 static const char *pid_file;
-- 
2.31.1



