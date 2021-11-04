Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7234C445660
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 16:33:41 +0100 (CET)
Received: from localhost ([::1]:46620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miekG-0003HQ-1P
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 11:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mieiE-000136-L7
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 11:31:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mieiB-0001Z6-Rk
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 11:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636039888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VBrl6d2NM+NpERRk2XW0BzICzEi2VcwKo20bq5urDyc=;
 b=XN5v6DFAIK/b0QMyqzYfUepBA8MspNptd9o3OtqNsIwh3vtW4PQlPJP/gSJTJfqGxiHD88
 pkUkuJu3wcl/yRFfpcHWXJUuKXs/RogEzmpJfjXh2P/xmdgtfg85uwUYd4jvlNxR/z5T0x
 NPrQ1BwTOi8GXhH2KFRBt9yfNvCpcpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-ocn3JEK-M2KgRxi7KOfb1Q-1; Thu, 04 Nov 2021 11:31:25 -0400
X-MC-Unique: ocn3JEK-M2KgRxi7KOfb1Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9036D19057A0;
 Thu,  4 Nov 2021 15:31:24 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E32E719EF9;
 Thu,  4 Nov 2021 15:31:23 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 0/3] job: split job API in driver and monitor
Date: Thu,  4 Nov 2021 11:31:18 -0400
Message-Id: <20211104153121.1362449-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

RFC: alternative names for the headers: job-locked (was job-monitor)
and job-self-locking (was job-driver). I am open to suggestion for
alternative names.

This serie is based on my previous series "job: replace AioContext
lock with job_mutex".

Based-on: <20211104145334.1346363-1-eesposit@redhat.com>

Emanuele Giuseppe Esposito (3):
  jobs: add job-common.h
  jobs: add job-monitor.h
  jobs: add job-driver.h

 include/qemu/job-common.h  | 336 +++++++++++++++++++
 include/qemu/job-driver.h  | 173 ++++++++++
 include/qemu/job-monitor.h | 282 ++++++++++++++++
 include/qemu/job.h         | 662 +------------------------------------
 job.c                      |   4 +-
 5 files changed, 797 insertions(+), 660 deletions(-)
 create mode 100644 include/qemu/job-common.h
 create mode 100644 include/qemu/job-driver.h
 create mode 100644 include/qemu/job-monitor.h

-- 
2.27.0


