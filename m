Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A5E43663C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:28:50 +0200 (CEST)
Received: from localhost ([::1]:39994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdZzt-0002h5-SL
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZwy-0008Ls-O9
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:48 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:52975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZww-00024K-Ac
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:48 -0400
Received: by mail-pj1-x102a.google.com with SMTP id oa4so763833pjb.2
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WUzDlOF0Yc4gl4PbUd03BYvQClkHCt6P4U6DTvGuA08=;
 b=xQ/WazDvsoeUw+/tH5O59dWUj6dpm6CzzYDyoYaJnZRBVJ4YvPMBbcW2eMOMZcehBk
 7TRWy8dqmWhaA9nPaPtjdFotwSZmG/GaadH2i92MBk3CVqA577dVKLYM0+V6h/Dx6VEM
 3Tg7VYms/kBiAlp5zhUd3gRzJYi/JK7ZD6yABTYspCpMa10VcRK85NI1hlpN2zdGa2ry
 b2JF8IE9ONYpc/ddnmHwd7w+O4bMAECA4/rcaOUI+zdUZPBc3ah1ejxpeI+94mg4+B85
 Ku/o/1n5NhrK3lZnIZsjYc8rTHf7CzTO4pZSqaHYDveSc22VI0/856s+GT/2FFBhJI0O
 Gj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WUzDlOF0Yc4gl4PbUd03BYvQClkHCt6P4U6DTvGuA08=;
 b=ljiFF387RkPR6rsXyUEg9WnMoatlVP+c0G2hmVx8tOvdkbm19XcuMe+MqL6lq0QrQJ
 j1SrhFdtCNS38ZECeoErkEoSdoOCyv0f/m8ftvzor6VYuiI/69bNUnTyOkwRXkEWgXIB
 epFCmSPMMBHXWlNx1XOb7fSPIUh0JjN9i4qzBN02etO1vCXSp0Q+IPK3iihDULJ7x0PO
 jCv6VWjnGd1lZ4EYiqqP5VgTg86uIco1pyvz/go5gnQdCCb187jUqvr2ZFUMIcP6RDo2
 AmiY7lKa4pQn2NylcyeerQkTJxkBdHSnROIQ6wwRmVh9il3q1+dCf4RSKQu+S718M2RG
 vC7w==
X-Gm-Message-State: AOAM5323qRdQT0u0yXcbhJpJOuSfskUjeoEhiznzm5s8ufUJQSRurroG
 GQ+hxIHe8AkPp3T3/BRd/2y6pcjPJxjxMQ==
X-Google-Smtp-Source: ABdhPJxqdUhXoFyTkWHDuUBOKr4BjYBg+f+tfuVAW4w1+OLdtPe1HiSo0ScyMkSu3tb7Ol0swXqAzA==
X-Received: by 2002:a17:902:a710:b0:13f:bf61:873f with SMTP id
 w16-20020a170902a71000b0013fbf61873fmr5745971plq.56.1634829942879; 
 Thu, 21 Oct 2021 08:25:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/19] tests/acpi: Get prepared for IORT E.b revision upgrade
Date: Thu, 21 Oct 2021 08:25:23 -0700
Message-Id: <20211021152541.781175-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
References: <20211021152541.781175-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: Eric Auger <eric.auger@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Ignore IORT till reference blob for E.b spec revision gets
added.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20211014115643.756977-2-eric.auger@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..9a5a923d6b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/IORT",
-- 
2.25.1


