Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877CE427DB3
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:37:17 +0200 (CEST)
Received: from localhost ([::1]:56226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZK1s-0006E2-Ap
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJiZ-0002BO-Eg
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:17:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJiV-0002bh-TX
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:17:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633814235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sbo+hzLBhJOG+aejtm30ivI0YqTLLu7mhy/jgt0mHn0=;
 b=bHIbmKXsjVisDFZ+08pe4LIZHTjOCPP3gC6xYlRSGj7t571LxFqgAnLeiQW/g0HtBC8E8/
 lyIqsKFHSn+bHEaB2PFIfWFkTBEYy0xhoBxKBCjrNIcG3sHI3InxhpvUKm/PIv2kcTiS4L
 rO8zcEcN/wIMnMGhW1pvFP9B0Zh5cHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-KwoVjtgHPIqfL6NFd5gHgw-1; Sat, 09 Oct 2021 17:17:14 -0400
X-MC-Unique: KwoVjtgHPIqfL6NFd5gHgw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E3A21808304
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:17:13 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71F585C1B4;
 Sat,  9 Oct 2021 21:17:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 34/37] option: add g_auto for QemuOpts
Date: Sun, 10 Oct 2021 01:08:35 +0400
Message-Id: <20211009210838.2219430-35-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Used in the next commit.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/option.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/qemu/option.h b/include/qemu/option.h
index 306bf07575..bbd86e1c4e 100644
--- a/include/qemu/option.h
+++ b/include/qemu/option.h
@@ -150,4 +150,6 @@ QDict *keyval_parse(const char *params, const char *implied_key,
                     bool *help, Error **errp);
 void keyval_merge(QDict *old, const QDict *new, Error **errp);
 
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QemuOpts, qemu_opts_del)
+
 #endif
-- 
2.33.0.721.g106298f7f9


