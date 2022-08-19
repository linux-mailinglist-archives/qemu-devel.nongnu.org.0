Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21DA599E5B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 17:42:47 +0200 (CEST)
Received: from localhost ([::1]:46748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP490-0003JV-Eu
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 11:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP466-0005bE-HI
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:46 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP461-000648-6n
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:46 -0400
Received: by mail-wr1-x42c.google.com with SMTP id n7so5625006wrv.4
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 08:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=wQwzIcXEd8CDalnfbzxRsvGcMSl1lPN2VEyNH0COQ4g=;
 b=q6HzCqbT4CxQJgU/Nb6o3oeyUw2LATV+pyhvZw383EKY1FJay+0TS8805bWHjrpxu/
 BJU3gwW8rqNEiKb3G+qEkUgSNzwcX+TJ509b4Mp8LIxkwoEopizFVtsaHyje7O4mY9xL
 tSwCvWbM8KBJFRZ6caejCRras6d5ASizmHcmXcZFRdUprQq9h0RQz5sW5GJUEHDcwITc
 d7stwSNC+UFtFmAi6hlmMqygehSEhLC/J8cdeT8mgwCLt7IZ9loGRWcOnjrkG6c19MXz
 K7BQgYcU+JPh/5ydndEfNHZtXZE/AJ6mbXxmm0XgB2PMkHTD2gZCg/m8HgspaeS9KSxB
 /7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=wQwzIcXEd8CDalnfbzxRsvGcMSl1lPN2VEyNH0COQ4g=;
 b=HevEyGDqVjkFtM+slIWKfG8O5Kh28DZGRxGyHgs5CVXwwWZowP58x2zn9dagbQIcfX
 cIk3RsXy3abXrFlGgBwh77TL/+ithN84jkVtOOIDOEsEeeRDJaiaabi0H+7KOx9cmEz1
 Afa7Hjz1Wmwn1Cg5oh2x23yUHjrMPcGu3ZqCrDFGRLcC9FfuPLe8u23sHxQjiizX/CXx
 sCfKwrL4j/UqzSFlmUgePUnRaecqqrzvgsjW/569F7RCmXQ61XG/XK0BsrkpsymsS69d
 V43ZjD7xtKQwRQvgkfrqQNZvUiHQ2VY7nOFqksuhDn0wo1ljvYOyy1ANx9STmh4hRk1F
 okWw==
X-Gm-Message-State: ACgBeo2oc7kD2tOVH3KJ/wUx1rmmuDMiuBL8OBKE9OhGp/aXaQfNvaVb
 s2/qoozpeYWAlirhkAuiNWBmP9lcWdLPEA==
X-Google-Smtp-Source: AA6agR5QanvdtGf7E/JPhY97wj0zYeFgxNHVyHO9PRhmzvpjvlCc7RrR29G2X/25yFH3EiVy8Vn6rA==
X-Received: by 2002:a5d:668c:0:b0:225:333e:15f3 with SMTP id
 l12-20020a5d668c000000b00225333e15f3mr3442249wru.494.1660923578689; 
 Fri, 19 Aug 2022 08:39:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b003a54109a6a0sm5558396wmb.3.2022.08.19.08.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:39:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 03/11] chardev/baum: Avoid dynamic stack allocation
Date: Fri, 19 Aug 2022 16:39:23 +0100
Message-Id: <20220819153931.3147384-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819153931.3147384-1-peter.maydell@linaro.org>
References: <20220819153931.3147384-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 chardev/baum.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/chardev/baum.c b/chardev/baum.c
index 6a210ffd815..0a0d12661a4 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -299,7 +299,8 @@ static void baum_chr_accept_input(struct Chardev *chr)
 static void baum_write_packet(BaumChardev *baum, const uint8_t *buf, int len)
 {
     Chardev *chr = CHARDEV(baum);
-    uint8_t io_buf[1 + 2 * len], *cur = io_buf;
+    g_autofree uint8_t *io_buf = g_malloc(1 + 2 * len);
+    uint8_t *cur = io_buf;
     int room;
     *cur++ = ESC;
     while (len--)
-- 
2.25.1


