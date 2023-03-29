Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603776CD10C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 06:10:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phN7E-0006nf-4z; Wed, 29 Mar 2023 00:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1phN7A-0006n2-GS
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 00:08:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1phN78-00087t-T7
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 00:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680062925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=V0444OFTjF7LeMVlos2iImm2r6w2WXusG6Dn74Twr04=;
 b=H7P6SjpspwWqDYk03vbMCpS3qKSNbVJV5H1DVyWbKiQNGsGRiC5D8vFoS3BGP177pnJWUO
 6bkh7i5VNgq0UuBf6R45G4aOJhbVWAEQlg9O9pggZur9DV4Lth50VGdUQCpKFKH8n9wrVY
 iVmh7uI26y6yAYbpF42+fIPdtusLdFI=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-px3XRvFfOauVfObd_QUnQw-1; Wed, 29 Mar 2023 00:08:43 -0400
X-MC-Unique: px3XRvFfOauVfObd_QUnQw-1
Received: by mail-pf1-f199.google.com with SMTP id
 i192-20020a6287c9000000b0062a43acb7faso6577049pfe.8
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 21:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680062923;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V0444OFTjF7LeMVlos2iImm2r6w2WXusG6Dn74Twr04=;
 b=zXACB8NiFWtMLZwlAKPY8a2SLrC5nRszPx1Yxuw5jXcApzme8pa0RWtk2FP256Z6AD
 DesLhj9ihWTp0YBDPzwCLPeXRA+exH3C2uHOLN9E1tUpvxqBh/Alx5AEsicNuv0M9049
 NB42k71ys4bb3Xoukuo7hdsA0xwcut/LLu/xY0hYBuJdurp9NtjiT+VMtOuUwtgLDinx
 N5j8ONzyp8TB1/idsEQ1FhBpIFYcybRGYOI03tOXvi1IFESusgk75DackYHbpFzonhCC
 iP4D/T3DZeMj1TYFTrkvjkKhfgRQQq1intMayBYI2akQgJQQF8dmHLnsOR9iGztn0t+g
 rjLA==
X-Gm-Message-State: AAQBX9fpAAdJY8u2vzqWEuw0FNczPTiu1rE3cHpj2GVnwnv3oMEOh9AD
 Y/qqPwYjI9dUKnx96AbDzN/gDhYbcgTQfm1CCvxTV7zBcx1LEKr7T405/4VivmlpUb/+KVm/Kwc
 Kax6+IBiDL8yt9qA=
X-Received: by 2002:a17:902:f547:b0:1a1:7899:f009 with SMTP id
 h7-20020a170902f54700b001a17899f009mr1019673plf.17.1680062922895; 
 Tue, 28 Mar 2023 21:08:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350YYsamqCcDZj8bAKHdY5kBEvYESroa5KgKjl3TrFQ5T0TBXBBECRDB6nztrcI2IhC9Gc35l4A==
X-Received: by 2002:a17:902:f547:b0:1a1:7899:f009 with SMTP id
 h7-20020a170902f54700b001a17899f009mr1019660plf.17.1680062922570; 
 Tue, 28 Mar 2023 21:08:42 -0700 (PDT)
Received: from fc37-ani.redhat.com ([115.96.144.241])
 by smtp.googlemail.com with ESMTPSA id
 n20-20020a170902d0d400b0019c901b35ecsm21911507pln.106.2023.03.28.21.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 21:08:42 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: Ani Sinha <anisinha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: philmd@linaro.org,
	Ani Sinha <ani@anisinha.ca>,
	qemu-devel@nongnu.org
Subject: [PATCH v2] Add my old and new work email mapping and use work email
 to support acpi
Date: Wed, 29 Mar 2023 09:38:34 +0530
Message-Id: <20230329040834.11973-1-anisinha@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Ani Sinha <ani@anisinha.ca>

Updating mailmap to indicate ani@anisinha.ca and anisinha@redhat.com are one
and the same person. Also updating my email in MAINTAINERS for all my acpi work
(reviewing patches and biosbits) to my work email. Also doing the same for
bios bits test framework documentation.

Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 .mailmap                 | 1 +
 MAINTAINERS              | 4 ++--
 docs/devel/acpi-bits.rst | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/.mailmap b/.mailmap
index fad2aff5aa..460aac992f 100644
--- a/.mailmap
+++ b/.mailmap
@@ -54,6 +54,7 @@ Aleksandar Markovic <aleksandar.qemu.devel@gmail.com> <amarkovic@wavecomp.com>
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <arikalo@wavecomp.com>
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <aleksandar.rikalo@rt-rk.com>
 Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
+Ani Sinha <anisinha@redhat.com> <ani@anisinha.ca>
 Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
 Christian Borntraeger <borntraeger@linux.ibm.com> <borntraeger@de.ibm.com>
 Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 011fd85a09..70c2fad24e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1874,7 +1874,7 @@ F: hw/pci/pcie_doe.c
 ACPI/SMBIOS
 M: Michael S. Tsirkin <mst@redhat.com>
 M: Igor Mammedov <imammedo@redhat.com>
-R: Ani Sinha <ani@anisinha.ca>
+R: Ani Sinha <anisinha@redhat.com>
 S: Supported
 F: include/hw/acpi/*
 F: include/hw/firmware/smbios.h
@@ -1899,7 +1899,7 @@ F: hw/acpi/viot.c
 F: hw/acpi/viot.h
 
 ACPI/AVOCADO/BIOSBITS
-M: Ani Sinha <ani@anisinha.ca>
+M: Ani Sinha <anisinha@redhat.com>
 M: Michael S. Tsirkin <mst@redhat.com>
 S: Supported
 F: tests/avocado/acpi-bits/*
diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
index 9eb4b9e666..22e2580200 100644
--- a/docs/devel/acpi-bits.rst
+++ b/docs/devel/acpi-bits.rst
@@ -135,7 +135,7 @@ Under ``tests/avocado/`` as the root we have:
    (c) They need not be loaded by avocado framework when running tests.
 
 
-Author: Ani Sinha <ani@anisinha.ca>
+Author: Ani Sinha <anisinha@redhat.com>
 
 References:
 -----------
-- 
2.39.2


