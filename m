Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7724A4B67BE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:38:05 +0100 (CET)
Received: from localhost ([::1]:42210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuHc-0004A5-Hg
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:38:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCE-0003kW-JU
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:30 -0500
Received: from [2a00:1450:4864:20::52a] (port=46825
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCC-0008PW-Kd
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:30 -0500
Received: by mail-ed1-x52a.google.com with SMTP id m17so6180620edc.13
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B9NkiQxutvWo2hPvQYBM/5dxdxvT+GzFQ3unXvy2yF4=;
 b=eA7qdWdUSHNNSf3Op7k5FvIm+vB79lcZcFkvwTOMgTD6U3+1VEAHRYjyvbZ6gEoAV7
 x4bkl0MzYQTSlSIs4nwB7S+5KEZfNBuGWJidjoAtNkfJG2EWD9GF2V0Iu940ztzRG4De
 N0EcgY4M4a0tAAQ+kpJo2c5AA0Iabyj88Dd9vA0TJ5IL43cfpf6hwb0/zMkIMYq56K7X
 J9/g9w84/OYkaNO4JdO/gbLQlVlk0vQ4n8MTcK4+rfL/tmueev0Ogm+We0pxTyKuiOjf
 Y+7e1SD6114Zjjm4W3Cf75y9MXJxSFni6lIFHNq924N0ntZhyxndoXwY2tWZEFEBKirT
 5/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=B9NkiQxutvWo2hPvQYBM/5dxdxvT+GzFQ3unXvy2yF4=;
 b=qColhWz3kWinxNjJRgxzlQdGXece6FATtysFmPu7pueGPuv2GYzhyjrbJszqq4Inhb
 aW1hfyhqfDow2L0yCK8U2IIZc8C8DxRFzKIFPcFNzwvgsjNF2E6nGyi8BIaIJI2XgP7G
 KoNSuBEHpDOuwHQ8Sujs+yWrzhmdfBCyHQK3DqEQaqAgdOpfFIc5/VbDG3o/rAP+wAT4
 lKZx2VVA02iEXIoY7RNIYOfwO3JGKMOHT4AkEWP53Dl/3hE/FRgPyXKbLhdHoek9QZhf
 IJyS8/0qBV5JGjM200RvXqpfChFDGCqg2TrmispDc0u9senxAGQFKGm8BUosdmzuCjXT
 qp7Q==
X-Gm-Message-State: AOAM531AB3T2YfGxVZ/X6ATteVaHrOq5UIG/FY8ep9Unf2Pyh1uAzpS0
 NsR+7WcRDwK+azIwve7aVLdAvX6jkS0=
X-Google-Smtp-Source: ABdhPJxhNDKm20WglKlBpaA3cVScqkCbZsBQVjbJiP1oIqAaIcAPVnb+2PVdDDcX5zn66tRbZwN2fw==
X-Received: by 2002:aa7:dac5:: with SMTP id x5mr769532eds.57.1644917547427;
 Tue, 15 Feb 2022 01:32:27 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/30] tests/qemu-iotests/testrunner: Print diff to stderr in
 TAP mode
Date: Tue, 15 Feb 2022 10:31:56 +0100
Message-Id: <20220215093223.110827-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

When running in TAP mode, stdout is reserved for the TAP protocol.
To see the "diff" of the failed test, we have to print it to
stderr instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220209101530.3442837-8-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qemu-iotests/testrunner.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 0eace147b8..9a94273975 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -404,7 +404,10 @@ def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
             if res.status == 'fail':
                 failed.append(name)
                 if res.diff:
-                    print('\n'.join(res.diff))
+                    if self.tap:
+                        print('\n'.join(res.diff), file=sys.stderr)
+                    else:
+                        print('\n'.join(res.diff))
             elif res.status == 'not run':
                 notrun.append(name)
             elif res.status == 'pass':
-- 
2.34.1



