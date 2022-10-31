Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9C96137CC
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:23:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUif-0005wf-H5; Mon, 31 Oct 2022 09:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhu-00030m-NN
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:04 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhn-0005Qh-Ut
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:01 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 f16-20020a05600c491000b003cf66a2e7c0so3346614wmp.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bWizrSDAAuieyHecJY/J//X+NUZUwcSMeXyXWnSwMmk=;
 b=BiE9YgXlbuE9MiU3oRhrQl0RmKNoERJ4ZUz2E8+dxF76rIfDU/2QbuAnXabxA70qQ2
 0XH7uuHGH2ltJn8C4yAEq7dT0/mI/5+9p1JIB/Oiyah+NxO8cqUT/4qL68zxtoDHhW/T
 qoAlhr78Adzkn1/6Qhk0Iy0tSCd0suIcESfBfZCj+62XHRY927j0e3oQXzii7svbCl9J
 K9pNq5L/uNiN+SKX0cC17l/KWjnaqH4HfEyoU5c1t1Kpx8Pxcj/awM4JcZmKjZoSYXN0
 LAKtXgOjIzf/1p2FSvlvoUBfapSyM05LOfz7/57/gHKJddGCnt52j6UgTcOsjKqWOGPk
 r+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bWizrSDAAuieyHecJY/J//X+NUZUwcSMeXyXWnSwMmk=;
 b=Eq/OaBcnmdSgjm684wCe4Jd6+odMZJFLQawT4Fy3S8R8fUU72W9/D+wcpRsOpyFEyP
 N7sv+Hcoz8r5Kk0ToTHNoc7TQSc3sZvkhckukFyeeGKjofhoDOI4bO485QzlTXqolpQc
 JM3qRX8z0W+QvxgXoP/48Evtbba2WioGYYhgTLyRU7JNCLQRm8rBEzRkQ+bpMgFPTUq7
 oH48SEnvsRNqWY5FHD5kdJJSFBYsRHkkQ/m4kY1AxLiCcbJRpe/XIyY1qAZWG0zISyOV
 hdnzeDh1DGJrHgu8Rfc1l+SH6hmug23dOYyYK/rMNzCGP23FQME6JvK1xilji9vh4h5D
 Qv0Q==
X-Gm-Message-State: ACrzQf2PX3Z6LrcYcAH+kXg4oMUO4T7w5SIZjzXIqKIZWtdC5ZVxlXhm
 tjgc+HgfYtup64kG7ZuzYN4RAw==
X-Google-Smtp-Source: AMsMyM4mI9gNl4I3JMxWRoQirj8gncC2yxjVpmuo1guu/pYz2B1N8r0rtIX++y5yS6E+AjKLMvbmQQ==
X-Received: by 2002:a05:600c:818:b0:3cf:7385:7609 with SMTP id
 k24-20020a05600c081800b003cf73857609mr2275477wmp.186.1667222394495; 
 Mon, 31 Oct 2022 06:19:54 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r22-20020a05600c425600b003b4ac05a8a4sm7614271wmm.27.2022.10.31.06.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:19:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9F5F41FFC8;
 Mon, 31 Oct 2022 13:10:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 18/31] MAINTAINERS: fix-up for check-tcg Makefile changes
Date: Mon, 31 Oct 2022 13:09:57 +0000
Message-Id: <20221031131010.682984-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Fixes: fc76c56d3f ("tests/tcg: cleanup Makefile inclusions")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221027183637.2772968-18-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 85ddef2d75..a582b1cd0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3728,8 +3728,7 @@ Guest Test Compilation Support
 M: Alex Bennée <alex.bennee@linaro.org>
 R: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Maintained
-F: tests/tcg/Makefile
-F: tests/tcg/Makefile.include
+F: tests/tcg/Makefile.target
 
 Integration Testing with the Avocado framework
 W: https://trello.com/b/6Qi1pxVn/avocado-qemu
-- 
2.34.1


