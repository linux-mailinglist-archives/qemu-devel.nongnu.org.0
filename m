Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9931D97B5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 15:28:13 +0200 (CEST)
Received: from localhost ([::1]:57344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb2I0-0006UZ-Qg
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 09:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jb2Gj-0004rv-4P
 for qemu-devel@nongnu.org; Tue, 19 May 2020 09:26:53 -0400
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43]:39293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jb2Gh-0008IL-0t
 for qemu-devel@nongnu.org; Tue, 19 May 2020 09:26:52 -0400
Received: by mail-qv1-xf43.google.com with SMTP id d1so6452919qvl.6
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 06:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3gzLQjTNcjbpYvwsvQXVyXWjA0OUVQvOZz7UT84LrLE=;
 b=T4j9qzAGF/ojNwnAl5Upw4dcB6BUXPrqn27LF+xGy7Mvr37EQPKiM5R/glCV4FeLBs
 G3sDk+5NuP4dr+KtZUMIFEOr8/zOPLC+qXyqZLTzD0T9ZhBHg2Q4ElWudJbIudKzfM78
 COG/Nr6Xhi+LlfKT4kBqamSNuadHn5KIBUkYT/S6m2k3UbofvqCCui04ISQnY6+BiXzQ
 bHarCWuaiK7KYDhD9I+AYkwKV7i9yJkmjYbhtqIner16XIqWiay58VZx1zfRNJpOfg5/
 Hc4Oz/QKk/dRZS2EUbtguMsIDaxjp4PEFv5qUcFLpMXJ13Gh6bkmxuCsKtypPyt9Oogz
 jVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3gzLQjTNcjbpYvwsvQXVyXWjA0OUVQvOZz7UT84LrLE=;
 b=eJVBOvNjZ2JlB1kY8jHaBKZQ2KpKLeH+6P5FT9mSbU2wmwRv2v2EJ5XAhGy2EBi7Wq
 rt+jx0ODbbpGR8TMik3b5GBNvuXTTE+dhJwHMfewCWkeDb1L6KzwRYVS5CpMdy/U5CAt
 HJq3q3yVGQdwcrAVjKCxte1uKnrwBmvMWZx8Jothxs/8DqUuM6D9KOe9XsRbucbOsfxQ
 B8B6k1uUVdl9dMaRifilMUCdRUDURW0wiLzdSpiw9q75jcYNF+8Y6Qovd84975PxzZKf
 t8bvtLI1+hryvIalhDcFlg4rNfg+9qgBdjp+tUGeS6C9qvGks4I7HqYK9xtmuzy6T9CR
 mGzw==
X-Gm-Message-State: AOAM530yvC2+ODr2D0Q3msmTPHp/X5FQ9odF0JrS+5462hOewgMRjynj
 vDO0cqoG2H58zZjS5YWgVpHiF/YOpsQmcQ==
X-Google-Smtp-Source: ABdhPJyrjxlPrcu0ffVcwmYcb8iyyOdTRahAoVMMSg4gt2bvq/HJ0oXwEIbLoewtXMhWETSOZSt+4w==
X-Received: by 2002:ad4:466f:: with SMTP id z15mr22002286qvv.101.1589894808578; 
 Tue, 19 May 2020 06:26:48 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:dd6a:8c63:cd9d:ad15])
 by smtp.gmail.com with ESMTPSA id d74sm3482136qke.100.2020.05.19.06.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 06:26:47 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 01/12] configure: add alternate binary for genisoimage
Date: Tue, 19 May 2020 09:22:48 -0400
Message-Id: <20200519132259.405-2-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519132259.405-1-robert.foley@linaro.org>
References: <20200519132259.405-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f43;
 envelope-from=robert.foley@linaro.org; helo=mail-qv1-xf43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: philmd@redhat.com, alex.bennee@linaro.org, robert.foley@linaro.org,
 peter.puhov@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Not all distros ship genisoimage which is a Debian fork from the
original cdrtools. As the options are pretty much the same support it
as a fallback binary.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 26084fc53a..a574250524 100755
--- a/configure
+++ b/configure
@@ -941,7 +941,7 @@ done
 
 # Check for ancillary tools used in testing
 genisoimage=
-for binary in genisoimage
+for binary in genisoimage mkisofs
 do
     if has $binary
     then
-- 
2.17.1


