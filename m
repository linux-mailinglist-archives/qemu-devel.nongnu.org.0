Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BC13142AD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:14:50 +0100 (CET)
Received: from localhost ([::1]:37704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Enx-0004Mw-7b
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:14:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCW-0003Qw-ND
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:56 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCV-0006D7-8d
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:56 -0500
Received: by mail-wr1-x431.google.com with SMTP id v15so18373467wrx.4
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0WilWvWorACj3g5EAvXIIkMK139ofJdUm71cXfooZT8=;
 b=AoLpOVHmvB4O6NXU+MgHDlliLbYV6+tl3E6q2rKctCPl+G2H/ExisdnXbn2tBOUQE7
 E06VDtZF4IvLueu8bTVaUbRHw6Azc02peA2KzWrHhD3SVItd1O/gcptfdMJt2ax7za0C
 FyGXgKXUulEOIxdbvlY0MhTWNZ9oRqSbv5bDqmVkJU0kqJ6lusHchkvsnc5NnN8TYP1e
 Y02FewUsCtiYUX2w7X80tdsIWaM5G+dNgtvBc7WA9i2B1KNWUyX/hseYeRpHvIced/Nh
 mTfnNfA2jMsr4TSFRdXo6FutiReEKq0SJ3kZ+XVK9ZkS5dqjniHYR5dX9VPP0kAr6sjI
 zeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0WilWvWorACj3g5EAvXIIkMK139ofJdUm71cXfooZT8=;
 b=RfU3les/h5X99jgWK9ebD6oqjfaLHQR4+NlWHInMS7c4EE5plrTY2jMOwal+22CVdG
 g3fVc0WJmMV4zo/S2rThGpUk2AVbPXPD7owF836nBmMVGw1wqHfMAczFMyGHGhTFPLQi
 fwJjWVGis6pxOqKXNQknml9FiNHRT1O13YRrlOu6Xb5Wwj3XAYiBRlMYdiu8IiL1mXw8
 Gf0MutWPknTk5ZWWLWfi7eb+r+ZU3np2X5LKcJe7tVRh3HQ0n4++0L0o12zSxG8Nrm0b
 aN7OuyEtHjFIcEffcXgVTXhfWOhawiRvGTXsBE422Wgymd1HWdMiFWU7dyVNLyQWmern
 xn5w==
X-Gm-Message-State: AOAM533BXI/l261IwE80R1bdMgdvrZYWshsxuGRqsiIRKgEP4AIJok9t
 eg8KFIPgNWQYWfO7k3xjrHmE5iTOzB0GAw==
X-Google-Smtp-Source: ABdhPJw11OwpzcLDqTE30YMNpvrI5o7vpXvR8D2UVJdMUfzxWrGwQfcJ3q39ZsN/DDsRcQNQDC3XGw==
X-Received: by 2002:a5d:5549:: with SMTP id g9mr22430200wrw.244.1612808634035; 
 Mon, 08 Feb 2021 10:23:54 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/46] tests/meson: Only build softfloat objects if TCG is
 selected
Date: Mon,  8 Feb 2021 19:23:07 +0100
Message-Id: <20210208182331.58897-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210122204441.2145197-3-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/meson.build b/tests/meson.build
index 29ebaba48d..6f1ff926d2 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -276,7 +276,9 @@ test('decodetree', sh,
      workdir: meson.current_source_dir() / 'decode',
      suite: 'decodetree')
 
-subdir('fp')
+if 'CONFIG_TCG' in config_all
+  subdir('fp')
+endif
 
 if not get_option('tcg').disabled()
   if 'CONFIG_PLUGIN' in config_host
-- 
2.29.2



