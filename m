Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A0642E46D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 00:51:19 +0200 (CEST)
Received: from localhost ([::1]:59182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb9ZG-0004Yu-Gy
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 18:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb9Ss-0002mj-UQ
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 18:44:42 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:44717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb9Sr-0004Jw-Eb
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 18:44:42 -0400
Received: by mail-pg1-x536.google.com with SMTP id q12so3924604pgq.11
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g8hjqcy59VN6P/kOU18jEGQwnkWxMefSfkUBnHfe+Gc=;
 b=xEPxzELZhnQpKsuXFaNqj+1l4OyRCwqRbmhKYbB667CbKQoQ01w9oHbGC14qmVrJIs
 5FTfnKtXVMyOvN+S/DrwW1/elPJHmJjn9owRqVrZlOOuC6/8Ad9j9AKy81HmjGU+E95K
 q/VMA3HivaaROmiAr2/e+Z6JEOjWA+gTC9rN2QiIFRz6pl7xBMA3vn9sl5QAHQQuw5cp
 a/U8+XcRCkDfl++cV1DA78pqV6n7hxm57LCsEcsJEyPE0tHtMkaj4xHll86aBtLZgZV8
 imDkHuqkyoDzMEg8lHqbPYfVnRUrpHo9Ew1YxfWRHWF/2y31IuAvagcGQtVvRJnCPMsF
 aY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g8hjqcy59VN6P/kOU18jEGQwnkWxMefSfkUBnHfe+Gc=;
 b=sjR+ApDzc52+N5zUUVLJnw1N10XfbDv14Tutqz1rN8iUmr1YJW+7Bl0Bx+HA9kdqxj
 N6mXKUxmHoXmBgVs26oyxPLNvJY33DiHCu2todM8JTz51QfLc5UuvtvMzHpl7jZTM7t1
 BhLFRrwIBbwPNOQWODAkgXJsLF5NcpNDZnAohO/7449GJfikG1fTqh5G8y0eKWKwdOqn
 MQmEQ+gpqIxXXxe5jNYDjK6NCRW1GsE+p2KfnSj02HpTyJhJ/odJMuYfVXvycsyUBPcL
 fxNQyPeuAaHo8FC5ndIwls4rVYlR6SJFzw7U8zt+qTrol1/ces6SzY6q8WtqUeuo2q+e
 O0NQ==
X-Gm-Message-State: AOAM532Wy55HG0i5ka7FPra2Fh8vb3bJAfN8OyUvkYYNIAu8kysS3iZ+
 n+w9tYw6w/MmLA2lBS8hc28XigJZVgFgRw==
X-Google-Smtp-Source: ABdhPJz4Ulav8pRwItSK6JR3QR6HLRvsIfdP3DPnaG88XnkTHIoPAxXJtquM+Usq3ekCARl0ebNymw==
X-Received: by 2002:a63:db41:: with SMTP id x1mr6365840pgi.474.1634251479887; 
 Thu, 14 Oct 2021 15:44:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m10sm9506208pjs.21.2021.10.14.15.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:44:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] tests/docker: Simplify debian-all-test-cross
Date: Thu, 14 Oct 2021 15:44:30 -0700
Message-Id: <20211014224435.2539547-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014224435.2539547-1-richard.henderson@linaro.org>
References: <20211014224435.2539547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The base debian10 image contains enough to build qemu;
we do not need to repeat that within the new image.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/docker/dockerfiles/debian-all-test-cross.docker | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
index dedcea58b4..b185b7c15a 100644
--- a/tests/docker/dockerfiles/debian-all-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
@@ -8,11 +8,6 @@
 #
 FROM qemu/debian10
 
-# What we need to build QEMU itself
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt build-dep -yy qemu
-
 # Add the foreign architecture we want and install dependencies
 RUN DEBIAN_FRONTEND=noninteractive eatmydata \
         apt install -y --no-install-recommends \
-- 
2.25.1


