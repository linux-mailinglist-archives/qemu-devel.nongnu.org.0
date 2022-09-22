Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8EC5E6B3B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:47:56 +0200 (CEST)
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obREp-0003Vr-2W
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBG-0002Dg-JV
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:10 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB9-0005SG-Ht
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:02 -0400
Received: by mail-wr1-x434.google.com with SMTP id c11so16386207wrp.11
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=UoIEVd6qFvT+Ln9sMhn/rS//C5+/7lw2UA59aXrFoHY=;
 b=iBqZAQdapWw+yOXckE21PCWw0K6EQmPoWx5Y8IMKOQNWu60pzzI3nPOmpo6JXyTcGR
 mYlYPal3za3wH2a/slU3/yyScMhH0sTHSz8aU7lxk21ZKauYAxhiu2y5lg4RXsjW+A0T
 z08VpzH3SMJKQrZkbnNNZlQOWSAIprxw0UiCFTOtRV0A1aP6myvDXKFqdyVQ5Bqx3jNG
 gWP6FQjEKfS1+eOVjOm3bUWEx0+ziOUP3B0lS4nBjWf1l572aRPVQkWGTbdoVEEFlGEE
 b8WnLdVSGJ1r8ztNbmolUUF9VtMgx33tG2LX/ZzFY6JDSnfk80dE0ZWShh11+2HwV9xN
 e/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UoIEVd6qFvT+Ln9sMhn/rS//C5+/7lw2UA59aXrFoHY=;
 b=3BNzLrQSIxj26WbCRV1ubPSj5fHsFyBWS8xhV+Kegrhq0R5Jo0f5ICHmzbOOLBkqmO
 6o8iv5ONJvopVkgs3oiTKxDHt4gqmlw2zAQik3/Vqin9I/TQmE1zOZ1KFPscLtkEuEZJ
 02t3ksM20EqD6D8AgFHO7HkCucU2OSTWnebE+sVQEGkKZYvMe8FB8VYzAVfUlvBALX/d
 lCjVFdLb4y9OV+QhjdV7vkD2cIn4IHDpMo4uoxJWyiOhbIois13CxQcq+hipv66+FhFy
 u/unU9vewqB/WoeYRbRler7/oMnUFy9Ivc5joEfKG1unO/a7BBKrtBjl8JE6TTMYZt4m
 IY9g==
X-Gm-Message-State: ACrzQf2ouyEBnyMumNbyb7oAGYIpXRVeddIQbuYfqknDQ4Q/BkCSguPm
 EF8Gfm73j8RO+0LusI1s4qta84UPo+HgAQ==
X-Google-Smtp-Source: AMsMyM5E/jHh7623L0fsi52aRCWz5hUkCLOzaxpQWrfW6HAp+kGBA0JWjV4dUW46MZJqSstge/4iAw==
X-Received: by 2002:a5d:528a:0:b0:225:4a8e:221e with SMTP id
 c10-20020a5d528a000000b002254a8e221emr2550970wrv.145.1663864557845; 
 Thu, 22 Sep 2022 09:35:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/39] hw/usb/hcd-ohci: Use definition to avoid dynamic stack
 allocation
Date: Thu, 22 Sep 2022 17:35:27 +0100
Message-Id: <20220922163536.1096175-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The compiler isn't clever enough to figure 'width' is a constant,
so help it by using a definitions instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220819153931.3147384-10-peter.maydell@linaro.org
---
 hw/usb/hcd-ohci.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 895b29fb865..5585fd32ccf 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -805,13 +805,14 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed)
     return 1;
 }
 
+#define HEX_CHAR_PER_LINE 16
+
 static void ohci_td_pkt(const char *msg, const uint8_t *buf, size_t len)
 {
     bool print16;
     bool printall;
-    const int width = 16;
     int i;
-    char tmp[3 * width + 1];
+    char tmp[3 * HEX_CHAR_PER_LINE + 1];
     char *p = tmp;
 
     print16 = !!trace_event_get_state_backends(TRACE_USB_OHCI_TD_PKT_SHORT);
@@ -822,7 +823,7 @@ static void ohci_td_pkt(const char *msg, const uint8_t *buf, size_t len)
     }
 
     for (i = 0; ; i++) {
-        if (i && (!(i % width) || (i == len))) {
+        if (i && (!(i % HEX_CHAR_PER_LINE) || (i == len))) {
             if (!printall) {
                 trace_usb_ohci_td_pkt_short(msg, tmp);
                 break;
-- 
2.25.1


