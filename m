Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D331866DF73
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 14:53:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHmNr-0000wJ-Pk; Tue, 17 Jan 2023 08:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pHmNo-0000tz-Kk
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:52:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pHmNm-0005ve-1k
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673963529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9b/HZg6T/t0VaQsEaCQvjm94fUbvfIv/bnKtuTyl96U=;
 b=GcvuYcZOBFZgLdJKRHCb6wkB1+c38aB/Af5W0nMh34kWN9kI6lmSfNylw0v7PsgJN7u0MR
 /xXVOJmHgeImtdh1b1ye0DUtl1ULTpFAErGaMZ+kct+b+Czp5B6vqJXJFavNrtTxs7X+rW
 B0QQdky9EuPsxqvEAdWDoKfwXBUm40Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-cgaCN0pAO1yobr8_QLBqWg-1; Tue, 17 Jan 2023 08:52:07 -0500
X-MC-Unique: cgaCN0pAO1yobr8_QLBqWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F34D888434F;
 Tue, 17 Jan 2023 13:52:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE01B1121318;
 Tue, 17 Jan 2023 13:52:06 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 3/3] configure: Enable -Wthread-safety if present
Date: Tue, 17 Jan 2023 08:52:03 -0500
Message-Id: <20230117135203.3049709-4-eesposit@redhat.com>
In-Reply-To: <20230117135203.3049709-1-eesposit@redhat.com>
References: <20230117135203.3049709-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Kevin Wolf <kwolf@redhat.com>

This enables clang's thread safety analysis (TSA), which we'll use to
statically check the block graph locking.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20221207131838.239125-9-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 2281892657..14668e6269 100755
--- a/configure
+++ b/configure
@@ -1183,6 +1183,7 @@ add_to warn_flags -Wnested-externs
 add_to warn_flags -Wendif-labels
 add_to warn_flags -Wexpansion-to-defined
 add_to warn_flags -Wimplicit-fallthrough=2
+add_to warn_flags -Wthread-safety
 
 nowarn_flags=
 add_to nowarn_flags -Wno-initializer-overrides
-- 
2.39.0


