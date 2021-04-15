Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F2B361045
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 18:37:34 +0200 (CEST)
Received: from localhost ([::1]:36612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX4zl-000509-6l
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 12:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4vm-000319-BB
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:33:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4vi-00064g-Mk
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618504400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UBTlRC9OTcPVKm7FJntznC4sA/TysO3weRQeCkv1c6s=;
 b=R/jhsPoQ81qSiazwecyOatCa86rqke6ARWU2k+MGQqI6zONHOYmH9s5xEzawcm5ByNdRed
 FMUv4gKALQlqxf6OjH7LV/kQbiVPWF+xCiHEaHGGdEb39OcAU1tTVUNDkaB0XfpH2hJVnQ
 t1K+C1+TSvXGSFvsIJSawQKRWdRt+eU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-nLnDkEEzP36J4qk2F4Tk0A-1; Thu, 15 Apr 2021 12:33:18 -0400
X-MC-Unique: nLnDkEEzP36J4qk2F4Tk0A-1
Received: by mail-wr1-f71.google.com with SMTP id
 y13-20020adfdf0d0000b02901029a3bf796so2999750wrl.15
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 09:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UBTlRC9OTcPVKm7FJntznC4sA/TysO3weRQeCkv1c6s=;
 b=NUHO/fEXiTeXeGsWSWtzwlGwOI8zCuPXZoFix7aJP8PK+OBXHMi29gBsHYcYdBg1Cw
 LPCH+OPic/9baJDZUekdcOUK+zYT1n+I/L5aL4bCB0av8BJikAMflnUZ8YdQvWGMHi1q
 8aiPcG+6Sev5nu6IZgTO846Ow8i6d4qryjGFoO2Q3IaXoDTVlS9qF/2PqynO/3IKhH2C
 cdlZSQzN8tgj1IX7b1XpiJQa3SpdOYrnywthhzxMIltTzSl774gJVgob8JkXqabruYmd
 UpmFXMkUhD+N9TPrWCgk95pP38i/QxPbXudmsObfbwXkBV32YvO9A1ALyAi2C0iwxg4Y
 3x8g==
X-Gm-Message-State: AOAM532Mb/GiS84u8Jb/0yzRAoAeDZpFFEyMSQqzdyBJB3QSNi9aGqb7
 vOOxMcCwaKl4MKi26FhKx/67bX6EtdjRAfnHILGJrAzC9azI3tjvCZQ7HoXMnlBTNQzP6A8LaeT
 tAo6ivjJbxBQEPzzrpMYqW60vlyuiprxnic8/6cpyAweLak+J42lYMFNH4KE9WaH7
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr4006584wmk.63.1618504397071;
 Thu, 15 Apr 2021 09:33:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBuWtEXyK+F21u0OVkokRWbtdq2U93WqUucXas7XeUyPFnoIN53N3az3bwJUIJavWaWVV1cw==
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr4006561wmk.63.1618504396927;
 Thu, 15 Apr 2021 09:33:16 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u6sm3963065wml.23.2021.04.15.09.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 09:33:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/12] MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG
 CPUs section
Date: Thu, 15 Apr 2021 18:32:53 +0200
Message-Id: <20210415163304.4120052-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415163304.4120052-1-philmd@redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want the ARM maintainers and the qemu-arm@ list to be
notified when this file is modified. Add an entry to the
'ARM TCG CPUs' section in the MAINTAINERS file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36055f14c59..d5df4ba7891 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -156,6 +156,7 @@ S: Maintained
 F: target/arm/
 F: tests/tcg/arm/
 F: tests/tcg/aarch64/
+F: tests/qtest/arm-cpu-features.c
 F: hw/arm/
 F: hw/cpu/a*mpcore.c
 F: include/hw/cpu/a*mpcore.h
-- 
2.26.3


