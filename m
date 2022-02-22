Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B6E4BFDF5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:00:17 +0100 (CET)
Received: from localhost ([::1]:34116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXaK-0005FM-BK
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:00:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMX15-0002HH-0X
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:23:51 -0500
Received: from [2a00:1450:4864:20::333] (port=54241
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMX10-0004kq-Q5
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:23:50 -0500
Received: by mail-wm1-x333.google.com with SMTP id i20so1415393wmc.3
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 07:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iNk1GC4r1NZQkdGmiLeHYBRrv1/MHiJDaBIiSREAXLw=;
 b=e0na0drayEal1qwFrGymC/ReP38XU/4GU1yRoHHjuVMCqw3z0syzOnubW2ZH/vLgk+
 9/T9wQr0S8ZmmnFHHMFePp2jpgHBm5vpOyGUAIbCG4lxPHSMLLX+dRxoRlp+bpqCTT3w
 HgCvQosAQjTG2P36VnXCloGFG5n5E3a79ItwRZ+FyBmc22QJgHYyYq56K1fHfYpL8Xup
 PvFiuWRYBXv6CxfFRdQedVKt9gatqSXn6XGGVJkVvQiCU/kNCOnTkpnmKEKJ8ggo2IZ4
 3QT7AZmsgqTXjjcfVdFwaSR+ivwJejFgzMOYS1l/MnVL63gXSyXz+GoLvnGPRyg08SKy
 P/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iNk1GC4r1NZQkdGmiLeHYBRrv1/MHiJDaBIiSREAXLw=;
 b=R3PYRVqhOzG0TIPqAHpgaC9tlAk/VWwAqBYPLQkZINTJJ1kegSaySkx0pOr1XtuXTz
 WSLwjr0xlkj4H3dYOdzwtV6458CjqOGN8S8g3Bh7rhUxyWKWdsVs75LjoFCIlbsXr2Xt
 qUe5cCmqSvswQCbBw4I99JyAMLBoY1PQYm/gseJEAVcQJoqhUv6b7YyBDYDZ6oCEkJL8
 LXuSkMfN0jzdIFNbSjy8AMahcpM/2vLM0hDgGvqVzyhdjKQhvWacFk7u8bfaA9LHrykl
 DprsHPtjJKEJ/tIBP1BmpWCSa5/f/Mm5lsJShJ12KxBo6bZU/aXDJKd1Qtekavesw262
 9OeA==
X-Gm-Message-State: AOAM531spJV9xRjA8T8s8//DIatVc15svEiftXM3WgEt433V13J7sYn6
 omg9TOf0qYxoe+IPByA0s8HUaq+b1ZuK0A==
X-Google-Smtp-Source: ABdhPJwtbn12HfJqvybF7S8QmT7HPChRoeyKZTrUOXl8vIo5aU9Q7yu70aiHn0CO1nQR/a1iW5Fapw==
X-Received: by 2002:a1c:7715:0:b0:37b:dc94:9eb4 with SMTP id
 t21-20020a1c7715000000b0037bdc949eb4mr3778114wmi.61.1645543424306; 
 Tue, 22 Feb 2022 07:23:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a7bc4d0000000b0037bbe255339sm2687403wmk.15.2022.02.22.07.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 07:23:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] block/curl.c: Set error message string if
 curl_init_state() fails
Date: Tue, 22 Feb 2022 15:23:40 +0000
Message-Id: <20220222152341.850419-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222152341.850419-1-peter.maydell@linaro.org>
References: <20220222152341.850419-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In curl_open(), the 'out' label assumes that the state->errmsg string
has been set (either by curl_easy_perform() or by manually copying a
string into it); however if curl_init_state() fails we will jump to
that label without setting the string.  Add the missing error string
setup.

(We can't be specific about the cause of failure: the documentation
of curl_easy_init() just says "If this function returns NULL,
something went wrong".)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 block/curl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/curl.c b/block/curl.c
index 6a6cd729758..95168529715 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -759,6 +759,8 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags,
     // Get file size
 
     if (curl_init_state(s, state) < 0) {
+        pstrcpy(state->errmsg, CURL_ERROR_SIZE,
+                "curl library initialization failed.");
         goto out;
     }
 
-- 
2.25.1


