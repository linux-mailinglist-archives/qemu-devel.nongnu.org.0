Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D46569727
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 03:07:57 +0200 (CEST)
Received: from localhost ([::1]:48496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Fzo-0000t2-Nn
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 21:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o9FtJ-0002tc-Q2
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 21:01:13 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:45841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o9FtE-0000Qm-5r
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 21:01:09 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 145so15643356pga.12
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 18:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ciy/rVsUfuCzRTIRDYNTp21K1MImnDH8PNlQB0j83jA=;
 b=4gCeWOPDzggRrt8xQiE5SvC83J+XsDSfeUlu5bAERZJNq/HssMEJ7zJc6AbRyjcxSl
 Cp9AcUG6ujl/I8cCo4Q1nQgeUyf2lZAhD51h+lu5jFYeYclZHFW2LAoYvz6c/rdsHv6O
 3bNuybFCynlFyoD1PzBdAhz6T1WZ7fzh/BOtph59+U7o6SOwUIv7yQ9kTHnFJgO8RavT
 BLENsgFp8Xgc0YfWP77xsA5Upbay24Whz2y/29U98CCEQonmtGjtiiI6UpfNRubKcvgc
 gfQPdzzjbCdhxJlpwuQ+bsLq1x4ibyaBFJGtTpxn6+/qfrvqod2FHs57urIey/YzsqBf
 2TEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ciy/rVsUfuCzRTIRDYNTp21K1MImnDH8PNlQB0j83jA=;
 b=kuHuLoLQs7PgDe8Urrl6Ycy9AOT10X5JK8ESThO9wZjOXBhX/S9bPg6TffCnIZTDV4
 /WvvL4Dxnoqzwq7Mn0iKi5ZkaU+JE5ynXOHscE95WEnNHOz209MODzzr5Xe/3U+pAsND
 mIJLIcv4H2g4GOJWvsDesrRBnf84W5beCHbshqEXKXJCk6a72VIUOBR1f9yI94BpzcCS
 dKx/AfBwNfEiwR4LE+hnAeLv5TgaHx7BdpPqVvJhy4iL0kMBa25FYCNIyLpGVI2ZlnWb
 W7aXaou2j54bzR6PsKNLaPxFdydAePY634O8Mrl9/tFT6M7HxlEGSBLp6pyRnsEVY6qa
 MCJQ==
X-Gm-Message-State: AJIora/V6nxBME3Q6eQe4JtMvfcZ+PxElsjtTHkmoVaWWEl0qfncCFDU
 UlsGgtsdbkUr/HmjhACVCm00pQ==
X-Google-Smtp-Source: AGRyM1vknaT19jo25gJa7nw8cgf9A3HSlwZgQdUcv/DuMr8Bqt6QKE73xpbBlrkIXpuY8iOrHPvdMA==
X-Received: by 2002:a63:87c6:0:b0:411:6ef7:ca80 with SMTP id
 i189-20020a6387c6000000b004116ef7ca80mr36039730pge.580.1657155663538; 
 Wed, 06 Jul 2022 18:01:03 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.70])
 by smtp.gmail.com with ESMTPSA id
 7-20020a620607000000b00528c26c84a3sm982445pfg.64.2022.07.06.18.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 18:01:02 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: michael.roth@amd.com, kkostiuk@redhat.com, marcandre.lureau@redhat.com,
 armbru@redhat.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v4 1/2] qapi: Avoid generating C identifier 'linux'
Date: Thu,  7 Jul 2022 08:56:01 +0800
Message-Id: <20220707005602.696557-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707005602.696557-1-pizhenwei@bytedance.com>
References: <20220707005602.696557-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'linux' is not usable as identifier, because C compilers targeting
Linux predefine it as a macro expanding to 1.  Add it to
@polluted_words. 'unix' is already there.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 scripts/qapi/common.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 489273574a..737b059e62 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -114,7 +114,7 @@ def c_name(name: str, protect: bool = True) -> str:
                      'and', 'and_eq', 'bitand', 'bitor', 'compl', 'not',
                      'not_eq', 'or', 'or_eq', 'xor', 'xor_eq'])
     # namespace pollution:
-    polluted_words = set(['unix', 'errno', 'mips', 'sparc', 'i386'])
+    polluted_words = set(['unix', 'errno', 'mips', 'sparc', 'i386', 'linux'])
     name = re.sub(r'[^A-Za-z0-9_]', '_', name)
     if protect and (name in (c89_words | c99_words | c11_words | gcc_words
                              | cpp_words | polluted_words)
-- 
2.20.1


