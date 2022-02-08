Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A99B4ADEFA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:10:42 +0100 (CET)
Received: from localhost ([::1]:52604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHU0m-0001bh-BD
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:10:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHRfZ-0007Go-93
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:40:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHRfS-0000rU-8Y
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644331216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SB4sXRJqtRrDxGKjyytmRJwwWbG95UzYC5o7Eu9WoiQ=;
 b=bOkcyCKOL8DOQj8mjRqaTZH3lCm3f7ciH9wbrvHqAoSiZt0qq+33ezL5edsx313ZSwzgxy
 dUuVDcTmbWhSkjCRAu5iZPYijH6eO/Kiufeqm7Z4O6gXRNhTw9a7FUmGJalpPuvWn/t0nX
 qZtX4NUn3TxiRNP137BY9ayyavOcjbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-Zm5BNgLZN86D2p4m9B7jWQ-1; Tue, 08 Feb 2022 09:40:12 -0500
X-MC-Unique: Zm5BNgLZN86D2p4m9B7jWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94CD88145F4;
 Tue,  8 Feb 2022 14:40:11 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 328CB798CD;
 Tue,  8 Feb 2022 14:39:57 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/3] job: split job API in driver and monitor
Date: Tue,  8 Feb 2022 09:39:52 -0500
Message-Id: <20220208143955.1078618-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In this series, we split the job API in two headers:
job-driver.h and job-monitor.h.
As explained in job.c, job-monitor are the functions mainly used
by the monitor, and require consistency between the search of
a specific job (job_get) and the actual operation/action on it
(e.g. job_user_cancel). Therefore job-monitor API assume that
the job mutex lock is always held by the caller.

job-driver, on the other side, is the collection of functions
that are used by the job drivers or core block layer. These
functions are not aware of the job mutex, and delegate the
locking to the callee instead.

We also have job-common.h contains the job struct definition
and common functions that are not part of monitor or driver APIs.
job.h is left for legacy and to avoid changing all files that
include it.

This serie is based on my previous series "job: replace AioContext
lock with job_mutex".

Based-on: <20220208143513.1077229-1-eesposit@redhat.com>
---
v2:
 * rebased on new version of job_api

Emanuele Giuseppe Esposito (3):
  jobs: add job-common.h
  jobs: add job-monitor.h
  jobs: add job-driver.h

 include/qemu/job-common.h  | 357 +++++++++++++++++++
 include/qemu/job-driver.h  | 211 +++++++++++
 include/qemu/job-monitor.h | 249 +++++++++++++
 include/qemu/job.h         | 697 +------------------------------------
 job.c                      |   4 +-
 5 files changed, 823 insertions(+), 695 deletions(-)
 create mode 100644 include/qemu/job-common.h
 create mode 100644 include/qemu/job-driver.h
 create mode 100644 include/qemu/job-monitor.h

-- 
2.31.1


