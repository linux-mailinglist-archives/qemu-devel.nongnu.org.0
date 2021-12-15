Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7339A476354
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:31:24 +0100 (CET)
Received: from localhost ([::1]:40396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxavr-0004FO-GL
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:31:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq1-0003re-PT
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:21 -0500
Received: from [2a00:1450:4864:20::331] (port=36735
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq0-0004D2-Ac
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:21 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 i132-20020a1c3b8a000000b003456cac51c4so173616wma.1
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qynRAK6syjYcWPpMhJJKxrKJeeVQ3iCliIIgVelKYDY=;
 b=hsONJ36Dpat2LIGq6LHRiW/UROdQ8MWPW6Qdmk3zFzRcHIGFSjVFXfDKZl7RtDqSV9
 mEnIvcbpgtNOL+XqtSK5kKGE3m0aKRtEPVWt9eAfhNVViRypJ9PqgD3wDRY7sbGAAeVI
 b1DTWvV8jecPostNz73GhccO5/sAY3ncDurxNyokbIN1J8KDwh87jhX1nwYuMD4roTWB
 JDHorcwdDBiehQSydQgZ0UyazZfJzjVjL8r6J8dFge70SMDFyE5FIhBsP7ZAw4tNJ/bg
 H0wXtjS+3NOjivWwm+NL21dj8x4uChOL1SmJ3KjFVWeprj9SCuJ1wiGZe7hljqCAJwJW
 qy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qynRAK6syjYcWPpMhJJKxrKJeeVQ3iCliIIgVelKYDY=;
 b=1iLu6uZv1rzIVImuJRYfhAGurOWkTEd0pQJ/9GUArj4kQeZBqBjeuy/5XuAxvRqEyb
 BkI0p19JTc1QCkOtK6onvIb6maUcS2sXW7sQFMjtD/JQOYxdtYCiurjbbhMQkgExiIde
 DSgObMLC/rxXF9SVK3+j0HJnAXQaCngvyLLy+HnwNikqNnatxRelh754AoYNyuRzI+ZK
 ru5BcUua3Wh6sewPDjsgFRvMxtxQnA4pVMnKqlywfbgxqUplqjxl0mWiUSKEqKLukrUY
 lHo3mcgAGxyRpMZd2ar4qY/kcKqn02V4HSeagBNyeVeuPv/EWZujMjZZtbuOcrj7aE7h
 jB0A==
X-Gm-Message-State: AOAM530LDyeiyoPx3BSLF6pnWaNFqVtoooul8kfAzX1m1a0YytMKW2S+
 oWrnbhXnFi4WyJNAoz8M9bdwmwNEPpc=
X-Google-Smtp-Source: ABdhPJyLyi99wDZLdf8qjlD9KyMYCfHPgAmfBR4YDHHZKX55WIUR7CgJ8kFeYPBP0g4aHjsabzhmkQ==
X-Received: by 2002:a1c:9dd4:: with SMTP id g203mr1863217wme.114.1639599918947; 
 Wed, 15 Dec 2021 12:25:18 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y11sm3794708wry.70.2021.12.15.12.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:25:18 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/13] qapi/machine.json: Fix incorrect description for die-id
Date: Wed, 15 Dec 2021 21:25:05 +0100
Message-Id: <20211215202515.91586-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215202515.91586-1-pbonzini@redhat.com>
References: <20211215202515.91586-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

In terms of scope, die-id should mean "the die number within
socket the CPU belongs to" instead of "the die number within
node/board the CPU belongs to". Fix it to avoid confusing
the Doc reader.

Fixes: 176d2cda0d ("i386/cpu: Consolidate die-id validity in smp context")
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20211122032651.16064-1-wangyanan55@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/machine.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 067e3f5378..f1839acf20 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -867,7 +867,7 @@
 #
 # @node-id: NUMA node ID the CPU belongs to
 # @socket-id: socket number within node/board the CPU belongs to
-# @die-id: die number within node/board the CPU belongs to (Since 4.1)
+# @die-id: die number within socket the CPU belongs to (since 4.1)
 # @core-id: core number within die the CPU belongs to
 # @thread-id: thread number within core the CPU belongs to
 #
-- 
2.33.1



