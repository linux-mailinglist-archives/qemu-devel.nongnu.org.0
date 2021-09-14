Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F372E40ACD5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 13:54:05 +0200 (CEST)
Received: from localhost ([::1]:45234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ70n-0007l1-1f
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 07:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mQ6yt-00056a-5M
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:52:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mQ6yq-0007JW-F0
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:52:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631620323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=loashz0+j0OcIJRCFBlcKJzh8A8l4zO8lqCJ5F9pqk4=;
 b=dnLjtx1WKsvdN5AMz6P+5lUJeYnPhviqUo94Qi5DBkscMdm6Ehfciv5ydcP/BCc+Cv/4Ul
 5DRQb1yNLsmSAH/azoGY6tpm/N0/dvULiFgTkUL6/knJiENT4mH0mlpGsNo3Ll2mATGzG6
 JO5bcRyl43ISTXOO3flxJZqJ6b2TsQM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-_oj6mBnuObeOKwg8_fs2rg-1; Tue, 14 Sep 2021 07:52:02 -0400
X-MC-Unique: _oj6mBnuObeOKwg8_fs2rg-1
Received: by mail-wm1-f70.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so544337wmj.6
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 04:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=loashz0+j0OcIJRCFBlcKJzh8A8l4zO8lqCJ5F9pqk4=;
 b=eZ6m02aBWXKnKICvNbJySEb2ZQ9Sbqf17hchBPQXU+P2IfDG+0aznagUuJxmWZ9duW
 O2/x4GrMQBB9/8ih5360EwBgV9xwFSoxeQCc6diYrlhHOUgX/XrpLxB6R6JGi/QjkByM
 GKSLwmG0NkhYNl2AtEmYEEhfzrdKLJ00NptUVuEqYbGeGXj4mIHchI0gdiOJSzzicCgS
 lagUuvR8kQ0/QpTM54mAhPxUvqijWcQzgCbJZRXoGsXbwC2vYpfEaI5UECVxd9b9ULDy
 t8KAUc/T8Xz7kDzwcME0g5kh1oytUhmo5WXf6J/hLNG3G8DYwUUrd2pZYgX8xQ53gC0o
 HDhw==
X-Gm-Message-State: AOAM531wBy7rnvhNRmQfWEHvng31ft/U+amMiHDdhHZ4a8OKgN2nKKhZ
 PTv465OOJ5Ro35bqpHiRw3fAK+gOy9VufB9OuIezxm92F/krZ8SoMEo0msRGrIPR/zFsmwlasiw
 oEp8vjSfYl4lceymsNZv5KRWanl5SDehgCK8kUEHCw2eip01uBzcIdF3YjNrcPFuNOqk=
X-Received: by 2002:adf:9f4a:: with SMTP id f10mr18349087wrg.384.1631620321492; 
 Tue, 14 Sep 2021 04:52:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzmBPLkR2hTv8AXn+fgeQRpOFBYJbAueXo2sPXQaKaxxJtzSmWijPYCoV0+SPyeJICOamPAw==
X-Received: by 2002:adf:9f4a:: with SMTP id f10mr18349067wrg.384.1631620321252; 
 Tue, 14 Sep 2021 04:52:01 -0700 (PDT)
Received: from localhost (static-109-144-85-188.ipcom.comunitel.net.
 [188.85.144.109])
 by smtp.gmail.com with ESMTPSA id a10sm10385678wrd.51.2021.09.14.04.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 04:52:00 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] multifd: Unconditionally unregister yank function
Date: Tue, 14 Sep 2021 13:51:54 +0200
Message-Id: <20210914115157.35868-3-quintela@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210914115157.35868-1-quintela@redhat.com>
References: <20210914115157.35868-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Leonardo Bras Soares
 Passos <lsoaresp@redhat.com>
Date: Wed, 4 Aug 2021 21:26:32 +0200 (5 weeks, 11 hours, 52 minutes ago)

[[PGP Signed Part:No public key for 35AB0B289C5DB258 created at 2021-08-04T21:26:32+0200 using RSA]]
Unconditionally unregister yank function in multifd_load_cleanup().
If it is not unregistered here, it will leak and cause a crash
in yank_unregister_instance(). Now if the ioc is still in use
afterwards, it will only lead to qemu not being able to recover
from a hang related to that ioc.

After checking the code, i am pretty sure that ref is always 1
when arriving here. So all this currently does is remove the
unneeded check.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 5a4f158f3c..efd424bc97 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -991,10 +991,7 @@ int multifd_load_cleanup(Error **errp)
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
 
-        if (OBJECT(p->c)->ref == 1) {
-            migration_ioc_unregister_yank(p->c);
-        }
-
+        migration_ioc_unregister_yank(p->c);
         object_unref(OBJECT(p->c));
         p->c = NULL;
         qemu_mutex_destroy(&p->mutex);
-- 
2.31.1


