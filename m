Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6581221E721
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 06:53:00 +0200 (CEST)
Received: from localhost ([::1]:40260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvCw7-0005jQ-EU
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 00:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jvCuh-00044V-2W; Tue, 14 Jul 2020 00:51:31 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:35174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jvCuf-0004tq-Ky; Tue, 14 Jul 2020 00:51:30 -0400
Received: by mail-qt1-x829.google.com with SMTP id b25so11917396qto.2;
 Mon, 13 Jul 2020 21:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PBERzEG1GysXrcTH7gh8mB6ppyy7Uo8bs5uoGDwt1Fs=;
 b=Cn5eHwOZrScNQnscimp5IIcuOk94pEqIzHfq6YJzxb3TXexWrSORio/EbauMdx27O8
 7fJKurH2Yupq2GydQSaCI6a9zMpYq+P07h29YNy/TSYFR4XtdefjngUzmD/5Gice7EZs
 p6fGmq9AdI8HFeaJIAr0bzrpFfe81ofDJbtJA1COuCwMovjXxxxSlJ1Mw8Ebejwvb0+z
 TNZkx7D7RMNKnYh92DRAqgd4fWYRNizvdC1Mj0dLglLB4xdrjA9RElJrqjZjvX7s4QYU
 tWO8/oNZY+9Zvmzue3inM8n9jmUvkomp3+tcmMtipB1sBq4cSEX4iF589QTvNdEhtuY2
 BWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PBERzEG1GysXrcTH7gh8mB6ppyy7Uo8bs5uoGDwt1Fs=;
 b=nrr+JEX1b90gQgNLmW3ti9bAIC/rX0X158Hrk8JstYH5od7jCsH1sGw2Tnh4L+wlZI
 tiXaHJPEQi4R2tuLhq9u3Kuivm3jAmWMO8wmv1siSZd/wmxe8wR9uos+dIh2zoADM0Ay
 SCuaxYEJXC2GHmmeC3buhHQYFHCHXZ9XZ5+mYX7JFmRgBJSgYzE0Hw7AbgoucAsgIzq6
 VxFJwHmru7ItXE/2smdwZce0+PD9VMD5UoLI6LFB+8G1HZS/TmBtYV/gqjXAX9VeCYmj
 mqKnh9wASOucwfCWHhxHa23x4sqlcgznih2cEuXfBE9ThOshpaZ9YNNgZ0wtjB2MeK/B
 1V2A==
X-Gm-Message-State: AOAM530P5ErWU6cFHnFAiLaPwkm8bu+Rr/92ZEpp/E3/ngE9T5HPsB9h
 Ga5w15ZGYvf+0qVrjtgQHAnHTu95
X-Google-Smtp-Source: ABdhPJy0Ps7369osGxGFHDrbyAKxkSKcwLMj7vIgQ1CSyuk4Z/wqZMW053tdnMwNhIUvc475m/ZQ8g==
X-Received: by 2002:ac8:33f8:: with SMTP id d53mr2849248qtb.80.1594702288048; 
 Mon, 13 Jul 2020 21:51:28 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id p3sm20518750qtl.21.2020.07.13.21.51.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Jul 2020 21:51:27 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] qga: fix assert regression on guest-shutdown
Date: Mon, 13 Jul 2020 23:51:12 -0500
Message-Id: <20200714045114.29319-3-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200714045114.29319-1-mdroth@linux.vnet.ibm.com>
References: <20200714045114.29319-1-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=flukshun@gmail.com; helo=mail-qt1-x829.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-stable@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since commit 781f2b3d1e ("qga: process_event() simplification"),
send_response() is called unconditionally, but will assert when "rsp" is
NULL. This may happen with QCO_NO_SUCCESS_RESP commands, such as
"guest-shutdown".

Fixes: 781f2b3d1e5ef389b44016a897fd55e7a780bf35
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Reported-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Tested-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 qga/main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qga/main.c b/qga/main.c
index f0e454f28d..3febf3b0fd 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -531,7 +531,11 @@ static int send_response(GAState *s, const QDict *rsp)
     QString *payload_qstr, *response_qstr;
     GIOStatus status;
 
-    g_assert(rsp && s->channel);
+    g_assert(s->channel);
+
+    if (!rsp) {
+        return 0;
+    }
 
     payload_qstr = qobject_to_json(QOBJECT(rsp));
     if (!payload_qstr) {
-- 
2.17.1


