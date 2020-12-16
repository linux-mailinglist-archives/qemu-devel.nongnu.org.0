Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEEE2DC41D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:28:19 +0100 (CET)
Received: from localhost ([::1]:36616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZf0-0003dU-GV
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:28:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpZXB-0002AN-8p
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:20:14 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:44205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpZX9-0006Uc-6e
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:20:12 -0500
Received: by mail-ej1-x62a.google.com with SMTP id w1so28904602ejf.11
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7RAuAOiHtCEg/kAzL1aVWGDPXJpz9DMSzL+PQoGrz8I=;
 b=mqhNPk+V4KQiBUY9JhDWFDoK/CrSpyT2E7gi1rjQfmptOhBXWbFw0avCYQMimyXsKA
 sPYXQtwzVeW8VV5EfCFzMN1zA0uVWndPVMB5XfZ26bC20z9n3TgELhPy9RtkBurbaYrV
 Df/AefeBjdbZVG13rDZizF9Fb19dbvzaMO0JCtTWd7G+T4/rBYDtLvUXgQxbN5idNj5C
 FS+DGQhx1SJ2ub9FHFrZeVBvQ2KVbQHogs8idk/kWGxIZH7hzz/Fpy4cAn7mRZ6u46/G
 gVtoaGvfFc6tpICJ4B20t34Ple1SCobO0b47zr1TUPRH1KQ7+JMC9lT40Xb8Idl17OWW
 Y6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7RAuAOiHtCEg/kAzL1aVWGDPXJpz9DMSzL+PQoGrz8I=;
 b=jD5whccugL117H/ePoafnSrNFEkOJ8zxVMtQmu6d/2oWe0E7eq8j1nRTRpv+yqS9G1
 oEVNgxD6wsc3LsQjYSlCGXaxQg1ijQDAQPONbRUV72eQINC0nClnbahxC5OulX7sbm97
 BzgCQihd9cWTHNQwFbY1mkLKdY03FBvX9YXcdAIJwqJqbXJpEgxgroZFDmkkZ51F8rLb
 oDyFXhNjoJ8l9WygddhY5m+vwA0S67S2Ay2FJqjX0JiINMKDqadQvKpalET+Wa1dV2dg
 cjV66BszlhN7bMT073zRW/Q8LEogWX3USff2IPSqEIVaiCW9OEVks81PIsGMsLczxeUr
 18PA==
X-Gm-Message-State: AOAM5322nWqVJvszD7IcKCvYtTRkUNHMkKJVFFjExhmXalkE6qqkaVsC
 VLAGSBQSNtDz60zYsa5yjmO/waiNpVw=
X-Google-Smtp-Source: ABdhPJzEVc6t/8/G20ykUCb2yBq0Rrh234WNBrCQ90j9gZr9sckk6OoKti0PqTS87kW7OY5myPtNpw==
X-Received: by 2002:a17:906:378f:: with SMTP id
 n15mr30808863ejc.263.1608135609290; 
 Wed, 16 Dec 2020 08:20:09 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a13sm21264501edb.76.2020.12.16.08.20.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:20:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] Makefile: add dummy target for build.ninja dependencies
Date: Wed, 16 Dec 2020 17:20:00 +0100
Message-Id: <20201216162006.433850-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216162006.433850-1-pbonzini@redhat.com>
References: <20201216162006.433850-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
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



