Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1A73C1627
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:40:09 +0200 (CEST)
Received: from localhost ([::1]:33656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1W8G-0003hz-AE
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn3-0000m3-C1
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:13 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn1-0008GH-3I
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:13 -0400
Received: by mail-ed1-x532.google.com with SMTP id eb14so9128920edb.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JqEuc5zmp5KYtSggRUy7NvqNM22I5C+WX9l/rIcbs+I=;
 b=c64I9UAs0/ezkFsKYx4rM9efBlpol8rL7Nuv+1XWp7NQCv3KtL//dyn1Z3l4vr5lmK
 F8Mak1wWmoi4mYDPfJ3scEB4utdpjv78mMd0oukPoMXNsk5fOvzZ9DYXGYHMVpUAwOJ+
 v6oPuu4bYK4qwQC7ZfqL2HGRJberAJIjeP9jwgTxBSMW47uepRG39jSU0SGCCrBGkEXD
 S0rpVf4aOXpHzApeRJAkv9b1s0tlWGv/SsicXL1gvo/wvRq75GRgLmljMx6x6St0Y/rn
 WniX5oJo5vnVbpRN4ivvOE/7HBZ97yNsNtSgzsKap/i1wKE/V43DxSk5DDsnoerLCgR6
 ENow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JqEuc5zmp5KYtSggRUy7NvqNM22I5C+WX9l/rIcbs+I=;
 b=tgcJXq6viUVcWFtoK/HNSiR9emJtdIetge2vEVo7R2dDskp6N5J7NYiEcr2eW43KKM
 rylzvVwKMyWBL/M5Je/4XINGEuY45b1FMnqwjfJvPn2JUwJjgtNadbgbwejOa0n1X1lR
 H8Vl0o0cU43kZnI5VUs/68Ytg57c1VKE7HN1aHRzDbvFXKCSzYC5ni90K5UbLOrokVG1
 Oo3b0qZNM3stYMVV76dRP6aa1thz8zLfbNKoSc2ilkin1bG8ERLBnDXWfr2KXsRZzmq/
 kRSl+HLXCuXLBaZTgnNDi5Zz+P3z9lbR6z1vzneV/97+nMj9lkT3gagjaqyHqtI3TxPX
 orgQ==
X-Gm-Message-State: AOAM530NFV2hoH6QcBfqe0Yrcz07pad+8uHnWLMcXgBXkCNSKh2iEAfR
 adJQMUeO+XQrjyLmCWBureWVekHy3lY=
X-Google-Smtp-Source: ABdhPJxdjP+a+sOdFNDDOd0yNXjBUTDjOVZkrfpUrIO5wlSP7TLVeEyM0te7JU+3aR7+0uqM1bH9Wg==
X-Received: by 2002:a05:6402:152:: with SMTP id
 s18mr38589720edu.221.1625757489827; 
 Thu, 08 Jul 2021 08:18:09 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/48] modules: hook up modules.h to docs build
Date: Thu,  8 Jul 2021 17:17:28 +0200
Message-Id: <20210708151748.408754-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
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

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-25-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/index.rst   | 1 +
 docs/devel/modules.rst | 5 +++++
 2 files changed, 6 insertions(+)
 create mode 100644 docs/devel/modules.rst

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 977c3893bd..ba90badbbd 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -41,6 +41,7 @@ Contents:
    s390-dasd-ipl
    clocks
    qom
+   modules
    block-coroutine-wrapper
    multi-process
    ebpf_rss
diff --git a/docs/devel/modules.rst b/docs/devel/modules.rst
new file mode 100644
index 0000000000..066f347b89
--- /dev/null
+++ b/docs/devel/modules.rst
@@ -0,0 +1,5 @@
+============
+Qemu modules
+============
+
+.. kernel-doc:: include/qemu/module.h
-- 
2.31.1



