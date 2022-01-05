Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C922485436
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:18:27 +0100 (CET)
Received: from localhost ([::1]:39890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n577S-0004sk-AL
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:18:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gN-00089R-TW
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:27 -0500
Received: from [2a00:1450:4864:20::536] (port=44621
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gI-0004CR-D7
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:27 -0500
Received: by mail-ed1-x536.google.com with SMTP id w16so162409980edc.11
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 05:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pUnzJLXg28F5U/2Y8hEJUScjBpBLM8tJ3KnBsGV8yUU=;
 b=jfPeaGiYcLRL1UN0Resi0kq7dGYfeoSn6UD/Az+YKLyJJdBPFMd3r9THstmJkTCl87
 /C0XBp2XAnOWn6GfV1Zdglq6kdhcQIqW/ACOAXezaxvt5XwUgRXiMnzklOKGryiUl3Pw
 vM2F+YMqp7y4cJKJ8M7IVJRBPjV1isvFLkc+Bg1JZ0cBLolBm/zCe7MSn5iXXXcWMldM
 90agf1P82iKuUoJE8AqVAeHNzI0lLXkZVu+zxmZ7VGzfEF98vT774rslHINNvVMFZrVp
 lRBZkk9qy3yP6QTMUw1MhIJfzre9sGqr4mzCxfjO4o1D3iufWrWiR1ypw47EtHmV5FmN
 kODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pUnzJLXg28F5U/2Y8hEJUScjBpBLM8tJ3KnBsGV8yUU=;
 b=2XWFqABOgxTwnpUws7nxsroOZ3DJJsE/nPju0j7wDPCynlfjXvRGxCmmyyuxcht8Ug
 n4+CpGtkQD3Q2KxE2GYlnhPOzKoh/vDafrGbhn6LlAquPlN1a94xUAX5FAx02q39neJR
 HkA+hr055UtLbvLnouotu9VAga/Zlm3WBdTtwLsHVr/LjIpklrfbwj5rqgcQsT6veVx8
 GfQu6j5KwlXiD0aa39+deyvs156mg/Vc8dw2Q+zB8hW40pUSIU/sDAOxS2x1mv2EWq5+
 KovYsBK5LjKKKVT0VmKSCIfAeW0htAVHEx1iRKx2N6SSN+5PbqiC7yohSM0FYBbvVVjo
 Xdsw==
X-Gm-Message-State: AOAM531IJPxPVtMy3S44jdgB68ILUSkW65yWPm+vRECzrMKxnlUVqUCg
 wSIdzKC9dEzsykY7hBXqjKjxKw==
X-Google-Smtp-Source: ABdhPJwnLO2ZLf4+MLSueLze1TbZU/WyE5zGvwVaqf/aV4R7l55A3+xa7Y0BhjL2auDETDfWNxJmLQ==
X-Received: by 2002:a17:907:9721:: with SMTP id
 jg33mr42144311ejc.259.1641390616258; 
 Wed, 05 Jan 2022 05:50:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i20sm15800432edv.44.2022.01.05.05.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 05:50:11 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 752BB1FFBC;
 Wed,  5 Jan 2022 13:50:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 04/34] ui: avoid warnings about directdb on Alpine / musl
 libc
Date: Wed,  5 Jan 2022 13:49:39 +0000
Message-Id: <20220105135009.1584676-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Gerd Hoffmann <kraxel@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

On Alpine, SDL is built with directfb support and this triggers warnings
during QEMU build

In file included from /usr/include/directfb/direct/thread.h:38,
                 from /usr/include/directfb/direct/debug.h:43,
                 from /usr/include/directfb/direct/interface.h:36,
                 from /usr/include/directfb/directfb.h:49,
                 from /usr/include/SDL2/SDL_syswm.h:80,
                 from /builds/berrange/qemu/include/ui/sdl2.h:8,
                 from ../ui/sdl2-gl.c:31:
/usr/include/directfb/direct/os/waitqueue.h:41:25: error: redundant redeclaration of 'direct_waitqueue_init' [-Werror=redundant-decls]
   41 | DirectResult DIRECT_API direct_waitqueue_init        ( DirectWaitQueue *queue );
      |                         ^~~~~~~~~~~~~~~~~~~~~

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-5-berrange@redhat.com>
---
 include/ui/sdl2.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/ui/sdl2.h b/include/ui/sdl2.h
index 71bcf7ebda..8fb7e08262 100644
--- a/include/ui/sdl2.h
+++ b/include/ui/sdl2.h
@@ -5,7 +5,18 @@
 #undef WIN32_LEAN_AND_MEAN
 
 #include <SDL.h>
+
+/* with Alpine / muslc SDL headers pull in directfb headers
+ * which in turn trigger warning about redundant decls for
+ * direct_waitqueue_deinit.
+ */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wredundant-decls"
+
 #include <SDL_syswm.h>
+
+#pragma GCC diagnostic pop
+
 #ifdef CONFIG_SDL_IMAGE
 # include <SDL_image.h>
 #endif
-- 
2.30.2


