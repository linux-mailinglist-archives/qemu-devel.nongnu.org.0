Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92C76A187A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 10:07:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVU1i-0000O7-Bp; Fri, 24 Feb 2023 04:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVU1f-0000Ne-AT
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:05:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVU1d-0008Tx-O8
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:05:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677229556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=OwQ0ZZTCPrHLJnjUsYvb2HZMJ+eJ4DShIjMu+T1PKCk=;
 b=FmX8mFBX4ORqXf/oI1QDFcthqH75WpLrGsI4U5KDZo83rFJ8qIiB+yI3A00VgrIQezOwVp
 UTfLKp00mMjbi9/4lYgncqzqHYGi6pXMOO8P5rbrC9vijpO3M9MydH8xWMWhXTDB74EXUn
 dfFVA96weD0MZ7oMNye6+timg9qioD0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-cw9GLF8ANsG2oe2Sfmr90w-1; Fri, 24 Feb 2023 04:05:49 -0500
X-MC-Unique: cw9GLF8ANsG2oe2Sfmr90w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 476BA95D603;
 Fri, 24 Feb 2023 09:05:49 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C4E22166B29;
 Fri, 24 Feb 2023 09:05:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: libvir-list@redhat.com, Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v2] Deprecate the "-no-acpi" command line switch
Date: Fri, 24 Feb 2023 10:05:43 +0100
Message-Id: <20230224090543.1129677-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

Similar to "-no-hpet", the "-no-acpi" switch is a legacy command
line option that should be replaced with the "acpi" machine parameter
nowadays.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Fixed stypid copy-n-paste bug (Thanks to Sunil for spotting it!)

 docs/about/deprecated.rst | 6 ++++++
 softmmu/vl.c              | 1 +
 2 files changed, 7 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index ee95bcb1a6..15084f7bea 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -99,6 +99,12 @@ form is preferred.
 The HPET setting has been turned into a machine property.
 Use ``-machine hpet=off`` instead.
 
+``-no-acpi`` (since 8.0)
+''''''''''''''''''''''''
+
+The ``-no-acpi`` setting has been turned into a machine property.
+Use ``-machine acpi=off`` instead.
+
 ``-accel hax`` (since 8.0)
 ''''''''''''''''''''''''''
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 459588aa7d..a3c59b5462 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3271,6 +3271,7 @@ void qemu_init(int argc, char **argv)
                 vnc_parse(optarg);
                 break;
             case QEMU_OPTION_no_acpi:
+                warn_report("-no-acpi is deprecated, use '-machine acpi=off' instead");
                 qdict_put_str(machine_opts_dict, "acpi", "off");
                 break;
             case QEMU_OPTION_no_hpet:
-- 
2.31.1


