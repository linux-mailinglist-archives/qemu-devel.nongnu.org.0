Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FF33D956B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 20:41:05 +0200 (CEST)
Received: from localhost ([::1]:56052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8oUK-00066v-ID
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 14:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8oNJ-0001Qv-5z
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:33:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8oNH-00084w-27
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627497226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UqrW0Sla0ZIMGOhCwg5p11uC6F3WxKFY1joS1Ihifn0=;
 b=KB1CpAm6bKjUnvYv3GQCcHR5wb4JyW6Nu5gRGfVmPINUJUBmIzmGNBZTYfykjIkWTI4Xqe
 ZtFL5fJS4m/NVshasoi1Vaz7WCMI3LHtN012MWfsT9+qwUhwNxPepeTovi7OkTlXQnHPFq
 S0iYaC1K7sShCYkHoqmPpPlNDh0GaX0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-KrVdopH3OD-AIrxPjRsj0A-1; Wed, 28 Jul 2021 14:33:43 -0400
X-MC-Unique: KrVdopH3OD-AIrxPjRsj0A-1
Received: by mail-wm1-f71.google.com with SMTP id
 o32-20020a05600c5120b0290225ef65c35dso1611699wms.2
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 11:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UqrW0Sla0ZIMGOhCwg5p11uC6F3WxKFY1joS1Ihifn0=;
 b=ndqHZw7TuDzNBBs0pTY3ek9/0feJzQ5D0KPECPaEMxjTzgFEFiRhSIHvDrYpeAMpey
 /U3yzXJQBeO/bsEf1c7pRTaJECXalEbe6fixCpQYtP6tS/zq4kw2dRjyOlRK7SokNzlB
 d0+s1Xzd37qhnjne0ocmLTfWkaf8mW6q099f2kIf1+M4gceNM9jptEfuJvHbSWpL3TWW
 Bn+RzbecqhCtBvhtfcdrKy5pxRj1E5stXpNbuM+NqCCj43D9cwAHEmsFfn9IdDpJ3KcV
 QvQHGQPe3F8LyaY4sdVW93JDNEZ4KplNpmOabm9D4Ve9ih6xjl75URXctwdIp1F6otrW
 V4LA==
X-Gm-Message-State: AOAM533PrUEcF0u9X2TfmN2+kWpTEWIoYPfcp/paPJOTwRz7tNip34aR
 QA6aggiwHnbZb1LX6tQmGi+jJ5lKUjchrIvVu5LrVrzDH196SZczdmZNLWboW4v37a5b/UHoP05
 uq+8DUxJabX2uO27yZu4hVrAxwnUUsMdXxRXODZV9ON0nR2lk9iLPtmf+J3Tkxm0u
X-Received: by 2002:a5d:68cb:: with SMTP id p11mr752619wrw.364.1627497222056; 
 Wed, 28 Jul 2021 11:33:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyne599w+YAhZrrxBG98brVwn9o0Si8M7z0Fs86RzAyymDBNV7DPQTHZszQjhmtTdVSGCV2bw==
X-Received: by 2002:a5d:68cb:: with SMTP id p11mr752600wrw.364.1627497221828; 
 Wed, 28 Jul 2021 11:33:41 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 n186sm8105191wme.40.2021.07.28.11.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 11:33:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Added myself as a reviewer for the NVMe Block
 Driver
Date: Wed, 28 Jul 2021 20:33:40 +0200
Message-Id: <20210728183340.2018313-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm interested in following the activity around the NVMe bdrv.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42ac45c3e50..4a42e9eceaf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3178,6 +3178,7 @@ F: block/null.c
 NVMe Block Driver
 M: Stefan Hajnoczi <stefanha@redhat.com>
 R: Fam Zheng <fam@euphon.net>
+R: Philippe Mathieu-Daudé <philmd@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/nvme*
-- 
2.31.1


