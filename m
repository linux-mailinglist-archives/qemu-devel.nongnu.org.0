Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8974D7EE7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 10:43:38 +0100 (CET)
Received: from localhost ([::1]:48010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThEn-0007QL-6z
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 05:43:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3m-0007xV-85; Mon, 14 Mar 2022 05:32:14 -0400
Received: from [2a00:1450:4864:20::333] (port=53866
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3k-000847-Kc; Mon, 14 Mar 2022 05:32:13 -0400
Received: by mail-wm1-x333.google.com with SMTP id 19so8916148wmy.3;
 Mon, 14 Mar 2022 02:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mgS0yqg5itQxnRZrVxOmDEh/QmjiF5PASZvzhfZjpWA=;
 b=qNiT9UgNABIa0d2EOKhKeZxZJR9lcou/4kLgmg61OwS4ZwifyyppFoj0K3WUBbPFW1
 OC2IxtMsM6qkOmvmx4XrjYg2+3Bi/2U1g6zFALes3dDksEULs5xIuAEu34WF7dVb0eFT
 UraGGhLkZQQdHdXH92A2t0QiQIXxlXry7tAuz5PawfVV7U+1SEJ8r3oHRXC4LI8mlNvS
 TxGK6Nykvr268URgwnedO+h8XkTrmmlasxk1Oqjs7e0CzpOzG+wlHm4Vdw/vRPbTwMHo
 uKKTIaNFxw3XHzw0MNdWwtpYPWud3BYroT5sqEL0CGcfJ7Zjok820PonIe+QF9nXy8KE
 Ab8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mgS0yqg5itQxnRZrVxOmDEh/QmjiF5PASZvzhfZjpWA=;
 b=h49JJjq+8yfYafcGE5jbzpmzNbhWDala43/RSMMz7gtlFSiizv3JSTkbdeNDUpW2hS
 GEsu7DqL3SxAnGj1YYRXbRuBPEipNb8I0XMaG9wfp91+bpowWtdSvq2sA8MepuKNQBJb
 BsB7QUkbF6zNhZVPgtdiUk60raOQoXjdgiFa8TG8/EiZj943aQInsh2NEeFLgOmyLWxV
 mEWfH+shB6Lr913hM+Qole0KlkbYKlmeN7ZDXPHOi7nNYcpc4Z5cTpeqg/IPgFMtdrOy
 aFFDzqS3vZ7fNZgXFm5m7JBd//ISBPUvC05bBgCT4O94xntbZDGKjTS6/WOv5OHsg1nU
 VFIQ==
X-Gm-Message-State: AOAM532eENUr8ufQP4W9ldJ3sSn8mciZhyPo2A5DbPwb/l0dV9jicKk2
 Mk2u1LkraIGayagom0UROTZgvSbIfRk=
X-Google-Smtp-Source: ABdhPJw0XTtZ7aXzK19kw0oMi++lKujp8hvPaYdAUa8+WTVI5svp3wFE8NKR/7BqJ+bzmdrLoMFM0Q==
X-Received: by 2002:a05:600c:4a12:b0:389:d7f7:fbcf with SMTP id
 c18-20020a05600c4a1200b00389d7f7fbcfmr16974363wmp.158.1647250330984; 
 Mon, 14 Mar 2022 02:32:10 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfe9c7000000b001f06f8ec92dsm12707517wrn.30.2022.03.14.02.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 02:32:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH experiment 07/16] start porting compiler.h to C++
Date: Mon, 14 Mar 2022 10:31:54 +0100
Message-Id: <20220314093203.1420404-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314093203.1420404-1-pbonzini@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-block@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/compiler.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 3baa5e3790..18848f0d49 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -72,6 +72,10 @@
         int:(x) ? -1 : 1; \
     }
 
+#ifdef __cplusplus
+#define _Static_assert static_assert
+#endif
+
 #define QEMU_BUILD_BUG_MSG(x, msg) _Static_assert(!(x), msg)
 
 #define QEMU_BUILD_BUG_ON(x) QEMU_BUILD_BUG_MSG(x, "not expecting: " #x)
-- 
2.35.1



