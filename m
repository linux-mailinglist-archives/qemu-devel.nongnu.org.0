Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D516419C5D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:26:35 +0200 (CEST)
Received: from localhost ([::1]:45766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuOg-0004Wm-6r
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2x-0004hi-LD
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:04:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2w-0003vb-5J
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:04:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sD2NNIPpKeKq2FjUafo3prqnKNAc6Lz4pFYyGXUtzkY=;
 b=bxwk+0DaGswAM38gQ3hBqqtkG+HmTeBHFhRjUaLZ0cSGDoDlO32T/h45Zy1j3zJ4efKTU5
 9ztMDZPMj3eW2oIAEGXFmtX3j04nI2GDtmU2cSf0bmd8EtujlaNKI3iFtXPgfHLwUnWKWE
 4Q373c71x139XMYwOEqulD6JKyj0ylg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-pl0KUwNIPH-CMIwVK-Q0UQ-1; Mon, 27 Sep 2021 13:04:04 -0400
X-MC-Unique: pl0KUwNIPH-CMIwVK-Q0UQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 b139-20020a1c8091000000b002fb33c467c8so508554wmd.5
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sD2NNIPpKeKq2FjUafo3prqnKNAc6Lz4pFYyGXUtzkY=;
 b=0E7jvFeLNyEbRvDeFJbG+FZuh7dIuBJC+Lq+khLZogQAw3Gyig+Wy1qFetqyuZokbN
 uMDbOFR6wcLJbXVv9Uc60bUQj+wnWcwKr0yZVlIpiLSwCvMQc/44O3p4DpqyzLpny0/l
 ctkyX6vcN9JkpWxUB93zH4rWd6u0RBF63aqvk5tnsLAFRvJI69TdAKIZEYuHkbB5ZE06
 F1qb8NKCtNkODectDdcfzyQdL2+E8HDpUFwKHFfFOnGPvl+ahmRjuJeksWtLMFfRX6i8
 i1I+R3W1/AioNxmH3wWO9SgggAPVxAzXCFw3Ei5y8+HS6q5g4o1TlwPOeArWea/aoFl+
 w/8Q==
X-Gm-Message-State: AOAM530oGwUg1oeOIsvMzY+ZS6eplGevbZmVfs8GyBoV+3K8L3MJ4+gJ
 9XAv4u6JRBTXdXcXghPyS0UvdrHFGoGASeZRMEP/qLv4Ho0K3/eF9Qs9nK+9LZj8m/jytvYJttQ
 tsB1psW2AAnoR4uq3BlQSyfkyJXkukMm9OB9Q4xP8RCNBF9aI/pgrRPUNJsEICjRT
X-Received: by 2002:adf:e101:: with SMTP id t1mr1027258wrz.395.1632762242987; 
 Mon, 27 Sep 2021 10:04:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzamxbHHFp4zTkGbHueZ5BH3ipIObaevjWFq9lkGpVe8F2+ztN0TmVyYtk4Rd1CNQ2g8b46sg==
X-Received: by 2002:adf:e101:: with SMTP id t1mr1027233wrz.395.1632762242772; 
 Mon, 27 Sep 2021 10:04:02 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id y197sm103870wmc.18.2021.09.27.10.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:04:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/21] tests/acceptance/ppc_prep_40p.py: clean up unused import
Date: Mon, 27 Sep 2021 19:02:27 +0200
Message-Id: <20210927170227.2014482-22-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927170227.2014482-1-philmd@redhat.com>
References: <20210927170227.2014482-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

Just a removal of an unused imported symbol.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210924185506.2542588-16-crosa@redhat.com>
---
 tests/acceptance/ppc_prep_40p.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/acceptance/ppc_prep_40p.py
index 6b28a69ea59..5e61e686bd0 100644
--- a/tests/acceptance/ppc_prep_40p.py
+++ b/tests/acceptance/ppc_prep_40p.py
@@ -7,7 +7,6 @@
 
 import os
 
-from avocado import skipIf
 from avocado import skipUnless
 from avocado_qemu import Test
 from avocado_qemu import wait_for_console_pattern
-- 
2.31.1


