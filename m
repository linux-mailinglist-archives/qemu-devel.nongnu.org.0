Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0601A300E25
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:52:21 +0100 (CET)
Received: from localhost ([::1]:56574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33Po-0002X4-1I
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33Jm-0005aI-T1
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:46:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33JZ-00031O-AS
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:46:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611348352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+V5qKqyf7/u56SKdLLMT+Z/AdFCEFXdvjYBi9ApYL8w=;
 b=Gp5irIW/6/r4lmWdxnS3BnkOo5qyMDGe4nLVn8S64ILx3k7HPZs9LAhmJ2vjRdJHItTvpJ
 dSSehDkdCqrJvuVErhIyc0MiEPQn/kGUfqwo4pIKUKKGcZ2CuC1HwWhR+ouaNKI4dShEt9
 LuzRCHuqG9nV/8mTdULpfHvk5xwFZY4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-sAUOVm0oO9mfcaMs2p917A-1; Fri, 22 Jan 2021 15:45:51 -0500
X-MC-Unique: sAUOVm0oO9mfcaMs2p917A-1
Received: by mail-ed1-f69.google.com with SMTP id f21so3509586edx.23
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:45:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+V5qKqyf7/u56SKdLLMT+Z/AdFCEFXdvjYBi9ApYL8w=;
 b=BqxeCbwozY2bgAHPYbcMu/I2ycjw+g5WbA4GFrxY2B6fKVs5hjruasu3nBCQBePKTY
 tqwxId9EKauDHrDgckNuknKhGQ0lJvG0cAOT5609oLdc3Px5Yg9CVtsGltkuD+wglL9G
 7UXBMeDipZir2rufn/duGmPaQd0FTmttBPLQqLQN3Tu9R2rku9mADBbAsrNPnr7U+CeV
 stgK324tp96qrZD8vsk94wkFjbpCK6qnyIWNDqkibiIvRegUhsZIseDKtvYRlrVltLSe
 8QMgllGOqEyvV+IsFaX8FeEB2QRLQjxorZmOKYJ5eUgoQ+yeJMjSPh+XgNDzSY9cBigM
 cr1Q==
X-Gm-Message-State: AOAM533OdvyaQ9AgrXnbrANhqh4gju53pH3SKOPLbG66bsqgz+vGO/ke
 ufFJFtLI/ndVuXmdvU+FlxxhCvVFWXpQvM22GhdJVeowopMSpH8SGD+DP/HnvvjeOuarLlsaAhm
 xxY64/F4pWLiaveKCHaFmY+1TiAVXbX+FvqNeRUc0391fQUZG1xkyl+V6r7EiP1Jo
X-Received: by 2002:a17:906:3b92:: with SMTP id u18mr619947ejf.7.1611348349772; 
 Fri, 22 Jan 2021 12:45:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVR3tKFQAhsOTp1eLCIlHklkTvwzEx8RyPKb9ns4pCqTKqMATTfJnePilPqKo10+9hxM7MGg==
X-Received: by 2002:a17:906:3b92:: with SMTP id u18mr619929ejf.7.1611348349577; 
 Fri, 22 Jan 2021 12:45:49 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g21sm6373605edh.20.2021.01.22.12.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 12:45:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 12/12] qapi/meson: Restrict UI module to system emulation
 and tools
Date: Fri, 22 Jan 2021 21:44:41 +0100
Message-Id: <20210122204441.2145197-13-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122204441.2145197-1-philmd@redhat.com>
References: <20210122204441.2145197-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 qapi/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qapi/meson.build b/qapi/meson.build
index 7aca8d50484..0652569bc43 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -43,7 +43,6 @@
   'sockets',
   'trace',
   'transaction',
-  'ui',
   'yank',
 ]
 if have_system
@@ -57,6 +56,11 @@
     'tpm',
   ]
 endif
+if have_system or have_tools
+  qapi_all_modules += [
+    'ui',
+  ]
+endif
 
 qapi_storage_daemon_modules = [
   'block-core',
-- 
2.26.2


