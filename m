Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2F94CC07E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 15:59:57 +0100 (CET)
Received: from localhost ([::1]:52154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPmvs-0000q0-Ac
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 09:59:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nPmuY-0006pm-Rh
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:58:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nPmuV-0000oT-GP
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646319509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dO0gMfxjeTL3Sta2Nlgsbbu5IFL/5+Wgr3eHljHnwFY=;
 b=ZFw6n2fML82Yra5Lnt2jQ4GvrImHqS3f6ojB1rj9E/+YXK8j9kC3B0pMz6RR8ERaxahVZk
 2XaKl6jT96PGJGwTBHF1dMLaxa02AU6rt5eZw3NF37cLSBIgFLqokit1MB+Qm7cwbAtcUT
 22obVzJnXMRSXbFQbHZX7+IjKeQWS48=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-MYgnkFSeP-CSYUWvEpJ0zQ-1; Thu, 03 Mar 2022 09:58:28 -0500
X-MC-Unique: MYgnkFSeP-CSYUWvEpJ0zQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 x15-20020a5d6b4f000000b001ee6c0aa287so2131843wrw.9
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 06:58:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dO0gMfxjeTL3Sta2Nlgsbbu5IFL/5+Wgr3eHljHnwFY=;
 b=I/F7nO8V5myafWTQcczz7MyqEsR0CTRkzOnsvEgO9ch7Ka5GE4u+q4QiFAZ22KOIqc
 i7RFThtskSw7bOL+YwYocG0vFsAP08vSghD0Sg0tKreTtDHlmN7G8nONCHvR3O2LEfEv
 rwnz4VFG0dc2B3CQvuiee/3b285CcxYK9DHNUjJeXieQFIrVkMyUXkmke1of1JmVQ7+J
 feVFpiv5TFRW10kHuzpLkTO+bDGIuGGKC2zelD5L9WvEyfZwyi8aMYZj5MGuM/UeTrsU
 S7UB0adqLIm1PAK1WWqUdQuOjPt9yX+3EWdlFdt+XhPRkfxlKmKmKQJn8FLF0C/m9y6n
 FNFw==
X-Gm-Message-State: AOAM531V4l8kiUqCfbrGxSzTl2I8b3I5Vrhq5rlO/ToVsQN0vED88sAD
 F+srBAkBaMBjwDMGzOfo2jfGoSP1uMoSpJMSuFv33lgkVC6jrOs/qcZfDoHNPPVm1t9XcsDJLvw
 epeZlFzQJo3y4Ook=
X-Received: by 2002:a05:6000:15cc:b0:1f0:21f8:c99c with SMTP id
 y12-20020a05600015cc00b001f021f8c99cmr9114741wry.339.1646319506975; 
 Thu, 03 Mar 2022 06:58:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxx+sQtucZyw+6VzvvX2TjGl3iMjd+58V7LviiNqqHBlqKXwvoWNzlKJUQIZWUdiY/uYMOS0g==
X-Received: by 2002:a05:6000:15cc:b0:1f0:21f8:c99c with SMTP id
 y12-20020a05600015cc00b001f021f8c99cmr9114718wry.339.1646319506794; 
 Thu, 03 Mar 2022 06:58:26 -0800 (PST)
Received: from vian.redhat.com ([2a0c:5a80:1b14:b500:abb:f9d1:7bc2:3db8])
 by smtp.gmail.com with ESMTPSA id
 v124-20020a1cac82000000b0037c3d08e0e7sm9139512wme.29.2022.03.03.06.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 06:58:26 -0800 (PST)
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2 1/4] util/thread-pool: Fix thread pool freeing locking
Date: Thu,  3 Mar 2022 15:58:19 +0100
Message-Id: <20220303145822.518887-2-nsaenzju@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303145822.518887-1-nsaenzju@redhat.com>
References: <20220303145822.518887-1-nsaenzju@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, eduardo@habkost.net, qemu-block@nongnu.org,
 michael.roth@amd.com, mtosatti@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, pbonzini@redhat.com,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Upon freeing a thread pool we need to get rid of any remaining worker.
This is achieved by setting the thread pool's topping flag, waking the
workers up, and waiting for them to exit one by one. The problem is that
currently all this process happens with the thread pool lock held,
effectively blocking the workers from exiting.

So let's release the thread pool lock after signaling a worker thread
that it's time to exit to give it a chance to do so.

Fixes: f7311ccc63 ("threadpool: add thread_pool_new() and thread_pool_free()")
Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
---
 util/thread-pool.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/util/thread-pool.c b/util/thread-pool.c
index d763cea505..fdb43c2d3b 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -339,7 +339,9 @@ void thread_pool_free(ThreadPool *pool)
     pool->stopping = true;
     while (pool->cur_threads > 0) {
         qemu_sem_post(&pool->sem);
+        qemu_mutex_unlock(&pool->lock);
         qemu_cond_wait(&pool->worker_stopped, &pool->lock);
+        qemu_mutex_lock(&pool->lock);
     }
 
     qemu_mutex_unlock(&pool->lock);
-- 
2.35.1


