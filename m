Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082496E97D7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:01:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVlw-0003t4-12; Thu, 20 Apr 2023 11:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVlt-0003rY-MW
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:00:29 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVle-00046f-SL
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:00:29 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2f7a7f9667bso432212f8f.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682002813; x=1684594813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7c0u+6tu/GA25VLPoFXf3gYwuh1yw4lMCNZi+OT6T50=;
 b=Jlfv/8yKBbDTOyaR/7kh9FT64Lzji0y07XTUMtLuH5raeSVVEi/Uf1lE5Sy1YkSIoR
 OHrtkxuOi/qtlpN5q8vv2vyjWAMbWAL59GmdmAskqTtjbz8mrvaGtdbmfrskUiGSj7hD
 iREMFoWA8gr/Cga8ipE7xKLQK3TY1nx5f3Uwn9IW5v1xHhj1CLoZABHS+M0e50fojOAb
 Py8yPYgo7LlQm9vXxfP9Pl7PvaDvTASQxeS5CY0tTq+4NpliZnTvEhfc/0+cklg+AjTk
 M8+tntnj3P3If/crMUvSiIsW5VwRhJjuY7BR6eXAzY0ZJv0unbEVMG4CPxpB4aWCKgjl
 U0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682002813; x=1684594813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7c0u+6tu/GA25VLPoFXf3gYwuh1yw4lMCNZi+OT6T50=;
 b=YHlIt5LLilSnfq26NpyoogW5sDLMGd3VGV1JQ3LmSpmiXC2RjKSB25f0qtovoLgk88
 EVR8NOcJmcTQRKfuG3k2xrVokTIQbpx1uaf4rwCoFy8/2LJzD8xavR1Uk+qOkCYh06JG
 0mGFDiDWNVK5BYnxUamYm8f/97+7tCXidFDdlJPq0gqiSmFBr56NcDGrKmF6oBwdc1xO
 iLrtgg56fcGno/1CV76VwcCOmkpC+ZjHkykK/xVvXHUp46cHbkQUS52Mc4CxUyvSciJA
 Q2ODH5LNWZGGGkopPa0eQzf7aC96Sspkv3d4/z20H2GW6i44gNvgePzS3bNc6XH+MtNi
 EEvQ==
X-Gm-Message-State: AAQBX9fDar8eXJqkvA7f1+jfwluSVus7jFo9K88Fk6WHmEbwIij2F2Ye
 axlTPZvvsbq2E+bUqjg1hTHMLw==
X-Google-Smtp-Source: AKy350YqURsJwWsX/64PWxzpg0NTVeJPRwJwKeki/ZIuoKARQ//Qk99eaN8hbrW5Y8K2puw+sjJp4w==
X-Received: by 2002:a5d:5442:0:b0:2f5:930:39b1 with SMTP id
 w2-20020a5d5442000000b002f5093039b1mr1546684wrv.38.1682002813492; 
 Thu, 20 Apr 2023 08:00:13 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q13-20020adfcd8d000000b002d7a75a2c20sm2110041wrj.80.2023.04.20.08.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:00:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 82D7B1FFBD;
 Thu, 20 Apr 2023 16:00:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Riku Voipio <riku.voipio@iki.fi>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 05/10] qapi: make the vcpu parameters deprecated for 8.1
Date: Thu, 20 Apr 2023 16:00:04 +0100
Message-Id: <20230420150009.1675181-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420150009.1675181-1-alex.bennee@linaro.org>
References: <20230420150009.1675181-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I don't think I can remove the parameters directly but certainly mark
them as deprecated.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 qapi/trace.json | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/qapi/trace.json b/qapi/trace.json
index 6c6982a587..74dd66ef4a 100644
--- a/qapi/trace.json
+++ b/qapi/trace.json
@@ -33,9 +33,9 @@
 #
 # @name: Event name.
 # @state: Tracing state.
-# @vcpu: Whether this is a per-vCPU event (since 2.7).
+# @vcpu: Whether this is a per-vCPU event (deprecated since 8.1).
 #
-# An event is per-vCPU if it has the "vcpu" property in the "trace-events"
+# There are no longer any events with the "vcpu" property in the "trace-events"
 # files.
 #
 # Since: 2.2
@@ -49,19 +49,15 @@
 # Query the state of events.
 #
 # @name: Event name pattern (case-sensitive glob).
-# @vcpu: The vCPU to query (any by default; since 2.7).
+# @vcpu: The vCPU to query (deprecated since 8.1).
 #
 # Returns: a list of @TraceEventInfo for the matching events
 #
 #          An event is returned if:
 #
 #          - its name matches the @name pattern, and
-#          - if @vcpu is given, the event has the "vcpu" property.
 #
-#          Therefore, if @vcpu is given, the operation will only match per-vCPU events,
-#          returning their state on the specified vCPU. Special case: if @name is an
-#          exact match, @vcpu is given and the event does not have the "vcpu" property,
-#          an error is returned.
+#          There are no longer any per-vCPU events
 #
 # Since: 2.2
 #
@@ -84,16 +80,12 @@
 # @name: Event name pattern (case-sensitive glob).
 # @enable: Whether to enable tracing.
 # @ignore-unavailable: Do not match unavailable events with @name.
-# @vcpu: The vCPU to act upon (all by default; since 2.7).
+# @vcpu: The vCPU to act upon (deprecated since 8.1).
 #
 # An event's state is modified if:
-# - its name matches the @name pattern, and
-# - if @vcpu is given, the event has the "vcpu" property.
+# - its name matches the @name pattern
 #
-# Therefore, if @vcpu is given, the operation will only match per-vCPU events,
-# setting their state on the specified vCPU. Special case: if @name is an exact
-# match, @vcpu is given and the event does not have the "vcpu" property, an
-# error is returned.
+# There are no longer and per-vCPU events so specifying it will never match.
 #
 # Since: 2.2
 #
-- 
2.39.2


