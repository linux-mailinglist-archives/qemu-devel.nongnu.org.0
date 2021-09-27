Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2D7419B63
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:16:19 +0200 (CEST)
Received: from localhost ([::1]:51420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuEk-0005Pc-GR
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2J-0003Uq-Sp
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2I-0003Ll-BI
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ffI3S1UrC74DSBmsku7f8Hx9pHdpkOvYCVSvX97/5y8=;
 b=SCT4v6H7qQP82YTuGezJVRD4VHukvbo8haTH4gNLEsLM5OO6EqondjaZM9NFk5YcYKU71D
 W8DqfmUqFN+skEI03HU0v9QmfVHTEcWWHLy+CIzvfyWBe2qws8Owfn7IkCvp7D7sPJOSs5
 Wk1+qoGarKp7+fU5JMb9+hKVgNPjn9c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-tP-9l1ggM7O6kEeePiRtvA-1; Mon, 27 Sep 2021 13:03:24 -0400
X-MC-Unique: tP-9l1ggM7O6kEeePiRtvA-1
Received: by mail-wm1-f71.google.com with SMTP id
 y76-20020a1c7d4f000000b0030cf1eaf5cbso213327wmc.0
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ffI3S1UrC74DSBmsku7f8Hx9pHdpkOvYCVSvX97/5y8=;
 b=sfVjr7jMjxqsAX5rxXrzbrfeGXcgs0lOJBBiEgIL44iSyhZK5mcjT7pS2UYfscWLsh
 ERC/vgl9vKhb2/VDSYBpiSwAyU/ZghCA3MZAgAnpER2qR81//o4iWdHkCgyZ0l1kiCAk
 TU6ZH9hC4c5F85jpvQ41qmlGpARdpCijhPuTTiXpO+vT3dv0jK91rfYhmGwPojIOmPUf
 W+geIkPMIIgVD3ukVQezF7zN3/C7by4apPkg3wfaJBXp8hbrnx1qKzugxj6CSd7nx7Vg
 kWSQcZF1Y04483+bLaWZ5MSmQqkb8XY+FMcAM++mYDrMrh1NlDzlzGc/ImDRSM89X7mV
 38cg==
X-Gm-Message-State: AOAM532H/L/4hhywY9pPEkzZzzn0LQKO4egvuhenZlyzyEk5j8NaP0MM
 Kmg97eO5OQ/m71z0PnAs0UVucrVUmwX4i/ySLS10z+YBPLDJyoFG+qc7oL5PzZrjPZp6HWitGLM
 RZ+BPw1vGLGtwgypJSkk6Wf3HPa5XHiIGyFJuUmjP3rqiTmRaBHNL6VY3oTRqfkAb
X-Received: by 2002:a05:6000:14d:: with SMTP id
 r13mr1115490wrx.420.1632762202952; 
 Mon, 27 Sep 2021 10:03:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcP1qA/im/0KRmiZN0ME7C1xlTWjvRTOWGplcPu7zZBXH3lAqlyL9vzBhL5fpbjcT3r7GOag==
X-Received: by 2002:a05:6000:14d:: with SMTP id
 r13mr1115456wrx.420.1632762202720; 
 Mon, 27 Sep 2021 10:03:22 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id m21sm69825wmq.37.2021.09.27.10.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:03:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/21] avocado_qemu: fix inheritance order on LinuxTest class
Date: Mon, 27 Sep 2021 19:02:18 +0200
Message-Id: <20210927170227.2014482-13-philmd@redhat.com>
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Willian Rampazzo <willianr@redhat.com>

Class hierarchy on Python is defined from right to left. Although the
current code is not harmful, let's fix it to avoid problems in the future.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210920204932.94132-7-willianr@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 35318ce2a9c..1841053e2c1 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -424,7 +424,7 @@ def default_kernel_params(self):
         return self._info.get('kernel_params', None)
 
 
-class LinuxTest(Test, LinuxSSHMixIn):
+class LinuxTest(LinuxSSHMixIn, Test):
     """Facilitates having a cloud-image Linux based available.
 
     For tests that indend to interact with guests, this is a better choice
-- 
2.31.1


