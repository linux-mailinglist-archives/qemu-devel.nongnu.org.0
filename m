Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7253C6D9B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 11:36:36 +0200 (CEST)
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3EqB-00039F-J4
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 05:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3Elv-0002BD-MV
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:32:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3Elu-0001q3-99
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626168729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FGkt2CEPta8MslrRwnqaK0IU8XII98o3qUzy/H1TYDw=;
 b=TFGjHUDQb7pd3n9iZv0ih5rl6R5BnCHPJI1dY5HyKzmmKHNRiItRiVu5ycqvwlttzJAShJ
 1iI25RTz+UfsyE4xqaJPZ6gaRHkd5eCtOD1sOXBcQBazeyTWgUFJmmaNu+lsGKiPTdGAwv
 NbrcLKKHsvygbmvlIMZvguc5znWCkPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-muTOt_vdNt6MzweeEMoaaw-1; Tue, 13 Jul 2021 05:32:08 -0400
X-MC-Unique: muTOt_vdNt6MzweeEMoaaw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCF81100CCC0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:32:07 +0000 (UTC)
Received: from thuth.com (ovpn-112-56.ams2.redhat.com [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADE1F5D9CA;
 Tue, 13 Jul 2021 09:32:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 4/4] configure: Let --without-default-features disable
 vhost-kernel and vhost-vdpa
Date: Tue, 13 Jul 2021 11:31:55 +0200
Message-Id: <20210713093155.677589-5-thuth@redhat.com>
In-Reply-To: <20210713093155.677589-1-thuth@redhat.com>
References: <20210713093155.677589-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vhost_kernel and vhost_vdpa variables should be pre-initialized with
the $default_feature setting so that these features get disabled when
the user runs the configure scripts with --without-default-features.

Reported-by: Cole Robinson <crobinso@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure b/configure
index 6c7336b763..89cc9b24eb 100755
--- a/configure
+++ b/configure
@@ -321,6 +321,7 @@ attr="auto"
 xfs="$default_feature"
 tcg="enabled"
 membarrier="$default_feature"
+vhost_kernel="$default_feature"
 vhost_net="$default_feature"
 vhost_crypto="$default_feature"
 vhost_scsi="$default_feature"
@@ -328,6 +329,7 @@ vhost_vsock="$default_feature"
 vhost_user="no"
 vhost_user_blk_server="auto"
 vhost_user_fs="$default_feature"
+vhost_vdpa="$default_feature"
 bpf="auto"
 kvm="auto"
 hax="auto"
-- 
2.27.0


