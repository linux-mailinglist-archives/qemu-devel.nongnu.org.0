Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E07342AF539
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:41:56 +0100 (CET)
Received: from localhost ([::1]:36602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcsFv-0005wQ-Vq
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kcsDa-0003M0-UE
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:39:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kcsDY-0002Vp-9h
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:39:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605109167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JAxuVKqrZX5JiHWe5B/JojeQJT6HBgCqGYSZJxisGBQ=;
 b=iPmgrWVU4LW8Ei7X+hmwyGV1G1E4uPZD0PEadzdXAqkZsSMLvU/nAw/w+5TWhXNxsttAgF
 x1mqB62cQOF6iloSF80jVl+KkNdyzpEjLdi42tdl/V+SU+moL2fIulgTXf5d2LEeb93SDa
 sSXbpQmwTWj4tKe4HaUISPwIcOcRY7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-KZd15F-lMCa-nA6vCn39kg-1; Wed, 11 Nov 2020 10:39:24 -0500
X-MC-Unique: KZd15F-lMCa-nA6vCn39kg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABF778B0FEC;
 Wed, 11 Nov 2020 15:39:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 710865B4CD;
 Wed, 11 Nov 2020 15:39:18 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] file-posix: allow -EBUSY errors during write zeros on raw
 block devices
Date: Wed, 11 Nov 2020 17:39:12 +0200
Message-Id: <20201111153913.41840-2-mlevitsk@redhat.com>
In-Reply-To: <20201111153913.41840-1-mlevitsk@redhat.com>
References: <20201111153913.41840-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Jan Kara <jack@suse.cz>,
 qemu-block@nongnu.org, "Darrick J . Wong" <darrick.wong@oracle.com>,
 Peter Lieven <pl@kamp.de>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Linux, fallocate(fd, FALLOC_FL_PUNCH_HOLE) when it is used on a block device,
without O_DIRECT can return -EBUSY if it races with another write to the same page.

Since this is rare and discard is not a critical operation, ignore this error

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 block/file-posix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index c63926d592..d5fd1dbcd2 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1698,6 +1698,7 @@ static int handle_aiocb_write_zeroes_unmap(void *opaque)
     switch (ret) {
     case -ENOTSUP:
     case -EINVAL:
+    case -EBUSY:
         break;
     default:
         return ret;
-- 
2.26.2


