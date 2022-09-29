Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96685EF5C5
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:54:59 +0200 (CEST)
Received: from localhost ([::1]:55984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odt46-0002In-QP
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrwB-0004Ue-3Z
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:43 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw9-0001EZ-B7
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:42 -0400
Received: by mail-wr1-x42b.google.com with SMTP id c11so1731940wrp.11
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=b19pLmx/0RxOSHcyQbQM8vk8qEN24/JWEcEYJzVYwNg=;
 b=D3iBeKmTtnFBEixw6SYuxZwDafICEsockz8DiNxOkJHfyZFLJzkIeq6q+sJK0TX1BO
 wcov+jU5qz+06ydkL1icYhMDL36t9BbrbhMkSDBocis8leFoxpOwX3NuqpimkCJeJiMm
 USWZoQ5i+uzKN3bdMfXRdxaWNRDeHQ9pVepidP0nCUM5mIAXgpiZbYY+IOWpBZmPHgbs
 on3cuexlWPqaIwDkcRIUn2piGTh/yWNU3xq980NCtGA6KOTyRiMC6bgHvUc9wWDnlcPS
 AnuA48hrafVG6DinPBUX1FOv6zLqeHwbAuiTvDDQ1nw1TyZEhnX9/rsxJ605UFFRxqy+
 Oe+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=b19pLmx/0RxOSHcyQbQM8vk8qEN24/JWEcEYJzVYwNg=;
 b=abgchFbPlK1BN51CCnkOATtAGxLP004GkV/e5XNJvRicCnJJb8CCMXLBJk2QuFywcG
 IxuB+/BYW7u7n+J6mMnzle7lLX7zsePB859eonEEjrcsX+aL64vbM9OXMptfZrRuHwwe
 Zn/ra0l76xSxd+dId0k+XgEO6riHKl+RP8Xd+ifN3eYLQN+VCImGWfPpLY3+xWXsCeCl
 6jb1ArPtF2r9/6khmiVw63WeraHP+op91O5C6Az3R8urFcf612gppwna8KH4fNcP7lW/
 rt2cchHiWV4aVS2b+uO5N77ki9L56jKAYSEAKXaxLebBcU2jZnNT1AMO3kkcrqlr9yjt
 Q88g==
X-Gm-Message-State: ACrzQf11YnAFLThcbi4bmMbPx2hByO5W6kzlZubwnw9Se66aBBrl7Ykc
 wa3Y7DLWAYGm9palK+Fi+dkLUA==
X-Google-Smtp-Source: AMsMyM5XdvclDSG4cpuu3oKfnbfGr9h/JE5iGwhzrFm9PrXojc2tykNUApkazkj3O2aDol0e4jjKOg==
X-Received: by 2002:a5d:58fc:0:b0:22c:cefc:be99 with SMTP id
 f28-20020a5d58fc000000b0022ccefcbe99mr1980087wrd.457.1664451759968; 
 Thu, 29 Sep 2022 04:42:39 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z4-20020adfe544000000b0022cdbc76b1bsm460160wrm.82.2022.09.29.04.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 94A0A1FFC3;
 Thu, 29 Sep 2022 12:42:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH  v1 11/51] tests/qtest: bump up QOS_PATH_MAX_ELEMENT_SIZE
Date: Thu, 29 Sep 2022 12:41:51 +0100
Message-Id: <20220929114231.583801-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It seems the depth of stack we need to support can vary depending on
the order of the init constructors getting called. It seems
--enable-lto shuffles things around just enough to push you over the
limit.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1186
Acked-by: Thomas Huth <thuth@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220927213501.4069117-1-alex.bennee@linaro.org>
---
 tests/qtest/libqos/qgraph.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
index 6e94824d09..5c0046e989 100644
--- a/tests/qtest/libqos/qgraph.h
+++ b/tests/qtest/libqos/qgraph.h
@@ -24,7 +24,7 @@
 #include "libqos-malloc.h"
 
 /* maximum path length */
-#define QOS_PATH_MAX_ELEMENT_SIZE 50
+#define QOS_PATH_MAX_ELEMENT_SIZE 64
 
 typedef struct QOSGraphObject QOSGraphObject;
 typedef struct QOSGraphNode QOSGraphNode;
-- 
2.34.1


