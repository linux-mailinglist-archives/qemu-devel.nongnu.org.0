Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDDA61F7A5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 16:29:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os42l-0008S5-Vz; Mon, 07 Nov 2022 10:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1os42k-0008Rx-Lp
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 10:28:10 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1os42i-00015T-Og
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 10:28:10 -0500
Received: by mail-pf1-x42e.google.com with SMTP id b29so10915680pfp.13
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 07:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EcVD+xMv4x0qVIyd5cI1F1HrEG/FmKUnXsdIZE5hFnw=;
 b=4vlSR/jFB153toSIidR7hax986EuwP7brdHjq/fnrS9LVojXUg9ndZi5qusBgW/8DL
 WsDD4w38G2G+wh5CDOuWXpA/CsMLv8JZK9l/IUNeNzkPVOe/JZBT57gaYmPbVgLxrqk5
 oz+i6sLsqIr286PazlgNNRuvFu8K4hKDGVxVQD+gvupDqfbDUq/fNU8NjVWf4LB8Nsfg
 vd23fuvcVIypolglRBx+8StKTeezpzEwAc4IaiUeUx9Qp07SC75nqLzasBUqOA2nt6vq
 LUlyhAR/3K5KP6sN8ORSPFI1/cduon+RDQy1Bu6sfssRmhIec8DzUb9PWEobBxTa/3PJ
 fBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EcVD+xMv4x0qVIyd5cI1F1HrEG/FmKUnXsdIZE5hFnw=;
 b=4AeGep5+YcctraYau0Y5OqUcDr8YSG1XwoBwy3biGwqUb0kZto2PKoC2/XGLm7INRI
 I6tZTrlGRQug/5lMPwSpuPC3HcSCY2t8zlT37Hv9FvLAwrzzr2Dvxrajri9nx3WbqpOv
 uW9qolyjvugz67dwdUd0wIY7tECQJRqJcQtrjVVYKnxGlot+8CY+sUro441GE0fP3HXO
 /ri4YvF3ZvyQ08i2e3jaPajxIZNobrcivKW2I1BgxxFrEwJJNp9Xbk6Alf3BDTEIOXKK
 6vojfie0Io3kwIPTuCGB7NbatDG57bhrAAxUDrFacfqqAxBeFRig+mnMThosW5O4TViT
 FnEw==
X-Gm-Message-State: ACrzQf3d1LpCREn+v144CeZJ03UAjC3hvJdD3KNveF2DokHjNXcMycuZ
 jUiph5gMn0q8bzNQSuymn2mydQ==
X-Google-Smtp-Source: AMsMyM4NRXHgaLmX2C9aFovCjWG8KrX0tzs6RFQEJaxlU+JEcWoZxxQguMf9X9CHbl1Uo+utnHkRZQ==
X-Received: by 2002:a63:1508:0:b0:438:eb90:52d1 with SMTP id
 v8-20020a631508000000b00438eb9052d1mr44196679pgl.252.1667834887010; 
 Mon, 07 Nov 2022 07:28:07 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([116.73.133.26])
 by smtp.googlemail.com with ESMTPSA id
 m2-20020a170902768200b0017f72a430adsm5107472pll.71.2022.11.07.07.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 07:28:06 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Cc: Bernhard Beschow <shentey@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2] hw/acpi: fix breakage due to missing aml stub definitions
 when acpi is off
Date: Mon,  7 Nov 2022 20:57:44 +0530
Message-Id: <20221107152744.868434-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42e;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Some HW architectures do not support acpi and CONFIG_ACPI is off for them. For
those architectures, dummy stub function definitions help to resolve symbols.
This change adds couple of dummy stub definitions so that symbols for those can
be resolved and failures such as the following can be fixed for or1k targets.

Configuration:
qemu/build $ ../configure --enable-werror --disable-docs --disable-nettle \
             --enable-gcrypt --enable-fdt=system --enable-modules \
             --enable-trace-backends=dtrace --enable-docs \
	     --enable-vfio-user-server \
             --target-list="ppc64-softmmu or1k-softmmu s390x-softmmu x86_64-softmmu
 rx-softmmu sh4-softmmu nios2-softmmu"

actual failure:

qemu/build $ QTEST_QEMU_BINARY=./qemu-system-or1k  ./tests/qtest/qos-test

failed to open module:
/build/qemu/qemu/build/qemu-bundle/usr/local/lib64/qemu/hw-display-virtio-vga.so:
undefined symbol: aml_return
qemu-system-or1k: ../util/error.c:59: error_setv: Assertion `*errp ==
NULL' failed.
Broken pipe
../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from
signal 6 (Aborted) (core dumped)
Aborted (core dumped)

CC: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/aml-build-stub.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

changelog:
v2: cosmetic commit description format update.

diff --git a/hw/acpi/aml-build-stub.c b/hw/acpi/aml-build-stub.c
index 8d8ad1a314..89a8fec4af 100644
--- a/hw/acpi/aml-build-stub.c
+++ b/hw/acpi/aml-build-stub.c
@@ -26,6 +26,16 @@ void aml_append(Aml *parent_ctx, Aml *child)
 {
 }
 
+Aml *aml_return(Aml *val)
+{
+    return NULL;
+}
+
+Aml *aml_method(const char *name, int arg_count, AmlSerializeFlag sflag)
+{
+    return NULL;
+}
+
 Aml *aml_resource_template(void)
 {
     return NULL;
-- 
2.34.1


