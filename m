Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FEE69D046
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:06:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7kF-0002G0-Ko; Mon, 20 Feb 2023 10:06:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7ju-0001t1-FI
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:06:10 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7js-0008Um-RI
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:06:02 -0500
Received: by mail-wr1-x429.google.com with SMTP id bo30so983088wrb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rwk3S75FdqWeTle70LswE0cg7wHk0orFnQPLyZ5g350=;
 b=rdS4B/WCFnvVO5TKYbKcoQK/WeA9T17pLMTOkt3wcMDJbyTNGZo2NcMKcZMLFztdlY
 Nw0vyvHeN8wnYCYBixoHw50+uYX10oNRlj+tKB+zVkJVXDO/58oOljosON5Z6/CHx3rx
 k6fwLBMUtYt1vrcO97UAlGu6kUCN82ov+wRzh00nBd/UlG3sRVI7ejix9TNIAYyyrdxv
 fgoSkLXVdl//8JWnWjf84YOGRvoYu5MGWmR85r1BNL3Rw8E/tsZU9fd6ANL9aAhjHm7D
 /QdnTeAl+JyYi8BjGWcDMKU+vYI35wNTxak8GHNTQIw3xRkS6mCtgvEwYOms1y2OJciw
 Yz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rwk3S75FdqWeTle70LswE0cg7wHk0orFnQPLyZ5g350=;
 b=rEiz/kF+n7eyzGWFct5NU9cKUhwYZuJ4WUPX88HKVPRtIesucOHlJ0kA/d9cQfKTuw
 DEueZXXDksKUReqwRkZPIECjk6xy79XpvqMiOwrGHglZixd81yLHGz3iTyPgVbKl241v
 MXFTQMSRS7oDFhLoMtv3ToEJvBDLnJb9wmANhnmeshVuvFJItJ0T6snC2pFRYxEibiD7
 ThLEzQyPTbwSWhLaBSiv0Nz/95T0K8jBSf/ShktCAlTnW6Z4Ys8rh8Asf6gbW/hXnTcB
 OlIEmSLhjWTIlPlL2L0N4U9mHOoGN/lOdCpw/rYFL2e8uf9Y3+PxL0Be5HZkzPlxTZ+Z
 VJIw==
X-Gm-Message-State: AO0yUKU78PK6a4RGKK/1UPESdceElQkNPCFtv5Qg/eAIwG6GFzRPO4Am
 CaDBXZjlvBtCT8YzP3hFI12zWNMcHhnWZ5H7
X-Google-Smtp-Source: AK7set/roX5wuRRwTdlRtsijr0lBSa2FsN9FX7wsbjw+iSMlCc43HtDgsjOEbxL4OFAUigSTvwrD3g==
X-Received: by 2002:adf:fc12:0:b0:2c3:e20b:82aa with SMTP id
 i18-20020adffc12000000b002c3e20b82aamr1973309wrr.22.1676905557565; 
 Mon, 20 Feb 2023 07:05:57 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y1-20020adff141000000b002c58f199a49sm11428923wro.117.2023.02.20.07.05.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 07:05:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 8/9] hw/usb/u2f: Declare QOM macros using OBJECT_DECLARE_TYPE()
Date: Mon, 20 Feb 2023 16:05:14 +0100
Message-Id: <20230220150515.32549-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220150515.32549-1-philmd@linaro.org>
References: <20230220150515.32549-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

hw/usb/u2f.h was added by commit 80e267f1d1 ("hw/usb: Add
U2F key base class"), almost the same time of the automatic
conversion done by commit c821774a3b ("Use OBJECT_DECLARE_TYPE
where posible"). Manually convert to OBJECT_DECLARE_TYPE().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/u2f.h | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/hw/usb/u2f.h b/hw/usb/u2f.h
index a408a82927..8bff13141a 100644
--- a/hw/usb/u2f.h
+++ b/hw/usb/u2f.h
@@ -31,22 +31,16 @@
 #define U2FHID_PACKET_SIZE 64
 #define U2FHID_PENDING_IN_NUM 32
 
-typedef struct U2FKeyState U2FKeyState;
 typedef struct U2FKeyInfo U2FKeyInfo;
 
 #define TYPE_U2F_KEY "u2f-key"
-#define U2F_KEY(obj) \
-    OBJECT_CHECK(U2FKeyState, (obj), TYPE_U2F_KEY)
-#define U2F_KEY_CLASS(klass) \
-    OBJECT_CLASS_CHECK(U2FKeyClass, (klass), TYPE_U2F_KEY)
-#define U2F_KEY_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(U2FKeyClass, (obj), TYPE_U2F_KEY)
+OBJECT_DECLARE_TYPE(U2FKeyState, U2FKeyClass, U2F_KEY)
 
 /*
  * Callbacks to be used by the U2F key base device (i.e. hw/u2f.c)
  * to interact with its variants (i.e. hw/u2f-*.c)
  */
-typedef struct U2FKeyClass {
+struct U2FKeyClass {
     /*< private >*/
     USBDeviceClass parent_class;
 
@@ -55,12 +49,12 @@ typedef struct U2FKeyClass {
                             const uint8_t packet[U2FHID_PACKET_SIZE]);
     void (*realize)(U2FKeyState *key, Error **errp);
     void (*unrealize)(U2FKeyState *key);
-} U2FKeyClass;
+};
 
 /*
  * State of the U2F key base device (i.e. hw/u2f.c)
  */
-typedef struct U2FKeyState {
+struct U2FKeyState {
     USBDevice dev;
     USBEndpoint *ep;
     uint8_t idle;
@@ -70,7 +64,7 @@ typedef struct U2FKeyState {
     uint8_t pending_in_start;
     uint8_t pending_in_end;
     uint8_t pending_in_num;
-} U2FKeyState;
+};
 
 /*
  * API to be used by the U2F key device variants (i.e. hw/u2f-*.c)
-- 
2.38.1


