Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC9A2032AE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 11:02:38 +0200 (CEST)
Received: from localhost ([::1]:49550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnILd-00029S-8Q
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 05:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jnIIu-0008W9-45
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 04:59:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43094
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jnIIs-0004vo-Af
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 04:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592816385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dA2kU1DEwZZZ7zmBT/sw04BigiN6qJsZ6lFPExHuKDU=;
 b=cCOJjqcRFrhxMUpn3KVGMpRmvakrNB5CbAJkS/0xp1R1GsZ3uq2xfgU43TyNc1iH8Hkzlu
 mgeIzNsprZnLuhoyUf4cCvvwQZz/EfWOa1m9+kmwLjfCL1B0GakTjyeQUtjPe4JXO1OPrw
 d4GGLvFYWTAf2ik41/7wWyIYFfdQCJg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-7Hn289Z-OpyeOU1sbyW0sg-1; Mon, 22 Jun 2020 04:59:42 -0400
X-MC-Unique: 7Hn289Z-OpyeOU1sbyW0sg-1
Received: by mail-wr1-f69.google.com with SMTP id o1so10502020wrm.17
 for <qemu-devel@nongnu.org>; Mon, 22 Jun 2020 01:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dA2kU1DEwZZZ7zmBT/sw04BigiN6qJsZ6lFPExHuKDU=;
 b=miWsbrC1MvpVig2Y/Y6i8jQukEVQe0qdaMvmwXf3blpQ1OAFejfSUhakdSI3GRxES0
 a4RBkGyGcP7LKvyIgesAdB2cHB5HG8iCAlSFLVps2c40HbM6PjDOOPUle/xBaeY2k9rA
 4C7Wj5d9niqISUke9tXbughEv2xnWJym77Vy7gWmzKBmO1LrOEMdu6vh1Wxe4kNCK9co
 RmvGorqLiJsK3blkoyGCHsq2xENJpmxyqjhLq1IdTlDPnRam7vMgHYGeuJblu6Swcfyh
 8zDdUFYjOIacm8KPMcv0CPshlzP6wELbFdhJ9aOak8ttyPD/4UP6CXQh956D1DbdT16a
 nmqw==
X-Gm-Message-State: AOAM533+l8CSrzBys/isadIov2+zXm6+QZ+ccsROpG50mxp/HV7X2+wX
 B4fP/YQknNxvtPJXM+mtundc4ahjfnGf7Qx+B6iQoB/1gc8fjbN98YYFMGbz/47VchD7wDCq70w
 imVQ1/ceGe6V7kIk=
X-Received: by 2002:a5d:4b44:: with SMTP id w4mr10617636wrs.275.1592816381466; 
 Mon, 22 Jun 2020 01:59:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSMEpyYK2ruAvmQohNNOv6nLVPfEyQLRJoEa5C31JqfCcJK+X2EeX+jWmHYCiI0GWpKLFLyg==
X-Received: by 2002:a5d:4b44:: with SMTP id w4mr10617612wrs.275.1592816381243; 
 Mon, 22 Jun 2020 01:59:41 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id d28sm18255347wrc.50.2020.06.22.01.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 01:59:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/8] MAINTAINERS: Add an entry to review Avocado based
 acceptance tests
Date: Mon, 22 Jun 2020 10:59:27 +0200
Message-Id: <20200622085934.16441-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200622085934.16441-1-philmd@redhat.com>
References: <20200622085934.16441-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

    Acceptance tests can test any piece of the QEMU codebase.
    As such, the directory holding them does not belong to a specific
    subsystem with designated maintainers.

    Each subsystem covered by a test is welcomed to add the test path
    to its section.
    See for example commits 71b290e70, b11785ca2 or 5d480ddde.

Add an entry for to allow reviewers to be notified when acceptance /
integration tests are added or modified.
The designated reviewers are not maintainers, subsystem maintainers
are expected to merge their tests.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com>
Acked-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20200129212345.20547-30-philmd@redhat.com>
Message-Id: <20200605165656.17578-1-philmd@redhat.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 955cc8dd5c..7b1262e925 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2941,6 +2941,14 @@ S: Maintained
 F: tests/tcg/Makefile
 F: tests/tcg/Makefile.include
 
+Acceptance (Integration) Testing with the Avocado framework
+W: https://trello.com/b/6Qi1pxVn/avocado-qemu
+R: Cleber Rosa <crosa@redhat.com>
+R: Philippe Mathieu-Daudé <philmd@redhat.com>
+R: Wainer dos Santos Moschetta <wainersm@redhat.com>
+S: Odd Fixes
+F: tests/acceptance/
+
 Documentation
 -------------
 Build system architecture
-- 
2.21.3


