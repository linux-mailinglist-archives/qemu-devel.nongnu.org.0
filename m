Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D56644B237
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 18:52:11 +0100 (CET)
Received: from localhost ([::1]:45714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkVI2-0002i8-HI
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 12:52:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mkVGX-0000cy-7Y
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:50:37 -0500
Received: from [2a00:1450:4864:20::529] (port=43564
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mkVGU-0000jT-JJ
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:50:36 -0500
Received: by mail-ed1-x529.google.com with SMTP id w1so80409384edd.10
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 09:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uf2jq1W6vW08aozBiEOJUT0U2HATlOOWfn5+VD0PxHA=;
 b=MNawZEKm8u1so7Q148SjnboQxfsMEhLx9d6l5zXcW1CAsDPtqgEZLFIt+CAJ27FAgt
 pv5xfPfJTRn/ScM9+BzvrXkQkzDZqC6K/T8/bYN4JVWVQ5FxMknbLsa2wn01Wj1D+NfS
 sy0Zl6hBg9PRRbCsUyovtFWzEH0NwBbFSRWiGT2TsvYo2JdnicJyKxLY3Qc17f5KfdNm
 hCvBGh06o6ATrCvheYWRgK8yUM127d5/wmTtyag8h0+fTQqy1ipXw/dRJPYCCsUQ44oU
 rmQdVBCt6vDT1mOlrlV9AdoJ3XFLtKlSjuvzkymvjqfR51dXVrqztxWbRGiwdrOVag8a
 3QfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=uf2jq1W6vW08aozBiEOJUT0U2HATlOOWfn5+VD0PxHA=;
 b=fLC/n+vArVk2e0ZzkXSKj7yJ/OcsfuLpuGUEyGmDqcLbuciN2956AOvziOT+OWRAW5
 7udpDGsXm7c7+G1Eqo734plksB5DdhUQvZi9BMsLnAT+b2czHBSZEiqa85cmF6KD0fLD
 EulPnDl18C0lvACE6qBmEhzaDtUI3wm7jDP9O1TppinOaUOh4LeobbZJo6m4U3HE1B+S
 RuYVbtMwpt+kzdgT9LjVQ+WLuZsEDkLqyULL5uc2jsENKmmYbhAgA/rRxI2a//VQLG9S
 iQ+P1dAxxcnEwwIheBEEy0ADLMe50OQJS+3pJNZAJ8rJkdFvB+3T2Z1uaPOU/qNAM8EX
 uoJg==
X-Gm-Message-State: AOAM531TBcny0x6bI6qKofRgVzDQnzWIgmc8Due8VQQM5HmJ7GvxLm5t
 gsfWOvxmfhCwzSiIBJAgOjs0lHztIc0=
X-Google-Smtp-Source: ABdhPJwtJasg4wbsXiT9PFSS0kGupWpWyvN/0/M4ofJZwW05JVGjm2ZsYila8fA7zfsijSEt4B8Ong==
X-Received: by 2002:a05:6402:2692:: with SMTP id
 w18mr12423344edd.48.1636480226836; 
 Tue, 09 Nov 2021 09:50:26 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c11sm4516472ede.8.2021.11.09.09.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 09:50:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: sgx: mark device not user creatable
Date: Tue,  9 Nov 2021 18:50:21 +0100
Message-Id: <20211109175021.17813-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The device is created by the machine based on the sgx-epc property.
It should not be created by users.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/sgx-epc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index 55e2217eae..e508827e78 100644
--- a/hw/i386/sgx-epc.c
+++ b/hw/i386/sgx-epc.c
@@ -154,6 +154,7 @@ static void sgx_epc_class_init(ObjectClass *oc, void *data)
     dc->realize = sgx_epc_realize;
     dc->unrealize = sgx_epc_unrealize;
     dc->desc = "SGX EPC section";
+    dc->user_creatable = false;
     device_class_set_props(dc, sgx_epc_properties);
 
     mdc->get_addr = sgx_epc_md_get_addr;
-- 
2.33.1


