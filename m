Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F5459F820
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:47:14 +0200 (CEST)
Received: from localhost ([::1]:54024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnui-0002RY-Hc
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuO-00043B-ED
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:48 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuD-0001aY-W9
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:48 -0400
Received: by mail-pf1-x42f.google.com with SMTP id x15so15076276pfp.4
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=MdKeSTbLm3PS0opC2HpSIBVAL/dC7LQ0XETPzs3c6S0=;
 b=boEs1TbeHauz9OftzSqMwRTzDCoO9q9S29lEWsea9vxDgu2ajlbn4z1BAS/c6wv/8/
 QJ5HcaTNuxt/Xzxca42gOTih7McIkjVzVNZ+8XKixZFROUd8rLsmX9D2qi3I+9yeMyyn
 1mKEOdhSyQ+tqSzqYVCy/FsO/XwWjavMlF/rzNJXbGfnehLQXdFaY+qC8dkFXNZC6Hp7
 DwHeVkmSAHLFViieg9O4SJkZLe94QhRT5N9qvfsdrStgxtp52WY8kBc0L8gkQb3E3hZ4
 ypgIeHPA1owJFhfzDrhZLtEtLRjJYfMHUqcTiVXM4skTDUtVOheHDT16n+UcwuW0OF/Z
 7bZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=MdKeSTbLm3PS0opC2HpSIBVAL/dC7LQ0XETPzs3c6S0=;
 b=WvY+Srg/V70fuRgrdGmhmU0RP3vJMTf4QxjHGz6ufMSdB+wPbGQVbX3JKGQPs5gUYi
 8+UjGG2Bstwyk17OcVK4bxxa1B9CXQBe+l9Xc3OfYgoLdS8ZDCdhsFZl/VWM2aKMcXOl
 1fnpBxhhA96ng4dFpKE9LbYQrCoog0kVECadkWTI5ovp1RDCZ5JUhxaYjzPupAirrW5p
 hLkpLsu9AhVp34i+zed0CM05SmIAz2nKwjCeb4pU4DwjsmbKfSjJfEXNWRgrfFHA42SA
 W8X7T8WZc26rwLgqU9IlGGwf9aE/D6UpP0oWD2MO6TnhnmEyQhFv92jP6OmjtHXAfApm
 wcuA==
X-Gm-Message-State: ACgBeo2kx6WsrhSbtFeux3BtKUVZzSSLrxeVf4kijMV/FMwbEyiE4zc+
 wzTxSU6uCsGlI7EdQKdAlahePNJISsM=
X-Google-Smtp-Source: AA6agR437Al04JiYuVOLRO+sqrXxjpJazG7NQeDvzYhm3KD+wRpwotEbrRmRAGPdTQ5fbnS5sMx+5A==
X-Received: by 2002:a05:6a00:813:b0:536:e993:731b with SMTP id
 m19-20020a056a00081300b00536e993731bmr8396022pfk.34.1661334156527; 
 Wed, 24 Aug 2022 02:42:36 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:35 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 24/51] tests/qtest: libqos: Drop inclusion of <sys/wait.h>
Date: Wed, 24 Aug 2022 17:40:02 +0800
Message-Id: <20220824094029.1634519-25-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

There is no <sys/wait.h> in the Windows build environment. Actually
this is not needed in the non-win32 builds too. Drop it.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/libqos/libqos.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/qtest/libqos/libqos.c b/tests/qtest/libqos/libqos.c
index 85c7641add..5ffda080ec 100644
--- a/tests/qtest/libqos/libqos.c
+++ b/tests/qtest/libqos/libqos.c
@@ -1,6 +1,4 @@
 #include "qemu/osdep.h"
-#include <sys/wait.h>
-
 #include "../libqtest.h"
 #include "libqos.h"
 #include "pci.h"
-- 
2.34.1


