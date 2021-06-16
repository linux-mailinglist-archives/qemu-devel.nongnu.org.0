Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766083AA5B7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:55:48 +0200 (CEST)
Received: from localhost ([::1]:33370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcZf-0007un-C5
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcPc-0003gF-E6
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:45:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcPY-0001Qw-0w
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cY8oP9xa0KaEyRIW/MhQjUz22bVRjld90OclKILOu7M=;
 b=g57ZijlV1YZE53JVPV1g2zJnnhvd3fqxilXACcslL1pbuSey2yQ3pnCVPqn0IBvREmV4pl
 Y7rCppNQ0dLf6/+UA2b6UG9tzrOJXe4qekV2UpkSZ13M1Yvi0ellRMaYVLNl8ogSmcjYC8
 C+ypKwTJV1Zs9RdwgqX5rNFp+RyMbpE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-ga6YDfgEOUmFJRYeGxFpFw-1; Wed, 16 Jun 2021 16:45:16 -0400
X-MC-Unique: ga6YDfgEOUmFJRYeGxFpFw-1
Received: by mail-wr1-f72.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso1857489wrh.12
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cY8oP9xa0KaEyRIW/MhQjUz22bVRjld90OclKILOu7M=;
 b=D5KupSj+UWSyYadNS2TxLjw7ggPIY+SWW0hzRf0bPuxxAYkTyLNUXdcsxRWYWYHWUJ
 9jsA6m9y9nS+BUauraB4EgHcpYBt6QK2X7YtwnhJgN+SlT2BiBeupr7//yWic8VxKi43
 m2t7qwtxasX3x6lAo145jEl5VRoUan1jK2sLAnAb4Lj79BMfzxLUHkwv5M2BWhOXbkX9
 K29lRfWkZMK5nQgtxv6b0Zgmzh+Snafh/CRw/l5yWSqIAlbC3Vbt2X6tWNtLiGiq06nB
 Iv9BLtTG64WeS6TRFYBzmRRA7AeDcx4lYsbJYrVHNT4nkh/GEGCT5FSCD4rpMcP/pprz
 xp9w==
X-Gm-Message-State: AOAM531mI16ASKtrH0ZgvbhhSb0D5a8r/ittTwl57ss0N8Pzh2rq5M+H
 9fiXBNSmvfVA/0mMfPRMfKqC5JZQX3R/TfhDVIyW7AiR+85l7bYdFMjBl+AQfN6sPfWqCwmBFLR
 +h67frG/F3CvwfcyDFwkG0hHSZqnb/PR/W4Ki/JE599n8EPkfsiC05fM/p3e3uza6
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr1152664wrr.188.1623876314729; 
 Wed, 16 Jun 2021 13:45:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJL7+57hA3Ci6zTGOC9hdKtg+H8NP/5W6EQysPZtoO37Flp2m7fbS7SkJRIDhaoHQNBGO5FQ==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr1152629wrr.188.1623876314522; 
 Wed, 16 Jun 2021 13:45:14 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o3sm3881680wrc.0.2021.06.16.13.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:45:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/23] hw/i386: Rename acpi-build.c -> acpi-pc.c
Date: Wed, 16 Jun 2021 22:43:23 +0200
Message-Id: <20210616204328.2611406-19-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616204328.2611406-1-philmd@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The acpi-build.c file contains routines common to the QEMU "PC"
machines (Q35+ICH & i440FX+PIIX), rename it as acpi-pc.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/{acpi-build.c => acpi-pc.c} | 0
 hw/i386/meson.build                 | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/i386/{acpi-build.c => acpi-pc.c} (100%)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-pc.c
similarity index 100%
rename from hw/i386/acpi-build.c
rename to hw/i386/acpi-pc.c
diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index e5d109f5c64..f95ed7d4efe 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -22,7 +22,7 @@
 i386_ss.add(when: 'CONFIG_PC', if_true: files(
   'pc.c',
   'pc_sysfw.c',
-  'acpi-build.c',
+  'acpi-pc.c',
   'port92.c'))
 
 subdir('kvm')
-- 
2.31.1


