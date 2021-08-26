Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E5F3F8CBB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:10:20 +0200 (CEST)
Received: from localhost ([::1]:60208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJItK-0002aS-Kb
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImx-000649-NA
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:39 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImw-00006Q-7U
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:39 -0400
Received: by mail-wm1-x334.google.com with SMTP id i3so2245676wmq.3
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=duV1NJYvhbTjXRB/sB4q/N+Q39wEGYQP8q4khg4Tuts=;
 b=Hzt2NczQuBGi18+bI3pwG6ksNrb/yioWNtRGe52kEYGBHtIDZ9en3BhvoCM71LWeH8
 JOvjkGOL1C0Clp+oir/mgl93J9P3gqaQm8CepVQ9pu0CbACifCc5FFIoCk37ZSZsYDSx
 p8F5dyDjzBev2G8mujl4a4nF34ONUp4YtMaijbaZuh0IgdViF00thXkQkoUBrZ21TyTN
 F1KlNkq8BnIRLlSBBRsSuL1ABdnbsiy1WG6wyzlr1coinKe+M6xmzgGjvfQFiQLulZPH
 0j6QrHCzCzhMaNoZLLQDFATCODaA2O+M4mPTG+WC1kQH6hzqttQ5hvfuQw1Ei7Nt0i5N
 iDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=duV1NJYvhbTjXRB/sB4q/N+Q39wEGYQP8q4khg4Tuts=;
 b=YUTkZYxPDlfIV87XxV7XaF2Uehg6WSO096Gj8pl2O+GmfySfPJj6o2SspXFFfB3X+W
 T6qTy7bXaU7moayz7LukyggRUmaIzn9DwLcpuX8CfXlQNQ2qGYimc8RtfEQhE8BNvdeP
 NW7unrjCXjZaZnpgdFkRExHJdn37NS9Xd8aZKSG3kZJrGv+Z0B2xML3URKubwDBvNH3X
 RPHq3vODSD14bbg8iB31nw7MX43+KSfmX9Z/bxaMF2dabJ4eeaq/jQauNthqfAfbudh9
 r0Im14G/X9bxhFHhe1e1ZrXe0DQaWq6KfSNfFnEDDjTAvXA7+ZEBjgbGVaprOg0h29BV
 xrOg==
X-Gm-Message-State: AOAM530CYLiDdp1o5mMjHF71gacGciqwCRnKgyYeoGn4qNXix3wjlO1b
 ERMVVX9zKnaHatIAKVyLSgzrBWFZKOk/Gg==
X-Google-Smtp-Source: ABdhPJw2ThuR8Y/Ahy9+xtD5uu9xYjmyGh86bnP9ubPjt/l9akz3aD0oCgpY0M6JmxO5FjiAtLkWQg==
X-Received: by 2002:a1c:7ecb:: with SMTP id
 z194mr15498761wmc.182.1629997416841; 
 Thu, 26 Aug 2021 10:03:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/37] net: Zero sockaddr_in in parse_host_port()
Date: Thu, 26 Aug 2021 18:02:56 +0100
Message-Id: <20210826170307.27733-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't currently zero-initialize the 'struct sockaddr_in' that
parse_host_port() fills in, so any fields we don't explicitly
initialize might be left as random garbage.  POSIX states that
implementations may define extensions in sockaddr_in, and that those
extensions must not trigger if zero-initialized.  So not zero
initializing might result in inadvertently triggering an impdef
extension.

memset() the sockaddr_in before we start to fill it in.

Fixes: Coverity CID 1005338
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20210813150506.7768-2-peter.maydell@linaro.org
---
 net/net.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/net.c b/net/net.c
index 76bbb7c31b4..52c99196c69 100644
--- a/net/net.c
+++ b/net/net.c
@@ -75,6 +75,8 @@ int parse_host_port(struct sockaddr_in *saddr, const char *str,
     const char *addr, *p, *r;
     int port, ret = 0;
 
+    memset(saddr, 0, sizeof(*saddr));
+
     substrings = g_strsplit(str, ":", 2);
     if (!substrings || !substrings[0] || !substrings[1]) {
         error_setg(errp, "host address '%s' doesn't contain ':' "
-- 
2.20.1


