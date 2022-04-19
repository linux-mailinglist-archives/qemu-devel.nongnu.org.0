Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140D4506456
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:18:46 +0200 (CEST)
Received: from localhost ([::1]:35186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghCG-0007No-RG
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglv-0001A2-Fd
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:37 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglt-0004QM-23
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:31 -0400
Received: by mail-wr1-x430.google.com with SMTP id t1so20933529wra.4
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LPN+3jG6P55TcAsaux9fgkoAhIOtmmMBmGdDsBMbcZQ=;
 b=Rx5d8awkAWkjJvTbL4HlIySb0+bYp9JDXTXeMYcHWddBzK0yTRBoSszcqvn8zBN9+A
 h8j0URPg0JIGmm/VL2YphDlPREOwu0vYCvXgJYc8hRnvmzuY76oS0D6/pvUABgsfPlWl
 AQRg9aOhwLg2tByXVTF1Wic3b1Rg04z11agP6pie4oA5BBxQrQALSG9eWhTzrxVl32Dc
 O3l7nc/yv4iMs9gN9gXap2PQgPY03p29LWAIUn4PtDxmtlySI+jixS2XJrUiZU0nB0rV
 CXJ4eYtVGEfrY7fyhQ0/cNCwv0j51B08aTgCVjzoLswIMpDZm2PWum07MlSsOk3oV94H
 wqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LPN+3jG6P55TcAsaux9fgkoAhIOtmmMBmGdDsBMbcZQ=;
 b=eTzHkyobrQ0t3qJzjzAmqscGwYz/HFYpqSYk0IvQrV13Rk3gEH/Dd/lc3TTWykHVY9
 BoLadj2M2Wr1Cz+PUEViZynIS/DY2HeZY+XWTQ9kfTkwFH2X/hFBoQQ2hiMOig2KE4CF
 a97xAn5T8aPFIBVGJEgR4CuWC12W9ozSyKU7hH/kCjpOQt+1iiw0e5AiWww5mhWtB8HH
 LyAzIpKZwTB4ms23DSvmIUQvWM+PmrrbFmM4R5bMNIufCYX57Tpt7CSI3dA8YXT2QuPK
 zvDock3HAO6MPcj2KfWl9VRtXdZVocc/8R6Y9S0jdkyVZT6+5CwbT5ygn0lJZ6K40rAI
 N1Qw==
X-Gm-Message-State: AOAM533MSN0XcD/v+d1OBklYICUPyelVlglihZOXAdlHQI16JyOjpW34
 gVwwLbdc6ldFQyHHE64PfFDMbnDMD0wdlw==
X-Google-Smtp-Source: ABdhPJxBCkr9OYn6TDoK8MIdR4CCjMM96eCDWFXqImnP7CjKlptN6VkZMVf0wZRFKrzjZIOdXyIKUw==
X-Received: by 2002:adf:b745:0:b0:205:b8e2:f470 with SMTP id
 n5-20020adfb745000000b00205b8e2f470mr10204486wre.91.1650347487736; 
 Mon, 18 Apr 2022 22:51:27 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/53] include: move qemu_write_full() declaration to osdep.h
Date: Tue, 19 Apr 2022 07:50:38 +0200
Message-Id: <20220419055109.142788-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
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

Closer to other IO functions.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-18-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu-common.h | 3 ---
 include/qemu/osdep.h  | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index db8b03be51..c6f3ed94bc 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -24,9 +24,6 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-ssize_t qemu_write_full(int fd, const void *buf, size_t count)
-    G_GNUC_WARN_UNUSED_RESULT;
-
 #ifndef _WIN32
 int qemu_pipe(int pipefd[2]);
 #endif
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 489a5d1aad..259436ff53 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -527,6 +527,9 @@ static inline void qemu_timersub(const struct timeval *val1,
 #define qemu_timersub timersub
 #endif
 
+ssize_t qemu_write_full(int fd, const void *buf, size_t count)
+    G_GNUC_WARN_UNUSED_RESULT;
+
 void qemu_set_cloexec(int fd);
 
 void fips_set_state(bool requested);
-- 
2.35.1



