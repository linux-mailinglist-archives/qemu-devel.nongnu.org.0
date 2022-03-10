Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4484D47C8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:11:08 +0100 (CET)
Received: from localhost ([::1]:50868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIZO-0007dW-Ix
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:11:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9s-0006tk-Fp; Thu, 10 Mar 2022 07:44:44 -0500
Received: from [2a00:1450:4864:20::336] (port=36734
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9q-0005EF-NI; Thu, 10 Mar 2022 07:44:44 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 n31-20020a05600c3b9f00b003898fc06f1eso5373779wms.1; 
 Thu, 10 Mar 2022 04:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KMGJQJyg47oETIlu7zseDa10e+nmFOAp33O9axXT85I=;
 b=ZHOB+e7yDZyHcAeSWCHeruf9MeXz6Yvywr/gPhG1uvqUDsyTum4ck9GWokklaMxaZj
 W1tE9Xw/Pr05oDG+g7cRgNFPWT1XouQ4lVBgsmvnLFlnT/E+8+Mej6itwvi9gQnNCd/6
 tAX6Wxe58yFPXG1BIOefJADaKItdUAENXx3YrAwzIRUAzt23BQE7zYxUARkw8SYr8qU3
 VqE5uh8v6cDNddli67ZiW8FVIirnF5ixh/7fysHGi090my2waoSZWrNqKXEEdHyb+aN7
 eVb+adgxfDszbfR1oWphpdHr217GvxmWM6H5a+siVZ681WYndqbY59vbSsG76FIl8zic
 F3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KMGJQJyg47oETIlu7zseDa10e+nmFOAp33O9axXT85I=;
 b=jl34iNOY1CBSGiu2jJwXrD6gAxjgL651FiJdKpPjQh2EvT9fOqmQnXmrQ85RcXtv9h
 9UByhaIgXCSwO5sKTm6oWqXyCM2HzdbXkO9gjAUuLF+BBFSP/6kazRa344bMwG4LUCGf
 pqdWuyTdeYHyxqzXTs/kqb76HZJbm8Ebbs/JFirC9xqgN1hoplhA+9LpIniOJF1cPd+y
 XUrZ3BMh7EZQiCX3PbxHmQSgLC1vf6yakkunUpU/DQtY3n9JCE2ABrmkKVx3C7otKgS2
 teLDTR4BZj8M8Au9w562nJFJgNqIdCOpsyNZKM6WqFx7L9ek4JRBBIYYkM+fWfP8hhHk
 FCTw==
X-Gm-Message-State: AOAM533IGqdIB67lAmw/2CvXKXxCaZo0J3fno0X20So+lFqrM2t8dV2S
 KrZA1iUEejIqLrbq/5RlU/7QIqILTMs=
X-Google-Smtp-Source: ABdhPJyya1hMFkSxAue8Qv7giRC/AQgBveNHv5yWS9a741Sr0T2cTt+des6yndrRsLFxwzbRvyq8HQ==
X-Received: by 2002:a05:600c:4f55:b0:381:7e8d:e4a8 with SMTP id
 m21-20020a05600c4f5500b003817e8de4a8mr3471532wmq.16.1646916281009; 
 Thu, 10 Mar 2022 04:44:41 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/35] /perf/nesting
Date: Thu, 10 Mar 2022 13:43:58 +0100
Message-Id: <20220310124413.1102441-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: hreitz@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-coroutine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index 439bd269c9..75d54e5d29 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -614,7 +614,6 @@ static void perf_lifecycle_noalloc(void)
     g_test_message("Lifecycle %u iterations: %f s", max, duration);
 }
 
-#if 0
 static void perf_nesting(void)
 {
     unsigned int i, maxcycles, maxnesting;
@@ -640,6 +639,7 @@ static void perf_nesting(void)
         maxcycles, maxnesting, duration);
 }
 
+#if 0
 /*
  * Yield benchmark
  */
@@ -754,8 +754,8 @@ int main(int argc, char **argv)
     if (g_test_perf()) {
         g_test_add_func("/perf/lifecycle", perf_lifecycle);
         g_test_add_func("/perf/lifecycle/noalloc", perf_lifecycle_noalloc);
-#if 0
         g_test_add_func("/perf/nesting", perf_nesting);
+#if 0
         g_test_add_func("/perf/yield", perf_yield);
         g_test_add_func("/perf/function-call", perf_baseline);
         g_test_add_func("/perf/cost", perf_cost);
-- 
2.35.1



