Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F024B743F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:59:42 +0100 (CET)
Received: from localhost ([::1]:43322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK273-00062S-K8
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:59:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK24e-0004Iz-BX
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:57:12 -0500
Received: from [2a00:1450:4864:20::430] (port=40671
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK24b-0008Hi-Ra
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:57:11 -0500
Received: by mail-wr1-x430.google.com with SMTP id j26so22613745wrb.7
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 09:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0kDDsMjNNIrphQ/RGXhR/7sP5KLXcWkTpPnUps9e9Ao=;
 b=N/f/STO32QcmEZ03UET14Faz/S5+pKCC7ocBqYe19yAEvXTFYZurN6zUbWxT9M5PaK
 0mdslYfcfqfHU7IUm8zgtjI4YdR8EhGXHj88OxRAc9Ki0/2VK0pnqXAzNDEjT6CORnls
 o0zL2QM0ocDFoRUN+Dy52APHmHZbfWkCMu3hxEjB6tVY3f2+DZo5MaSteWBU+OUW4Xf1
 /KoVZtXWDDQ8oEiqj+lTrx0NC9lSf8Elbsw+wUX/N1vRf/vhm4s8TAOXVDPaoaC2Vqlk
 NbAHxLTHmS7MTlNye/J8imWh1fGrys3us1ZO7G70llFva+M/ZrcS5/70GKYyZIyU1k3k
 chQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0kDDsMjNNIrphQ/RGXhR/7sP5KLXcWkTpPnUps9e9Ao=;
 b=LYo5WqFdsHYBhKNlRfTgyFOqKFp23+LdOBSz+Vrys2/xpbjYlDDMY89bN4diy2HW05
 mFssIfq9iiX80m/q51hicDOfGINe4cnk1YwKTTPRd9wc4GqSI4Ruo0ZoPEHOQk5cdiXI
 /o8txRZjVVY26m+7ieLgYMSlmyeM4MPBc01IJ2gNB0XeCWIqGZoMxVUdZzIP+SINtmjs
 q/4pPSXMOo8MBVqMzut4aAd0q6IeI5vYb9dr+k/8m9qBGFwaXmw4P2XeiMM/zNetPP6E
 6I/TTa93bvgTkIDeBS3kGfbwPdapfibveC80yDgEfMRWLOzbk/G5cCrTKYBbfRBvLVoQ
 w6Jw==
X-Gm-Message-State: AOAM532LV0jVmuP3UWmF+yTOwkCJTEX9NCIZ8BsQPn+2eKI6eizsL7Mt
 RopGF/zyFVnjTXBzOId00lQPm9urzXv3hg==
X-Google-Smtp-Source: ABdhPJzz8mAhGd0euQb/pVRlvoM7SNtSOmu/07AKw4tIai3+nP84xonzCwaKJBafxa04eoQ6dp+dNA==
X-Received: by 2002:a5d:480b:: with SMTP id l11mr133691wrq.276.1644947828241; 
 Tue, 15 Feb 2022 09:57:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id o10sm23768409wrc.98.2022.02.15.09.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 09:57:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] migration: Remove load_state_old and minimum_version_id_old
Date: Tue, 15 Feb 2022 17:57:05 +0000
Message-Id: <20220215175705.3846411-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are no longer any VMStateDescription structs in the tree which
use the load_state_old support for custom handling of incoming
migration from very old QEMU.  Remove the mechanism entirely.

This includes removing one stray useless setting of
minimum_version_id_old in a VMStateDescription with no load_state_old
function, which crept in after the global weeding-out of them in
commit 17e313406126.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/migration.rst    | 10 ++--------
 include/migration/vmstate.h |  2 --
 hw/ssi/xlnx-versal-ospi.c   |  1 -
 migration/vmstate.c         |  6 ------
 4 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
index 24012534827..3e9656d8e0b 100644
--- a/docs/devel/migration.rst
+++ b/docs/devel/migration.rst
@@ -389,19 +389,13 @@ Each version is associated with a series of fields saved.  The ``save_state`` al
 the state as the newer version.  But ``load_state`` sometimes is able to
 load state from an older version.
 
-You can see that there are several version fields:
+You can see that there are two version fields:
 
 - ``version_id``: the maximum version_id supported by VMState for that device.
 - ``minimum_version_id``: the minimum version_id that VMState is able to understand
   for that device.
-- ``minimum_version_id_old``: For devices that were not able to port to vmstate, we can
-  assign a function that knows how to read this old state. This field is
-  ignored if there is no ``load_state_old`` handler.
 
-VMState is able to read versions from minimum_version_id to
-version_id.  And the function ``load_state_old()`` (if present) is able to
-load state from minimum_version_id_old to minimum_version_id.  This
-function is deprecated and will be removed when no more users are left.
+VMState is able to read versions from minimum_version_id to version_id.
 
 There are *_V* forms of many ``VMSTATE_`` macros to load fields for version dependent fields,
 e.g.
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 017c03675ca..ad24aa19345 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -181,9 +181,7 @@ struct VMStateDescription {
     int unmigratable;
     int version_id;
     int minimum_version_id;
-    int minimum_version_id_old;
     MigrationPriority priority;
-    LoadStateHandler *load_state_old;
     int (*pre_load)(void *opaque);
     int (*post_load)(void *opaque, int version_id);
     int (*pre_save)(void *opaque);
diff --git a/hw/ssi/xlnx-versal-ospi.c b/hw/ssi/xlnx-versal-ospi.c
index 7ecd148fdf3..c762e0b3679 100644
--- a/hw/ssi/xlnx-versal-ospi.c
+++ b/hw/ssi/xlnx-versal-ospi.c
@@ -1800,7 +1800,6 @@ static const VMStateDescription vmstate_xlnx_versal_ospi = {
     .name = TYPE_XILINX_VERSAL_OSPI,
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields = (VMStateField[]) {
         VMSTATE_FIFO8(rx_fifo, XlnxVersalOspi),
         VMSTATE_FIFO8(tx_fifo, XlnxVersalOspi),
diff --git a/migration/vmstate.c b/migration/vmstate.c
index 05f87cdddc5..36ae8b9e191 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -90,12 +90,6 @@ int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
         return -EINVAL;
     }
     if  (version_id < vmsd->minimum_version_id) {
-        if (vmsd->load_state_old &&
-            version_id >= vmsd->minimum_version_id_old) {
-            ret = vmsd->load_state_old(f, opaque, version_id);
-            trace_vmstate_load_state_end(vmsd->name, "old path", ret);
-            return ret;
-        }
         error_report("%s: incoming version_id %d is too old "
                      "for local minimum version_id  %d",
                      vmsd->name, version_id, vmsd->minimum_version_id);
-- 
2.25.1


