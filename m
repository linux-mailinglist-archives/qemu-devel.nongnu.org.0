Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1301419B3A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:14:59 +0200 (CEST)
Received: from localhost ([::1]:49926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuDS-0004PG-Ql
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2D-0003D2-DW
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2B-0003GR-To
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Khb8hgEBtXVnFEmx9u95JviCusuAqE5zASz4r+rPaZQ=;
 b=LL3dYMWgBtJuPoh8Rd7nG0FasDJZrAcrQRB2HJGN9asG0ANlt5Cdjv408n7DwDcAuBlbE6
 8KxFdvQ9RHOYd3z+XxjBKTj84USoZpsvCd9jrosW123HgHEF+ILtMayMPFqpfZbDlIWdCN
 M0WTRGA5JQ6IVq9pdiMdWW9y5mS3YaA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-EssGaRXAPamfCuLUHSAM7Q-1; Mon, 27 Sep 2021 13:03:15 -0400
X-MC-Unique: EssGaRXAPamfCuLUHSAM7Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 r15-20020adfce8f000000b0015df1098ccbso14371220wrn.4
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Khb8hgEBtXVnFEmx9u95JviCusuAqE5zASz4r+rPaZQ=;
 b=r2MwDjsiR7iOrJKL1JHaDVns6ubHRCWTfENMlNEMFVDfh0Ln51/5ovSSnHZqoitQWQ
 QOzULRRMq0EJg3RuA3wxahYAM+sb5LdX0McC0mG8SEbE5lrKXa2BEq01Aj/ZxhoZLuT7
 PIdHXOORjq+4o4iXIhuQEkIRl/jJu67llunzB8n5voZVwrjhaPyC2r2cFPSHDh3u9yAo
 le7HTAOqRczWYHaoop2NZ9UxM+6PQRYLLwRkHYNSfGnjoz0YRtyQLKeRQFnQmimsCAqU
 2k4NFNrAkcnhNGN7oNt7ygYGqW01vsmNMTxuFt2ziy0l3rDL18bWDKO0wVIscdBVLTYy
 EXQg==
X-Gm-Message-State: AOAM533uOuGZTPgLGe9MsWyJru/8HS+gON5z6jdy2aWq79hWV2DTAkF1
 WQ99O85lWtjzsE4WKvDxt+3kDlQkIVIKcnJq9UOzE0o7T/gnM9YTCWjryqQPuZnHCQahBvRQqgo
 09Vdoa78hOosy8G5BMKvol5UVcbJWaN9g9DXa93w70KuNEM/O3U3409a73T6ogWZe
X-Received: by 2002:a5d:6c6d:: with SMTP id r13mr999924wrz.439.1632762193944; 
 Mon, 27 Sep 2021 10:03:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1jYj/NJft1hQuOQz0kG8I8fcMs2r23GhvtvY0/l7THjYL+iueg8va2s0ORjEHsP5nvFgMyA==
X-Received: by 2002:a5d:6c6d:: with SMTP id r13mr999891wrz.439.1632762193729; 
 Mon, 27 Sep 2021 10:03:13 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id n7sm17270297wra.37.2021.09.27.10.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:03:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/21] avocado_qemu: tweak ssh connect method
Date: Mon, 27 Sep 2021 19:02:16 +0200
Message-Id: <20210927170227.2014482-11-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927170227.2014482-1-philmd@redhat.com>
References: <20210927170227.2014482-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Willian Rampazzo <willianr@redhat.com>

The current implementation will crash if the connection fails as the
`time` module is not imported. Fix the import problem. While here,
tweaks the connection to wait progressively when the connection fails.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
[PMD: Reworded description]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210920204932.94132-5-willianr@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index edb9ed74852..c3613f92620 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -13,6 +13,7 @@
 import shutil
 import sys
 import tempfile
+import time
 import uuid
 
 import avocado
@@ -305,8 +306,7 @@ def ssh_connect(self, username, credential, credential_is_key=True):
                 self.ssh_session.connect()
                 return
             except:
-                time.sleep(4)
-                pass
+                time.sleep(i)
         self.fail('ssh connection timeout')
 
     def ssh_command(self, command):
-- 
2.31.1


