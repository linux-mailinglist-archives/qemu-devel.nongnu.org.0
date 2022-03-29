Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C4A4EAFC4
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:02:49 +0200 (CEST)
Received: from localhost ([::1]:45388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZDMu-00009S-Mu
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:02:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZDJF-0005CA-8J
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:59:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZDJB-00038O-Qs
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:59:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648565936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bjJeJVfcaYN3xtDaZf+ZkX551XgX9sHLclZROOlGqMY=;
 b=QiTnQyQP5+Ctl6Iq9LI+ZEszElD+ZGWWTXBUhMnPxabIyqIhxlVop2MBfmQnpxC04gUsSx
 FE+rDtROOW+k7ZnoCZj5d1UI5tnI08Bb94sh4AWghg+sThCjRzOf7YaxV4KGRMLxRef4Hn
 FTSvglX/OICvfWVpwqKrxybuZLlQij0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-qGQjiLijMpW9z5Sy4NQSUQ-1; Tue, 29 Mar 2022 10:58:54 -0400
X-MC-Unique: qGQjiLijMpW9z5Sy4NQSUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 337CB811E9B;
 Tue, 29 Mar 2022 14:58:54 +0000 (UTC)
Received: from localhost (unknown [10.39.194.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E059F2166B3F;
 Tue, 29 Mar 2022 14:58:53 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 2/4] main-loop: Disable GLOBAL_STATE_CODE() assertions
Date: Tue, 29 Mar 2022 16:58:47 +0200
Message-Id: <20220329145849.121051-3-hreitz@redhat.com>
In-Reply-To: <20220329145849.121051-1-hreitz@redhat.com>
References: <20220329145849.121051-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These assertions are very useful for developers to find bugs, and so
they have indeed pointed us towards bugs already.  For users, it is not
so useful to find these bugs.  We should probably not enable them in
releases until we are sufficiently certain that they will not fire
during normal operation, unless something is going seriously wrong.

For example, we have received a bug report that you cannot add an NBD
server on a BDS in an I/O thread with `-incoming defer`.  I am sure this
is a real bug that needs investigation, but we do not really have that
time right now, so close to release, and so I would rather disable the
assertions to get time to investigate such reports.

(I am just putting the link as "buglink" below, not "closes", because
disabling the assertion will not fix the likely underlying bug.)

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/945
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220329093545.52114-1-hreitz@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/main-loop.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index 89bd9edefb..d3750c8e76 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -284,7 +284,8 @@ bool qemu_in_main_thread(void);
 #else
 #define GLOBAL_STATE_CODE()                                         \
     do {                                                            \
-        assert(qemu_in_main_thread());                              \
+        /* FIXME: Re-enable after 7.0 release */                    \
+        /* assert(qemu_in_main_thread()); */                        \
     } while (0)
 #endif /* CONFIG_COCOA */
 
-- 
2.35.1


