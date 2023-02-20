Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A95969D047
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:07:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7k9-00023q-Pq; Mon, 20 Feb 2023 10:06:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7jn-0001oh-Qw
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:05:57 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7jm-0008U6-8s
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:05:55 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v3so1462948wrp.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p8o9rMHYIWugBzDHKzJd9qgUvI0GxAA+Ds+7D1kDUBM=;
 b=dXKm87OvSP5t8PW1VhPsHLOYT9xOV5RBpPkg0viuHrxaBLSMDwyK9WyS0P0WvJqq9Z
 nQsJKmGynhhaoa3VULViKj/X0t9nQY646RqArIXdw1aUFzRtYvxNu9YOJUOtbaOd505p
 lbldkY5rmBe5CfTSI6cwQqxASSh20HdkVf22RRS70SdgtNFPA3Fotx2tXKGh93VRHkkI
 BoVJYmeKXcL2LbeNVOAhJeJAD01yV1v2daZ7s75rmDBnCt25f16lGOmzICUZmfv9RcbR
 BbDjbi1p5Lk97pgBXCnQqxJ3FSc+7KO0FlQCFneeYgisWyLAVeXxkaXUFTIvqVcjWMzp
 cnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p8o9rMHYIWugBzDHKzJd9qgUvI0GxAA+Ds+7D1kDUBM=;
 b=FKaCncCYz3EPq/Dunz3KrCEsGqVNkeh4tGgEN9gBGEjVQxXgjazY7pCqrdy4r1qjsk
 Kw3xlgBFALaWjAaPsn1dcdTK5i+WwMsDC3Ca16xgndcbotxoPKGCZunw1JU77pXSnRpU
 85zIoTXjnYPU47uZB5q5kVgAGJkavJCiR0aS7m6C3lZF7kj+97k0OYU27AyMPiGu42Hh
 FwskH96jJgO9HAj8gvNjvc3TeikJsAOKJ6RWyHa4UpaXSQcaQ7Xwo0znOX7da+1wr6Ib
 ZjoDydNP5MoVxe2b/kzi5uP0ZbTheSDVp5AlN4CrnT7rrij+m3R9gYT9r4ZBYLoHVeF9
 z0oA==
X-Gm-Message-State: AO0yUKWqb4tuDJZ5jvpIcEJWSXDRtBea3ITJc9U52ZXb8voOp7N9uz7p
 W143ma7plCNvTSg3mphm8/HhNfx3ZhM+FFHq
X-Google-Smtp-Source: AK7set+Fr+RlRaTSgA1TIOlDInqd6M5dPOqikpRdcBaMu0dyb4K5F0wuH0UHZvPQR0zDqTnIrIcXiQ==
X-Received: by 2002:adf:ee43:0:b0:2c5:afce:6080 with SMTP id
 w3-20020adfee43000000b002c5afce6080mr334045wro.12.1676905552497; 
 Mon, 20 Feb 2023 07:05:52 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t5-20020adfdc05000000b002c556f36116sm4133914wri.66.2023.02.20.07.05.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 07:05:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 7/9] hw/usb/hcd-xhci-nec: Replace container_of() by NEC_XHCI()
 QOM cast macro
Date: Mon, 20 Feb 2023 16:05:13 +0100
Message-Id: <20230220150515.32549-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220150515.32549-1-philmd@linaro.org>
References: <20230220150515.32549-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-xhci-nec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-xhci-nec.c b/hw/usb/hcd-xhci-nec.c
index d732be0ef9..328e5bfe7c 100644
--- a/hw/usb/hcd-xhci-nec.c
+++ b/hw/usb/hcd-xhci-nec.c
@@ -53,7 +53,7 @@ static Property nec_xhci_properties[] = {
 static void nec_xhci_instance_init(Object *obj)
 {
     XHCIPciState *pci = XHCI_PCI(obj);
-    XHCINecState *nec = container_of(pci, XHCINecState, parent_obj);
+    XHCINecState *nec = NEC_XHCI(obj);
 
     pci->xhci.flags    = nec->flags;
     pci->xhci.numintrs = nec->intrs;
-- 
2.38.1


