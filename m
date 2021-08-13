Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F043EB762
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 17:07:23 +0200 (CEST)
Received: from localhost ([::1]:59302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEYmI-0004fl-BJ
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 11:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEYkH-0001nN-OA
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 11:05:17 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEYkF-0003W4-SZ
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 11:05:17 -0400
Received: by mail-wr1-x436.google.com with SMTP id h13so13769116wrp.1
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 08:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=74MGSkRJe7t/wQrF2plR3Xcr6VgTbZNewkJwijPXN6M=;
 b=ZD92n6Q5cW4QfW2cJL07hSGeIfI5etoQUnS7myMjP0+tMiOwNAzlq1JlzOlBP+KTOA
 ODB2+1NGRUT2+48eR2X8YFzf9u/Y5kcTafWMh3nNTnf3puAb8QX4FnzybrRhPSgComp/
 8ncN37FH+E8xBrblQIL3hIE17XmUXJAUGGVSIpA0VkntX8RXoLjYgm39o11ysxMmqJXL
 rdWx3GHhnF45KkxI2nH8OYHmjBQ0I08Z3JSHB4BXdOSNph3rbSsLzfzEWOLJ3bXRvRSl
 BgI5GIF/uCSOumhFfvtwng2wk5iEZxrjDCcb567B+xyiF4ZXUPL9ftIDR1fXD53fn0j1
 wsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=74MGSkRJe7t/wQrF2plR3Xcr6VgTbZNewkJwijPXN6M=;
 b=Y7f+s3UyWGjWHQWTTZZ5ZEYfmaB8181WzMBdt87IIixgWZ/R2BveSjVilDGoFTiChN
 xuYaQ5v0S44VicS/9HI1awaKPx0LTYHqGEehGyvUSj2FHE0HkYVJ5JtCX6wElcnKRhC1
 CO1d5FO/L0GvncY/kjjU1W2hReLhZ0ISr02mXJD3coYTlZdo+VqiSQ+C2OzneE3eWSwZ
 THcQ2RLXLs3YCFcheurHu7Q7GrcFylQaOQq5aIFmXp2Mqmv+oc1VQZ2T7994vAb2K318
 iiLi9Fi1V3lpcbn6DatAdEgBoCAnuk/vv5cFNkYU8ybSlNZz/XJNzdv+zKi74/EKUWKR
 Ty9Q==
X-Gm-Message-State: AOAM533aw4dvWBtXKMbmpG2ZnijHsuZzZmSbHZ8vAawTk6RfBUEheoWZ
 Uy+ivjUihqGEv2tE4w4qMLvq1svpke3u2w==
X-Google-Smtp-Source: ABdhPJwpfkVlFShNLPCZHeasDgOTnVY07hnfT69NKn3YsZNt1nbIGWmmP1gr8bs4WLxR0LPMCScwyw==
X-Received: by 2002:adf:c549:: with SMTP id s9mr3737139wrf.344.1628867111657; 
 Fri, 13 Aug 2021 08:05:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h9sm1836361wrv.84.2021.08.13.08.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 08:05:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 3/4] tests/qtest/ipmi-bt-test: Zero-initialize
 sockaddr struct
Date: Fri, 13 Aug 2021 16:05:05 +0100
Message-Id: <20210813150506.7768-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210813150506.7768-1-peter.maydell@linaro.org>
References: <20210813150506.7768-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>,
 Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zero-initialize the sockaddr_in struct that we're about to fill in
and pass to bind(), to ensure we don't leave possible
implementation-defined extension fields as uninitialized garbage.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/ipmi-bt-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/ipmi-bt-test.c b/tests/qtest/ipmi-bt-test.c
index 8492f02a9c3..19612e9405a 100644
--- a/tests/qtest/ipmi-bt-test.c
+++ b/tests/qtest/ipmi-bt-test.c
@@ -378,7 +378,7 @@ static void test_enable_irq(void)
  */
 static void open_socket(void)
 {
-    struct sockaddr_in myaddr;
+    struct sockaddr_in myaddr = {};
     socklen_t addrlen;
 
     myaddr.sin_family = AF_INET;
-- 
2.20.1


