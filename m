Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8E83BC998
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:24:02 +0200 (CEST)
Received: from localhost ([::1]:41574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iFF-0001Db-Mh
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htr-0000ln-AO
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:55 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htm-0002Fk-JL
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:54 -0400
Received: by mail-wr1-x434.google.com with SMTP id i8so12482274wrp.12
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V9YqSZAGqP+3D3GedI76qhcdO4Chs2UmehkI6MPdubc=;
 b=kiS3ovD6qb6+o3BBBQgBBNeyno7al6+nixmMUE8/yLBx4J9JGNIGYGgdB9X3faPBVj
 1fYzjCZzovWMW/0kJkLAX3nuk/42wZnLu1CkiYDRY16QngzYk6xSrtGqHFXUdiNTOPXe
 9URjExfsukNnM46yiRiYcuTdZmJ/l8/nrsoBwXmLIBKLgsfyF9wNe4nONy4bkE3Jejuz
 YunI3qo8IsYelMvThBZ+XvzfDBEGo9IXb24eNgRDI00Bx6t6tLEnY1g636Dhl2yUeDYQ
 QLGGEhL3ILh6jPG0WubTbVFDiuYKny7bymV2y1EZMmUNwYe6MdE1jC5xQoUuTC/yWh0C
 Ch9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=V9YqSZAGqP+3D3GedI76qhcdO4Chs2UmehkI6MPdubc=;
 b=Xpv3LPPLV5vm6F44afLkuiy3u3GFI4tFXggwuZPoTmH4WbBuS1h/FMRDmUXjG4Q1hc
 dqD9JaA2m7Uli6lyYjy74GDjyWyCAfWZPVjpaurff5P1fl7fOr4U+tGYdQn1V9q8ZzwR
 uxWu1N32eLwI56SjIsnZWadGE2uO5aEkeae9M0uF9Hy47xGtpSZkm7esQnLjU6TvQ6a1
 t55wp2IqQ3V0nooeppQOF2LVaE6pDI950UfQGBdbkIWcWRMXOrci5EjbSwBXcp+Xo+ab
 0I40lFFm0aua62XVC5Mc53RvNpShXykMkb6VUeyND7JsbLJo+rEarDcKGcMMk/UP3VVg
 WH5Q==
X-Gm-Message-State: AOAM532q3/oj18Qz19Te7v1nbdmeSt56ezd9vGCxPZgd593PnmrXBZtc
 KnF0VDBJ4cEq/bdT1siY9C5ahFJnTPU=
X-Google-Smtp-Source: ABdhPJxcvMu6AtyKry7ssCufDNxMZtsrL4Dzy2eZHF8MZwtRtPLF6oc60hBnwtuvH+pJT6Mh/JnWxg==
X-Received: by 2002:a5d:5985:: with SMTP id n5mr14707147wri.63.1625565709280; 
 Tue, 06 Jul 2021 03:01:49 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/40] target/i386: Clarify the padding requirements of
 X86XSaveArea
Date: Tue,  6 Jul 2021 12:01:11 +0200
Message-Id: <20210706100141.303960-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: David Edmondson <david.edmondson@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

Replace the hard-coded size of offsets or structure elements with
defined constants or sizeof().

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20210705104632.2902400-4-david.edmondson@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 6590ad6391..92f9ca264c 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1329,7 +1329,13 @@ typedef struct X86XSaveArea {
 
     /* AVX State: */
     XSaveAVX avx_state;
-    uint8_t padding[960 - 576 - sizeof(XSaveAVX)];
+
+    /* Ensure that XSaveBNDREG is properly aligned. */
+    uint8_t padding[XSAVE_BNDREG_OFFSET
+                    - sizeof(X86LegacyXSaveArea)
+                    - sizeof(X86XSaveHeader)
+                    - sizeof(XSaveAVX)];
+
     /* MPX State: */
     XSaveBNDREG bndreg_state;
     XSaveBNDCSR bndcsr_state;
-- 
2.31.1



