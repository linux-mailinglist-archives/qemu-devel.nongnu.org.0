Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAA557CA08
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 13:54:43 +0200 (CEST)
Received: from localhost ([::1]:42638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEUlO-0001Xy-PG
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 07:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEUj2-0005uT-Hg
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 07:52:16 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEUiz-0006Y4-Oj
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 07:52:15 -0400
Received: by mail-wr1-x42d.google.com with SMTP id h9so1944366wrm.0
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 04:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R4+PLxWALGlxDrGlf+LhFDgNwdQnyQgdmck8BMB4PZY=;
 b=qGO7YMhDnW/pVmXM91IpEi11rTA8TZrtP56SZwz4NOgEmGnvWHGeleZV4bU1+vAaVQ
 XfgsaBxvi7+Gn04ctoLXVMrfJWMuYMrtHQPJAgvlpr1qsk/Q5pn1hDHzVwxu1UJKGutI
 LGwruyMUV/fkMelrMRudmXOBNPAAEzQS5Ra5XSII+pPcVxEtwZ+AD5mTN+6erxNRSxqM
 bU+AsMvMRKfYcoImp95M6WSXgf3wh2ABJh7Nrw2GiDAd4r49CoOsGhaW2OepXMX6bxWF
 a7T3Elvx5ZrDt95QXHkYtixIhCh20Vcw2LZARfUyUkYWcQ8bs+wH2yXsg0ptoge7rf/L
 Bz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R4+PLxWALGlxDrGlf+LhFDgNwdQnyQgdmck8BMB4PZY=;
 b=R1L3d5rivJzYQoJikVkKks3odj621y5BzYgjV3G6igoMbWHaHxP81nHWYS7m0y0Nay
 Ky0lqRuG3Ctw3PGNPaTf7mRsslReys0VvXRGyXnoowP2RXiOnvGybvHLk0bR7St6rtMg
 csb8AKI+editx8JLsW3yCc5ZbF6zcxcOu9Kp8n3zjrJjYqCKvPFAbWSbD/8rEhmyY3mR
 DT5xOA5/g9VYcGLvpxnlZ/I0LIjw55l1g05iZSpD7VvK0fUO9zuM3ReJy0zvRNg8kqDR
 WN4dmkDBw1GarQ8nOGfRBvA7P/1h3Au9XKUpJFh8Ao5eTotb840siGFsz5QAWepW/Nmc
 AT6w==
X-Gm-Message-State: AJIora//ttYa5+TgQsJtKQPO1UyEPfrQzxAD6+Qjczmik0UUm4+6GEt6
 AvFGSN10sNQ6WF7vS3JxwRSDzXbb6EESBw==
X-Google-Smtp-Source: AGRyM1vK328VomdNAMIOsI7DI4ii0ZgaR/4c7RzMUXQonRpTm3ov1Bmu/CFaQXaTr0xkbLbZwfiwgQ==
X-Received: by 2002:a05:6000:702:b0:21d:7f65:f1b5 with SMTP id
 bs2-20020a056000070200b0021d7f65f1b5mr34092781wrb.555.1658404332023; 
 Thu, 21 Jul 2022 04:52:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c1d1200b003a04d19dab3sm11772745wms.3.2022.07.21.04.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 04:52:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 1/2] migration: Assert that migrate_multifd_compression()
 returns an in-range value
Date: Thu, 21 Jul 2022 12:52:06 +0100
Message-Id: <20220721115207.729615-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220721115207.729615-1-peter.maydell@linaro.org>
References: <20220721115207.729615-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

Coverity complains that when we use the return value from
migrate_multifd_compression() as an array index:
  multifd_recv_state->ops = multifd_ops[migrate_multifd_compression()];

that this might overrun the array (which is declared to have size
MULTIFD_COMPRESSION__MAX).  This is because the function return type
is MultiFDCompression, which is an autogenerated enum.  The code
generator includes the "one greater than the maximum possible value"
MULTIFD_COMPRESSION__MAX in the enum, even though this is not
actually a valid value for the enum, and this makes Coverity think
that migrate_multifd_compression() could return that __MAX value and
index off the end of the array.

Suppress the Coverity error by asserting that the value we're going
to return is within range.

Resolves: Coverity CID 1487239, 1487254
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 migration/migration.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/migration/migration.c b/migration/migration.c
index e03f698a3ca..befd4c58a69 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2617,6 +2617,7 @@ MultiFDCompression migrate_multifd_compression(void)
 
     s = migrate_get_current();
 
+    assert(s->parameters.multifd_compression < MULTIFD_COMPRESSION__MAX);
     return s->parameters.multifd_compression;
 }
 
-- 
2.25.1


