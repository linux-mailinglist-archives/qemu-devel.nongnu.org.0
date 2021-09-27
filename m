Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E9D419CB3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:29:49 +0200 (CEST)
Received: from localhost ([::1]:52590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuRm-0000rt-QJ
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2m-0004DT-1K
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2i-0003jQ-MC
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N1o/M4XNrGTbxBsI5IFBMJL/wUMj83voLO7bWtA3Hr4=;
 b=UnrFO8gLmT2Hoexdnf6a5Tbc+gDqMGeKns9srCZ14oQ36axLoNiU9ilFJkBhJPIfrm1Mdi
 W3QgzMpw/hQnpxwUAm3+RpxsfoCO+jWjSq8RehGQJjYLsZIzfLxDP4vN1Ajitd6olJSdlP
 KsyZZKJp56qArcwP+wUNIpdWEw+KapI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-EJ1QEo7YMYGeMjsEDa2T5Q-1; Mon, 27 Sep 2021 13:03:50 -0400
X-MC-Unique: EJ1QEo7YMYGeMjsEDa2T5Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 b139-20020a1c8091000000b002fb33c467c8so508344wmd.5
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N1o/M4XNrGTbxBsI5IFBMJL/wUMj83voLO7bWtA3Hr4=;
 b=wc2HsRKd41ODyNqpY7TZipnokSeOfEA+l/jWfznlI5ABjqMshUf/pK5wsIqcU3dzYE
 ntHvFPHeuapywWZHrZcI6YE7utArC1yu9wyG/6jGVKKQEtlFDoJLpNGv78zMYT7vai/q
 kKPqHoHxOrcqJFBXO9EhRfk4qtGAY4+zYsLDyi43ck9pzWfYRt24ZZhu9DdPwgMmKWXz
 RqrFGaWnCtAAwjmz4RMCGNF1jlm60QdeohKIR/TB/kM8A5VJiAt0s34dwj4bDk4XIOfo
 k+HARapXu3nuFtFVtUZTLHaM2MUQDdbUg+swD0/MzG+4w29DN/2EEkHfbkSoXKsbojtT
 S2KQ==
X-Gm-Message-State: AOAM531emqL0n7PpTtlWcz67/Md4uLlvMlFEVh1tEP5yoRiM5LLGGt+0
 XfUtIwbCeN8PJAgHuyCasVVYJHddIygyVV8skMCEQO8UXO8NtXRxI3srZnARw4UZGManKZp97iJ
 3SZAFbtIRa7E7qUenjNTX2+PLqPZdkjt9zuPdJ7klwo/UikTSClAAwNnx6TiWjRuE
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr102081wmk.141.1632762229502;
 Mon, 27 Sep 2021 10:03:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzV+yx4ox6pMkfKWmDFtYZoqgixrGwy1JET5X9ypHxJkWANrxb+Ephy6RNRQzfbq7M6pd3Mvg==
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr102054wmk.141.1632762229319;
 Mon, 27 Sep 2021 10:03:49 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o17sm17055943wrj.96.2021.09.27.10.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:03:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/21] acceptance/tests/vnc.py: use explicit syntax for
 enabling passwords
Date: Mon, 27 Sep 2021 19:02:24 +0200
Message-Id: <20210927170227.2014482-19-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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

This matches the command line on 82a17d1d67, where the "on" or "off"
should be explicitly given.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210924185506.2542588-9-crosa@redhat.com>
---
 tests/acceptance/vnc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/acceptance/vnc.py b/tests/acceptance/vnc.py
index 22656bbcc2b..f301fbb4f56 100644
--- a/tests/acceptance/vnc.py
+++ b/tests/acceptance/vnc.py
@@ -45,7 +45,7 @@ def test_change_password_requires_a_password(self):
                          'Could not set password')
 
     def test_change_password(self):
-        self.vm.add_args('-nodefaults', '-S', '-vnc', ':0,password')
+        self.vm.add_args('-nodefaults', '-S', '-vnc', ':0,password=on')
         self.vm.launch()
         self.assertTrue(self.vm.qmp('query-vnc')['return']['enabled'])
         set_password_response = self.vm.qmp('change-vnc-password',
-- 
2.31.1


