Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC63844D28F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 08:39:42 +0100 (CET)
Received: from localhost ([::1]:52698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml4gP-0006pm-TX
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 02:39:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ml4d4-0003ec-KX
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:36:14 -0500
Received: from [2a00:1450:4864:20::52f] (port=38771
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ml4d2-000798-Ge
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:36:13 -0500
Received: by mail-ed1-x52f.google.com with SMTP id z21so20618034edb.5
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 23:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uf2jq1W6vW08aozBiEOJUT0U2HATlOOWfn5+VD0PxHA=;
 b=itBzEHnwMQaYiCBtTFYk2UV0rv2UYYqv0nSq2ScJ44xeCWKfeVMcCpOwRfKa6xI5gS
 7R32B/jGjQKkCzPTU6VCNUGIMw1Uo5KZ/vGldhAPAl+5yVNMmyDsgugdjw+2AkVAb1f7
 geAR64+Erpd9dz5QjiMh+cD32G6hDeZtrbuNw0P8WEdXO7v7asgEXO2f8KqXgCJahZ4O
 6LPvcmoAXRT09b84PdsFjhvVC8+fWN/kOOApWEVPlmL6fjcdfspT/sPVi+0Yzn3MGYk0
 KPIzjxyepd0l+5UYTSffUSV8J+Amt7Stx7ANncpwJWSSwakYWleCyWWeMFYA25YOE11s
 cluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uf2jq1W6vW08aozBiEOJUT0U2HATlOOWfn5+VD0PxHA=;
 b=cfyvmGLRIXHErE10BeXpSDIK4i9US2oC3tHzsJ/+hSOD3IYefVj/alcWb0Cs5lURVQ
 lt0GI91j3Eog+N4DBTYwZA/KFADuS23HmCkjhTpCBtP+dcgLSFlS/FixgUxdRvrxsmhd
 RfPyACESsWtT9OAMcTXtbsuNNRcbdekxYugzv5JeDxdLrCTPEOM4Dddkyb4KYgBGGVPG
 Gco2zLFIaLwNzueQMaNu6Pb2g0fhsvAZ1uenzx0r4Tss2H3oJ90CSyWW49LyDJsXK+dN
 HqKXb+FYmNvgHVEiLeUPgFLW30ZQNGYy4e3Xi90bb4CzX03fgpZRRye8GsxuxcFaX1rK
 DMiA==
X-Gm-Message-State: AOAM530qRTtKlRtfT9PVhRQ0q3w53fMJHwMbY/8BBLihbu+WJImyClQL
 jRwlX/dgR/960u04QhlMSOtabEU/xx0=
X-Google-Smtp-Source: ABdhPJwdXA2lRxzl8/OJ5RQks0WU4oJpFn0foUxmGn5go2PXF2k7BocZp3+QIMB75MiZbleHm65QLQ==
X-Received: by 2002:a17:907:7242:: with SMTP id
 ds2mr7017869ejc.269.1636616169805; 
 Wed, 10 Nov 2021 23:36:09 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id w1sm1062098edd.49.2021.11.10.23.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 23:36:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] target/i386: sgx: mark device not user creatable
Date: Thu, 11 Nov 2021 08:36:03 +0100
Message-Id: <20211111073607.195697-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111073607.195697-1-pbonzini@redhat.com>
References: <20211111073607.195697-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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



