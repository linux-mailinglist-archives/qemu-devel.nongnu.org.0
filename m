Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD57D2AF056
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:15:10 +0100 (CET)
Received: from localhost ([::1]:57634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcp1p-0006wQ-NC
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:15:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcozZ-0005S1-Cd
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:12:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcozX-0007uH-CU
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605096764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lMQaE4I7dJhhuTMwQFT1bWEskB5ag/TnNpFcxmbNndY=;
 b=dzL9mbQ2P/ydUJNz/Mzy4eCSdlxDrhQqLQGLb1nxVhuX8IcRPdgnwKSmiVCSxqEfv51Sqd
 24LkDtg7at5VJsxsJ1QYxbrtEa0l8q2NXKmpGy0cZ2nC91VMjx3vawb4gD05CoE55bSmfG
 rcNBhfzKdJsE86XOgaRymKLLp52xaKQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-TDgQXHBaPC2mRnCjw5K6Dw-1; Wed, 11 Nov 2020 07:12:43 -0500
X-MC-Unique: TDgQXHBaPC2mRnCjw5K6Dw-1
Received: by mail-wr1-f72.google.com with SMTP id u1so530619wri.6
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 04:12:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lMQaE4I7dJhhuTMwQFT1bWEskB5ag/TnNpFcxmbNndY=;
 b=HlgUNOvgDRbnUr3tCjJhiwpD/ByfSt+05w7bVNKhWieZM7/qa2bBQI29xTrLjXOIsA
 ctEovKkDVXlVylxF1cu70QTum99escWvNlx19n1UcRWW1oV7xkd5IAobUArugeeGIWIT
 ygF/4F5bZ1x4wueEYZ5OVHflA6TU74ZdoHYWlQLZaUQE0y79H7t1Iq3foiN1ZQh0Z8dD
 f1hlBPo6ZxlF69VwvUSFUk1dLRgQJ5Z3M2a1lNqpvf56LDX6ZSw/OhZAWz2+vKMGzZBB
 r9mi5qzlHHdHt1L+2idhirktUKjU5urV7bd1dl44AtaSnMt9qkOahVeIfrMkM59mE5Rj
 adCw==
X-Gm-Message-State: AOAM532ezv5i1bRofoFewRr3UaujDop3ZbJCrZ2hxIJIV2aVV+lRbtDK
 DQ7RHvoM0z0Vw+GndLCF7TRRbqbETTDXRO9EInCtgpvW4mJpRp+zS51wpFKvGjUab3tHKjqzRcu
 7VL5cafCsPpgCK6st4zcnXo7FwT2dqkJGYHlGrk0lr0w3cFI/Q7Gq4GAQmHhxciwz
X-Received: by 2002:a1c:98cd:: with SMTP id a196mr3875794wme.42.1605096761751; 
 Wed, 11 Nov 2020 04:12:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDZk/Z5uPWUv80M0T49mx9lgMsuin0P7Y0+gApI96hWUrs6qlkwz/hiijP5xdTVz7ZQio5kw==
X-Received: by 2002:a1c:98cd:: with SMTP id a196mr3875778wme.42.1605096761576; 
 Wed, 11 Nov 2020 04:12:41 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id n9sm2306870wmd.4.2020.11.11.04.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 04:12:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2? v5 1/2] tests/docker: Install liblttng-ust-dev
 package in Ubuntu 20.04 image
Date: Wed, 11 Nov 2020 13:12:33 +0100
Message-Id: <20201111121234.3246812-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201111121234.3246812-1-philmd@redhat.com>
References: <20201111121234.3246812-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Install the liblttng-ust-dev package to be able to
build QEMU using the User-Space Tracer trace backend
(configure --enable-trace-backends=ust).

Suggested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/docker/dockerfiles/ubuntu2004.docker | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 355bbb3c638..ae889d8482c 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -23,6 +23,7 @@ ENV PACKAGES flex bison \
     libiscsi-dev \
     libjemalloc-dev \
     libjpeg-turbo8-dev \
+    liblttng-ust-dev \
     liblzo2-dev \
     libncurses5-dev \
     libncursesw5-dev \
-- 
2.26.2


