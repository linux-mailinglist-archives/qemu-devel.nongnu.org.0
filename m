Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB6D3C1617
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:36:29 +0200 (CEST)
Received: from localhost ([::1]:50490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1W4i-0004U8-F9
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn5-0000tN-4U
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:15 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:44590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn3-0008Hh-Mr
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:14 -0400
Received: by mail-ed1-x536.google.com with SMTP id l24so9014580edr.11
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TrMKWd8CSoJe9sZMNfKvzA5rEkL38qTbG6xo58jBtj4=;
 b=KA6mpwZH2CDXghujslXS08w0Q3br6ulcx0c8ondyLEceNmigB87BXsiLYOFFVvUBfu
 jwSQF9uB/FZ8ncBQA3YpLVFjo19KPo21PW1QE4GrpL/gNAAaNrHie+UKAauK4JTNBC8+
 qzCOJRQWAJq0z81jGNHDKnHHM/2Aq0LeZIsD9hva+OhuUeiUWUwseUcP+fRtYe8+JLP2
 WDfXZctkdWdPXjAll6n0UjfaMXPZPe+WX5LQPWVSYWfB3TXOz2aGQlnkzJTilAxvaNxr
 y/Ar83iSeB3XdEOWRarizW9OQHA2bsMLHrSBSY04yhFRK0S09EUztH+UafnOQprF1v/t
 hQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TrMKWd8CSoJe9sZMNfKvzA5rEkL38qTbG6xo58jBtj4=;
 b=OwPtWTk8yCt1YV5vOwF5F/7Qc5QHvNj8N4E/U7oRT4FhEFvoWHJlcbuhEjuxI7X7Ul
 QrTACZyeyTiuFj0PALmZugt4QRyGabwUg+dIfcDQuNAgeN9WpPiTeNUBUflpLqj3i/oE
 TWYRjnYoXB60LjvBca1/VrO4tnv0qws7nGli8tIjFBHpP5ufIk48x7KsjQtWvgK/rhrr
 EBcN7DZI388Jeld+d3ar/rCumbVEWdU3HEaF0QF4edLD+vr6cQyvJBnc2JzUsenA2XIV
 YYFQr9+JXC6JohG83+4HvQCUs3ORArMhTGUGNxwwbnjK10i9BmpWP1t9GvMQIwEwB4ef
 SeCw==
X-Gm-Message-State: AOAM533dnFRLuCL6lF7BiacpinFMvQfdypELJgoL3CwEgtDUBFdUI1oF
 BnUSMuR5gMBphmZgoCRRkIOdc59GTN8=
X-Google-Smtp-Source: ABdhPJwJH2lrAZ4dDsmz4eyiGFdG6UH6+FtkwdGV2kGE8oJZufZL2vZqMraBvh+0KVF2kgyDIoDCsA==
X-Received: by 2002:a05:6402:2034:: with SMTP id
 ay20mr1348801edb.188.1625757492496; 
 Thu, 08 Jul 2021 08:18:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/48] accel: add tcg module annotations
Date: Thu,  8 Jul 2021 17:17:32 +0200
Message-Id: <20210708151748.408754-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Add module annotations for tcg so autoloading works.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-29-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/tcg/tcg-accel-ops.c | 1 +
 accel/tcg/tcg-all.c       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 7191315aee..1a8e8390bd 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -124,6 +124,7 @@ static const TypeInfo tcg_accel_ops_type = {
     .class_init = tcg_accel_ops_class_init,
     .abstract = true,
 };
+module_obj(ACCEL_OPS_NAME("tcg"));
 
 static void tcg_accel_ops_register_types(void)
 {
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 00803f76d8..d6336a9c96 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -238,6 +238,7 @@ static const TypeInfo tcg_accel_type = {
     .class_init = tcg_accel_class_init,
     .instance_size = sizeof(TCGState),
 };
+module_obj(TYPE_TCG_ACCEL);
 
 static void register_accel_types(void)
 {
-- 
2.31.1



