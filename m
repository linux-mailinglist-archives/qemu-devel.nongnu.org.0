Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AEC3C1A3E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:58:05 +0200 (CEST)
Received: from localhost ([::1]:35306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1a9s-0004zK-Qp
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWb-0002b5-8v
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:29 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:44561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWY-0007Xa-2P
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:28 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 i2-20020a05600c3542b02902058529ea07so4718413wmq.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1h84YElBs0lvJoVGYIgs0VI8lqeK9O8muT/nnP9fJ6Q=;
 b=hPPE2gO46NXah1NC5HCsus2mCSo9+W9MTFNZT55qkP4DbU5HAuJ5wfbpclz4AyvONe
 GP6BQHFdTs7OSzIC2ukraF5K//zJ1v6fDsxhah9jTdf0B6UBvpDWQkVir9jo2Nx9x8mL
 a1e3kSSU/QB26+ynz31pC3wzvqHyjjdGzb89w6JNgYXD4CIvltNx9rL6mSwD49vzJalv
 WBRKKvIMf66j5y7GTejghs3RXE+yrT6NmkvVPYSnOL52vbpyI7WUMo+aXiPJ9Lujf8pf
 P2eWVJpughypFYfGB5/lNrCOsTrs8kMaxFBIBB/NJC0rEQQMCbUC6AtoCrR1c/gD+/HK
 p8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1h84YElBs0lvJoVGYIgs0VI8lqeK9O8muT/nnP9fJ6Q=;
 b=pMj9qyI4zNOf0qUQimHPmMmHZ+nBQ67sogvvltrqjXTNCK59WxIAnmPColmJ7QfwT4
 qMLd6FsK7I1xXIypY5D599S/aH1rkJj58BhMVUzD5I3uOrXo5WuLMj+GIOS+W3NXm0+I
 S3DJmmsc8QubsMzlZXKOYDYEFA95rw0DGEgN/7s3sp5ONRDQQZGa5oI73aCgk9AasYfV
 hYNQwtZPVJm3mAuX4fY9i7Zj9jpDqgA4MKfLZE0XlB7UlUTJjmB2DnIfwIXlVI7Mprhd
 aJ99umt2aORSSWEN0zfRJGpJ8KUrdLHSOoQgk1a/v389zNtCR3t/eCIB9Mhj0ITfBvff
 CRFA==
X-Gm-Message-State: AOAM5321bDMjscp1pabY35iVznRM9mS1SfMzmGY+QZRIIavHZZQ2PZV4
 jW9JUXcYZvbZP06mpAxeWYi3r+kNvrd6aw==
X-Google-Smtp-Source: ABdhPJxC/7Dt0vuYR0DHrXUKj9rm7xqC7sGyuziukYoSK5BjkC6onwPkArvaL5zKlm0PRqTt03WRmA==
X-Received: by 2002:a05:600c:220d:: with SMTP id
 z13mr6922203wml.67.1625771844715; 
 Thu, 08 Jul 2021 12:17:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 11sm5289184wmg.40.2021.07.08.12.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:17:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D06B91FFAF;
 Thu,  8 Jul 2021 20:09:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 26/39] tests/tcg: make test-mmap a little less aggressive
Date: Thu,  8 Jul 2021 20:09:28 +0100
Message-Id: <20210708190941.16980-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The check_aligned_anonymous_unfixed_mmaps and
check_aligned_anonymous_unfixed_colliding_mmaps do a lot of mmap's and
copying of data. This is especially unfriendly to targets like hexagon
which have quite large pages and need to do sanity checks on each
memory access.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/test-mmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/tcg/multiarch/test-mmap.c b/tests/tcg/multiarch/test-mmap.c
index 11d0e777b1..b77deee37e 100644
--- a/tests/tcg/multiarch/test-mmap.c
+++ b/tests/tcg/multiarch/test-mmap.c
@@ -58,12 +58,12 @@ void check_aligned_anonymous_unfixed_mmaps(void)
 	int i;
 
 	fprintf(stdout, "%s", __func__);
-	for (i = 0; i < 0x1fff; i++)
+	for (i = 0; i < 0x1ff; i++)
 	{
 		size_t len;
 
 		len = pagesize + (pagesize * i & 7);
-		p1 = mmap(NULL, len, PROT_READ, 
+		p1 = mmap(NULL, len, PROT_READ,
 			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
 		p2 = mmap(NULL, len, PROT_READ, 
 			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
@@ -142,7 +142,7 @@ void check_aligned_anonymous_unfixed_colliding_mmaps(void)
 	int i;
 
 	fprintf(stdout, "%s", __func__);
-	for (i = 0; i < 0x2fff; i++)
+	for (i = 0; i < 0x2ff; i++)
 	{
 		int nlen;
 		p1 = mmap(NULL, pagesize, PROT_READ, 
-- 
2.20.1


