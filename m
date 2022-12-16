Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C05E64E93F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 11:16:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p67kO-0000E7-Cq; Fri, 16 Dec 2022 05:15:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p67kJ-0000Dj-Qb
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:15:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p67kI-0003jb-D6
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671185712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XZd3HzAjJ9xPg38fGQkpD3Zut3j+7V1bMLg8fvGz+vQ=;
 b=QJx4AgYWN1qzYoGy8o3IKdAZJxxqZiE+gh+f2uhHf4XRPFyvqvQj4v7JGi1Fe1BsUxw9zB
 yg400ToyfgK850waXKj1Gt6KZSMgzoxfSH2aO87AXaBklgKroD9RymihYRQ4giF0yRIH+3
 bh3SQfxWUT2U5sxUogbcj2J9CATP5yI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-471-6UkvthXGMLeJ8pdY9aCBZw-1; Fri, 16 Dec 2022 05:15:10 -0500
X-MC-Unique: 6UkvthXGMLeJ8pdY9aCBZw-1
Received: by mail-ej1-f72.google.com with SMTP id
 gb10-20020a170907960a00b007c192c5482eso1520939ejc.7
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 02:15:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XZd3HzAjJ9xPg38fGQkpD3Zut3j+7V1bMLg8fvGz+vQ=;
 b=vF5FL8ueYC2n30aaGcH88c7Co0ZjwvuY/P5pj6lEePuoUdcblOhgezte/DqF9lmtVn
 VO2nLVYcqTPb8WNZYY58ABBGcK/L2TTEpUmMc7d7dLuNbLYRLBjhnsDeGSFm3DfIG9Y4
 E/Q1NUKAahn6PGc56089DIrwBIyf9SosgiTU3Z+qoVM3hPYLeKYZAky1L5ridQTRDpPS
 myFKhuyttiHMVgA+1pI3fGPULAZ+3/K1NeHydu6wUoBuHdrdROdng6SP/J4cObGyA1pK
 LUwZOqZAjGHDHUPdlNh0RSwfzva4Pe0FGHdG5ngK5WEVS1l//bV9PQbFrj+fXxk9Cn+H
 iGFA==
X-Gm-Message-State: ANoB5pmjSN6YnF7uUkNLmOKruypG+TVaZ30TCW49FNLSRaQDna+TH1lk
 2QOEoBahO8urqK6YPO2Syc4fHFPEO5ZHtNB628T9+0q9or2MZfz3IBNNFvH+4Nhukjzh7Q/pcAL
 AHQPx7Ai7hYsnxg7OJQRCwahiDZX07PsMlkFCF5GYi+35cc4J3W23CJd6q11jAfLTkrQ=
X-Received: by 2002:a17:906:9701:b0:7ad:fc14:fee9 with SMTP id
 k1-20020a170906970100b007adfc14fee9mr27478780ejx.23.1671185708973; 
 Fri, 16 Dec 2022 02:15:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4FFDI/jLZWiC0KNRbi7/tatHPb/7WXL6v4X3hYDdi9JZzzMSruyaRBL1S19FG8vtoE5S5+jw==
X-Received: by 2002:a17:906:9701:b0:7ad:fc14:fee9 with SMTP id
 k1-20020a170906970100b007adfc14fee9mr27478759ejx.23.1671185708731; 
 Fri, 16 Dec 2022 02:15:08 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:cdd2:bd6:b053:4614])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a1709064c8d00b007c0c91eae04sm675103eju.151.2022.12.16.02.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 02:15:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PATCH] docs: do not talk about past removal as happening in the
 future
Date: Fri, 16 Dec 2022 11:15:06 +0100
Message-Id: <20221216101506.524217-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

KVM guest support on 32-bit Arm hosts *has* been removed, so rephrase
the sentence describing it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/removed-features.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 63df9848fda2..7e12145c120d 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -565,9 +565,8 @@ KVM guest support on 32-bit Arm hosts (removed in 5.2)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 The Linux kernel has dropped support for allowing 32-bit Arm systems
-to host KVM guests as of the 5.7 kernel. Accordingly, QEMU is deprecating
-its support for this configuration and will remove it in a future version.
-Running 32-bit guests on a 64-bit Arm host remains supported.
+to host KVM guests as of the 5.7 kernel, and was thus removed from QEMU
+as well.  Running 32-bit guests on a 64-bit Arm host remains supported.
 
 RISC-V ISA Specific CPUs (removed in 5.1)
 '''''''''''''''''''''''''''''''''''''''''
-- 
2.38.1


