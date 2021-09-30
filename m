Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A377241DE16
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:54:08 +0200 (CEST)
Received: from localhost ([::1]:37618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVyNr-0000DU-2u
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy1X-0004vO-7P
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy1U-0002Re-Kr
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633015859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CODMsCUzNQMLC3NXwVMjT48tgDBPtbHcvq37MbxCdD4=;
 b=VVjWQfe14yyuKrqG9ihxj/an4Kpn2xmwTdQWB1MTGpD4GTmjrENmnLjmhj3s93f6h1a+Cp
 vYGKcIXWZhuBdDj6daVkmgLutpmcaIr04zsKljb8td9r91NWWgPrFI0CtdFFGdGPT+udXc
 e8Fs/pzM0ZDNUCBgjzYwGCN9bWP+Gmo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-8rMh0fOEONi2YbPwWW1o2A-1; Thu, 30 Sep 2021 11:30:58 -0400
X-MC-Unique: 8rMh0fOEONi2YbPwWW1o2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 247F3DF8AA;
 Thu, 30 Sep 2021 15:30:57 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 045545C1D0;
 Thu, 30 Sep 2021 15:30:57 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 2716422828C; Thu, 30 Sep 2021 11:30:48 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com,
	stefanha@redhat.com
Subject: [PATCH 13/13] virtiofsd, seccomp: Add clock_nanosleep() to allow list
Date: Thu, 30 Sep 2021 11:30:37 -0400
Message-Id: <20210930153037.1194279-14-vgoyal@redhat.com>
In-Reply-To: <20210930153037.1194279-1-vgoyal@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: jaggel@bu.edu, iangelak@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com,
 miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

g_usleep() calls nanosleep() and that now seems to call clock_nanosleep()
syscall. Now these patches are making use of g_usleep(). So add
clock_nanosleep() to list of allowed syscalls.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/passthrough_seccomp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
index cd24b40b78..03080806c0 100644
--- a/tools/virtiofsd/passthrough_seccomp.c
+++ b/tools/virtiofsd/passthrough_seccomp.c
@@ -117,6 +117,7 @@ static const int syscall_allowlist[] = {
     SCMP_SYS(writev),
     SCMP_SYS(umask),
     SCMP_SYS(nanosleep),
+    SCMP_SYS(clock_nanosleep),
 };
 
 /* Syscalls used when --syslog is enabled */
-- 
2.31.1


