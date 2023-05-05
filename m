Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337926F8642
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 17:54:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puxkl-0003PO-2o; Fri, 05 May 2023 11:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puxke-0003LR-LT
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:53:44 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puxkc-0008DF-Cm
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:53:44 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2f95231618aso1335725f8f.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 08:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683302019; x=1685894019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v20eKJJJVW047Oo0oTM1wQXqOht2ZgPK9mBl9bJ8pSc=;
 b=VLlTXE2z8p9t2Sm42UpKGi9VxkBaSZTpMnPl9EnsCEgNHMWALAr1NYn9gVwyac3Wn8
 JfydF7+E5vl2ncV3KOjfuHwmH2IZ9dPSTP2RGWK9Y9ZGCP8grvUyy5kwU9ehWM8nRT5Z
 hv7WjhmQXwzTXBSmgoKTCrBP3wINIVLBni1ywcC1iWh4mk4xrjW0eNl782EJTCPJz2kP
 7/lYwbLqrk8v+B8/zX6M25yvXJDVzbziaRyvUjvM8R8wgwmtEdESuBddIG5yfLtS3btu
 brvtgLXlphhgTZ9xCd929602JuDqeV/CnJ7PqbXHakNb0IznPYuSZNUBrCGaOvVHNiIG
 B5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683302019; x=1685894019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v20eKJJJVW047Oo0oTM1wQXqOht2ZgPK9mBl9bJ8pSc=;
 b=kSkEOUNRDVOU+pspVoPk7HB7u53MuqC7RYfBgQV6gbJJoUT21mL+wfJkNIsMdYpZ6m
 wPZ3gq+fGXBm6rYUS/fdXzE+qu/aJCuvic1L2+k+RI2qbds1E2fhu4omZE2HNYWKIiZu
 bE7Rk6IxMy5f5R/am14HHS8vH5HGMbE41SRDrsauOZB1vWIdXOY1aKwoeZWlHIWl0HnP
 XV42zdMkfC56wvwmrRaO9Qgob/R6zkWd4OrRL21c4dOugRFWEaHcsAOeOb2jhUDI8zJA
 FUlCRLWkmLv02d3ckwqtbVOQzlRCqHzi5fBWkLFChLiCqbCWe4P1vc3NPu42e/ItZqQU
 Lckw==
X-Gm-Message-State: AC+VfDw8IZlAW1ZJVQCFzg6U+jNrQzdMTgYFaaFAql+quyt9hco6bDOl
 d0fiK4tm1cAWGQCdsuK5WtAMYw==
X-Google-Smtp-Source: ACHHUZ4zNCPyQq7DcRZnTPcpiLKgVNGNqUmqgx+30CR39ciIkuxnGAozXGeWiJaPzeZaEZxIlW7Zhg==
X-Received: by 2002:a5d:6711:0:b0:306:39f5:e1a8 with SMTP id
 o17-20020a5d6711000000b0030639f5e1a8mr1687533wru.14.1683302019526; 
 Fri, 05 May 2023 08:53:39 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c294200b003f17eded97bsm8391476wmd.19.2023.05.05.08.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 08:53:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 236B31FFC0;
 Fri,  5 May 2023 16:53:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <michael.roth@amd.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 05/10] qapi: make the vcpu parameters deprecated for 8.1
Date: Fri,  5 May 2023 16:53:31 +0100
Message-Id: <20230505155336.137393-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230505155336.137393-1-alex.bennee@linaro.org>
References: <20230505155336.137393-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I don't think I can remove the parameters directly but certainly mark
them as deprecated.

Message-Id: <20230420150009.1675181-6-alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230503091756.1453057-6-alex.bennee@linaro.org>
---
 qapi/trace.json | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/qapi/trace.json b/qapi/trace.json
index f425d10764..de6b1681aa 100644
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
@@ -84,17 +80,13 @@
 # @name: Event name pattern (case-sensitive glob).
 # @enable: Whether to enable tracing.
 # @ignore-unavailable: Do not match unavailable events with @name.
-# @vcpu: The vCPU to act upon (all by default; since 2.7).
+# @vcpu: The vCPU to act upon (deprecated since 8.1).
 #
 # An event's state is modified if:
 #
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


