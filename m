Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 341B51F1DC8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 18:51:29 +0200 (CEST)
Received: from localhost ([::1]:45856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiKzg-0002wi-6J
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 12:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKno-0003LU-Pl
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:39:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56477
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKnn-000609-Tl
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591634351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U7umtn+RbefzaAX48VPE817S55cu5UXGexzQNlQsDAA=;
 b=fd6MfdcIFdSBmHfpD+nWkzVbsY9iWi3yx5vAC2zvB9BmJPGIy09UOCBhJYxwcEiyPC6Rdd
 EdezhPV89yXzmqNT06dMe0xHdbXdzJ9PMKrfvqC+4pu7wEGS/30pBIfGdLdiDFUVFP5bmd
 ftIp/CDUe4wAsDnC6ORT5VEctBUEKWU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-QSpQ36WNPKaLlHd_kf5nlA-1; Mon, 08 Jun 2020 12:39:09 -0400
X-MC-Unique: QSpQ36WNPKaLlHd_kf5nlA-1
Received: by mail-wm1-f72.google.com with SMTP id a7so32890wmf.1
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 09:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U7umtn+RbefzaAX48VPE817S55cu5UXGexzQNlQsDAA=;
 b=Jg01R83YiMse5EsU61gZ8yHBJLhrYn4ln9H9BYysVTnJrXHAj9QAqWRwYTKjhNfGDg
 KWDPn6Szm4bIyjBsCSrfszVxLviDgFTQCKQuUmr17GvOhJnG+UOu+2FOh8hmMiP37agu
 /ljehjt1Csb+pF8yxFhjRsc3fWom95CqTbt9NLDOJHrBDfYZPhTB7oNz++n/fO85nkT8
 ua099+jG8+pIi07+y4W5okALyDKyguBTo8C8M1MTNUs/ilMay4QMFemTj1xqChNwZb0l
 fAzv31jX0pnxY2bjNG6UohxPXZB1/tlDwbv1ngRwpk3LQ46Y4nnUjwqB0hiCj1P0VYfW
 7c2A==
X-Gm-Message-State: AOAM5314WZkCahuCW8j6ziuHgnS/9OgMnujwDY0S7Xm7AbnbTe0a9kv4
 CnCuNwXdDMqirYy5MisYXv1Ij1akfDgM7BGldloBwrgwk+Ag/SkBqMEbZr0AwpbGPxCpCTCHzzM
 4HiVRGMaFMph40k0=
X-Received: by 2002:a7b:c842:: with SMTP id c2mr227958wml.58.1591634348191;
 Mon, 08 Jun 2020 09:39:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCqdri5yisYgcTOnLzBX2NGFxvJ0pkiakvpdWbnh6vaulMfse1cE55oWX0ml20R/SM6h5jLQ==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr227943wml.58.1591634348028;
 Mon, 08 Jun 2020 09:39:08 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id o8sm109544wmb.20.2020.06.08.09.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:39:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 09/10] Makefile: Allow target-specific optional Kconfig
Date: Mon,  8 Jun 2020 18:38:22 +0200
Message-Id: <20200608163823.8890-10-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608163823.8890-1-philmd@redhat.com>
References: <20200608163823.8890-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow use of target-specific Kconfig file.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index aef466b0b9..6bc4fed7bd 100644
--- a/Makefile
+++ b/Makefile
@@ -423,11 +423,13 @@ MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host \
                    $(SRC_PATH)/accel/Kconfig \
                    $(SRC_PATH)/hw/Kconfig
 MINIKCONF_DEPS = $(MINIKCONF_INPUTS) \
-                 $(wildcard $(SRC_PATH)/hw/*/Kconfig)
+                 $(wildcard $(SRC_PATH)/hw/*/Kconfig) \
+                 $(wildcard $(SRC_PATH)/target/*/Kconfig)
 MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
 
 $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MINIKCONF_DEPS) $(BUILD_DIR)/config-host.mak
 	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) \
+		$(wildcard $(SRC_PATH)/target/$(call base-arch, $@)/Kconfig) \
 		> $@.tmp, "GEN", "$@.tmp")
 	$(call quiet-command, if test -f $@; then \
 	  if cmp -s $@.old $@; then \
-- 
2.21.3


