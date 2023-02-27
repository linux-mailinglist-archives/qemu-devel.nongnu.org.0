Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 473416A43F6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:14:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeAz-0002iD-Ug; Mon, 27 Feb 2023 09:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeAw-0002WE-S1
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:22 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeAu-0000PC-LT
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:22 -0500
Received: by mail-wr1-x436.google.com with SMTP id r18so6381466wrx.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mB/pDWgm2BIuPhx5UcfH++r62QSUw7La1WlZAVYPtq8=;
 b=C3RoFFdjA2uZJzosvp4jan8q/NjYJwN7PP/Cfy+5B6sGZ4sMvGoVyTketMTTPfaRpl
 u9JrrQVzXg20ebVykTmT0C/2HXLeEksA0HDiASJvAn5H3YpB3rWFvuJex+FKxBt2xBPs
 7lwUe1SZHufzyJfK4oqDC4UFGicp+epg+j2x22TmStwqPkxEa7Xo6JpAk/2YW3WoRWcl
 rNNNeZxx+tdxC5leNZ3Cm5n3AZCjPKHZjOSQDJ2gHOVsrSct6IXtBEPYgrpg043kbsLZ
 TypH8BS3qyzP2zz3wvSeQqf94CAo5CO1ShvdYS+y2h5hYip8WWYBJVtMLkDq93WM/2Wu
 0BvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mB/pDWgm2BIuPhx5UcfH++r62QSUw7La1WlZAVYPtq8=;
 b=k0d0keRGO0IIb4gu5VTCrAXhhN8pHbhzyqE5pXkelQsGogvMBTMw9NL3k3nQdBZaQb
 bYhTa+WwVA/Q+yTv3cL+yPEtIC8GOxtwUdGxtYG9ckDjZ67nMhyEzYLGxNgkCob0uFop
 Z+or/3lp95CxVP1oMFTKa0vtGosXgiXt5Z2MoRkDMn9qiScy/cRD7dB84FsKFEOaGx0M
 f1XXC6ekTBtQR6nA7/Hefps6+auNg7Fnp/fMHiywq8E3oiV3GP82HEn1vk/OtsP9v2op
 9UFw+ae8s84qqFQRnrhj6i5qc0OaSs2wC6MDc0OAUsvSduI0y2kdXl2bDl1BHJcIobCR
 XqhQ==
X-Gm-Message-State: AO0yUKUJH4ZTe48Ctiah5+Lf4XXKEj1QCH2B0SgEslvPcwp1WEfBdQ2W
 qnjip6kvacQCO9zOk6qvB8hW9V3ahZlusaQ+
X-Google-Smtp-Source: AK7set8zlAHNiggIBawCJRRPXWv4zRiNKHLtfxhWluVwvl/26c1LfH9ez9j+BP+Q8dsc3GP+chOZhw==
X-Received: by 2002:adf:f0cd:0:b0:2c7:d75:373a with SMTP id
 x13-20020adff0cd000000b002c70d75373amr14817696wro.1.1677506898986; 
 Mon, 27 Feb 2023 06:08:18 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a5d4521000000b002c573cff730sm7203340wra.68.2023.02.27.06.08.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:08:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 076/126] hw/usb/u2f: Declare QOM macros using
 OBJECT_DECLARE_TYPE()
Date: Mon, 27 Feb 2023 15:01:23 +0100
Message-Id: <20230227140213.35084-67-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230220150515.32549-9-philmd@linaro.org>
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


