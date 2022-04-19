Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B89506428
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:08:01 +0200 (CEST)
Received: from localhost ([::1]:51578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngh1s-0007NH-O3
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggln-00017m-JI
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:25 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglk-0004O4-Oo
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:23 -0400
Received: by mail-wr1-x429.google.com with SMTP id w4so20897514wrg.12
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KpYzn9e+2BJl3AATGH97VY+zEiMHNod8tqPkyqs6h/g=;
 b=MWrw5R/trAxDPY2RDZj6nHet1VXOPKp2eBOcsHsLJcbWinNfzv8AAR7q4zChZTBGVm
 OdXLx3InkGru0TqgO/ivzPip4RpNT5I7qoo+kiyadlikZbTNi0rkxL0dUj+rw0x8bn92
 wjRzYZiCy6cLBdJvZ4jOJxkA4vmhKkjMftuPZVS9LsCXYelFq/uDwvS1a0ew3kA12+Op
 euMTubwfD6Ij014yvrjiDH1ROP0sjZkvZGLn98yszI7i+6CO+gSI4pS5jKxHt6kwrStt
 /Ouuyzdkc+uuU0Vm8il3N00oFqcRrck4vNDckLBCDdETn+1E07rVpHyjAq+nmqbk8zHM
 qElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KpYzn9e+2BJl3AATGH97VY+zEiMHNod8tqPkyqs6h/g=;
 b=RgcUWaokp6qa0Yokdya2SXdnGXngyURu6ZIQttUUSoZbZ+utc7pyDlJGrKZLyAfiTp
 e3Ynw+EbTRBlKLHg2u1N62qKWAri4iCaZYBuW8XxORqp/gpxledgiPmWIoEBe1YOX10J
 VvMQqlULmDsv3vy3vucYXZJwtvZXE1jxPzLi/kMLFTUby5WVHLe505zWI7rqxJ2ln9wp
 /qaCYhY90uFPqEfDOVqveZ+9hPTxH/72P02g0rDZpDs+SNY9RBqxxEDs6h4wfzwXGiY5
 tnBg8b8hRp/bKLi6ro0UwwDi5obE2Qpf8J6dAC06ZskGPytb3SELoJOgiXFcoCt8JaVU
 z2gA==
X-Gm-Message-State: AOAM531kYS3BFG8TCJKpGypY9K5AA3yF+oOpKgLOWdbdd3UWKFmtP0TI
 B52lRG5FYFtERaqhnt1QP5clLPO71uVvyA==
X-Google-Smtp-Source: ABdhPJz/JBZNp1S94rm5O/DMm/KYABs45i3UNbsO//hwMtAIYgDflA6Lq7vPoSONek93PYAGLNtfTw==
X-Received: by 2002:a5d:6f0c:0:b0:20a:7db1:3408 with SMTP id
 ay12-20020a5d6f0c000000b0020a7db13408mr10381790wrb.267.1650347478181; 
 Mon, 18 Apr 2022 22:51:18 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/53] meson: remove test-qdev-global-props dependency on
 testqapi
Date: Tue, 19 Apr 2022 07:50:25 +0200
Message-Id: <20220419055109.142788-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-5-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 96b295263e..026e39f520 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -148,7 +148,7 @@ if have_system
     endif
 
     tests += {
-      'test-qdev-global-props': [qom, hwcore, testqapi]
+      'test-qdev-global-props': [qom, hwcore]
     }
   endif
 endif
-- 
2.35.1



