Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD44466454B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:50:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFEfT-0001UO-Bs; Tue, 10 Jan 2023 08:27:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pFEf2-0001NM-SF
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:27:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pFEf1-0003dF-9Y
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:27:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673357246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+kQC5W1HJVyZlSr7LmwSXpnisNfrSjXBHbjOM87JegU=;
 b=G3eSKO7GMG4trS77SUF2T1IYhH6ta8+Ih5uzBi2H5/is3rHCtU2cntmFGpADKWuNK9XCGI
 ObI7M+x1EBE06qFF2bSSdKsjW+x3RZc4ZNFJa6n3lXQ4T/Mywwx75+65y/putQRNFl5VPu
 5HZUozqW6X1NziuhtsyVF8LbQNJ7DzY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-GKdVcrE5N3KfCvLfOno4jQ-1; Tue, 10 Jan 2023 08:27:23 -0500
X-MC-Unique: GKdVcrE5N3KfCvLfOno4jQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4F86857D0D;
 Tue, 10 Jan 2023 13:27:22 +0000 (UTC)
Received: from localhost (unknown [10.39.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8098140EBF4;
 Tue, 10 Jan 2023 13:27:21 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, kraxel@redhat.com,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 pbonzini@redhat.com, Eric Farman <farman@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, thuth@redhat.com,
 Halil Pasic <pasic@linux.ibm.com>, Michael Roth <michael.roth@amd.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ed Maste <emaste@freebsd.org>
Subject: [PATCH v4 2/8] .gitlab-ci.d/windows: do not disable opengl
Date: Tue, 10 Jan 2023 17:26:54 +0400
Message-Id: <20230110132700.833690-3-marcandre.lureau@redhat.com>
In-Reply-To: <20230110132700.833690-1-marcandre.lureau@redhat.com>
References: <20230110132700.833690-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The previous patch should fix shader compilation.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/windows.yml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index a1d5790580..cf445b77f6 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -71,7 +71,7 @@ msys2-64bit:
   # for the msys2 64-bit job, due to the build could not complete within
   # the project timeout.
   - ..\msys64\usr\bin\bash -lc '../configure --target-list=x86_64-softmmu
-      --without-default-devices --disable-opengl'
+      --without-default-devices'
   - ..\msys64\usr\bin\bash -lc 'make'
   # qTests don't run successfully with "--without-default-devices",
   # so let's exclude the qtests from CI for now.
@@ -113,8 +113,7 @@ msys2-32bit:
   - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
   - mkdir output
   - cd output
-  - ..\msys64\usr\bin\bash -lc '../configure --target-list=ppc64-softmmu
-        --disable-opengl'
+  - ..\msys64\usr\bin\bash -lc '../configure --target-list=ppc64-softmmu'
   - ..\msys64\usr\bin\bash -lc 'make'
   - ..\msys64\usr\bin\bash -lc 'make check MTESTARGS=\"--no-suite qtest\" ||
                                 { cat meson-logs/testlog.txt; exit 1; }'
-- 
2.39.0


