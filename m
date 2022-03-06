Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCD44CEE80
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:30:08 +0100 (CET)
Received: from localhost ([::1]:46742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0KF-0000oX-8B
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:30:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR09m-000144-LI; Sun, 06 Mar 2022 18:19:18 -0500
Received: from [2a00:1450:4864:20::435] (port=34532
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR09l-0007Tf-7c; Sun, 06 Mar 2022 18:19:18 -0500
Received: by mail-wr1-x435.google.com with SMTP id j26so10296269wrb.1;
 Sun, 06 Mar 2022 15:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3t7+/mInACvZRYaoFuoTkf2bXtSvwwVEGgg+XICyn98=;
 b=pBE1ErkSmCwti0ezSSn3RhFe/Vle4NxGvsEZWw5OZQ4xj6MsOrxxWdhiwUXuGuTY1w
 cJBWwf+jX+RFuWzYcsjQEIxjFcaCFV93UQNAiU1G2qdl0uzu1LQJgY7uBf2rQFvzbdcA
 47JR3OUNxr0Fnd8QV/zuOKTdei16/tTFzkC6B47cIZqSTLQR3xoN72fE/9Cl0nQV2d8E
 1IkyoLY2xoeB9/fgjoJBXV4XlgQu/M8CZzXBzaUOOW7hfjqBJgztG4E1UPuKayu/E2gs
 0a1ttdGMmWHmjfxt8/y1oZkbWNPejlQ8JFFuP35TBFO5mh2vGcxbiI73DG0g/0LOQnN+
 XnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3t7+/mInACvZRYaoFuoTkf2bXtSvwwVEGgg+XICyn98=;
 b=lPCk7CqIxfxqzh7Zb6Vdj6VR/uNJCAx0tYWzRiHOx0/Vzfcn7O1rOo9dHi56oa59dt
 ovuYarrEEdxQGAXHKUpWNTVo90WVqXZqcDFHyHs3GzB8uj9rqQnx3tjiQg7azUb4eQq6
 lSLYiY8e4i79c7CsNz2QX7nkaakaMUTReZ6WGVOUr68QOJDb0RwiFOa3Xol5CTOBYRnh
 sZw8guelxMZOxG48NQLgej8mW6PKI+gHhqd5U9EWeFY8mrmrcXT5RLe05e1hMhFknyFT
 cI1vjagR12PEdTmwySRsQPW8aB6mgOTCyOxgEKpHVk0kQQfagTII2EySjGqD0+xUdKbR
 K88g==
X-Gm-Message-State: AOAM533Qtq7GNHz3Ne+3OBGDJlmDXYu4Azx9DthB4dP0/r1z6Imu6FJs
 L5IWZBlHiPx1LdcWfyvMX51adBebbDo=
X-Google-Smtp-Source: ABdhPJy6iX5M2HLhf7G77Wp6ObJUl4xEig48PNmQWKYpIM8IMMZcBRZF5bg5Xuh875fmKVUAd6UHSw==
X-Received: by 2002:adf:f804:0:b0:1f0:326e:5e78 with SMTP id
 s4-20020adff804000000b001f0326e5e78mr6507322wrp.251.1646608755220; 
 Sun, 06 Mar 2022 15:19:15 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a056000018c00b001f079518150sm6632238wrx.93.2022.03.06.15.19.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:19:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 15/22] meson: Log QEMU_CXXFLAGS content in summary
Date: Mon,  7 Mar 2022 00:17:46 +0100
Message-Id: <20220306231753.50277-16-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index 8ca2b7c8c2..0d38b2e72a 100644
--- a/meson.build
+++ b/meson.build
@@ -3470,6 +3470,7 @@ if link_args.length() > 0
   summary_info += {'LDFLAGS':         ' '.join(link_args)}
 endif
 summary_info += {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
+summary_info += {'QEMU_CXXFLAGS':     config_host['QEMU_CXXFLAGS']}
 summary_info += {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
 summary_info += {'profiler':          get_option('profiler')}
 summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
-- 
2.34.1


