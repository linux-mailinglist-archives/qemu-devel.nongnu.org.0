Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74A051F74B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 10:53:15 +0200 (CEST)
Received: from localhost ([::1]:40748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnz8l-0006ln-25
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 04:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nnz2q-0004xD-D5; Mon, 09 May 2022 04:47:09 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nnz2o-0003hZ-Kn; Mon, 09 May 2022 04:47:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id c11so18371175wrn.8;
 Mon, 09 May 2022 01:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NxlGHwXR+g36Cy9CE/p0X5CLq8IiOkHBEVFGIUzcGpw=;
 b=R3a4G1Zp7B16EmG0QNMzZ2E7Wb/g3FjBAC/8KuyS61DA+TBPHscd+dqCWF7v025a9S
 ByqY5WVUR27Zbqd8Paujb/FETlcbYNX/V8cHdnWkrbdO8YegylnBHJHDYo5tC8qLpe+o
 8Lli2e2XcmVylB/OWurz+bhZVoLwGWMVjCXEUWSYGndh37C9AlpecSizZR4rQK43axDp
 jtSEJtwkbT+wuu6u2SxR3DfNwwP6/OngWLDD6levK1iCDKGe1VNmXMoH/qqoa9rWVw/d
 mUV/y80nIuj/+LRS46bGFcLny+QYaKqbN33UGZicLZc0YK7hJ9T3/NgqP3K9Y9OvK9IW
 c8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NxlGHwXR+g36Cy9CE/p0X5CLq8IiOkHBEVFGIUzcGpw=;
 b=JleJ8npQ1vqyS6JLS6EBf/c01O+u6xyx1wXYsnPHdzC4LCY92fceFYOJmtx+/42E/Q
 ZXYU9S5u49hLgvRbwkWu3Vo9YG4BijeqiJOxG9sZAR/L7jARS0TkNMSPRlO/Jhcw0TyE
 POBNL6+inr8VpBA5Z3pr0mEEjxxlPlOkFflnAWT8lI35uVEzpACHZ0WkeTCD8+g7lebO
 ty0G5mCUMQ7BzCnUjRalTwNrYnhFEipcdgGXLG/fEiaesdgkxh4BSagzjm9h+DbmOuRi
 t4f5dTR0a/+YwhO3Q3+rzzINlKar9vKNIuW7gsHg3b5L5um8o79QoPGSf162eNzdR0cR
 8PIw==
X-Gm-Message-State: AOAM532LfemIZjPIQa05YstGTJkdvmnTGD/zQ4Ajr84Lzb0DruW2jaqy
 3gsBxSdBfdhw1TJcOj8uzKNWHdmhxhg=
X-Google-Smtp-Source: ABdhPJzXSC11RfRVV/+UzoMfgJPp4ltTNgjy7dIF9ODOm7IeV+qjDTp69wNSTpuJcvNhUq0o70mfDw==
X-Received: by 2002:adf:f64b:0:b0:20a:c685:89ee with SMTP id
 x11-20020adff64b000000b0020ac68589eemr12146578wrp.366.1652086022024; 
 Mon, 09 May 2022 01:47:02 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a05600c348700b003942a244ed7sm11396755wmq.28.2022.05.09.01.47.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 May 2022 01:47:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] qom/object: Remove circular include dependency
Date: Mon,  9 May 2022 10:46:59 +0200
Message-Id: <20220509084659.52076-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

"qom/object.h" doesn't need to include itself.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qom/object.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 5f3d5b5bf5..ef7258a5e1 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -16,7 +16,6 @@
 
 #include "qapi/qapi-builtin-types.h"
 #include "qemu/module.h"
-#include "qom/object.h"
 
 struct TypeImpl;
 typedef struct TypeImpl *Type;
-- 
2.35.1


