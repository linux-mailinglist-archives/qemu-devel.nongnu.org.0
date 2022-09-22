Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B005E6B41
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:51:59 +0200 (CEST)
Received: from localhost ([::1]:55974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obRIk-00086v-Mc
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBA-0002CI-DS
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:10 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB8-0005Ri-DS
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:59 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 z13-20020a7bc7cd000000b003b5054c6f9bso1181426wmk.2
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=qX86iXQWy4diJSSYD9PIr2CHjWMIxQY9Dao4svxApxw=;
 b=Yv6LuHE6V79ZfzLRyigT5YQlR86s3F7vRTGb1rN/+oCXugUM2wCOUpLICCmU8mrabT
 whwmkR0F96Rc7VMkTiApsKnUQco5vc/q+ud1hPrSYCpSw/jwt14eDjLuq4zP08J41xx1
 tZrGqKxZD9Jpz1QK01Dexr+IWGS28YqtuP3NMvFt3wzzGfVC0GIPamqvpWPt1lsVkrcQ
 YxG3wXhvMR7pmFCXMJx3prTk6pu0dOEiYbfwND3ywDwWLWoK+0+45w4yI2bB+q9rhvTg
 R5HrrwmUFfEs6QchNLm1irqulY23lviN1fS10xX+PRMVAoc6konKp5VwWnY6o4a/a94K
 nq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qX86iXQWy4diJSSYD9PIr2CHjWMIxQY9Dao4svxApxw=;
 b=KcY/FhQ6fS/t4xLrGZz7RhO8gUoahpzMdrKeUQtpHCBUwiHUOYMSZCtUADyLrLHFEd
 rw8TTtHTdSAM9u35UmXss2sNQy8TbH3wp2KOypa+cQNDAe2LEmK87b0KdbfdNL8at3Yp
 /h9P2FSv0Dhv48RtHt5pIm640reLNSO/XmY0NH3HGghkfpG0THdTIGhZ8KH2Zns2UwFo
 ZKaGtXM2BeWAMoPoxthIyWjHtCqSx+IUYLv3vMn0NyamwnmiBTxbE6Gz2hiupjPIryV1
 GJ4a1aiJlnzhuJIM5xAqfK6Ni8kQYvI/GejDKv1zDT/AtUSq1mrt+EkZpjotJUo5iQr9
 jzxg==
X-Gm-Message-State: ACrzQf2XLzmVAIRseMmRbveF1QDjVxNN6liZgNX5Qz0NUxNZuVu6qDW3
 vNMeTgoginxG3py/6iFB/b8WZp7xIfGpWA==
X-Google-Smtp-Source: AMsMyM5HddHVlowuOv4OsGqMML3ch2ZRK39b0sRWxNAaZGCpW8FGps+vQErO2gbetXL9S9ab7xHPWw==
X-Received: by 2002:a05:600c:3ba0:b0:3b4:8ad0:6c with SMTP id
 n32-20020a05600c3ba000b003b48ad0006cmr9998060wms.186.1663864554831; 
 Thu, 22 Sep 2022 09:35:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/39] io/channel-websock: Replace strlen(const_str) by
 sizeof(const_str) - 1
Date: Thu, 22 Sep 2022 17:35:22 +0100
Message-Id: <20220922163536.1096175-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

The combined_key[... QIO_CHANNEL_WEBSOCK_GUID_LEN ...] array in
qio_channel_websock_handshake_send_res_ok() expands to a call
to strlen(QIO_CHANNEL_WEBSOCK_GUID), and the compiler doesn't
realize the string is const, so consider combined_key[] being
a variable-length array.

To remove the variable-length array, we provide it a hint to
the compiler by using sizeof() - 1 instead of strlen().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220819153931.3147384-5-peter.maydell@linaro.org
---
 io/channel-websock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io/channel-websock.c b/io/channel-websock.c
index 9619906ac36..fb4932ade70 100644
--- a/io/channel-websock.c
+++ b/io/channel-websock.c
@@ -32,7 +32,7 @@
 
 #define QIO_CHANNEL_WEBSOCK_CLIENT_KEY_LEN 24
 #define QIO_CHANNEL_WEBSOCK_GUID "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"
-#define QIO_CHANNEL_WEBSOCK_GUID_LEN strlen(QIO_CHANNEL_WEBSOCK_GUID)
+#define QIO_CHANNEL_WEBSOCK_GUID_LEN (sizeof(QIO_CHANNEL_WEBSOCK_GUID) - 1)
 
 #define QIO_CHANNEL_WEBSOCK_HEADER_PROTOCOL "sec-websocket-protocol"
 #define QIO_CHANNEL_WEBSOCK_HEADER_VERSION "sec-websocket-version"
-- 
2.25.1


