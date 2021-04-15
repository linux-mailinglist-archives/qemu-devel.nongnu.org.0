Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96642360980
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 14:34:19 +0200 (CEST)
Received: from localhost ([::1]:38802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1CM-0007xm-Hy
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 08:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX15Q-00039z-2K
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:27:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX15O-0006B0-BE
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:27:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618489625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VGzikIBP/Z5SEBvKQqeWbm5PvQswPv/9xcZd1fSf1xk=;
 b=izlhcKt88eJMq3V9qWSnS/Nyid2sHONiX8ZnGfSqWZwSKeftaWnltG9N7kcJZPoHfqe3eS
 pRwvMcrPDEgNro66a3+sO8aIW6pJM+k/992Fr656DWGGdJWPXURFv0/X5kVp4xMvnZkrcj
 ZXZo1vgIVOinkWp4WQxZuH56gf20m9E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-11wXdvRjMrSHZ4AQdpiuwA-1; Thu, 15 Apr 2021 08:27:04 -0400
X-MC-Unique: 11wXdvRjMrSHZ4AQdpiuwA-1
Received: by mail-wr1-f69.google.com with SMTP id
 y13-20020adfdf0d0000b02901029a3bf796so2688815wrl.15
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 05:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VGzikIBP/Z5SEBvKQqeWbm5PvQswPv/9xcZd1fSf1xk=;
 b=BmTP1j+8ZX92GRYFCgxSW41AJGUbNJQZ5+nndwCz/2Aj0KVVfmENPlZxCmAz71AAqC
 7BQ0oKj8fNdSN3hF10dfCoqVESTuTcdDyMSd71UCDp/96IKCntSNk49+CCq55dc/JQAJ
 fKh0kiGS3nWJNCYfBmLgKp71aWz/6OQqbEti78hbQ+HzO+Itvr1+Fari5bWZy6m8xC5c
 eP3QgOgTHKjxZktUXPK22N5yg9wIkicu5DP2GCWtp+aBiUO4DFUljDtwJdg4fk6VN/5z
 Pd3UUQxEbbhPs1vlKLLAjLO8MrA44K4dL/+zwAVcD4QqKQ2VR3EqSUnO9y/p7kXhrsyB
 yC7A==
X-Gm-Message-State: AOAM532O+hyaRFvV23VHI4Sf2wdotMZVTefQq2mKV6Dj2lzA+l114zAG
 Y26M/F8wHLgqTzXXg/T4iHSyMBG43gA/+NQCLrMLvfE9+dYKhHTiVjO9zTMbZjlKwOdkWrRgWR+
 xhE2q+S3j+SHBgltRxTYd4QGMwraT1rKja3u0EBagc2B8jDb4Z+YNsTpFupHgv0xm
X-Received: by 2002:a05:600c:649:: with SMTP id
 p9mr3008091wmm.47.1618489621871; 
 Thu, 15 Apr 2021 05:27:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxC5NXLBgOzOhUouyDApWFT7C8LlF+mZV5ojCSMSkE36v7aKPPrnEJCbdjyb290Dn6K+qcTvQ==
X-Received: by 2002:a05:600c:649:: with SMTP id
 p9mr3008057wmm.47.1618489621666; 
 Thu, 15 Apr 2021 05:27:01 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u3sm2456551wmg.48.2021.04.15.05.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 05:27:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] tests/qtest: Do not restrict bios-tables-test to
 Aarch64 hosts anymore
Date: Thu, 15 Apr 2021 14:26:32 +0200
Message-Id: <20210415122633.4054644-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415122633.4054644-1-philmd@redhat.com>
References: <20210415122633.4054644-1-philmd@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
32-bit Arm hosts") we can remove the comment / check added in
commit ab6b6a77774 and directly run the bios-tables-test.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/meson.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 0c767389217..46de073d155 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -175,14 +175,13 @@
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


