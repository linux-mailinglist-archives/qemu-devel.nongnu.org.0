Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28385391DBE
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:20:50 +0200 (CEST)
Received: from localhost ([::1]:49894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llxD2-0006iJ-7t
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwzC-00085K-Mc
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:06:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwzA-0004dE-9w
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:06:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622048783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W8w7RhXeFSRWGk0AutdMu5ukNCwh8itA/alKjBFfess=;
 b=Xg/GaH1jxMC0bZA86hEzFtRD1Yg8RyNeasFFgi0XQExCCjz65QakvmBLvCIFVVknkQzQrc
 85YUxUeGIwa7bR4jNWdOQ4lJivWLVWGm/PCUhNLqN7zlS9RPjQz5zKkjWReAcRuYVO9DM7
 bwGYSfCUs60XaKs3tPCeC5t08f6vp4U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-IZCjU26dPvC8GrITBOgHIg-1; Wed, 26 May 2021 13:06:21 -0400
X-MC-Unique: IZCjU26dPvC8GrITBOgHIg-1
Received: by mail-wm1-f69.google.com with SMTP id
 b67-20020a1ce4460000b029017517d833b9so637653wmh.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 10:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W8w7RhXeFSRWGk0AutdMu5ukNCwh8itA/alKjBFfess=;
 b=sYoAQAMvSqGytow4Z7pXROAtErS8Gme44VzpXM817PgXSDRCmLfdzmomKLDi13jvSe
 +PxvHu6wmluNBsnDNl+QKpEkJ4TDReONyoH2uF4CHhTJ39hM9Xc3zXsl3VDpzlo9MEOI
 BMfA+kfcMEDjNM6l1xeHG3L53gYvjNh3GO3uVaQb3oi9h3E3KHXJgFVAKpCuukG4Cg0/
 ENqQzugKNW1zYki74PaDx/DE4XD6DtpEqNcYUhDTOu5dRihzxDTzZvzP6Scs/71M1NN5
 kFV4aa1uVzh87uL+LpKcSNP7s9wMDMp5GUFAcXDgbpxL5TGAlOmjJe9QSqmDsVhrew+I
 5FDw==
X-Gm-Message-State: AOAM533MJhPrxQFflZRrniGjobCncN8jH65/zArPutI4yR8H0ChFWxtP
 CZAL+wNA8CoRCPCrn2CS96WsoYBHiBZQo38EPSH9QTNlL6lHqiJXbNAEvQ9vLGHd2/Qphp2bW+a
 Y+xinfM+enI0yv7n2ItaWqdpwXBqk89elgOeDjuP1nhcsIshrsIf4n5j4zVrNJU7+
X-Received: by 2002:a5d:55cd:: with SMTP id i13mr2823917wrw.128.1622048780396; 
 Wed, 26 May 2021 10:06:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQUEpbGLh/42akCiHF4ChNzY8xqgXWdGOz7fzfxNbTnvC7lYyvgHeEHFwauq9NRBI684rz1A==
X-Received: by 2002:a5d:55cd:: with SMTP id i13mr2823891wrw.128.1622048780168; 
 Wed, 26 May 2021 10:06:20 -0700 (PDT)
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.64])
 by smtp.gmail.com with ESMTPSA id h15sm15245676wmq.1.2021.05.26.10.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 10:06:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 12/12] qtest: Do not restrict bios-tables-test to Aarch64
 hosts anymore
Date: Wed, 26 May 2021 19:04:32 +0200
Message-Id: <20210526170432.343588-13-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526170432.343588-1-philmd@redhat.com>
References: <20210526170432.343588-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
32-bit Arm hosts") we can remove the comment / check added in
commit ab6b6a77774 and directly run the bios-tables-test.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/meson.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c3a223a83d6..2c7415d6166 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -176,14 +176,13 @@
    'boot-serial-test',
    'hexloader-test']
 
-# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
 qtests_aarch64 = \
-  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
+   'bios-tables-test',
    'xlnx-can-test',
    'migration-test']
 
-- 
2.26.3


