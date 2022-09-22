Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 007D35E5EC5
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:41:17 +0200 (CEST)
Received: from localhost ([::1]:42102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obIho-0005Y7-1b
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHuE-0004XP-9P
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:50:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHuC-0003Fy-P8
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:50:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJE4UpzADeZRyzZ3OwaQDec/7oqi/5qTZW8F7H71V7Q=;
 b=QTuZS+73YsaRwNEvYgB6l+QbhsIo5JqlSkKIgjcvK+tkg+siw6/WC8i7otmiBdm7MNsJmJ
 d7HePXMYkUi+g/HRWAM4GZ5+3soR5x3Auizp30KuNw4h5CgjkeNhsZw5ArV+nlTs30z3Sb
 cH1dvyX266fBFM9iH2Y1dqMJLattGcM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-192-rz3N35uFOiu25dNvtR39wQ-1; Thu, 22 Sep 2022 04:49:58 -0400
X-MC-Unique: rz3N35uFOiu25dNvtR39wQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 m13-20020a056402510d00b004519332f0b1so6150398edd.7
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ZJE4UpzADeZRyzZ3OwaQDec/7oqi/5qTZW8F7H71V7Q=;
 b=yaaQQKnnQJILGcPpKkFztXpqhiqH81pPcnn+xHiYATBnv0p3pX+lmZS1QZeFwwvvfM
 1+rWFpKl+Eos8ObpnOP4cIFFXRFl/rD//6ICIjMsBha96wQnwuaAkZklg5Ti8ah8smkL
 CPSUVU5IYF0rqE7uB9lPiAI2Nq1o3QlVznFbsmjtds9Xcie5XWOlWFerh1V5l9+lxsNO
 +7QUzaVVdKoVIAPRELkAHCZovqZ6oWBayJFDyB8E1fLxZ3prXXJcv3BpuOY8BMWGrSd7
 zuQWj/pALxeoedw0eoWF8VbmPU2eiP4tKwR1FVJtvL0fVl+G+2ZAAp84HQbsSVUpISd4
 +9wQ==
X-Gm-Message-State: ACrzQf2OTD93JJqHFSbfZSMkfEjTgq9agqcGXO4GbHAFPxvnGzWBHXoZ
 Y5kFJLUKpy9gAEImM+GjAwBFGDkoJ3W0iFep8axwVEKS2My+XKeBaymaKMC+ayZcfUZgy0MXv/d
 3rW+eH+yzi/mAx4ejOcebgD+WlIEEIQyDlOBSp5rogCjcguN6o0PCqfj5Vc/HdWtKmyE=
X-Received: by 2002:a05:6402:4441:b0:454:8a74:5459 with SMTP id
 o1-20020a056402444100b004548a745459mr2099167edb.155.1663836597541; 
 Thu, 22 Sep 2022 01:49:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7jcRq8G06sI8m5ZrKWxsq22GSCjWdkzUXi9raRETmkfnQ/YpFHb5HZ+s9T1QxoUWX/j1m6vA==
X-Received: by 2002:a05:6402:4441:b0:454:8a74:5459 with SMTP id
 o1-20020a056402444100b004548a745459mr2099147edb.155.1663836597268; 
 Thu, 22 Sep 2022 01:49:57 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a170906780400b00777557d1ea2sm2339381ejm.47.2022.09.22.01.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 21/26] job: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:19 +0200
Message-Id: <20220922084924.201610-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/job.h | 2 +-
 job.c              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index c105b31076..397ac39608 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -436,7 +436,7 @@ void coroutine_fn job_pause_point(Job *job);
  *
  * Yield the job coroutine.
  */
-void job_yield(Job *job);
+void coroutine_fn job_yield(Job *job);
 
 /**
  * @job: The job that calls the function.
diff --git a/job.c b/job.c
index 075c6f3a20..20f0d8b2cd 100644
--- a/job.c
+++ b/job.c
@@ -525,7 +525,7 @@ void coroutine_fn job_pause_point(Job *job)
     }
 }
 
-void job_yield(Job *job)
+void coroutine_fn job_yield(Job *job)
 {
     assert(job->busy);
 
-- 
2.37.3


