Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D90D2DC2B1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:05:36 +0100 (CET)
Received: from localhost ([::1]:43460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYMx-0008L9-8R
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:05:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpYJh-0004KY-U4
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:02:13 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:35026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpYJf-0007S6-Tz
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:02:13 -0500
Received: by mail-ed1-x52c.google.com with SMTP id u19so25164410edx.2
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7RAuAOiHtCEg/kAzL1aVWGDPXJpz9DMSzL+PQoGrz8I=;
 b=G5W8de7uLVvuKdaGFeEDlF4yB3fzXtgq2G89T8rH8LlRaoOqti0PPSdFqUDBMzmvRw
 0L8klMMxntQhu69TxszZoYcGFYome2yjyhcSnNL4g0znonYHexu7hGAxL8isiOlMt3TN
 vF/kHfuptu5sYOuyGF86u+teSlmsrGmCAHj4M43J3Lpk0fdjzZHYc3z5xLuoRgJhmdeh
 rc+AI9szQxUTmwFNZyx5Bu+7eomp3YXmI2Eq3jtP7PjGXBNTlV4REpBK02cQcODwpnH1
 HOjzXDHhdeRQuj7Wya/r3QLuMHxuFL21dCFX6fbTWPH8hx3KLSFErDc+cTAty5xmB3Ek
 fGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7RAuAOiHtCEg/kAzL1aVWGDPXJpz9DMSzL+PQoGrz8I=;
 b=f+Iz8vv4Gx3orwXW3u9Wt/XN/Aj6kh4mPN6oooRGRJ1hN3N4iQu/eSekgcT8gSbqKd
 V6cu4Uk3nqvGXKwGGLmAM3oeTwUQVP8LqsQRa2u99WY8/PE6FK8MHxZB3vPUTtR3SmwP
 MVz6bMu0fYalCCmU4SyYUHMAMvPpMQGuAaDwNhmAGWFj8gR1V5Ryd9x0Ds/i/xeZDC4P
 hqBLRHHAXiMQKbWSLXmOtnpcOOHkUakWk3RE7WeVAMLdFvcUSgXVg5yBCpojWNchDg7/
 17FtzPpzpLxS+bOTSabFoXb8DnOsTL/rC1+PhZKRecTz0oVvr52NGuA0aLoBS8bl6m+Q
 Fhgg==
X-Gm-Message-State: AOAM532QcLJ0lNcxPtgftT3WFviArtfJ9M4t7iGHuZzGB5aoe5vllNRe
 yIsApBCp7qPC/VXf7rRZVc5V9am2Mu8=
X-Google-Smtp-Source: ABdhPJy/7harrTUUdAyEYSPcMnt/d6uLc4BsXUPz3i5naWNRzSxKvHgtyl+DEDaWio8fi+5hKwJ1QA==
X-Received: by 2002:a05:6402:40e:: with SMTP id
 q14mr1400334edv.85.1608130930153; 
 Wed, 16 Dec 2020 07:02:10 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v24sm21397059edw.23.2020.12.16.07.02.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 07:02:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] Makefile: add dummy target for build.ninja dependencies
Date: Wed, 16 Dec 2020 16:02:01 +0100
Message-Id: <20201216150207.431437-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216150207.431437-1-pbonzini@redhat.com>
References: <20201216150207.431437-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The dummy targets ensure that incremental build can be done after
deleting a meson.build file.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 76dbb917f5..fb9923ff22 100644
--- a/Makefile
+++ b/Makefile
@@ -133,6 +133,7 @@ Makefile.ninja: build.ninja
 
 # A separate rule is needed for Makefile dependencies to avoid -n
 build.ninja: build.ninja.stamp
+$(build-files):
 build.ninja.stamp: meson.stamp $(build-files)
 	$(NINJA) $(if $V,-v,) build.ninja && touch $@
 endif
-- 
2.29.2



