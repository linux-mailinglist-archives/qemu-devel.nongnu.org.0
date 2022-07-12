Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1178571686
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:05:25 +0200 (CEST)
Received: from localhost ([::1]:41830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBClg-0003Nt-Ly
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBCfj-00067t-A5
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:59:15 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBCfh-0001Hj-RI
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:59:15 -0400
Received: by mail-pg1-x533.google.com with SMTP id s206so7114286pgs.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 02:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zbOxxenHaKVYrkhpq6ujndTW/g6U1Cx28IHyEc7+Fms=;
 b=I4aMdhkN8WaqfY/0E0vNob0K2snm5nOuTH1phx2VmVMZymoBYjX+Om/AGZnCd+QYIR
 2diT+V1vqWfYGgp7JBjuM1HGOaJhjKK/gC1f6a0O2nG69kumDOtHi4mkRxkkIv5awFVn
 7N+hkUTD2XD6yx5ElKjytnx4NcEMHUSgSVIVSL6/K+HkqXeQNLo0onBN4bLVaasE+FT0
 AZFAxN+uM7lGSnmw+lQ29RRnC+BuWtzKujgcm0OTdssOOsUvH975ahpt0hWGwprbdm5k
 P4+SXM71BNZBfeySAwwJpCX96rQaFX1IjLRrzGvoUbWoCXgZaYFTa3CwcdPhrHQb3Nrb
 LAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zbOxxenHaKVYrkhpq6ujndTW/g6U1Cx28IHyEc7+Fms=;
 b=vgBUGrHn+daeZKDUWxGGRi79aD4HxeyF4ojg9wZkjsa1ZDzORQlAeM9GE+FhvEcdqy
 qwADKF9IOPG/1f1RnUzeWuFsQguAy/eIua89rkdhsmnQ2pLSlRLgF2ZalaWwJj/z86o7
 LoL+Vrf7qaelytNvIj02/qOSBsG009hBnq0H/Sr38zQolaP4VOQn1pVkDjvJgkP2a8O7
 CVRVwz6nYFSmN4nb8zzL6tFDhXsJ8hvPgiydi23DRCNFWzlihicS9JxSw0ecguIvU83q
 bDlqd6xz9yhJW2rbIewUbOlASQQLh+BgLdz46Ig7xMQPGkIynvABIlTT2vGr+Q6nQFky
 BQuA==
X-Gm-Message-State: AJIora/qOroWbjWIvY0nchQmoiZq6q4MXWoFrOFiz011JFc4UhMC0vaq
 K8tXbzQ1uNYwArrb/MVUEvrvG9AonVcWCDL6
X-Google-Smtp-Source: AGRyM1vu9fM+wz3A4ViPDco8HtuG7lNr2MnVZCZxwwN6aFBbB3/dSIkutzUDorKLv/3FwqhXp+DpKQ==
X-Received: by 2002:a63:1047:0:b0:40d:7553:d897 with SMTP id
 7-20020a631047000000b0040d7553d897mr19260306pgq.485.1657619952421; 
 Tue, 12 Jul 2022 02:59:12 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 s18-20020a170902ea1200b0016bdb5a3e37sm6348990plg.250.2022.07.12.02.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 02:59:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [COMMITTED 2/3] iotests: fix copy-before-write for macOS and FreeBSD
Date: Tue, 12 Jul 2022 15:29:00 +0530
Message-Id: <20220712095901.212353-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220712095901.212353-1-richard.henderson@linaro.org>
References: <20220712095901.212353-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

strerror() represents ETIMEDOUT a bit different in Linux and macOS /
FreeBSD. Let's support the latter too.

Fixes: 9d05a87b77 ("iotests: copy-before-write: add cases for cbw-timeout option")
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Tested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220705153708.186418-1-vsementsov@yandex-team.ru>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qemu-iotests/tests/copy-before-write | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotests/tests/copy-before-write
index 16efebbf8f..56937b9dff 100755
--- a/tests/qemu-iotests/tests/copy-before-write
+++ b/tests/qemu-iotests/tests/copy-before-write
@@ -192,6 +192,11 @@ read 1048576/1048576 bytes at offset 0
 
     def test_timeout_break_guest(self):
         log = self.do_cbw_timeout('break-guest-write')
+        # macOS and FreeBSD tend to represent ETIMEDOUT as
+        # "Operation timed out", when Linux prefer
+        # "Connection timed out"
+        log = log.replace('Operation timed out',
+                          'Connection timed out')
         self.assertEqual(log, """\
 wrote 524288/524288 bytes at offset 0
 512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-- 
2.34.1


