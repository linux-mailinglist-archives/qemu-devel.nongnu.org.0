Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402104CC20E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:59:21 +0100 (CET)
Received: from localhost ([::1]:58466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnrM-0003z4-BL
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:59:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nPnUO-0002wz-FO; Thu, 03 Mar 2022 10:35:36 -0500
Received: from [2607:f8b0:4864:20::c34] (port=47062
 helo=mail-oo1-xc34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nPnUM-0000n7-Kn; Thu, 03 Mar 2022 10:35:36 -0500
Received: by mail-oo1-xc34.google.com with SMTP id
 w3-20020a4ac183000000b0031d806bbd7eso6140787oop.13; 
 Thu, 03 Mar 2022 07:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UaPYglVILsMGfP9WiFWE8VZ7U3VNT2RToNAvw6WgWww=;
 b=SWy45eIcTlY28mwIDR64dG9GcSWCs1wAKKo/M0t6m8cwRMGyj6Is99uM4G1oSd7X1l
 Ip6DRYRFrweJuE04C6HkeWY0NwBlNTMWYKQ34qSz6k48h6sKLtNADraLi2iAtx755dzp
 rdfpNjCmk0mIbn3idQ48GMTdrnk1gRJhSGCinWX5agroK/qX6lFZCnrMLvHDcmaOhC0r
 E1u8Umn+dzzMHAfqR0WgOiZMjvMYd0wozOqVpwk7DulAxWX+IVjS1g3Ug1wiAhyP/Jxe
 5U7Q2g+SBYfY3DAwrcyM0MvRsHWrb41P7g4KPXg4VlLWJxaCsDpRu22A9im2L4JyjavA
 mjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UaPYglVILsMGfP9WiFWE8VZ7U3VNT2RToNAvw6WgWww=;
 b=urDZhTMhv6SdSF/+nvCXUykCOSgqnW2vqd6xofQtW8uMg5WMkZz7ny9qHeKPH7nUVP
 cnIbpUCE+gPfeFPrb7EU8y0P6/LTXh9bwW9N0BgrRrZX5DFFyF3i/nj7SajiImnzIJkc
 MkukxtvJsLWjRaOXRbabOy98CPsqp7FLs0F+d5QOGKIdNqR12T82ptzMr0li7F5+dI0b
 PCr+TTkoVpDoBGc/+zizpMRvi+u6t1Kf4sFZ1gJrgcb7Ibx1owqudONZfk/gwFo8W2V7
 VkyF7W77YDb30/FDGju+xfe8oFiFml9zX9x9EvRZjaP80txKQu8J9/TKLPjQQzyGTLlL
 9ZIA==
X-Gm-Message-State: AOAM533M/vatECAofOzC3dWA70qj33iNqc8gKcWurPDv5e95CJHk9Lz7
 aWBnHQdEFIKVvS95elUouQb/ygzzsDw=
X-Google-Smtp-Source: ABdhPJz51MGeUsJIE5gekxg1ZvS0Zn426jWftH1l9iQWAZsv7bvRDjVl9WnOnEVuCKu+Qpq3tznn8Q==
X-Received: by 2002:a05:6870:708c:b0:d6:c397:a87c with SMTP id
 v12-20020a056870708c00b000d6c397a87cmr4345628oae.23.1646321732756; 
 Thu, 03 Mar 2022 07:35:32 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6])
 by smtp.gmail.com with ESMTPSA id
 dw7-20020a056870770700b000d9aa7a6d63sm1178798oab.6.2022.03.03.07.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 07:35:32 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] qtest/meson.build: check CONFIG_TCG for boot-serial-test
 in qtests_ppc
Date: Thu,  3 Mar 2022 12:35:14 -0300
Message-Id: <20220303153517.168943-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303153517.168943-1-danielhb413@gmail.com>
References: <20220303153517.168943-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc34.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, crosa@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'boot-serial-test' does not work with a QEMU built with --disable-tcg in
a IBM POWER9 host. The reason is that without TCG QEMU will default to
KVM acceleration, but then the KVM module in IBM POWER hosts aren't able
to handle other CPUs.

The result is that the test will break with a KVM error when trying to
ruin the ppce500 test:

$ QTEST_QEMU_BINARY=./qemu-system-ppc64 ./tests/qtest/boot-serial-test
/ppc64/boot-serial/ppce500: qemu-system-ppc64: -accel tcg: invalid accelerator tcg
error: kvm run failed Invalid argument
NIP 0000000000f00000   LR 0000000000000000 CTR 0000000000000000 XER 0000000000000000 CPU#0
MSR 0000000000000000 HID0 0000000000000000  HF 24020002 iidx 1 didx 1
TB 00000000 00000000 DECR 0
(...)
** (./tests/qtest/boot-serial-test:1935760): ERROR **: 07:44:03.010: Failed to find expected string. Please check '/tmp/qtest-boot-serial-sJ78sqg'

Fix it by checking CONFIG_TCG before compiling boot-serial-test.

Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/qtest/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 0c2f2d94e1..deed640d7f 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -161,7 +161,8 @@ qtests_ppc = \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_M48T59') ? ['m48t59-test'] : []) +                     \
   (config_all_devices.has_key('CONFIG_TCG') ? ['prom-env-test'] : []) +                      \
-  ['boot-order-test', 'boot-serial-test']
+  (config_all_devices.has_key('CONFIG_TCG') ? ['boot-serial-test'] : []) +                   \
+  ['boot-order-test']
 
 qtests_ppc64 = \
   qtests_ppc + \
-- 
2.35.1


