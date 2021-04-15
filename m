Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0CA3610C1
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 19:08:02 +0200 (CEST)
Received: from localhost ([::1]:34342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX5TE-0004Tn-Pj
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 13:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4wc-0003aH-0j
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:34:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4wX-0006Kl-Ey
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618504452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VGzikIBP/Z5SEBvKQqeWbm5PvQswPv/9xcZd1fSf1xk=;
 b=ASRtAwyfX5sc8yAK7cnpJTdKvjcIFUmjnAXy4EoG9OcniJRvHu4AMz/U+xbhHUOuuQyrL0
 IqnRoB8+zqjzjc0ioH0Gz0jMYf/DWqvjvwWBjP5w6RDV97D/za8CY3sq2ZM8NBb1GBzjG6
 7zM9dyTp2h7KkO/Za2itYEZrO8aGPb0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-INdRnFdrOP-oYoQSL1Kjag-1; Thu, 15 Apr 2021 12:34:10 -0400
X-MC-Unique: INdRnFdrOP-oYoQSL1Kjag-1
Received: by mail-wr1-f72.google.com with SMTP id
 y13-20020adfdf0d0000b02901029a3bf796so3000630wrl.15
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 09:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VGzikIBP/Z5SEBvKQqeWbm5PvQswPv/9xcZd1fSf1xk=;
 b=HnMlwrZuBGoLHysE5SLVNHNUJf1QuDqxbprp/vH7m8c/EvFF2N7N5hwX3eGX34RI+I
 4GRg0AlcdL98RRyTsov+hMqd1NA44secPZ0olo/fPZazFfn8PaH01K2Ys318H3NKRXRy
 rJsdky557PCyAN8Eb0JMSad4C/GJhJo1GV0zZQ8RG+Whb6Xa4v+l2f8TYR2Astcn9ZWU
 jOfU2lE13pkJ3BPOnhCVthyj5Q9r5OYzAAiLJW7LXoDTiGvOc2U770oT3j+809Ok03Px
 9YC8F1klrGivffoVIx7NvzVsGiYSMUF+v305d4xuiNnhcRxgm/bmYTreOug7FmwzDgFn
 L/1w==
X-Gm-Message-State: AOAM531jXm9zYubBjDBY9n4ADN7hL5n/gVayq0RmEi5KYAos6Dt5Q5q8
 inULikymVhZ0nM92ZXHojrUHv35+5JqK4H0QExvO5jzFd2aHMIdMKUrbQ0DjljxyC0ydREGab5Q
 G1mrgOAfPX+sshjvk9BdQJgSsB2rAnmLcZHrzQ3al6XO01vIkm41MysZwnR347zQZ
X-Received: by 2002:adf:9148:: with SMTP id j66mr4505342wrj.124.1618504448943; 
 Thu, 15 Apr 2021 09:34:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7KSEZ6h11mgqXKUQcN7HUrjscZfTNVD6dvmc/kqNupzUF+B9S1FwFPwgm1RZiefT37+Qowg==
X-Received: by 2002:adf:9148:: with SMTP id j66mr4505308wrj.124.1618504448726; 
 Thu, 15 Apr 2021 09:34:08 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c1sm4236652wrx.89.2021.04.15.09.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 09:34:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/12] tests/qtest: Do not restrict bios-tables-test to
 Aarch64 hosts anymore
Date: Thu, 15 Apr 2021 18:33:03 +0200
Message-Id: <20210415163304.4120052-12-philmd@redhat.com>
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


