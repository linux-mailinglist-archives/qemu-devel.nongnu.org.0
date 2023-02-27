Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F46A43EA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:13:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeCJ-00053e-UY; Mon, 27 Feb 2023 09:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeBt-0004ZG-R9
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:22 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeBr-0000Wv-Tq
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:21 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso2270000wmo.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vrhLzk8HW2g05OSZG+hwxdkUshGUicJmNC2ENXTKq80=;
 b=feGgLKgaCHgd+HjWFrrbfUsA/+rdkZp6v8Xvu+irLptmSmsXjOE67Rr+6fUR5tX3Vl
 l9c6N8UDrN38TqKAtcGHpLnzJzHEMvhphtOmymHTAyWQUYIxrtmnz8nuwbQ/WoUvPCHS
 zV5+aHfOi+8ZZzprfdMcBjma3Su5wjfJLkeo5miMgvZIfize1v40SjddUmjhwdh5m269
 rA2a+3ZJBTKcdMOk/evQX72gf5EDe8FyRGRBpUY8iCs7AG77S97gPzoRIEJKDXnpV53V
 3Jl65MVpZAfVtkV2DfkJI/s6li1hIQv/Wv+zmiZAJu6rWk2CBwtAMy3onwTVWbRpbxSU
 3spQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vrhLzk8HW2g05OSZG+hwxdkUshGUicJmNC2ENXTKq80=;
 b=SdNrFaWehp6Cgd1ngCPR3bfmvtrB3d5hxAVWER0ys8znNyuoM2JoD+/8SSIp/1eapl
 L8IybFKGDJ0ZmlntAZp34iKdnZKgV4o5Q6zrRC57qgNWGSnagPVsZmcPqSDX/nx2Bh1R
 uA6gDpMfnjoCnBFgt/7/L1bbnRciTl87Y6/ug+rvonm4wcrnNiEn2BLontgp4iSQthQ0
 ftOHx09Pn0lBr/UNiy9LlNhBRYSejb7uXV51G/vgqemUBRSXjJNixx4WB5BCcYJwu+dx
 4Dh2Xz8racImYkeBGVB65jMBsiiWCrYlcTSPC3/oalQx8cyNnx5dgxx0kNbheBP384t9
 uXjQ==
X-Gm-Message-State: AO0yUKUnV+L2E+uXe7JMwxDwCkwQiWS54KAvcrElX4JBZIHYP+UFuPDI
 lrBA3c5/3D807cggx8eCzbmtIo8Bji8lTvPj
X-Google-Smtp-Source: AK7set/sF4RfRje/2YQAahpLtKz57U+X57HJtYWM94+Tt9cOEtDnn10SOZy1UEFrlcNWWU3sy9hNOA==
X-Received: by 2002:a05:600c:491f:b0:3eb:3974:aad7 with SMTP id
 f31-20020a05600c491f00b003eb3974aad7mr6048404wmp.24.1677506958489; 
 Mon, 27 Feb 2023 06:09:18 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a05600c354e00b003e91b9a92c9sm9704286wmq.24.2023.02.27.06.09.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:09:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 087/126] hw/usb/xhci-nec: Declare QOM macros for NEC_XHCI
Date: Mon, 27 Feb 2023 15:01:34 +0100
Message-Id: <20230227140213.35084-78-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

NEC_XHCI is a QOM object type. Declare its macros /
typedefs using OBJECT_DECLARE_SIMPLE_TYPE().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230220150515.32549-7-philmd@linaro.org>
---
 hw/usb/hcd-xhci-nec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/usb/hcd-xhci-nec.c b/hw/usb/hcd-xhci-nec.c
index 13c9ac5dbd..d732be0ef9 100644
--- a/hw/usb/hcd-xhci-nec.c
+++ b/hw/usb/hcd-xhci-nec.c
@@ -27,14 +27,16 @@
 
 #include "hcd-xhci-pci.h"
 
-typedef struct XHCINecState {
+OBJECT_DECLARE_SIMPLE_TYPE(XHCINecState, NEC_XHCI)
+
+struct XHCINecState {
     /*< private >*/
     XHCIPciState parent_obj;
     /*< public >*/
     uint32_t flags;
     uint32_t intrs;
     uint32_t slots;
-} XHCINecState;
+};
 
 static Property nec_xhci_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO("msi", XHCIPciState, msi, ON_OFF_AUTO_AUTO),
-- 
2.38.1


