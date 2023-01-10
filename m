Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E40666479C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:44:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIbO-0003ns-8t; Tue, 10 Jan 2023 12:39:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb9-0003Zv-QI
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:43 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb5-0001Ce-Al
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:43 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so10701119wms.2
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3efp7i/kAcT0mSvJTtxOgGsEOMU+SonxpGs9nYXT4Ro=;
 b=ycbGXSmgkgH0kzY6HX8SB4y/Mw8TOfLmp3dcjSjBBSvxXu1y/N0yB9yORzNTLfPQa6
 nPe6MMOtGc16l9tehHE8UyYm9Fff4NaXIk3D3ot4oXzSQxBUaOlylGL8ZE/jbiBn9l9j
 pAUiqv5SXD66qgRd9Fhqafc1YJ6k0dod07Bkqtv9JZ5BdQmevJidJV0kij3N1TY2nSyG
 5x25mlBhKrJ0DtnFLK4Vg+8cvLDgOfEe9GInEXgNnC5x97bWds9nAGu62SDxLO86H6GK
 kKqR+OpBnOlFmacF+MQfW4JUpmthPN9ZY/ivMYXhyYTOsyd/qai2AKQniUhh0InFIp4h
 jH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3efp7i/kAcT0mSvJTtxOgGsEOMU+SonxpGs9nYXT4Ro=;
 b=rDBp/wRH36iGPK3uDNg2XBF//Brg2IVcmjKyN9JyPy6VS3ZkirAmUcCk78W4aygN36
 dIla8LilNxWfzBmx0eBys9HS2sOb4hksJfUoDJD9hCB4FbVR4C9tmTypRv+FoFaKqa4v
 qoEWZi8U8EL4ptMs3d4BpJlTv87nG17V0SRfMdLc+q/4leNllsSfy73txRufBD2EglX7
 MPgLX20FmjT3a9Qtiue3sxVMG4Qvo1nFlvahR0m0vqx2RlFG+D869aNJbI+++S968TJk
 qR+mwzs2VXwKt3yUOhj5OBs75m+AgpBJxIFOSWHwBLjDKrxQvGkyvMTAEWfaQ2/s7WsX
 h3pg==
X-Gm-Message-State: AFqh2kpoDCHg/V17w9cQjxC2CBexCRyuM4Qqfzf8srR7K41Agl8Q94kl
 EVVuuGMzb3hvJSHxgp/8ijgSng==
X-Google-Smtp-Source: AMrXdXtocgTK+53ZCPWsdRm0M9n/n/xyavNEbxbA2mNNcA0JNGd090sVZ3nQnteNgHjNLTy30qqu1Q==
X-Received: by 2002:a05:600c:33a5:b0:3d3:5a42:bd5d with SMTP id
 o37-20020a05600c33a500b003d35a42bd5dmr50138053wmp.32.1673372378624; 
 Tue, 10 Jan 2023 09:39:38 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c511300b003d9862ec435sm3763112wms.20.2023.01.10.09.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:39:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 081B21FFCE;
 Tue, 10 Jan 2023 17:39:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ed Maste <emaste@freebsd.org>, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>, Emilio Cota <cota@braap.org>
Subject: [PATCH 25/26] tcg: exclude lookup_tb_ptr from helper instrumentation
Date: Tue, 10 Jan 2023 17:39:21 +0000
Message-Id: <20230110173922.265055-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

From: Emilio Cota <cota@braap.org>

It is internal to TCG and therefore we know it does not
access guest memory.

Related: #1381

Signed-off-by: Emilio Cota <cota@braap.org>
Message-Id: <20230108164731.61469-4-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tcg/tcg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index da91779890..ee67eefc0c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1652,8 +1652,10 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     op = tcg_op_alloc(INDEX_op_call, total_args);
 
 #ifdef CONFIG_PLUGIN
-    /* detect non-plugin helpers */
-    if (tcg_ctx->plugin_insn && unlikely(strncmp(info->name, "plugin_", 7))) {
+    /* flag helpers that are not internal to TCG */
+    if (tcg_ctx->plugin_insn &&
+        strncmp(info->name, "plugin_", 7) &&
+        strcmp(info->name, "lookup_tb_ptr")) {
         tcg_ctx->plugin_insn->calls_helpers = true;
     }
 #endif
-- 
2.34.1


