Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3F82929A4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 16:41:41 +0200 (CEST)
Received: from localhost ([::1]:35092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUWM0-000225-OF
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 10:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kUWGS-0004Et-BR
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 10:35:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kUWGQ-00068m-NW
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 10:35:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603118154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TXI558J4rLUqQxkXelliUIL89WzT8bCnx4ndxcOeHXE=;
 b=X/b/RqZ06MxSjc7Ofp1POc9NZ+LvNrd7C3xilvfyRb5y+o9uucinQUjzRQIi8bV5yDoltG
 uRQr9m/gps09Gw65oNqAT7AWuGZxTwHffusajmK0Q8b9UpS3CmNf7NAxfSIWYiPkeZoPTa
 Scv6Bdl6vA7Hm2oq2mP0r7cUdDVY2SI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-sDj6o6YfPSmnJoHqlY7rNw-1; Mon, 19 Oct 2020 10:35:50 -0400
X-MC-Unique: sDj6o6YfPSmnJoHqlY7rNw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2BF51054F8E;
 Mon, 19 Oct 2020 14:35:49 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-2.ams2.redhat.com
 [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2298B5B4AD;
 Mon, 19 Oct 2020 14:35:47 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] scripts: fix error from checkpatch.pl when no commits are
 found
Date: Mon, 19 Oct 2020 15:35:37 +0100
Message-Id: <20201019143537.283094-3-berrange@redhat.com>
In-Reply-To: <20201019143537.283094-1-berrange@redhat.com>
References: <20201019143537.283094-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 01:44:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The error message was supposed to mention the input revision list start
point, not the branch flag.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 6ed34970f9..88c858f67c 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -392,7 +392,7 @@ if ($chk_branch) {
 
 	close $HASH;
 
-	die "$P: no revisions returned for revlist '$chk_branch'\n"
+	die "$P: no revisions returned for revlist '$ARGV[0]'\n"
 	    unless @patches;
 
 	my $i = 1;
-- 
2.26.2


