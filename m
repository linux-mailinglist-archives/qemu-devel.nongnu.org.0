Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA0A332354
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:49:40 +0100 (CET)
Received: from localhost ([::1]:40688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZvn-0006si-PM
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJZso-0004zY-Up
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:46:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJZsn-0006e5-3S
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:46:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615286792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sH8MiIOaYfrx0Na3u7UJXnCEr/XsA8ybn+Hmuu3P3UY=;
 b=eakeHo9zr4gIhLjpR++b2Ah/V5N8R1kurhgU9Hprw25qnwMfX8lt4W2mNNOTqdekDJFbR8
 DcgJC7LH9u6zoWbpjF8UEJ0SoUu9RPz758BeMWuwIpDiDmm0Q4tdRWu1JmTXXySRVnJ6Pv
 SabucWPF+GXwJjV0E0Py3fMdMEaN4r4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-_uEjau-MPQa6VCp68XwZhQ-1; Tue, 09 Mar 2021 05:46:30 -0500
X-MC-Unique: _uEjau-MPQa6VCp68XwZhQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 964F81074644
 for <qemu-devel@nongnu.org>; Tue,  9 Mar 2021 10:46:29 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58E1F60C04;
 Tue,  9 Mar 2021 10:46:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/14] docker: OpenSBI build job depends on OpenSBI container
Date: Tue,  9 Mar 2021 11:46:07 +0100
Message-Id: <20210309104617.714908-5-thuth@redhat.com>
In-Reply-To: <20210309104617.714908-1-thuth@redhat.com>
References: <20210309104617.714908-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Add missing dependency build-opensbi -> docker-opensbi.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210303130646.1494015-4-philmd@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/opensbi.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index 5b13047e2a..f66cd1d908 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -25,6 +25,7 @@ docker-opensbi:
 
 build-opensbi:
  stage: build
+ needs: ['docker-opensbi']
  rules: # Only run this job when ...
  - changes: # ... roms/opensbi/ is modified (submodule updated)
    - roms/opensbi/*
-- 
2.27.0


