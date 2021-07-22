Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91433D235B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 14:32:33 +0200 (CEST)
Received: from localhost ([::1]:57770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6XsO-0004H3-V8
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 08:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m6Xmi-0007zi-09
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:26:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m6Xmc-0007NC-Pt
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626956793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xP/rZ9vyNcIc8X002IuHwd69RBABuQwbf2IGG0ktDAc=;
 b=d0lwy7mbiIrALDVSoGtwNuWQQJMSzXaa5YTsrHZrA+fmDybAIn+QXuAjR/3W2JyLajsUpL
 mpYC0vmDwvcL+9Btu75mszr91ow+mfQjxEYw1WhQJQA5kKyU9sKDnk9h93kqCWjIEZMLPx
 JBDKh4B1Fh+xnLlO08WKii4RGlHqKNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-i6wasZxjMKqNg3ssaaWK9Q-1; Thu, 22 Jul 2021 08:26:32 -0400
X-MC-Unique: i6wasZxjMKqNg3ssaaWK9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A1358B060E;
 Thu, 22 Jul 2021 12:26:31 +0000 (UTC)
Received: from localhost (ovpn-112-220.ams2.redhat.com [10.36.112.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F36925C1D1;
 Thu, 22 Jul 2021 12:26:30 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-6.1? 1/6] mirror: Keep s->synced on error
Date: Thu, 22 Jul 2021 14:26:22 +0200
Message-Id: <20210722122627.29605-2-mreitz@redhat.com>
In-Reply-To: <20210722122627.29605-1-mreitz@redhat.com>
References: <20210722122627.29605-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.472, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An error does not take us out of the READY phase, which is what
s->synced signifies.  It does of course mean that source and target are
no longer in sync, but that is what s->actively_sync is for -- s->synced
never meant that source and target are in sync, only that they were at
some point (and at that point we transitioned into the READY phase).

The tangible problem is that we transition to READY once we are in sync
and s->synced is false.  By resetting s->synced here, we will transition
from READY to READY once the error is resolved (if the job keeps
running), and that transition is not allowed.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/mirror.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/mirror.c b/block/mirror.c
index 98fc66eabf..d73b704473 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -121,7 +121,6 @@ typedef enum MirrorMethod {
 static BlockErrorAction mirror_error_action(MirrorBlockJob *s, bool read,
                                             int error)
 {
-    s->synced = false;
     s->actively_synced = false;
     if (read) {
         return block_job_error_action(&s->common, s->on_source_error,
-- 
2.31.1


