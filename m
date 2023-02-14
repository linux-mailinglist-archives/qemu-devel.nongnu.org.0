Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDAE696374
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 13:27:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRuMr-0006rN-9c; Tue, 14 Feb 2023 07:25:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pRuMp-0006qo-0q
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 07:25:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pRuMn-0007Av-CE
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 07:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676377500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6EcRP+A0pP/Y8Gej86uCDnYdnrm4fwXbiIV6i9dGmc0=;
 b=KaW7pIXT8Z7W6y8zDeZ6N4EAGoBDiKw7HN/3+u3umI4vsFTNv8H2JrrM0dGg57vduOeWGd
 FvfDPi8v2UMp24kli2GKt+wlWWGyNWBJ/9egJkUQQX+A4aBhGIg3Zvur14KBJrsJeKf0+I
 fsyLq5xc53Inde1Amp+zPycMsPsmLJc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-355-axynSwYPMXuHTftjo9LKqg-1; Tue, 14 Feb 2023 07:24:58 -0500
X-MC-Unique: axynSwYPMXuHTftjo9LKqg-1
Received: by mail-ed1-f71.google.com with SMTP id
 g25-20020aa7c859000000b004a3fe4cbb0cso9800574edt.17
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 04:24:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6EcRP+A0pP/Y8Gej86uCDnYdnrm4fwXbiIV6i9dGmc0=;
 b=oAkQhYsTT08f8UZt6tYj2pQCmqAidmfpMcuqe3wt9ezwSJnEFD+QHxUmltzxYrUUv+
 AXbzQx44ZmsmccSkq6oxCJ9Wl6fl3TE4MkesNTkURXN1UaBWGygNO/7h4O1JfAIAX0pf
 jlYqZEKIKGKn7qP39XfkfisC+eRziB5PEdSnPdGRnbhi/RmVaoi9aaUcaozzSI1COiQm
 tgPWpjcRUmcRhgyXrvOlUkolGQ3QmTYUdRkBvxlqzYLpFxbJUoQGJnghjjeWUMzbQy6X
 7l4fWCJFl7G+F4th1Bk4qWgPXwnExyoV1EHzVmbRn0brkNcLd4hBo8DMAkrEXA0cHto0
 OVWQ==
X-Gm-Message-State: AO0yUKXy5BbXPlS9n58yVRSPaQMnfTPyht4c1kTLXpEydKBmG0MZ637O
 TGa90kmxQJn3dZ5TXvX0sAEy3gejffU40/52sVXVtno2yA1zXp3e+dxkW3SPMpIVqUkOws9Azvg
 WxUKaR6SbRdQHOWR8av0acZVaBJUmfy3d9tU21umAu0wjZlem2CCK1yjH9mIy1iWWvFyPAlJ7
X-Received: by 2002:a50:8d07:0:b0:4aa:b281:bedd with SMTP id
 s7-20020a508d07000000b004aab281beddmr1957601eds.20.1676377497159; 
 Tue, 14 Feb 2023 04:24:57 -0800 (PST)
X-Google-Smtp-Source: AK7set92cZKgTnZPf+eiqv6TTTaQN6wnRQfTkWflOqcswR10DbX/1V369kN9jD2I2/wMMx6Jv+YkEQ==
X-Received: by 2002:a50:8d07:0:b0:4aa:b281:bedd with SMTP id
 s7-20020a508d07000000b004aab281beddmr1957589eds.20.1676377496888; 
 Tue, 14 Feb 2023 04:24:56 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a50d548000000b004ab33d52d03sm7002605edj.22.2023.02.14.04.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 04:24:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: [qemu-web PATCH] add missing <h2> tag
Date: Tue, 14 Feb 2023 13:24:53 +0100
Message-Id: <20230214122453.30179-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The homepage goes straight from h1 to h3, add the missing tag for use in screen readers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 assets/css/style.css | 12 ++++++++++++
 index.html           |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/assets/css/style.css b/assets/css/style.css
index 779b111..2705787 100644
--- a/assets/css/style.css
+++ b/assets/css/style.css
@@ -44,6 +44,18 @@
 		color: #802400;
 	}
 
+        .visuallyhidden
+	{
+		border: 0;
+		clip: rect(0 0 0 0);
+		height: 1px;
+		margin: -1px;
+		overflow: hidden;
+		padding: 0;
+		position: absolute;
+		width: 1px;
+	}
+
 	pre,code,samp,tt
 	{
 		font-family: 'Roboto Mono', monospace;
diff --git a/index.html b/index.html
index d72750c..676c379 100644
--- a/index.html
+++ b/index.html
@@ -14,6 +14,9 @@ colorbox: True
 	
 <!-- Featured -->
 <div id="featured">
+	<header class="visuallyhidden">
+		<h2>Features</h2>
+	</header>
 	<div class="container">
 		<div class="row">
 			<section class="4u">
-- 
2.39.1


