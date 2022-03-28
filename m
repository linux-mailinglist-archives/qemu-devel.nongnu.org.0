Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6464E99E4
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:39:33 +0200 (CEST)
Received: from localhost ([::1]:45894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqWq-0002FO-33
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:39:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nYqO9-0007Ch-Bf; Mon, 28 Mar 2022 10:30:33 -0400
Received: from [2a00:1450:4864:20::52c] (port=45749
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nYqO7-0000v9-5Q; Mon, 28 Mar 2022 10:30:32 -0400
Received: by mail-ed1-x52c.google.com with SMTP id u26so17119900eda.12;
 Mon, 28 Mar 2022 07:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o5Dpsahe7H94ZbQFbIRQjp0OIvKAgsywbBgdMmvXK6s=;
 b=n7+bnTPVWS7qxra9RwZ8LmNz+0c9Ukod/pmgZgDbKDs/b3oigf5HQ2zoDPV6YhpgQD
 bc7v7vKdR5XL0wf+s32Lb//zJSm323VsnOSKSNh+CKI5qavn38uAdC7Rs3P5JyxCCNdU
 QGfRhCOK8FBFPstF7apC7XNqj3Rofh77IONvYjnTOF2j0Lg5wHSwXdODs00N3NCvU2nO
 5hUK1JSEh/zkXZUQN/iYvicf0o0HJQMfdWg+9RWh/PQk9XUX3YzrKPShYRXGEBrx9z2/
 3MY4OMFAoW8nwbAjJqamEaxyB8HruUsynDOXXXJgPt/Jy2RuOc7ZsDrUXKrmkv2wAvOm
 L1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=o5Dpsahe7H94ZbQFbIRQjp0OIvKAgsywbBgdMmvXK6s=;
 b=ucZcWoXTtRXJAnvnvHVCyQ7QXsM0deheZtwrDLaK3I1UDmlMBlPoHuVxBEa6SRg0WS
 9JQB4Mb5wLdaLOR0cGFlXhqThWWMz6vsaH+dhx6NA0MyUyFSBLZVUSM3kreoRESOhasV
 kKTb2SZR0uYnXL6NIerSJBzDpbscbrlNOe+7OekZePYNB0KcLfkc5eS+tsTqo+KdBPX6
 N3SQr1i38fcfPrDt1zdO91Rx+mz1VgUb18FKxILx66TeWjehoQ0Fc88YIerdJyhOLdZU
 6HEcmVzGLX5stzei9a4LhrXZd8uXSTAHa06xvcYm/UZy+g2sqyHHsCnO/20E0PBw0dfV
 pqog==
X-Gm-Message-State: AOAM530exxlOfJ6jTi3UnBrcOxop8kJPbWDq7caQmfYqzX19rhd2/Q1C
 qPOix7H8+xE1Ee9dqSMPOfkm0P8inDQ=
X-Google-Smtp-Source: ABdhPJyy3uCWkoGTMSwueu2Y/JBSwatJZp6mNEIiAyuTGo/ku+PQbCF0CTlLv+aVpW8djc0m760jCA==
X-Received: by 2002:a05:6402:4388:b0:419:4457:27a6 with SMTP id
 o8-20020a056402438800b00419445727a6mr16378163edc.80.1648477829552; 
 Mon, 28 Mar 2022 07:30:29 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a1709062b5500b006e10152162asm1982310ejg.222.2022.03.28.07.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 07:30:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] virtio-ccw: do not include headers for all virtio devices
Date: Mon, 28 Mar 2022 16:30:19 +0200
Message-Id: <20220328143019.682245-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328143019.682245-1-pbonzini@redhat.com>
References: <20220328143019.682245-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, cohuck@redhat.com, farman@linux.ibm.com,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/s390x/ipl.c        |  3 +++
 hw/s390x/virtio-ccw.h | 16 ----------------
 2 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index e21776822a..ca56a1b29a 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -27,11 +27,14 @@
 #include "hw/s390x/css.h"
 #include "hw/s390x/ebcdic.h"
 #include "hw/s390x/pv.h"
+#include "hw/scsi/scsi.h"
+#include "hw/virtio/virtio-net.h"
 #include "ipl.h"
 #include "qemu/error-report.h"
 #include "qemu/config-file.h"
 #include "qemu/cutils.h"
 #include "qemu/option.h"
+#include "standard-headers/linux/virtio_ids.h"
 #include "exec/exec-all.h"
 
 #define KERN_IMAGE_START                0x010000UL
diff --git a/hw/s390x/virtio-ccw.h b/hw/s390x/virtio-ccw.h
index fc131194bf..fac186c8f6 100644
--- a/hw/s390x/virtio-ccw.h
+++ b/hw/s390x/virtio-ccw.h
@@ -13,24 +13,8 @@
 #ifndef HW_S390X_VIRTIO_CCW_H
 #define HW_S390X_VIRTIO_CCW_H
 
-#include "hw/virtio/virtio-blk.h"
-#include "hw/virtio/virtio-net.h"
-#include "hw/virtio/virtio-serial.h"
-#include "hw/virtio/virtio-scsi.h"
 #include "qom/object.h"
-#ifdef CONFIG_VHOST_SCSI
-#include "hw/virtio/vhost-scsi.h"
-#endif
-#include "hw/virtio/virtio-balloon.h"
-#include "hw/virtio/virtio-rng.h"
-#include "hw/virtio/virtio-crypto.h"
 #include "hw/virtio/virtio-bus.h"
-#ifdef CONFIG_VHOST_VSOCK
-#include "hw/virtio/vhost-vsock.h"
-#endif /* CONFIG_VHOST_VSOCK */
-#include "hw/virtio/virtio-gpu.h"
-#include "hw/virtio/virtio-input.h"
-
 #include "hw/s390x/s390_flic.h"
 #include "hw/s390x/css.h"
 #include "ccw-device.h"
-- 
2.35.1


