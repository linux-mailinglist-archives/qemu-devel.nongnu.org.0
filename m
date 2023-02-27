Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8287A6A4411
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:16:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeCN-0005JP-In; Mon, 27 Feb 2023 09:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeBr-0004YD-Hm
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:19 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeBo-0000WB-8g
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:19 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso2269603wmo.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZSoS+ygN+1cuiZu+xD0EGGjAruapBoISIy1LA8Yb1HM=;
 b=f36185WHGnV6uaIG4BiLUNZXapmda3hIGQm4SamaIkh+CyhRngxz+7hKRYoPTHbbE8
 aExDucPw4PgcvGSa0SjeB7sTpcriP70ZxlZw0D9wY6w/sDX+n9DOSp5mugKCNkshIhqb
 mJmJSM+xMx6MPCHHsNv7+bV8LnXEiQJsSA8CdPYYRC1u1pV2KT+3PaFlhT3yHL1/xDgU
 1gQVTCIYphbjm21nI421JcQDQ1pkIuXWJejBUzxgDBHixwGNPZsGgdZMTN3SMJJj5tlU
 LAOk20RJAlSCIFwfBzBnAIjx+x3IC7CYy+yDZXXpwlkepN/oamhAXxcXAbZxOqI4ywPn
 gkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZSoS+ygN+1cuiZu+xD0EGGjAruapBoISIy1LA8Yb1HM=;
 b=7Y9rBRGNmOmVs58AxWX1MsCRy4Y8rldAOvc8HnZOhr97oMWFP9oQhv8TpkHHbgFg6+
 lMbix750CL5Vn/oXS96UYRQuUBK7cN/EpI6qqTfwPvcXGEz31o+EefEgwXITtDYlldAR
 PKKAz8iN1HN9VfCuMDu+b2uLXAW+hWF2919pjG04jSxiUcaQ/AWra81XIHqW9jo5heR9
 walYdOp+l2lOMV5DyMwj1GPLp2uI73J3dvomnAZ/kyF4i890DHUmVMHe3TMTJT0FmHDD
 zx4Wm9yAWwAIe/FSAafh5mlhAXq+Qqpf5QnOWc+Q3gNO40AnmEHQdy0rOjug1eGvog1c
 K1OQ==
X-Gm-Message-State: AO0yUKWwqWlMyveww3sQ4LvXnJDfor6DAdM3KnciuLuOO8iocZFOGq+D
 gxG38qFz8oNJbBhuOugStxVM45XAPNTQysig
X-Google-Smtp-Source: AK7set8lUMGJU+w+fzHTMQgfhaPpdK2n9QxtTXogYgdYD+RM+RIe7Wo1dfaZZycI1JyhIcVjh/OU1A==
X-Received: by 2002:a05:600c:3093:b0:3dc:5c86:12f3 with SMTP id
 g19-20020a05600c309300b003dc5c8612f3mr15890635wmn.1.1677506947943; 
 Mon, 27 Feb 2023 06:09:07 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a7bcbc4000000b003dc3f3d77e3sm8782341wmi.7.2023.02.27.06.09.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:09:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 085/126] hw/usb/uhci: Declare QOM macros using
 OBJECT_DECLARE_TYPE()
Date: Mon, 27 Feb 2023 15:01:32 +0100
Message-Id: <20230227140213.35084-76-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

The automatic conversion done during commit a489d1951c
("Use OBJECT_DECLARE_TYPE when possible") missed this
model because the typedefs are in a different file unit
(hcd-uhci.c) than where the DECLARE_INSTANCE_CHECKER()
is (hcd-uhci.h). Manually convert to OBJECT_DECLARE_TYPE().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230220150515.32549-5-philmd@linaro.org>
---
 hw/usb/hcd-uhci.c | 2 --
 hw/usb/hcd-uhci.h | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index 30ae0104bb..f77ffda69a 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -60,9 +60,7 @@ enum {
     TD_RESULT_ASYNC_CONT,
 };
 
-typedef struct UHCIState UHCIState;
 typedef struct UHCIAsync UHCIAsync;
-typedef struct UHCIPCIDeviceClass UHCIPCIDeviceClass;
 
 struct UHCIPCIDeviceClass {
     PCIDeviceClass parent_class;
diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
index e0fdb98ef1..69f8b40c49 100644
--- a/hw/usb/hcd-uhci.h
+++ b/hw/usb/hcd-uhci.h
@@ -75,7 +75,7 @@ typedef struct UHCIState {
 } UHCIState;
 
 #define TYPE_UHCI "pci-uhci-usb"
-DECLARE_INSTANCE_CHECKER(UHCIState, UHCI, TYPE_UHCI)
+OBJECT_DECLARE_TYPE(UHCIState, UHCIPCIDeviceClass, UHCI)
 
 typedef struct UHCIInfo {
     const char *name;
-- 
2.38.1


