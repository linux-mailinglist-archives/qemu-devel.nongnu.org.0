Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D913BE331
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 08:34:15 +0200 (CEST)
Received: from localhost ([::1]:38886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m118P-000199-7S
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 02:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1m117K-0000TI-B9
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 02:33:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1m117H-00041H-3y
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 02:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625639580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PgAeWqD5oGl5xYZMSqvjzEaitI1oktcR6pei9lNL/JA=;
 b=JxAWCl28aF0S0QMTwm+n/nb170vD8sKoA03nrMKyCg6wN5XdDOEbkL527woJkVnauKMKrk
 PwsMCsHIT/Ru736KbnBYPrZvOaGuW3OX3gYaZ1jSlyusJdsJvFu6cIxviRWFMDak6K6k0h
 pwbfEEPD9n3QFvZdnyLGts7wwps34B4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-aYtIyzGwO26K8WH8aMT9Mw-1; Wed, 07 Jul 2021 02:31:40 -0400
X-MC-Unique: aYtIyzGwO26K8WH8aMT9Mw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA3261019982
 for <qemu-devel@nongnu.org>; Wed,  7 Jul 2021 06:31:39 +0000 (UTC)
Received: from wi2021.rezanina.moe.rezanina.moe (unknown [10.40.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C61E510016F4;
 Wed,  7 Jul 2021 06:31:38 +0000 (UTC)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Fix libdaxctl option
Date: Wed,  7 Jul 2021 02:31:24 -0400
Message-Id: <20210707063124.81954-1-mrezanin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: pbonzini@redhat.com, Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For some reason, libdaxctl option setting was set to work in an opposite
way (--enable-libdaxctl disabled it and vice versa). Fixing this so
configuration works properly.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 650d9c0735..4f51528a77 100755
--- a/configure
+++ b/configure
@@ -1531,9 +1531,9 @@ for opt do
   ;;
   --disable-keyring) secret_keyring="no"
   ;;
-  --enable-libdaxctl) libdaxctl=disabled
+  --enable-libdaxctl) libdaxctl="enabled"
   ;;
-  --disable-libdaxctl) libdaxctl=enabled
+  --disable-libdaxctl) libdaxctl="disabled"
   ;;
   --enable-fuse) fuse="enabled"
   ;;
-- 
2.27.0


