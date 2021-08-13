Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916D63EB761
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 17:07:19 +0200 (CEST)
Received: from localhost ([::1]:58888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEYmE-0004Pg-Ic
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 11:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEYkD-0001g2-0W
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 11:05:13 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEYkB-0003SE-Jl
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 11:05:12 -0400
Received: by mail-wr1-x429.google.com with SMTP id z9so13638996wrh.10
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 08:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R4SpbrLOmCpTHzbhSXpHi6M49IXENuQ3Igp0+lnrf3E=;
 b=EH4khaYk8cvhdmslHIw8sLAoapCDXBlwZ1leaMJmCORcn5dF8yVFxwQgXMJpt81zIT
 viTEJbl+sFlauVLnPl1iOWo0CrHLX5Ca1S6sTLR2Yx1qY5LcsEaG4x9ei4uHdxL8EVCa
 sl9psCncmbfbc1Oizt6kX+2qQvfwo4yapOZuTjkh1DIjDxAaPIBRjikfAD26kZCv5cWx
 m9KKvAar+6RahyANa5nVjwVqb6sh1LVEm7LgihYUeY/59/e0lMnCl/G43MFZ+tHF8vEI
 LgGsUBuut/QMtCL93ZBVGKXZtfHdcnscVuZiAtMiiufsvI3v6t7vyV0qJmXgjNCkrH2l
 qS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R4SpbrLOmCpTHzbhSXpHi6M49IXENuQ3Igp0+lnrf3E=;
 b=bu8eCAxWAqR+85gKSox2lkLdRoJGI8m5ETtj79g/auc9/OrxifTboOlYvdVoG6uLlC
 GM1pLB4zYqE+HUJDwmUtPBvbTneucIP5ij0ZxEPgT2lUi7WQIfLOIwW1WJODpGmu5FJL
 A4insasDiZFjrjPm5TOMVOjoCu+InZ4vzOiS7ikKHCtM58bgxzYeXmdLqhczY3ydm5NP
 3wrsaxSfPkBMk4bi6zzu/Z9nfGlzeVQU9/+BKasR8xhCd31MweBKGHXF+dvSbLSL1J06
 TI752IhkQMLYJyrBjgoBFXzmoJIfoWgQOnaBJI9pgabmgMs97o8OoePqS3+SPSIUcuUX
 Mfiw==
X-Gm-Message-State: AOAM532TOtOJV8I+o5LaSpZv2oKEM0tY6qVql5u4oUGVp5MAWNn2PG5I
 Y4CHNAPKZoaQ9JYYjbrGsZVCFwwDz/IdPw==
X-Google-Smtp-Source: ABdhPJyl5P0iO0CkbY0rpCofsmb7KXXQlJf75+LiibQfeGGm2/8FT7ozqH030tzCEYemOYmrOb4buQ==
X-Received: by 2002:adf:8102:: with SMTP id 2mr3601607wrm.89.1628867109839;
 Fri, 13 Aug 2021 08:05:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h9sm1836361wrv.84.2021.08.13.08.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 08:05:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 1/4] net: Zero sockaddr_in in parse_host_port()
Date: Fri, 13 Aug 2021 16:05:03 +0100
Message-Id: <20210813150506.7768-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210813150506.7768-1-peter.maydell@linaro.org>
References: <20210813150506.7768-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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


