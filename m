Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D76973B0852
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:11:15 +0200 (CEST)
Received: from localhost ([::1]:48808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvi3W-0004KA-Pg
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lvi1V-000256-UL
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:09:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lvi1S-0005sb-KK
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:09:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624374545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fz2lty2f82fOCXnvCMnt30KfeGYKl86ayn41eviG2iA=;
 b=erPVQoXiIFrz3iP3QnDNWtc5lFuHfZGWHmnQlHW7p8ybir1TvS3YJEOpF2L9+NZqUM3ONl
 yjwj1piOYQ9svaHzRsqCfS57rlyJFz8jwtQqj9sq3ZkzBZ8t+OmmbCOvpIKfJyK5NPOLi7
 AXYfuTyu79BoSFcbiDz/lzgxG/qGfF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-SD47C_kcO5esMzqWW_AiOg-1; Tue, 22 Jun 2021 11:09:04 -0400
X-MC-Unique: SD47C_kcO5esMzqWW_AiOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59F28101C8AE;
 Tue, 22 Jun 2021 15:09:03 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-114.rdu2.redhat.com [10.10.115.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFED55D9CA;
 Tue, 22 Jun 2021 15:08:59 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 734F5225FD0; Tue, 22 Jun 2021 11:08:59 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v7 4/7] virtiofsd: Add umask to seccom allow list
Date: Tue, 22 Jun 2021 11:08:49 -0400
Message-Id: <20210622150852.1507204-5-vgoyal@redhat.com>
In-Reply-To: <20210622150852.1507204-1-vgoyal@redhat.com>
References: <20210622150852.1507204-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: miklos@szeredi.hu, dgilbert@redhat.com, vgoyal@redhat.com,
 lhenriques@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patches in this series  are going to make use of "umask" syscall.
So allow it.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tools/virtiofsd/passthrough_seccomp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
index 62441cfcdb..f49ed94b5e 100644
--- a/tools/virtiofsd/passthrough_seccomp.c
+++ b/tools/virtiofsd/passthrough_seccomp.c
@@ -114,6 +114,7 @@ static const int syscall_allowlist[] = {
     SCMP_SYS(utimensat),
     SCMP_SYS(write),
     SCMP_SYS(writev),
+    SCMP_SYS(umask),
 };
 
 /* Syscalls used when --syslog is enabled */
-- 
2.25.4


