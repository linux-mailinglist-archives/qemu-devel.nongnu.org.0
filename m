Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5B445B879
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:37:44 +0100 (CET)
Received: from localhost ([::1]:41188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppep-0008Bd-SF
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:37:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mppY0-0007ua-RM
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:30:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mppXv-0000qJ-06
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:30:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637749833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/SgJJ/WCm3zlODzcr6BGSigeRot5zSDsVL9LVia3yZw=;
 b=VNWg9D+EssmY7KRmqHyvGnH+DCNMk8w0+J2WVBWYG9CNpf34SeKcQwflctQJqyyGyytW+Y
 YR2yUIZ7GxoquLd3ZUS6Gxtg5sd6M3AwnghGVatZFeEpQ4CGoVyCKbcatvd+fTbW9eqhAO
 4GkKt+BKbTJkw7qcZktT2Ict3JmTviM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-RwleW4CONPKUo3SOFYn1VQ-1; Wed, 24 Nov 2021 05:30:32 -0500
X-MC-Unique: RwleW4CONPKUo3SOFYn1VQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so1167618wms.7
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 02:30:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/SgJJ/WCm3zlODzcr6BGSigeRot5zSDsVL9LVia3yZw=;
 b=t8HD/ozX82o2CaHx/174F81CijAIDtQQ42svX9xwaKe09wyhf3Uz9Pm8ALausvSs4X
 KiPRr1vcYJJ4ROUXUYc9Z7xeELt7t86GB2bsR9DoE+QDq5rqc5Tp+x/IuVE3qHYm6394
 l0zOc+Rf1fgapIJjxJbnbsf8sZ2gfWKzqXBkSYDgXQdM8pnrYHPPxv7ZMQj7chCUOoMC
 jT8luPwTb2Hw2DAEY3Vf4WWY4p6TLa6gUY3+2IcbW8IaJuewmoRwpdwZVP88vjkzTQCp
 dyAz6F76T+Om7LZE18lPPwAFs1FcJzZWvQdnZzHTYKB+FXZoA7Ewnf88nzNMr+20dWX8
 /ZZw==
X-Gm-Message-State: AOAM531Q6N16x79P+J2WO4fphnm/M2nFhpjOqlJGbuBmRT/z4Mas1jbM
 Aa9oMn5XG7Q1ttfxVEnVclZa9WpaglVUlf+XmFozKJDZLmZJLDT02NNns7RLWeUbFprOcgr2aac
 XGKbnLMuyC2O2YlvKejdfbPZKWJcFHLyHncT9ogC2HSDLbIH+SNlpmETHXdGb5zLN
X-Received: by 2002:adf:ea0a:: with SMTP id q10mr17333955wrm.1.1637749830540; 
 Wed, 24 Nov 2021 02:30:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUeG3l/tP/vwu94JB2oPF9+GiPOtl15aT1gsmAr5PiiwtjZJ70Bnq1enJlD5z3ALCRJOsk7g==
X-Received: by 2002:adf:ea0a:: with SMTP id q10mr17333897wrm.1.1637749830181; 
 Wed, 24 Nov 2021 02:30:30 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id q123sm4040465wma.30.2021.11.24.02.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 02:30:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH v4] Add Sponsors page
Date: Wed, 24 Nov 2021 11:30:28 +0100
Message-Id: <20211124103028.484302-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Thomas Markey <admin@fosshost.org>,
 Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a page listing QEMU sponsors.

For now, only mention Fosshost which requested to be listed:
https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05381.html

Cc: Thomas Markey <admin@fosshost.org>
Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/2
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Since v3:
- don't explicitly state /what/ we're using the resource for,
  just that we've been granted it (danpb)
- only list Fosshost again (Stefan)
---
 _includes/footer.html | 3 +++
 assets/css/style.css  | 6 +++++-
 sponsors.md           | 9 +++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 sponsors.md

diff --git a/_includes/footer.html b/_includes/footer.html
index 1a0b960..b1f3f0c 100644
--- a/_includes/footer.html
+++ b/_includes/footer.html
@@ -15,6 +15,9 @@
 	<div id="conservancy">
 		QEMU is a member of <a href="{{ relative_root }}/conservancy/">Software Freedom Conservancy</a>
 	</div>
+	<div id="sponsors">
+		QEMU has <a href="{{ relative_root }}/sponsors/">sponsors</a>
+	</div>
 	<div id="licenses">
 		<a href="{{ relative_root }}/license.html">Website licenses</a>
 	</div>
diff --git a/assets/css/style.css b/assets/css/style.css
index 88f7e85..aede79a 100644
--- a/assets/css/style.css
+++ b/assets/css/style.css
@@ -533,7 +533,7 @@
 		padding-left: 1em;
 	}
 
-	#licenses, #conservancy, #edit-page {
+	#licenses, #conservancy, #sponsors, #edit-page {
 		padding: 0em;
 		padding-left: 1em;
 		padding-right: 1em;
@@ -552,6 +552,10 @@
 		float: left;
 	}
 
+	#sponsors {
+		float: left;
+	}
+
 	#edit-page a {
 		overflow: hidden;
 		background: url(../images/edit-page.png);
diff --git a/sponsors.md b/sponsors.md
new file mode 100644
index 0000000..6db5e2f
--- /dev/null
+++ b/sponsors.md
@@ -0,0 +1,9 @@
+---
+title: QEMU sponsors
+permalink: /sponsors/
+---
+
+QEMU has sponsors!
+
+[Fosshost](https://fosshost.org/) has provided QEMU access to a dedicated
+physical compute host.
-- 
2.33.1


