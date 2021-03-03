Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F58232B7ED
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 14:09:49 +0100 (CET)
Received: from localhost ([::1]:42600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHRG8-000665-JX
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 08:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHRDU-0003tJ-DB
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:07:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHRDS-0004y4-Ve
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:07:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614776822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VqH3zdA9PALnmMVf2BjuYnUewuE2RUcKR6tHZ9TNmeg=;
 b=clrxsrZnzTDDDa7hA+IwKMGLxHHEwrGyTT+SbIx14uyDmEh2FkiZYZO5fXa4eaxAhIoEA8
 bTRngre12QqYEsqQ/mfsiRA7zohuY6sluu5lCgMmehV1uppH7GINxMJeOtEpQ+TvCQ2uBQ
 pfL8yl7mTCyPMP9T1oRg15Z1gpQGlZE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-40Xf3lXUNliHVinN3ehbMg-1; Wed, 03 Mar 2021 08:07:00 -0500
X-MC-Unique: 40Xf3lXUNliHVinN3ehbMg-1
Received: by mail-wm1-f72.google.com with SMTP id c7so1221915wml.8
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 05:07:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VqH3zdA9PALnmMVf2BjuYnUewuE2RUcKR6tHZ9TNmeg=;
 b=IeZxz0WcddxahgKLSBsy/CQlTwIg9MrfFncx49QU7vV3JgYRVyS+MhxPoEHCj3C6Dt
 bmH28gjVoaQ8n0qwxVePFBybCOCGm5pCLMr0ArxlG0AdSF1pcHtprb29zTaieAz8E1a2
 M5kmLG/ZXwe6lkzcy7TrlWwxJ6c5OmsS4SJ55csaiRw5fOnBfIu55fiaxwbKrd8x8NLd
 +yWtC+P6QXUWIqrUTuyjLn3dEetpel2jkqhQUkaZMwe2F243y5NpgF2+Hlz3cgVPeCVd
 pDaJwA5Ix6bm/yzfQgbdQ4uoV62nUE0HSbJOuT0BAyXKbdlb86k19UprdcJWEvqx+NZU
 zp5Q==
X-Gm-Message-State: AOAM531XiwDe9DSSelzZRIAv1jpWLrXO1DZVRvyEgJho8+u2C2fYsKGV
 eBBdEeWBvZdXSdm3ovKgZMwefMvjhPCe3BF6aPFHbQ+xGXy788bhVTx6Md3A1RcNz8hlLgZz4cW
 ryEsxIbkoRWbv/SQ=
X-Received: by 2002:adf:fbce:: with SMTP id d14mr26185831wrs.44.1614776819147; 
 Wed, 03 Mar 2021 05:06:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzR8pYj1lmCRN9HBWd02yo6C4ILsfyBqlRVq0FRvYjiNLH+ks/lbOzeWUr+PiPB3bDtLHhFnw==
X-Received: by 2002:adf:fbce:: with SMTP id d14mr26185805wrs.44.1614776818937; 
 Wed, 03 Mar 2021 05:06:58 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y18sm31388797wrq.61.2021.03.03.05.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:06:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: "Daniel P . Berrange" <berrange@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] docker: EDK2 build job depends on EDK2 container
Date: Wed,  3 Mar 2021 14:06:45 +0100
Message-Id: <20210303130646.1494015-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303130646.1494015-1-philmd@redhat.com>
References: <20210303130646.1494015-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Richard W . M . Jones" <rjones@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add missing dependency build-edk2 -> docker-edk2.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/edk2.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
index e1e04524166..ba7280605c4 100644
--- a/.gitlab-ci.d/edk2.yml
+++ b/.gitlab-ci.d/edk2.yml
@@ -25,6 +25,7 @@ docker-edk2:
 
 build-edk2:
  stage: build
+ needs: ['docker-edk2']
  rules: # Only run this job when ...
  - changes: # ... roms/edk2/ is modified (submodule updated)
    - roms/edk2/*
-- 
2.26.2


