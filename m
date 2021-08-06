Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F5D3E30D9
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 23:17:51 +0200 (CEST)
Received: from localhost ([::1]:47746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC7Dy-00045i-6V
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 17:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC79c-0002xS-3b
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:13:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC79X-0004yw-1Q
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:13:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628284394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ShWhziwqy6m2lixRRC7HrR5SUETay7qoL7bh7V6qEVk=;
 b=LqvIXObNhQEz2kdq+7o/TeIkP8FcMaU6mjolXz6bMVQiHIAdxwuvUJFa1lck13rG/hjcb/
 eiMIWd02L7J5oL0SGrAcuWh2dPvx/INl72uxfHNpf2blxlTulM8gUSYWeaXjnDrFS5YJbD
 YiM2gOspJSSlMChUzsX0AQlTWyrTI6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-z_QqRTJsOc2PKZHhvG913g-1; Fri, 06 Aug 2021 17:13:13 -0400
X-MC-Unique: z_QqRTJsOc2PKZHhvG913g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC9C4801AE7;
 Fri,  6 Aug 2021 21:13:11 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D26915D9D5;
 Fri,  6 Aug 2021 21:13:02 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 11/12] [automated] Use OBJECT_DECLARE_TYPE when
 possible
Date: Fri,  6 Aug 2021 17:11:26 -0400
Message-Id: <20210806211127.646908-12-ehabkost@redhat.com>
In-Reply-To: <20210806211127.646908-1-ehabkost@redhat.com>
References: <20210806211127.646908-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace typedefs + DECLARE_OBJ_CHECKERS with equivalent
OBJECT_DECLARE_TYPE macro.

Generated using:

$ ./scripts/codeconverter/converter.py -i \
  --pattern=AddObjectDeclareType $(git grep -l '' -- '*.[ch]')

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: John Snow <jsnow@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
---
 hw/usb/u2f.h                | 6 +-----
 include/crypto/tlscreds.h   | 5 +----
 include/hw/ppc/spapr_drc.h  | 5 +----
 include/hw/ppc/spapr_xive.h | 5 +----
 include/qemu/accel.h        | 4 +---
 hw/block/fdc-sysbus.c       | 5 +----
 6 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/hw/usb/u2f.h b/hw/usb/u2f.h
index 5767ca8fac9..e6e3ead40f1 100644
--- a/hw/usb/u2f.h
+++ b/hw/usb/u2f.h
@@ -32,13 +32,10 @@
 #define U2FHID_PACKET_SIZE 64
 #define U2FHID_PENDING_IN_NUM 32
 
-typedef struct U2FKeyState U2FKeyState;
 typedef struct U2FKeyInfo U2FKeyInfo;
 
 #define TYPE_U2F_KEY "u2f-key"
-typedef struct U2FKeyClass U2FKeyClass;
-DECLARE_OBJ_CHECKERS(U2FKeyState, U2FKeyClass,
-                     U2F_KEY, TYPE_U2F_KEY)
+OBJECT_DECLARE_TYPE(U2FKeyState, U2FKeyClass, U2F_KEY)
 
 /*
  * Callbacks to be used by the U2F key base device (i.e. hw/u2f.c)
@@ -69,7 +66,6 @@ struct U2FKeyState {
     uint8_t pending_in_end;
     uint8_t pending_in_num;
 };
-typedef struct U2FKeyState U2FKeyState;
 
 /*
  * API to be used by the U2F key device variants (i.e. hw/u2f-*.c)
diff --git a/include/crypto/tlscreds.h b/include/crypto/tlscreds.h
index 2a8a8570109..617979a3986 100644
--- a/include/crypto/tlscreds.h
+++ b/include/crypto/tlscreds.h
@@ -25,10 +25,7 @@
 #include "qom/object.h"
 
 #define TYPE_QCRYPTO_TLS_CREDS "tls-creds"
-typedef struct QCryptoTLSCreds QCryptoTLSCreds;
-typedef struct QCryptoTLSCredsClass QCryptoTLSCredsClass;
-DECLARE_OBJ_CHECKERS(QCryptoTLSCreds, QCryptoTLSCredsClass, QCRYPTO_TLS_CREDS,
-                     TYPE_QCRYPTO_TLS_CREDS)
+OBJECT_DECLARE_TYPE(QCryptoTLSCreds, QCryptoTLSCredsClass, QCRYPTO_TLS_CREDS)
 
 
 #define QCRYPTO_TLS_CREDS_DH_PARAMS "dh-params.pem"
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 540439812f0..ff876fd74ca 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -20,10 +20,7 @@
 #include "qapi/error.h"
 
 #define TYPE_SPAPR_DR_CONNECTOR "spapr-dr-connector"
-typedef struct SpaprDrc SpaprDrc;
-typedef struct SpaprDrcClass SpaprDrcClass;
-DECLARE_OBJ_CHECKERS(SpaprDrc, SpaprDrcClass,
-                     SPAPR_DR_CONNECTOR, TYPE_SPAPR_DR_CONNECTOR)
+OBJECT_DECLARE_TYPE(SpaprDrc, SpaprDrcClass, SPAPR_DR_CONNECTOR)
 
 #define TYPE_SPAPR_DRC_PHYSICAL "spapr-drc-physical"
 typedef struct SpaprDrcPhysical SpaprDrcPhysical;
diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
index 333095c3fd9..9e7c46c801f 100644
--- a/include/hw/ppc/spapr_xive.h
+++ b/include/hw/ppc/spapr_xive.h
@@ -15,10 +15,7 @@
 #include "qom/object.h"
 
 #define TYPE_SPAPR_XIVE "spapr-xive"
-typedef struct SpaprXive SpaprXive;
-typedef struct SpaprXiveClass SpaprXiveClass;
-DECLARE_OBJ_CHECKERS(SpaprXive, SpaprXiveClass,
-                     SPAPR_XIVE, TYPE_SPAPR_XIVE)
+OBJECT_DECLARE_TYPE(SpaprXive, SpaprXiveClass, SPAPR_XIVE)
 
 struct SpaprXive {
     XiveRouter    parent;
diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index 8dc4ccc39ef..1b7696f9fbc 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -54,15 +54,13 @@ struct AccelClass {
      */
     GPtrArray *compat_props;
 };
-typedef struct AccelClass AccelClass;
 
 #define TYPE_ACCEL_BASE "accel"
 
 #define ACCEL_CLASS_SUFFIX  "-" TYPE_ACCEL_BASE
 #define ACCEL_CLASS_NAME(a) (a ACCEL_CLASS_SUFFIX)
 
-DECLARE_OBJ_CHECKERS(AccelState, AccelClass,
-                     ACCEL_BASE, TYPE_ACCEL_BASE)
+OBJECT_DECLARE_TYPE(AccelState, AccelClass, ACCEL_BASE)
 
 AccelClass *accel_find(const char *opt_name);
 AccelState *current_accel(void);
diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
index 57fc8773f12..ecce27db34e 100644
--- a/hw/block/fdc-sysbus.c
+++ b/hw/block/fdc-sysbus.c
@@ -33,10 +33,7 @@
 #include "trace.h"
 
 #define TYPE_SYSBUS_FDC "base-sysbus-fdc"
-typedef struct FDCtrlSysBusClass FDCtrlSysBusClass;
-typedef struct FDCtrlSysBus FDCtrlSysBus;
-DECLARE_OBJ_CHECKERS(FDCtrlSysBus, FDCtrlSysBusClass,
-                     SYSBUS_FDC, TYPE_SYSBUS_FDC)
+OBJECT_DECLARE_TYPE(FDCtrlSysBus, FDCtrlSysBusClass, SYSBUS_FDC)
 
 struct FDCtrlSysBusClass {
     /*< private >*/
-- 
2.31.1


