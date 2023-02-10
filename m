Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D1C691890
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 07:37:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQN1n-00008c-Ji; Fri, 10 Feb 2023 01:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pQN1f-00007n-KN
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:36:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pQN1e-0008PX-7S
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:36:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676011009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xOojtREP1MzNlGpZt0CnT4fjGRQk/mcDIz9qijD/FCs=;
 b=cQM7yXu0iX+mHzGVsrtlm1HqacPVTTmp7pIhZukpssZZfpCHxb/Fdw5VpgDBwvw9qYc5zM
 IxtoCmdE/e7jrO1Wawc0HsPZQy6Wo1K4iCIYFYqDG7zBEpZKqfjJb2I+OKzP08P1LExSrM
 Mp6wJa7D+PqIVAm61lU5Uc5ES9JBGYE=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-tySgreBjPt6BgA5lS87LfA-1; Fri, 10 Feb 2023 01:36:48 -0500
X-MC-Unique: tySgreBjPt6BgA5lS87LfA-1
Received: by mail-oi1-f197.google.com with SMTP id
 q14-20020a056808200e00b0037ab5869804so1266667oiw.22
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 22:36:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xOojtREP1MzNlGpZt0CnT4fjGRQk/mcDIz9qijD/FCs=;
 b=1W12gm/9xZRcdMXEfVZ/tnLaqu3rgqE0MFH1UUa9yN8GxitEvSy/h0VYzPEqAWEGBN
 46QdUaxFBX7ru+8CDFVtHs9FeJZrJYtnjnzge+7A7s3uejdUj9ZS2jw9Xw5IQlf1gEEE
 NLyWr7gdUnLlTixqM57nbPkOP2kQrXQ6ramxtBd6HOaqVxzP9voP3eo/DuhiG/EuJJ4t
 dSsxB+gqYwSjyllANm95c37eUzEndDi4HNtsf93oxqTSfQbCiOrJr15kvKJBzsHLv+xG
 wpgN8VzVxT0n+9CGwYllMCpbVUo8FPegcQo85itAF6M4JAeSTM+0vNVHVD8k/iHjUuoS
 MuGw==
X-Gm-Message-State: AO0yUKUNnCDgGKoyZS8Ab/JyX0/T+laP0dGVJPxoZsKSIW61KkjDmE3h
 LWNzfincilMeKBAvdVot5YJD4oQ2Kb6ium9OfyTxl4JeZusxXPmxTDnyugU///BQiaLblmBdvJ1
 jSX02LOMOJRRTS+s=
X-Received: by 2002:a9d:6642:0:b0:68b:d9d3:d8f with SMTP id
 q2-20020a9d6642000000b0068bd9d30d8fmr7983353otm.3.1676011007192; 
 Thu, 09 Feb 2023 22:36:47 -0800 (PST)
X-Google-Smtp-Source: AK7set8HDSL+yFvnSNkQERxTRJPMUeVvsHjdOXcwS7vc4UUbvwtIqwP6YQ14UA08ks3+KKde8fEj2g==
X-Received: by 2002:a9d:6642:0:b0:68b:d9d3:d8f with SMTP id
 q2-20020a9d6642000000b0068bd9d30d8fmr7983348otm.3.1676011006951; 
 Thu, 09 Feb 2023 22:36:46 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:1b3:a800:9aa9:fdcb:7dec:9680:8417])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a05683018e800b00670679748f9sm1705285otf.49.2023.02.09.22.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 22:36:46 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v1 3/4] migration/multifd: Join all multifd threads in order
 to avoid leaks
Date: Fri, 10 Feb 2023 03:36:30 -0300
Message-Id: <20230210063630.532185-3-leobras@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210063630.532185-1-leobras@redhat.com>
References: <20230210063630.532185-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Current approach will only join threads that are still running.

For the threads not joined, resources or private memory are always kept in
the process space and never reclaimed before process end, and this risks
serious memory leaks.

This should usually not represent a big problem, since multifd migration
is usually just ran at most a few times, and after it succeeds there is
not much to be done before exiting the process.

Yet still, it should not hurt performance to join all of them.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/multifd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 1a445b36f1..7e37a459ed 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1039,8 +1039,9 @@ void multifd_load_cleanup(void)
              * however try to wakeup it without harm in cleanup phase.
              */
             qemu_sem_post(&p->sem_sync);
-            qemu_thread_join(&p->thread);
         }
+
+        qemu_thread_join(&p->thread);
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
-- 
2.39.1


