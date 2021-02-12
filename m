Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9653731A27D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 17:18:51 +0100 (CET)
Received: from localhost ([::1]:42306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAb9e-0000v5-M8
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 11:18:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAb4J-00050k-6G
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 11:13:19 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAb4F-0000KW-Tk
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 11:13:18 -0500
Received: by mail-wr1-x42a.google.com with SMTP id g10so8829461wrx.1
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 08:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zeCw2TC5Gkc0xwGkDJq//xKkGq/MVX7IyMH3Sn9yF4c=;
 b=om9bf+Cxq6Oed0DBgutRin76Jp7DbHhYQXGLP6NkdzjRVHTymm30BiVX+MDpcMVumY
 7TjQkH/dAkhq1fRmPgomyOpx2NABFzei0Z0pSBPs7CDKUnclp31zhdkk+X+kCwxcPu05
 V5CnOchDu8ZIu+YsnGDxjgQfCFKr4qBFWGd2clPb6/VlEDJbxNgoD/+SsNBep93N7qYx
 N9AaqJNfAIP3U9flNeF5DI6S1OBSuhMb74NYiMHFmZDizO2OYFf9vACQ3G50o+hlbjjy
 YN5AFuYE7LXbTdx+NStMrqEZ/nCx6RP+bQiLw74hFUOSsqjnCE4qIPgWyUh8lls6yCii
 v41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zeCw2TC5Gkc0xwGkDJq//xKkGq/MVX7IyMH3Sn9yF4c=;
 b=ShuB6dYMaH0eFIMykBKq3R0y1Hp3igCj8oTMEBqmFQgWi1grQ0O90BzsAiezah331c
 Ye13LJtH7YMdBoMKsfhzZb2qmYuUojbd5flvVAXuFEfP0tFKUPIgV/cHunmShEtdlBer
 CBrWZtaC3HkkHX0mOaNHiWJA/rkVLHpwvN05fs/ve/EdM/TZwmAsbqt+4+yPjL3Pc78D
 ikq4lY88ehx3nPUfWcLBv2Yn3/CbbS1o1UM3mTM5o719Mne99eg6TZBa3N0BBmUCk3Kd
 OeDYPsz+dD+JCSGA9c6Lr/cesebPY4FEcuUBXhPpUPp0IRh8bLLq/oN/YoHpXkLoMibV
 DNrA==
X-Gm-Message-State: AOAM533d3u6Fh7F60Y8m5A8hVyOsIQWvmt1yS1N1stC7YdiDng9l09+o
 V9oVomlX85J0wrEan1HNcjWEw/OK6MeVtQ==
X-Google-Smtp-Source: ABdhPJyXaFN7nMpZaykwn25478zxQMiWwe2dnNGOACuDzcWSqhNRFMJperFOnwpwYll8pM0hMXA8zg==
X-Received: by 2002:adf:80c8:: with SMTP id 66mr4395303wrl.344.1613146393184; 
 Fri, 12 Feb 2021 08:13:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n11sm11053942wrt.34.2021.02.12.08.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 08:13:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/sphinx/qapidoc.py: Handle change of QAPI's builtin
 module name
Date: Fri, 12 Feb 2021 16:13:11 +0000
Message-Id: <20210212161311.28915-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit e2bbc4eaa7f0 we changed the QAPI modules to name the built-in
module "./builtin" rather than None, but forgot to update the Sphinx
plugin. The effect of this was that when the plugin generated a dependency
file it was including a bogus dependency on a non-existent file named
"builtin", which meant that ninja would run Sphinx and rebuild all
the documentation every time even if nothing had changed.

Update the plugin to use the new name of the builtin module.

Fixes: e2bbc4eaa7f0
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/sphinx/qapidoc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index e03abcbb959..b7b86b5dffb 100644
--- a/docs/sphinx/qapidoc.py
+++ b/docs/sphinx/qapidoc.py
@@ -464,7 +464,7 @@ class QAPISchemaGenDepVisitor(QAPISchemaVisitor):
         self._qapidir = qapidir
 
     def visit_module(self, name):
-        if name is not None:
+        if name != "./builtin":
             qapifile = self._qapidir + '/' + name
             self._env.note_dependency(os.path.abspath(qapifile))
         super().visit_module(name)
-- 
2.20.1


