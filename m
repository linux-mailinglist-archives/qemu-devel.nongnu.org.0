Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5904CEBB3
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:24:06 +0100 (CET)
Received: from localhost ([::1]:52406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqrl-0007wD-Gx
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:24:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqWK-0001tq-Ix
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:56 -0500
Received: from [2a00:1450:4864:20::42f] (port=38591
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqWJ-00049z-1b
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:56 -0500
Received: by mail-wr1-x42f.google.com with SMTP id t11so19341844wrm.5
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kTrw3XRDj+tgiVtXO7ENwfe1mgMm5pqjvasuYqM/79M=;
 b=msaYdiifzTp3ERXihI8HAoGZ73F/I0a2FnaJQF28y8pKqvh9eDMmCHNpgZiN8SLAiS
 VuvOGJXV7Pm+n64rNf9a0idFQ42+9p9UKit/sW30J32JcjkvSc4Ugve847Q87fvkXPvo
 boWn7snoLsMSgzeiElZy0VSK6fg5OGM/BPmVN7pe53xaLB32fhDihaon9zphtrNvt+FP
 Pd1CbEy56paitBx/rE5Cgb6WywIhTkxiQFnR6mC7HRXHkO/A0qlVUxYfpb+NmRJ4HHyw
 rY84xEbXpgWSVH7kXi1J+m2s2XkkPFe7BIXObURnHcA5IzlYlFZ5QXc6KNaOacP2pUGz
 xMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kTrw3XRDj+tgiVtXO7ENwfe1mgMm5pqjvasuYqM/79M=;
 b=MeSZFeyxqzxR7zwUDBFiQWzrt7j8wBgKwEv5ztzzp/FoMKjGcE38tNqCS1jlNGuth+
 H2NGGGS8wj42oziTWhv+tzTVLEQxpNBPL0ORHjLJFb3VYFIPFDhYsWvqiB3LRXCMZMDX
 Wu60/VL6Es6MREVcxvsJbJ2FNO0F9tVFw+dcej3pmingVwf9z91U2Dk3QTkY9jvc8mNh
 SgYuR13HrG5ktClo4KcqTk0PSM/jmk27RpVDgWJufrzugSiFAcHyu1COFOFBDX+in5i2
 uv2yIU7kJeDg0dCvg50EFWf+jtj9um+ckfY4i0caZO3nTvBvYbStoK8xi0B/QEFnw8EY
 KA7Q==
X-Gm-Message-State: AOAM531Nr/iQYV1dp+ymkTm7iQCf5h63cVaiuTIKrhwOGV79pee5uBo/
 KvhbOKfOvESgOqs2A5bbSt2FeEj03Xo=
X-Google-Smtp-Source: ABdhPJz0EsjYrdjOR7EA58JMIbeG19RK6Xg47s0wXWhRIdcGo+SJXHr8wPB/unbd2CmWgGxRiZIvIA==
X-Received: by 2002:adf:e401:0:b0:1ed:c254:d51f with SMTP id
 g1-20020adfe401000000b001edc254d51fmr5174751wrm.49.1646571713237; 
 Sun, 06 Mar 2022 05:01:53 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 o6-20020a5d6846000000b001f044a8e214sm8813635wrw.107.2022.03.06.05.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:01:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/33] meson: Display libfdt as disabled when system emulation
 is disabled
Date: Sun,  6 Mar 2022 13:59:48 +0100
Message-Id: <20220306130000.8104-22-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When configuring QEMU with --disable-system, meson keeps showing
libfdt as "auto". Mark it as disabled instead.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220214183144.27402-2-f4bug@amsat.org>
---
 meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 038502714ab..746ce478e03 100644
--- a/meson.build
+++ b/meson.build
@@ -2432,8 +2432,8 @@
 endif
 
 fdt = not_found
-fdt_opt = get_option('fdt')
 if have_system
+  fdt_opt = get_option('fdt')
   if fdt_opt in ['enabled', 'auto', 'system']
     have_internal = fs.exists(meson.current_source_dir() / 'dtc/libfdt/Makefile.libfdt')
     fdt = cc.find_library('fdt', kwargs: static_kwargs,
@@ -2476,6 +2476,8 @@
     fdt = declare_dependency(link_with: libfdt,
                              include_directories: fdt_inc)
   endif
+else
+  fdt_opt = 'disabled'
 endif
 if not fdt.found() and fdt_required.length() > 0
   error('fdt not available but required by targets ' + ', '.join(fdt_required))
-- 
2.35.1


