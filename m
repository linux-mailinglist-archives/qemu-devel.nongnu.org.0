Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AD3599EC9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 17:50:46 +0200 (CEST)
Received: from localhost ([::1]:60990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4Gj-00064h-7u
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 11:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP468-0005fH-L4
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:48 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP463-00064H-IW
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:48 -0400
Received: by mail-wr1-x42d.google.com with SMTP id h5so4808899wru.7
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 08:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Zg9fu5qHwdrrZhY9h0fcERwtTu8sDUqtYMAjp6fh9AE=;
 b=gVjmmY/hxoqNMWTlk4nX/AeiWWNR626hHESiulMtw709ydBi4zvE+eZZ9EAP45cWgD
 C0GGnbzJOXYEN9icePhlG73AzCvExVZhHKbDh5b3FOwfhaN9whwWpvRd4Q0+qy8pn/Vb
 XPo/EqIblD0LOqw2HiCxSWmj+F+5NCRhZaNmf1XI+LAQpFFf9vOlihCSQqgaCR+jsMce
 dVQstpq44+mX7D4o0IuUWwSucL3GJOreLTWzl4Ya4a9DjxSxk0y9cIiSTLodUVrKwbIO
 O82pzxKNBe78L36vrQ2JUkCvNKsVtVIX7+tU7hCXaeIhPcEPXMZJRF7hzkaf8kZECil6
 464Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Zg9fu5qHwdrrZhY9h0fcERwtTu8sDUqtYMAjp6fh9AE=;
 b=JiBXT1tcV6Ac5D+dpHCFe9TvhxB2Phq1ujXc5wswKGoLliaes4o8dvsmfA/L3lF8VR
 3vOV/8iCdjjx4lfEP6zDUIteuEaUQ51ZtxVYB0fyCugURm/geBrY8A5aJm9UDg5rrHAA
 sjmZejmnPkDebCn9At1DWDTrhlq7IC2VmW7+TfHwGhcXXsMa1TziNd2vE7Cc3yLQysc9
 JL5OLkmc0F3DR5ISuIt0me64KWeNTNCXJ4wxpsJzdue+x2CKShfy42AiO29h9mGZ46YE
 M5L+W/gNPolKsfW65xEUNEVAMHrTI7aHtepCIYl9vOONf9iIF7MQvfhazojRq8N2lXXB
 v0Eg==
X-Gm-Message-State: ACgBeo0efClFe1goHFqPrrT7dFGe/QM11IMT1X+AI3y+Y2XBVAl60JZl
 z4UHBjnTUqDUaqIVlvPpTB5vWT4k8WmqEA==
X-Google-Smtp-Source: AA6agR4ArLL1jSZaCjaGq2lLlZO17GBCUbsPBa8DewIS4jWVQAS173iTACiEc1+ZHI07BUadwB9tew==
X-Received: by 2002:adf:f18d:0:b0:225:3a78:cef0 with SMTP id
 h13-20020adff18d000000b002253a78cef0mr1933636wro.578.1660923580049; 
 Fri, 19 Aug 2022 08:39:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b003a54109a6a0sm5558396wmb.3.2022.08.19.08.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:39:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 04/11] io/channel-websock: Replace strlen(const_str) by
 sizeof(const_str) - 1
Date: Fri, 19 Aug 2022 16:39:24 +0100
Message-Id: <20220819153931.3147384-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819153931.3147384-1-peter.maydell@linaro.org>
References: <20220819153931.3147384-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


