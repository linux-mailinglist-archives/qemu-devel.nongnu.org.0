Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F009F63BFAD
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 13:05:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozzLY-000805-Fk; Tue, 29 Nov 2022 07:04:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozzLM-0007x3-3w
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 07:04:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozzLK-0002F3-Ez
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 07:04:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669723443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VNkFTzNKzvDncPIWn1Fo3A6L6ercBOmGRjWto7GcZ5M=;
 b=TQtw/La//tH85+ERAJDh2y2JgdU6hRJxuLBSTukaktgbw8gBINO+5KHO32GQarCqIwEM4Y
 L/jWjUxnrPBrn8dGzpBIcfvhM+AcDhh1LVmgSy7hCVN8YRFEmEdOjQS/lsTILo2f3K/ZtD
 YpeNZ/FvBMFinkqXmo1F7DHyeV9Hl70=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-CZBLSAazOOOmEaiwAwLlMA-1; Tue, 29 Nov 2022 07:04:02 -0500
X-MC-Unique: CZBLSAazOOOmEaiwAwLlMA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADAAE85A588
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 12:04:01 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F75E2166B2D;
 Tue, 29 Nov 2022 12:04:00 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v2 0/2] Put Canary End of List in VMSTATE
Date: Tue, 29 Nov 2022 13:03:56 +0100
Message-Id: <20221129120358.16452-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Hi

Changes from yesterday submission:
- change exit by g_assert_not_reached()

[Previous submission]
This are a patch series from David from January.
The changes that I did:
- rebases
- change assert() in vmstate_check() to and if and printf.

Please, Review.

Dr. David Alan Gilbert (2):
  migration: Add canary to VMSTATE_END_OF_LIST
  migration: Perform vmsd structure check during tests

 include/migration/vmstate.h |  7 +++++-
 migration/savevm.c          | 43 +++++++++++++++++++++++++++++++++++++
 migration/vmstate.c         |  2 ++
 3 files changed, 51 insertions(+), 1 deletion(-)

-- 
2.38.1


