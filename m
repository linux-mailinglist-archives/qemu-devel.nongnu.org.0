Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6577139BBAC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:21:32 +0200 (CEST)
Received: from localhost ([::1]:33272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpBdb-0007xL-F0
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa9-0007za-S7
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:57 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:45828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa8-0008Hi-7c
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:57 -0400
Received: by mail-ej1-x62d.google.com with SMTP id k7so15010299ejv.12
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5lZVa84k/MvyKy7frnCC2iZBSdkqkWY1cW0Ht1J4K5w=;
 b=VquZw9fy4QxVjLzRc9nqLnngYH8t+1oXdTDWrlLkcRgZYINiWBsO563tDilTLi9ARE
 y+5TlLyxUTMeDr8D4nIuFJsUwLiSkeKcixrI18CXgAWOPT0v/ydeHX0wcOl2arDwa+rW
 1nj/cM57+sJvsJg7vJZevahtkGREz4E25YfsAC/J+jU8veT6y0Hg4OmXb7E92RJDtGZl
 QaDzWSyoWXp9R9soEOPxNP2iIoB4YhYbyeCI1egignNcQdkGMYa70F9nOr3l1c3mN4Xr
 wY7VpM2Nmnb8dH8jvyt3yeVZMlqGScasv9lMXdNq6cUvGh5D3qj6yIB1ub/kkY+kZRS3
 FtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5lZVa84k/MvyKy7frnCC2iZBSdkqkWY1cW0Ht1J4K5w=;
 b=f7q1qK14fS8As7ibaitmamDjoFFd6hA5giORagwA9L8FQnri+x0Rb/l10J1Txjy7ld
 XnBAlppz7j1r6aQv7y9kO3WuOqkTxNk/fCTyN99ATLteEaRtr691Qtq7sNYvjpSaef7d
 Ez8inPxViAV+7GVYkb3Camq7AtDpFYC3/Dzws2vx1OTIkA+WVlg8DHTd0GSzGpCNN3pm
 GgJlXubZi2zHNQ9M8YQQQrRSr3sCgFfCMJrpp1+SnRIQiFGBFPJiHxsWyYgUbpImhJ1f
 oOZ2/GVxglKDGDmcE/aYVLTyL9dZsakvTI95JKAz+Q0wDN2s5NoK/IIWj7SjCC5AvIjZ
 Q9Nw==
X-Gm-Message-State: AOAM533Pcj67w2+YyVkrl42gqZvh2hC0805N+HpHHOyFEsICYAFC1dsH
 p342Fp9Kd1VRxE70zf/JS3By76lT9MAbGQ==
X-Google-Smtp-Source: ABdhPJx+KIMqF6lMxABNHR19XT7yhuKm60gWY+oSw9Gz7bqAkk6n3nQoZ4iJoOLCA5Z2WgRh41EK3g==
X-Received: by 2002:a17:906:1401:: with SMTP id
 p1mr4562715ejc.526.1622819874848; 
 Fri, 04 Jun 2021 08:17:54 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 w1sm2402451eds.37.2021.06.04.08.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:17:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/13] i386: run accel_cpu_instance_init as post_init
Date: Fri,  4 Jun 2021 17:17:42 +0200
Message-Id: <20210604151745.310318-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604151745.310318-1-pbonzini@redhat.com>
References: <20210604151745.310318-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

This fixes host and max cpu initialization, by running the accel cpu
initialization only after all instance init functions are called for all
X86 cpu subclasses.

The bug this is fixing is related to the "max" and "host" i386 cpu
subclasses, which set cpu->max_features, which is then used at cpu
realization time.

In order to properly split the accel-specific max features code that
needs to be executed at cpu instance initialization time,

we cannot call the accel cpu initialization at the end of the x86 base
class initialization, or we will have no way to specialize
"max features" cpu behavior, overriding the "max" cpu class defaults,
and checking for the "max features" flag itself.

This patch moves the accel-specific cpu instance initialization to after
all x86 cpu instance code has been executed, including subclasses,

so that proper initialization of cpu "host" and "max" can be restored.

Fixes: f5cc5a5c ("i386: split cpu accelerators from cpu.c,"...)
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Message-Id: <20210603123001.17843-3-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 9c47daa409..a9fe1662d3 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6401,6 +6401,11 @@ static void x86_cpu_register_feature_bit_props(X86CPUClass *xcc,
     x86_cpu_register_bit_prop(xcc, name, w, bitnr);
 }
 
+static void x86_cpu_post_initfn(Object *obj)
+{
+    accel_cpu_instance_init(CPU(obj));
+}
+
 static void x86_cpu_initfn(Object *obj)
 {
     X86CPU *cpu = X86_CPU(obj);
@@ -6452,9 +6457,6 @@ static void x86_cpu_initfn(Object *obj)
     if (xcc->model) {
         x86_cpu_load_model(cpu, xcc->model);
     }
-
-    /* if required, do accelerator-specific cpu initializations */
-    accel_cpu_instance_init(CPU(obj));
 }
 
 static int64_t x86_cpu_get_arch_id(CPUState *cs)
@@ -6799,6 +6801,8 @@ static const TypeInfo x86_cpu_type_info = {
     .parent = TYPE_CPU,
     .instance_size = sizeof(X86CPU),
     .instance_init = x86_cpu_initfn,
+    .instance_post_init = x86_cpu_post_initfn,
+
     .abstract = true,
     .class_size = sizeof(X86CPUClass),
     .class_init = x86_cpu_common_class_init,
-- 
2.31.1



