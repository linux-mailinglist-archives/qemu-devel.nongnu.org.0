Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAD66F5479
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:19:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8ci-0003Jo-Ed; Wed, 03 May 2023 05:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8ce-0002wt-4H
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:18:04 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8cb-0000Lt-Lt
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:18:03 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2f58125b957so4864440f8f.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105480; x=1685697480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HhmcuF0/XnbOqyb1HjLMiE2Zylh3hHKPmhLHcsVGruI=;
 b=qLEp+nG1f3adaolUGZ6GSck6bsB3/e8KafzOWa7UzMgPRSBsU6B0jg8Pobyoy0X4ky
 EbnW/W59JcXvrVmBDDRs/JzGlBAYmnA+sPaMUOaNIVQlAiv886VoxDg8s5GcUF4X6ol8
 70hSXHVoQR1HbyxDL0Opm/GePhPXsTLBgbCmpelh3vizn7a2lkHjAczFMhhhxUeG4JSU
 VlfNP+cw3ikIKl0DlzaXSRg2hx51Kg3R+DQ8QYZ2JOnV5BS/QlBqqXD3TNQO/gNr9Ijh
 MAc0xDUrR6kqrJode+ZFj6j3LfDeFgvzjO+q/KgiQl6BccVKHEG5e//WCSKmrRlTRg4U
 D36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105480; x=1685697480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HhmcuF0/XnbOqyb1HjLMiE2Zylh3hHKPmhLHcsVGruI=;
 b=RrSsECf20xW4JVHHqQkpxWiB1bKK+CJ675o2+vAtXEz+al9a54UE9bv5KEW3fj75xa
 p8K9HAU+ZvrefcILp7VTlF/X903++U+OjOjI3TzuZVCqPmPgxc25Zm/qLQb6SvPBWWCQ
 j5dp0VcZUOOPRaFfIjRCTLbWEUC2obJLi5A5YAjTmPPmi75M5un3Efn33H27tZvpqo49
 gtodJWcY9KvpuAEwwJ+LW2AdaZYN+zdJQpDiyScyNWlphHmU+nZRNgD52EQb25YkCLnC
 dd9BOv1qog8urzDhjJ7TRaThHTqoC7iRUkmyt/SYMpX40ZlZxB9VGXJZ1GkY4byuympf
 cSnQ==
X-Gm-Message-State: AC+VfDwCJoX9QPfNeZf5O2r+OZ8rjgg86Da3pFaO3bnRPVYeLoBZmVWH
 ADCwNMQw1RXEPdMFry/qwl+WVQ==
X-Google-Smtp-Source: ACHHUZ7HmZxq9LpFYr/7s3AsjpyUTwbB1s7qLjvYXOEQPjKrEaEYCPsO2T0BtBE48q6PyRsOUz1gog==
X-Received: by 2002:adf:cc85:0:b0:306:34ae:6a16 with SMTP id
 p5-20020adfcc85000000b0030634ae6a16mr4304809wrj.35.1683105480039; 
 Wed, 03 May 2023 02:18:00 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfe10f000000b00304832cd960sm23319951wrz.10.2023.05.03.02.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:17:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 88B951FFC2;
 Wed,  3 May 2023 10:17:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 05/10] qapi: make the vcpu parameters deprecated for 8.1
Date: Wed,  3 May 2023 10:17:51 +0100
Message-Id: <20230503091756.1453057-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091756.1453057-1-alex.bennee@linaro.org>
References: <20230503091756.1453057-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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


