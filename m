Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D3A571770
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:35:15 +0200 (CEST)
Received: from localhost ([::1]:34568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBDEY-0004hv-Gw
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oBDB6-0007lq-Gr
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:31:40 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oBDB4-0002v8-Rm
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:31:40 -0400
Received: by mail-wr1-x42c.google.com with SMTP id bu1so9352369wrb.9
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 03:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iqLuBw7DZw5qVfMG42Sddy0l8VVTwKfh409n2NZQH4o=;
 b=nH2Ww3FI6KKiTYySxDLmtATvXc9ug9sAuSwTkaPNbMBmz7BMOTmbyxaUJfYA700Jau
 2IKaQOBUfqqim/RjDQXH8O9VjEqH5zF+Rx8QZUbhYyHOZZL18+5ubjX3i2qG/z37yn8R
 5zbhu4Enq6Jxrp6/X/4mHFa+I00BGwzl3Js2xVT5g6GOjHiqKozXl4NSrkdNMYfcQsQ3
 eRZFqUBp++AEm5uT5/FC7wGbjB+B2zNV4rozRaVzx//X8vPHvX8Y7n74nEEtYQbGWyM/
 IvCEC9hfkztCe1FAbeF9QeRSkY+NqJ4e6Dqbd5kvT+GHRILhTpHWhQbpNmghH3NnUySQ
 FH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iqLuBw7DZw5qVfMG42Sddy0l8VVTwKfh409n2NZQH4o=;
 b=JNUAJIimQDFrvkUfatuzO/oMwaRxZP/av9K295qS0kGqQJhIxYNjThREVm5Ow22DM1
 XBFmej/zfAAIgkBazopsCYqODa8J/5HJNNGCQDEojZZoKEw62/frvm5xrJMgygzVAMt8
 /+XaXbTVZY9JLKhXZSx/f9AqM4gWsIr6Fy7MNqjeX84eeTMuMboeqx8DXuqtUpK46Nq0
 qCOL9ET/hdQDhPmU4MBAP5v5rSd1Z0LP+r2I7/BhA9PjRvh3wfi9RDLkH9bDITPgA5O8
 3IWUou+h1FCUOypDAixCZc2x4s4M8imLSGt2eT+g86RYibSrQoKUS/0bpmSV3ZExYk2Z
 WsWg==
X-Gm-Message-State: AJIora/k+MNJ4SaQx8+8vUNJc/FNhiRYEenhHIBI/v/hmmmytzQeWRxC
 DwV6iMgCkX/uLzMKwxAeBtDVFg==
X-Google-Smtp-Source: AGRyM1tyMsxGjd22n6Y/aQasDe2JtfPbyivaBQb2WkpNAmterolvN1njVG8xF6pWy99F4i8lWExZfQ==
X-Received: by 2002:a5d:544b:0:b0:21d:70cb:b4a2 with SMTP id
 w11-20020a5d544b000000b0021d70cbb4a2mr20929250wrv.281.1657621897132; 
 Tue, 12 Jul 2022 03:31:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a1c740d000000b0039c5642e430sm8934927wmc.20.2022.07.12.03.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 03:31:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4021A1FFB7;
 Tue, 12 Jul 2022 11:31:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH] docs/devel: fix description of OBJECT_DECLARE_SIMPLE_TYPE
Date: Tue, 12 Jul 2022 11:31:31 +0100
Message-Id: <20220712103131.2006653-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

Since 30b5707c26 (qom: Remove module_obj_name parameter from
OBJECT_DECLARE* macros) we don't need the additional two parameters.
Fix the documentation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/qom.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index e5fe3597cd..0cf9a714f0 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -292,8 +292,7 @@ in the header file:
 .. code-block:: c
    :caption: Declaring a simple type
 
-   OBJECT_DECLARE_SIMPLE_TYPE(MyDevice, my_device,
-                              MY_DEVICE, DEVICE)
+   OBJECT_DECLARE_SIMPLE_TYPE(MyDevice, MY_DEVICE)
 
 This is equivalent to the following:
 
-- 
2.30.2


