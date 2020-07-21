Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385B52287CC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 19:54:57 +0200 (CEST)
Received: from localhost ([::1]:34544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxwTg-0005fy-8i
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 13:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jxwSR-0004Un-9Y
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 13:53:39 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48755
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jxwSP-0002TP-LR
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 13:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595354016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kjXVC6u9l9tBoWb31yAXqBAn52413X/nF4N+djN625g=;
 b=Xz1kKg10r8tuYEaKfE+BgUQ5mx9CQzS45XTZlaFhuXffhlVTmgBd4Um0wZ9u7Roh/4Koia
 pyEI2Gj6oSt2WvbA1AhFXC2bgqC9DnEuFLUrAlzGuioNoa7HI886f3yfJi9gM4CuQNciDU
 ICvR27sjhItXysXgDPtqA6FpGUvcchc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-YAaFFFruP660qjkgMabwNg-1; Tue, 21 Jul 2020 13:53:35 -0400
X-MC-Unique: YAaFFFruP660qjkgMabwNg-1
Received: by mail-wm1-f69.google.com with SMTP id a5so211726wmj.5
 for <qemu-devel@nongnu.org>; Tue, 21 Jul 2020 10:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kjXVC6u9l9tBoWb31yAXqBAn52413X/nF4N+djN625g=;
 b=BfElJqAmqbshNMePXldGAgIC4a3EnEnJYP6qMkVKwuY1/Lr6fvOdbqDhvPTTxpKG5Q
 x/DfyQ+8Ft/NpNHMAzl3iaAZUacbDO8wdt6RRQTsh8U+uRasZyUL327ui21eQmhH3FiR
 8Wm4Tqzex9826VZOwF1SmhDR2GbqXmHp8qA6SZoiPuUjS3+/6ArGWldxmCv210P4PccR
 RViONv4us9+Zhq6yETKuNFsbhbi2TtJHoSY43pfVX83WCXByM9kQEgJTwDuAX5tp3dxO
 SlKiL2LlU+Et+JWzfQvt5124Ohkz8cCpZ8ao9e+roILacwd0ed0Ds4KUtshYzdcSKzoL
 XohA==
X-Gm-Message-State: AOAM530x3vIGrNpRqFNclUr5RpkFfyHRHYK6xrKgWzkkcDkSo1/MFbgq
 1poIujIKpu+glMwFSs0UYHzR/skWrKdNARoR0kh+Zu2zD+iMdczmtuHPArgth545yaOWTBpyugh
 xKeSBSEBbaR6Dnp4=
X-Received: by 2002:a1c:1d46:: with SMTP id d67mr5455564wmd.152.1595354013813; 
 Tue, 21 Jul 2020 10:53:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWb7MwB/N0rFOdyxb3WooFORCVfqMbN1O4cu21KbdEmtYnugMpHPOTTxit+dKjqjN1Wqkw8A==
X-Received: by 2002:a1c:1d46:: with SMTP id d67mr5455552wmd.152.1595354013625; 
 Tue, 21 Jul 2020 10:53:33 -0700 (PDT)
Received: from x1w.redhat.com (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id d13sm38334886wrn.61.2020.07.21.10.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 10:53:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] hw/nvram/fw_cfg: Simplify fw_cfg_add_from_generator()
 error propagation
Date: Tue, 21 Jul 2020 19:53:25 +0200
Message-Id: <20200721175326.8004-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200721175326.8004-1-philmd@redhat.com>
References: <20200721175326.8004-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 10:15:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document FWCfgDataGeneratorClass::get_data() return NULL
on error, and non-NULL on success. This allow us to simplify
fw_cfg_add_from_generator(). Since we don't need a local
variable to propagate the error, we can remove the ERRP_GUARD()
macro.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20200721131911.27380-2-philmd@redhat.com>
---
 include/hw/nvram/fw_cfg.h | 4 +++-
 hw/nvram/fw_cfg.c         | 3 +--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 11feae3177..bbcf405649 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -32,7 +32,9 @@ typedef struct FWCfgDataGeneratorClass {
      * @obj: the object implementing this interface
      * @errp: pointer to a NULL-initialized error object
      *
-     * Returns: reference to a byte array containing the data.
+     * Returns: reference to a byte array containing the data on success,
+     *          or NULL on error.
+     *
      * The caller should release the reference when no longer
      * required.
      */
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 3b1811d3bf..dfa1f2012a 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -1035,7 +1035,6 @@ void *fw_cfg_modify_file(FWCfgState *s, const char *filename,
 void fw_cfg_add_from_generator(FWCfgState *s, const char *filename,
                                const char *gen_id, Error **errp)
 {
-    ERRP_GUARD();
     FWCfgDataGeneratorClass *klass;
     GByteArray *array;
     Object *obj;
@@ -1053,7 +1052,7 @@ void fw_cfg_add_from_generator(FWCfgState *s, const char *filename,
     }
     klass = FW_CFG_DATA_GENERATOR_GET_CLASS(obj);
     array = klass->get_data(obj, errp);
-    if (*errp) {
+    if (!array) {
         return;
     }
     size = array->len;
-- 
2.21.3


