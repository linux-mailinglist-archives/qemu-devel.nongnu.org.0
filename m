Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11594817BF
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 00:35:45 +0100 (CET)
Received: from localhost ([::1]:35472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2iTw-0005MZ-Cw
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 18:35:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2iSJ-0004dF-P2
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 18:34:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2iSG-0003BT-TK
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 18:34:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640820840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Oz2Y26W1sM7BLZISTFb7T41NjdeKcfy+5NOP7vXGfkg=;
 b=V8SY60E/ER3zl3GNYNAaNKwI3lc7G4V/EITHNIrRk6FtHK0XQ/ud4HT1Jkkhn5klOTRIz3
 SMwZfdMbDNUSK1Fcx9bLMvxpK/84qXj42BUeqNQ/kNK7nhtfLvIgGXG7YB18QrwqclxmgH
 l5+IjAs3aigqr9YUu9u61PjhAo3E9og=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-fsZocfZEMhOCTALOpw9q9g-1; Wed, 29 Dec 2021 18:33:59 -0500
X-MC-Unique: fsZocfZEMhOCTALOpw9q9g-1
Received: by mail-wr1-f71.google.com with SMTP id
 x20-20020adfbb54000000b001a0d044e20fso5487831wrg.11
 for <qemu-devel@nongnu.org>; Wed, 29 Dec 2021 15:33:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Oz2Y26W1sM7BLZISTFb7T41NjdeKcfy+5NOP7vXGfkg=;
 b=Fvinwv/sexCaDRb7VTtmnCgBQ9K4nhg6dVPJtLum7+Y6wsipJEHz2jmSvDf7q3p59M
 rGMdlT3CTmACRcQP5He/Yx2/5jBse4mllcW5V/x2kLtrm42RPzkJPlipL4RjaBB06/ZI
 G2FB4XTqTvFDK/p3NIwieEeB1MOKaU3zkH3LucIDM0T7yS/MfJurHQAuDbpEXgDWytAl
 9IiP2km0LG0AhQXukSdbR0fxZSOF8oJ1WKiQjzUpsRBI6BUxwvdFA5gR1nyfJ657AhcN
 PBkWe81GOAnsSCxV7NCMKL9Rxiag4kW5UDBvmRaoxmwh30FiI9y5irQ16OFOvtYO06kv
 7Juw==
X-Gm-Message-State: AOAM5331HEu9xD2BPr4LylQGXec/7VX1fVXiYN/voKUd8fY7EkzZ6jKw
 865k2SWHIhz1d8XGIc+gQ9n/HCJRK0+t2pe4XwBbdQYv2Vdf7eMTf3g9/WDGXfFJBY3rC3SPRa9
 P5GW7O3SNzHUVbGHQ1XwRnwnzP39LnIRkt5g42kw9t4Catna6JXmKAmZXoPf52DwK
X-Received: by 2002:a05:600c:224f:: with SMTP id
 a15mr24069954wmm.72.1640820837707; 
 Wed, 29 Dec 2021 15:33:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyX3waHzB0OlE/bWCUTvAnZBLqKdsNvKRpQLpy91+bEyzFCq910u8pxv7syAsKV4/swPMJ0xA==
X-Received: by 2002:a05:600c:224f:: with SMTP id
 a15mr24069935wmm.72.1640820837456; 
 Wed, 29 Dec 2021 15:33:57 -0800 (PST)
Received: from x1w.. (26.red-83-50-86.dynamicip.rima-tde.net. [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id k7sm22080435wrg.105.2021.12.29.15.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 15:33:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci: Always upload artifacts by default
Date: Thu, 30 Dec 2021 00:33:55 +0100
Message-Id: <20211229233355.217174-1-philmd@redhat.com>
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
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab defaults [1] to upload artifacts only when the job succeeds,
which is not helpful to troubleshoot failing tests. Switch to
always upload artifacts by default for QEMU jobs, by setting the
'artifacts:when' keyword in the global default section [2].

[1] https://docs.gitlab.com/ee/ci/yaml/index.html#artifactswhen
[2] https://docs.gitlab.com/ee/ci/yaml/index.html#default

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/qemu-project.yml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
index 871262fe0e8..24137c14dc4 100644
--- a/.gitlab-ci.d/qemu-project.yml
+++ b/.gitlab-ci.d/qemu-project.yml
@@ -1,6 +1,10 @@
 # This file contains the set of jobs run by the QEMU project:
 # https://gitlab.com/qemu-project/qemu/-/pipelines
 
+default:
+  artifacts:
+    when: always
+
 include:
   - local: '/.gitlab-ci.d/stages.yml'
   - local: '/.gitlab-ci.d/edk2.yml'
-- 
2.33.1


