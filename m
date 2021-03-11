Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB6B338125
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 00:14:46 +0100 (CET)
Received: from localhost ([::1]:45910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKUVx-0003uH-J6
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 18:14:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUU6-0001ph-1U
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:12:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUTz-0005AD-EB
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615504362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r8j0KxZ86bkS8FC5cXOopVHnXZnokYuiGFfUmvAy3qc=;
 b=PcAlyXmzyPkiClVSiixpdDG+jmVV6W1CW6YvYXgb3z6TgIHCKZzbQjKRAyHils6bCYvRIG
 R2Aj+PT5UD43qSSgdJnVipJajXdlaoweZDuBGhh0BlY4D15T/5FmK1a7ffPR4tVyBq3y1d
 0JryJIN74RUYYTaTArMF4/k2m/xXwqU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-t4TdAfXAMMaMdq4RKk2oHw-1; Thu, 11 Mar 2021 18:12:38 -0500
X-MC-Unique: t4TdAfXAMMaMdq4RKk2oHw-1
Received: by mail-wr1-f70.google.com with SMTP id g2so10236060wrx.20
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 15:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8j0KxZ86bkS8FC5cXOopVHnXZnokYuiGFfUmvAy3qc=;
 b=L6Y96mPjCzP2ndkPOJPxDV7vl6pwkIBlotgceWFZBp+rDAZyMK+VR45HpEvWJX/Mrt
 /jrOKbejqL/UjzChUob6Xk6ZdaIADkZAkP+d9B9TAQCp9ej3IJwUILyvtzdXBP98JcLV
 EafMAQtv/w86EswGz2/10Zer9z7n5OHK1rTojJ+1WKF2COdAu3qjDSkqUi14YIj8z6zF
 Dk1gHgJdc/+E41IbAYR0Iw6c1nGFyC/AZ66EV+9vTEh8OmNEG+0nlesWFSKQC93hXMVA
 vDTYd0z+NgGOsjNLTjq333t4seDzLuNahTfJGbS8mKFJU1nuBUVZSBTFswzedKXvr7cA
 aKqw==
X-Gm-Message-State: AOAM531ZJHyNP8KvJi9+zpHpSpb+gfSVLoeTILutwAwrMS0C3YqnL5k/
 1Ok6tJTgVD0CiIEeHcjWxSIdQqRr5V1yZtHAOofri4+GtLAn/kTy4Gi2ry/Y7fCg2yFqk0IXnp3
 306d3voiqGehL+nhPp6K0R1PeWAt3qPASlYE6T6t9hDRu/im4PKCdz3YARqWFPi1M
X-Received: by 2002:a7b:c084:: with SMTP id r4mr10314910wmh.166.1615504357143; 
 Thu, 11 Mar 2021 15:12:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEvNU0cHRZNnfw0bnFjP0LSx3yZhNs4ohRSO5mg95G0xDrXPpy25VZBQxKHw9KoYheJMrzbw==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr10314884wmh.166.1615504356954; 
 Thu, 11 Mar 2021 15:12:36 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b186sm252054wmc.44.2021.03.11.15.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 15:12:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Claudio Fontana <cfontana@suse.de>
Subject: [PATCH 6/6] tests/qtest: Do not restrict bios-tables-test to Aarch64
 hosts anymore
Date: Fri, 12 Mar 2021 00:12:02 +0100
Message-Id: <20210311231202.1536040-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311231202.1536040-1-philmd@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
32-bit Arm hosts") we can remove the comment / check added in
commit ab6b6a77774 and directly run the bios-tables-test.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/meson.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 2688e1bfad7..405ae7a5602 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -170,14 +170,13 @@
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
2.26.2


