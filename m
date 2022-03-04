Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108224CD647
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:24:23 +0100 (CET)
Received: from localhost ([::1]:52148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8qz-0002yM-Se
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:24:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Af-0002zt-8x
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:40:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Ad-00010k-MD
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:40:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ezHczUZNer51n68XHQRo+8Gd2wahCXeNyLSEi3/WKiI=;
 b=UFDcVyC3obnGHT3PHncGMJHp0t5hrTOkmPk3FUf2eP0/DCX6XUAs0zYA3oF/KZxZjqxh6J
 gobAQlwiM9BhKxjpN4lROJl6829YeKBOba3bYxUrZ2uMR/RyC62pHS5f/6tetSCK1Oz1Dz
 xcQ1EznZ1Dc3OPHHVwUq3GuKP3JXW2c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-U-A4syVlNI23jO0JyaRjTQ-1; Fri, 04 Mar 2022 08:40:34 -0500
X-MC-Unique: U-A4syVlNI23jO0JyaRjTQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 x15-20020a5d6b4f000000b001ee6c0aa287so3382861wrw.9
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:40:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ezHczUZNer51n68XHQRo+8Gd2wahCXeNyLSEi3/WKiI=;
 b=f12ILmDkxZl4W7VOj6w1clhZromLfs5U8Nt5eXKcOL1q3sbMBneSqkFpRB3DMA8i/G
 yyD3qAtOFh5OTQTn07mSQ4gcSSKBVS/mH37+OasrauDd0WZzp+r6135idKTBtjGAfef+
 cozF0v8IEAi+KxZPRtzHaQJbBMnXGUUiU++RwofeQxYCQGMRRZNQcFNqV9JqfDO7SWSB
 QkcDK1Vjaht5rtSLf4Vg42lMepyv+6y/DXY3KYUqD0yeXez689GXQm0ckZRsGlvXPzYp
 xEALwEv2mHr6BVZBLdAjgVCmC11yKulmhVqTyFRpWu7jQ9/o/8EZ3xqh5uTgHAWkTX5q
 A4qw==
X-Gm-Message-State: AOAM532W7NuswlITQDs+UNezWj5VXMQfMFi13/Vzp9SguFobsREjt0VF
 5J79HdyErNaqNiQYhDBfpgBchjM9uWqtLx99s+et2H8XfOcdzsoVDCHcDgh2dBh0nb4WPD68A0W
 ETHcyn1UOt7WK1Jn/ab+trjI4QrcUiSFNCWETBQAzC3i0M1Nsms0Y7MIj/eS+
X-Received: by 2002:a05:6000:1c15:b0:1f0:216:1c64 with SMTP id
 ba21-20020a0560001c1500b001f002161c64mr13327692wrb.366.1646401232534; 
 Fri, 04 Mar 2022 05:40:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjeRfVv5vOPzuKRgxfRbOYtwQeWF5F+R0PTcXGwzFOELMNOHnpzJcXRuPaKtcVm29wobGO6w==
X-Received: by 2002:a05:6000:1c15:b0:1f0:216:1c64 with SMTP id
 ba21-20020a0560001c1500b001f002161c64mr13327668wrb.366.1646401232286; 
 Fri, 04 Mar 2022 05:40:32 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0037bdfa1665asm15841152wmj.18.2022.03.04.05.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:40:29 -0800 (PST)
Date: Fri, 4 Mar 2022 08:40:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/45] hw/i386/pc_piix: Mark the machine types from version
 1.4 to 1.7 as deprecated
Message-ID: <20220304133556.233983-26-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The list of machine types grows larger and larger each release ... and
it is unlikely that many people still use the very old ones for live
migration. QEMU v1.7 has been released more than 8 years ago, so most
people should have updated their machines to a newer version in those
8 years at least once. Thus let's mark the very old 1.x machine types
as deprecated now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220117191639.278497-1-thuth@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc_piix.c         | 1 +
 docs/about/deprecated.rst | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 8d33cf689d..b72c03d0a6 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -757,6 +757,7 @@ static void pc_i440fx_1_7_machine_options(MachineClass *m)
     m->hw_version = "1.7.0";
     m->default_machine_opts = NULL;
     m->option_rom_has_mr = true;
+    m->deprecation_reason = "old and unattended - use a newer version instead";
     compat_props_add(m->compat_props, pc_compat_1_7, pc_compat_1_7_len);
     pcmc->smbios_defaults = false;
     pcmc->gigabyte_align = false;
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 85773db631..cf02ef6821 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -324,6 +324,14 @@ machine is hardly emulated at all (e.g. neither the LCD nor the USB part had
 been implemented), so there is not much value added by this board. Use the
 ``ref405ep`` machine instead.
 
+``pc-i440fx-1.4`` up to ``pc-i440fx-1.7`` (since 7.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+These old machine types are quite neglected nowadays and thus might have
+various pitfalls with regards to live migration. Use a newer machine type
+instead.
+
+
 Backend options
 ---------------
 
-- 
MST


